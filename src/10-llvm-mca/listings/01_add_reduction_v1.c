for (int i=0; i<N; i++) {
  __asm volatile("# LLVM-MCA-BEGIN plus_accum_body");
  accum += buffer[i];
  __asm volatile("# LLVM-MCA-END plus_accum_body");
}
