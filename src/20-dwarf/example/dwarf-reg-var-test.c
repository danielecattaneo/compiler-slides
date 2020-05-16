/* Compiled with -O1 */

extern void use(void *);


int main(int argc, char *argv[])
{
  int buf[10];
  use(buf);
  
  int *p = buf;
  int a = 0;
  for (int i=0; i<10; i++) {
    a += *p++;
  }
  
  use(&a);
  return 0;
}

