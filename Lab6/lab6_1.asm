;试编写一程序，将以变量BUF为首址的100个字节存储单元清零
.386 
DATA SEGMENT USE16
    BUF  DB 100 DUP(0)
DATA ENDS
STACK SEGMENT USE16 STACK
          DB 200H DUP(0)
STACK ENDS
CODE SEGMENT USE16
          ASSUME CS:CODE,SS:STACK,DS:DATA,ES:DATA
    START:
          MOV    AX,DATA
          MOV    ES,AX                               ;字节串存数
          MOV    CX,100                              ;count =100
          LEA    DI,BUF                              ;目的变址寄存器
          MOV    AL,0
          REP    STOSB
          MOV    AX,4CH
          INT    21H
CODE ENDS
    END START