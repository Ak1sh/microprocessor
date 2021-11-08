 .model small
 .data
 a db 22h,33h,5h,44h,17h
 b dw $-a
 .code
start:   mov ax,@data
         mov ds,ax
         mov bx,b
         dec bx
inloop:  mov cx,bx
         mov si,0

outloop: mov al,a[si]
         inc si

         cmp al,a[si]
         jb goom

         xchg al,a[si]
         mov a[si-1],al

goom:    loop outloop

         dec bx
         jnz inloop

         mov ah,4ch
         int 21h

end start

