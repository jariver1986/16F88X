
master_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;master.mbas,25 :: 		sub procedure interrupt
;master.mbas,26 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_master_interrupt2
;master.mbas,27 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;master.mbas,28 :: 		recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _RECEP+0
L_master_interrupt2:
;master.mbas,31 :: 		INTCON = INTCON or 0xC0
	MOVLW      192
	IORWF      INTCON+0, 1
L_master_interrupt111:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of master_interrupt

master_sonido:

;master.mbas,33 :: 		sub procedure sonido()
;master.mbas,34 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;master.mbas,35 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_master_sonido5:
	DECFSZ     R13+0, 1
	GOTO       L_master_sonido5
	DECFSZ     R12+0, 1
	GOTO       L_master_sonido5
	DECFSZ     R11+0, 1
	GOTO       L_master_sonido5
	NOP
;master.mbas,36 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;master.mbas,37 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_master_sonido6:
	DECFSZ     R13+0, 1
	GOTO       L_master_sonido6
	DECFSZ     R12+0, 1
	GOTO       L_master_sonido6
	DECFSZ     R11+0, 1
	GOTO       L_master_sonido6
	NOP
	RETURN
; end of master_sonido

master_led:

;master.mbas,39 :: 		sub procedure led()
;master.mbas,40 :: 		PORTD.RD3 = 0
	BCF        PORTD+0, 3
;master.mbas,41 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_master_led8:
	DECFSZ     R13+0, 1
	GOTO       L_master_led8
	DECFSZ     R12+0, 1
	GOTO       L_master_led8
	DECFSZ     R11+0, 1
	GOTO       L_master_led8
	NOP
;master.mbas,42 :: 		PORTD.RD3 = 1
	BSF        PORTD+0, 3
;master.mbas,43 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_master_led9:
	DECFSZ     R13+0, 1
	GOTO       L_master_led9
	DECFSZ     R12+0, 1
	GOTO       L_master_led9
	DECFSZ     R11+0, 1
	GOTO       L_master_led9
	NOP
	RETURN
; end of master_led

master_temperatura:

;master.mbas,45 :: 		sub procedure temperatura
	RETURN
; end of master_temperatura

master_ultrasonico1:

;master.mbas,51 :: 		dim distan,tiempo as word
;master.mbas,52 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;master.mbas,54 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;master.mbas,55 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_master_ultrasonico112:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico112
	NOP
	NOP
;master.mbas,56 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;master.mbas,58 :: 		DO
L_master_ultrasonico113:
;master.mbas,59 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_master_ultrasonico119
;master.mbas,60 :: 		TMR0 = 0
	CLRF       TMR0+0
;master.mbas,61 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_master_ultrasonico119:
;master.mbas,63 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico116
	GOTO       L_master_ultrasonico113
L_master_ultrasonico116:
;master.mbas,65 :: 		DO
L_master_ultrasonico121:
;master.mbas,66 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_master_ultrasonico127
;master.mbas,67 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;master.mbas,68 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_master_ultrasonico127:
;master.mbas,73 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico124
	GOTO       L_master_ultrasonico121
L_master_ultrasonico124:
;master.mbas,75 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_master_ultrasonico1112:
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico1113
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_master_ultrasonico1112
L_master_ultrasonico1113:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;master.mbas,76 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_master_ultrasonico129:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico129
	DECFSZ     R12+0, 1
	GOTO       L_master_ultrasonico129
	NOP
;master.mbas,77 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of master_ultrasonico1

master_ultrasonico2:

;master.mbas,81 :: 		dim distan,tiempo as word
;master.mbas,82 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;master.mbas,84 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;master.mbas,85 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_master_ultrasonico231:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico231
	NOP
	NOP
;master.mbas,86 :: 		PORTC.RC2 = 0
	BCF        PORTC+0, 2
;master.mbas,88 :: 		DO
L_master_ultrasonico232:
;master.mbas,89 :: 		IF( PORTC.RC3 = 1 )THEN
	BTFSS      PORTC+0, 3
	GOTO       L_master_ultrasonico238
;master.mbas,90 :: 		TMR0 = 0
	CLRF       TMR0+0
;master.mbas,91 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_master_ultrasonico238:
;master.mbas,93 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico235
	GOTO       L_master_ultrasonico232
L_master_ultrasonico235:
;master.mbas,95 :: 		DO
L_master_ultrasonico240:
;master.mbas,96 :: 		IF( PORTC.RC3 = 0 )THEN
	BTFSC      PORTC+0, 3
	GOTO       L_master_ultrasonico246
;master.mbas,97 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;master.mbas,98 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_master_ultrasonico246:
;master.mbas,103 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico243
	GOTO       L_master_ultrasonico240
L_master_ultrasonico243:
;master.mbas,105 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_master_ultrasonico2114:
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico2115
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_master_ultrasonico2114
L_master_ultrasonico2115:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;master.mbas,106 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_master_ultrasonico248:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico248
	DECFSZ     R12+0, 1
	GOTO       L_master_ultrasonico248
	NOP
;master.mbas,107 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of master_ultrasonico2

master_ultrasonico3:

;master.mbas,111 :: 		dim distan,tiempo as word
;master.mbas,112 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
;master.mbas,114 :: 		PORTD.RD0 = 1
	BSF        PORTD+0, 0
;master.mbas,115 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_master_ultrasonico350:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico350
	NOP
	NOP
;master.mbas,116 :: 		PORTD.RD0 = 0
	BCF        PORTD+0, 0
;master.mbas,118 :: 		DO
L_master_ultrasonico351:
;master.mbas,119 :: 		IF( PORTD.RD1 = 1 )THEN
	BTFSS      PORTD+0, 1
	GOTO       L_master_ultrasonico357
;master.mbas,120 :: 		TMR0 = 0
	CLRF       TMR0+0
;master.mbas,121 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico3_flanco+0
L_master_ultrasonico357:
;master.mbas,123 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico354
	GOTO       L_master_ultrasonico351
L_master_ultrasonico354:
;master.mbas,125 :: 		DO
L_master_ultrasonico359:
;master.mbas,126 :: 		IF( PORTD.RD1 = 0 )THEN
	BTFSC      PORTD+0, 1
	GOTO       L_master_ultrasonico365
;master.mbas,127 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico3_tiempo+0
	CLRF       ultrasonico3_tiempo+1
;master.mbas,128 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
L_master_ultrasonico365:
;master.mbas,133 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico362
	GOTO       L_master_ultrasonico359
L_master_ultrasonico362:
;master.mbas,135 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico3_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_master_ultrasonico3116:
	BTFSC      STATUS+0, 2
	GOTO       L_master_ultrasonico3117
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_master_ultrasonico3116
L_master_ultrasonico3117:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico3_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico3_distan+1
;master.mbas,136 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_master_ultrasonico367:
	DECFSZ     R13+0, 1
	GOTO       L_master_ultrasonico367
	DECFSZ     R12+0, 1
	GOTO       L_master_ultrasonico367
	NOP
;master.mbas,137 :: 		result = distan
	MOVF       ultrasonico3_distan+0, 0
	MOVWF      ultrasonico3_local_result+0
	MOVF       ultrasonico3_distan+1, 0
	MOVWF      ultrasonico3_local_result+1
	MOVF       ultrasonico3_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of master_ultrasonico3

_main:

;master.mbas,139 :: 		main:
;master.mbas,140 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;master.mbas,141 :: 		OSCCON  = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;master.mbas,142 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;master.mbas,143 :: 		TRISA   = %00000111
	MOVLW      7
	MOVWF      TRISA+0
;master.mbas,144 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;master.mbas,145 :: 		TRISB   = %00111111
	MOVLW      63
	MOVWF      TRISB+0
;master.mbas,146 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;master.mbas,147 :: 		TRISC   = %10011010
	MOVLW      154
	MOVWF      TRISC+0
;master.mbas,148 :: 		PORTD   = %00001000
	MOVLW      8
	MOVWF      PORTD+0
;master.mbas,149 :: 		TRISD   = %00000010
	MOVLW      2
	MOVWF      TRISD+0
;master.mbas,150 :: 		ANSEL   = %00000111
	MOVLW      7
	MOVWF      ANSEL+0
;master.mbas,151 :: 		ANSELH  = %00111111
	MOVLW      63
	MOVWF      ANSELH+0
;master.mbas,152 :: 		INTCON = 0XC0
	MOVLW      192
	MOVWF      INTCON+0
;master.mbas,153 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;master.mbas,154 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;master.mbas,155 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;master.mbas,157 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;master.mbas,158 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;master.mbas,159 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;master.mbas,164 :: 		LED
	CALL       master_led+0
;master.mbas,165 :: 		SONIDO
	CALL       master_sonido+0
;master.mbas,167 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;master.mbas,168 :: 		Lcd_Out(4,1,"LOADING")                 ' escribe la cadena en la primera fila
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,169 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main69:
	DECFSZ     R13+0, 1
	GOTO       L__main69
	DECFSZ     R12+0, 1
	GOTO       L__main69
	DECFSZ     R11+0, 1
	GOTO       L__main69
	NOP
	NOP
;master.mbas,170 :: 		Lcd_Out(4,1,"LOADING.")                 ' escribe la cadena en la primera fila
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,171 :: 		Delay_ms(700)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      142
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	DECFSZ     R12+0, 1
	GOTO       L__main70
	DECFSZ     R11+0, 1
	GOTO       L__main70
	NOP
;master.mbas,172 :: 		Lcd_Out(4,1,"LOADING..")                 ' escribe la cadena en la primera fila
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,173 :: 		Delay_ms(800)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__main71:
	DECFSZ     R13+0, 1
	GOTO       L__main71
	DECFSZ     R12+0, 1
	GOTO       L__main71
	DECFSZ     R11+0, 1
	GOTO       L__main71
;master.mbas,174 :: 		Lcd_Out(4,1,"LOADING...")                 ' escribe la cadena en la primera fila
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,175 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main72:
	DECFSZ     R13+0, 1
	GOTO       L__main72
	DECFSZ     R12+0, 1
	GOTO       L__main72
	DECFSZ     R11+0, 1
	GOTO       L__main72
	NOP
	NOP
;master.mbas,176 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;master.mbas,177 :: 		TEXTO1=""
	CLRF       _TEXTO1+0
;master.mbas,178 :: 		TEXTO2=""
	CLRF       _TEXTO2+0
;master.mbas,179 :: 		TEXTO3=""
	CLRF       _TEXTO3+0
;master.mbas,180 :: 		TEXTO4=""
	CLRF       _TEXTO4+0
;master.mbas,181 :: 		TEXTO5=""
	CLRF       _TEXTO5+0
;master.mbas,182 :: 		TEXTO6=""
	CLRF       _TEXTO6+0
;master.mbas,183 :: 		TEXTO7=""
	CLRF       _TEXTO7+0
;master.mbas,184 :: 		TEXTO8=""
	CLRF       _TEXTO8+0
;master.mbas,185 :: 		TEXTO9=""
	CLRF       _TEXTO9+0
;master.mbas,186 :: 		while 1
L__main74:
;master.mbas,188 :: 		if recep="1" then
	MOVF       _RECEP+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main79
;master.mbas,189 :: 		dato = (Adc_Read(0)*100)/1024
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main118:
	BTFSC      STATUS+0, 2
	GOTO       L__main119
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main118
L__main119:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,190 :: 		WordToStr(DATO,TEXTO1)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,191 :: 		Lcd_Out(1,1,"MQ135:")      'ra0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      53
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
;master.mbas,192 :: 		Lcd_Out(1,10,TEXTO1)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,193 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main81:
	DECFSZ     R13+0, 1
	GOTO       L__main81
	DECFSZ     R12+0, 1
	GOTO       L__main81
	NOP
;master.mbas,194 :: 		textotal = "A"+texto1+"B"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO1+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,195 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,196 :: 		recep=0
	CLRF       _RECEP+0
L__main79:
;master.mbas,200 :: 		if recep="2" then
	MOVF       _RECEP+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main83
;master.mbas,201 :: 		dato = (Adc_Read(1)*100)/1024
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main120:
	BTFSC      STATUS+0, 2
	GOTO       L__main121
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main120
L__main121:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,202 :: 		WordToStr(DATO,TEXTO2)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,203 :: 		Lcd_Out(2,1,"MQ7:")         'ra1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
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
;master.mbas,204 :: 		Lcd_Out(2,10,TEXTO2)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,205 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main85:
	DECFSZ     R13+0, 1
	GOTO       L__main85
	DECFSZ     R12+0, 1
	GOTO       L__main85
	NOP
;master.mbas,206 :: 		textotal = "C"+texto2+"D"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO2+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,207 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,208 :: 		recep=0
	CLRF       _RECEP+0
L__main83:
;master.mbas,212 :: 		if recep="3" then
	MOVF       _RECEP+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main87
;master.mbas,213 :: 		dato = (Adc_Read(8)*100)/1024
	MOVLW      8
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main122:
	BTFSC      STATUS+0, 2
	GOTO       L__main123
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main122
L__main123:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,214 :: 		WordToStr(DATO,TEXTO3)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO3+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,215 :: 		Lcd_Out(3,1,"MQ8:")  'rb2
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
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
;master.mbas,216 :: 		Lcd_Out(3,10,TEXTO3)
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,217 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main89:
	DECFSZ     R13+0, 1
	GOTO       L__main89
	DECFSZ     R12+0, 1
	GOTO       L__main89
	NOP
;master.mbas,218 :: 		textotal = "E"+texto3+"F"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO3+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,219 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,220 :: 		recep=0
	CLRF       _RECEP+0
L__main87:
;master.mbas,224 :: 		if recep="4" then
	MOVF       _RECEP+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main91
;master.mbas,225 :: 		dato = (Adc_Read(9)*100)/1024
	MOVLW      9
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main124:
	BTFSC      STATUS+0, 2
	GOTO       L__main125
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main124
L__main125:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,226 :: 		WordToStr(DATO,TEXTO4)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO4+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,227 :: 		Lcd_Out(4,1,"MQ131:") 'rb3
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
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
;master.mbas,228 :: 		Lcd_Out(4,10,TEXTO4)
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,229 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main93:
	DECFSZ     R13+0, FLOC__main+0
	GOTO       L__main93
	DECFSZ     R12+0, FLOC__main+0
	GOTO       L__main93
	DECFSZ     R11+0, FLOC__main+0
	GOTO       L__main93
	NOP
	NOP
;master.mbas,230 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;master.mbas,231 :: 		textotal = "G"+texto4+"H"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO4+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,232 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,233 :: 		recep=0
	CLRF       _RECEP+0
L__main91:
;master.mbas,237 :: 		if recep="5" then
	MOVF       _RECEP+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main95
;master.mbas,238 :: 		dato = (Adc_Read(10)*100)/1024
	MOVLW      10
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main126:
	BTFSC      STATUS+0, 2
	GOTO       L__main127
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main126
L__main127:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,239 :: 		WordToStr(DATO,TEXTO5)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO5+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,240 :: 		Lcd_Out(1,1,"MQ3:")    'rb1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
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
;master.mbas,241 :: 		Lcd_Out(1,10,TEXTO5)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,242 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main97:
	DECFSZ     R13+0, FLOC__main+0
	GOTO       L__main97
	DECFSZ     R12+0, FLOC__main+0
	GOTO       L__main97
	NOP
;master.mbas,243 :: 		textotal = "I"+texto5+"J"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO5+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,244 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,245 :: 		recep=0
	CLRF       _RECEP+0
L__main95:
;master.mbas,248 :: 		if recep="6" then
	MOVF       _RECEP+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main99
;master.mbas,249 :: 		dato = (Adc_Read(11)*100)/1024
	MOVLW      11
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main128:
	BTFSC      STATUS+0, 2
	GOTO       L__main129
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main128
L__main129:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,250 :: 		WordToStr(DATO,TEXTO6)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO6+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,251 :: 		Lcd_Out(2,1,"MG811:")  'rb4
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
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
;master.mbas,252 :: 		Lcd_Out(2,10,TEXTO6)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,253 :: 		textotal = "K"+texto6+"L"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      75
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO6+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,254 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,255 :: 		recep=0
	CLRF       _RECEP+0
L__main99:
;master.mbas,258 :: 		if recep="7" then
	MOVF       _RECEP+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L__main102
;master.mbas,259 :: 		dato = (Adc_Read(12)*100)/1024
	MOVLW      12
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main130:
	BTFSC      STATUS+0, 2
	GOTO       L__main131
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main130
L__main131:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,260 :: 		WordToStr(DATO,TEXTO7)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO7+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,261 :: 		Lcd_Out(3,1,"HUMEDAD AMB.:") 'rb0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;master.mbas,262 :: 		Lcd_Out(3,14,TEXTO7)
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,263 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main104:
	DECFSZ     R13+0, FLOC__main+0
	GOTO       L__main104
	DECFSZ     R12+0, FLOC__main+0
	GOTO       L__main104
	NOP
;master.mbas,266 :: 		textotal = "M"+texto7+"N"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO7+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,267 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,268 :: 		recep=0
	CLRF       _RECEP+0
L__main102:
;master.mbas,273 :: 		if recep="8" then
	MOVF       _RECEP+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L__main106
;master.mbas,274 :: 		dato = (Adc_Read(13)*100)/1024
	MOVLW      13
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main132:
	BTFSC      STATUS+0, 2
	GOTO       L__main133
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main132
L__main133:
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;master.mbas,275 :: 		WordToStr(DATO,TEXTO8)
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO8+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;master.mbas,276 :: 		Lcd_Out(4,1,"HUMEDAD REL.:")   'rb5
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;master.mbas,277 :: 		Lcd_Out(4,14,TEXTO8)
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO8+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,280 :: 		textotal = "O"+texto8+"P"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO8+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,281 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,282 :: 		recep=0
	CLRF       _RECEP+0
L__main106:
;master.mbas,285 :: 		if recep="9" then
	MOVF       _RECEP+0, 0
	XORLW      57
	BTFSS      STATUS+0, 2
	GOTO       L__main109
;master.mbas,286 :: 		valor = Adc_Read(2)*0.488
	MOVLW      2
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	CALL       _Word2Double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;master.mbas,287 :: 		FloatToStr(VALOR,TEXTO9)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _TEXTO9+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;master.mbas,288 :: 		Lcd_Out(1,1,"TEMPERATURA[°C]:")      'ra0
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
	MOVLW      77
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
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      176
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
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
;master.mbas,289 :: 		Lcd_Out(2,10,TEXTO9)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO9+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;master.mbas,291 :: 		textotal = "Q"+texto9+"R"
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      _TEXTO9+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _textotal+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;master.mbas,292 :: 		UART1_Write_Text(TEXTOTAL)
	MOVLW      _textotal+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;master.mbas,293 :: 		recep=0
	CLRF       _RECEP+0
L__main109:
;master.mbas,309 :: 		wend
	GOTO       L__main74
	GOTO       $+0
; end of _main
