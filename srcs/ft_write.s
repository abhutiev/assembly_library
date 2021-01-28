section .text
    global _ft_write
    extern ___error

_ft_write:
    mov rax, 0x2000004
    syscall
    jc error
    ret
error:
    push rdx
    mov rdx, rax
    call ___error
    mov qword[rax], rdx
    pop rdx
    mov rax, -1
    ret