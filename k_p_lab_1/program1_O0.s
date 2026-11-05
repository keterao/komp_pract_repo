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
	.ascii "%d \0"
.LC5:
	.ascii "none\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-20(%rbp), %rdx
	leaq	-16(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	scanf
	cmpl	$2, %eax
	jne	.L2
	movl	-16(%rbp), %eax
	testl	%eax, %eax
	jle	.L2
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	jg	.L3
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L9
.L3:
	movl	-16(%rbp), %edx
	movl	-20(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	$0, -4(%rbp)
	movl	-12(%rbp), %eax
	leaq	.LC3(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$1, -8(%rbp)
	jmp	.L5
.L7:
	movl	-16(%rbp), %ecx
	movl	-8(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-20(%rbp), %ecx
	movl	-8(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-8(%rbp), %eax
	leaq	.LC4(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$1, -4(%rbp)
.L6:
	addl	$1, -8(%rbp)
.L5:
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L7
	cmpl	$0, -4(%rbp)
	jne	.L8
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L8:
	movl	$10, %ecx
	call	putchar
	movl	$0, %eax
.L9:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
