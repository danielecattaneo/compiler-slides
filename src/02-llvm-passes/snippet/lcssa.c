int *search(int *x, int n, int y)
{
  int j = -1;
  for (int i = 0; i < n; i++)
    if (x[i] == y)
      j = i;
  return j;
} 
