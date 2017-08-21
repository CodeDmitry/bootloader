    bits 16
    org 0x7c00
    
    jmp start

start:      
    mov al, 3
    mov ah, 0
    int 0x10
    
    mov ax, cs
    mov es, ax
    mov bp, $szgreeting
    mov al, 1
    mov bh, 0
    mov bl, 0b00001101
    mov cx, 13
    mov dx, 0x0000
    mov ah, 0x13
    int 0x10   

eventLoop:
    hlt
    jmp eventLoop

_putch:
    mov word bx, sp
    mov word ax, [bx + 2]
    mov byte ah, 0xe
    mov byte bh, 0
    mov byte bl, 7
    int 0x10
    ret    

szgreeting: db 'Hello, World!', 0

padding:
    times (510 - ($ - $$)) db 0

bios_signature:    
    db 0x55
    db 0xaa
    
    