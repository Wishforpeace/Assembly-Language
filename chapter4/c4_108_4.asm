     ; ������ת��ָ�չʾJMP ���÷� ������
     ; �����ŵ�ַ�б�
     ; ���ڲ�ͬ�����룬������ͬ�Ļ�Ӧ
     ; ִ�в�ͬ�ĳ����
     ;       ��Ծ��
     ;       ���������� CASE���
.386
DATA SEGMENT USE16
     MSG     DB ' 1  :   DIR',0DH,0AH
             DB ' 2  :   COPY',0DH,0AH
             DB ' 3  :   RENAME',0DH,0AH
             DB '        OTHER',0DH,0AH,'$'

     MSG1    DB ' here is the program, DIR',0DH,0AH,'$'
     MSG2    DB ' program   COPY',0DH,0AH,'$'
     MSG3    DB ' RENAME',0DH,0AH,'$'
     MSG4    DB ' ERROR COMMAND ',0DH,0AH,'$'

     STAMENT DW LABLE1,LABLE2,LABLE3,LABLE4
DATA ENDS

STACK SEGMENT USE16 STACK
           DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK
     BEGIN: 
            MOV    AX,DATA
            MOV    DS,AX
            LEA    DX,MSG
            MOV    AH,9
            INT    21H
            MOV    AH,1
            INT    21H

            MOV    BX, 3
            CMP    AL,'1'
            JB     L1                           ;  ����� '1' С
            CMP    AL,'3'
            JA     L1                           ;  ����� '3' ��

            MOV    BL,AL
            SUB    BL,31H                       ; '1' --> 0,  '2'-->1 ,  '3'-->2
            MOV    BH,0                         ; ��������ֵĶ�������ʽ�� BX��

     L1:    SHL    BX,1                         ; (bx) *2 , һ����ַ��ռ�����ֽ�

            JMP    STAMENT[BX]                  ; �ӱ���ȡ��ַ, ת����ͬ�ĵط�ִ�г���

     BACK:  
            MOV    AH,4CH
            INT    21H

     LABLE1:                                    ; һ�������
            LEA    DX,MSG1
            MOV    AH,9
            INT    21H
            JMP    BACK

     LABLE2:                                    ; һ�������
            LEA    DX,MSG2
            MOV    AH,9
            INT    21H
            JMP    BACK

     LABLE3:
            LEA    DX,MSG3
            MOV    AH,9
            INT    21H
            JMP    BACK

     LABLE4:
            LEA    DX,MSG4
            MOV    AH,9
            INT    21H
            JMP    BACK

CODE ENDS
     END BEGIN

