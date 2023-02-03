.386

DATA SEGMENT USE 16
    BUF  DW -5,100,32767,-32768,-1,15,-4,-9,200,0,300
    N    =  ($-BUF)/2                                    ;BUF中数据个数
    BUF1 DW N DUP(?)
    BUF2 DW N DUP(?)
DATA ENDS

CODE SEGMENT
          ASSUME DATA:DS,CODE:CS
    BEGIN:MOV    AX,DATA
          MOV    DS,AX
          LEA    BX,BUF
          LEA    DI,BUF1
          LEA    SI,BUF2
          MOV    CX,N
    LOOPA:MOV    AX,DS:[BX]
          JGE    LOOPB
          MOV    WORD PTR DS:[SI],AX
          ADD    SI,2
          JMP    NEXT
    LOOPB:MOV    WORD PTR DS:[DI],AX
          ADD    DI,2
    NEXT: ADD    BX,2
          DEC    CX
          JNZ    LOOPA
          MOV    AX,4CH
          INT    21H
CODE ENDS
    END BEGIN