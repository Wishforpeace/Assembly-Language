
; �� c4_108_1.asm ������ʾ������ֵ�Ĺ���
.386
STACK SEGMENT USE16  STACK
            DB 200 DUP(0)
STACK ENDS

DATA SEGMENT  USE16
      INPUT  DB 'Please input x (0...9) : $'
      TAB    DW 0,1,8,27,64,125,216,343,512,729
      OUTPUT DB '  0$' , '  1$' , '  8$' , ' 27$' , ' 64$'
             DB '125$' , '216$' , '343$' , '512$' , '729$'
      ; ������ʾ��Ϣ��ÿ����������ռ4���ֽ�
      XXX    DW ?
      INERR  DB 0DH,0AH,'INPUT ERROR! $'
DATA ENDS

CODE SEGMENT  USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK
      BEGIN:
            MOV    AX, DATA
            MOV    DS, AX
            MOV    DX, OFFSET INPUT
            MOV    AH, 9
            INT    21H
            MOV    AH ,1
            INT    21H

            CMP    AL,  '0'                      ; �ж������Ƿ�Ϸ�
            JB     LERR
            CMP    AL, '9'
            JA     LERR

            AND    AL, 0FH                       ; ������
            MOV    BL, AL
            MOV    BH, 0
            SHL    BX,2


            LEA    DX, OUTPUT[BX]                ;  ���ָ��  LEA DX,OUTPUT       ADD DX,  BX
            MOV    AH, 9
            INT    21H
            JMP    EXIT

      LERR:                                      ; ��ʾ���������Ϣ
            LEA    DX, INERR
            MOV    AH, 9
            INT    21H

      EXIT: MOV    AH, 4CH
            INT    21H
CODE ENDS

       END  BEGIN
