     ; ���ý���
     ; ��һ���з����ֽ���ת����10������ʽ��ʾ
     ;    ���磺 48H, ��ʾΪ72
     ;    ����˼�룺 չת�����ֱ����Ϊ0
     ; ���еĹؼ��֣��з���        ��ȷ����ʹ��	���ų���ָ�
     ;               �ֽ�����      ��ȷ���˲����ֽ����㣩
     ;     �ڶ���������ʱ��һ���ֽ��������ֵֻ��3λ��
     ; ע���� xu_2_10.asm ������
     ;         (9cH => -100 not 156)
     ;         (255 => -1 )
.386
DATA  SEGMENT USE16
BUF     DB 255        
SIGN    DB ' '
OUTPUT  DB 3 DUP(' '),0DH,0AH,'$'
DATA  ENDS

STACK SEGMENT USE16 STACK
      DB 200 DUP(0)
STACK ENDS

CODE SEGMENT USE16
     ASSUME DS:DATA,CS:CODE,SS:STACK
BEGIN:
     MOV AX,DATA
     MOV DS,AX
     MOV AL,BUF
                   ; ���������ĸ���䣬��ʾ�Ը�������     
     TEST AL,80H
     JZ   L0
     MOV  SIGN,'-'
     NEG  AL

L0:
     MOV SI,OFFSET OUTPUT+2
     MOV CX,0
     MOV BL,10
L1:
     MOV AH,0
     DIV BL
     ADD AH,30H
     MOV [SI],AH
     INC CX
     DEC SI
     CMP AL,0
     JNE L1
     
     LEA DX,SIGN
  ;   ADD DX,3       ; ����ԭ���ĳ�������ǰ������пո�
  ;   SUB DX,CX
     MOV AH,9
     INT 21H
     MOV AH,4CH
     INT 21H
CODE ENDS
     END BEGIN

