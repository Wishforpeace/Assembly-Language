;  �ṹ ��ʹ��  ���߼��÷���
;              c4_s_k1.asm  �������÷���

;  ��һ���Ĵ���(BX,SI,DI,BP) ָ��һ���ṹ�����Ŀ�ʼ��ַ 

;  ���ܣ����㼸��ѧ�����ܳɼ�
;    
.386    
data segment USE16
               student struc
      xingming db      '0000'
      english  dw      0
      math     dw      0
      chinese  dw      0
      total    dw      0
student ends
               s1      student  <'s001',90,100,110,0>
               s2      student  <'s002',95,105,115,0>
               s3      student  <'s003',85,95,105,0>
data ends

stack segment  USE16 stack
            db 200 dup(0)
stack ends

code segment USE16
            assume cs:code ,ds:data,ss:stack
      start:
            mov    ax, data
            mov    ds, ax
    
            mov    cx, 3
            mov    bx, offset s1
      L1:   
      ; ������� [bx] ָ���ѧ�����ܳɼ�
            xor    ax, ax                         ; (ax)���ڱ����ܳɼ�
            add    ax, [bx].english               ;  add ax , [bx+0004]
            add    ax, [bx].math                  ;  add ax , [bx+0006]
            add    ax, [bx].chinese               ;  add ax , [bx+0008]
            mov    [bx].total, ax                 ;  mov [bx+000A], ax

            add    bp, 12                         ;  ׼��������һ���˵ĳɼ�
            LOOP   L1

            mov    ah,4ch
            int    21h
code ends
      end start

; ע�⣺��������� bx ��Ϊbp, �������ȷ��[bp] Ĭ�ϵ��Ƕ�ջ��





