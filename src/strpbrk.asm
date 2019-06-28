BITS 64

	global strpbrk
	section .text

strpbrk:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
    cmp BYTE [rsi + rcx], 0
    je not_found
    mov rbx, rdi
    mov al, [rsi + rcx]
    jmp check_for_letter

next_accept:
    inc rcx
    jmp loop
  
check_for_letter:
    cmp BYTE [rbx], 0
    jz next_accept
    cmp [rbx], al
    je founded
    inc rbx
    jmp check_for_letter

founded:
    mov rax, rbx
    jmp end

not_found:
    xor rax, rax

end:
	mov rsp, rbp
	pop rbp
	ret