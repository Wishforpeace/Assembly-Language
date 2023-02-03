
DATA SEGMENT
    W    DB ?
    Z    DB ?
    X    DB ?
    R    DB ?
DATA ENDS

CODE SEGMENT
          ASSUME CS:COD,DS:DATA
    START:
    ;（1）Z←W+(Z-X)
          MOV    AX,W
          MOV    BX,Z
          SUB    BX,X
          ADD    AX,BX
          MOV    Z,AX
    ;（2）Z←W-(X+6)-(R+9)
          MOV    AX,W
          MOV    BX,X
          ADD    BX,6
          SUB    AX,BX
          MOV    BX,R
          ADD    BX,9
          SUB    AX,BX
          MOV    Z,AX
    ;（3）Z←(W*X)/(Y+6), R←余数
        MOV 
    ;（4）Z←(W-X)/(5*Y)*2
CODE ENDS
    END START