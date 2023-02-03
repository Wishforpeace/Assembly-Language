.386 
DATA SEGMENT USE16
      INPUT  DB 'PLEASE INPUT X(0~9):$'
      OUTPUT DB 'INPUT ERROR!$'
      TAB0   DB '000$'
      TAB1   DB '001$'
      TAB2   DB '008$'
      TAB3   DB '027$'
      TAB4   DB '064$'
      TAB5   DB '125$'
      TAB6   DB '216$'
      TAB7   DB '343$'
      TAB8   DB '512$'
      TAB9   DB '729$'
      X      DB ?
      CRLF   DB 0AH,0DH,'$'
DATA ENDS
STACK SEGMENT USE16 STACK
            DB 200 DUP(0)
STACK ENDS
CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK
      BEGIN:MOV    AX,DATA
            MOV    DS,AX
            MOV    DX,OFFSET INPUT
            MOV    AH,9
            INT    21H
      ;1号调用输入
            MOV    AH,1
            INT    21H
      ;除去ASCII码
            AND    AL,0FH
            MOV    X,AL
            XOR    EBX,EBX
            MOV    BL,AL
            CMP    BL, 0
            JL     EXIT
            CMP    BL,9
            JG     EXIT
      ;换行回车
            LEA    DX,CRLF
            MOV    AH,9
            INT    21H

            LEA    DX,TAB0[EBX*4]
            MOV    AH,9
            INT    21H
            MOV    AH,4CH
            INT    21H
      EXIT: 
            MOV    DX,OFFSET OUTPUT
            MOV    AH,9
            INT    21H
            MOV    AH,4CH
            INT    21H
CODE ENDS
	END BEGIN

