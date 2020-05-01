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

static __attribute__((always_inline)) void timerStart(
    timer_state_t *timer_state)
{
#ifdef __APPLE__
  timer_state->stime = mach_absolute_time();
#elif _WIN32
  QueryPerformanceCounter((LARGE_INTEGER*)&(timer_state->stime));
#elif __linux__
  clock_gettime(CLOCK_MONOTONIC_RAW, &(timer_state->stime));
#endif
}

static __attribute__((always_inline)) uint64_t timerStop(
    timer_state_t *timer_state)
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

static __attribute__((always_inline)) double timerStopAndPrint(
    timer_state_t *timer_state, const char *desc)
{
  uint64_t nanosec = timerStop(timer_state);
  double secs = (double)nanosec/(double)1000000000;
  printf("[%s] time taken: %lf s\n", desc, secs);
  return secs;
}



typedef struct {
  timer_state_t timer;
  double time_accum;
  int rep_count;
  int rep_i;
  const char *name;
} benchmark_state_t;

#define BENCHMARK_BEGIN(b, b_name, b_rep_count, b_preheat) \
  (b).time_accum = 0;\
  (b).rep_count = (b_rep_count);\
  (b).rep_i = -(b_preheat);\
  (b).name = (b_name);\
  if ((b).rep_i < 0)\
    printf("[%s] preheating started\n", (b).name);\
  for (; (b).rep_i < (b).rep_count; (b).rep_i++) {
  
#define BENCHMARK_TIMER_START(b) do {\
      timerStart(&((b).timer));\
    } while (0)

#define BENCHMARK_TIMER_STOP(b) do {\
      double secs = timerStopAndPrint(&((b).timer), (b).name);\
      if ((b).rep_i >= 0)\
        (b).time_accum += secs;\
      if ((b).rep_i == -1)\
        printf("[%s] preheating ended\n", (b).name);\
    } while (0)
  
#define BENCHMARK_END(b) \
  }\
  printf("[%s] average time taken over %d iterations: %lf s\n", \
      (b).name, (b).rep_count, (b).time_accum / (double)(b).rep_count);


uint64_t xorshift64star(void);
int randomIntInRange(int a, int b);
float randomFloatInRange(float a, float b);
double randomDoubleInRange(double a, double b);
double *mallocBufferDouble(int n, double min, double max);

void forceUse(void *something);


#endif

