.386
DATA SEGMENT USE16
    BUF   DB 'ABCDEF'
    NUM   DW 72,-5,100H
    POINT DW 0
DATA ENDS

CODE SEGMENT USE16
          ASSUME DS:DATA,CS:CODE
    START:
          MOV    AX,DATA
          MOV    DS,AX
          MOV    SI,OFFSET NUM
          LEA    ESI,NUM
          MOV    AX,[ESI]
          LEA    AX,[ESI]
          LEA    DI,[ESI+4]
          MOV    POINT,OFFSET BUF
          MOV    EBX,12345678H
          LEA    DX,[EBX+4321H]
          LEA    EAX,[EBX+4321H]
          LEA    ECX,[BX+4321H]

CODE ENDS
   END START