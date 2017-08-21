%macro putch 1
        push word %1
        call _putch
        add word sp, 4
    %endmacro

    bits 16
    org 0x7c00
    
    jmp start

start:    
    putch 'H'
    putch 'e'
    putch 'l'
    putch 'l'
    putch 'o'
    putch ','
    putch ' '
    putch 'W'
    putch 'o'
    putch 'r'
    putch 'l'
    putch 'd'
    putch '!'

eventLoop:
    hlt
    jmp eventLoop

_putch:
    mov word bx, sp
    mov word ax, [bx + 2]
    mov byte ah, 0x0e
    mov byte bh, 0
    mov byte bl, 7
    int 0x10
    ret    

padding:
    times (510 - ($ - $$)) db 0

bios_signature:    
    db 0x55
    db 0xaa
    
    