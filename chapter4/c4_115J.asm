
 ; 1. ���� LOOP ָ��Ա�־λ��Ӱ��
 ; 2. �ж���BUFΪ��ַ��10���ֽ����Ƿ��з�0�ֽ�
 ; 3. �ж���STRΪ��ַ��10���ֽڵĴ����Ƿ���'�ո�'
 .386
 STACK  SEGMENT USE16  STACK
       DB  200 DUP(0)
 STACK  ENDS
 
 DATA   SEGMENT  USE16
 BUF    DB  0,0,0,0,1,0,0,0,2,0,5,6
 MSG    DB  'VERY GOOD  '
 DATA   ENDS

 CODE   SEGMENT  USE16
       ASSUME  CS:CODE,DS:DATA,SS:STACK
 BEGIN:
       MOV  AX, DATA
       MOV  DS, AX      
       MOV  CX, 5
       MOV  AX, 0
 L1:   ADD  AX, CX
       DEC  CX
       JNZ  L1

       MOV  CX, 5     ; �۲�ִ�д����ǰ�� ZF
       MOV  AX, 0
 L2:   ADD  AX, CX
       LOOP L2        ; �۲�ִ�д������ ZF

                      ; ������2
       MOV  BX, OFFSET  BUF -1
       MOV  CX, 10
 L3:   INC  BX
       CMP  BYTE PTR[BX], 0
       LOOPE L3
       MOV  AH, [BX]    ;  �۲�[BX]ָ���������ZF

                      ; ������3
       MOV  BX, OFFSET  MSG -1
       MOV  CX, 10
 L4:   INC  BX
       CMP  BYTE PTR[BX], ' '
       LOOPNE L4
       MOV  AH, [BX]    ;  �۲�[BX]ָ���������ZF

       MOV  AH, 4CH
       INT  21H
CODE   ENDS

       END  BEGIN
