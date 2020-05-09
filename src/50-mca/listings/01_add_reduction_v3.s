LBB0_2: 
  vmovsd  (%rbx,%rax,8), %xmm0
  vmovsd  16(%rbx,%rax,8), %xmm1
  vaddsd  8(%rbx,%rax,8), %xmm0, %xmm0
  vaddsd  24(%rbx,%rax,8), %xmm1, %xmm1
  vaddsd  %xmm1, %xmm0, %xmm0
  vmovsd  32(%rbx,%rax,8), %xmm1
  vaddsd  40(%rbx,%rax,8), %xmm1, %xmm1
  vmovsd  48(%rbx,%rax,8), %xmm2
  vaddsd  56(%rbx,%rax,8), %xmm2, %xmm2
  vaddsd  %xmm2, %xmm1, %xmm1
  vaddsd  %xmm1, %xmm0, %xmm0
  vaddsd  %xmm0, %xmm3, %xmm3
  addq    $8, %rax
  cmpq    $80000000, %rax
  jb      LBB0_2