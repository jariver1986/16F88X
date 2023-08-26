
Sistema_seguridad_teclado_lcd_ultrasonico1:

;Sistema_seguridad_teclado_lcd.mbas,26 :: 		dim distan,tiempo as word
;Sistema_seguridad_teclado_lcd.mbas,27 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;Sistema_seguridad_teclado_lcd.mbas,29 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;Sistema_seguridad_teclado_lcd.mbas,30 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico11
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,31 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;Sistema_seguridad_teclado_lcd.mbas,33 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico12:
;Sistema_seguridad_teclado_lcd.mbas,34 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico18
;Sistema_seguridad_teclado_lcd.mbas,35 :: 		TMR0 = 0
	CLRF       TMR0+0
;Sistema_seguridad_teclado_lcd.mbas,36 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico18:
;Sistema_seguridad_teclado_lcd.mbas,38 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico15
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico12
L_Sistema_seguridad_teclado_lcd_ultrasonico15:
;Sistema_seguridad_teclado_lcd.mbas,40 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico110:
;Sistema_seguridad_teclado_lcd.mbas,41 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico116
;Sistema_seguridad_teclado_lcd.mbas,42 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;Sistema_seguridad_teclado_lcd.mbas,43 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico116:
;Sistema_seguridad_teclado_lcd.mbas,48 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico113
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico110
L_Sistema_seguridad_teclado_lcd_ultrasonico113:
;Sistema_seguridad_teclado_lcd.mbas,50 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_Sistema_seguridad_teclado_lcd_ultrasonico1276:
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico1277
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico1276
L_Sistema_seguridad_teclado_lcd_ultrasonico1277:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;Sistema_seguridad_teclado_lcd.mbas,51 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico118:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico118
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico118
	NOP
;Sistema_seguridad_teclado_lcd.mbas,52 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of Sistema_seguridad_teclado_lcd_ultrasonico1

Sistema_seguridad_teclado_lcd_ultrasonico2:

;Sistema_seguridad_teclado_lcd.mbas,56 :: 		dim distan,tiempo as word
;Sistema_seguridad_teclado_lcd.mbas,57 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;Sistema_seguridad_teclado_lcd.mbas,59 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;Sistema_seguridad_teclado_lcd.mbas,60 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico220:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico220
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,61 :: 		PORTC.RC2 = 0
	BCF        PORTC+0, 2
;Sistema_seguridad_teclado_lcd.mbas,63 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico221:
;Sistema_seguridad_teclado_lcd.mbas,64 :: 		IF( PORTC.RC3 = 1 )THEN
	BTFSS      PORTC+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico227
;Sistema_seguridad_teclado_lcd.mbas,65 :: 		TMR0 = 0
	CLRF       TMR0+0
;Sistema_seguridad_teclado_lcd.mbas,66 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico227:
;Sistema_seguridad_teclado_lcd.mbas,68 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico224
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico221
L_Sistema_seguridad_teclado_lcd_ultrasonico224:
;Sistema_seguridad_teclado_lcd.mbas,70 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico229:
;Sistema_seguridad_teclado_lcd.mbas,71 :: 		IF( PORTC.RC3 = 0 )THEN
	BTFSC      PORTC+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico235
;Sistema_seguridad_teclado_lcd.mbas,72 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;Sistema_seguridad_teclado_lcd.mbas,73 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico235:
;Sistema_seguridad_teclado_lcd.mbas,78 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico232
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico229
L_Sistema_seguridad_teclado_lcd_ultrasonico232:
;Sistema_seguridad_teclado_lcd.mbas,80 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_Sistema_seguridad_teclado_lcd_ultrasonico2278:
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico2279
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico2278
L_Sistema_seguridad_teclado_lcd_ultrasonico2279:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;Sistema_seguridad_teclado_lcd.mbas,81 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico237:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico237
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico237
	NOP
;Sistema_seguridad_teclado_lcd.mbas,82 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of Sistema_seguridad_teclado_lcd_ultrasonico2

Sistema_seguridad_teclado_lcd_ultrasonico3:

;Sistema_seguridad_teclado_lcd.mbas,86 :: 		dim distan,tiempo as word
;Sistema_seguridad_teclado_lcd.mbas,87 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
;Sistema_seguridad_teclado_lcd.mbas,89 :: 		PORTD.RD0 = 1
	BSF        PORTD+0, 0
;Sistema_seguridad_teclado_lcd.mbas,90 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico339:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico339
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,91 :: 		PORTD.RD0 = 0
	BCF        PORTD+0, 0
;Sistema_seguridad_teclado_lcd.mbas,93 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico340:
;Sistema_seguridad_teclado_lcd.mbas,94 :: 		IF( PORTD.RD1 = 1 )THEN
	BTFSS      PORTD+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico346
;Sistema_seguridad_teclado_lcd.mbas,95 :: 		TMR0 = 0
	CLRF       TMR0+0
;Sistema_seguridad_teclado_lcd.mbas,96 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico3_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico346:
;Sistema_seguridad_teclado_lcd.mbas,98 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico343
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico340
L_Sistema_seguridad_teclado_lcd_ultrasonico343:
;Sistema_seguridad_teclado_lcd.mbas,100 :: 		DO
L_Sistema_seguridad_teclado_lcd_ultrasonico348:
;Sistema_seguridad_teclado_lcd.mbas,101 :: 		IF( PORTD.RD1 = 0 )THEN
	BTFSC      PORTD+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico354
;Sistema_seguridad_teclado_lcd.mbas,102 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico3_tiempo+0
	CLRF       ultrasonico3_tiempo+1
;Sistema_seguridad_teclado_lcd.mbas,103 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
L_Sistema_seguridad_teclado_lcd_ultrasonico354:
;Sistema_seguridad_teclado_lcd.mbas,108 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico351
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico348
L_Sistema_seguridad_teclado_lcd_ultrasonico351:
;Sistema_seguridad_teclado_lcd.mbas,110 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico3_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_Sistema_seguridad_teclado_lcd_ultrasonico3280:
	BTFSC      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico3281
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico3280
L_Sistema_seguridad_teclado_lcd_ultrasonico3281:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico3_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico3_distan+1
;Sistema_seguridad_teclado_lcd.mbas,111 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_ultrasonico356:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico356
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_ultrasonico356
	NOP
;Sistema_seguridad_teclado_lcd.mbas,112 :: 		result = distan
	MOVF       ultrasonico3_distan+0, 0
	MOVWF      ultrasonico3_local_result+0
	MOVF       ultrasonico3_distan+1, 0
	MOVWF      ultrasonico3_local_result+1
	MOVF       ultrasonico3_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of Sistema_seguridad_teclado_lcd_ultrasonico3

Sistema_seguridad_teclado_lcd_buzzer:

;Sistema_seguridad_teclado_lcd.mbas,116 :: 		sub procedure buzzer()
;Sistema_seguridad_teclado_lcd.mbas,117 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;Sistema_seguridad_teclado_lcd.mbas,118 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_buzzer58:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer58
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer58
	DECFSZ     R11+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer58
	NOP
;Sistema_seguridad_teclado_lcd.mbas,119 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;Sistema_seguridad_teclado_lcd.mbas,120 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_buzzer59:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer59
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer59
	DECFSZ     R11+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_buzzer59
	NOP
	RETURN
; end of Sistema_seguridad_teclado_lcd_buzzer

Sistema_seguridad_teclado_lcd_led:

;Sistema_seguridad_teclado_lcd.mbas,122 :: 		sub procedure led()
;Sistema_seguridad_teclado_lcd.mbas,123 :: 		PORTD.RD3 = 0
	BCF        PORTD+0, 3
;Sistema_seguridad_teclado_lcd.mbas,124 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_led61:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led61
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led61
	DECFSZ     R11+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led61
	NOP
;Sistema_seguridad_teclado_lcd.mbas,125 :: 		PORTD.RD3 = 1
	BSF        PORTD+0, 3
;Sistema_seguridad_teclado_lcd.mbas,126 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Sistema_seguridad_teclado_lcd_led62:
	DECFSZ     R13+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led62
	DECFSZ     R12+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led62
	DECFSZ     R11+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_led62
	NOP
	RETURN
; end of Sistema_seguridad_teclado_lcd_led

Sistema_seguridad_teclado_lcd_leer_teclado:

;Sistema_seguridad_teclado_lcd.mbas,128 :: 		sub procedure leer_teclado()
;Sistema_seguridad_teclado_lcd.mbas,129 :: 		kp = 0
	CLRF       _kp+0
;Sistema_seguridad_teclado_lcd.mbas,130 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;Sistema_seguridad_teclado_lcd.mbas,131 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado65
;Sistema_seguridad_teclado_lcd.mbas,132 :: 		while(portb.0=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado68:
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado69
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado68
L_Sistema_seguridad_teclado_lcd_leer_teclado69:
;Sistema_seguridad_teclado_lcd.mbas,133 :: 		kp=0x31 end if'1
	MOVLW      49
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado65:
;Sistema_seguridad_teclado_lcd.mbas,134 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado73
;Sistema_seguridad_teclado_lcd.mbas,135 :: 		while(portb.1=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado76:
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado77
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado76
L_Sistema_seguridad_teclado_lcd_leer_teclado77:
;Sistema_seguridad_teclado_lcd.mbas,136 :: 		kp=0x32 end if'2
	MOVLW      50
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado73:
;Sistema_seguridad_teclado_lcd.mbas,137 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado81
;Sistema_seguridad_teclado_lcd.mbas,138 :: 		while(portb.2=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado84:
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado85
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado84
L_Sistema_seguridad_teclado_lcd_leer_teclado85:
;Sistema_seguridad_teclado_lcd.mbas,139 :: 		kp=0x33 end if'3
	MOVLW      51
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado81:
;Sistema_seguridad_teclado_lcd.mbas,140 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado89
;Sistema_seguridad_teclado_lcd.mbas,141 :: 		while(portb.3=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado92:
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado93
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado92
L_Sistema_seguridad_teclado_lcd_leer_teclado93:
;Sistema_seguridad_teclado_lcd.mbas,142 :: 		kp=$41 end if'A
	MOVLW      65
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado89:
;Sistema_seguridad_teclado_lcd.mbas,143 :: 		if(kp=0)then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado97
;Sistema_seguridad_teclado_lcd.mbas,144 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;Sistema_seguridad_teclado_lcd.mbas,145 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado100
;Sistema_seguridad_teclado_lcd.mbas,146 :: 		while(portb.0=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado103:
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado104
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado103
L_Sistema_seguridad_teclado_lcd_leer_teclado104:
;Sistema_seguridad_teclado_lcd.mbas,147 :: 		kp=0x34 end if'4
	MOVLW      52
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado100:
;Sistema_seguridad_teclado_lcd.mbas,148 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado108
;Sistema_seguridad_teclado_lcd.mbas,149 :: 		while(portb.1=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado111:
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado112
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado111
L_Sistema_seguridad_teclado_lcd_leer_teclado112:
;Sistema_seguridad_teclado_lcd.mbas,150 :: 		kp=0x35 end if'5
	MOVLW      53
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado108:
;Sistema_seguridad_teclado_lcd.mbas,151 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado116
;Sistema_seguridad_teclado_lcd.mbas,152 :: 		while(portb.2=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado119:
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado120
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado119
L_Sistema_seguridad_teclado_lcd_leer_teclado120:
;Sistema_seguridad_teclado_lcd.mbas,153 :: 		kp=0x36 end if'6
	MOVLW      54
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado116:
;Sistema_seguridad_teclado_lcd.mbas,154 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado124
;Sistema_seguridad_teclado_lcd.mbas,155 :: 		while(portb.3=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado127:
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado128
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado127
L_Sistema_seguridad_teclado_lcd_leer_teclado128:
;Sistema_seguridad_teclado_lcd.mbas,156 :: 		kp=$42 end if'B
	MOVLW      66
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado124:
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado98
;Sistema_seguridad_teclado_lcd.mbas,157 :: 		else return
L_Sistema_seguridad_teclado_lcd_leer_teclado97:
	RETURN
;Sistema_seguridad_teclado_lcd.mbas,158 :: 		end if
L_Sistema_seguridad_teclado_lcd_leer_teclado98:
;Sistema_seguridad_teclado_lcd.mbas,159 :: 		if(kp=0) then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado132
;Sistema_seguridad_teclado_lcd.mbas,160 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;Sistema_seguridad_teclado_lcd.mbas,161 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado135
;Sistema_seguridad_teclado_lcd.mbas,162 :: 		while(portb.0=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado138:
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado139
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado138
L_Sistema_seguridad_teclado_lcd_leer_teclado139:
;Sistema_seguridad_teclado_lcd.mbas,163 :: 		kp=0x37 end if'7
	MOVLW      55
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado135:
;Sistema_seguridad_teclado_lcd.mbas,164 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado143
;Sistema_seguridad_teclado_lcd.mbas,165 :: 		while(portb.1=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado146:
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado147
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado146
L_Sistema_seguridad_teclado_lcd_leer_teclado147:
;Sistema_seguridad_teclado_lcd.mbas,166 :: 		kp=0x38 end if'8
	MOVLW      56
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado143:
;Sistema_seguridad_teclado_lcd.mbas,167 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado151
;Sistema_seguridad_teclado_lcd.mbas,168 :: 		while(portb.2=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado154:
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado155
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado154
L_Sistema_seguridad_teclado_lcd_leer_teclado155:
;Sistema_seguridad_teclado_lcd.mbas,169 :: 		kp=0x39 end if'9
	MOVLW      57
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado151:
;Sistema_seguridad_teclado_lcd.mbas,170 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado159
;Sistema_seguridad_teclado_lcd.mbas,171 :: 		while(portb.3=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado162:
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado163
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado162
L_Sistema_seguridad_teclado_lcd_leer_teclado163:
;Sistema_seguridad_teclado_lcd.mbas,172 :: 		kp=$43 end if'C
	MOVLW      67
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado159:
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado133
;Sistema_seguridad_teclado_lcd.mbas,173 :: 		else return
L_Sistema_seguridad_teclado_lcd_leer_teclado132:
	RETURN
;Sistema_seguridad_teclado_lcd.mbas,174 :: 		end if
L_Sistema_seguridad_teclado_lcd_leer_teclado133:
;Sistema_seguridad_teclado_lcd.mbas,175 :: 		if(kp=0)then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado167
;Sistema_seguridad_teclado_lcd.mbas,176 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;Sistema_seguridad_teclado_lcd.mbas,177 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado170
;Sistema_seguridad_teclado_lcd.mbas,178 :: 		while(portb.0=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado173:
	BTFSC      PORTB+0, 0
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado174
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado173
L_Sistema_seguridad_teclado_lcd_leer_teclado174:
;Sistema_seguridad_teclado_lcd.mbas,179 :: 		kp=$23 end if '*
	MOVLW      35
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado170:
;Sistema_seguridad_teclado_lcd.mbas,180 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado178
;Sistema_seguridad_teclado_lcd.mbas,181 :: 		while(portb.1=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado181:
	BTFSC      PORTB+0, 1
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado182
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado181
L_Sistema_seguridad_teclado_lcd_leer_teclado182:
;Sistema_seguridad_teclado_lcd.mbas,182 :: 		kp=0x30 end if'0
	MOVLW      48
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado178:
;Sistema_seguridad_teclado_lcd.mbas,183 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado186
;Sistema_seguridad_teclado_lcd.mbas,184 :: 		while(portb.2=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado189:
	BTFSC      PORTB+0, 2
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado190
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado189
L_Sistema_seguridad_teclado_lcd_leer_teclado190:
;Sistema_seguridad_teclado_lcd.mbas,185 :: 		kp=$24 end if'#
	MOVLW      36
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado186:
;Sistema_seguridad_teclado_lcd.mbas,186 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado194
;Sistema_seguridad_teclado_lcd.mbas,187 :: 		while(portb.3=0) wend
L_Sistema_seguridad_teclado_lcd_leer_teclado197:
	BTFSC      PORTB+0, 3
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado198
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado197
L_Sistema_seguridad_teclado_lcd_leer_teclado198:
;Sistema_seguridad_teclado_lcd.mbas,188 :: 		kp=$44 end if'D
	MOVLW      68
	MOVWF      _kp+0
L_Sistema_seguridad_teclado_lcd_leer_teclado194:
	GOTO       L_Sistema_seguridad_teclado_lcd_leer_teclado168
;Sistema_seguridad_teclado_lcd.mbas,189 :: 		else return
L_Sistema_seguridad_teclado_lcd_leer_teclado167:
	RETURN
;Sistema_seguridad_teclado_lcd.mbas,190 :: 		end if
L_Sistema_seguridad_teclado_lcd_leer_teclado168:
	RETURN
; end of Sistema_seguridad_teclado_lcd_leer_teclado

Sistema_seguridad_teclado_lcd_pila_mensaje1:

;Sistema_seguridad_teclado_lcd.mbas,195 :: 		SUB PROCEDURE pila_mensaje1()
;Sistema_seguridad_teclado_lcd.mbas,196 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,197 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,198 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _pila_mensaje1_Local_Text+0
	MOVLW      84
	MOVWF      _pila_mensaje1_Local_Text+1
	CLRF       _pila_mensaje1_Local_Text+2
	MOVLW      _pila_mensaje1_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,199 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,200 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,201 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,202 :: 		UART1_Write_Text("AT+CMGS")
	MOVLW      _pila_mensaje1_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      43
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje1_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,203 :: 		UART1_Write(0X3D)
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,204 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,205 :: 		UART1_Write_Text("0989844982")
	MOVLW      _pila_mensaje1_Local_Text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje1_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,206 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,207 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,208 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,209 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of Sistema_seguridad_teclado_lcd_pila_mensaje1

Sistema_seguridad_teclado_lcd_pila_mensaje2:

;Sistema_seguridad_teclado_lcd.mbas,211 :: 		SUB PROCEDURE pila_mensaje2()
;Sistema_seguridad_teclado_lcd.mbas,212 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,213 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,214 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _pila_mensaje2_Local_Text+0
	MOVLW      84
	MOVWF      _pila_mensaje2_Local_Text+1
	CLRF       _pila_mensaje2_Local_Text+2
	MOVLW      _pila_mensaje2_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,215 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,216 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,217 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,218 :: 		UART1_Write_Text("AT+CMGS")
	MOVLW      _pila_mensaje2_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      43
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje2_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,219 :: 		UART1_Write(0X3D)
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,220 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,221 :: 		UART1_Write_Text("0998957720")
	MOVLW      _pila_mensaje2_Local_Text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      53
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje2_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,222 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,223 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,224 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,225 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of Sistema_seguridad_teclado_lcd_pila_mensaje2

Sistema_seguridad_teclado_lcd_cola_mensaje:

;Sistema_seguridad_teclado_lcd.mbas,228 :: 		sub procedure cola_mensaje
;Sistema_seguridad_teclado_lcd.mbas,229 :: 		UART1_Write(0X1A)
	MOVLW      26
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,230 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,231 :: 		UART1_Write(0X41)
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,232 :: 		UART1_Write(0X54)
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,233 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,234 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,235 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,236 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,237 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Sistema_seguridad_teclado_lcd.mbas,238 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of Sistema_seguridad_teclado_lcd_cola_mensaje

_main:

;Sistema_seguridad_teclado_lcd.mbas,241 :: 		main:
;Sistema_seguridad_teclado_lcd.mbas,242 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;Sistema_seguridad_teclado_lcd.mbas,243 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Sistema_seguridad_teclado_lcd.mbas,245 :: 		WPUB = $0F
	MOVLW      15
	MOVWF      WPUB+0
;Sistema_seguridad_teclado_lcd.mbas,246 :: 		PORTA = %00000000
	CLRF       PORTA+0
;Sistema_seguridad_teclado_lcd.mbas,247 :: 		TRISA = %11111111
	MOVLW      255
	MOVWF      TRISA+0
;Sistema_seguridad_teclado_lcd.mbas,248 :: 		PORTB = %00000000
	CLRF       PORTB+0
;Sistema_seguridad_teclado_lcd.mbas,249 :: 		TRISB = %00001111
	MOVLW      15
	MOVWF      TRISB+0
;Sistema_seguridad_teclado_lcd.mbas,250 :: 		PORTC = %00000000
	CLRF       PORTC+0
;Sistema_seguridad_teclado_lcd.mbas,251 :: 		TRISC = %10001010
	MOVLW      138
	MOVWF      TRISC+0
;Sistema_seguridad_teclado_lcd.mbas,252 :: 		PORTD = %00000000
	CLRF       PORTD+0
;Sistema_seguridad_teclado_lcd.mbas,253 :: 		TRISD = %00000010
	MOVLW      2
	MOVWF      TRISD+0
;Sistema_seguridad_teclado_lcd.mbas,254 :: 		PORTE = %00000000
	CLRF       PORTE+0
;Sistema_seguridad_teclado_lcd.mbas,255 :: 		TRISE = %00000000
	CLRF       TRISE+0
;Sistema_seguridad_teclado_lcd.mbas,256 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;Sistema_seguridad_teclado_lcd.mbas,257 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;Sistema_seguridad_teclado_lcd.mbas,259 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;Sistema_seguridad_teclado_lcd.mbas,260 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,261 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,262 :: 		Lcd_Out(1,1,"TECSU")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,263 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,264 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main205:
	DECFSZ     R13+0, 1
	GOTO       L__main205
	DECFSZ     R12+0, 1
	GOTO       L__main205
	DECFSZ     R11+0, 1
	GOTO       L__main205
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,265 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,267 :: 		Lcd_Out(1,1,"SISTEMA DE  ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,268 :: 		Lcd_Out(2,1,"SEGURIDAD")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,269 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main206:
	DECFSZ     R13+0, 1
	GOTO       L__main206
	DECFSZ     R12+0, 1
	GOTO       L__main206
	DECFSZ     R11+0, 1
	GOTO       L__main206
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,270 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,272 :: 		Lcd_Out(1,1,"POR: MIGUEL")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,273 :: 		Lcd_Out(2,1,"     MENDOZA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,274 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main207:
	DECFSZ     R13+0, 1
	GOTO       L__main207
	DECFSZ     R12+0, 1
	GOTO       L__main207
	DECFSZ     R11+0, 1
	GOTO       L__main207
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,275 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,276 :: 		Lcd_Out(1,1,"CLAVE:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,277 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,278 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main208:
	DECFSZ     R13+0, 1
	GOTO       L__main208
	DECFSZ     R12+0, 1
	GOTO       L__main208
	DECFSZ     R11+0, 1
	GOTO       L__main208
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,279 :: 		contador=0
	CLRF       _contador+0
;Sistema_seguridad_teclado_lcd.mbas,280 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Sistema_seguridad_teclado_lcd.mbas,281 :: 		habilitado=0
	CLRF       _habilitado+0
;Sistema_seguridad_teclado_lcd.mbas,282 :: 		listo=0
	CLRF       _listo+0
;Sistema_seguridad_teclado_lcd.mbas,283 :: 		alerta=2
	MOVLW      2
	MOVWF      _alerta+0
;Sistema_seguridad_teclado_lcd.mbas,284 :: 		seguro=0
	CLRF       _seguro+0
;Sistema_seguridad_teclado_lcd.mbas,285 :: 		buzzer
	CALL       Sistema_seguridad_teclado_lcd_buzzer+0
;Sistema_seguridad_teclado_lcd.mbas,286 :: 		led
	CALL       Sistema_seguridad_teclado_lcd_led+0
;Sistema_seguridad_teclado_lcd.mbas,287 :: 		led
	CALL       Sistema_seguridad_teclado_lcd_led+0
;Sistema_seguridad_teclado_lcd.mbas,288 :: 		fin=0
	BCF        _fin+0, BitPos(_fin+0)
;Sistema_seguridad_teclado_lcd.mbas,289 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,290 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,291 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,292 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_seguridad_teclado_lcd.mbas,293 :: 		distancia1=100
	MOVLW      100
	MOVWF      _DISTANCIA1+0
	CLRF       _DISTANCIA1+1
;Sistema_seguridad_teclado_lcd.mbas,294 :: 		distancia2=12
	MOVLW      12
	MOVWF      _DISTANCIA2+0
	CLRF       _DISTANCIA2+1
;Sistema_seguridad_teclado_lcd.mbas,295 :: 		distancia3=12
	MOVLW      12
	MOVWF      _DISTANCIA3+0
	CLRF       _DISTANCIA3+1
;Sistema_seguridad_teclado_lcd.mbas,296 :: 		while 1
L__main210:
;Sistema_seguridad_teclado_lcd.mbas,311 :: 		leer_teclado()
	CALL       Sistema_seguridad_teclado_lcd_leer_teclado+0
;Sistema_seguridad_teclado_lcd.mbas,313 :: 		if habilitado=0 then
	MOVF       _habilitado+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main215
;Sistema_seguridad_teclado_lcd.mbas,314 :: 		Lcd_Out(1,1,"CLAVE:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,315 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,316 :: 		if KP<>0 then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main218
;Sistema_seguridad_teclado_lcd.mbas,318 :: 		Delay_ms(200)             ' TIEMPO DE ESPERA
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main220:
	DECFSZ     R13+0, 1
	GOTO       L__main220
	DECFSZ     R12+0, 1
	GOTO       L__main220
	DECFSZ     R11+0, 1
	GOTO       L__main220
	NOP
;Sistema_seguridad_teclado_lcd.mbas,319 :: 		contador = contador+1
	INCF       _contador+0, 1
;Sistema_seguridad_teclado_lcd.mbas,320 :: 		buzzer
	CALL       Sistema_seguridad_teclado_lcd_buzzer+0
;Sistema_seguridad_teclado_lcd.mbas,321 :: 		IF (kp = 0X31) and (contador=1)  then
	MOVF       _kp+0, 0
	XORLW      49
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main222
;Sistema_seguridad_teclado_lcd.mbas,322 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,323 :: 		listo = listo + 1
	INCF       _listo+0, 1
;Sistema_seguridad_teclado_lcd.mbas,324 :: 		Lcd_Out(1,8,"*")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main222:
;Sistema_seguridad_teclado_lcd.mbas,326 :: 		IF (kp = 0X32) and (contador=2) then
	MOVF       _kp+0, 0
	XORLW      50
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main225
;Sistema_seguridad_teclado_lcd.mbas,327 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,328 :: 		listo = listo + 1
	INCF       _listo+0, 1
;Sistema_seguridad_teclado_lcd.mbas,329 :: 		Lcd_Out(1,8,"**")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	MOVLW      42
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main225:
;Sistema_seguridad_teclado_lcd.mbas,331 :: 		IF (kp = 0X33) and (contador=3) then
	MOVF       _kp+0, 0
	XORLW      51
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main228
;Sistema_seguridad_teclado_lcd.mbas,332 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,333 :: 		listo = listo + 1
	INCF       _listo+0, 1
;Sistema_seguridad_teclado_lcd.mbas,334 :: 		Lcd_Out(1,8,"***")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	MOVLW      42
	MOVWF      _main_Local_Text+1
	MOVLW      42
	MOVWF      _main_Local_Text+2
	CLRF       _main_Local_Text+3
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main228:
;Sistema_seguridad_teclado_lcd.mbas,336 :: 		IF (kp = 0X34) and (contador=4) then
	MOVF       _kp+0, 0
	XORLW      52
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main231
;Sistema_seguridad_teclado_lcd.mbas,337 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,338 :: 		listo = listo + 1
	INCF       _listo+0, 1
;Sistema_seguridad_teclado_lcd.mbas,339 :: 		Lcd_Out(1,8,"****")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main231:
;Sistema_seguridad_teclado_lcd.mbas,342 :: 		Delay_ms(300)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L__main233:
	DECFSZ     R13+0, 1
	GOTO       L__main233
	DECFSZ     R12+0, 1
	GOTO       L__main233
	DECFSZ     R11+0, 1
	GOTO       L__main233
;Sistema_seguridad_teclado_lcd.mbas,343 :: 		if CONTADOR=4 then
	MOVF       _contador+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main235
;Sistema_seguridad_teclado_lcd.mbas,344 :: 		buzzer
	CALL       Sistema_seguridad_teclado_lcd_buzzer+0
;Sistema_seguridad_teclado_lcd.mbas,345 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,347 :: 		if listo=4 then
	MOVF       _listo+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main238
;Sistema_seguridad_teclado_lcd.mbas,348 :: 		listo=0
	CLRF       _listo+0
;Sistema_seguridad_teclado_lcd.mbas,349 :: 		contador=0
	CLRF       _contador+0
;Sistema_seguridad_teclado_lcd.mbas,350 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,351 :: 		Lcd_Out(2,1,"CORRECTO")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,352 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main240:
	DECFSZ     R13+0, 1
	GOTO       L__main240
	DECFSZ     R12+0, 1
	GOTO       L__main240
	DECFSZ     R11+0, 1
	GOTO       L__main240
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,353 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,354 :: 		Lcd_Out(1,1,"ALARMA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,355 :: 		Lcd_Out(2,1,"ACTIVADA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,356 :: 		Delay_ms(3000)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main241:
	DECFSZ     R13+0, 1
	GOTO       L__main241
	DECFSZ     R12+0, 1
	GOTO       L__main241
	DECFSZ     R11+0, 1
	GOTO       L__main241
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,357 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,358 :: 		seguro= 1
	MOVLW      1
	MOVWF      _seguro+0
;Sistema_seguridad_teclado_lcd.mbas,359 :: 		habilitado=1
	MOVLW      1
	MOVWF      _habilitado+0
;Sistema_seguridad_teclado_lcd.mbas,360 :: 		ALERTA=1
	MOVLW      1
	MOVWF      _alerta+0
	GOTO       L__main239
;Sistema_seguridad_teclado_lcd.mbas,361 :: 		else
L__main238:
;Sistema_seguridad_teclado_lcd.mbas,362 :: 		contador=0
	CLRF       _contador+0
;Sistema_seguridad_teclado_lcd.mbas,363 :: 		listo=0
	CLRF       _listo+0
;Sistema_seguridad_teclado_lcd.mbas,364 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,365 :: 		Lcd_Out(2,1,"INCORRECTO")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,366 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main242:
	DECFSZ     R13+0, 1
	GOTO       L__main242
	DECFSZ     R12+0, 1
	GOTO       L__main242
	DECFSZ     R11+0, 1
	GOTO       L__main242
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,367 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,368 :: 		Lcd_Out(1,1,"CLAVE:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,369 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,370 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main243:
	DECFSZ     R13+0, 1
	GOTO       L__main243
	DECFSZ     R12+0, 1
	GOTO       L__main243
	DECFSZ     R11+0, 1
	GOTO       L__main243
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,371 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,372 :: 		end if
L__main239:
L__main235:
;Sistema_seguridad_teclado_lcd.mbas,374 :: 		end if
L__main218:
;Sistema_seguridad_teclado_lcd.mbas,375 :: 		end if
L__main215:
;Sistema_seguridad_teclado_lcd.mbas,381 :: 		if seguro = 1 THEN   'Alarma activada
	MOVF       _seguro+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main245
;Sistema_seguridad_teclado_lcd.mbas,382 :: 		Lcd_Out(2,1,"Sensor:")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,383 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main247:
	DECFSZ     R13+0, 1
	GOTO       L__main247
	DECFSZ     R12+0, 1
	GOTO       L__main247
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,384 :: 		distancia1 = ultrasonico1()
	CALL       Sistema_seguridad_teclado_lcd_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;Sistema_seguridad_teclado_lcd.mbas,385 :: 		distancia2 = ultrasonico2()
	CALL       Sistema_seguridad_teclado_lcd_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA2+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA2+1
;Sistema_seguridad_teclado_lcd.mbas,386 :: 		distancia3 = ultrasonico3()
	CALL       Sistema_seguridad_teclado_lcd_ultrasonico3+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA3+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA3+1
;Sistema_seguridad_teclado_lcd.mbas,387 :: 		if(distancia1<50) then
	MOVLW      0
	SUBWF      _DISTANCIA1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main282
	MOVLW      50
	SUBWF      _DISTANCIA1+0, 0
L__main282:
	BTFSC      STATUS+0, 0
	GOTO       L__main249
;Sistema_seguridad_teclado_lcd.mbas,388 :: 		Lcd_Out(2,9,"S1")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      49
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,389 :: 		ALERTA1 = 1
	MOVLW      1
	MOVWF      _alerta1+0
	GOTO       L__main250
;Sistema_seguridad_teclado_lcd.mbas,390 :: 		else
L__main249:
;Sistema_seguridad_teclado_lcd.mbas,391 :: 		Lcd_Out(2,9,"__")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	MOVLW      95
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,392 :: 		end if
L__main250:
;Sistema_seguridad_teclado_lcd.mbas,393 :: 		if (distancia2>5) then
	MOVF       _DISTANCIA2+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main283
	MOVF       _DISTANCIA2+0, 0
	SUBLW      5
L__main283:
	BTFSC      STATUS+0, 0
	GOTO       L__main252
;Sistema_seguridad_teclado_lcd.mbas,394 :: 		Lcd_Out(2,12,"S2")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      50
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,395 :: 		ALERTA2 = 1
	MOVLW      1
	MOVWF      _alerta2+0
	GOTO       L__main253
;Sistema_seguridad_teclado_lcd.mbas,396 :: 		ELSE
L__main252:
;Sistema_seguridad_teclado_lcd.mbas,397 :: 		Lcd_Out(2,12,"__")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	MOVLW      95
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,398 :: 		end if
L__main253:
;Sistema_seguridad_teclado_lcd.mbas,399 :: 		if (distancia3>5) then
	MOVF       _DISTANCIA3+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main284
	MOVF       _DISTANCIA3+0, 0
	SUBLW      5
L__main284:
	BTFSC      STATUS+0, 0
	GOTO       L__main255
;Sistema_seguridad_teclado_lcd.mbas,400 :: 		Lcd_Out(2,15,"S3")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      51
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,401 :: 		ALERTA3 = 1
	MOVLW      1
	MOVWF      _alerta3+0
	GOTO       L__main256
;Sistema_seguridad_teclado_lcd.mbas,402 :: 		ELSE
L__main255:
;Sistema_seguridad_teclado_lcd.mbas,403 :: 		Lcd_Out(2,15,"__")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	MOVLW      95
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,404 :: 		end if
L__main256:
;Sistema_seguridad_teclado_lcd.mbas,406 :: 		if alerta1=1 then
	MOVF       _alerta1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main258
;Sistema_seguridad_teclado_lcd.mbas,407 :: 		Lcd_Out(1,1,"ALERTA INTERIOR")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,408 :: 		pila_mensaje1()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje1+0
;Sistema_seguridad_teclado_lcd.mbas,409 :: 		UART1_Write_Text("ALERTA SENSOR 1")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,410 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,411 :: 		pila_mensaje2()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje2+0
;Sistema_seguridad_teclado_lcd.mbas,412 :: 		UART1_Write_Text("ALERTA SENSOR 1")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,413 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,414 :: 		alerta1=0
	CLRF       _alerta1+0
;Sistema_seguridad_teclado_lcd.mbas,415 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,416 :: 		seguro=0
	CLRF       _seguro+0
;Sistema_seguridad_teclado_lcd.mbas,417 :: 		habilitado=0
	CLRF       _habilitado+0
L__main258:
;Sistema_seguridad_teclado_lcd.mbas,419 :: 		if alerta2=1 then
	MOVF       _alerta2+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main261
;Sistema_seguridad_teclado_lcd.mbas,420 :: 		Lcd_Out(1,1,"ALERTA VENTANA")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,421 :: 		pila_mensaje1()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje1+0
;Sistema_seguridad_teclado_lcd.mbas,422 :: 		UART1_Write_Text("ALERTA SENSOR 2")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,423 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,424 :: 		pila_mensaje2()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje2+0
;Sistema_seguridad_teclado_lcd.mbas,425 :: 		UART1_Write_Text("ALERTA SENSOR 2")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,426 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,427 :: 		alerta2=0
	CLRF       _alerta2+0
;Sistema_seguridad_teclado_lcd.mbas,428 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,429 :: 		seguro=0
	CLRF       _seguro+0
;Sistema_seguridad_teclado_lcd.mbas,430 :: 		habilitado=0
	CLRF       _habilitado+0
L__main261:
;Sistema_seguridad_teclado_lcd.mbas,432 :: 		if alerta3=1 then
	MOVF       _alerta3+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main264
;Sistema_seguridad_teclado_lcd.mbas,433 :: 		Lcd_Out(1,1,"ALERTA PUERTA")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,434 :: 		pila_mensaje1()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje1+0
;Sistema_seguridad_teclado_lcd.mbas,435 :: 		UART1_Write_Text("ALERTA SENSOR 3")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,436 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,437 :: 		pila_mensaje2()
	CALL       Sistema_seguridad_teclado_lcd_pila_mensaje2+0
;Sistema_seguridad_teclado_lcd.mbas,438 :: 		UART1_Write_Text("ALERTA SENSOR 3")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_seguridad_teclado_lcd.mbas,439 :: 		cola_mensaje()
	CALL       Sistema_seguridad_teclado_lcd_cola_mensaje+0
;Sistema_seguridad_teclado_lcd.mbas,440 :: 		alerta3=0
	CLRF       _alerta3+0
;Sistema_seguridad_teclado_lcd.mbas,441 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,442 :: 		seguro=0
	CLRF       _seguro+0
;Sistema_seguridad_teclado_lcd.mbas,443 :: 		habilitado=0
	CLRF       _habilitado+0
L__main264:
;Sistema_seguridad_teclado_lcd.mbas,445 :: 		delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main266:
	DECFSZ     R13+0, 1
	GOTO       L__main266
	DECFSZ     R12+0, 1
	GOTO       L__main266
	NOP
	NOP
L__main245:
;Sistema_seguridad_teclado_lcd.mbas,447 :: 		if ALERTA=1 then
	MOVF       _alerta+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main268
;Sistema_seguridad_teclado_lcd.mbas,448 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,449 :: 		Lcd_Out(1,1,"TIEMPO ESPERA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Sistema_seguridad_teclado_lcd.mbas,450 :: 		for counter = 0 to 10
	CLRF       _counter+0
L__main271:
;Sistema_seguridad_teclado_lcd.mbas,452 :: 		delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main275:
	DECFSZ     R13+0, 1
	GOTO       L__main275
	DECFSZ     R12+0, 1
	GOTO       L__main275
	DECFSZ     R11+0, 1
	GOTO       L__main275
	NOP
	NOP
;Sistema_seguridad_teclado_lcd.mbas,453 :: 		next counter
	MOVF       _counter+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__main274
	INCF       _counter+0, 1
	GOTO       L__main271
L__main274:
;Sistema_seguridad_teclado_lcd.mbas,454 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_seguridad_teclado_lcd.mbas,455 :: 		ALERTA=0
	CLRF       _alerta+0
L__main268:
;Sistema_seguridad_teclado_lcd.mbas,458 :: 		wend
	GOTO       L__main210
	GOTO       $+0
; end of _main
