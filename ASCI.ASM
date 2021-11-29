.model small


 display macro msg
   lea dx,msg
   mov ah,09h
   int 21h

 endm

dispchar macro
  mov ah,02h
  int 21h

 endm

.data
msg1 db 0dh,0ah, "enter an alphanumeric character"

.code
start mov ax,@data
      mov ds,ax
      display msg1
      mov ah,01h
      int 21h
      push ax

      mov ah,00h
      mov al,00h
      int 10h

      mov ah,02h
      mov bh,00h
      mov dh,12d
      mov dl,40d
      int 10h
      pop ax
      aam
      push ax
      mov al,ah
      xor ah,ah
      aam
      add ax,3030h
      mov dl,ah
      push ax
      dispchar
      pop ax
      mov dl,al
      dispchar
      pop ax
      add al,30h
      mov dl,al
      dispchar

      mov ah,02h
      int 21h
      jmp final

 final : mov ah,4ch
        int 21h

 end start
