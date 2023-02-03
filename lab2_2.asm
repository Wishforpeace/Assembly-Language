.386
DATA SEGMENT USE16
    N      DW 23
    SQUARE DW ?
DATA ENDS

CODE SEGMENT USE16
          ASSUME CS:CODE,DS:DATA
    BEGIN:
          MOV    AX,DATA
          MOV    DS,AX
          MOV    CX,N
          XOR    AX,AX
          MOV    BX,1
    ONE:  ADD    AX,BX
          ADD    BX,2
          LOOP   ONE
          MOV    SQUARE,AX
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END BEGIN

