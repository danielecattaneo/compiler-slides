LBB0_2:
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	8(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	16(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	24(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	32(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	40(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	48(%rbx,%rax,8), %xmm0, %xmm0
	vaddsd	56(%rbx,%rax,8), %xmm0, %xmm0
	addq	$8, %rax
	cmpq	$80000000, %rax
	jb	LBB0_2
