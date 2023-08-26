
humedad_SONIDO:

;humedad.mbas,5 :: 		sub procedure SONIDO
;humedad.mbas,6 :: 		PORTD.RD2=1   'ENDENDIDO DE BUZZER
	BSF        PORTD+0, 2
;humedad.mbas,7 :: 		PORTD.RD1=1   'ENDENDIDO DE LED
	BSF        PORTD+0, 1
;humedad.mbas,8 :: 		Delay_ms(200) 'RETARDO DE 200MS
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_humedad_SONIDO1:
	DECFSZ     R13+0, 1
	GOTO       L_humedad_SONIDO1
	DECFSZ     R12+0, 1
	GOTO       L_humedad_SONIDO1
	DECFSZ     R11+0, 1
	GOTO       L_humedad_SONIDO1
;humedad.mbas,9 :: 		PORTD.RD2=0   'APAGADO DE BUZZER
	BCF        PORTD+0, 2
;humedad.mbas,10 :: 		PORTD.RD1=0   'APAGADO DE LED
	BCF        PORTD+0, 1
;humedad.mbas,11 :: 		Delay_ms(200) 'RETARDO
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_humedad_SONIDO2:
	DECFSZ     R13+0, 1
	GOTO       L_humedad_SONIDO2
	DECFSZ     R12+0, 1
	GOTO       L_humedad_SONIDO2
	DECFSZ     R11+0, 1
	GOTO       L_humedad_SONIDO2
	RETURN
; end of humedad_SONIDO

_main:

;humedad.mbas,13 :: 		main:
;humedad.mbas,14 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;humedad.mbas,16 :: 		OSCCON = 0X75   ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;humedad.mbas,18 :: 		TRISA = 0X01    ' porta.0 como entrada analogica
	MOVLW      1
	MOVWF      TRISA+0
;humedad.mbas,19 :: 		PORTA = 0X00
	CLRF       PORTA+0
;humedad.mbas,21 :: 		TRISB = 0X00
	CLRF       TRISB+0
;humedad.mbas,22 :: 		PORTB = 0X00
	CLRF       PORTB+0
;humedad.mbas,24 :: 		TRISC = 0X80     'tx datos y rx datos
	MOVLW      128
	MOVWF      TRISC+0
;humedad.mbas,25 :: 		PORTC = 0X00
	CLRF       PORTC+0
;humedad.mbas,27 :: 		TRISD = 0X00
	CLRF       TRISD+0
;humedad.mbas,28 :: 		PORTD = 0X00
	CLRF       PORTD+0
;humedad.mbas,30 :: 		ANSEL = 0X01  ' AN<7:0> tipo de sensor anañogico
	MOVLW      1
	MOVWF      ANSEL+0
;humedad.mbas,31 :: 		ANSELH = 0X00 ' AN<13:8> no hay mas sensores analogicos
	CLRF       ANSELH+0
;humedad.mbas,32 :: 		delay_ms(250)
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
;humedad.mbas,33 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;humedad.mbas,34 :: 		SONIDO()
	CALL       humedad_SONIDO+0
;humedad.mbas,35 :: 		SONIDO()
	CALL       humedad_SONIDO+0
;humedad.mbas,36 :: 		while (TRUE)
L__main6:
;humedad.mbas,37 :: 		VALOR=Adc_Read(0)        'lectura del VALOR e humedadd
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR+0
	MOVF       R0+1, 0
	MOVWF      _VALOR+1
;humedad.mbas,38 :: 		TEMP_VALOR=1024-VALOR    '
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      4
	MOVWF      FLOC__main+5
	MOVF       FLOC__main+4, 0
	MOVWF      _TEMP_VALOR+0
	MOVF       FLOC__main+5, 0
	MOVWF      _TEMP_VALOR+1
;humedad.mbas,39 :: 		PORCENTAJE =100-(TEMP_VALOR /1023)*100 'trsnaformacion de datos a valores de humedad
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
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       R0+2, 0
	MOVWF      FLOC__main+6
	MOVF       R0+3, 0
	MOVWF      FLOC__main+7
	MOVLW      100
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
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	MOVF       FLOC__main+6, 0
	MOVWF      R0+2
	MOVF       FLOC__main+7, 0
	MOVWF      R0+3
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
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _PORCENTAJE+0
	MOVF       R0+1, 0
	MOVWF      _PORCENTAJE+1
	MOVF       R0+2, 0
	MOVWF      _PORCENTAJE+2
	MOVF       R0+3, 0
	MOVWF      _PORCENTAJE+3
;humedad.mbas,40 :: 		FLOATToStr(PORCENTAJE ,text)  'prepara informacion para ser transmitida
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _text+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;humedad.mbas,41 :: 		UART1_Write(TEXT[0])  'se envian los datos
	MOVF       _text+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;humedad.mbas,42 :: 		UART1_Write(TEXT[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;humedad.mbas,43 :: 		UART1_Write(".")
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;humedad.mbas,44 :: 		UART1_Write(TEXT[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;humedad.mbas,45 :: 		UART1_Write(TEXT[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;humedad.mbas,46 :: 		UART1_Write_Text("H")  'H identificador de humedad
	MOVLW      72
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;humedad.mbas,47 :: 		UART1_Write_Text("L")  'L indentificador de fin de dato
	MOVLW      76
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;humedad.mbas,51 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
	NOP
;humedad.mbas,52 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
