;  ��  P139 ʾ��
;  �ڵ����¶Ը��������޸ģ�ʹ�ü򻯶ζ��� �ͺ�������

.386
DATA  SEGMENT  USE16
BUFA  DB  15 DUP(0)
BUFB  DD  400000000,4096,18,0F1234567
N = ($ - BUFB)/4
DATA  ENDS

STACK SEGMENT  USE16 STACK
      DB  200 DUP(0)
STACK ENDS

CODE  SEGMENT USE16
      ASSUME  CS:CODE,DS:DATA,SS:STACK
BEGIN:
      MOV  AX,  DATA
      MOV  DS,  AX
      MOV  CX,  N      ; ��ת���Ķ�����������
      LEA  DI,  BUFB
      