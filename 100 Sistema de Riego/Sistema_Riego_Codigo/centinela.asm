
_main:

;centinela.mbas,4 :: 		main:
;centinela.mbas,5 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;centinela.mbas,6 :: 		PORTA= %00000000
	CLRF       PORTA+0
;centinela.mbas,7 :: 		PORTB= %00000000
	CLRF       PORTB+0
;centinela.mbas,8 :: 		PORTC= %00000000
	CLRF       PORTC+0
;centinela.mbas,9 :: 		TRISA= %00000011
	MOVLW      3
	MOVWF      TRISA+0
;centinela.mbas,10 :: 		TRISB= %00000000
	CLRF       TRISB+0
;centinela.mbas,11 :: 		TRISC= %00000000
	CLRF       TRISC+0
;centinela.mbas,12 :: 		ANSEL= %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;centinela.mbas,13 :: 		ANSELH= %00000000
	CLRF       ANSELH+0
;centinela.mbas,14 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;centinela.mbas,15 :: 		while 1
L__main2:
;centinela.mbas,16 :: 		HUMEDAD =1024- Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      _HUMEDAD+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      4
	MOVWF      _HUMEDAD+1
;centinela.mbas,17 :: 		LUZ =1024- Adc_Read(1)
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      _LUZ+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      4
	MOVWF      _LUZ+1
;centinela.mbas,18 :: 		UART1_Write_Text("HUMEDAD = ")
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
;centinela.mbas,19 :: 		WordToStr(HUMEDAD,TEXTO1)
	MOVF       _HUMEDAD+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _HUMEDAD+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;centinela.mbas,20 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _TEXTO1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;centinela.mbas,21 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,22 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,23 :: 		UART1_Write_Text("INTENSIDAD LUZ = ")
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
;centinela.mbas,24 :: 		WordToStr(LUZ,TEXTO2)
	MOVF       _LUZ+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _LUZ+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;centinela.mbas,25 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;centinela.mbas,26 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,27 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,28 :: 		if (HUMEDAD<500)AND(LUZ<500) THEN
	MOVLW      1
	SUBWF      _HUMEDAD+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      244
	SUBWF      _HUMEDAD+0, 0
L__main9:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      1
	SUBWF      _LUZ+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      244
	SUBWF      _LUZ+0, 0
L__main10:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main7
;centinela.mbas,29 :: 		UART1_Write_Text("RIEGO ENCENDIDO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      67
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
;centinela.mbas,30 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,31 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main8
;centinela.mbas,32 :: 		else
L__main7:
;centinela.mbas,33 :: 		UART1_Write_Text("RIEGO APAGADO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;centinela.mbas,34 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,35 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;centinela.mbas,36 :: 		end if
L__main8:
;centinela.mbas,37 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;centinela.mbas,38 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
