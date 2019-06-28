BITS 64

	global strchr:function
	section .text

strchr:
	push rbp
	mov rbp, rsp
    push rdi

loop:
    cmp BYTE [rdi], sil
    je founded
    cmp BYTE[rdi], 0
    jz not_found
    inc rdi
    jmp loop

founded:
    mov rax, rdi
    jmp end

not_found:
    mov rax, 0

end:
    pop rdi
    mov rsp, rbp
    pop rbp
    ret
