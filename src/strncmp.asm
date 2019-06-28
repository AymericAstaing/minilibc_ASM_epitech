BITS 64

	global strncmp:function
	section .text

strncmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
	mov al, [rdi + rcx]
	mov r8b, [rsi + rcx]
	cmp al, 0
	je result
	cmp r8b, 0
	je result
	cmp al, r8b
	jne result
	inc rcx
    cmp rcx, rdx
    je result
	jmp loop

result:
	sub al, r8b
	cmp al, 0
	movsx rax, al

end:
	mov rsp, rbp
	pop rbp
	ret