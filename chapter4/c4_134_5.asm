;  (1) �������ݷֱ��������
;  (2) ���ӳ���д����һ������
;  (3) �۲�  ִ��CALL ָ��ʱ����ջ�ı仯��CS, IP�ı仯
;  (4) �۲�ִ�С�RETָ���ջ�ı仯
;��(5) �۲�����ǰ����������仯

;  CX ���ݸ���  (�� 0 ...... N-1 ֮��� N��������)
;  BX ���ݵ��׵�ַ  
.386
SUB_PROGRAM  SGEMENT USE16 
      ASSUME CS:SUB_PROGRAM
SORT  PROC  FAR
      PUSH  AX
      PUSH  DX
      PUSH  SI
      PUSH  DI
                      
      MOV   DX, CX ;�������鳤��
      DEC   DX      ;���鳤�ȼ�1

      MOV   SI, 0 
LOPI: 
      MOV   AL, [BX+SI] ;����������������BX��BUF1�ı��˵�ַ
      MOV   DI, SI      
      INC   DI          
LOPJ: CMP   AL, [BX+DI] 
      JBE   NEXT
      XCHG  [BX+DI], AL
      MOV   [BX+SI], AL
NEXT: INC   DI          
      CMP   DI, CX      
      JB    LOPJ   ;   ��ѭ�� ����ָ��ڶ�������ָ�� С�� (CX) ʱ

      INC   SI    
      CMP   SI, DX      
      JB    LOPI  
      
      POP   DI    
      POP   SI    
      POP   DX
      POP   AX
      RET
SORT  ENDP
SUB_PROGRAM ENDS

STACK SEGMENT   USE16 STACK
            DB 50 DUP(0)
STACK ENDS

DATA SEGMENT USE16
      BUF1 DB 30H,10H,40H,20H,50H,70H,60H,90H,80H,0,0FFH
      N1   =  $-BUF1
      BUF2 DB 22H,11H,33H,55H,44H,77H,66H,99H,88H,0AAH,0EEH,0
      N2= $ - BUF2
DATA ENDS

CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA,SS:STACK
      BEGIN:
            MOV    AX, DATA
            MOV    DS, AX
            LEA    BX, BUF1
            MOV    CX, N1                        ;��һ������
            CALL   FAR PTR SORT
            LEA    BX, BUF2
            MOV    CX, N2
            CALL   FAR PTR SORT
            MOV    AH,4CH
            INT    21H
CODE ENDS
     END  BEGIN
