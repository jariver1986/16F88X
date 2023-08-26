
temperatura_sonido:

;temperatura.mbas,5 :: 		sub procedure sonido
;temperatura.mbas,6 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;temperatura.mbas,7 :: 		PORTD.RD1=1
	BSF        PORTD+0, 1
;temperatura.mbas,8 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_temperatura_sonido1:
	DECFSZ     R13+0, 1
	GOTO       L_temperatura_sonido1
	DECFSZ     R12+0, 1
	GOTO       L_temperatura_sonido1
	DECFSZ     R11+0, 1
	GOTO       L_temperatura_sonido1
;temperatura.mbas,9 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;temperatura.mbas,10 :: 		PORTD.RD1=0
	BCF        PORTD+0, 1
;temperatura.mbas,11 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_temperatura_sonido2:
	DECFSZ     R13+0, 1
	GOTO       L_temperatura_sonido2
	DECFSZ     R12+0, 1
	GOTO       L_temperatura_sonido2
	DECFSZ     R11+0, 1
	GOTO       L_temperatura_sonido2
	RETURN
; end of temperatura_sonido

_main:

;temperatura.mbas,13 :: 		main:
;temperatura.mbas,15 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;temperatura.mbas,17 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;temperatura.mbas,19 :: 		TRISA = 0X00 ' porta.5 como entrada digital
	CLRF       TRISA+0
;temperatura.mbas,20 :: 		PORTA = 0X00
	CLRF       PORTA+0
;temperatura.mbas,22 :: 		TRISB = 0XFF ' porta.5 como entrada digital
	MOVLW      255
	MOVWF      TRISB+0
;temperatura.mbas,23 :: 		PORTB = 0X00
	CLRF       PORTB+0
;temperatura.mbas,25 :: 		TRISC = 0X80 ' porta.5 como entrada digital
	MOVLW      128
	MOVWF      TRISC+0
;temperatura.mbas,26 :: 		PORTC = 0X00
	CLRF       PORTC+0
;temperatura.mbas,28 :: 		TRISD = 0X00 ' porta.5 como entrada digital
	CLRF       TRISD+0
;temperatura.mbas,29 :: 		PORTD = 0X00
	CLRF       PORTD+0
;temperatura.mbas,32 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;temperatura.mbas,33 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;temperatura.mbas,35 :: 		text = "000.0000" ' formato del texto a mostrar
	MOVLW      _text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;temperatura.mbas,36 :: 		TRISC=0X00
	CLRF       TRISC+0
;temperatura.mbas,37 :: 		PORTC=0X00
	CLRF       PORTC+0
;temperatura.mbas,38 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main4:
	DECFSZ     R13+0, 1
	GOTO       L__main4
	DECFSZ     R12+0, 1
	GOTO       L__main4
	DECFSZ     R11+0, 1
	GOTO       L__main4
	NOP
	NOP
;temperatura.mbas,40 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;temperatura.mbas,41 :: 		sonido()
	CALL       temperatura_sonido+0
;temperatura.mbas,42 :: 		sonido
	CALL       temperatura_sonido+0
;temperatura.mbas,43 :: 		while (TRUE)
L__main6:
;temperatura.mbas,45 :: 		if ow_reset(PORTB, 5) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	XORWF      R0+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L__main11
;temperatura.mbas,46 :: 		ow_write(PORTB, 5, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,47 :: 		ow_write(PORTB, 5, 0x44) ' convertir a t
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,48 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	NOP
	NOP
;temperatura.mbas,50 :: 		ow_reset(PORTB, 5)  ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;temperatura.mbas,53 :: 		ow_write(PORTB, 5, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,54 :: 		ow_write(PORTB, 5, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,56 :: 		j1 = ow_Read(PORTB, 5) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;temperatura.mbas,57 :: 		j2 = ow_Read(PORTB, 5) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      5
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;temperatura.mbas,59 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;temperatura.mbas,60 :: 		minus = minus >> 3
	MOVF       R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      _minus+0
;temperatura.mbas,62 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;temperatura.mbas,63 :: 		j2 = not j2
	COMF       _j2+0, 1
;temperatura.mbas,64 :: 		j1 = not j1
	COMF       _j1+0, 1
;temperatura.mbas,65 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main15:
;temperatura.mbas,68 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       _j1+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _Raw_temp+0
	MOVF       R0+1, 0
	MOVWF      _Raw_temp+1
;temperatura.mbas,70 :: 		TempC = (Raw_temp and $0FF0) >> 4
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      _TempC+0
	MOVF       R0+1, 0
	ANDLW      15
	MOVWF      _TempC+1
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
;temperatura.mbas,71 :: 		comma = (j1 and $0F) * 625
	MOVF       _j1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _comma+0
	MOVF       R0+1, 0
	MOVWF      _comma+1
;temperatura.mbas,73 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;temperatura.mbas,75 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,76 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,77 :: 		UART1_Write(".")
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,79 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;temperatura.mbas,80 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,81 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,82 :: 		UART1_Write("T")
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,83 :: 		UART1_Write("L")
	MOVLW      76
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main11:
;temperatura.mbas,89 :: 		if Tempc>25 then
	MOVF       _TempC+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       _TempC+0, 0
	SUBLW      25
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L__main18
;temperatura.mbas,90 :: 		sonido
	CALL       temperatura_sonido+0
L__main18:
;temperatura.mbas,92 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
	NOP
;temperatura.mbas,93 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
