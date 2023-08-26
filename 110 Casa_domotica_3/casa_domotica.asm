
_main:

;casa_domotica.mbas,5 :: 		main:
;casa_domotica.mbas,6 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;casa_domotica.mbas,7 :: 		PORTA  = 0X00
	CLRF       PORTA+0
;casa_domotica.mbas,8 :: 		TRISA  = 0X00
	CLRF       TRISA+0
;casa_domotica.mbas,9 :: 		PORTB  = 0X00
	CLRF       PORTB+0
;casa_domotica.mbas,10 :: 		TRISB  = 0X00
	CLRF       TRISB+0
;casa_domotica.mbas,11 :: 		PORTC  = 0X00
	CLRF       PORTC+0
;casa_domotica.mbas,12 :: 		TRISC  = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;casa_domotica.mbas,13 :: 		PORTD  = 0X00
	CLRF       PORTD+0
;casa_domotica.mbas,14 :: 		TRISD  = 0X00
	CLRF       TRISD+0
;casa_domotica.mbas,15 :: 		ANSEL  = 0X00
	CLRF       ANSEL+0
;casa_domotica.mbas,16 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;casa_domotica.mbas,17 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;casa_domotica.mbas,18 :: 		DATO=0
	CLRF       _DATO+0
;casa_domotica.mbas,19 :: 		CENT1=0
	BCF        _CENT1+0, BitPos(_CENT1+0)
;casa_domotica.mbas,20 :: 		CENT2=0
	BCF        _CENT2+0, BitPos(_CENT2+0)
;casa_domotica.mbas,21 :: 		CENT3=0
	BCF        _CENT3+0, BitPos(_CENT3+0)
;casa_domotica.mbas,22 :: 		CENT4=0
	BCF        _CENT4+0, BitPos(_CENT4+0)
;casa_domotica.mbas,23 :: 		CENT5=0
	BCF        _CENT5+0, BitPos(_CENT5+0)
;casa_domotica.mbas,24 :: 		GUARDADO=0
	CLRF       _GUARDADO+0
;casa_domotica.mbas,25 :: 		GUARDADO2=0
	CLRF       _GUARDADO2+0
;casa_domotica.mbas,27 :: 		while TRUE
L__main2:
;casa_domotica.mbas,28 :: 		if  UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;casa_domotica.mbas,29 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main7:
;casa_domotica.mbas,31 :: 		if DATO="A" then
	MOVF       _DATO+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;casa_domotica.mbas,32 :: 		CENT1 = NOT(CENT1)
	MOVLW
	XORWF      _CENT1+0, 1
L__main10:
;casa_domotica.mbas,34 :: 		if DATO="B" then
	MOVF       _DATO+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;casa_domotica.mbas,35 :: 		CENT2 = NOT(CENT2)
	MOVLW
	XORWF      _CENT2+0, 1
L__main13:
;casa_domotica.mbas,37 :: 		if DATO="C" then
	MOVF       _DATO+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;casa_domotica.mbas,38 :: 		CENT3 = NOT(CENT3)
	MOVLW
	XORWF      _CENT3+0, 1
L__main16:
;casa_domotica.mbas,40 :: 		if DATO="D" then
	MOVF       _DATO+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;casa_domotica.mbas,41 :: 		CENT4 = NOT(CENT4)
	MOVLW
	XORWF      _CENT4+0, 1
L__main19:
;casa_domotica.mbas,43 :: 		if DATO="E" then
	MOVF       _DATO+0, 0
	XORLW      69
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;casa_domotica.mbas,44 :: 		CENT5 = NOT(CENT5)
	MOVLW
	XORWF      _CENT5+0, 1
L__main22:
;casa_domotica.mbas,47 :: 		if CENT1=1 then
	BTFSS      _CENT1+0, BitPos(_CENT1+0)
	GOTO       L__main25
;casa_domotica.mbas,48 :: 		PORTC = PORTC OR %00000001
	BSF        PORTC+0, 0
	GOTO       L__main26
;casa_domotica.mbas,49 :: 		ELSE
L__main25:
;casa_domotica.mbas,50 :: 		PORTC = PORTC OR %00000000
;casa_domotica.mbas,51 :: 		end if
L__main26:
;casa_domotica.mbas,52 :: 		if CENT2=1 then
	BTFSS      _CENT2+0, BitPos(_CENT2+0)
	GOTO       L__main28
;casa_domotica.mbas,53 :: 		PORTC = PORTC OR %00000010
	BSF        PORTC+0, 1
	GOTO       L__main29
;casa_domotica.mbas,54 :: 		ELSE
L__main28:
;casa_domotica.mbas,55 :: 		PORTC = PORTC OR %00000000
;casa_domotica.mbas,56 :: 		end if
L__main29:
;casa_domotica.mbas,57 :: 		if CENT3=1 then
	BTFSS      _CENT3+0, BitPos(_CENT3+0)
	GOTO       L__main31
;casa_domotica.mbas,58 :: 		PORTC = PORTC OR %00000100
	BSF        PORTC+0, 2
	GOTO       L__main32
;casa_domotica.mbas,59 :: 		ELSE
L__main31:
;casa_domotica.mbas,60 :: 		PORTC = PORTC OR %00000000
;casa_domotica.mbas,61 :: 		end if
L__main32:
;casa_domotica.mbas,62 :: 		if CENT4=1 then
	BTFSS      _CENT4+0, BitPos(_CENT4+0)
	GOTO       L__main34
;casa_domotica.mbas,63 :: 		PORTC = PORTC OR %00001000
	BSF        PORTC+0, 3
	GOTO       L__main35
;casa_domotica.mbas,64 :: 		ELSE
L__main34:
;casa_domotica.mbas,65 :: 		PORTC = PORTC OR %00000000
;casa_domotica.mbas,66 :: 		end if
L__main35:
;casa_domotica.mbas,67 :: 		if CENT5=1 then
	BTFSS      _CENT5+0, BitPos(_CENT5+0)
	GOTO       L__main37
;casa_domotica.mbas,68 :: 		PORTD = PORTD OR %00000001
	BSF        PORTD+0, 0
	GOTO       L__main38
;casa_domotica.mbas,69 :: 		ELSE
L__main37:
;casa_domotica.mbas,70 :: 		PORTC = PORTC OR %00000000
;casa_domotica.mbas,71 :: 		end if
L__main38:
;casa_domotica.mbas,72 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main39:
	DECFSZ     R13+0, 1
	GOTO       L__main39
	DECFSZ     R12+0, 1
	GOTO       L__main39
	DECFSZ     R11+0, 1
	GOTO       L__main39
	NOP
	NOP
;casa_domotica.mbas,73 :: 		GUARDADO=PORTC
	MOVF       PORTC+0, 0
	MOVWF      _GUARDADO+0
;casa_domotica.mbas,74 :: 		GUARDADO2=PORTD
	MOVF       PORTD+0, 0
	MOVWF      _GUARDADO2+0
;casa_domotica.mbas,75 :: 		PORTC=0
	CLRF       PORTC+0
;casa_domotica.mbas,76 :: 		PORTD=0
	CLRF       PORTD+0
;casa_domotica.mbas,77 :: 		DATO=0
	CLRF       _DATO+0
;casa_domotica.mbas,78 :: 		Delay_ms(3000)
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L__main40:
	DECFSZ     R13+0, 1
	GOTO       L__main40
	DECFSZ     R12+0, 1
	GOTO       L__main40
	DECFSZ     R11+0, 1
	GOTO       L__main40
	NOP
;casa_domotica.mbas,79 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
