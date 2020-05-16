	.file	"dwarf-reg-var-test.c"
	.text
.Ltext0:
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "dwarf-reg-var-test.c"
	.loc 1 7 0
	.cfi_startproc
.LVL0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 9 0
	leaq	16(%rsp), %rbx
	.loc 1 7 0
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	.loc 1 9 0
	movq	%rbx, %rdi
.LVL1:
	call	use@PLT
.LVL2:
.LBB2:
	.loc 1 13 0
	leaq	40(%rbx), %rdx
.LBE2:
	.loc 1 9 0
	xorl	%eax, %eax
	.loc 1 11 0
	movq	%rbx, %rdi
.LVL3:
	.p2align 4,,10
	.p2align 3
.L2:
.LBB3:
	.loc 1 14 0 discriminator 3
	addq	$4, %rdi
.LVL4:
	addl	-4(%rdi), %eax
	.loc 1 13 0 discriminator 3
	cmpq	%rdx, %rdi
	jne	.L2
.LBE3:
	.loc 1 17 0
	leaq	12(%rsp), %rdi
.LVL5:
	movl	%eax, 12(%rsp)
	call	use@PLT
.LVL6:
	.loc 1 19 0
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L7
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.LVL7:
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x12e
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF4
	.byte	0xc
	.long	.LASF5
	.long	.LASF6
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x1
	.byte	0x6
	.long	0xe6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0xe6
	.uleb128 0x3
	.long	.LASF0
	.byte	0x1
	.byte	0x6
	.long	0xe6
	.long	.LLST0
	.uleb128 0x3
	.long	.LASF1
	.byte	0x1
	.byte	0x6
	.long	0xed
	.long	.LLST1
	.uleb128 0x4
	.string	"buf"
	.byte	0x1
	.byte	0x8
	.long	0x100
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.string	"p"
	.byte	0x1
	.byte	0xb
	.long	0x117
	.long	.LLST2
	.uleb128 0x4
	.string	"a"
	.byte	0x1
	.byte	0xc
	.long	0xe6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x6
	.long	.Ldebug_ranges0+0
	.long	0xa7
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0xd
	.long	0xe6
	.long	.LLST3
	.byte	0
	.uleb128 0x7
	.quad	.LVL2
	.long	0x11d
	.long	0xbf
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.quad	.LVL6
	.long	0x11d
	.long	0xd8
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x9
	.quad	.LVL7
	.long	0x128
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xb
	.byte	0x8
	.long	0xf3
	.uleb128 0xb
	.byte	0x8
	.long	0xf9
	.uleb128 0xc
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0xd
	.long	0xe6
	.long	0x110
	.uleb128 0xe
	.long	0x110
	.byte	0x9
	.byte	0
	.uleb128 0xc
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0xb
	.byte	0x8
	.long	0xe6
	.uleb128 0xf
	.string	"use"
	.string	"use"
	.byte	0x1
	.byte	0x3
	.uleb128 0x10
	.long	.LASF8
	.long	.LASF8
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LFE0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL2-1
	.value	0x1
	.byte	0x54
	.quad	.LVL2-1
	.quad	.LFE0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x1
	.byte	0x53
	.quad	.LVL3
	.quad	.LVL5
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2
	.quad	.LBE2
	.quad	.LBB3
	.quad	.LBE3
	.quad	0
	.quad	0
	.quad	.LFB0
	.quad	.LFE0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"/media/sf_example"
.LASF0:
	.string	"argc"
.LASF5:
	.string	"dwarf-reg-var-test.c"
.LASF2:
	.string	"char"
.LASF7:
	.string	"main"
.LASF3:
	.string	"long unsigned int"
.LASF4:
	.string	"GNU C11 7.5.0 -mtune=generic -march=x86-64 -g -O2 -fstack-protector-strong"
.LASF8:
	.string	"__stack_chk_fail"
.LASF1:
	.string	"argv"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
