.386
DATA SEGMENT
      INPUT  DB 'PLEASES INPUT A NUMB(0~9):$'
      OUTPUT DB '  0$' , '  1$' , '  8$' , ' 27$' , ' 64$'
             DB '125$' , '216$' , '343$' , '512$' , '729$'
      ERROR  DB 0DH,0AH,'INPUT ERROR!$'
      X      DB ?
      XXX    DB ?
DATA ENDS

STACK SEGMENT
            DB 200 DUP(0)
STACK ENDS

CODE SEGMENT
            ASSUME DS:DATA,SS:STACK,CS:CODE
      BEGIN:MOV    AX,DATA
            MOV    DS,AX
            MOV    DX,OFFSET INPUT
            MOV    AH,9
            INT    21H
            MOV    AH,1
            INT    21H
            MOV    X,AL
            CMP    X,'0'
            JB     ERR
            CMP    X ,'9'
            JG     ERR
            SUB    X,30H
            XOR    BX,BX
            MOV    BL,X
            SHL    BL,2
            MOV    DX,OFFSET OUTPUT[BX]
            MOV    AH,9
            INT    21H
            MOV    AH,4CH
            INT    21H
      ERR:  MOV    DX,OFFSET ERROR
            MOV    AH,9
            INT    21H


CODE ENDS
      END BEGIN