%include "io64.inc"

;--variables are defined in the .data section--

section .data

;--data types and their values--
;byte         = 8 binary digits (bits)
;word         = 16 bits
;double word  = 32 bits
;quad word    = 64 bits

;db = byte, dw = word, dd = double word, dq = quad word

value_a db 7
value_b dw 29
value_c dd 200
value_d dq 32406

;--section .text contains the CMAIN label--
;this exists in the global namespace and is
;accessible to any programs linked to this file

section .text
global CMAIN
CMAIN:
    mov rbp, rsp ; ?? line added for correct debugging
    
    ;--Referencing variables--
    ;variable_name   = address of the variable
    ;[variable_name] = immediate value of the variable

    ;--Movement instructions--
    ;syntax is as follows: mov destination, source
    
    ;immediate value to register: mov register, value
    
    ;mov rbx, value_a   ;references the address of value_a
    mov rbx, [value_a] ;references the value of value_a
    
    



    xor rax, rax
    ret