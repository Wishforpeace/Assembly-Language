.386

DATA SEGMENT USE16
      INPUT DB 'PLEASE INPUT A NUMBER(0~9)$'
      TAB0  DB '000$'
      TAB1  DB '001$'
      TAB2  DB '008$'
      TAB3  DB '027$'
      TAB4  DB '064$'
      TAB5  DB '125$'
      TAB6  DB '216$'
      TAB7  DB '343$'
      TAB8  DB '512$'
      TAB9  DB '729$'
      X     DB ?
      XXX   DB ?
DATA ENDS

STACK SEGMENT USE16
            DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK
      BEGIN:MOV    AX,DATA
            MOV    DS,AX
            MOV    DX,OFFSET INPUT
            MOV    AH,9
            INT    21H
            MOV    AH,1
            INT    21H
            ADD    AL,0FH
            MOV    X,AL
            XOR    EBX,EBX                       ;将EBX清零
            MOV    BL,AL
            LEA    AX,TAB0[4*EBX]
            MOV    XXX,AX
            MOV    AH,9
            INT    21H
            MOV    AH,4CH
            INT    21H
CODE ENDS
      END BEGIN