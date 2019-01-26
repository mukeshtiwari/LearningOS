mov ah, 0x0e 

mov bp, 0x8000 ;; base pointer
mov sp, bp ;; copy base pointer in stack pointer

push 'A' ;; after this operation sp := sp - 1. If we really need to print this content then we need to add 1 current sp 
push 'B' ;; sp := sp - 2
push 'C' ;; sp := sp - 3 This content just below sp

mov al, [0x7ffe]
int 0x10

mov al, [0x8000 - 0x0002]
int 0x10

pop bx
mov al, bl
int 0x10 ;; Print C


pop bx
mov al, bl
int 0x10 ;; Print B

pop bx
mov al, bl
int 0x10 ;; Print A

;; Nothing in stack after 3 pop so our bp = sp 

mov al, [0x8000]
int 0x10


jmp $

times 510 - ($ - $$) db 0
dw 0xaa55
