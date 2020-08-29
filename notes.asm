; - - H E A D E R S - - ;

%include "io64.inc"

; - - V A R I A B L E   D E F I N I T I O N S --;

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


; - - M A I N   P R O G R A M - - ;

;--section .text contains the CMAIN label--
;this exists in the global namespace and is
;accessible to any programs linked to this file

section .text
global CMAIN
CMAIN:
    mov rbp, rsp ; ?? line added for correct debugging
    
    ;--Referencing variables--
    ;variable_name   = address of the variable
    ;[variable_name] = value of the variable


    ; - - M O V E M E N T   O P E R A T I O N S (mov) - - ;
    
    ;syntax is as follows: mov destination, source
    
    ;Moving memory to/from registers
    
    mov rbx, value_a   ;address of value_a assigned to register rbx
    mov al, byte[value_a] ;value of value_a assigned to register al
    mov [value_b], al ;value of register rbx to value_b
    
    ;register value to register value
    mov rax, rbx    ;NOTE: this alters $al as it represents the last 
                    ;byte of register rax

    ;value to variable: mov type[variable_name], value
    mov byte[value_a], 10 ;NOTE: this changes the value_a variable
                          ;but not the value of the registers that
                          ;we previously assigned to hold value_a

    ;--Rules for mov--
    ;memory to value is not allowed, ie. mov 10, [value_a]
    ;memory to memory is not allowed, id. mov [value_b], [value_a]
    ;register/value sizes must be of same type, ie. dword to dword
    
    ;storing a value that exceeds type capacity will produce
    ;incorrect results:
    ;mov al, 256
    ; mov byte[value_a], 256  ;both statements produce compiler warnings
  
  
    ; - - E X C H A N G E   O P E R A T I O N S (xchg) - - ;
      
    mov ax, 20
    mov bx, 10
    
    xchg ax, bx ;xchg takes the values stored at registers ax and bx
                ;and switches them with each other
                
    ;NOTE: these registers effect the values of their parent registers
    
    ;--Rules for xchg--
    ;xchg will not accept raw values, ie, 20, 9, 101
    
    
    ; - - I N C R E M E N T / D E C R E M E N T   O P E R A T I O N S - - ;
    
    ; increment register
    mov rax, 100
    inc rax
    
    ; increment memory
    mov byte[value_a], 100
    inc byte[value_a]
    
    ; decrement register
    dec rax
    
    ; decrement memory
    dec byte[value_a]
    
    
    ; - - N E G A T I O N   O P E R A T I O N S - - ;
    
    neg rax ; converts from positive to negative value and vice versa
    
    mov rax, 0
    
    neg rax ; has no effect on 0 value
    
    
    ; - - A D D I T I O N / S U B T R A C T I O N   O P E R A T I O N S - - ;
    
    ; add/sub on registers
    mov rax, 50 ; rax = 50
    add rax, 10 ; rax + 10 = 60
    sub rax, 30 ; rax - 30 = 30
    
    mov rbx, 40  ; rbx = 40
    add rax, rbx ; rax + rbx = 70
    mov rbx, 20  ; rbx = 20
    sub rax, rbx ; rax - rbx = 50
    
    ; add/sub on memory
    mov byte[value_a], 50
    add byte[value_a], 10
    sub byte[value_a], 30
    
    ; add/sub using registers and memory
    mov al, 100
    add [value_a], al
    mov bl, 50
    sub [value_a], bl
    
    ;--Rules--
    ; cannot use raw values in destination operand
    
    
    xor rax, rax
    ret