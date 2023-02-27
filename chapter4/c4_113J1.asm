   ; ???BUF???????§Ö????????????????AL??
   ; BX : BUF?????????¡À?
.386
STACK SEGMENT USE16 STACK
      DB 200 DUP(0)
STACK ENDS

DATA SEGMENT USE16 
BUF  DB -2,5,-3,6,100,0,-20,-9,8,-100,20     
N    =  $ - BUF
DATA ENDS

CODE SEGMENT USE16 
     ASSUME CS:CODE,DS:DATA,SS:STACK
BEGIN:
     MOV AX,DATA
     MOV DS,AX
     MOV AL,BUF

     MOV BX,1

L1:  CMP BX, N
     JGE EXIT

     CMP AL,BUF[BX]
     JGE L2
     MOV AL,BUF[BX]

L2:  INC BX
     JMP L1

EXIT:
     MOV AH,4CH
     INT 21H
CODE ENDS
     END BEGIN
     