 
;�ӳ���
;��һ�����ݵĺ�

; �漰���������������ݵ���ʼ��ַ�����ݵĸ�������Ž���ĵ�ַ
;     ��ջ��
; ��Ҫ��������ݷŵ�ָ�����Ƶı�����
.386
data segment USE16 
array dw 1,2,3,4,5,6,7,8,9,10
nums   dw 10
sum    dw ?
data   ends

stack segment  USE16 stack
      db 200 dup(0)
stack ends

code  segment USE16 
      assume cs:code,ds:data,ss:stack
start:mov ax, data
      mov ds, ax
      
      lea   bx, array
      push  bx
      push  nums
      mov   dx, offset sum
      push  dx
      
      call  far ptr sum_proc

      mov ax, sum
      mov ah, 4ch
      int 21h
code  ends

     ; �ӳ����ָ����ַ��ȡ����
     ;       Ҳ���������ָ��λ��
sub_code segment  USE16 
         assume cs:sub_code
sum_proc proc far
         push ax
         push bx
         push cx
         push di
 
         mov  bp, sp
         add  bp, 12    ; bp ָ�������ջ�Ĳ���
         mov  di, [bp]    ;  ����ĵ�ַ
         mov  cx, [bp+2]  ;  ����
         mov  bx, [bp+4]  ;  ������ʼ��ַ�� bx��

         xor  ax,ax
L1:      add  ax, [bx]
         inc  bx
         inc  bx
         LOOP L1
         mov  [di], ax
         pop  di
         pop  cx
         pop  bx
         pop  ax
         RET  6      ; �ڵ��� IP,CS���ٷϵ� 6���ֽ�
sum_proc endp
sub_code ends         

      end start
