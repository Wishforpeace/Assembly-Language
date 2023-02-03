.386
DATA SEGMENT
    BUF  DB 'add ax,bx',0DH,0AH
         DB 'sub cx,10',0DH,0AH
         DB 'mov dx,1234h',0DH,0AH,'$'
DATA ENDS

STACK SEGMENT
          DB 200 DUP(0)
STACK ENDS

CODE SEGMENT
           ASSUME DS:DATA,CS:CODE,SS:STACK
    BEGIN: MOV    AX,DATA
           MOV    DS,AX
           LEA    BX,BUF
    LOOPA: MOV    DL,DS:[BX]
           CMP    DL,'$'
           JE     EXIT
           CMP    DL,'a'
           JB     OUTPUT
           CMP    DL,'z'
           JA     OUTPUT
           SUB    DL,20H
    OUTPUT:MOV    AH,2
           INT    21H
           INC    BX
           JMP    LOOPA
    EXIT:  MOV    AH,4CH
           INT    21H
CODE ENDS
    END BEGIN