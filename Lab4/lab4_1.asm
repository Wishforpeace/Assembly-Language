.386
DATA SEGMENT USE16
    MESS    DB 'INPUT SOME NUMBER PLEASE:$'
    OUTMESS DB 'THE NUMBER AFTER CONVERT:$'
    BUF     DB 15 DUP(0)                       ;子程序F10T16使用的缓冲区
    BUFA    DB 6, 7 DUP(0)
    CRLF    DB 0DH,0AH,'$'
DATA ENDS

STACK SEGMENT USE16 STACK
          DB 200 DUP(0)
STACK ENDS

CODE SEGMENT
          ASSUME CS:CODE,DS:DATA,SS:STACK
    BEGIN:MOV    AX,DATA
          MOV    DS,AX
    ;输出信息
          LEA    DX , MESS
          MOV    AH,09H
          INT    21H
          LEA    DX,CRLF
          MOV    AH,09H
          INT    21H
    ;输入数字
          LEA    DX,BUFA
          MOV    AH,10
          INT    21H
          LEA    SI,BUFA+2                   ;将BUFA中的数据存入SI

    ;输出信息
          LEA    DX,OUTMESS
          MOV    AH,09H
          INT    21H
    LOOPA:MOV    EAX,[DI]
          MOV    EBX,16
          LEA    SI,BUF
          CALL   RADIX
          MOV    BYTE PTR [SI],'H'
          MOV    BYTE PTR [SI+1],0AH
          MOV    BYTE PTR [SI+2],0DH
          MOV    BYTE PTR [SI+3],'$'
          LEA    DX,BUF
          MOV    AH,9
          INT    21H
          ADD    DI,4
          LOOP   LOOPA
          MOV    AH,4CH
          INT    21H

RADIX PROC
          PUSH   CX
          PUSH   EDX
          XOR    CX,CX
    LOP1: XOR    EDX,EDX
          DIV    EBX                         ;EBX中存入16
          PUSH   DX                          ;将除得结果入栈
          INC    CX                          ;栈内数+1
          OR     EAX,EAX                     ;判断EAX中的数是否为0
          JNZ    LOP1                        ;如果不为0，继续循环
    LOP2: POP    AX                          ;将压栈数据弹出
          ADD    AL,7                        ;因为转16进制，所以找到对应ASCII码
    L1:   ADD    AL,30H
          MOV    [SI],AL                     ;存入BUF
          INC    SI                          ;指向下一个单元
          LOOP   LOP2                        ;循环弹出，直到cx内为0
          POP    EDX
          POP    CX
          RET                                ;恢复现场
RADIX ENDP
CODE ENDS
    END BEGIN