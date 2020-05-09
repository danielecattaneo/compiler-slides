for (int i=0; i<N; i+=4) {
  double t1 = buffer[i] + buffer[i+1];
  double t2 = buffer[i+2] + buffer[i+3];
  accum += t1 + t2;
}
