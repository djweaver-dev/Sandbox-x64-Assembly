%include "io64.inc"

section .data
varA db 10
varB db 20
varC db 12
varD db  6
solution db 0

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    
    ;evaluate this expression
    ; -varA + varB - (varC - varD)
    
    mov al, [varA] ; store value of varA in register al: 10
    neg al         ; negate register al: -10
    add al, [varB] ; add value of varB to register al: 10
    
    mov bl, [varC] ; store value of varC in register bl: 12
    sub bl, [varD] ; subtract value of varD from register bl: 6
    
    sub al, bl ; subtract register bl from register al: (10 - 6 = 4)
    
    mov [solution], al ; store value of 4 in solution variable
    
    xor rax, rax
    ret