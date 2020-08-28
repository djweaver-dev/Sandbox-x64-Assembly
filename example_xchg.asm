%include "io64.inc"

section .data
varA dq 0
varB dq 0

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    
    ; assign our values
    mov qword[varA], 7
    mov qword[varB], -1
    
    ; exchange varA and varB
    
    ; because we cannot xchg variables directly we must 
    ; store one value in a register to xchg it instead
    
    mov rax, [varA] ; mov value of varA into register rax
    xchg rax, [varB] ; xchg value of varB and register rax
    mov [varA], rax ; mov value of register rax into varA
    
    
    xor rax, rax
    ret