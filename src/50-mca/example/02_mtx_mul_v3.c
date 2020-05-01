//LLVM-MCA-OPTIONS -timeline -all-stats -bottleneck-analysis
#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "benchmark.h"


#define N_MTX 10000000
#define SIZE_MTX (4*4)


int main(int argc, char *argv[])
{
  double *buffer = mallocBufferDouble(N_MTX*SIZE_MTX*2, 0.0, 1.0);
  double *results = malloc(sizeof(double)*N_MTX*SIZE_MTX);
  
  benchmark_state_t bench;
  BENCHMARK_BEGIN(bench, "+ accumulator", 100, 2);
  
  memset(results, 0, sizeof(double)*N_MTX*SIZE_MTX);
  
  BENCHMARK_TIMER_START(bench);
  
  for (int i=0; i<N_MTX; i++) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    
    double *mtx1 = &buffer[(i*2)*SIZE_MTX];
    double *mtx2 = &buffer[(i*2+1)*SIZE_MTX];
    double *mtxres = &buffer[i*SIZE_MTX];
    
    __m256d mtx2_rows[4];
    for (int j=0; j<4; j++) {
      mtx2_rows[j] = _mm256_loadu_pd(&mtx2[j*4]);
    }
    
    for (int srow = 0; srow < 4; srow++) {
      __m256d cell_accum = _mm256_set1_pd(0.0);
      for (int scol = 0; scol < 4; scol++) {
        __m256d bcast = _mm256_set1_pd(mtx1[scol+srow*4]);
        __m256d prods = _mm256_mul_pd(bcast, mtx2_rows[scol]);
        cell_accum = _mm256_add_pd(cell_accum, prods);
      }
      _mm256_store_pd(&mtxres[i*SIZE_MTX+srow*4], cell_accum);
    }
    
    __asm volatile("# LLVM-MCA-END");
  }
  
  BENCHMARK_TIMER_STOP(bench);
  
  for (int i=0; i<N_MTX*SIZE_MTX; i++)
    forceUse(results+i);
  BENCHMARK_END(bench);
  
  free(buffer);
  free(results);
  return 0;
}
