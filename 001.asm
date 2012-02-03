; Find the sum of all the multiples of 3 or 5 below 1000.
; psuedo c
; int i = 0;
; while (i < 1000) {
;    if ((i%3) == 0)
;        sum += i;
;    else if ((i%5) == 0)
;        sum += i;
;   i=i+1;
; }
; print sum


%include "include/asm_io.inc"
segment .data

segment .bss

segment .text
    global  _asm_main
_asm_main:
    enter   0,0             ;setup routine
    pusha

    xor ecx, ecx    ;ecx is the sum;
    mov esi, 3
    mov edi, 5    
    xor ebx, ebx  ; sum
    ;dump_regs 0

_begin:
    ;for div (dividend(top)) is EDX:EAX and divosor is source, quotent is in eax, remainer in edx;
    mov eax, ecx   ;check if divisible by three ie remainer = 0;
    xor edx, edx   ;zero out edx, its used int the div op 
    div esi      
    test edx, edx  ; if remaier is zero add this number to the sum;
    je _add
    
    mov eax, ecx    ; check if divisable by 5
    xor edx, edx
    div edi
    test edx, edx   ;if remaimer is zero continue to add, else skill the padd;
    
    jne _skip


_add:
    add ebx, ecx

_skip:
    inc ecx
    cmp ecx, 1000 ;while (i < 1000)
    jne _begin
    
    

    mov eax, ebx    ; print out sum
    call print_int  

    popa
    mov     eax, 0  ; return back to C
    leave
    ret
