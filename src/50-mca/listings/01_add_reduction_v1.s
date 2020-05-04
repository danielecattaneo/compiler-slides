	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
LBB0_2:
	## InlineAsm Start
	## LLVM-MCA-BEGIN plus_accum_body
	## InlineAsm End
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	## InlineAsm Start
	## LLVM-MCA-END
	## InlineAsm End
	addq	$1, %rax
	cmpq	$80000000, %rax
	jne	LBB0_2