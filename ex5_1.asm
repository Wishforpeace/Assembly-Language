.386
DATA SEGMENT USE16
    STR1  DB  'ABCDEFGHIJKLN'
    COUNT EQU $-STR1             ;STR1长度
    STR2  DB  COUNT DUP(0)
DATA ENDS

STACK SEGMENT USE16 STACK
          DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
          ASSUME DS:DATA,ES:DATA,SS:STACK,CS:CODE
    START:
          MOV    AX,DATA
          MOV    DS,AX
          MOV    ES,AX
          LEA    SI,STR1                             ;STR1首地址送入SI
          LEA    DI,STR2                             ;STR2首地址送入DI
          MOV    CX,COUNT                            ;串长度送入计数寄存器
          CLD                                        ;将DF清零，使用串操作指令之前一定要设置方向标志DF
    ;DF为0,字符串从低地址想高地址处理数据串，反之，高到低
          REP    MOVSB                               ;将字符串STR1重复传送至STR2存储区
    ;重复传送直到CX等于0
          MOV    AH,4CH
          INT    21H
CODE ENDS
    END START