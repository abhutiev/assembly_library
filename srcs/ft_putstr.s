section .text
            global _ft_putstr
_ft_putstr:
            push    rsi
            push    rdx
            mov     rsi, rdi
            mov     rcx, 0
            mov     rdi, 1
            mov     rdx, 1
.loop:
            cmp     byte [rsi], 0
            je      .return
            push rdx
            mov     rax, 0x2000004
            syscall
            pop rdx
            inc rsi
            jmp     .loop
.return:
            pop     rdx
            pop     rsi
            ret