;设有一个数组 ａｉ（ｉ ＝１， ２， …， １０００）存放在以 Ａ 为起始地址的字存储区中， 现要求将数组加以压缩，
;使其中的非 ０ 元素仍按序存放在 Ａ 存储区中， 而 ０ 元素不再出现。 试用串操作指令编写实现上述功
;能的程序。

.386
DATA SEGMENT USE16
       ARRAY DW 1000 DUP(0)
DATA ENDS

STACK SEGMENT USE16

STACK ENDS

CODE SEGMENT USE16
              ASSUME CS:CODE,SS:STACK,DS:DATA,ES:DATA
       START: 
       ;SI源变址寄存器，DI目的变址寄存器
              MOV    AX,DATA
              MOV    DS,AX                                  ;读取数据
              MOV    ES,AX                                  ;处理后存储
              LEA    DI,ARRAY
              LEA    SI,ARRAY
              MOV    CX,1000
       ;设置分支程序,判断元素是否为0
       FILTER:
              LODSW                                         ;取出的数存入AX
              CMP    AX,0
              JNE    STORE
              LOOP   FILTER
       STORE: 
              STOSW
              LOOP   FILTER
              MOV    AX,4CH
              INT    21H
CODE ENDS
    END START