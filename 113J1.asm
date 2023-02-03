.386

DATA SEGMENT USE16
    BUF  DB 1,-10,20,-25,25,50
    N    DB $-BUF
    MAX  DB ?
DATA ENDS

STACK SEGMENT USE16
          DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
          ASSUME CS :CODE,SS:STACK,DS:DATA
    BEGIN:MOV    AX,DATA
          MOV    DS,AX
          MOV    BX,1
          MOV    AL  ,BUF[BX]
          MOV    MAX,AL
    L1:   
          CMP    BL,N
          JGE    EXIT
          MOV    AL,BUF[BX]
          CMP    AL,MAX
          JG     L2
    L2:   MOV    MAX,AL
          INC    BX
          JMP    L1

    EXIT: MOV    AH,4CH
          INT    21H
    

CODE ENDS
    END BEGIN
