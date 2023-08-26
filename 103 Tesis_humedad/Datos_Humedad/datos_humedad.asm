
_main:

;datos_humedad.mbas,6 :: 		main:
;datos_humedad.mbas,7 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;datos_humedad.mbas,9 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;datos_humedad.mbas,11 :: 		TRISA = 0X01 ' porta.0 como entrada analógica
	MOVLW      1
	MOVWF      TRISA+0
;datos_humedad.mbas,12 :: 		PORTA = 0X00
	CLRF       PORTA+0
;datos_humedad.mbas,14 :: 		TRISB = 0X00
	CLRF       TRISB+0
;datos_humedad.mbas,15 :: 		PORTB = 0X00
	CLRF       PORTB+0
;datos_humedad.mbas,17 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;datos_humedad.mbas,18 :: 		PORTC = 0X00
	CLRF       PORTC+0
;datos_humedad.mbas,20 :: 		ANSEL = 0X01  ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;datos_humedad.mbas,21 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;datos_humedad.mbas,23 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;datos_humedad.mbas,24 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;datos_humedad.mbas,25 :: 		while (TRUE)
L__main3:
;datos_humedad.mbas,26 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;datos_humedad.mbas,27 :: 		VALOR=Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _VALOR+0
	MOVF       R2+1, 0
	MOVWF      _VALOR+1
;datos_humedad.mbas,28 :: 		HUMEDAD= (100*VALOR-4080)/153
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      240
	SUBWF      R0+0, 1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      15
	SUBWF      R0+1, 1
	MOVLW      153
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _HUMEDAD+0
	MOVF       R0+1, 0
	MOVWF      _HUMEDAD+1
;datos_humedad.mbas,29 :: 		WordToStr(HUMEDAD ,text)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;datos_humedad.mbas,31 :: 		UART1_Write_Text(text)
	MOVLW      _text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;datos_humedad.mbas,32 :: 		UART1_Write_Text(" %")
	MOVLW      32
	MOVWF      _main_Local_Text+0
	MOVLW      37
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;datos_humedad.mbas,35 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;datos_humedad.mbas,36 :: 		PORTB=0X00
	CLRF       PORTB+0
;datos_humedad.mbas,37 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
	NOP
	NOP
;datos_humedad.mbas,38 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
