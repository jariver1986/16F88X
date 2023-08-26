
carro_32bombero_adelante:

;carro bombero.mbas,3 :: 		sub procedure adelante
;carro bombero.mbas,4 :: 		PORTC=%00000011
	MOVLW      3
	MOVWF      PORTC+0
	RETURN
; end of carro_32bombero_adelante

carro_32bombero_izquierda:

;carro bombero.mbas,6 :: 		sub procedure izquierda
;carro bombero.mbas,7 :: 		PORTC=%00001001
	MOVLW      9
	MOVWF      PORTC+0
	RETURN
; end of carro_32bombero_izquierda

carro_32bombero_derecha:

;carro bombero.mbas,9 :: 		sub procedure derecha
;carro bombero.mbas,10 :: 		PORTC=%00000110
	MOVLW      6
	MOVWF      PORTC+0
	RETURN
; end of carro_32bombero_derecha

carro_32bombero_atras:

;carro bombero.mbas,12 :: 		sub procedure atras
;carro bombero.mbas,13 :: 		PORTC=%00001100
	MOVLW      12
	MOVWF      PORTC+0
	RETURN
; end of carro_32bombero_atras

carro_32bombero_parar:

;carro bombero.mbas,15 :: 		sub procedure parar
;carro bombero.mbas,16 :: 		PORTC=%00000000
	CLRF       PORTC+0
	RETURN
; end of carro_32bombero_parar

_main:

;carro bombero.mbas,19 :: 		main:
;carro bombero.mbas,20 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;carro bombero.mbas,21 :: 		TRISB = %00000111
	MOVLW      7
	MOVWF      TRISB+0
;carro bombero.mbas,22 :: 		PORTB = %00000000
	CLRF       PORTB+0
;carro bombero.mbas,23 :: 		TRISC = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;carro bombero.mbas,24 :: 		PORTC = %00000000
	CLRF       PORTC+0
;carro bombero.mbas,25 :: 		TRISE = %00000000
	CLRF       TRISE+0
;carro bombero.mbas,26 :: 		PORTE = %00000000
	CLRF       PORTE+0
;carro bombero.mbas,27 :: 		TRISA = %00000000
	CLRF       TRISA+0
;carro bombero.mbas,28 :: 		PORTA = %00000000
	CLRF       PORTA+0
;carro bombero.mbas,29 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;carro bombero.mbas,30 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;carro bombero.mbas,31 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;carro bombero.mbas,33 :: 		while 1
L__main7:
;carro bombero.mbas,34 :: 		IF UART1_Data_Ready() THEN
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main12
;carro bombero.mbas,35 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main12:
;carro bombero.mbas,37 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;carro bombero.mbas,38 :: 		ADELANTE
	CALL       carro_32bombero_adelante+0
;carro bombero.mbas,39 :: 		DATO=0
	CLRF       _DATO+0
L__main15:
;carro bombero.mbas,41 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;carro bombero.mbas,42 :: 		ATRAS
	CALL       carro_32bombero_atras+0
;carro bombero.mbas,43 :: 		DATO=0
	CLRF       _DATO+0
L__main18:
;carro bombero.mbas,45 :: 		if DATO = "3" then
	MOVF       _DATO+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;carro bombero.mbas,46 :: 		IZQUIERDA
	CALL       carro_32bombero_izquierda+0
;carro bombero.mbas,47 :: 		DATO=0
	CLRF       _DATO+0
L__main21:
;carro bombero.mbas,49 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main24
;carro bombero.mbas,50 :: 		DERECHA
	CALL       carro_32bombero_derecha+0
;carro bombero.mbas,51 :: 		DATO=0
	CLRF       _DATO+0
L__main24:
;carro bombero.mbas,53 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;carro bombero.mbas,54 :: 		PARAR
	CALL       carro_32bombero_parar+0
;carro bombero.mbas,55 :: 		DATO=0
	CLRF       _DATO+0
L__main27:
;carro bombero.mbas,57 :: 		if DATO = "S" then
	MOVF       _DATO+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;carro bombero.mbas,58 :: 		if PORTB.RB0 = 1 then
	BTFSS      PORTB+0, 0
	GOTO       L__main33
;carro bombero.mbas,59 :: 		ADELANTE
	CALL       carro_32bombero_adelante+0
L__main33:
;carro bombero.mbas,61 :: 		if PORTB.RB1 = 1 then
	BTFSS      PORTB+0, 1
	GOTO       L__main36
;carro bombero.mbas,62 :: 		IZQUIERDA
	CALL       carro_32bombero_izquierda+0
L__main36:
;carro bombero.mbas,64 :: 		if PORTB.RB2 = 1 then
	BTFSS      PORTB+0, 2
	GOTO       L__main39
;carro bombero.mbas,65 :: 		DERECHA
	CALL       carro_32bombero_derecha+0
L__main39:
;carro bombero.mbas,67 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main41:
	DECFSZ     R13+0, 1
	GOTO       L__main41
	DECFSZ     R12+0, 1
	GOTO       L__main41
	DECFSZ     R11+0, 1
	GOTO       L__main41
	NOP
L__main30:
;carro bombero.mbas,69 :: 		wend
	GOTO       L__main7
	GOTO       $+0
; end of _main
