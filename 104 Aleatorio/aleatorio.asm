
_main:

;aleatorio.mbas,3 :: 		main:
;aleatorio.mbas,4 :: 		OSCCON = 0X75      ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;aleatorio.mbas,6 :: 		TRISA  = 0
	CLRF       TRISA+0
;aleatorio.mbas,7 :: 		TRISB  = 0
	CLRF       TRISB+0
;aleatorio.mbas,8 :: 		TRISC  = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;aleatorio.mbas,9 :: 		PORTA  = 0
	CLRF       PORTA+0
;aleatorio.mbas,10 :: 		PORTB  = 0
	CLRF       PORTB+0
;aleatorio.mbas,11 :: 		PORTC  = 0
	CLRF       PORTC+0
;aleatorio.mbas,12 :: 		ANSEL  = 0
	CLRF       ANSEL+0
;aleatorio.mbas,13 :: 		ANSELH = 0
	CLRF       ANSELH+0
;aleatorio.mbas,14 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;aleatorio.mbas,16 :: 		while(1)
L__main2:
;aleatorio.mbas,17 :: 		UART1_Write_Text("1")
	MOVLW      49
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,18 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,19 :: 		UART1_Write_Text("9")
	MOVLW      57
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,20 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,21 :: 		UART1_Write_Text("8")
	MOVLW      56
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,22 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,23 :: 		UART1_Write_Text("6")
	MOVLW      54
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,24 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,25 :: 		UART1_Write_Text("5")
	MOVLW      53
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,26 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,27 :: 		UART1_Write_Text("6")
	MOVLW      54
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,28 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,29 :: 		UART1_Write_Text("7")
	MOVLW      55
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,30 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,31 :: 		UART1_Write_Text("8")
	MOVLW      56
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,32 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,33 :: 		UART1_Write_Text("9")
	MOVLW      57
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;aleatorio.mbas,34 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;aleatorio.mbas,35 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
