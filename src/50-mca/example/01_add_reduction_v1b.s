#LLVM-MCA-OPTIONS -timeline -all-stats -bottleneck-analysis
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI0_0:
	.quad	4607182418800017408     ## double 1
LCPI0_3:
	.quad	4741671816366391296     ## double 1.0E+9
LCPI0_4:
	.quad	4636737291354636288     ## double 100
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI0_1:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_2:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI0_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$80000000, %edi         ## imm = 0x4C4B400
	callq	_mallocBufferDouble
	movq	%rax, %rbx
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str(%rip), %r14
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$-2, %r13d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	callq	_mach_absolute_time
	movq	%rax, %r15
	xorl	%eax, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
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
	vmovsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	callq	_mach_absolute_time
	movq	%rax, %r12
	leaq	-64(%rbp), %rdi
	callq	_mach_timebase_info
	subq	%r15, %r12
	movl	-64(%rbp), %eax
	movl	-60(%rbp), %ecx
	imulq	%r12, %rax
	movq	%rax, %rdx
	shrq	$32, %rdx
	je	LBB0_4
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	xorl	%edx, %edx
	divq	%rcx
	jmp	LBB0_6
	.p2align	4, 0x90
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
                                        ## kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
                                        ## kill: def $eax killed $eax def $rax
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	vmovq	%rax, %xmm0
	vpunpckldq	LCPI0_1(%rip), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	vsubpd	LCPI0_2(%rip), %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vdivsd	LCPI0_3(%rip), %xmm0, %xmm0
	leaq	L_.str.5(%rip), %rdi
	movq	%r14, %rsi
	vmovsd	%xmm0, -72(%rbp)        ## 8-byte Spill
	movb	$1, %al
	callq	_printf
	testl	%r13d, %r13d
	js	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_1 Depth=1
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vaddsd	-72(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	jmp	LBB0_10
	.p2align	4, 0x90
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	cmpl	$-1, %r13d
	jne	LBB0_10
## %bb.9:                               ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.2(%rip), %rdi
	movq	%r14, %rsi
	xorl	%eax, %eax
	callq	_printf
	.p2align	4, 0x90
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	vmovsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	leaq	L_.str.3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	addl	$1, %r13d
	cmpl	$100, %r13d
	jne	LBB0_1
## %bb.11:
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vdivsd	LCPI0_4(%rip), %xmm0, %xmm0
	leaq	L_.str.4(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$100, %edx
	movb	$1, %al
	callq	_printf
	movq	%rbx, %rdi
	callq	_free
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"+ accumulator"

L_.str.1:                               ## @.str.1
	.asciz	"[%s] preheating started\n"

L_.str.2:                               ## @.str.2
	.asciz	"[%s] preheating ended\n"

L_.str.3:                               ## @.str.3
	.asciz	"result = %lf\n"

L_.str.4:                               ## @.str.4
	.asciz	"[%s] average time taken over %d iterations: %lf s\n"

L_.str.5:                               ## @.str.5
	.asciz	"[%s] time taken: %lf s\n"


.subsections_via_symbols
