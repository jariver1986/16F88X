
_main:

;temperatura.mbas,8 :: 		main:
;temperatura.mbas,9 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;temperatura.mbas,11 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;temperatura.mbas,13 :: 		TRISA = 0X00 ' porta.5 como entrada digital
	CLRF       TRISA+0
;temperatura.mbas,14 :: 		PORTA = 0X00
	CLRF       PORTA+0
;temperatura.mbas,16 :: 		TRISB = 0X02 ' porta.5 como entrada digital
	MOVLW      2
	MOVWF      TRISB+0
;temperatura.mbas,17 :: 		PORTB = 0X00
	CLRF       PORTB+0
;temperatura.mbas,19 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;temperatura.mbas,20 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;temperatura.mbas,21 :: 		text = "000.0000" ' formato del texto a mostrar
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
;temperatura.mbas,22 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;temperatura.mbas,23 :: 		PORTC=0X00
	CLRF       PORTC+0
;temperatura.mbas,24 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
	NOP
;temperatura.mbas,25 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;temperatura.mbas,27 :: 		viajero=0
	CLRF       _viajero+0
;temperatura.mbas,28 :: 		dato=0
	CLRF       _dato+0
;temperatura.mbas,29 :: 		PORTD=0
	CLRF       PORTD+0
;temperatura.mbas,30 :: 		TRISD=0
	CLRF       TRISD+0
;temperatura.mbas,31 :: 		while (TRUE)
L__main3:
;temperatura.mbas,33 :: 		if UART1_Data_Ready=1 THEN
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main8
;temperatura.mbas,34 :: 		DATO=UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main8:
;temperatura.mbas,38 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;temperatura.mbas,39 :: 		if dato="T" then
	MOVF       _dato+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;temperatura.mbas,40 :: 		viajero=1
	MOVLW      1
	MOVWF      _viajero+0
L__main15:
;temperatura.mbas,41 :: 		end if
	GOTO       L__main10
L__main13:
;temperatura.mbas,42 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;temperatura.mbas,43 :: 		if dato="1" then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;temperatura.mbas,44 :: 		viajero=2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L__main22
;temperatura.mbas,45 :: 		else
L__main21:
;temperatura.mbas,46 :: 		if dato="0" then
	MOVF       _dato+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L__main24
;temperatura.mbas,47 :: 		viajero=3
	MOVLW      3
	MOVWF      _viajero+0
L__main24:
;temperatura.mbas,49 :: 		end if
L__main22:
	GOTO       L__main10
L__main19:
L__main10:
;temperatura.mbas,52 :: 		if viajero=2 then
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;temperatura.mbas,53 :: 		viajero=0
	CLRF       _viajero+0
;temperatura.mbas,54 :: 		Portd.rd1=1
	BSF        PORTD+0, 1
L__main27:
;temperatura.mbas,56 :: 		if viajero=3 then
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;temperatura.mbas,57 :: 		viajero=0
	CLRF       _viajero+0
;temperatura.mbas,58 :: 		Portd.rd1=0
	BCF        PORTD+0, 1
L__main30:
;temperatura.mbas,61 :: 		if ow_reset(PORTB, 1) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      0
	XORWF      R0+0, 0
L__main40:
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;temperatura.mbas,62 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,63 :: 		ow_write(PORTB, 1, 0x44) ' convertir a t
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,64 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	NOP
	NOP
;temperatura.mbas,65 :: 		ow_reset(PORTB, 1)  ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;temperatura.mbas,66 :: 		UART1_Write_Text("T")
	MOVLW      84
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;temperatura.mbas,68 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,69 :: 		ow_write(PORTB, 1, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;temperatura.mbas,70 :: 		j1 = ow_Read(PORTB, 1) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;temperatura.mbas,71 :: 		j2 = ow_Read(PORTB, 1) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;temperatura.mbas,72 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;temperatura.mbas,73 :: 		minus = minus >> 3
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
;temperatura.mbas,74 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;temperatura.mbas,75 :: 		j2 = not j2
	COMF       _j2+0, 1
;temperatura.mbas,76 :: 		j1 = not j1
	COMF       _j1+0, 1
;temperatura.mbas,77 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main37:
;temperatura.mbas,79 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
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
;temperatura.mbas,80 :: 		TempC = (Raw_temp and $0FF0) >> 4
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
;temperatura.mbas,81 :: 		comma = (j1 and $0F) * 625
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
;temperatura.mbas,82 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;temperatura.mbas,83 :: 		UART1_Write(text[0])
	MOVF       _text+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,84 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,85 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,86 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,87 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,88 :: 		UART1_Write(text[5])
	MOVF       _text+5, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,89 :: 		UART1_Write(text[6])
	MOVF       _text+6, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,90 :: 		UART1_Write(text[7])
	MOVF       _text+7, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;temperatura.mbas,91 :: 		UART1_Write_Text("%")
	MOVLW      37
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main34
;temperatura.mbas,94 :: 		else
L__main33:
;temperatura.mbas,95 :: 		UART1_Write_Text("X")
	MOVLW      88
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;temperatura.mbas,96 :: 		end if
L__main34:
;temperatura.mbas,97 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main39:
	DECFSZ     R13+0, 1
	GOTO       L__main39
	DECFSZ     R12+0, 1
	GOTO       L__main39
	DECFSZ     R11+0, 1
	GOTO       L__main39
	NOP
	NOP
;temperatura.mbas,99 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
