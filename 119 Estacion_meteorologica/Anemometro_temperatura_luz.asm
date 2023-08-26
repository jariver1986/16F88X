
Anemometro_temperatura_luz_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Anemometro_temperatura_luz.mbas,9 :: 		sub procedure interrupt
;Anemometro_temperatura_luz.mbas,10 :: 		if TestBit(INTCON,INTF) then ' hubo la interrupcion por portb.0
	CLRF       R0+0
	BTFSS      INTCON+0, 1
	GOTO       L_Anemometro_temperatura_luz_interrupt4
	MOVLW      1
	MOVWF      R0+0
L_Anemometro_temperatura_luz_interrupt4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Anemometro_temperatura_luz_interrupt2
;Anemometro_temperatura_luz.mbas,11 :: 		ClearBit(INTCON,INTF)
	BCF        INTCON+0, 1
;Anemometro_temperatura_luz.mbas,12 :: 		inc(revol) ' incrementamos las revoluciones
	INCF       _revol+0, 1
	BTFSC      STATUS+0, 2
	INCF       _revol+1, 1
L_Anemometro_temperatura_luz_interrupt2:
;Anemometro_temperatura_luz.mbas,13 :: 		end if
L_Anemometro_temperatura_luz_interrupt28:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Anemometro_temperatura_luz_interrupt

Anemometro_temperatura_luz_tiempo:

;Anemometro_temperatura_luz.mbas,17 :: 		dim contador as word
;Anemometro_temperatura_luz.mbas,18 :: 		contador=0
	CLRF       tiempo_contador+0
	CLRF       tiempo_contador+1
;Anemometro_temperatura_luz.mbas,19 :: 		while (contador <=600)
L_Anemometro_temperatura_luz_tiempo7:
	MOVF       tiempo_contador+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Anemometro_temperatura_luz_tiempo29
	MOVF       tiempo_contador+0, 0
	SUBLW      88
L_Anemometro_temperatura_luz_tiempo29:
	BTFSS      STATUS+0, 0
	GOTO       L_Anemometro_temperatura_luz_tiempo8
;Anemometro_temperatura_luz.mbas,20 :: 		inc(contador)
	INCF       tiempo_contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       tiempo_contador+1, 1
;Anemometro_temperatura_luz.mbas,21 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Anemometro_temperatura_luz.mbas,22 :: 		wend
	GOTO       L_Anemometro_temperatura_luz_tiempo7
L_Anemometro_temperatura_luz_tiempo8:
	RETURN
; end of Anemometro_temperatura_luz_tiempo

_main:

;Anemometro_temperatura_luz.mbas,25 :: 		main:
;Anemometro_temperatura_luz.mbas,26 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Anemometro_temperatura_luz.mbas,27 :: 		OPTION_REG = 0X83 ' Pull up PORTB desactivado
	MOVLW      131
	MOVWF      OPTION_REG+0
;Anemometro_temperatura_luz.mbas,29 :: 		INTCON = 0XD0 ' Activado interrupciones globales
	MOVLW      208
	MOVWF      INTCON+0
;Anemometro_temperatura_luz.mbas,33 :: 		TRISA = 0X01
	MOVLW      1
	MOVWF      TRISA+0
;Anemometro_temperatura_luz.mbas,34 :: 		PORTA = 0x00
	CLRF       PORTA+0
;Anemometro_temperatura_luz.mbas,35 :: 		TRISB = 0X03
	MOVLW      3
	MOVWF      TRISB+0
;Anemometro_temperatura_luz.mbas,36 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Anemometro_temperatura_luz.mbas,37 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;Anemometro_temperatura_luz.mbas,38 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Anemometro_temperatura_luz.mbas,39 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;Anemometro_temperatura_luz.mbas,40 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;Anemometro_temperatura_luz.mbas,41 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Anemometro_temperatura_luz.mbas,42 :: 		veloc = 0x00
	CLRF       _veloc+0
;Anemometro_temperatura_luz.mbas,43 :: 		while 1
L__main13:
;Anemometro_temperatura_luz.mbas,45 :: 		revol = 0 ' revoluciones son iguales a 0
	CLRF       _revol+0
	CLRF       _revol+1
;Anemometro_temperatura_luz.mbas,46 :: 		Delay_ms(1000) ' con este tiempo sabemos cuantas revoluciones van haber en 1seg
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main17:
	DECFSZ     R13+0, 1
	GOTO       L__main17
	DECFSZ     R12+0, 1
	GOTO       L__main17
	DECFSZ     R11+0, 1
	GOTO       L__main17
	NOP
	NOP
;Anemometro_temperatura_luz.mbas,47 :: 		valor = (revol*15*PI)/180 ' asignamos las revoluciones al dato valor
	MOVLW      15
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       _revol+0, 0
	MOVWF      R0+0
	MOVF       _revol+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	MOVF       FLOC__main+2, 0
	MOVWF      R4+2
	MOVF       FLOC__main+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      219
	MOVWF      R4+0
	MOVLW      15
	MOVWF      R4+1
	MOVLW      73
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVLW      180
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;Anemometro_temperatura_luz.mbas,48 :: 		FloatToStr(valor,txt)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;Anemometro_temperatura_luz.mbas,49 :: 		UART1_Write_Text("VELOCIDAD [cm/s] = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      47
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
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
;Anemometro_temperatura_luz.mbas,50 :: 		UART1_Write_Text(txt)
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Anemometro_temperatura_luz.mbas,51 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,52 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,54 :: 		luz =100 - (Adc_Read(0)*100)/1024
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
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L__main31
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main30
L__main31:
	MOVF       R2+0, 0
	SUBLW      100
	MOVWF      R0+0
	MOVF       R2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R0+1
	SUBWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _luz+0
	MOVF       R0+1, 0
	MOVWF      _luz+1
;Anemometro_temperatura_luz.mbas,55 :: 		WordToStr(luz,txt)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Anemometro_temperatura_luz.mbas,56 :: 		UART1_Write_Text("LUZ = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
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
;Anemometro_temperatura_luz.mbas,57 :: 		UART1_Write_Text(txt)
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Anemometro_temperatura_luz.mbas,58 :: 		UART1_Write_Text(" % ")
	MOVLW      32
	MOVWF      _main_Local_Text+0
	MOVLW      37
	MOVWF      _main_Local_Text+1
	MOVLW      32
	MOVWF      _main_Local_Text+2
	CLRF       _main_Local_Text+3
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Anemometro_temperatura_luz.mbas,59 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,60 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,63 :: 		if ow_reset(PORTB, 1) = 0 then ' senal de reset onewire
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      0
	XORWF      R0+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Anemometro_temperatura_luz.mbas,64 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Anemometro_temperatura_luz.mbas,65 :: 		ow_write(PORTB, 1, 0x44) ' convertir a t
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Anemometro_temperatura_luz.mbas,66 :: 		delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	NOP
	NOP
;Anemometro_temperatura_luz.mbas,68 :: 		ow_reset(PORTB, 1)  ' 0 = presente, 1= no presente
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;Anemometro_temperatura_luz.mbas,70 :: 		UART1_Write_Text(" Temperatura:   ")
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
;Anemometro_temperatura_luz.mbas,71 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,72 :: 		ow_write(PORTB, 1, 0xCC) ' pase rom
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Anemometro_temperatura_luz.mbas,73 :: 		ow_write(PORTB, 1, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Anemometro_temperatura_luz.mbas,75 :: 		j1 = ow_Read(PORTB, 1) ' leer parte baja
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;Anemometro_temperatura_luz.mbas,76 :: 		j2 = ow_Read(PORTB, 1) ' leer parte alta
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      1
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;Anemometro_temperatura_luz.mbas,78 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;Anemometro_temperatura_luz.mbas,79 :: 		minus = minus >> 3
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
;Anemometro_temperatura_luz.mbas,81 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main23
;Anemometro_temperatura_luz.mbas,82 :: 		j2 = not j2
	COMF       _j2+0, 1
;Anemometro_temperatura_luz.mbas,83 :: 		j1 = not j1
	COMF       _j1+0, 1
;Anemometro_temperatura_luz.mbas,84 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main23:
;Anemometro_temperatura_luz.mbas,87 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      _Raw_temp+1
	CLRF       _Raw_temp+0
	MOVF       _j1+0, 0
	IORWF      _Raw_temp+0, 1
	MOVLW      0
	IORWF      _Raw_temp+1, 1
;Anemometro_temperatura_luz.mbas,89 :: 		if minus = $1F then
	MOVF       _minus+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main26
;Anemometro_temperatura_luz.mbas,91 :: 		UART1_Write("-")
	MOVLW      45
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main27
;Anemometro_temperatura_luz.mbas,92 :: 		else
L__main26:
;Anemometro_temperatura_luz.mbas,94 :: 		UART1_Write("+")
	MOVLW      43
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,95 :: 		end if
L__main27:
;Anemometro_temperatura_luz.mbas,97 :: 		TempC = (Raw_temp and $0FF0) >> 4
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
;Anemometro_temperatura_luz.mbas,98 :: 		comma = (j1 and $0F) * 625
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
;Anemometro_temperatura_luz.mbas,100 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;Anemometro_temperatura_luz.mbas,102 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,103 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,104 :: 		UART1_Write(".")
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,106 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;Anemometro_temperatura_luz.mbas,107 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,108 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,111 :: 		UART1_Write(" ")
	MOVLW      32
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,112 :: 		UART1_Write("C")
	MOVLW      67
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,113 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main20
;Anemometro_temperatura_luz.mbas,115 :: 		else
L__main19:
;Anemometro_temperatura_luz.mbas,116 :: 		UART1_Write_Text(" no signal  ")
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
;Anemometro_temperatura_luz.mbas,117 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Anemometro_temperatura_luz.mbas,118 :: 		end if
L__main20:
;Anemometro_temperatura_luz.mbas,120 :: 		wend
	GOTO       L__main13
	GOTO       $+0
; end of _main
