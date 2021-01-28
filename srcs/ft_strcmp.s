section .text
    global _ft_strcmp

_ft_strcmp:
        xor rcx, rcx
loop:
        mov al, byte[rcx + rdi]
        mov bl, byte[rcx + rsi]
        inc rcx
        cmp al, 0
        je end
        cmp al, bl
        je loop
end:
        sub rax, rbx
        ret
