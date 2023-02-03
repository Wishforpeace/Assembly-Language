.386
DATA SEGMENT
      N      DW 23
      SQUARE DW ?
      OUTPUT DB 'N^2 = $'
DATA ENDS

CODE SEGMENT
            ASSUME CS:CODE,DS:DATA
      START:
            MOV    AX,DATA
            MOV    DS,AX
            MOV    CX,N                 ;累加器
            XOR    AX,AX                ;置零
            MOV    BX,1
      S:    
            ADD    AX,BX                ;AX中存放求和
            ADD    BX,2                 ;将BX在每次循环中加2，达到奇数和
            LOOP   S
            MOV    SQUARE,AX
            MOV    AH,4CH
            INT    21H
CODE ENDS
    END START