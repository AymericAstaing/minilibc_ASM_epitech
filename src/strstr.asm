BITS 64

	global strstr:function
	section .text

strstr:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

main_loop:
	mov r8b, [rdi + rcx]
	mov r9b, [rsi + rcx]
	cmp r8b, 0
	je not_found
	cmp r8b, r9b
	je check_substring
	inc rdi
	jmp main_loop


check_substring:
	mov r8b, [rdi + rcx]
	mov r9b, [rsi + rcx]
	cmp r9b, 0
	je founded
	cmp r8b, r9b
	jne main_loop
	inc rcx
	jmp check_substring

not_found:
	xor rax, rax
	jmp end

founded:
	mov rax, rdi
	jmp end

end:
	mov rsp, rbp
	pop rbp
	ret