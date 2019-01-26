mov ah, 0x0e ;; two byte instruction b4 0e 

;; This is wrong becuase we are accessing the memory address and printing it
mov al, '1' ;; assembled code b0 31 again two bytes 
int 0x10  ;;  cd 10  two byte
mov al, the_secret 	 ;; two bytes again, but this one is bit tricky because
int 0x10  ;; cd 10

;; This one right but offset is missing
mov al, '2' ;; two bytes 
int 0x10 ;; two bytes
mov al, [the_secret] 
int 0x10


mov al, '3'
int 0x10
mov bx, the_secret ;; move the address 
add bx, 0x7c00 ;; add memory offset to address 
mov al, [bx] ;; fetch the content at the address which is stored in bx
int 0x10

;; now this one is bit tricky because I need to compute all 
;; the instructions above and how much memory they take. 
mov al, '4'
int 0x10
mov al, [0x7c2d] ;; pretend that you don't know the where your variable in memory, so fill it with any memory location
int 0x10  ;;   After assembly just count the location and add it to 0x7c00


jmp $

the_secret : 
  db 'X'

times 510 - ($ - $$) db 0
dw 0xaa55
