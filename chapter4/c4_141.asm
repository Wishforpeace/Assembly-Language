; ʹ�õݹ��ӳ��� �� N!  ��ʮ������ʽ��ʾ���
.386
stack segment  USE16 stack
      db 200 dup(0)
stack ends

data segment USE16 
msg    db  'input a number (1..9) : $'
output db  0dh,0ah,'jie cheng is : '
result db  6 dup (' '),'$'
error  db  0dh,0ah,'input error ! $'
data ends

code segment USE16 
     assume cs:code,ds:data,ss:stack
start:
     mov  ax, data
     mov  ds, ax
     lea  dx, msg      ; ��ʾ��ʾ��Ϣ
     mov  ah, 9
     int  21h
     
     mov  ah, 1        ; ����һ���ַ�
     int  21h

     cmp  al, '1'      ; �ж��Ƿ��� ��1��- ��9��֮��
     jb   error_p      ; ���ڣ����г�����
     cmp  al,'9'
     ja   error_p

     sub  al, 30h
     mov  bl, al
     mov  bh, 0       ; BX Ϊ����׳� ����
                      ; ����� (DX,AX)��
     call f_jiechen

     call f_zhuanhuan   ; (DX,AX)  -> result ��������

     lea  dx, output
     mov  ah, 9
     int  21h
     jmp  exit

error_p:
     lea  dx, error
     mov  ah, 9
     int  21h
exit:mov  ah,4ch
     int  21h

; BX  �е���Ϊ ����׳˵� ��
f_jiechen proc
     cmp  bx,1
     jg   LP
     mov  ax,1
     mov  dx,0
     ret
LP:  dec  bx
     call f_jiechen
     inc  bx
     mul  bx
     ret
f_jiechen endp

; �� (DX,AX) �е����ݣ�ת���� ʮ��������
f_zhuanhuan proc
     mov   bx, 10
     lea   si, result+5
l1:  div   bx
     add   dl,30H
     mov   [si],dl
     dec   si
     cmp   ax, 0
     jz    f_exit
     mov   dx,0
     jmp   l1
f_exit:
     ret
f_zhuanhuan  endp

code ends
     end start
