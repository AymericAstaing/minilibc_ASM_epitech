BITS 64

	global rindex:function ; char *strchr(const char *s, int c);
	section .text

rindex:
	push rbp
	mov rbp, rsp
    xor rcx, rcx

prepare_beginning:
    cmp BYTE [rdi + rcx], 0
    je loop
    inc rcx
    jmp prepare_beginning

loop:
    cmp rcx, 0
    je not_found
    cmp [rdi + rcx], sil
    je founded
    dec rcx
    jmp loop

founded:
    add rdi, rcx
    mov rax, rdi
    jmp end

not_found:
    mov rax, 0

end:
    mov rsp, rbp
    pop rbp
    ret
