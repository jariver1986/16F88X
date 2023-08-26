
acondicionador_BCD_7SEG:

;acondicionador.mbas,14 :: 		SUB FUNCTION BCD_7SEG(DIM num AS BYTE) AS BYTE
;acondicionador.mbas,16 :: 		CASE 0  result = %00000000
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG4
	CLRF       R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG4:
;acondicionador.mbas,17 :: 		CASE 1  result = %00000001
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG7
	MOVLW      1
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG7:
;acondicionador.mbas,18 :: 		CASE 2  result = %00000010
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG10
	MOVLW      2
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG10:
;acondicionador.mbas,19 :: 		CASE 3  result = %00000011
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG13
	MOVLW      3
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG13:
;acondicionador.mbas,20 :: 		CASE 4  result = %00000100
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG16
	MOVLW      4
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG16:
;acondicionador.mbas,21 :: 		CASE 5  result = %10110110
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG19
	MOVLW      182
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG19:
;acondicionador.mbas,22 :: 		CASE 6  result = %10111110
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG22
	MOVLW      190
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG22:
;acondicionador.mbas,23 :: 		CASE 7  result = %11100000
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG25
	MOVLW      224
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG25:
;acondicionador.mbas,24 :: 		CASE 8  result = %11111110
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG28
	MOVLW      254
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG28:
;acondicionador.mbas,25 :: 		CASE 9  result = %11110110
	MOVF       FARG_BCD_7SEG_num+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_acondicionador_BCD_7SEG31
	MOVLW      246
	MOVWF      R1+0
	GOTO       L_acondicionador_BCD_7SEG1
L_acondicionador_BCD_7SEG31:
L_acondicionador_BCD_7SEG1:
;acondicionador.mbas,26 :: 		END SELECT       'case end
	MOVF       R1+0, 0
	MOVWF      R0+0
	RETURN
; end of acondicionador_BCD_7SEG

_main:

;acondicionador.mbas,30 :: 		MAIN:
;acondicionador.mbas,32 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;acondicionador.mbas,34 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;acondicionador.mbas,35 :: 		PORTA = 0X00
	CLRF       PORTA+0
;acondicionador.mbas,37 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;acondicionador.mbas,38 :: 		PORTB = 0X00
	CLRF       PORTB+0
;acondicionador.mbas,40 :: 		TRISC = 0X1F ' PORTC salidas
	MOVLW      31
	MOVWF      TRISC+0
;acondicionador.mbas,41 :: 		PORTC = 0X00
	CLRF       PORTC+0
;acondicionador.mbas,43 :: 		TRISE = 0X08 ' PORTE.3 entrada digital
	MOVLW      8
	MOVWF      TRISE+0
;acondicionador.mbas,44 :: 		PORTE = 0X00
	CLRF       PORTE+0
;acondicionador.mbas,46 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;acondicionador.mbas,47 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;acondicionador.mbas,48 :: 		VALOR=0
	CLRF       _VALOR+0
;acondicionador.mbas,49 :: 		FLAG=0
	CLRF       _FLAG+0
;acondicionador.mbas,50 :: 		CONTADOR1=0
	CLRF       _CONTADOR1+0
;acondicionador.mbas,51 :: 		CONTADOR2=0
	CLRF       _CONTADOR2+0
;acondicionador.mbas,53 :: 		WHILE(1)
L__main34:
;acondicionador.mbas,54 :: 		iF(BOTON=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTE+0, 3
	GOTO       L__main39
;acondicionador.mbas,55 :: 		WHILE(BOTON=0) WEND  'PREGUNTO SI SOLTO EL PULSADOR
L__main42:
	BTFSC      PORTE+0, 3
	GOTO       L__main43
	GOTO       L__main42
L__main43:
;acondicionador.mbas,56 :: 		INC(VALOR)      'INCREMENTO VALOR = VALOR + 1
	INCF       _VALOR+0, 1
L__main39:
;acondicionador.mbas,59 :: 		IF(VALOR=1)THEN 'SI VALOR ES > 99 ENTOCES VALO=0
	MOVF       _VALOR+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;acondicionador.mbas,60 :: 		iF(BOTON1=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTC+0, 0
	GOTO       L__main50
;acondicionador.mbas,61 :: 		WHILE(BOTON1=0) WEND  'PREGUNTO SI SOLTO EL PULSADOR
L__main53:
	BTFSC      PORTC+0, 0
	GOTO       L__main54
	GOTO       L__main53
L__main54:
;acondicionador.mbas,62 :: 		INC(CONTADOR1)      'INCREMENTO VALOR = VALOR + 1
	INCF       _CONTADOR1+0, 1
L__main50:
;acondicionador.mbas,64 :: 		iF(BOTON2=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTC+0, 1
	GOTO       L__main58
;acondicionador.mbas,65 :: 		WHILE(BOTON2=0) WEND  'PREGUNTO SI SOLTO EL PULSADOR
L__main61:
	BTFSC      PORTC+0, 1
	GOTO       L__main62
	GOTO       L__main61
L__main62:
;acondicionador.mbas,66 :: 		DEC(CONTADOR1)      'INCREMENTO VALOR = VALOR + 1
	DECF       _CONTADOR1+0, 1
L__main58:
;acondicionador.mbas,69 :: 		iF(BOTON3=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTC+0, 2
	GOTO       L__main66
;acondicionador.mbas,70 :: 		WHILE(BOTON3=0) WEND  'PREGUNTO SI SOLTO EL PULSADOR
L__main69:
	BTFSC      PORTC+0, 2
	GOTO       L__main70
	GOTO       L__main69
L__main70:
;acondicionador.mbas,71 :: 		INC(CONTADOR2)      'INCREMENTO VALOR = VALOR + 1
	INCF       _CONTADOR2+0, 1
L__main66:
;acondicionador.mbas,73 :: 		iF(BOTON4=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTC+0, 3
	GOTO       L__main74
;acondicionador.mbas,74 :: 		WHILE(BOTON4=0) WEND  'PREGUNTO SI SOLTO EL PULSADOR
L__main77:
	BTFSC      PORTC+0, 3
	GOTO       L__main78
	GOTO       L__main77
L__main78:
;acondicionador.mbas,75 :: 		DEC(CONTADOR2)      'INCREMENTO VALOR = VALOR + 1
	DECF       _CONTADOR2+0, 1
L__main74:
;acondicionador.mbas,77 :: 		PORTA=(CONTADOR1 mod 10) or (CONTADOR1 / 10)<<4
	MOVLW      10
	MOVWF      R4+0
	MOVF       _CONTADOR1+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _CONTADOR1+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      FLOC__main+0, 0
	MOVWF      PORTA+0
;acondicionador.mbas,78 :: 		PORTB=(CONTADOR2 mod 10) or (CONTADOR2 / 10)<<4
	MOVLW      10
	MOVWF      R4+0
	MOVF       _CONTADOR2+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _CONTADOR2+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	IORWF      FLOC__main+0, 0
	MOVWF      PORTB+0
;acondicionador.mbas,79 :: 		iF(BOTON5=0)THEN  'SI PRESIONO EL BOTON
	BTFSC      PORTC+0, 4
	GOTO       L__main82
;acondicionador.mbas,80 :: 		PORTC.RC6=1
	BSF        PORTC+0, 6
;acondicionador.mbas,81 :: 		if CONTADOR1<CONTADOR2 then
	MOVF       _CONTADOR2+0, 0
	SUBWF      _CONTADOR1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main85
;acondicionador.mbas,82 :: 		PORTC.RC5=1
	BSF        PORTC+0, 5
;acondicionador.mbas,83 :: 		INC(CONTADOR1)
	INCF       _CONTADOR1+0, 1
;acondicionador.mbas,84 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main85:
;acondicionador.mbas,86 :: 		if CONTADOR1>CONTADOR2 then
	MOVF       _CONTADOR1+0, 0
	SUBWF      _CONTADOR2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main88
;acondicionador.mbas,87 :: 		PORTC.RC5=0
	BCF        PORTC+0, 5
;acondicionador.mbas,88 :: 		DEC(CONTADOR1)
	DECF       _CONTADOR1+0, 1
;acondicionador.mbas,89 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;acondicionador.mbas,90 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main88:
;acondicionador.mbas,92 :: 		if CONTADOR1=CONTADOR2 then
	MOVF       _CONTADOR1+0, 0
	XORWF      _CONTADOR2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
;acondicionador.mbas,93 :: 		PORTC.RC5=0
	BCF        PORTC+0, 5
L__main91:
;acondicionador.mbas,94 :: 		end if
	GOTO       L__main83
;acondicionador.mbas,95 :: 		ELSE
L__main82:
;acondicionador.mbas,96 :: 		PORTC.RC6=0
	BCF        PORTC+0, 6
;acondicionador.mbas,98 :: 		END IF
L__main83:
L__main47:
;acondicionador.mbas,101 :: 		IF(VALOR=2)THEN 'SI VALOR ES > 99 ENTOCES VALO=0
	MOVF       _VALOR+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main94
;acondicionador.mbas,102 :: 		PORTA=0
	CLRF       PORTA+0
;acondicionador.mbas,103 :: 		PORTB=0
	CLRF       PORTB+0
;acondicionador.mbas,104 :: 		VALOR=0
	CLRF       _VALOR+0
L__main94:
;acondicionador.mbas,106 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main96:
	DECFSZ     R13+0, 1
	GOTO       L__main96
	DECFSZ     R12+0, 1
	GOTO       L__main96
	DECFSZ     R11+0, 1
	GOTO       L__main96
;acondicionador.mbas,109 :: 		WEND
	GOTO       L__main34
	GOTO       $+0
; end of _main
