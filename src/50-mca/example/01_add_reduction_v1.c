//LLVM-MCA-OPTIONS -timeline
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
  
  for (int i=0; i<N; i++) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    accum += buffer[i];
    __asm volatile("# LLVM-MCA-END");
  }
  
  timerStopAndPrint(&time, "+ accumulator");
  printf("result = %lf\n", accum); // approx 40000000
  
  free(buffer);
  return 0;
}


