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
;��������
    cmp al,A[si]
    jg CHECK ;���� a[i] < c �� si++ ��� ��� dl (�� ������ ��������)
    cmp ah,A[si]
    jl CHECK ;���� a[i] > d �� si++ ��� ��� dl (�� ������ ��������)
    inc dl ;���� �������� �������� �� ������� ++
CHECK:
    inc si
    cmp si,[N]
    jl M1 ;���� si(���) < N
    mov [result],dl
ret
