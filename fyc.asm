DATA SEGMENT
    INPUT DB 'PLEASE INPUT X(0~9): $''
    TAB   DW 0,1,8,27,64,125,216,343,512,729
    X     DB ?
    XXX   DW ?
DATA ENDS
STACK SEGMENT
          DB 200 DUP(0)
STACK ENDS
CODE SEGMENT
          ASSUME CS:CODE,DS:DATA,SS:STACK
    BEGIN:MOV    AX, DATA
          MOV    DS,AX
          MOV    DX,OFFSET INPUT
          MOV    AH,9
          INT    21H
          MOV    AH,1
          INT    21H
          AND    AL,0FH
          MOV    X,AL
          XOR    EBX,EBX
          MOV    BL,AL
          MOV    AX,TAB[2*EBX]
          MOV    XXX,AX
          MOV    AH,4CH
          INT    21H
CODE ENDS
ENDS BEGIN