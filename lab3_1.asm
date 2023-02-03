.386
CODE SEGMENT
            ASSUME CS:CODE
      LIST1 DB     '6705762998'
            DB     '4322687310'
      SUM1  DD     ?
      START:MOV    AX,0
            MOV    CX,20
            LEA    BX,LIST1
      ONE:  ADD    AL,CS:[BX]
            AAA
            INC    BX
            LOOP   ONE
            MOV    BYTE PTR SUM1,AL
            MOV    AL,AH
            MOV    AH,0
            AAM
            MOV    WORD PTR SUM1+1,AX
            MOV    BYTE PTR SUM1+3,0
            MOV    AX,4C00H
            INT    21H
CODE ENDS
END	START