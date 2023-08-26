
_main:

;sensor.mbas,25 :: 		main:
;sensor.mbas,27 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;sensor.mbas,29 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;sensor.mbas,31 :: 		TRISA = 0X00 ' porta.5 como entrada digital
	CLRF       TRISA+0
;sensor.mbas,32 :: 		PORTA = 0X00
	CLRF       PORTA+0
;sensor.mbas,34 :: 		TRISB = 0X02 ' porta.5 como entrada digital
	MOVLW      2
	MOVWF      TRISB+0
;sensor.mbas,35 :: 		PORTB = 0X00
	CLRF       PORTB+0
;sensor.mbas,37 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;sensor.mbas,38 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;sensor.mbas,40 :: 		text = "000.0000" ' formato del texto a mostrar
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
;sensor.mbas,41 :: 		TRISC=0X00
	CLRF       TRISC+0
;sensor.mbas,42 :: 		PORTC=0X00
	CLRF       PORTC+0
;sensor.mbas,43 :: 		delay_ms(250)
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
;sensor.mbas,46 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sensor.mbas,47 :: 		UART1_Write_Text(" ideastechnology ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      121
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
;sensor.mbas,48 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,49 :: 		UART1_Write_Text(" DS18B20 ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
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
;sensor.mbas,50 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,51 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
	NOP
;sensor.mbas,52 :: 		UART1_Write_Text(" Temperatura:   ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor.mbas,53 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,55 :: 		while (TRUE)
L__main4:
;sensor.mbas,57 :: 		if ow_reset(PORTB, 1) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	XORWF      R0+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L__main9
;sensor.mbas,58 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;sensor.mbas,59 :: 		ow_write(PORTB, 1, 0x44) ' convertir a t
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;sensor.mbas,61 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	NOP
	NOP
;sensor.mbas,63 :: 		ow_reset(PORTB, 1)  ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;sensor.mbas,66 :: 		UART1_Write_Text(" Temperatura:   ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor.mbas,67 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,68 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;sensor.mbas,69 :: 		ow_write(PORTB, 1, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;sensor.mbas,71 :: 		j1 = ow_Read(PORTB, 1) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;sensor.mbas,72 :: 		j2 = ow_Read(PORTB, 1) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;sensor.mbas,74 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;sensor.mbas,75 :: 		minus = minus >> 3
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
;sensor.mbas,77 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;sensor.mbas,78 :: 		j2 = not j2
	COMF       _j2+0, 1
;sensor.mbas,79 :: 		j1 = not j1
	COMF       _j1+0, 1
;sensor.mbas,80 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main13:
;sensor.mbas,83 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      _Raw_temp+1
	CLRF       _Raw_temp+0
	MOVF       _j1+0, 0
	IORWF      _Raw_temp+0, 1
	MOVLW      0
	IORWF      _Raw_temp+1, 1
;sensor.mbas,85 :: 		if minus = $1F then
	MOVF       _minus+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;sensor.mbas,87 :: 		UART1_Write("-")
	MOVLW      45
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main17
;sensor.mbas,88 :: 		else
L__main16:
;sensor.mbas,90 :: 		UART1_Write("+")
	MOVLW      43
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,91 :: 		end if
L__main17:
;sensor.mbas,93 :: 		TempC = (Raw_temp and $0FF0) >> 4
	MOVLW      240
	ANDWF      _Raw_temp+0, 0
	MOVWF      _TempC+0
	MOVF       _Raw_temp+1, 0
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
;sensor.mbas,94 :: 		comma = (j1 and $0F) * 625
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
;sensor.mbas,96 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;sensor.mbas,97 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,98 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,99 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,100 :: 		UART1_Write(".")
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,104 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;sensor.mbas,105 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,106 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,107 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,108 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,109 :: 		UART1_Write(" ")
	MOVLW      32
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,110 :: 		UART1_Write("C")
	MOVLW      67
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,111 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main10
;sensor.mbas,113 :: 		else
L__main9:
;sensor.mbas,114 :: 		UART1_Write_Text(" no signal  ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor.mbas,115 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor.mbas,116 :: 		end if
L__main10:
;sensor.mbas,117 :: 		Delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
	NOP
	NOP
;sensor.mbas,118 :: 		wend
	GOTO       L__main4
	GOTO       $+0
; end of _main
