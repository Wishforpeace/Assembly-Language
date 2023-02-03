DATA SEGMENT
      TEXT1 DB '96541833209881'
      TEXT2 DB 14 DUP(?)
DATA ENDS
STACK SEGMENT
STACK ENDS
CODE SEGMENT
            ASSUME CS:CODE,DS:DATA,SS:STACK
      START:
            MOV    BX,0                          ;字符串数组下标
            MOV    CX,14
      NEXT: 
            MOV    AX, DATA
            MOV    DS, AX
            MOV    AL,TEXT1[BX]
            ADD    AL,'A'-'0'
            MOV    TEXT2[BX],AL                  ;将AL存入到空白字符串中
            INC    BX                            ;下标+1
            LOOP   NEXT
            MOV    AH,4CH
            INT    21H
CODE ENDS
    END START




