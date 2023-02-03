.386
DATA SEGMENT USE16
    X      DD 36895471
    MESS   DB 0DH, 0AH, 'The X in hexdecimal is : $'
    HEXTAB DB '0123456789ABCDEF'
DATA ENDS


STACK SEGMENT USE16
          DB 200 DUP(0)
STACK ENDS


CODE SEGMENT USE16
          ASSUME CS:CODE,SS:STACK,DS:DATA
    BEGIN:MOV    AX,DATA
          MOV    DS,AX
          MOV    DX,OFFSET MESS
          MOV    AH,09H
          INT    21H
          MOV    EAX,X
          MOV    BX,HEXTAB
          MOV    CX,8
    AGAIN:ROL    EAX,4
          AND    AL,0FH
          XLAT
          MOV    DX,AL
          MOV    AH,2
          INT    21H
          LOOP   AGAIN
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END BEGIN