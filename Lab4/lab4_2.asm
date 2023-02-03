.386
DATA SEGMENT USE16
    BUF    DB '111111111',0DH,0AH
           DB '222222',0DH,0AH
           DB '333333333',0DH,0AH
           DB '4444444444',0DH,0AH
           DB '5555555',0DH,0AH
           DB 'AAAAAAAAAA',0DH,0AH,0
    STRING DB 0DH,0AH,'AFTER***********************',0DH,0AH,'$'
    N      =  5
DATA ENDS
STACK SEGMENT USE16 STACK
          DB 200 DUP(0)
STACK ENDS
CODE SEGMENT USE16
           ASSUME DS:DATA,SS:STACK,CS:CODE
    BEGIN: 
           MOV    AX,DATA
           MOV    DS,AX
           LEA    SI,BUF
    LOPA:  
           MOV    DL,[SI]
           CMP    DL,0
           JE     LOPB
           MOV    AH,2
           INT    21H
           INC    SI
           JMP    LOPA
    LOPB:  
           LEA    DX,STRING
           MOV    AH,9
           INT    21H

           LEA    SI,BUF-1
           MOV    CX,N-1
           CMP    CX,0
           JE     NEXTB

    NEXTA: 
           INC    SI
           CMP    BYTE PTR [SI],0AH
           JNE    NEXTA
           LOOP   NEXTA

    NEXTB: 
           MOV    DI,SI

    NEXTC: 
           INC    SI
           CMP    BYTE PTR [SI],0AH
           JNE    NEXTC

    NEXTD: 
           INC    SI
           INC    DI
           MOV    AL,[SI]
           MOV    [DI],AL
           CMP    AL,0
           JNE    NEXTD
        
           LEA    SI,BUF
    OUTPUT:
           MOV    DL,[SI]
           OR     DL,DL
           JZ     EXIT
           MOV    AH,2
           INT    21H
           INC    SI
           JMP    OUTPUT
    EXIT:  
           MOV    AH,4CH
           INT    21H
CODE ENDS
    END BEGIN
        