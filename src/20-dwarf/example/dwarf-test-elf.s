	.file	"dwarf-test.c"
	.text
.Ltext0:
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "dwarf-test.c"
	.loc 1 29 0
	.cfi_startproc
.LVL0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 29 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 31 0
	leaq	4(%rsp), %rdi
.LVL1:
	call	use@PLT
.LVL2:
	.loc 1 34 0
	movq	8(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L4
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.LVL3:
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.comm	complex_type_global_2,40,32
	.comm	complex_type_global_1,48,32
	.comm	int_global_cube,4000,32
	.comm	int_global_mtx,400,32
	.comm	int_global_array,40,32
	.comm	float_global,4,4
	.comm	int_global,4,4
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x21b
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF20
	.byte	0xc
	.long	.LASF21
	.long	.LASF22
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x1
	.byte	0x1
	.long	0x42
	.uleb128 0x9
	.byte	0x3
	.quad	int_global
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF1
	.byte	0x1
	.byte	0x2
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	float_global
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.long	.LASF2
	.uleb128 0x5
	.long	0x42
	.long	0x75
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x1
	.byte	0x4
	.long	0x65
	.uleb128 0x9
	.byte	0x3
	.quad	int_global_array
	.uleb128 0x5
	.long	0x42
	.long	0xa7
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.long	.LASF5
	.byte	0x1
	.byte	0x5
	.long	0x91
	.uleb128 0x9
	.byte	0x3
	.quad	int_global_mtx
	.uleb128 0x5
	.long	0x42
	.long	0xd8
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.uleb128 0x6
	.long	0x75
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.long	.LASF6
	.byte	0x1
	.byte	0x6
	.long	0xbc
	.uleb128 0x9
	.byte	0x3
	.quad	int_global_cube
	.uleb128 0x7
	.byte	0x30
	.byte	0x1
	.byte	0x8
	.long	0x11a
	.uleb128 0x8
	.long	.LASF7
	.byte	0x1
	.byte	0x9
	.long	0x42
	.byte	0
	.uleb128 0x8
	.long	.LASF8
	.byte	0x1
	.byte	0xa
	.long	0x5e
	.byte	0x4
	.uleb128 0x8
	.long	.LASF9
	.byte	0x1
	.byte	0xb
	.long	0x65
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF14
	.byte	0x1
	.byte	0xc
	.long	0xed
	.uleb128 0x2
	.long	.LASF10
	.byte	0x1
	.byte	0xe
	.long	0x11a
	.uleb128 0x9
	.byte	0x3
	.quad	complex_type_global_1
	.uleb128 0xa
	.byte	0x28
	.byte	0x1
	.byte	0x10
	.long	0x164
	.uleb128 0xb
	.long	.LASF11
	.byte	0x1
	.byte	0x11
	.long	0x42
	.uleb128 0xb
	.long	.LASF12
	.byte	0x1
	.byte	0x12
	.long	0x5e
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x13
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x1
	.byte	0x14
	.long	0x13a
	.uleb128 0x2
	.long	.LASF16
	.byte	0x1
	.byte	0x16
	.long	0x164
	.uleb128 0x9
	.byte	0x3
	.quad	complex_type_global_2
	.uleb128 0xc
	.long	.LASF23
	.byte	0x1
	.byte	0x1c
	.long	0x42
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f7
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0x1c
	.long	0x42
	.long	.LLST0
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0x1c
	.long	0x1f7
	.long	.LLST1
	.uleb128 0xe
	.long	.LASF24
	.byte	0x1
	.byte	0x1e
	.long	0x42
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.quad	.LVL2
	.long	0x20a
	.long	0x1e9
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x11
	.quad	.LVL3
	.long	0x215
	.byte	0
	.uleb128 0x12
	.byte	0x8
	.long	0x1fd
	.uleb128 0x12
	.byte	0x8
	.long	0x203
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0x13
	.string	"use"
	.string	"use"
	.byte	0x1
	.byte	0x19
	.uleb128 0x14
	.long	.LASF25
	.long	.LASF25
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x34
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
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
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"some_complex_t"
.LASF11:
	.string	"union_field_1"
.LASF12:
	.string	"union_field_2"
.LASF13:
	.string	"union_field_3"
.LASF8:
	.string	"struct_field_2"
.LASF5:
	.string	"int_global_mtx"
.LASF3:
	.string	"long unsigned int"
.LASF21:
	.string	"dwarf-test.c"
.LASF20:
	.string	"GNU C11 7.5.0 -mtune=generic -march=x86-64 -g -O1 -fstack-protector-strong"
.LASF22:
	.string	"/media/sf_example"
.LASF23:
	.string	"main"
.LASF0:
	.string	"int_global"
.LASF17:
	.string	"argc"
.LASF10:
	.string	"complex_type_global_1"
.LASF16:
	.string	"complex_type_global_2"
.LASF24:
	.string	"int_local"
.LASF25:
	.string	"__stack_chk_fail"
.LASF18:
	.string	"argv"
.LASF1:
	.string	"float_global"
.LASF2:
	.string	"float"
.LASF15:
	.string	"another_complex_t"
.LASF19:
	.string	"char"
.LASF7:
	.string	"struct_field_1"
.LASF4:
	.string	"int_global_array"
.LASF9:
	.string	"struct_field_3"
.LASF6:
	.string	"int_global_cube"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
