; ѭ���������
; �Ƚϲ�ͬ��ָ����򣬳�������н��

.386
data segment  USE16
xx   db 'abcdef'
buf1 db '1234567'
buf2 db 'good'
data ends

code segment USE16
     assume cs:code,ds:data
begin:
     mov ax,data
     mov ds,ax
     mov cx, buf2 - buf1
     lea bx, buf2 - 1
LP:  mov dl, [bx]
     mov ah, 2
     int 21h
     dec bx       ;  ����� dec bx  �� dec cx �����������Σ�
     dec cx
     jnz LP

     mov ah,4ch
     int 21h
code  ends
      end begin

