     ; ���ý���
     ; ��һ���޷����ֽ���ת����10������ʽ��ʾ
     ;    ���磺 48H, ��ʾΪ72
     ;    ����˼�룺 չת�����ֱ����Ϊ0
     ; ���еĹؼ��֣��޷���        ��ȷ����ʹ���޷��ų���ָ�
     ;               �ֽ�����      ��ȷ���˲����ֽ����㣩
     ;     �ڶ���������ʱ��һ���ֽ��������ֵֻ��3λ��
.386
DATA  SEGMENT USE16
BUF     DB 5        ; (48H ==72)  (-1 ==> 255)
OUTPUT DB 3 DUP(?),0DH,0AH,'$'

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
     
     LEA DX,OUTPUT
     ADD DX,3
     SUB DX,CX
     MOV AH,9
     INT 21H
     MOV AH,4CH
     INT 21H
CODE ENDS
     END BEGIN

