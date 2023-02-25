.386

RADIX PROC
    PUSH CX
    PUSH EDX
    XOR CX,CX
    LOP1:XOR EDX,EDX ;将EDX除以EBX，得到的商存入AX，余数入栈
        DIV EBX 
        PUSH DX ;余数入栈
        INC CX
        OR EAX,EAX ;如果EAX = 0，停止循环
        JNZ LOP1
    LOP2:POP AX ;栈中结果弹出
        CMP AL,10;转化为ASCII码
        JB L1
        ADD AL,7 ;如果是小于10的进制，就直接加上30H，如果是大于10的，需要加上7
    L1: ADD AX,30H
        MOV [SI],AL
        INC SI
        LOOP LOP2
        POP EDX
        POP CX
        RET
ENDP