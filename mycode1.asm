; =====================================================================
; PROGRAM INFORMATION
; =====================================================================
; Program Name  : Difference of Two Decimal Digits
; Processor     : Intel 8086 Microprocessor
; Emulator      : EMU8086
; Interrupt     : INT 21H
; =====================================================================
; Objective     :
;                 1. Display prompt "Enter two digits:"
;                 2. Accept two decimal digits from keyboard
;                 3. Calculate absolute difference
;                 4. Display the difference
; =====================================================================
;
; -------------------------------
; INPUT - PROCESS - OUTPUT
; -------------------------------
; Input   : Two decimal digits (e.g., 7 and 3)
; Process : Convert ASCII to numeric, subtract, take absolute value
; Output  : THE DIFFERENCE OF 7 AND 3 IS 4
;
; -------------------------------
; REGISTERS USED
; -------------------------------
; AX | Accumulator (16-bit)     | DOS functions & arithmetic
; AH | Accumulator High (8-bit) | Stores DOS function number
; AL | Accumulator Low (8-bit)  | Stores input character
; CL | Counter Low (8-bit)      | Stores first digit (numeric)
; CH | Counter High (8-bit)     | Stores second digit (numeric)
; DX | Data Register (16-bit)   | Holds address of string
; DL | Data Low (8-bit)         | Holds character for output
; DS | Data Segment Register    | Points to DATA segment
; BX | Base Register (16-bit)   | Stores numeric difference
;
; -------------------------------
; DOS FUNCTIONS USED (INT 21H)
; -------------------------------
; AH = 01H -> Input Single Character (returned in AL)
; AH = 02H -> Display Single Character (character in DL)
; AH = 09H -> Display String (address in DX, ends with $)
; AH = 4CH -> Terminate Program
; =====================================================================

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH,0AH,'THE DIFFERENCE OF $'
    MSG2 DB ' AND $'
    MSG3 DB ' IS $'

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

; -------------------------
; Display prompt "?"
; -------------------------

    MOV DL,'?'               
    MOV AH,02H              
    INT 21H                 

; -------------------------
; Input First Digit
; -------------------------

    MOV AH,01H
    INT 21H                
    MOV CL,AL
    SUB CL,30H             

; -------------------------
; Input Second Digit
; -------------------------

    MOV AH,01H
    INT 21H
    MOV CH,AL
    SUB CH,30H             

; -------------------------
; Calculate Absolute Difference
; -------------------------

    MOV AL,CL
    CMP AL,CH
    JAE FIRST_LARGER
    MOV AL,CH
    SUB AL,CL
    JMP STORE_DIFF

FIRST_LARGER:
    SUB AL,CH

STORE_DIFF:
    MOV BL,AL              ; Store difference

; -------------------------
; Display MSG1 "THE DIFFERENCE OF "
; -------------------------

    LEA DX,MSG1
    MOV AH,09H
    INT 21H

; -------------------------
; Display First Digit
; -------------------------

    MOV DL,CL
    ADD DL,30H
    MOV AH,02H
    INT 21H

; -------------------------
; Display MSG2 " AND "
; -------------------------

    LEA DX,MSG2
    MOV AH,09H
    INT 21H

; -------------------------
; Display Second Digit
; -------------------------

    MOV DL,CH
    ADD DL,30H
    MOV AH,02H
    INT 21H

; -------------------------
; Display MSG3 " IS "
; -------------------------

    LEA DX,MSG3
    MOV AH,09H
    INT 21H

; -------------------------
; Display Difference
; -------------------------

    MOV AL,BL
    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

; -------------------------
; Program Termination
; -------------------------

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN




