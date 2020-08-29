%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ; overflow flag example
    
    mov al, 100
    add al, 28  ; a signed integer can not exceed the value of 127
                ; so an overflow flag (OF) is thrown in the eflags
                ; section of our debugger
                
    mov ax, 100
    add ax, 28  ; because ax is a 16 bit register, a value of 128 is
                ; is acceptable and no flag is thrown here
    
    xor rax, rax
    ret