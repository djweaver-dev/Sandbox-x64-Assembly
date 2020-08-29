%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ;sign flag example
    mov rax, 5
    sub rax, 10 ;sign flag (SF) is triggered when a negative
                ;value is produced as the result of arithmatic
    
    xor rax, rax
    ret