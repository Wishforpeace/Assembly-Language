;  �ṹ���� ��ʹ��   <�����÷�>

;  �����ʽ
;      �ṹ��  STRUC
;             <���ݶ����������>
;      �ṹ��  ENDS
;              ����<���ݶ������>����ı����� Ҳ�ƽṹ�ֶ���

;  STRUC α����ֻ������һ�ֽṹģʽ����������洢��Ԫ��
;  ����ṹ���͵����ݴ洢��ʱ���������¸�ʽ��

;      ������  �ṹ��   �ֶ�ֵ��

;  �ֶ�ֵ�����ʽΪ <ֵ1,ֵ2,...,ֵn>
;      ���� ֵ1�ͽṹ�еĵ�һ���ֶ�����Ӧ��ֵn�͵�n���ֶ�����Ӧ��
;      ��� ĳһ��ֵ ��ʹ�� ����ṹʱԤ�õĸ��ֶε�ֵ�����ʡ�ԡ�
;      �� "," ����ʡ�ԡ�
;  �ر�ǿ�����������ṹʱ��һ���ֶ����ж��ֵ�����ڶ���ṹ����ʱ��
;            �ֶ�ֵ���еĶ�Ӧ�����ʡ�ԣ�����������ֵ������

;  �ڷ���ʱ��һ��Ҳֻ�ܷ��� �ṹ�����е�ĳһ�ֶΡ�
;      ĳһ���ֶε���Ч��ַΪ��  ������.�ֶ���

; �ṹ�����е�һЩ˵��
;     (1) Ϊʲô��һ���ֶ�û�н� name,��ȡ��Ϊ xingming����Ϊ name��һ���ؼ���
;     (2) ������ �ĸ��ֽڵĴ���д�� '0000', ��ʾ��һ��ֵ��
;             �� s1 �Ķ����� �� 's001' ��ʾʵ�ʵ�ֵ��
;         ���� �á� 4 dup ('0') ��������'0000', Ҳ������ '0','0','0','0' �����档
;         ���Ƕ���ʾһ���ֶκ��� 4 ��ֵ���ڶ������ʱ���ͱ���ȱʡ���ֶ�
;         ������� ������Ϣ�� Field cannot be overridden
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
data ends

stack segment  USE16 stack
            db 200 dup(0)
stack ends

code segment USE16
            assume cs:code ,ds:data,ss:stack
      start:
            mov    ax, data
            mov    ds, ax
      ; ������� s1 ���ܳɼ�
            xor    ax, ax                         ; (ax)���ڱ����ܳɼ�
            add    ax, s1.english                 ;  add ax , [0004]
            add    ax, s1.math                    ;  add ax , [0006]
            add    ax, s1.chinese                 ;  add ax , [0008]
            mov    s1.total, ax                   ;  mov [000A], ax
      ; ������� s2 ���ܳɼ�
            xor    ax, ax
            add    ax, s2.english                 ;  add ax, [0010]
      ;  s2 ��offsetΪ 0ch, �����ڿ��ĸ��ֽڵ�xingming
            add    ax, s2.math
            add    ax, s2.chinese
            mov    s2.total, ax
    
            mov    ah,4ch
            int    21h
code ends
      end start






