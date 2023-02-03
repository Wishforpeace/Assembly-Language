	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	mov	w8, #1
	str	w8, [sp, #12]
	mov	w8, #2
	str	w8, [sp, #8]
	mov	w8, #3
	str	w8, [sp, #4]
	mov	w8, #0
	str	wzr, [sp]
	ldr	w9, [sp, #4]
	ldr	w10, [sp, #12]
	subs	w9, w9, w10
	mov	w10, #10
	sdiv	w9, w9, w10
	ldr	w10, [sp, #8]
	mul	w9, w9, w10
	str	w9, [sp]
	ldr	w9, [sp]
	ldr	w10, [sp]
	mul	w9, w9, w10
	str	w9, [sp]
	mov	x0, x8
	add	sp, sp, #16                     ; =16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
