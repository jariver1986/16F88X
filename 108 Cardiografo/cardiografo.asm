
_main:

;cardiografo.mbas,22 :: 		main:
;cardiografo.mbas,23 :: 		OSCCON = %01110101               ' FRECUENCIA DE TRABAJO A 8 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;cardiografo.mbas,24 :: 		PORTA  = %00000000               ' ENCERA PUERTA A
	CLRF       PORTA+0
;cardiografo.mbas,25 :: 		PORTB  = %00000000               ' ENCERA PUERTA B
	CLRF       PORTB+0
;cardiografo.mbas,26 :: 		PORTC  = %00000000               ' ENCERA PUERTA C
	CLRF       PORTC+0
;cardiografo.mbas,27 :: 		TRISA  = %00000011               ' ENCERA PUERTA RA0 COMO ENTRADA
	MOVLW      3
	MOVWF      TRISA+0
;cardiografo.mbas,28 :: 		TRISB  = %00000000               ' ENCERA TRIS B COMO SALIDA
	CLRF       TRISB+0
;cardiografo.mbas,29 :: 		TRISC  = %00000000               ' ENCERA TRIS C COMO SALIDA RC6
	CLRF       TRISC+0
;cardiografo.mbas,30 :: 		ANSEL  = %00000011               ' ENCERA PUERTO COMO ENTRADA ANALOGICA RA0
	MOVLW      3
	MOVWF      ANSEL+0
;cardiografo.mbas,31 :: 		ANSELH = %00000000               ' ENCERA PUERTO B COMO E/S DIGITAL
	CLRF       ANSELH+0
;cardiografo.mbas,32 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;cardiografo.mbas,33 :: 		DATO2=0x13
	MOVLW      19
	MOVWF      _DATO2+0
;cardiografo.mbas,34 :: 		while (1)
L__main2:
;cardiografo.mbas,35 :: 		PULSO = Adc_Read(1)        'LECTURA DE VALOR DE VOLTAJE ANALOGIC
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _PULSO+0
	MOVF       R0+1, 0
	MOVWF      _PULSO+1
;cardiografo.mbas,36 :: 		if PULSO<=99 then
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       R0+0, 0
	SUBLW      99
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L__main7
;cardiografo.mbas,37 :: 		WordToStr(PULSO,DATO)
	MOVF       _PULSO+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _PULSO+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _DATO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;cardiografo.mbas,38 :: 		FIN = DATO[3] +DATO[4]+DATO2
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVF       _DATO+3, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVF       _DATO+4, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVF       _DATO2+0, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	MOVLW      _FIN+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;cardiografo.mbas,39 :: 		UART1_Write_Text(fin)
	MOVLW      _FIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main8
;cardiografo.mbas,40 :: 		else
L__main7:
;cardiografo.mbas,41 :: 		WordToStr(PULSO,DATO)
	MOVF       _PULSO+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _PULSO+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _DATO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;cardiografo.mbas,42 :: 		FIN = DATO[2] +DATO[3] +DATO[4]+DATO2
	MOVLW      FLOC__main+0
	MOVWF      FSR
	MOVF       _DATO+2, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVF       _DATO+3, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVF       _DATO+4, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVF       _DATO2+0, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	MOVLW      _FIN+0
	MOVWF      FSR
	MOVLW      FLOC__main+0
	MOVWF      R1+0
	CALL       ___CS2S+0
	CLRF       INDF+0
;cardiografo.mbas,43 :: 		UART1_Write_Text(fin)
	MOVLW      _FIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;cardiografo.mbas,44 :: 		end if
L__main8:
;cardiografo.mbas,45 :: 		Delay_us(5000)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	NOP
	NOP
;cardiografo.mbas,46 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
