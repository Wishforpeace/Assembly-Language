; BUBBLESORT BY WUST_HMK
; 2016-04-16

ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    BUF  DB 16 DUP(0), 13, 10, '$'                               ; BUFFER TO STORE STRING
    LOL  DB 'WELCOME TO THE BUBBLESORT PROGRAM!', 13, 10, '$'
    STR1 DB 'BEFORE SORT:', 13, 10, '$'
    STR2 DB 'AFTER SORT:', 13, 10, '$'
    ARR  DB 12, -34, -2, 4, 0                                    ; NUMBER ARRAY BUFFER, CHANGE IT!!!
    CNT  DB $-ARR                                                ; COUNT FOR BUFFER
DATA ENDS

CODE SEGMENT
    START:     MOV  AX, DATA
               MOV  DS, AX                ; DATA SEGMENT
               MOV  SI, OFFSET ARR        ; ARRAY INDEX
               MOV  DI, OFFSET BUF        ; BUFFER INDEX
               MOV  CL, CNT               ; ELEMENTS COUNT
               MOV  CH, 0

               MOV  DX, OFFSET LOL        ; PRINT WELCOME
               MOV  AH, 09H
               INT  21H

               MOV  DX, OFFSET STR1       ; BEFORE SORT
               MOV  AH, 09H
               INT  21H

               MOV  SI, OFFSET ARR        ; ARRAY INDEX
               MOV  DI, OFFSET BUF        ; BUFFER INDEX
               MOV  CL, CNT               ; ELEMENTS COUNT
               MOV  CH, 0
               CALL PRINTARR              ; PRINT ARRAY

               MOV  SI, OFFSET ARR        ; ARRAY INDEX
               MOV  DI, OFFSET BUF        ; BUFFER INDEX
               MOV  CL, CNT               ; ELEMENTS COUNT
               MOV  CH, 0
               CALL BUBBLESORT            ; BUBBLE SORT

               MOV  DX, OFFSET STR2       ; AFTER SORT
               MOV  AH, 09H
               INT  21H

               MOV  SI, OFFSET ARR        ; ARRAY INDEX
               MOV  DI, OFFSET BUF        ; BUFFER INDEX
               MOV  CL, CNT               ; ELEMENTS COUNT
               MOV  CH, 0
               CALL PRINTARR              ; PRINT ARRAY

               MOV  AH, 4CH
               INT  21H                   ; RETURN TO DOS

    ;
    ; FUNCTION NAME: BUBBLESORT
    ; PARAMETERS:    DS: BASE OF BUFFER
    ;                SI: OFFSET
    ;                CX: NUMBERS COUNT - 1
    ;
BUBBLESORT PROC NEAR
               PUSH AX
               PUSH BX
               PUSH CX
               PUSH DX
               PUSH SI
               PUSH DI

               DEC  CX                    ; LOOP COUNT = ELEMENTS COUNT - 1
    OUTER:                                ; OUTER LOOP
               MOV  AL, [SI]              ; BUF[SI]
               PUSH CX
               MOV  DI, SI                ; BUFFER INDEX
    INNER:                                ; INNER LOOP
               INC  DI                    ; DI = SI + 1
               MOV  DL, [DI]              ; BUF[DI]
               CMP  AL, DL                ; IF (BUF[SI] > BUF[DI])
               JLE  CONT                  ;
               XCHG AX, DX                ; SWAP (BUF[SI], BUF[DI])
               MOV  [SI], AL
               MOV  [DI], DL
    CONT:      LOOP INNER                 ; CONTINUE
               POP  CX
               INC  SI
               LOOP OUTER

               POP  DI
               POP  SI
               POP  DX
               POP  CX
               POP  BX
               POP  AX
               RET
BUBBLESORT ENDP

    ;
    ; FUNCTION NAME: PRINTARR
    ; ARRAY IN DS[SI], BUFFER IN DS[DI], COUNT CX
PRINTARR PROC NEAR
               PUSH SI
               PUSH DI

               MOV  DX, DI
    ITERAT:    MOV  AL, [SI]              ; AL = DS[SI]
               MOV  AH, 0
               INC  SI
               CALL NTOC                  ; CONVERT AX TO STRING
               MOV  AH, 09H
               INT  21H                   ; PRINT STRING TO DOS
               CALL CLRBUF                ; CLEAR STRING BUFFER
               LOOP ITERAT

               POP  DI
               POP  SI
               RET
PRINTARR ENDP

    ; CONVERT NUMBER TO STRING
    ; AX TO DS[DI]
NTOC PROC NEAR
               PUSH BX
               PUSH CX
               PUSH DX
               PUSH DI

               MOV  BX, 10                ; DECIMAL BASE
               MOV  CX, 0
               CMP  AX, 127               ; IF AX > 127 THEN AX = -AX
               JLE  MODLP
               NEG  AL
               MOV  BYTE PTR [DI], '-'    ; NEGTIVE NUMBER SIGN
               INC  DI
    MODLP:     XOR  DX, DX
               DIV  BX                    ; AX = AX / BX; DX = AX % BX
               ADD  DX, 30H               ; DX += 30H, CONVERT DX TO ASCII
               PUSH DX
               INC  CX
               CMP  AX, 0
               JG   MODLP
               MOV  AX, CX                ; RETURN AX: LENGTH OF NUMBER
    STOLP:     POP  DX
               MOV  [DI], DL              ; SAVE NUMBER TO STRING BUFFER
               INC  DI
               LOOP STOLP

               POP  DI
               POP  DX
               POP  CX
               POP  BX
               RET
NTOC ENDP


    ; CLEAR DS[DI], COUNT FOR CX (RESERVED)
CLRBUF PROC NEAR
               PUSH CX
               PUSH DI

               MOV  CX, 16                ; BUFFER LENGTH
    BUFCLS:    MOV  BYTE PTR [DI], 0
               INC  DI
               LOOP BUFCLS

               POP  DI
               POP  CX
               RET
CLRBUF ENDP
CODE ENDS
    END START