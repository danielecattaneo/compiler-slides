for (int i=0; i<N; i+=8) {
  double t1 = buffer[0] + buffer[0+1];
  double t2 = buffer[0+2] + buffer[0+3];
  double t3 = buffer[0+4] + buffer[0+5];
  double t4 = buffer[0+6] + buffer[0+7];
  double t12 = t1 + t2;
  double t34 = t3 + t4;
  accum += t12 + t34;
}
