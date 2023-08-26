
_main:

;casa abierta.mbas,22 :: 		main:
;casa abierta.mbas,23 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;casa abierta.mbas,25 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;casa abierta.mbas,27 :: 		TRISA = 0X20 ' porta.5 como entrada digital
	MOVLW      32
	MOVWF      TRISA+0
;casa abierta.mbas,28 :: 		PORTA = 0X00
	CLRF       PORTA+0
;casa abierta.mbas,30 :: 		TRISB = 0X80 ' porta.5 como entrada digital
	MOVLW      128
	MOVWF      TRISB+0
;casa abierta.mbas,31 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa abierta.mbas,33 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;casa abierta.mbas,34 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;casa abierta.mbas,35 :: 		seteo= 30
	MOVLW      30
	MOVWF      _seteo+0
;casa abierta.mbas,36 :: 		text = "000.0000" ' formato del texto a mostrar
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
;casa abierta.mbas,37 :: 		delay_ms(250)
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
;casa abierta.mbas,38 :: 		Lcd_Init() ' inicializamos la lcd
	CALL       _Lcd_Init+0
;casa abierta.mbas,39 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,41 :: 		Lcd_Out(1, 1, "TECNOLOGICO ") ' lo que se va a mostrar en la linea 1
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
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;casa abierta.mbas,42 :: 		Lcd_Out(2, 1, " SUDAMERICANO ") ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;casa abierta.mbas,43 :: 		delay_ms(1000)
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
;casa abierta.mbas,44 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,46 :: 		Lcd_Out(1, 1, " Temperatura: ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,48 :: 		bandera=0
	CLRF       _bandera+0
;casa abierta.mbas,49 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,50 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
	NOP
;casa abierta.mbas,51 :: 		MEDIR:
L__main_medir:
;casa abierta.mbas,52 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,53 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main5:
	DECFSZ     R13+0, 1
	GOTO       L__main5
	DECFSZ     R12+0, 1
	GOTO       L__main5
	DECFSZ     R11+0, 1
	GOTO       L__main5
	NOP
	NOP
;casa abierta.mbas,54 :: 		while (TRUE)
L__main7:
;casa abierta.mbas,55 :: 		if ow_reset(PORTB, 7) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      0
	XORWF      R0+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L__main12
;casa abierta.mbas,56 :: 		Lcd_Out(1, 1, " Temperatura: ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,57 :: 		ow_write(PORTB, 7, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,58 :: 		ow_write(PORTB, 7, 0x44) ' convertir a temp
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,59 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	NOP
	NOP
;casa abierta.mbas,60 :: 		ow_reset(PORTB, 7) ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;casa abierta.mbas,61 :: 		ow_write(PORTB, 7, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,62 :: 		ow_write(PORTB, 7, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,63 :: 		j1 = ow_Read(PORTB, 7) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;casa abierta.mbas,64 :: 		j2 = ow_Read(PORTB, 7) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;casa abierta.mbas,65 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;casa abierta.mbas,66 :: 		minus = minus >> 3
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
;casa abierta.mbas,67 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;casa abierta.mbas,68 :: 		j2 = not j2
	COMF       _j2+0, 1
;casa abierta.mbas,69 :: 		j1 = not j1
	COMF       _j1+0, 1
;casa abierta.mbas,70 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main16:
;casa abierta.mbas,72 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      _Raw_temp+1
	CLRF       _Raw_temp+0
	MOVF       _j1+0, 0
	IORWF      _Raw_temp+0, 1
	MOVLW      0
	IORWF      _Raw_temp+1, 1
;casa abierta.mbas,73 :: 		if minus = $1F then
	MOVF       _minus+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;casa abierta.mbas,74 :: 		Lcd_Chr(2, 3, "-") ' escribimos "-"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
	GOTO       L__main20
;casa abierta.mbas,75 :: 		else
L__main19:
;casa abierta.mbas,76 :: 		Lcd_Chr(2, 3, "+") ' escribimos "+"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      43
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,77 :: 		end if
L__main20:
;casa abierta.mbas,78 :: 		TempC = (Raw_temp and $0FF0) >> 4
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
;casa abierta.mbas,79 :: 		comma = (j1 and $0F) * 625
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
;casa abierta.mbas,80 :: 		if( TempC > seteo ) then
	MOVF       _TempC+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _TempC+0, 0
	SUBWF      _seteo+0, 0
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L__main22
;casa abierta.mbas,82 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,83 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,84 :: 		Lcd_Out(1, 1, " ALARMA ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,85 :: 		Lcd_Out(2, 1, "  APAGANDO M ")
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
;casa abierta.mbas,86 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main24:
	DECFSZ     R13+0, 1
	GOTO       L__main24
	DECFSZ     R12+0, 1
	GOTO       L__main24
	DECFSZ     R11+0, 1
	GOTO       L__main24
	NOP
;casa abierta.mbas,87 :: 		PORTB.RB6= 0
	BCF        PORTB+0, 6
;casa abierta.mbas,88 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,89 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,90 :: 		Lcd_Out(1, 1, " MOTOR ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,91 :: 		Lcd_Out(2, 1, "  APAGADO ")
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,92 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main25:
	DECFSZ     R13+0, 1
	GOTO       L__main25
	DECFSZ     R12+0, 1
	GOTO       L__main25
	DECFSZ     R11+0, 1
	GOTO       L__main25
	NOP
;casa abierta.mbas,93 :: 		while (TRUE)
L__main27:
;casa abierta.mbas,94 :: 		if ow_reset(PORTB, 7) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      0
	XORWF      R0+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L__main32
;casa abierta.mbas,95 :: 		Lcd_Out(1, 1, " Temperatura: ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,96 :: 		ow_write(PORTB, 7, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,97 :: 		ow_write(PORTB, 7, 0x44) ' convertir a temp
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,98 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main34:
	DECFSZ     R13+0, 1
	GOTO       L__main34
	NOP
	NOP
;casa abierta.mbas,99 :: 		ow_reset(PORTB, 7) ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;casa abierta.mbas,100 :: 		ow_write(PORTB, 7, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,101 :: 		ow_write(PORTB, 7, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;casa abierta.mbas,102 :: 		j1 = ow_Read(PORTB, 7) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;casa abierta.mbas,103 :: 		j2 = ow_Read(PORTB, 7) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;casa abierta.mbas,104 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;casa abierta.mbas,105 :: 		minus = minus >> 3
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
;casa abierta.mbas,106 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;casa abierta.mbas,107 :: 		j2 = not j2
	COMF       _j2+0, 1
;casa abierta.mbas,108 :: 		j1 = not j1
	COMF       _j1+0, 1
;casa abierta.mbas,109 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main36:
;casa abierta.mbas,111 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      _Raw_temp+1
	CLRF       _Raw_temp+0
	MOVF       _j1+0, 0
	IORWF      _Raw_temp+0, 1
	MOVLW      0
	IORWF      _Raw_temp+1, 1
;casa abierta.mbas,112 :: 		if minus = $1F then
	MOVF       _minus+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;casa abierta.mbas,113 :: 		Lcd_Chr(2, 3, "-") ' escribimos "-"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
	GOTO       L__main40
;casa abierta.mbas,114 :: 		else
L__main39:
;casa abierta.mbas,115 :: 		Lcd_Chr(2, 3, "+") ' escribimos "+"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      43
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,116 :: 		end if
L__main40:
;casa abierta.mbas,117 :: 		TempC = (Raw_temp and $0FF0) >> 4
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
;casa abierta.mbas,118 :: 		comma = (j1 and $0F) * 625
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
;casa abierta.mbas,119 :: 		IF( TempC < seteo ) then
	MOVLW      0
	SUBWF      _TempC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       _seteo+0, 0
	SUBWF      _TempC+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L__main42
;casa abierta.mbas,121 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,122 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,123 :: 		Lcd_Out(1, 1, " TEMPERATURA ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,124 :: 		Lcd_Out(2, 1, "  ADECUADA ")
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,125 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	DECFSZ     R11+0, 1
	GOTO       L__main44
	NOP
;casa abierta.mbas,126 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,127 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,128 :: 		Lcd_Out(1, 1, " PRENDIENDO ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      68
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;casa abierta.mbas,129 :: 		Lcd_Out(2, 1, "  MOTOR ")
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;casa abierta.mbas,130 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	DECFSZ     R11+0, 1
	GOTO       L__main45
	NOP
	NOP
;casa abierta.mbas,131 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,132 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	DECFSZ     R11+0, 1
	GOTO       L__main46
	NOP
	NOP
;casa abierta.mbas,133 :: 		GOTO MEDIR
	GOTO       L__main_medir
L__main42:
;casa abierta.mbas,136 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;casa abierta.mbas,137 :: 		Lcd_Chr(2, 4, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,138 :: 		Lcd_Chr(2, 5, text[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,139 :: 		Lcd_Chr(2, 6, text[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,140 :: 		Lcd_Chr(2, 7, ".")
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,141 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;casa abierta.mbas,142 :: 		Lcd_Chr(2, 8, text[1])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,143 :: 		Lcd_Chr(2, 9, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,144 :: 		Lcd_Chr(2, 10, text[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,145 :: 		Lcd_Chr(2, 11, text[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,146 :: 		Lcd_Chr(2, 12, 223)
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,147 :: 		Lcd_Chr(2, 13, "C")
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
	GOTO       L__main33
;casa abierta.mbas,148 :: 		else
L__main32:
;casa abierta.mbas,149 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,150 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,151 :: 		Lcd_Out(1, 1, " NO SIGNAL ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
;casa abierta.mbas,152 :: 		end if
L__main33:
;casa abierta.mbas,153 :: 		Delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	DECFSZ     R11+0, 1
	GOTO       L__main47
	NOP
	NOP
;casa abierta.mbas,154 :: 		wend
	GOTO       L__main27
;casa abierta.mbas,155 :: 		ELSE
L__main22:
;casa abierta.mbas,156 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,157 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,158 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, 1
	GOTO       L__main48
	DECFSZ     R12+0, 1
	GOTO       L__main48
	DECFSZ     R11+0, 1
	GOTO       L__main48
	NOP
	NOP
;casa abierta.mbas,160 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;casa abierta.mbas,161 :: 		Lcd_Chr(2, 4, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,162 :: 		Lcd_Chr(2, 5, text[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,163 :: 		Lcd_Chr(2, 6, text[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,164 :: 		Lcd_Chr(2, 7, ".")
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,165 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;casa abierta.mbas,166 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main49:
	DECFSZ     R13+0, 1
	GOTO       L__main49
	DECFSZ     R12+0, 1
	GOTO       L__main49
	DECFSZ     R11+0, 1
	GOTO       L__main49
	NOP
	NOP
;casa abierta.mbas,167 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;casa abierta.mbas,168 :: 		Lcd_Chr(2, 8, text[1])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,169 :: 		Lcd_Chr(2, 9, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,170 :: 		Lcd_Chr(2, 10, text[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,171 :: 		Lcd_Chr(2, 11, text[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,172 :: 		Lcd_Chr(2, 12, 223)
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;casa abierta.mbas,173 :: 		Lcd_Chr(2, 13, "C")
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
	GOTO       L__main13
;casa abierta.mbas,174 :: 		else
L__main12:
;casa abierta.mbas,175 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,176 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;casa abierta.mbas,177 :: 		Lcd_Out(1, 1, " NO SIGNAL ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
;casa abierta.mbas,178 :: 		end if
L__main13:
;casa abierta.mbas,179 :: 		Delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	DECFSZ     R11+0, 1
	GOTO       L__main50
	NOP
	NOP
;casa abierta.mbas,181 :: 		wend
	GOTO       L__main7
	GOTO       $+0
; end of _main
