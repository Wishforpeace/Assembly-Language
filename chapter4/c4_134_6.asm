; 输入数字串, 转换成 BCD 码
.386
STACK SEGMENT USE16 STACK
             DB 50 DUP(0)
STACK ENDS
DATA SEGMENT USE16
       BUF    DB 'PLEASE INPUT STRING (0..9):$'
       ASCBUF DB 11
              DB ?
              DB 11 DUP(?)
       BCDBUF DB 10 DUP(0)
DATA ENDS
CODE SEGMENT USE16
             ASSUME CS:CODE,DS:DATA,SS:STACK

ATBC PROC
             PUSH   AX
             ADD    BX, CX
       LOPA: DEC    BX                             ;从最后一个字符开始
             MOV    AL,[BX]                        ;将字符存入
             AND    AL,0FH
             MOV    [SI], AL
             LOOP   LOPA
             POP    AX
             RET
ATBC ENDP

       BEGIN:MOV    AX, DATA
             MOV    DS, AX
             LEA    DX, BUF
             MOV    AH,9
             INT    21H
             LEA    DX, ASCBUF
             MOV    AH,10
             INT    21H
             LEA    BX, ASCBUF+2                   ;存放字符的偏移地址
             MOV    CL, [BX-1]                     ;字符实际长度
             MOV    CH, 0
             LEA    SI, BCDBUF
             CALL   ATBC
             MOV    AH,4CH
             INT    21H
CODE ENDS
       END  BEGIN

 