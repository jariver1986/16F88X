
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
;Relay_Uart.mbas,33 :: 		if (dato=0x31) then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;Relay_Uart.mbas,34 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
L__main10:
;Relay_Uart.mbas,43 :: 		if (dato=0x32) then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;Relay_Uart.mbas,44 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
L__main13:
;Relay_Uart.mbas,46 :: 		if (dato=0x33) then
	MOVF       _dato+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;Relay_Uart.mbas,47 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
L__main16:
;Relay_Uart.mbas,49 :: 		if (dato=0x34) then
	MOVF       _dato+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Relay_Uart.mbas,50 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
L__main19:
;Relay_Uart.mbas,52 :: 		if (dato=0x35) then
	MOVF       _dato+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;Relay_Uart.mbas,53 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
L__main22:
;Relay_Uart.mbas,55 :: 		if (dato=0x36) then
	MOVF       _dato+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;Relay_Uart.mbas,56 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
L__main25:
;Relay_Uart.mbas,59 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
