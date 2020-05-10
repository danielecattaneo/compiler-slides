for (int i=0; i<N; i+=8) {
  double t1 = buffer[i] + buffer[i+1];
  double t2 = buffer[i+2] + buffer[i+3];
  double t3 = buffer[i+4] + buffer[i+5];
  double t4 = buffer[i+6] + buffer[i+7];
  double t12 = t1 + t2;
  double t34 = t3 + t4;
  accum += t12 + t34;
}
