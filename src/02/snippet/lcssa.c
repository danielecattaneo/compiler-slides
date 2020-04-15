int *search(int *x, int n, int y)
{
  int *j = NULL;
  for (int i = 0; i < n; i++)
    if (x[i] == y)
      j = &x[i];
  return j;
} 
