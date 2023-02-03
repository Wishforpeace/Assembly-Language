.386
DATA SEGMENT USE16
      INPUT DB 'PLEASE INPUT X(0-9):$'
      TAB   DW 0,1,8,27,64,125,216,343,512,729
      X     DB ?
      XXX   DW ?
DATA ENDS
STACK SEGMENT USE16 STACK
            DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK

      BEGIN:MOV    AX,DATA
            MOV    DS,AX
      ;显示INPUT
            MOV    DX,OFFSET INPUT
            MOV    AH,9
            INT    21H
      ;1号调用，从键盘接受数据
            MOV    AH,1
            INT    21H
      ;真值存入AL之中，第四位置0
            AND    AL,0FH
      ;将真值存入X之中
            MOV    X,AL
      ;将EBX清零
            XOR    EBX,EBX
      ;将X存入EBX
            MOV    BL,AL
      ;计算三次方
            MOV    AX,TAB[2*EBX]
            MOV    XXX,AX
            MOV    AH,4CH
            INT    21H


CODE ENDS
    END BEGIN