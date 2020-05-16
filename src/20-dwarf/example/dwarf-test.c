int int_global;
float float_global;

int int_global_array[10];
int int_global_mtx[10][10];
int int_global_cube[10][10][10];

typedef struct {
  int struct_field_1;
  float struct_field_2;
  int struct_field_3[10];
} some_complex_t;

some_complex_t complex_type_global_1;

typedef union {
  int union_field_1;
  float union_field_2;
  int union_field_3[10];
} another_complex_t;

another_complex_t complex_type_global_2;


extern void use(void *);


int main(int argc, char *argv[])
{
  int int_local;
  float float_local;

  int int_local_array[10];
  int int_local_mtx[10][10];
  int int_local_cube[10][10][10];
  
  const int int_local_const = 5;
  
  some_complex_t complex_type_local_1;
  another_complex_t complex_type_local_2;
  
  use(&int_global);
  use(&float_global);
  use(int_global_array);
  use(int_global_mtx);
  use(int_global_cube);
  use(&complex_type_global_1);
  use(&complex_type_global_2);

  use(&int_local);
  use(&float_local);
  use(int_local_array);
  use(int_local_mtx);
  use(int_local_cube);
  use(&complex_type_local_1);
  use(&complex_type_local_2);

  return 0;
}



