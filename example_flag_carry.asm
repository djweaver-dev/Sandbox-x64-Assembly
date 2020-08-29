%include "io64.inc"

section .data
value_a db 10
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ; carry flag example
    
    mov al, [value_a]
    sub al, 20 ; because we are subtracting a number greater than
               ; value_a from register al, the carry flag (CF) is 
               ; triggered in the eflags section of our debugger
       
    xor rax, rax
    ret