;  书  P139 示例
;  在第六章对该例进行修改，使用简化段定义 和函数调用

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
      MOV  CX,  N      ; 待转换的二进制数个数
      LEA  DI,  BUFB
      