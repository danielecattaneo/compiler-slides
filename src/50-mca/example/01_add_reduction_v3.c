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
  
  for (int i=0; i<N; i+=8) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    double t1 = buffer[i] + buffer[i+1];
    double t2 = buffer[i+2] + buffer[i+3];
    double t3 = buffer[i+4] + buffer[i+5];
    double t4 = buffer[i+6] + buffer[i+7];
    double t12 = t1 + t2;
    double t34 = t3 + t4;
    accum += t12 + t34;
    __asm volatile("# LLVM-MCA-END");
  }
  
  timerStopAndPrint(&time, "+ accumulator");
  printf("result = %lf\n", accum); // approx 40000000
  
  free(buffer);
  return 0;
}


