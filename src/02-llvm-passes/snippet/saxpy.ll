  %1 = alloca float
  %2 = alloca float
  %3 = alloca float
  %4 = alloca float
  store %a, %1
  store %x, %2
  store %y, %3
  %5 = load %1
  %6 = load %2
  %7 = fmul %5, %6
  store %7, %4
  %8 = load %4
  %9 = load %3
  %10 = fadd %8, %9
  ret %10
