 
;�ӳ���
;��һ�����ݵĺ�

; �漰���������������ݵ���ʼ��ַ�����ݵĸ�������Ž���ĵ�ַ
;     �Ĵ�����
.386
data segment USE16
      array1 dw 1,2,3,4,5,6,7,8,9,10
      nums   dw 10
      sum    dw ?
data ends

stack segment USE16 stack
            db 200 dup(0)
stack ends

code segment USE16
            assume cs:code,ds:data,ss:stack
      start:mov    ax, data
            mov    ds, ax
      
      ;     �Ĵ淨
      ;       ���ݵ���ʼ��ַ ��bx ��
      ;       ���ݵĸ�����   cx��
      ;       ���ؽ����     ax��
            mov    bx, offset array1
            mov    cx, nums

            call   far ptr sum_proc

            mov    sum, ax
            mov    ah, 4ch
            int    21h
code ends

sub_code segment USE16
               assume cs:sub_code
sum_proc proc far
               xor    ax,ax
      L1:      add    ax, [bx]
               inc    bx
               inc    bx
               LOOP   L1
               RET
sum_proc endp
sub_code ends

      end start
