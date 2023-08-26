
_main:

;EKG.mbas,6 :: 		main:
;EKG.mbas,7 :: 		OSCCON=%01110101        'configuración de oscilador interno
	MOVLW      117
	MOVWF      OSCCON+0
;EKG.mbas,8 :: 		OPTION_REG=$80
	MOVLW      128
	MOVWF      OPTION_REG+0
;EKG.mbas,9 :: 		intcon=0
	CLRF       INTCON+0
;EKG.mbas,10 :: 		CM2CON0=0               'Se apagan comparadores
	CLRF       CM2CON0+0
;EKG.mbas,11 :: 		ANSEL=%00000001         'Se configura RA0 como entrada analógica.
	MOVLW      1
	MOVWF      ANSEL+0
;EKG.mbas,12 :: 		ANSELH=0                'Parte alta del puerto A se configuran como salidas.  R8-R13
	CLRF       ANSELH+0
;EKG.mbas,13 :: 		TRISA=%00000001         'Declara a RA0 como entrada.
	MOVLW      1
	MOVWF      TRISA+0
;EKG.mbas,14 :: 		TRISB=%00000000         'Declara el Puerto B como salida
	CLRF       TRISB+0
;EKG.mbas,15 :: 		TRISC=%00000000         'Declara el Puerto C como salida.
	CLRF       TRISC+0
;EKG.mbas,16 :: 		TRISE=%00000000         'Declara el Puerto E como salida.
	CLRF       TRISE+0
;EKG.mbas,17 :: 		Mx=0                    'Se incializa Mx con 0
	CLRF       _Mx+0
	CLRF       _Mx+1
;EKG.mbas,18 :: 		UART1_Init(9600)       'Inicializa módulo USART  MAX baud rate
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;EKG.mbas,19 :: 		PORTA=0
	CLRF       PORTA+0
;EKG.mbas,20 :: 		PORTB=0
	CLRF       PORTB+0
;EKG.mbas,21 :: 		PORTC=0
	CLRF       PORTC+0
;EKG.mbas,23 :: 		WHILE(1)                'Lazo infinito
L__main2:
;EKG.mbas,24 :: 		Mx= Adc_Read(0)      'Lee dato analogico de RA0 y digitaliza a
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _Mx+0
	MOVF       R0+1, 0
	MOVWF      _Mx+1
;EKG.mbas,26 :: 		wordToStr(Mx, Mx_out )
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _Mx_out+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;EKG.mbas,33 :: 		UART1_Write_Text(Mx_out)'Se envía dato digitalizado
	MOVLW      _Mx_out+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;EKG.mbas,34 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;EKG.mbas,35 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;EKG.mbas,36 :: 		Delay_ms(100)             'Retardo de 5mS
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
;EKG.mbas,37 :: 		WEND                    'Fin de sentencia While que continuará ejecutandose
	GOTO       L__main2
	GOTO       $+0
; end of _main
