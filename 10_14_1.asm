.386 
DATA SEGMENT USE16
	INPUT DB 'PLEASE INPUT X(0~9):$'
	TAB   DB '000$'
	ATAB  DB '001$'
	BTAB  DB '008$'
	XTAB  DB '027$'
	CTAB  DB '064$'
	DTAB  DB '125$'
	ETAB  DB '216$'
	FTAB  DB '343$'
	GTAB  DB '512$'
	HTAB  DB '729$'
	X     DB ?
	CRLF  DB 0AH,0DH,'$'
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
	
	      MOV    AH,1
	      INT    21H
	
	      AND    AL,0FH
	      MOV    X,AL
	      XOR    EBX,EBX
	      MOV    BL,AL
	
	      LEA    DX,CRLF
	      MOV    AH,9
	      INT    21H
	
	      LEA    DX,TAB[EBX*4]
	      MOV    AH,9
	      INT    21H
	      MOV    AH,4CH
	      INT    21H
CODE ENDS
	END BEGIN

