.386

DATA SEGMENT USE16
      INPUT DB 'PLEASE INPUT A NUM(0~9):$'
      ERROR DB 0DH,0AH,'INPUT ERROR!$'
      ONE   DB 0DH,0AH,'one$'
      TWO   DB 0DH,0AH,'two$'
      THREE DB 0DH,0AH,'three$'
      FOUR  DB 0DH,0AH,'four$'
      FIVE  DB 0DH,0AH,'five$'
      SIX   DB 0DH,0AH,'six$'
      SEVEN DB 0DH,0AH,'seven$'
      EIGHT DB 0DH,0AH,'eight$'
      NINE  DB 0DH,0AH,'nine$'
   

      TABLE DW ONE,TWO,THREE,FIVE,SIX,SEVEN,EIGHT,NINE
DATA ENDS


STACK SEGMENT USE16 STACK
            DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
                 ASSUME DS:DATA,CS:CODE,SS:STACK
      BEGIN:     
                 MOV    AX,DATA
                 MOV    DS,AX
                 LEA    DX,INPUT
                 MOV    AH,9
                 INT    21H

                 
                 MOV    AH,1
                 INT    21H

                 CMP    AL,'0'
                 JB     ERRORSOLVE
                 CMP    AL,'9'
                 JA     ERRORSOLVE

                 AND    AL,0FH
                 MOV    BL,AL
                 AND    BX,000FH
                 SHL    BX,1

                 MOV    DX,TABLE[BX]
                 MOV    AH,9
                 INT    21H
                 JMP    EXIT
      
      EXIT:      
                 MOV    AH,4CH
                 INT    21H
      ERRORSOLVE:
                 LEA    DX,ERROR
                 MOV    AH,9
                 INT    21H
                 JMP    EXIT

CODE ENDS
    END BEGIN


