.386 
DATA SEGMENT USE16
    INPUT DB 'PLEASE INPUT X(0~9):$'
    TAB0  DB '   zero$'
    TAB1  DB '  first$'
    TAB2  DB '    two$'
    TAB3  DB '  three$'
    TAB4  DB '   four$'
    TAB5  DB '   five$'
    TAB6  DB '    six$'
    TAB7  DB '  seven$'
    TAB8  DB '  eight$'
    TAB9  DB '   nine$'
    ERROR DB '  error$'
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

          CMP    BL,0
          JL     EXIT

          CMP    BL,9
          JG     EXIT
	
          LEA    DX,CRLF
          MOV    AH,9
          INT    21H
	
          LEA    DX,TAB0[EBX*8]
          MOV    AH,9
          INT    21H
          MOV    AH,4CH
          INT    21H
    EXIT: 
          MOV    DX,OFFSET ERROR
          MOV    AH,9
          INT    21H
          MOV    AH,4CH
          INT    21H
CODE ENDS
	END BEGIN
