; By considering the terms in the Fibonacci sequence whose values
; do not exceed four million, find the sum of the even-valued terms.
%include "include/asm_io.inc"
segment .data

segment .bss

segment .text
    global  _asm_main
_asm_main:
    enter   0,0             ;setup routine
    pusha

    mov ecx, 1    
    mov edx, 0
    xor ebx, ebx

_start:
    test ecx, 1
    jne _continue 

_add: 
    add ebx, ecx

_continue:
    xadd ecx, edx
    cmp ecx, 4000000
    jc _start 
   

    mov eax, ebx
    call print_int
    popa
    mov     eax, 0  ; return back to C
    leave
    ret
