#ifndef __BENCHMARK_H__
#define __BENCHMARK_H__

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <math.h>
#ifdef __APPLE__
#include <mach/mach_time.h>
#elif _WIN32
#include <windows.h>
#elif __linux__
#include <time.h>
#elif
#define NOBENCH
#endif


typedef struct {
#ifdef __APPLE__
  uint64_t stime;
#elif _WIN32
  LONGLONG stime;
#elif __linux__
  struct timespec stime;
#endif
} timer_state_t;


static __attribute__((always_inline)) void timerStart(timer_state_t *timer_state)
{
#ifdef __APPLE__
  timer_state->stime = mach_absolute_time();
#elif _WIN32
  QueryPerformanceCounter((LARGE_INTEGER*)&(timer_state->stime));
#elif __linux__
  clock_gettime(CLOCK_MONOTONIC_RAW, &(timer_state->stime));
#endif
}


static __attribute__((always_inline)) uint64_t timerStop(timer_state_t *timer_state)
{
  uint64_t diff;

#ifdef __APPLE__
  uint64_t etime;
  mach_timebase_info_data_t info;

  etime = mach_absolute_time();
  mach_timebase_info(&info);
  diff = (etime - timer_state->stime) * info.numer / info.denom;
#elif _WIN32
  LONGLONG etime;
  LONGLONG freq;
  uint64_t tmp1, tmp2;

  QueryPerformanceCounter((LARGE_INTEGER*)&etime);
  QueryPerformanceFrequency((LARGE_INTEGER*)&freq);
  diff = etime - timer_state->stime;
  tmp1 = (diff * 1000000) / freq;
  tmp2 = ((diff * 1000000) % freq) * 1000 / freq;
  diff = tmp1 * 1000 + tmp2;
#elif __linux__
  struct timespec etime;
  uint64_t t0, t1;

  clock_gettime(CLOCK_MONOTONIC_RAW, &etime);
  t0 = timer_state->stime.tv_nsec + timer_state->stime.tv_sec * 1000000000;
  t1 = etime.tv_nsec + etime.tv_sec * 1000000000;
  diff = t1 - t0;
#endif

  return diff;
}


static __attribute__((always_inline)) void timerStopAndPrint(timer_state_t *timer_state, const char *desc)
{
  uint64_t nanosec = timerStop(timer_state);
  printf("[%s] time taken: %lf s\n", desc, (double)nanosec/(double)1000000000);
}


uint64_t xorshift64star(void);
int randomIntInRange(int a, int b);
float randomFloatInRange(float a, float b);
double randomDoubleInRange(double a, double b);
double *mallocBufferDouble(int n, double min, double max);

void forceUse(void *something);


#endif

