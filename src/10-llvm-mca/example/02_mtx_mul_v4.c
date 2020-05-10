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
      __m256d bcast1 = _mm256_set1_pd(mtx1[0+srow*4]);
      __m256d bcast2 = _mm256_set1_pd(mtx1[1+srow*4]);
      __m256d bcast3 = _mm256_set1_pd(mtx1[2+srow*4]);
      __m256d bcast4 = _mm256_set1_pd(mtx1[3+srow*4]);
      
      __m256d prods1 = _mm256_mul_pd(bcast1, mtx2_rows[0]);
      __m256d prods2 = _mm256_mul_pd(bcast2, mtx2_rows[1]);
      __m256d prods3 = _mm256_mul_pd(bcast3, mtx2_rows[2]);
      __m256d prods4 = _mm256_mul_pd(bcast4, mtx2_rows[3]);
      
      __m256d cell_accum = 
        _mm256_add_pd(
          _mm256_add_pd(prods1, prods2),
          _mm256_add_pd(prods4, prods4));
      
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
