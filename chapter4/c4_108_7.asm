;�Ķ�����,ָ������ڵ�����
;  �ж� x �е�����, Ϊ��,��ʾ positive > 0 
;                   Ϊ��,��ʾ < 0
;                   Ϊ0,��ʾ zero
.386
data segment USE16
msg  db  'hello'
x    db  -5
bufp db 'positive > 0 $'
bufn db ' < 0 $'
zero db 'zero $'
data ends

stack segment USE16 stack
      db 200 dup(0)
stack ends

code segment USE16
     assume cs:code,ds:data,ss:stack 
begin:
     mov ax,data
     mov ds,ax

 .if x==0
     lea dx,zero
 .elseif x>0
     lea dx,bufp
 .else
     lea dx,bufn
 .endif

     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
code ends
     end begin


     