
;    {(a-b)/a+1 ,eсли a>b
; x= { 25, если a=b
;    { (a-5)/b, если a<b

.model tiny
org 100h

.data
    msg dw "Division by zero$"
    a db 0  ;and -3 2 for example
    b db 5
    result db 0 
    
.code ; OK
    mov al,[a]
    mov bl,[b] 
    cmp al,bl
    jz equal ;a=b
    jl less  ;a<b
    ;a>b
    cmp al,-1
    jz zero
    mov cl,[a]
    add cl,1 ; a+1
    sub al,bl ;al = (a-b)
    cbw ;al -> ax
    idiv cl ; ax/cl = al (a-b/a+1)     
    mov [result],al    
ret 
   
equal: ;OK
    mov [result],25
ret    

less: ;OK
    cmp bl,0
    jz zero
    sub al,5 ; al=a-b
    cbw ; al -> ax
    idiv bl ; ax/bl = al (a-5/b)
    mov [result],al
ret

zero:
    mov ah, 09h
    mov dx, offset msg
    int 21h
ret 