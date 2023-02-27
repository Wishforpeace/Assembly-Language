   ; 找出BUF数据区中的最大数，并保存在AL中
   ; BX : BUF数据区的下标
.386
STACK SEGMENT USE16 STACK
           DB 200 DUP(0)
STACK ENDS

DATA SEGMENT  USE16
     BUF  DW -2,5,-3,6,100,0,-20,-9,8,-100,20
     N    =  ($ - BUF)/2
DATA ENDS

CODE SEGMENT  USE16
           ASSUME CS:CODE,DS:DATA,SS:STACK
     BEGIN:
           MOV    AX,DATA
           MOV    DS,AX
           MOV    AX,BUF

           MOV    EBX,1

     L1:   CMP    EBX, N
           JGE    EXIT

           CMP    AX,BUF[EBX*2]
           JGE    L2
           MOV    AX,BUF[EBX*2]

     L2:   INC    EBX
           JMP    L1

     EXIT: 
           MOV    AH,4CH
           INT    21H
CODE ENDS
     END BEGIN
     