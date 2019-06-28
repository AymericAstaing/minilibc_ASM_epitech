BITS 64

	global strcspn
	section .text

strcspn:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
    cmp BYTE [rdi + rcx], 0
    je not_found
    mov rbx, rsi
    mov al, [rdi + rcx]
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
    inc rcx
    mov rax, rcx
    jmp end

not_found:
    xor rax, rax

end:
	mov rsp, rbp
	pop rbp
	ret