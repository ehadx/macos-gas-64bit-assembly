	.extern _printf

	.section __TEXT,__text
	.global _main
_main:
	push %rbp
	mov %rsp, %rbp
	// print numbers
		movsd num1(%rip), %xmm0
		movsd num2(%rip), %xmm1
		lea fmt(%rip), %rdi
		mov $0x2, %rax
		call _printf
	// sum
		movsd num1(%rip), %xmm2
		addsd num2(%rip), %xmm2
		movsd num1(%rip), %xmm0
		movsd num2(%rip), %xmm1
		lea f_sum(%rip), %rdi
		mov $0x3, %rax
		call _printf
	// diff
		movsd num1(%rip), %xmm2
		subsd num2(%rip), %xmm2
		movsd num1(%rip), %xmm0
		movsd num2(%rip), %xmm1
		lea f_dif(%rip), %rdi
		mov $0x3, %rax
		call _printf
	// mult
		movsd num1(%rip), %xmm2
		mulsd num2(%rip), %xmm2
		movsd num1(%rip), %xmm0
		movsd num2(%rip), %xmm1
		lea f_mul(%rip), %rdi
		mov $0x3, %rax
		call _printf
	// div
		movsd num1(%rip), %xmm2
		divsd num2(%rip), %xmm2
		movsd num1(%rip), %xmm0
		movsd num2(%rip), %xmm1
		lea f_div(%rip), %rdi
		mov $0x3, %rax
		call _printf
	// squareroot
		sqrtsd num1(%rip), %xmm1
		lea f_sqrt(%rip), %rdi
		movsd num1(%rip), %xmm0
		mov $0x2, %rax
		call _printf
	mov %rbp, %rsp
	pop %rbp
	ret

	.section __TEXT,__cstring
fmt:
	.asciz "The numbers are %f and %f\n"
fmtfloat:
	.asciz "%s %f\n"
f_sum:
	.asciz "The float sum of %f and %f is %f\n"
f_dif:
	.asciz "The float difference of %f and %f is %f\n"
f_mul:
	.asciz "The float product of %f and %f is %f\n"
f_div:
	.asciz "The float division of %f by %f is %f\n"
f_sqrt:
	.asciz "The float squareroot of %f is %f\n"

	.section __TEXT,__literal8
num1:
	.double 9.0
num2:
	.double 73.0
