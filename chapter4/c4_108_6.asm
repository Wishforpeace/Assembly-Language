;�Ķ�����,ָ������ڵ�����
;  �ж� x �е�����, Ϊ��,��ʾ positive > 0 
;                   Ϊ��,��ʾ < 0
;                   Ϊ0,��ʾ zero
.386
data segment USE16
        msg  db 'hello'
        x    db 0
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
                mov    ax,data
                mov    ds,ax
                cmp    x,0
                js     l_n
                jns    l_p
     
                lea    dx,zero
                jmp    display
        l_n:    lea    dx,bufn
                jmp    display
        l_p:    lea    dx,bufp
        display:
                mov    ah,9
                int    21h
                mov    ah,4ch
                int    21h
code ends
     end begin


     