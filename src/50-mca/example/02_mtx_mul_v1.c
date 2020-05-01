//LLVM-MCA-OPTIONS -timeline
#include <stdio.h>
#include <stdlib.h>
#include "benchmark.h"


#define N_MTX 10000000
#define SIZE_MTX (4*4)


int main(int argc, char *argv[])
{
  double *buffer = mallocBufferDouble(N_MTX*SIZE_MTX*2, 0.0, 1.0);
  double *results = calloc(sizeof(double), N_MTX*SIZE_MTX);
  
  timer_state_t time;
  timerStart(&time);
  
  for (int i=0; i<N_MTX; i++) {
    __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
    
    double *mtx1 = &buffer[(i*2)*SIZE_MTX];
    double *mtx2 = &buffer[(i*2+1)*SIZE_MTX];
    double *mtxres = &buffer[i*SIZE_MTX];
    
    for (int drow = 0; drow < 4; drow++) {
      for (int dcol = 0; dcol < 4; dcol++) {
        for (int si = 0; si < 4; si++) {
          mtxres[dcol+drow*4] += mtx1[si+drow*4]*mtx2[dcol+si*4];
        }
      }
    }
    
    __asm volatile("# LLVM-MCA-END");
  }
  
  timerStopAndPrint(&time, "4x4 matrix mult");
  for (int i=0; i<N_MTX*SIZE_MTX; i++)
    forceUse(results+i);
  
  free(buffer);
  free(results);
  return 0;
}
