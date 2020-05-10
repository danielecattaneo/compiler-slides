#include "benchmark.h"


uint64_t xorshift64star(void)
{
  static uint64_t x = UINT64_C(1970835257944453882);
  x ^= x >> 12;
  x ^= x << 25;
  x ^= x >> 27;
  return x * UINT64_C(2685821657736338717);
}


int randomIntInRange(int a, int b)
{
  int d = b - a;
  if (d <= 0)
    return a;
  uint64_t m = UINT64_MAX - UINT64_MAX % d;
  uint64_t n = xorshift64star();
  while (n > m)
    n = xorshift64star();
  return n % d + a;
}


float randomFloatInRange(float a, float b)
{
  float d = b - a;
  if (d <= 0)
    return a;
  float n = (float)(xorshift64star()) / (float)(UINT64_MAX-1);
  return n * d + a;
}


double randomDoubleInRange(double a, double b)
{
  double d = b - a;
  if (d <= 0)
    return a;
  double n = (double)(xorshift64star()) / (double)(UINT64_MAX-1);
  return n * d + a;
}


double *mallocBufferDouble(int n, double min, double max)
{
  double *buffer = malloc(sizeof(double) * n);
  for (int i=0; i<n; i++) {
    buffer[i] = randomDoubleInRange(min, max);
  }
  return buffer;
}


void forceUse(void *something)
{
  asm volatile("" : : "r,m"(something) : "memory");
}

