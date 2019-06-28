BITS 64

	global memset
	section .text

memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	mov rax, rdi

loop:
	cmp rdx, rcx
	je end
	mov [rax], sil
	inc rcx
	inc rax
	jmp loop

end:
	mov rsp, rbp
	pop rbp
	ret