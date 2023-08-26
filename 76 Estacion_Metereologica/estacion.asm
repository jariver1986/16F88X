
estacion_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;estacion.mbas,12 :: 		sub procedure interrupt
;estacion.mbas,13 :: 		if TestBit(INTCON,INTF) then ' hubo la interrupcion por portb.0
	CLRF       R0+0
	BTFSS      INTCON+0, 1
	GOTO       L_estacion_interrupt4
	MOVLW      1
	MOVWF      R0+0
L_estacion_interrupt4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_estacion_interrupt2
;estacion.mbas,14 :: 		ClearBit(INTCON,INTF)
	BCF        INTCON+0, 1
;estacion.mbas,15 :: 		inc(revol) ' incrementamos las revoluciones
	INCF       _revol+0, 1
	BTFSC      STATUS+0, 2
	INCF       _revol+1, 1
L_estacion_interrupt2:
;estacion.mbas,16 :: 		end if
L_estacion_interrupt33:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of estacion_interrupt

_main:

;estacion.mbas,19 :: 		main:
;estacion.mbas,21 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;estacion.mbas,23 :: 		OPTION_REG = 0X83 ' Pull up PORTB desactivado
	MOVLW      131
	MOVWF      OPTION_REG+0
;estacion.mbas,26 :: 		INTCON = 0XD0 ' Activado interrupciones globales
	MOVLW      208
	MOVWF      INTCON+0
;estacion.mbas,31 :: 		TRISA = 0X03 ' PORTA.0 Entrada
	MOVLW      3
	MOVWF      TRISA+0
;estacion.mbas,32 :: 		PORTA = 0X00
	CLRF       PORTA+0
;estacion.mbas,34 :: 		TRISB = 0X81 ' PORTB.0 Entrada
	MOVLW      129
	MOVWF      TRISB+0
;estacion.mbas,35 :: 		PORTB = 0X00
	CLRF       PORTB+0
;estacion.mbas,37 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;estacion.mbas,38 :: 		PORTC = 0X00
	CLRF       PORTC+0
;estacion.mbas,40 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;estacion.mbas,41 :: 		PORTE = 0X00
	CLRF       PORTE+0
;estacion.mbas,43 :: 		ANSEL = 0X03 ' AN<7:0>
	MOVLW      3
	MOVWF      ANSEL+0
;estacion.mbas,44 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;estacion.mbas,45 :: 		UART1_Init(600)
	MOVLW      207
	MOVWF      SPBRG+0
	BCF        TXSTA+0, 2
	CALL       _UART1_Init+0
;estacion.mbas,47 :: 		veloc = 0x00
	CLRF       _veloc+0
;estacion.mbas,48 :: 		selector=0
	CLRF       _selector+0
;estacion.mbas,50 :: 		while (1)
L__main7:
;estacion.mbas,52 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main12
;estacion.mbas,53 :: 		selector = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _selector+0
L__main12:
;estacion.mbas,55 :: 		if (selector = 0x31) OR (selector = 0x35) then
	MOVF       _selector+0, 0
	XORLW      49
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _selector+0, 0
	XORLW      53
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main15
;estacion.mbas,57 :: 		revol = 0 ' revoluciones son iguales a 0
	CLRF       _revol+0
	CLRF       _revol+1
;estacion.mbas,58 :: 		Delay_ms(1000) ' con este tiempo sabemos cuantas revoluciones van haber en 1seg
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
;estacion.mbas,59 :: 		valor = ((revol)*(PI*22.5))/180  ' asignamos las revoluciones al dato valor
	MOVF       _revol+0, 0
	MOVWF      R0+0
	MOVF       _revol+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      38
	MOVWF      R4+0
	MOVLW      95
	MOVWF      R4+1
	MOVLW      13
	MOVWF      R4+2
	MOVLW      133
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
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;estacion.mbas,60 :: 		WordToStr(valor, txt)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;estacion.mbas,61 :: 		UART1_Write_Text("REVOLUCIONES = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
;estacion.mbas,62 :: 		UART1_Write_Text(txt)
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,63 :: 		UART1_Write_Text("  cm/s")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,64 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;estacion.mbas,65 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main15:
;estacion.mbas,67 :: 		if (selector = 0x32 ) OR (selector = 0x35)then
	MOVF       _selector+0, 0
	XORLW      50
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _selector+0, 0
	XORLW      53
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main19
;estacion.mbas,69 :: 		IF (Ow_Reset(PORTB,7)=0) THEN ' INICIO DE COMUNICACION
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      0
	XORWF      R0+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;estacion.mbas,70 :: 		Ow_Write(PORTB,7,0XCC)     ' ATENCION
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;estacion.mbas,71 :: 		Ow_Write(PORTB,7,0X44)     ' PREPARA TEMPERATURA
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;estacion.mbas,72 :: 		Delay_10ms
	CALL       _Delay_10ms+0
;estacion.mbas,73 :: 		Ow_Reset(PORTB,7)          ' INICIO DE COMUNICACION
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Reset_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;estacion.mbas,74 :: 		Ow_Write(PORTB,7,0XCC)     'ATENCION
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;estacion.mbas,75 :: 		Ow_Write(PORTB,7,0XBE)     'PETICION DE TEMPERATURA
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Write_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;estacion.mbas,76 :: 		T1 = Ow_Read(PORTB,7)
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _T1+0
;estacion.mbas,77 :: 		T2 = Ow_Read(PORTB,7)
	MOVLW      PORTB+0
	MOVWF      FARG_Ow_Read_port+0
	MOVLW      7
	MOVWF      FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _T2+0
;estacion.mbas,78 :: 		TEMP = (T2<<8) OR T1
	MOVF       R0+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       _T1+0, 0
	IORWF      R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _TEMP+0
	MOVF       R0+1, 0
	MOVWF      _TEMP+1
;estacion.mbas,79 :: 		TEMPC = (TEMP AND $0FF0)>>4 ' VALOR DE TEMPERATURA
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	ANDLW      15
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _TEMPC+0
	MOVF       R0+1, 0
	MOVWF      _TEMPC+1
;estacion.mbas,80 :: 		WordToStr(TEMPC,TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;estacion.mbas,81 :: 		UART1_Write_Text("TEMPERATURA =")
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,82 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,83 :: 		UART1_Write_Text(" GRADOS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,84 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;estacion.mbas,85 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main22:
;estacion.mbas,86 :: 		END IF
L__main19:
;estacion.mbas,88 :: 		if (selector = 0x33) OR (selector = 0x35) then
	MOVF       _selector+0, 0
	XORLW      51
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _selector+0, 0
	XORLW      53
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main25
;estacion.mbas,90 :: 		DATO = 100 - (Adc_Read(0)*100)/1024
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
L__main35:
	BTFSC      STATUS+0, 2
	GOTO       L__main36
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main35
L__main36:
	MOVF       R2+0, 0
	SUBLW      100
	MOVWF      R0+0
	MOVF       R2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R0+1
	SUBWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _DATO+0
	MOVF       R0+1, 0
	MOVWF      _DATO+1
;estacion.mbas,91 :: 		WordToStr(dato,texto2)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;estacion.mbas,92 :: 		UART1_Write_Text("INTENSIDAD: ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      58
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
;estacion.mbas,93 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,94 :: 		UART1_Write_Text("%")
	MOVLW      37
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,95 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;estacion.mbas,96 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main25:
;estacion.mbas,98 :: 		if (selector = 0x34 ) OR (selector = 0x35)then
	MOVF       _selector+0, 0
	XORLW      52
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _selector+0, 0
	XORLW      53
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main28
;estacion.mbas,100 :: 		DATO3 = (Adc_Read(1))
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO3+0
	MOVF       R0+1, 0
	MOVWF      _DATO3+1
;estacion.mbas,101 :: 		WordToStr(dato3,texto3)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO3+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;estacion.mbas,102 :: 		UART1_Write_Text("SENSOR DE MOVIMIENTO: ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      58
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
;estacion.mbas,103 :: 		if DATO3 <400 THEN
	MOVLW      1
	SUBWF      _DATO3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      144
	SUBWF      _DATO3+0, 0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L__main31
;estacion.mbas,104 :: 		UART1_Write_Text("NO INTRUSO ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main32
;estacion.mbas,105 :: 		else
L__main31:
;estacion.mbas,106 :: 		UART1_Write_Text("INTRUDO DETECTADO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;estacion.mbas,107 :: 		end if
L__main32:
;estacion.mbas,110 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;estacion.mbas,111 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main28:
;estacion.mbas,113 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;estacion.mbas,114 :: 		WEND
	GOTO       L__main7
	GOTO       $+0
; end of _main
