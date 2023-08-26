
adc_uart_retardo2:

;adc_uart.mbas,6 :: 		dim contador as word
;adc_uart.mbas,7 :: 		contador = 0
	CLRF       retardo2_contador+0
	CLRF       retardo2_contador+1
;adc_uart.mbas,8 :: 		while ((contador<10))
L_adc_uart_retardo22:
	MOVLW      0
	SUBWF      retardo2_contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_adc_uart_retardo219
	MOVLW      10
	SUBWF      retardo2_contador+0, 0
L_adc_uart_retardo219:
	BTFSC      STATUS+0, 0
	GOTO       L_adc_uart_retardo23
;adc_uart.mbas,9 :: 		inc(contador)
	INCF       retardo2_contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       retardo2_contador+1, 1
;adc_uart.mbas,10 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;adc_uart.mbas,12 :: 		wend
	GOTO       L_adc_uart_retardo22
L_adc_uart_retardo23:
	RETURN
; end of adc_uart_retardo2

_main:

;adc_uart.mbas,14 :: 		main:
;adc_uart.mbas,15 :: 		OSCCON  = %01110101
	MOVLW      117
	MOVWF      OSCCON+0
;adc_uart.mbas,16 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;adc_uart.mbas,17 :: 		TRISA   = %00000111
	MOVLW      7
	MOVWF      TRISA+0
;adc_uart.mbas,18 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;adc_uart.mbas,19 :: 		TRISB   = %00000000
	CLRF       TRISB+0
;adc_uart.mbas,20 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;adc_uart.mbas,21 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;adc_uart.mbas,22 :: 		ANSEL   = %00000111
	MOVLW      7
	MOVWF      ANSEL+0
;adc_uart.mbas,23 :: 		ANSELH  = %00000000
	CLRF       ANSELH+0
;adc_uart.mbas,24 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;adc_uart.mbas,26 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
;adc_uart.mbas,28 :: 		while 1
L__main8:
;adc_uart.mbas,29 :: 		if  UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;adc_uart.mbas,30 :: 		DATO = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
	CLRF       _DATO+1
L__main13:
;adc_uart.mbas,32 :: 		valor1=Adc_Read(0)*5
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVLW      5
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _valor1+0
	MOVF       R0+1, 0
	MOVWF      _valor1+1
;adc_uart.mbas,33 :: 		valor2=Adc_Read(1)>>2
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _valor2+0
	MOVF       R0+1, 0
	MOVWF      _valor2+1
	RRF        _valor2+1, 1
	RRF        _valor2+0, 1
	BCF        _valor2+1, 7
	RRF        _valor2+1, 1
	RRF        _valor2+0, 1
	BCF        _valor2+1, 7
;adc_uart.mbas,34 :: 		valor3=Adc_Read(2)>>2
	MOVLW      2
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _valor3+0
	MOVF       R0+1, 0
	MOVWF      _valor3+1
	RRF        _valor3+1, 1
	RRF        _valor3+0, 1
	BCF        _valor3+1, 7
	RRF        _valor3+1, 1
	RRF        _valor3+0, 1
	BCF        _valor3+1, 7
;adc_uart.mbas,35 :: 		WordToStr(valor1,texto1)
	MOVF       _valor1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valor1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO1+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;adc_uart.mbas,36 :: 		WordToStr(valor2,texto2)
	MOVF       _valor2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valor2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;adc_uart.mbas,37 :: 		WordToStr(valor3,texto3)
	MOVF       _valor3+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _valor3+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto3+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;adc_uart.mbas,38 :: 		if DATO="X" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      88
	XORWF      _DATO+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;adc_uart.mbas,39 :: 		UART1_Write("A")
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,41 :: 		UART1_Write("1")
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,42 :: 		UART1_Write("5")
	MOVLW      53
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,43 :: 		UART1_Write("3")
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,44 :: 		UART1_Write(":")
	MOVLW      58
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,45 :: 		UART1_Write("2")
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,46 :: 		UART1_Write("0")
	MOVLW      48
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,47 :: 		UART1_Write("1")
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,48 :: 		UART1_Write(":")
	MOVLW      58
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,49 :: 		UART1_Write("2")
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,50 :: 		UART1_Write("3")
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,51 :: 		UART1_Write("8")
	MOVLW      56
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,52 :: 		UART1_Write("B")
	MOVLW      66
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;adc_uart.mbas,67 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main16:
;adc_uart.mbas,69 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
;adc_uart.mbas,71 :: 		wend
	GOTO       L__main8
	GOTO       $+0
; end of _main
