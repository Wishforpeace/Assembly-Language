assume cs:code,ds:data,ss:stack

data segment
         db 'divide error',0    ;会被内存覆盖
    ;中断是cpu需要立刻处理的程序
    ;安全区域 0:200 0:3ff    0000:0000 ~ 0000:03FFH
    ;写到0:7E00H
data ends

stack segment
          db 128 dup(0)
stack ends

code segment
    start:        
                  mov  ax,stack
                  mov  ss,ax
                  mov  sp,128

                  call cp   y_new_int0
                  call set_new_int0

                  mov  ax,0
                  mov  dx,1
                  mov  bx,1
                  div  bx
                  mov  ah,4cH
                  int  21h

    ;==========================================
    set_new_int0: 
                  mov  bx,0
                  mov  es,bx
                  mov  word ptr es:[0*4],7E00H
                  mov  word ptr es:[0*4+2],0
                  ret
    ;==========================================
    new_int0:     jmp  newInt0

    string:       db   'divide error',0

    newInt0:      mov  bx,0b800h
                  mov  es,bx

                  mov  bx,0
                  mov  ds,bx

                  mov  di,160*10+30*2
                  mov  si,7E03H

    showstring:   mov  dl,ds:[si]
                  cmp  dl,0
                  je   showstringRet
                  mov  es:[di],dl
                  add  di,2
                  inc  si
                  jmp  showstring

    showstringRet:mov  ah,4ch
                  int  21h
    new_int0_end: nop
    ;===========================================
    cpy_new_int0: 
                  mov  bx,cs
                  mov  ds,bx
                  mov  si,offset new_int0
                  mov  bx,0
                  mov  es,bx
                  mov  di,7E00H
                  mov  cx,offset new_int0_end-new_int0
                  cld                                     ; 将si清零
                  rep  movsb
                  ret
code ends
    end start