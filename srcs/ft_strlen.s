section .text
    global _ft_strlen

_ft_strlen:
        xor rax, rax
loop:   mov cl, byte[rdi + rax]
        cmp cl, 0
        je  end
        inc rax
        jmp loop
end:    ret