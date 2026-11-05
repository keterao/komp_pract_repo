	.file	"program1.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Enter natural A and B: \0"
.LC1:
	.ascii "%d %d\0"
.LC2:
	.ascii "error\0"
	.align 8
.LC3:
	.ascii "Numbers divisible by both, less than %d:\12\0"
.LC4:
	.ascii "none\0"
.LC5:
	.ascii "%d \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	movl	$0, 56(%rsp)
	movl	$0, 60(%rsp)
	call	printf
	leaq	56(%rsp), %rdx
	leaq	60(%rsp), %r8
	leaq	.LC1(%rip), %rcx
	call	scanf
	cmpl	$2, %eax
	jne	.L2
	movl	56(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L2
	movl	60(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	imull	%eax, %ebx
	leaq	.LC3(%rip), %rcx
	movl	%ebx, %edx
	call	printf
	movl	$1, %r8d
	xorl	%ecx, %ecx
	cmpl	$1, %ebx
	jne	.L5
	jmp	.L10
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L8:
	addl	$1, %r8d
	cmpl	%r8d, %ebx
	je	.L18
.L5:
	movl	%r8d, %eax
	cltd
	idivl	56(%rsp)
	testl	%edx, %edx
	jne	.L8
	movl	%r8d, %eax
	cltd
	idivl	60(%rsp)
	testl	%edx, %edx
	jne	.L8
	movl	%r8d, %edx
	leaq	.LC5(%rip), %rcx
	movl	%r8d, 44(%rsp)
	call	printf
	movl	44(%rsp), %r8d
	movl	$1, %ecx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	.LC2(%rip), %rcx
	call	puts
	movl	$1, %eax
.L1:
	addq	$64, %rsp
	popq	%rbx
	ret
.L18:
	testl	%ecx, %ecx
	je	.L10
.L6:
	movl	$10, %ecx
	call	putchar
	xorl	%eax, %eax
	jmp	.L1
.L10:
	leaq	.LC4(%rip), %rcx
	call	printf
	jmp	.L6
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
