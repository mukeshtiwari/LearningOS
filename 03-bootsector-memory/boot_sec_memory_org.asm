[org 0x7c00] 
mov ah, 0x0e

mov al, '1'
int 0x10
mov al, the_secret ;; it will print the memory address
int 0x10

mov al, '2'
int 0x10
mov al, [the_secret] ;; it alright because now we have memory offset at top, and assembler will take care of it
int 0x10


mov al, '3' 
int 0x10
mov bx, the_secret 
add bx, 0x7c00 ;; now it's like 2 * 0x7c00 + the_secret 
mov al, [bx] 
int 0x10 

mov al, '4'
int 0x10 
mov al, [0x7c2d] 
int 0x10

jmp $

the_secret : 
   db 'X'

times 510 - ($ - $$) db 0 ;; fill the rest with 0
dw 0xaa55 ;; last 4 bytes 
