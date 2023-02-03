data segment
    w    dw 7
    x    dw 8
    y    dw 9

    r    dw 0
    z    dd 0



data ends

stack SEGMENT
    ;此处输入堆栈段代码
stack ENDS
code segment
          assume cs:code,ds:data,ss:stack
    start:
          mov    ax,data
          mov    ds,ax
          mov    ax,x
          cwd
          mov    bx,ax
          mov    ax,w
          cwd
          sub    ax,bx                       ;w-x
          mov    bl,10
          idiv   bl                          ;w-x之后再除以10
          mov    r,AH
          imul   y
          imul   ax
          mov    z,ax
          mov    z+2,dx
          lea    DX,z
          mov    AH,9
          mov    ah,4CH
          int    21H

code ends
    end start