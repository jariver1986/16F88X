
_main:

;Humedad.mbas,7 :: 		main:
;Humedad.mbas,8 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;Humedad.mbas,10 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Humedad.mbas,12 :: 		TRISA = 0X01 ' porta.5 como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;Humedad.mbas,13 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Humedad.mbas,15 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;Humedad.mbas,16 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Humedad.mbas,18 :: 		TRISB = 0X80
	MOVLW      128
	MOVWF      TRISB+0
;Humedad.mbas,19 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Humedad.mbas,21 :: 		PORTD=0
	CLRF       PORTD+0
;Humedad.mbas,22 :: 		TRISD=0
	CLRF       TRISD+0
;Humedad.mbas,24 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;Humedad.mbas,25 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Humedad.mbas,26 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;Humedad.mbas,27 :: 		PORTC=0X00
	CLRF       PORTC+0
;Humedad.mbas,28 :: 		delay_ms(250)
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
;Humedad.mbas,29 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Humedad.mbas,30 :: 		viajero=0
	CLRF       _viajero+0
;Humedad.mbas,31 :: 		dato=0
	CLRF       _dato+0
;Humedad.mbas,32 :: 		while (TRUE)
L__main3:
;Humedad.mbas,33 :: 		VALOR=Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR+0
	MOVF       R0+1, 0
	MOVWF      _VALOR+1
;Humedad.mbas,34 :: 		TEMP_VALOR=1023-VALOR
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
;Humedad.mbas,35 :: 		PORCENTAJE =(TEMP_VALOR /1023)*100
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
	MOVWF      _PORCENTAJE+0
	MOVF       R0+1, 0
	MOVWF      _PORCENTAJE+1
	MOVF       R0+2, 0
	MOVWF      _PORCENTAJE+2
	MOVF       R0+3, 0
	MOVWF      _PORCENTAJE+3
;Humedad.mbas,37 :: 		WordToStr(PORCENTAJE ,text)
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Humedad.mbas,41 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
	NOP
;Humedad.mbas,43 :: 		if UART1_Data_Ready=1 THEN
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main9
;Humedad.mbas,44 :: 		DATO=UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main9:
;Humedad.mbas,46 :: 		if (DATO=0x31)and (bandera=1) then
	MOVF       _dato+0, 0
	XORLW      49
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _bandera+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main12
;Humedad.mbas,47 :: 		bandera=0
	CLRF       _bandera+0
;Humedad.mbas,48 :: 		UART1_Write_Text("A") '  MAC
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Humedad.mbas,49 :: 		UART1_Write_Text(text)
	MOVLW      _text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Humedad.mbas,50 :: 		UART1_Write_Text("%")
	MOVLW      37
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main12:
;Humedad.mbas,56 :: 		end if
L__main16:
;Humedad.mbas,57 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
