;  �ṹ ��ʹ��  ���߼��÷���
;              c4_s_k1.asm  �������÷���
;              c4_s_k2.asm  ���߼��÷���


;  ���ܣ�����100��ѧ�����ܳɼ�
;     
.386   
data segment USE16
               student  struc
      xingming db       '0000'
      english  dw       0
      math     dw       0
      chinese  dw       0
      total    dw       0
student ends
               students student 100 dup(<>)
data ends

stack segment  USE16 stack
            db 200 dup(0)
stack ends

code segment USE16
            assume cs:code ,ds:data,ss:stack
      start:
            mov    ax, data
            mov    ds, ax

            mov    bx, offset students

            mov    [bx].english, 100
            mov    [bx].math, 100
            mov    [bx].chinese ,100

      ; ����һ��ѧ�������� 'abcd'
      ; ���û�ַ�ӱ�ַ�ķ�ʽ
            mov    SI, 0
            mov    al, 'a'
            mov    cx,4
      L1:   
            mov    [bx].xingming[SI] , AL
            INC    SI
            INC    AL
            LOOP   L1

            mov    ah,4ch
            int    21h
code ends
      end start

; ע�⣺Ѱַ��ʽ





