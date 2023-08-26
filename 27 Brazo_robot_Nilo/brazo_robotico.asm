
_main:

;brazo_robotico.mbas,5 :: 		main:
;brazo_robotico.mbas,6 :: 		OSCCON=0X75   'oscilador interno de 4 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;brazo_robotico.mbas,8 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;brazo_robotico.mbas,9 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;brazo_robotico.mbas,11 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;brazo_robotico.mbas,12 :: 		PORTA = 0X00
	CLRF       PORTA+0
;brazo_robotico.mbas,14 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;brazo_robotico.mbas,15 :: 		PORTB = 0X00
	CLRF       PORTB+0
;brazo_robotico.mbas,17 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;brazo_robotico.mbas,18 :: 		PORTC = 0X00
	CLRF       PORTC+0
;brazo_robotico.mbas,20 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;brazo_robotico.mbas,21 :: 		PORTE = 0X00
	CLRF       PORTE+0
;brazo_robotico.mbas,23 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;brazo_robotico.mbas,24 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;brazo_robotico.mbas,25 :: 		dato=0
	CLRF       _dato+0
;brazo_robotico.mbas,26 :: 		contador=0
	CLRF       _contador+0
;brazo_robotico.mbas,27 :: 		while(1)
L__main2:
;brazo_robotico.mbas,43 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
