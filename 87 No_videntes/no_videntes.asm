
no_videntes_ultrasonico1:

;no_videntes.mbas,10 :: 		dim distan,tiempo as word
;no_videntes.mbas,11 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;no_videntes.mbas,13 :: 		PORTB.RB0 = 1
	BSF        PORTB+0, 0
;no_videntes.mbas,14 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_no_videntes_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico11
	NOP
	NOP
;no_videntes.mbas,15 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;no_videntes.mbas,17 :: 		DO
L_no_videntes_ultrasonico12:
;no_videntes.mbas,18 :: 		IF( PORTB.RB1 = 1 )THEN
	BTFSS      PORTB+0, 1
	GOTO       L_no_videntes_ultrasonico18
;no_videntes.mbas,19 :: 		TMR0 = 0
	CLRF       TMR0+0
;no_videntes.mbas,20 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_no_videntes_ultrasonico18:
;no_videntes.mbas,22 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico15
	GOTO       L_no_videntes_ultrasonico12
L_no_videntes_ultrasonico15:
;no_videntes.mbas,24 :: 		DO
L_no_videntes_ultrasonico110:
;no_videntes.mbas,25 :: 		IF( PORTB.RB1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_no_videntes_ultrasonico116
;no_videntes.mbas,26 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;no_videntes.mbas,27 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_no_videntes_ultrasonico116:
;no_videntes.mbas,32 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico113
	GOTO       L_no_videntes_ultrasonico110
L_no_videntes_ultrasonico113:
;no_videntes.mbas,34 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_no_videntes_ultrasonico194:
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico195
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_no_videntes_ultrasonico194
L_no_videntes_ultrasonico195:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;no_videntes.mbas,35 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_no_videntes_ultrasonico118:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico118
	DECFSZ     R12+0, 1
	GOTO       L_no_videntes_ultrasonico118
	NOP
;no_videntes.mbas,36 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of no_videntes_ultrasonico1

no_videntes_ultrasonico2:

;no_videntes.mbas,40 :: 		dim distan,tiempo as word
;no_videntes.mbas,41 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;no_videntes.mbas,43 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;no_videntes.mbas,44 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_no_videntes_ultrasonico220:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico220
	NOP
	NOP
;no_videntes.mbas,45 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;no_videntes.mbas,47 :: 		DO
L_no_videntes_ultrasonico221:
;no_videntes.mbas,48 :: 		IF( PORTA.RA4 = 1 )THEN
	BTFSS      PORTA+0, 4
	GOTO       L_no_videntes_ultrasonico227
;no_videntes.mbas,49 :: 		TMR0 = 0
	CLRF       TMR0+0
;no_videntes.mbas,50 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_no_videntes_ultrasonico227:
;no_videntes.mbas,52 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico224
	GOTO       L_no_videntes_ultrasonico221
L_no_videntes_ultrasonico224:
;no_videntes.mbas,54 :: 		DO
L_no_videntes_ultrasonico229:
;no_videntes.mbas,55 :: 		IF( PORTA.RA4 = 0 )THEN
	BTFSC      PORTA+0, 4
	GOTO       L_no_videntes_ultrasonico235
;no_videntes.mbas,56 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;no_videntes.mbas,57 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_no_videntes_ultrasonico235:
;no_videntes.mbas,62 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico232
	GOTO       L_no_videntes_ultrasonico229
L_no_videntes_ultrasonico232:
;no_videntes.mbas,64 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_no_videntes_ultrasonico296:
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico297
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_no_videntes_ultrasonico296
L_no_videntes_ultrasonico297:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;no_videntes.mbas,65 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_no_videntes_ultrasonico237:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico237
	DECFSZ     R12+0, 1
	GOTO       L_no_videntes_ultrasonico237
	NOP
;no_videntes.mbas,66 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of no_videntes_ultrasonico2

no_videntes_ultrasonico3:

;no_videntes.mbas,70 :: 		dim distan,tiempo as word
;no_videntes.mbas,71 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
;no_videntes.mbas,73 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;no_videntes.mbas,74 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_no_videntes_ultrasonico339:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico339
	NOP
	NOP
;no_videntes.mbas,75 :: 		PORTA.RA1 = 0
	BCF        PORTA+0, 1
;no_videntes.mbas,77 :: 		DO
L_no_videntes_ultrasonico340:
;no_videntes.mbas,78 :: 		IF( PORTA.RA2 = 1 )THEN
	BTFSS      PORTA+0, 2
	GOTO       L_no_videntes_ultrasonico346
;no_videntes.mbas,79 :: 		TMR0 = 0
	CLRF       TMR0+0
;no_videntes.mbas,80 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico3_flanco+0
L_no_videntes_ultrasonico346:
;no_videntes.mbas,82 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico343
	GOTO       L_no_videntes_ultrasonico340
L_no_videntes_ultrasonico343:
;no_videntes.mbas,84 :: 		DO
L_no_videntes_ultrasonico348:
;no_videntes.mbas,85 :: 		IF( PORTA.RA2 = 0 )THEN
	BTFSC      PORTA+0, 2
	GOTO       L_no_videntes_ultrasonico354
;no_videntes.mbas,86 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico3_tiempo+0
	CLRF       ultrasonico3_tiempo+1
;no_videntes.mbas,87 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
L_no_videntes_ultrasonico354:
;no_videntes.mbas,92 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico351
	GOTO       L_no_videntes_ultrasonico348
L_no_videntes_ultrasonico351:
;no_videntes.mbas,94 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico3_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_no_videntes_ultrasonico398:
	BTFSC      STATUS+0, 2
	GOTO       L_no_videntes_ultrasonico399
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_no_videntes_ultrasonico398
L_no_videntes_ultrasonico399:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico3_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico3_distan+1
;no_videntes.mbas,95 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_no_videntes_ultrasonico356:
	DECFSZ     R13+0, 1
	GOTO       L_no_videntes_ultrasonico356
	DECFSZ     R12+0, 1
	GOTO       L_no_videntes_ultrasonico356
	NOP
;no_videntes.mbas,96 :: 		result = distan
	MOVF       ultrasonico3_distan+0, 0
	MOVWF      ultrasonico3_local_result+0
	MOVF       ultrasonico3_distan+1, 0
	MOVWF      ultrasonico3_local_result+1
	MOVF       ultrasonico3_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of no_videntes_ultrasonico3

_main:

;no_videntes.mbas,99 :: 		main:
;no_videntes.mbas,100 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;no_videntes.mbas,101 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;no_videntes.mbas,102 :: 		PORTA  =  0
	CLRF       PORTA+0
;no_videntes.mbas,103 :: 		TRISA  =  %00010100
	MOVLW      20
	MOVWF      TRISA+0
;no_videntes.mbas,104 :: 		PORTB  =  0
	CLRF       PORTB+0
;no_videntes.mbas,105 :: 		TRISB  =  %00101010
	MOVLW      42
	MOVWF      TRISB+0
;no_videntes.mbas,106 :: 		PORTC  =  0
	CLRF       PORTC+0
;no_videntes.mbas,107 :: 		TRISC  =  %10000000
	MOVLW      128
	MOVWF      TRISC+0
;no_videntes.mbas,108 :: 		ANSEL =0
	CLRF       ANSEL+0
;no_videntes.mbas,109 :: 		ANSELH = 0
	CLRF       ANSELH+0
;no_videntes.mbas,110 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;no_videntes.mbas,111 :: 		TURNO=0
	CLRF       _TURNO+0
;no_videntes.mbas,112 :: 		WHILE (1)
L__main59:
;no_videntes.mbas,122 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;no_videntes.mbas,123 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main64:
;no_videntes.mbas,125 :: 		if DATO = "F" then
	MOVF       _DATO+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;no_videntes.mbas,126 :: 		distancia1 = ultrasonico1()
	CALL       no_videntes_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;no_videntes.mbas,127 :: 		IF  distancia1 <400 then
	MOVLW      1
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main100
	MOVLW      144
	SUBWF      R0+0, 0
L__main100:
	BTFSC      STATUS+0, 0
	GOTO       L__main70
;no_videntes.mbas,128 :: 		if distancia1 <99 then
	MOVLW      0
	SUBWF      _DISTANCIA1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main101
	MOVLW      99
	SUBWF      _DISTANCIA1+0, 0
L__main101:
	BTFSC      STATUS+0, 0
	GOTO       L__main73
;no_videntes.mbas,129 :: 		WordToStr(DISTANCIA1,TEXTO)
	MOVF       _DISTANCIA1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;no_videntes.mbas,130 :: 		UART1_Write_Text(" OBJETO EN FRENTE DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,131 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,132 :: 		UART1_Write_Text(" centimetros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,133 :: 		DATO=0
	CLRF       _DATO+0
	GOTO       L__main74
;no_videntes.mbas,134 :: 		else
L__main73:
;no_videntes.mbas,135 :: 		CENTENA = DISTANCIA1/100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA1+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _CENTENA+0
	MOVF       R0+1, 0
	MOVWF      _CENTENA+1
;no_videntes.mbas,136 :: 		DECENA  = DISTANCIA1 MOD 100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA1+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _DECENA+0
	MOVF       R0+1, 0
	MOVWF      _DECENA+1
;no_videntes.mbas,137 :: 		IntToStr(CENTENA,TEXTO1)
	MOVF       _CENTENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _CENTENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,138 :: 		IntToStr(DECENA,TEXTO2)
	MOVF       _DECENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _DECENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,139 :: 		UART1_Write_Text(" OBJETO EN FRENTE DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,140 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _TEXTO1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,141 :: 		UART1_Write_Text(" punto ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,142 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,143 :: 		UART1_Write_Text(" metros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,144 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,145 :: 		end iF
L__main74:
	GOTO       L__main71
;no_videntes.mbas,146 :: 		ELSE
L__main70:
;no_videntes.mbas,147 :: 		UART1_Write_Text(" DISTANCIA FUERA DE ALCANCE EN FRENTE ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,148 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,149 :: 		END IF
L__main71:
L__main67:
;no_videntes.mbas,152 :: 		if DATO = "I" then
	MOVF       _DATO+0, 0
	XORLW      73
	BTFSS      STATUS+0, 2
	GOTO       L__main76
;no_videntes.mbas,153 :: 		distancia2 = ultrasonico2()
	CALL       no_videntes_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA2+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA2+1
;no_videntes.mbas,154 :: 		IF  distancia2 <400 then
	MOVLW      1
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main102
	MOVLW      144
	SUBWF      R0+0, 0
L__main102:
	BTFSC      STATUS+0, 0
	GOTO       L__main79
;no_videntes.mbas,155 :: 		if distancia2 <99 then
	MOVLW      0
	SUBWF      _DISTANCIA2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main103
	MOVLW      99
	SUBWF      _DISTANCIA2+0, 0
L__main103:
	BTFSC      STATUS+0, 0
	GOTO       L__main82
;no_videntes.mbas,156 :: 		WordToStr(DISTANCIA2,TEXTO)
	MOVF       _DISTANCIA2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;no_videntes.mbas,157 :: 		UART1_Write_Text(" OBJETO A LA IZQUIERDA DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,158 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,159 :: 		UART1_Write_Text(" centimetros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,160 :: 		DATO=0
	CLRF       _DATO+0
	GOTO       L__main83
;no_videntes.mbas,161 :: 		else
L__main82:
;no_videntes.mbas,162 :: 		CENTENA = DISTANCIA2/100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA2+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _CENTENA+0
	MOVF       R0+1, 0
	MOVWF      _CENTENA+1
;no_videntes.mbas,163 :: 		DECENA  = DISTANCIA2 MOD 100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA2+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA2+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _DECENA+0
	MOVF       R0+1, 0
	MOVWF      _DECENA+1
;no_videntes.mbas,164 :: 		IntToStr(CENTENA,TEXTO1)
	MOVF       _CENTENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _CENTENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,165 :: 		IntToStr(DECENA,TEXTO2)
	MOVF       _DECENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _DECENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,166 :: 		UART1_Write_Text(" OBJETO A LA IZQUIERDA DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,167 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _TEXTO1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,168 :: 		UART1_Write_Text(" punto ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,169 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,170 :: 		UART1_Write_Text(" metros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,171 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,172 :: 		end iF
L__main83:
	GOTO       L__main80
;no_videntes.mbas,173 :: 		ELSE
L__main79:
;no_videntes.mbas,174 :: 		UART1_Write_Text(" DISTANCIA FUERA DE ALCANCE A LA IZQUIERDA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,175 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,176 :: 		END IF
L__main80:
;no_videntes.mbas,177 :: 		distancia3 = ultrasonico3()
	CALL       no_videntes_ultrasonico3+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA3+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA3+1
;no_videntes.mbas,178 :: 		IF  distancia3 <400 then
	MOVLW      1
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main104
	MOVLW      144
	SUBWF      R0+0, 0
L__main104:
	BTFSC      STATUS+0, 0
	GOTO       L__main85
;no_videntes.mbas,179 :: 		if distancia3 <99 then
	MOVLW      0
	SUBWF      _DISTANCIA3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main105
	MOVLW      99
	SUBWF      _DISTANCIA3+0, 0
L__main105:
	BTFSC      STATUS+0, 0
	GOTO       L__main88
;no_videntes.mbas,180 :: 		WordToStr(DISTANCIA3,TEXTO)
	MOVF       _DISTANCIA3+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA3+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;no_videntes.mbas,181 :: 		UART1_Write_Text(" OBJETO A LA DERECHA DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,182 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,183 :: 		UART1_Write_Text(" centimetros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,184 :: 		DATO=0
	CLRF       _DATO+0
	GOTO       L__main89
;no_videntes.mbas,185 :: 		else
L__main88:
;no_videntes.mbas,186 :: 		CENTENA = DISTANCIA3/100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA3+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA3+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _CENTENA+0
	MOVF       R0+1, 0
	MOVWF      _CENTENA+1
;no_videntes.mbas,187 :: 		DECENA  = DISTANCIA3 MOD 100
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _DISTANCIA3+0, 0
	MOVWF      R0+0
	MOVF       _DISTANCIA3+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _DECENA+0
	MOVF       R0+1, 0
	MOVWF      _DECENA+1
;no_videntes.mbas,188 :: 		IntToStr(CENTENA,TEXTO1)
	MOVF       _CENTENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _CENTENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,189 :: 		IntToStr(DECENA,TEXTO2)
	MOVF       _DECENA+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _DECENA+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;no_videntes.mbas,190 :: 		UART1_Write_Text(" OBJETO A LA DERECHA DISTANCIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,191 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _TEXTO1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,192 :: 		UART1_Write_Text(" punto ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,193 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,194 :: 		UART1_Write_Text(" metros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,195 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,196 :: 		end iF
L__main89:
	GOTO       L__main86
;no_videntes.mbas,197 :: 		ELSE
L__main85:
;no_videntes.mbas,198 :: 		UART1_Write_Text(" DISTANCIA FUERA DE ALCANCE A LA DERECHA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,199 :: 		DATO=0
	CLRF       _DATO+0
;no_videntes.mbas,200 :: 		END IF
L__main86:
L__main76:
;no_videntes.mbas,202 :: 		if DATO = "D" then
	MOVF       _DATO+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main91
;no_videntes.mbas,203 :: 		UART1_Write_Text("mensaje")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      109
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
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      106
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes.mbas,204 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;no_videntes.mbas,205 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;no_videntes.mbas,206 :: 		DATO=0
	CLRF       _DATO+0
L__main91:
;no_videntes.mbas,208 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main93:
	DECFSZ     R13+0, 1
	GOTO       L__main93
	DECFSZ     R12+0, 1
	GOTO       L__main93
	DECFSZ     R11+0, 1
	GOTO       L__main93
	NOP
;no_videntes.mbas,209 :: 		WEND
	GOTO       L__main59
	GOTO       $+0
; end of _main
