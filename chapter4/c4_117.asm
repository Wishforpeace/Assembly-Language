   ; �ҳ�BUF�������и����ĸ���
   ; BX : BUF������ָ��
   ; CX ��ѭ��������  ��BUF�����ݵĸ���
   ; AX : ��¼�����ĸ���

STACK SEGMENT STACK
      DB 200 DUP(0)
STACK ENDS

DATA SEGMENT
BUF  DB -2,5,-3,6,100,0,-20,-9,8,-100,20     
N    =  $ - BUF
R    DW ?
DATA ENDS

CODE SEGMENT
     ASSUME CS:CODE,DS:DATA,SS:STACK
BEGIN:
     MOV AX,DATA
     MOV DS,AX
     LEA BX,BUF
     MOV CX,N
     MOV AX,0
LOPA:CMP [BX],BYTE PTR 0
     JGE NEXT
     INC AX
NEXT:INC BX
     DEC CX
     JNE LOPA
     MOV R,AX
     MOV AH,4CH
     INT 21H
CODE ENDS
     END BEGIN
     