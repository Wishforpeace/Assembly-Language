.386
DATA SEGMENT USE16
    BUF1 DB 30H,10H,40H,20H,50H,70H,60H,90H,80H,0,0FFH
    N1   =  $ -BUF1                                            ;BUF1的长度
    BUF2 DB 22H,11H,33H,55H,44H,77H,66H,99H,88H,011H,0EEH,0
    N2   =  $-BUF2
DATA ENDS



CODE SEGMENT USE16
          ASSUME CS:CODE,DS:DATA

    BEGIN:

          MOV    AX,DATA
          MOV    DS,AX

          LEA    BX,BUF1

          MOV    CX,N1
          CALL   FAR PTR SORT

          lEA    BX,BUF2
          MOV    CX,N2
          CALL   FAR PTR SORT
          MOV    AH,4CH
SORT PROC  FAR
          PUSH   AX
          PUSH   DX
          PUSH   SI
          PUSH   DI
                      
          MOV    DX, CX
          DEC    DX

          MOV    SI, 0
    LOP1: 
          MOV    AL, [BX+SI]
          MOV    DI, SI
          INC    DI
    LOP2: CMP    AL, [BX+DI]
          JBE    NEXT
          XCHG   [BX+DI],  AL
          MOV    [BX+SI],  AL
    NEXT: INC    DI
          CMP    DI, CX
          JB     LOP2

          INC    SI
          CMP    SI, DX
          JB     LOP1
          POP    DI
          POP    SI
          POP    DX
          POP    AX
          RET
SORT ENDP

CODE ENDS
    END BEGIN