DATA SEGMENT
      ARRAY DW 1, 6, 9, 23,12
            DW 54, 23, 15, -92, 37
            DW -99, 231, 76, 81, 90
            DW 33, 67, 81, -99, 0
            DW 123, -52, 77, -180, 89
      SUM   DW ?                           ;存放求和结果
DATA ENDS

STACKS SEGMENT
STACKS ENDS

CODE1 SEGMENT
            ASSUME CS:CODE1,DS:DATA,SS:STACKS
      START:MOV    AX,DATA
            MOV    DS,AX
            MOV    AX,0
            MOV    CX,5                            ;累加寄存器
            MOV    SI,4*2
      s:    ADD    AX,ARRAY[SI]
            ADD    SI,5*2
            LOOP   s
            MOV    SUM,AX
            MOV    AH,4CH
            INT    21H
        
CODE1 ENDS
    END START

CODE2 SEGMENT
            ASSUME CS: CODE2, DS: DATA
      START:MOV    AX, DATA
            MOV    DS, AX
            MOV    AX, 0
            MOV    CX, 5
            MOV    SI, 3*5*2
      NEXT: ADD    AX, ARRAY[SI]
            ADD    SI, 2
            LOOP   NEXT
            MOV    SUM, AX
            MOV    AH, 4CH
            INT    21H
CODE2 ENDS
END START
CODE3 SEGMENT
            ASSUME CS: CODE3, DS: DATA
      START:MOV    AX, DATA
            MOV    DS, AX
            MOV    AX, 0
            MOV    CX, 5
            MOV    SI, 0
      NEXT: ADD    AX, ARRAY[SI]
            ADD    SI, 5*2+2
            LOOP   NEXT
            MOV    SUM, AX
            MOV    AH, 4CH
            INT    21H
CODE3 ENDS
END START
CODE4 SEGMENT
            ASSUME CS: CODE4, DS: DATA
      START:MOV    AX, DATA
            MOV    DS, AX
            MOV    AX, 0
            MOV    CX, 5
            MOV    SI, 4*2
      NEXT: ADD    AX, ARRAY[SI]
            ADD    SI, (5-1)*2
            LOOP   NEXT
            MOV    SUM, AX
            MOV    AH, 4CH
            INT    21H
CODE4 ENDS
END START
