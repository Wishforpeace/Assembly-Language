.386
DATA SEGMENT USE16
    MESS    DB 0DH,0AH,"INPUT SOME TEXT PLEASE:$"
    OUTMESS DB 0DH,0AH,"THE TEXT AFTER CONVERT:$"
    BUFFER  DB 81,?,81 DUP(?)

DATA ENDS

CODE SEGMENT USE16
          ASSUME DS:DATA,CS:CODE
    BEGIN:
          MOV    AX,DATA
          MOV    DS,AX
          LEA    DX,MESS
          MOV    AH,09H
          INT    21H
          LEA    DX,BUFFER
          MOV    AH,0AH
          INT    21H
          MOV    CL,BUFFER+1          ;长度
          MOV    CH,0
          LEA    BX,BUFFER+2          ;内容
    
    NEXT: MOV    AL,[BX]              ;寄存器间接寻址
          ADD    AL,11H               ;30H ----> 41H
          MOV    [BX],AL              ;重新存入buffer
          INC    BX                   ;指向下一位
          LOOP   NEXT
          MOV    BYTE PTR [BX],'$'

          LEA    DX,OUTMESS
          MOV    AH,09H
          INT    21H
          LEA    DX,BUFFER+2
          MOV    AH,09H
          INT    21H
    EXIT: MOV    AH,4CH
          INT    21H
CODE ENDS
    END BEGIN