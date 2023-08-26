
_main:

;Señal_MatLab.mbas,8 :: 		main:
;Señal_MatLab.mbas,10 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;Señal_MatLab.mbas,12 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Señal_MatLab.mbas,14 :: 		TRISA = 0X01 ' porta.5 como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;Señal_MatLab.mbas,15 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Señal_MatLab.mbas,17 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;Señal_MatLab.mbas,18 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Señal_MatLab.mbas,20 :: 		TRISB = 0X80
	MOVLW      128
	MOVWF      TRISB+0
;Señal_MatLab.mbas,21 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Señal_MatLab.mbas,23 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;Señal_MatLab.mbas,24 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Señal_MatLab.mbas,26 :: 		TRISC=0X00
	CLRF       TRISC+0
;Señal_MatLab.mbas,27 :: 		PORTC=0X00
	CLRF       PORTC+0
;Señal_MatLab.mbas,29 :: 		delay_ms(1000)
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
;Señal_MatLab.mbas,30 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Señal_MatLab.mbas,32 :: 		while (TRUE)
L__main3:
;Señal_MatLab.mbas,33 :: 		VALOR=Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR+0
	MOVF       R0+1, 0
	MOVWF      _VALOR+1
;Señal_MatLab.mbas,36 :: 		WordToStr(VALOR,TEXT)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Señal_MatLab.mbas,37 :: 		UART1_Write_Text(TEXT)
	MOVLW      _text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Señal_MatLab.mbas,38 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
;Señal_MatLab.mbas,39 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
