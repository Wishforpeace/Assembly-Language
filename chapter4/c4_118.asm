; ѭ������δ֪�ĳ������
; ��BUFΪ��ַ���ֽڴ洢���У������'$'��������־���ַ�����
; ��ʾ�ô�����Ҫ�����е�Сд��ĸת���ɴ�д��ĸ��ʾ��
; p118

.386
STACK SEGMENT USE16 STACK
      DB 200 DUP(0)
STACK ENDS

DATA SEGMENT USE16
BUF  DB 'add ax,bx sub cx,10  mov dx,1234h END$'
DATA ENDS
CODE SEGMENT USE16
     ASSUME CS:CODE,DS:DATA,SS:STACK
BEGIN:
     MOV AX, DATA
     MOV DS, AX
     LEA BX, BUF
LOPA:MOV DL,[BX]
     CMP DL,'$'
     JE  EXIT
     CMP DL, 'a'
     JB  N
     CMP DL, 'z'
     JA  N
     SUB DL, 20H
N:   MOV AH, 2
     INT 21H
     INC BX
     JMP LOPA
EXIT:MOV AH,4CH
     INT 21H
CODE ENDS
     END BEGIN
