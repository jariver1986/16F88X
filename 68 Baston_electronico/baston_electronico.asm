
_main:

;baston_electronico.mbas,6 :: 		main:
;baston_electronico.mbas,7 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;baston_electronico.mbas,9 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;baston_electronico.mbas,11 :: 		TRISA = 0X01 ' porta.5 como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;baston_electronico.mbas,12 :: 		PORTA = 0X00
	CLRF       PORTA+0
;baston_electronico.mbas,14 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;baston_electronico.mbas,15 :: 		PORTB = 0X00
	CLRF       PORTB+0
;baston_electronico.mbas,17 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;baston_electronico.mbas,18 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;baston_electronico.mbas,19 :: 		TRISC=0X00
	CLRF       TRISC+0
;baston_electronico.mbas,20 :: 		PORTC=0X00
	CLRF       PORTC+0
;baston_electronico.mbas,21 :: 		delay_ms(250)
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
;baston_electronico.mbas,22 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;baston_electronico.mbas,23 :: 		UART1_Write_Text("IDEAS&TECNOLOGIA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      38
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;baston_electronico.mbas,24 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;baston_electronico.mbas,25 :: 		UART1_Write_Text(" LDR ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;baston_electronico.mbas,26 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;baston_electronico.mbas,27 :: 		delay_ms(1000)
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
;baston_electronico.mbas,28 :: 		while (TRUE)
L__main4:
;baston_electronico.mbas,29 :: 		VALOR=Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR+0
	MOVF       R0+1, 0
	MOVWF      _VALOR+1
;baston_electronico.mbas,30 :: 		TEMP_VALOR=1023-VALOR
	MOVF       R0+0, 0
	SUBLW      255
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      3
	MOVWF      FLOC__main+5
	MOVF       FLOC__main+4, 0
	MOVWF      _TEMP_VALOR+0
	MOVF       FLOC__main+5, 0
	MOVWF      _TEMP_VALOR+1
;baston_electronico.mbas,31 :: 		PORCENTAJE =(TEMP_VALOR /1023)*100
	MOVLW      255
	MOVWF      R0+0
	MOVLW      3
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
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
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVLW      100
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	MOVF       FLOC__main+2, 0
	MOVWF      R4+2
	MOVF       FLOC__main+3, 0
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
	MOVF       FLOC__main+0, 0
	MOVWF      _PORCENTAJE+0
	MOVF       FLOC__main+1, 0
	MOVWF      _PORCENTAJE+1
	MOVF       FLOC__main+2, 0
	MOVWF      _PORCENTAJE+2
	MOVF       FLOC__main+3, 0
	MOVWF      _PORCENTAJE+3
;baston_electronico.mbas,38 :: 		if PORCENTAJE<85 then
	MOVLW      85
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
	CALL       _Compare_Double+0
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main9
;baston_electronico.mbas,39 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;baston_electronico.mbas,40 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;baston_electronico.mbas,41 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	DECFSZ     R12+0, 1
	GOTO       L__main11
	DECFSZ     R11+0, 1
	GOTO       L__main11
	NOP
;baston_electronico.mbas,42 :: 		PORTB=0X00
	CLRF       PORTB+0
;baston_electronico.mbas,43 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;baston_electronico.mbas,44 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
	NOP
L__main9:
;baston_electronico.mbas,48 :: 		wend
	GOTO       L__main4
	GOTO       $+0
; end of _main
