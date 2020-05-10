//LLVM-MCA-OPTIONS -timeline -all-stats -bottleneck-analysis
#include <stdio.h>
#include <stdlib.h>
#include "benchmark.h"


#define N 5000000*8*2


int main(int argc, char *argv[])
{
  double *buffer = mallocBufferDouble(N, 0.0, 1.0);
  
  benchmark_state_t bench;
  BENCHMARK_BEGIN(bench, "+ accumulator", 100, 2);
  
  double accum = 0.0;
  
  BENCHMARK_TIMER_START(bench);
  
  for (int i=0; i<N; i+=8) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    double t1 = buffer[0] + buffer[0+1];
    double t2 = buffer[0+2] + buffer[0+3];
    double t3 = buffer[0+4] + buffer[0+5];
    double t4 = buffer[0+6] + buffer[0+7];
    double t12 = t1 + t2;
    double t34 = t3 + t4;
    accum += t12 + t34;
    __asm volatile("# LLVM-MCA-END");
  }
  
  BENCHMARK_TIMER_STOP(bench);
  
  printf("result = %lf\n", accum); // approx 40000000
  BENCHMARK_END(bench);
  
  free(buffer);
  return 0;
}


