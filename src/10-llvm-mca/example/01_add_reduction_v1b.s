#LLVM-MCA-OPTIONS -timeline -all-stats -bottleneck-analysis

LBB0_2:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	## LLVM-MCA-BEGIN loop_trail
	## InlineAsm Start
	## LLVM-MCA-BEGIN plus_accum_body
	## InlineAsm End
	vaddsd	(%rbx,%rax,8), %xmm0, %xmm0
	## InlineAsm Start
	## LLVM-MCA-END plus_accum_body
	## InlineAsm End
	addq	$1, %rax
	cmpq	$80000000, %rax         ## imm = 0x4C4B400
	jne	LBB0_2
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	## LLVM-MCA-END loop_trail


