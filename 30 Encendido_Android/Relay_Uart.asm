
_main:

;Relay_Uart.mbas,5 :: 		main:
;Relay_Uart.mbas,6 :: 		OSCCON=0X75   'oscilador interno de 4 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;Relay_Uart.mbas,8 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Relay_Uart.mbas,9 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Relay_Uart.mbas,11 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Relay_Uart.mbas,12 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Relay_Uart.mbas,14 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;Relay_Uart.mbas,15 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Relay_Uart.mbas,17 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;Relay_Uart.mbas,18 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Relay_Uart.mbas,20 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;Relay_Uart.mbas,21 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Relay_Uart.mbas,23 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Relay_Uart.mbas,24 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Relay_Uart.mbas,25 :: 		dato=0
	CLRF       _dato+0
;Relay_Uart.mbas,26 :: 		contador=0
	CLRF       _contador+0
;Relay_Uart.mbas,27 :: 		while(1)
L__main2:
;Relay_Uart.mbas,29 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;Relay_Uart.mbas,30 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;Relay_Uart.mbas,31 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main7:
;Relay_Uart.mbas,34 :: 		if (dato=0x31) then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;Relay_Uart.mbas,35 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;Relay_Uart.mbas,36 :: 		while(contador<1)
L__main13:
	MOVLW      1
	SUBWF      _contador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main14
;Relay_Uart.mbas,37 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Relay_Uart.mbas,38 :: 		inc(contador)
	INCF       _contador+0, 1
;Relay_Uart.mbas,39 :: 		wend
	GOTO       L__main13
L__main14:
;Relay_Uart.mbas,40 :: 		contador=0
	CLRF       _contador+0
;Relay_Uart.mbas,41 :: 		dato=0
	CLRF       _dato+0
;Relay_Uart.mbas,42 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
L__main10:
;Relay_Uart.mbas,45 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
