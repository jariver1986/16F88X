
control_parqueo_ultrasonico1:

;control_parqueo.mbas,29 :: 		dim distan,tiempo as word
;control_parqueo.mbas,30 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;control_parqueo.mbas,32 :: 		disparo1 = 1
	BSF        PORTA+0, 0
;control_parqueo.mbas,33 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_control_parqueo_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_ultrasonico11
	NOP
;control_parqueo.mbas,34 :: 		disparo1 = 0
	BCF        PORTA+0, 0
;control_parqueo.mbas,36 :: 		DO
L_control_parqueo_ultrasonico12:
;control_parqueo.mbas,37 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTA+0, 1
	GOTO       L_control_parqueo_ultrasonico18
;control_parqueo.mbas,38 :: 		TMR0 = 0
	CLRF       TMR0+0
;control_parqueo.mbas,39 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_control_parqueo_ultrasonico18:
;control_parqueo.mbas,41 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico15
	GOTO       L_control_parqueo_ultrasonico12
L_control_parqueo_ultrasonico15:
;control_parqueo.mbas,43 :: 		DO
L_control_parqueo_ultrasonico110:
;control_parqueo.mbas,44 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTA+0, 1
	GOTO       L_control_parqueo_ultrasonico116
;control_parqueo.mbas,45 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;control_parqueo.mbas,46 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_control_parqueo_ultrasonico116:
;control_parqueo.mbas,48 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_control_parqueo_ultrasonico119
;control_parqueo.mbas,49 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_control_parqueo_ultrasonico119:
;control_parqueo.mbas,51 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico113
	GOTO       L_control_parqueo_ultrasonico110
L_control_parqueo_ultrasonico113:
;control_parqueo.mbas,53 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_control_parqueo_ultrasonico186:
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico187
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_control_parqueo_ultrasonico186
L_control_parqueo_ultrasonico187:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;control_parqueo.mbas,54 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_control_parqueo_ultrasonico121:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_ultrasonico121
	DECFSZ     R12+0, 1
	GOTO       L_control_parqueo_ultrasonico121
	NOP
;control_parqueo.mbas,55 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of control_parqueo_ultrasonico1

control_parqueo_ultrasonico2:

;control_parqueo.mbas,60 :: 		dim distan,tiempo as word
;control_parqueo.mbas,62 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;control_parqueo.mbas,64 :: 		disparo2 = 1
	BSF        PORTA+0, 2
;control_parqueo.mbas,65 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_control_parqueo_ultrasonico223:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_ultrasonico223
	NOP
;control_parqueo.mbas,66 :: 		disparo2 = 0
	BCF        PORTA+0, 2
;control_parqueo.mbas,68 :: 		DO
L_control_parqueo_ultrasonico224:
;control_parqueo.mbas,69 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTA+0, 3
	GOTO       L_control_parqueo_ultrasonico230
;control_parqueo.mbas,70 :: 		TMR0 = 0
	CLRF       TMR0+0
;control_parqueo.mbas,71 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_control_parqueo_ultrasonico230:
;control_parqueo.mbas,73 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico227
	GOTO       L_control_parqueo_ultrasonico224
L_control_parqueo_ultrasonico227:
;control_parqueo.mbas,75 :: 		DO
L_control_parqueo_ultrasonico232:
;control_parqueo.mbas,76 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTA+0, 3
	GOTO       L_control_parqueo_ultrasonico238
;control_parqueo.mbas,77 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;control_parqueo.mbas,78 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_control_parqueo_ultrasonico238:
;control_parqueo.mbas,80 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_control_parqueo_ultrasonico241
;control_parqueo.mbas,81 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_control_parqueo_ultrasonico241:
;control_parqueo.mbas,83 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico235
	GOTO       L_control_parqueo_ultrasonico232
L_control_parqueo_ultrasonico235:
;control_parqueo.mbas,85 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_control_parqueo_ultrasonico288:
	BTFSC      STATUS+0, 2
	GOTO       L_control_parqueo_ultrasonico289
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_control_parqueo_ultrasonico288
L_control_parqueo_ultrasonico289:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;control_parqueo.mbas,86 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_control_parqueo_ultrasonico243:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_ultrasonico243
	DECFSZ     R12+0, 1
	GOTO       L_control_parqueo_ultrasonico243
	NOP
;control_parqueo.mbas,87 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of control_parqueo_ultrasonico2

control_parqueo_servomotor_arriba:

;control_parqueo.mbas,90 :: 		sub procedure servomotor_arriba()
;control_parqueo.mbas,91 :: 		contador=0
	CLRF       _contador+0
	CLRF       _contador+1
;control_parqueo.mbas,92 :: 		while (contador<255)
L_control_parqueo_servomotor_arriba46:
	MOVLW      0
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_control_parqueo_servomotor_arriba90
	MOVLW      255
	SUBWF      _contador+0, 0
L_control_parqueo_servomotor_arriba90:
	BTFSC      STATUS+0, 0
	GOTO       L_control_parqueo_servomotor_arriba47
;control_parqueo.mbas,93 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;control_parqueo.mbas,94 :: 		Delay_us(1400)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      208
	MOVWF      R13+0
L_control_parqueo_servomotor_arriba50:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_servomotor_arriba50
	DECFSZ     R12+0, 1
	GOTO       L_control_parqueo_servomotor_arriba50
	NOP
;control_parqueo.mbas,95 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;control_parqueo.mbas,96 :: 		Delay_us(600)
	MOVLW      199
	MOVWF      R13+0
L_control_parqueo_servomotor_arriba51:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_servomotor_arriba51
	NOP
	NOP
;control_parqueo.mbas,97 :: 		inc(contador)
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;control_parqueo.mbas,98 :: 		wend
	GOTO       L_control_parqueo_servomotor_arriba46
L_control_parqueo_servomotor_arriba47:
	RETURN
; end of control_parqueo_servomotor_arriba

control_parqueo_servomotor_abajo:

;control_parqueo.mbas,101 :: 		sub procedure servomotor_abajo()
;control_parqueo.mbas,102 :: 		contador=0
	CLRF       _contador+0
	CLRF       _contador+1
;control_parqueo.mbas,103 :: 		while (contador<255)
L_control_parqueo_servomotor_abajo54:
	MOVLW      0
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_control_parqueo_servomotor_abajo91
	MOVLW      255
	SUBWF      _contador+0, 0
L_control_parqueo_servomotor_abajo91:
	BTFSC      STATUS+0, 0
	GOTO       L_control_parqueo_servomotor_abajo55
;control_parqueo.mbas,104 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;control_parqueo.mbas,105 :: 		Delay_us(1600)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_control_parqueo_servomotor_abajo58:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_servomotor_abajo58
	DECFSZ     R12+0, 1
	GOTO       L_control_parqueo_servomotor_abajo58
	NOP
;control_parqueo.mbas,106 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;control_parqueo.mbas,107 :: 		Delay_us(400)
	MOVLW      133
	MOVWF      R13+0
L_control_parqueo_servomotor_abajo59:
	DECFSZ     R13+0, 1
	GOTO       L_control_parqueo_servomotor_abajo59
;control_parqueo.mbas,108 :: 		inc(contador)
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;control_parqueo.mbas,109 :: 		wend
	GOTO       L_control_parqueo_servomotor_abajo54
L_control_parqueo_servomotor_abajo55:
	RETURN
; end of control_parqueo_servomotor_abajo

_main:

;control_parqueo.mbas,112 :: 		main:
;control_parqueo.mbas,113 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;control_parqueo.mbas,114 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;control_parqueo.mbas,115 :: 		PORTA   =%00000000
	CLRF       PORTA+0
;control_parqueo.mbas,116 :: 		TRISA   =%11001010
	MOVLW      202
	MOVWF      TRISA+0
;control_parqueo.mbas,117 :: 		PORTB   =%00000000
	CLRF       PORTB+0
;control_parqueo.mbas,118 :: 		TRISB   =%00000000
	CLRF       TRISB+0
;control_parqueo.mbas,119 :: 		PORTC   =%00000000
	CLRF       PORTC+0
;control_parqueo.mbas,120 :: 		TRISC   =%10000000
	MOVLW      128
	MOVWF      TRISC+0
;control_parqueo.mbas,121 :: 		PORTD   =%00000000
	CLRF       PORTD+0
;control_parqueo.mbas,122 :: 		TRISD   =%00000000
	CLRF       TRISD+0
;control_parqueo.mbas,123 :: 		ANSEL   =%00000000
	CLRF       ANSEL+0
;control_parqueo.mbas,124 :: 		ANSELH  =%00000000
	CLRF       ANSELH+0
;control_parqueo.mbas,125 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_parqueo.mbas,126 :: 		WPUB= 0XFF
	MOVLW      255
	MOVWF      WPUB+0
;control_parqueo.mbas,127 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;control_parqueo.mbas,128 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_parqueo.mbas,129 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_parqueo.mbas,130 :: 		Lcd_Out(1,1,"    ESPOL")
	MOVLW      1
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;control_parqueo.mbas,131 :: 		Lcd_Out(2,1,"    2014")
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
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_parqueo.mbas,132 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;control_parqueo.mbas,133 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;control_parqueo.mbas,134 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_parqueo.mbas,136 :: 		while (1)
L__main62:
;control_parqueo.mbas,178 :: 		if ((PORTA.RA6=1) AND (PORTA.RA7=1)) then
	BTFSC      PORTA+0, 6
	GOTO       L__main92
	BCF        114, 0
	GOTO       L__main93
L__main92:
	BSF        114, 0
L__main93:
	CLRF       R1+0
	BTFSS      PORTA+0, 7
	GOTO       L__main69
	MOVLW      255
	MOVWF      R1+0
L__main69:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main67
;control_parqueo.mbas,179 :: 		UART1_Write_Text("O")  'OCUPADO
	MOVLW      79
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_parqueo.mbas,180 :: 		Lcd_Out(1,1,"ESTACIONAMIENTO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_parqueo.mbas,181 :: 		Lcd_Out(2,1,"OCUPADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
L__main67:
;control_parqueo.mbas,184 :: 		if ((PORTA.RA6=0) AND (PORTA.RA7=0)) then
	BTFSC      PORTA+0, 6
	GOTO       L__main94
	BSF        114, 0
	GOTO       L__main95
L__main94:
	BCF        114, 0
L__main95:
	CLRF       R1+0
	BTFSC      PORTA+0, 7
	GOTO       L__main73
	MOVLW      255
	MOVWF      R1+0
L__main73:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main71
;control_parqueo.mbas,185 :: 		UART1_Write_Text("D")  'DESOCUPADO
	MOVLW      68
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_parqueo.mbas,186 :: 		Lcd_Out(1,1,"ESTACIONAMIENTO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_parqueo.mbas,187 :: 		Lcd_Out(2,1,"DESOCUPADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
L__main71:
;control_parqueo.mbas,190 :: 		if (PORTA.RA6=1) then
	BTFSS      PORTA+0, 6
	GOTO       L__main75
;control_parqueo.mbas,191 :: 		if ( PORTA.RA7=0) then
	BTFSC      PORTA+0, 7
	GOTO       L__main78
;control_parqueo.mbas,192 :: 		UART1_Write_Text("E")  'ESPACIO
	MOVLW      69
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_parqueo.mbas,193 :: 		Lcd_Out(1,1,"ESTACIONAMIENTO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_parqueo.mbas,194 :: 		Lcd_Out(2,1,"DESOCUPADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
L__main78:
;control_parqueo.mbas,195 :: 		end if
L__main75:
;control_parqueo.mbas,197 :: 		if (PORTA.RA7=1) then
	BTFSS      PORTA+0, 7
	GOTO       L__main81
;control_parqueo.mbas,198 :: 		if (PORTA.RA6=0) then
	BTFSC      PORTA+0, 6
	GOTO       L__main84
;control_parqueo.mbas,199 :: 		UART1_Write_Text("F")  'ESPACIO
	MOVLW      70
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_parqueo.mbas,200 :: 		Lcd_Out(1,1,"ESTACIONAMIENTO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_parqueo.mbas,201 :: 		Lcd_Out(2,1,"DESOCUPADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
L__main84:
;control_parqueo.mbas,202 :: 		end if
L__main81:
;control_parqueo.mbas,204 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;control_parqueo.mbas,205 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_parqueo.mbas,206 :: 		wend
	GOTO       L__main62
	GOTO       $+0
; end of _main
