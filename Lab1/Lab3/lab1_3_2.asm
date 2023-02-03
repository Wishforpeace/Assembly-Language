DATA SEGMENT
    TEXT1 DB 'JJBDAHCFFGA'
    TEXT2 DB 11 DUP(?)
DATA ENDS
STACK SEGMENT
STACK ENDS
CODE SEGMENT
          ASSUME DS:DATA,CS:CODE,SS:STACK
    START:
          MOV    AX, DATA
          MOV    DS, AX
          MOV    BX,0
          MOV    CX,11
    NEXT: 
          MOV    AL,TEXT1[BX]
          SUB    AL,'A'-'0'
          MOV    TEXT2[BX],AL
          INC    BX
          LOOP   NEXT
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END START