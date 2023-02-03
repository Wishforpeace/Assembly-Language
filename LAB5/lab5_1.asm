.386
STACK SEGMENT  USE16 STACK
          DB 200 DUP(0)
STACK ENDS

DATA SEGMENT USE16
    MSG    DB 'Please Input a number from 1 to 9: $'
    OUTPUT DB 0DH,0AH,'Factoria is : '
    RESULT DB 6 DUP (' '),'$'
    ERROR  DB 0DH,0AH,'ERROR ! $'
DATA ENDS

CODE SEGMENT USE16
                   ASSUME CS:CODE,DS:DATA,SS:STACK
    START:         
                   MOV    AX,DATA
                   MOV    DS,AX
                   LEA    DX,MSG
    ;9号调用
                   MOV    AH,9
                   INT    21H
     
                   MOV    AH,1                        ; 输入一个字符
                   INT    21H

                   CMP    AL,'1'                      ;低八位与1进行比较
                   JB     ERROR_HANDLING              ;小于1，跳转到错误处理
                   CMP    AL,'9'                      ;低8位与9进行比较
                   JA     ERROR_HANDLING              ;如果大于9

                   SUB    AL,30H                      ;除去ASCII码
                   MOV    BL,AL
                   MOV    BH,0                        ; BX 为待求阶乘 的数
    ; 结果在 (DX,AX)中
                   CALL   FACTORIA

                   call   CONVERT                     ; (DX,AX)  -> result 缓冲区中

                   LEA    DX, OUTPUT
                   MOV    AH, 9
                   INT    21H
                   MOV    AH,4CH
                   INT    21H

    ERROR_HANDLING:
                   LEA    DX, ERROR
                   MOV    AH,9
                   INT    21H
    ; BX  中的数为 待求阶乘的 数
FACTORIA PROC
                   CMP    BX,1
                   JG     L1
                   MOV    AX,1
                   MOV    DX,0
                   RET
    L1:            DEC    BX
                   CALL   FACTORIA
                   INC    BX
                   MUL    BX
                   RET
FACTORIA ENDP

    ; 将 (DX,AX) 中的内容，转换成十进制数串
    ;不断除十，获得、
CONVERT PROC
                   MOV    BX, 10
    ;result的最后一位偏移地址
                   LEA    SI, RESULT+5
    L2:            DIV    BX
                   ADD    DL,30H
                   MOV    [SI],DL
    ;从后往前，存入result
                   DEC    SI
                   CMP    AX, 0
                   JZ     F_EXIT
                   MOV    DX,0
                   JMP    L2
    F_EXIT:        
                   RET
CONVERT ENDP

CODE ENDS
     END START

