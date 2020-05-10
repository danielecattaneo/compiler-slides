  %1 = alloca float
  %2 = alloca float
  %3 = alloca float
  store %a, %1
  store %x, %2
  store %y, %3
  %4 = load %1
  %5 = load %2
  %6 = fmul %4, %5
  %7 = load %3
  %8 = fadd %6, %7
  ret %8
