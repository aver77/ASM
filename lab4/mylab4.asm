; unsigned char(BYTE)
; c <= a[i] <= d

.model tiny
org 100h

.data 
    N dw 7
    A db 3,6,2,1,4,2,5
    c db 2
    d db 5
    result db 0
.code
    mov dl,0
    mov si,0
    mov al,[c]
    mov ah,[d]
M1:
;проверки
    cmp al,A[si]
    jg CHECK ;если a[i] < c то si++ без изм dl (не прошел проверку)
    cmp ah,A[si]
    jl CHECK ;если a[i] > d то si++ без изм dl (не прошел проверку)
    inc dl ;если проверки пройдены то счетчик ++
CHECK:
    inc si
    cmp si,[N]
    jl M1 ;если si(шаг) < N
    mov [result],dl
ret
