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
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	call	__main
	movl	$0, 44(%rsp)
	movl	$0, 40(%rsp)
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	44(%rsp), %rdx
	leaq	40(%rsp), %r8
	leaq	.LC1(%rip), %rcx
	call	scanf
	cmpl	$2, %eax
	jne	.L2
	movl	44(%rsp), %esi
	testl	%esi, %esi
	jle	.L2
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	imull	%eax, %esi
	movl	%esi, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	cmpl	$1, %esi
	jle	.L5
	movl	$1, %ebx
	movl	$0, %ecx
	jmp	.L9
.L2:
	leaq	.LC2(%rip), %rcx
	call	puts
	movl	$1, %eax
.L1:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 5
.L7:
	addl	$1, %ebx
	cmpl	%ebx, %esi
	je	.L12
.L9:
	movl	%ebx, %eax
	cltd
	idivl	44(%rsp)
	testl	%edx, %edx
	jne	.L7
	movl	%ebx, %eax
	cltd
	idivl	40(%rsp)
	testl	%edx, %edx
	jne	.L7
	movl	%ebx, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	movl	$1, %ecx
	jmp	.L7
.L12:
	testl	%ecx, %ecx
	je	.L5
.L10:
	movl	$10, %ecx
	call	putchar
	movl	$0, %eax
	jmp	.L1
.L5:
	leaq	.LC5(%rip), %rcx
	call	printf
	jmp	.L10
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 16.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
