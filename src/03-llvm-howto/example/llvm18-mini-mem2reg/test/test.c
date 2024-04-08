#include <stdlib.h>

float saxpy(float a, float x, float y)
{
  float t = a * x;
  return t + y;
}

int search(int *x, int n, int y)
{
  int j = -1;
  for (int i = 0; i < n; i++)
    if (x[i] == y)
      j = i;
  return j;
} 

int doubleIndirection(int *x)
{
  int **y = &x;
  return search(NULL, **y, 1);
}
