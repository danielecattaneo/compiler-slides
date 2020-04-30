//LLVM-MCA-OPTIONS -timeline
#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include "benchmark.h"


#define N 5000000*8*2


int main(int argc, char *argv[])
{
  double *buffer = mallocBufferDouble(N, 0.0, 1.0);
  double accum = 0.0;
  
  timer_state_t time;
  timerStart(&time);
  
  for (int i=0; i<N; i+=8*2) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    
    // load 4 * 4 = 16 doubles in 4 vector registers
    __m256d t1 = _mm256_loadu_pd(&buffer[i]);
    __m256d t2 = _mm256_loadu_pd(&buffer[i+4]);
    __m256d t3 = _mm256_loadu_pd(&buffer[i+8]);
    __m256d t4 = _mm256_loadu_pd(&buffer[i+12]);
    
    // vertical sum of 2 pairs of vector registers
    __m256d t12 = _mm256_add_pd(t1, t2);
    __m256d t34 = _mm256_add_pd(t3, t4);
    
    // vertical sum of the remaining pair of vector registers  
    __m256d t1234 = _mm256_add_pd(t12, t34);
    
    // sum the upper half of t1234 with its lower half
    __m128d t1234h = _mm256_extractf128_pd(t1234, 1);
    __m128d th1 = _mm_add_pd(t1234h, _mm256_castpd256_pd128(t1234));
    
    // sum the two elements of the th1 vector
    __m128d th2 = _mm_hadd_pd(th1, th1);
    
    // accumulate
    accum += _mm_cvtsd_f64(th2);
    
    __asm volatile("# LLVM-MCA-END");
  }
  
  timerStopAndPrint(&time, "+ accumulator");
  printf("result = %lf\n", accum); // approx 40000000
  
  free(buffer);
  return 0;
}


