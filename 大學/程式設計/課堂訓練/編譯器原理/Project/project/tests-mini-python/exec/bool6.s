	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	je .LC0
	movq $0, %rax
	jmp .LC1
.LC0:
	movq $1, %rax
.LC1:
	cmpq $1, %rax
	jne .LC2
	movq $.LCtrue, %rdi
	jmp .LC3
.LC2:
	movq $.LCfalse, %rdi
.LC3:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	jne .LC4
	movq $0, %rax
	jmp .LC5
.LC4:
	movq $1, %rax
.LC5:
	cmpq $1, %rax
	jne .LC6
	movq $.LCtrue, %rdi
	jmp .LC7
.LC6:
	movq $.LCfalse, %rdi
.LC7:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	jl .LC8
	movq $0, %rax
	jmp .LC9
.LC8:
	movq $1, %rax
.LC9:
	cmpq $1, %rax
	jne .LC10
	movq $.LCtrue, %rdi
	jmp .LC11
.LC10:
	movq $.LCfalse, %rdi
.LC11:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	jle .LC12
	movq $0, %rax
	jmp .LC13
.LC12:
	movq $1, %rax
.LC13:
	cmpq $1, %rax
	jne .LC14
	movq $.LCtrue, %rdi
	jmp .LC15
.LC14:
	movq $.LCfalse, %rdi
.LC15:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	jg .LC16
	movq $0, %rax
	jmp .LC17
.LC16:
	movq $1, %rax
.LC17:
	cmpq $1, %rax
	jne .LC18
	movq $.LCtrue, %rdi
	jmp .LC19
.LC18:
	movq $.LCfalse, %rdi
.LC19:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	pushq %rax
	movq $1, %rax
	popq %rbx
	cmpq %rbx, %rax
	jge .LC20
	movq $0, %rax
	jmp .LC21
.LC20:
	movq $1, %rax
.LC21:
	cmpq $1, %rax
	jne .LC22
	movq $.LCtrue, %rdi
	jmp .LC23
.LC22:
	movq $.LCfalse, %rdi
.LC23:
	movq %rax, %rsi
	movq $.LCs, %rdx
	movq $0, %rax
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	leave
	ret
print_list:
	pushq %r12
	pushq %r14
	pushq %r15
	movq 0(%r12), %r15
	xorq %r14, %r14
print_list_loop:
	cmpq %r14, %r15
	je print_list_end
	movq %r14, %rdx
	imulq $8, %rdx
	addq $8, %rdx
	leaq 0(%r12,%rdx,1), %rsi
	movq 0(%rsi), %rax
	movq %rax, %rsi
	movq $.LCd, %rdi
	call printf
	addq $1, %r14
	cmpq %r14, %r15
	je print_list_end
	movq $.LCcomma, %rdi
	call printf
	jmp print_list_loop
print_list_end:
	movq $.LCend, %rdi
	call printf
	movq $10, %rdi
	call putchar
	movq $0, %rax
	popq %r15
	popq %r14
	popq %r12
	ret
runtime_error:
	movq $.LCerror, %rdi
	call puts
	movq $1, %rdi
	call exit
	ret
	.data
.LCtrue:
	.string "True"
.LCfalse:
	.string "False"
.LCcomma:
	.string ", "
.LCstart:
	.string "["
.LCend:
	.string "]"
.LCs:
	.string "%s"
.LCd:
	.string "%d"
.LCnone:
	.string "None"
.LCerror:
	.string "Runtime Error"
