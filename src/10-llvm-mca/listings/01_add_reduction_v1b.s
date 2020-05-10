LBB0_2:
	## LLVM-MCA-BEGIN loop_trail
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	addq	$1, %rax
	cmpq	$80000000, %rax
	jne	LBB0_2
## %bb.3:
	## LLVM-MCA-END loop_trail
