;(2*c - d + 23)/(a/4 - 1)

.model tiny
org 100h
.data
	msg dw "Division by zero$"
	a dw -8
	c dw 0
	d dw 26
	result db 0
	up dw 0
	down db 0
.code   
    mov ax,[a]
    mov bl,4
    idiv bl ;al = ax/bl = a/4
    dec al ; a/4 - 1
    mov [down],al
    cmp al,0
    jz zero
        
nozero:
    mov ax,[c]
	mov bh,2
	mul bh ; ax = 2*c 
	mov bx,[d]
	sub ax,bx ; ax = 2*c-d
	add ax,23 ; ax = (2*c-d+23)
	mov [up], ax  ;up=ax
	mov ax, [up]
    mov bl, [down]
    idiv bl
    mov [result], al
ret

zero:
 	mov ah, 09h ;prerivanie
 	mov dx, offset msg
 	int 21h
ret   