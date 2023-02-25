.386
DATA SEGMENT
    PROC DB 'MOV AX,DATA',0DH,0AH,'MOV DS,AX',0DH,0AH,
         DB 'MOV AX,0',0DH,0AH
         DB 'MOV BX,2',0DH,0AH,'LEA SI,MMOV',0DH,0AH,
         DB 'ADD AX,BX',0DH,0AH,'MOV MOMOV[SI],AX',0DH,0AH,1AH
    NUM  DW 0
DATA ENDS

STACK SEGMENT
          DB 200 DUP(0)
STACK ENDS

CODE SEGMENT
          ASSUME CS:CODE,DS:DATA,SS:STACK
    BEGIN:MOV    AX,DATA
          MOV    DS,AX
          XOR    AX,AX
          LEA    BX,PROC
    LOOPA:CMP    DS:[BX],1AH
          JE     EXIT
          CMP    BYTE PTR DS:[BX],'M'
          JNE    NEXT
          CMP    WORD PTR DS:[BX+1],'VO'
          JNE    NEXT
          INC    AX
    NEXT: ADD    BX,2
          JMP    LOOPA
    EIXT: MOV    AH,4CH
          INT    21H
CODE ENDS