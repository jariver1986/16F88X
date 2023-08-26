
_main:

;sistema_riego.mbas,5 :: 		main:
;sistema_riego.mbas,6 :: 		osccon = %01110101
	MOVLW      117
	MOVWF      OSCCON+0
;sistema_riego.mbas,7 :: 		trisa  = %00000001
	MOVLW      1
	MOVWF      TRISA+0
;sistema_riego.mbas,8 :: 		porta  = %00000000
	CLRF       PORTA+0
;sistema_riego.mbas,9 :: 		portb  = %00000000
	CLRF       PORTB+0
;sistema_riego.mbas,10 :: 		trisb  = %00000000
	CLRF       TRISB+0
;sistema_riego.mbas,11 :: 		trisc  = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;sistema_riego.mbas,12 :: 		portc  = %00000000
	CLRF       PORTC+0
;sistema_riego.mbas,13 :: 		ansel  = %00000001
	MOVLW      1
	MOVWF      ANSEL+0
;sistema_riego.mbas,14 :: 		anselh = %00000000
	CLRF       ANSELH+0
;sistema_riego.mbas,15 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sistema_riego.mbas,16 :: 		while (1)
L__main2:
;sistema_riego.mbas,17 :: 		if UART1_Data_Ready = 1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;sistema_riego.mbas,18 :: 		dato = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main7:
;sistema_riego.mbas,20 :: 		if dato = "1" then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;sistema_riego.mbas,21 :: 		dato =0
	CLRF       _dato+0
;sistema_riego.mbas,22 :: 		portc.rc1 = 1
	BSF        PORTC+0, 1
L__main10:
;sistema_riego.mbas,24 :: 		if dato = "2" then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;sistema_riego.mbas,25 :: 		dato =0
	CLRF       _dato+0
;sistema_riego.mbas,26 :: 		portc.rc1 = 0
	BCF        PORTC+0, 1
L__main13:
;sistema_riego.mbas,28 :: 		conversion = Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _conversion+0
	MOVF       R0+1, 0
	MOVWF      _conversion+1
;sistema_riego.mbas,29 :: 		WordToStr(CONVERSION,TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;sistema_riego.mbas,30 :: 		UART1_Write_Text(texto)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema_riego.mbas,31 :: 		portb = conversion>>2
	MOVF       _conversion+0, 0
	MOVWF      R0+0
	MOVF       _conversion+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;sistema_riego.mbas,32 :: 		if conversion >1010 then
	MOVF       _conversion+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVF       _conversion+0, 0
	SUBLW      242
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L__main16
;sistema_riego.mbas,33 :: 		portc.rc0 = 1
	BSF        PORTC+0, 0
	GOTO       L__main17
;sistema_riego.mbas,34 :: 		else
L__main16:
;sistema_riego.mbas,35 :: 		portc.rc0 = 0
	BCF        PORTC+0, 0
;sistema_riego.mbas,36 :: 		end if
L__main17:
;sistema_riego.mbas,37 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_riego.mbas,38 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
