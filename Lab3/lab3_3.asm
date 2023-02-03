.386

DATA SEGMENT
      MESS    DB 0DH,0AH,'INPUT SOME TEXT PLEASE:$'
      OUTMESS DB 0DH,0AH,'THE TEXT AFTER CONVERT:$'
      BUFFER  DB 80
              DB ?                                       ;长度
              DB 80 DUP(0)
      CRLF    DB 0DH,0AH,'$'
DATA ENDS
CODE SEGMENT USE16
            ASSUME DS:DATA,CS:CODE
      START:
            MOV    AX,DATA
            MOV    DS,AX
      ;输出前置信息
            MOV    DX, OFFSET MESS
            MOV    AH,09H
            INT    21H
            LEA    DX,CRLF
            MOV    AH,9
            INT    21H
      ;输入明文
            MOV    DX,OFFSET BUFFER
            MOV    AH,10
            INT    21H
            MOV    CL,BUFFER+1
            MOV    CH,0
            LEA    BX,BUFFER+2
      ; MOV    BYTE PTR BUFFER+2[BX],'$'
      ; LEA    DX,BUFFER+2
      ; MOV    AH,09H
      ; INT    21H
      ; MOV    AH,4CH
      ; INT    21H
      NEXT: 
            MOV    AL,[BX]
            ADD    AL,'A'-'0'
            MOV    [BX],AL
            INC    BX
            LOOP   NEXT

            MOV    BYTE PTR[BX],'$'
            MOV    DX,OFFSET OUTMESS
            MOV    AH,09H
            INT    21H
            LEA    DX,BUFFER+2
            MOV    AH,09H
            INT    21H
            MOV    AH,4CH
            INT    21H


CODE ENDS
        END START