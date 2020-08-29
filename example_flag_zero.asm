%include "io64.inc"

section .text
global CMAIN
CMAIN:
    
    
    ; zero flag example
    
    mov rax, 5
    sub rax, 5 ; zero flag (ZF) is set when operation results in zero
  
    xor rax, rax
    ret