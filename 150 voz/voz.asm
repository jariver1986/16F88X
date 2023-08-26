
_main:

;voz.mbas,4 :: 		main:
;voz.mbas,5 :: 		OSCCON     =  0X75  'FRECUENCIA DE TRABAJO A 4 MHz
	MOVLW      117
	MOVWF      OSCCON+0
;voz.mbas,6 :: 		UART1_Init(9600)                'COMUNICACION SERIAL INICIADA
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;voz.mbas,7 :: 		TRISA      =  %00000000         'INICIO DE MODO INTERNO O EXTERNO
	CLRF       TRISA+0
;voz.mbas,8 :: 		TRISB      =  0
	CLRF       TRISB+0
;voz.mbas,9 :: 		TRISC      =  %10000000         'PARA REECEPCION DE DATOS DESDE EL RFID
	MOVLW      128
	MOVWF      TRISC+0
;voz.mbas,10 :: 		TRISD      =  %00000000
	CLRF       TRISD+0
;voz.mbas,11 :: 		PORTA      =  %00000000         'PARA EL VIBRADOR
	CLRF       PORTA+0
;voz.mbas,12 :: 		PORTB      =  0
	CLRF       PORTB+0
;voz.mbas,13 :: 		PORTC      =  0
	CLRF       PORTC+0
;voz.mbas,14 :: 		PORTD      =  0
	CLRF       PORTD+0
;voz.mbas,15 :: 		ANSEL      =  %00000000         'INICIO DE MODO INTERNO O EXTERNO
	CLRF       ANSEL+0
;voz.mbas,16 :: 		ANSELH     =  0
	CLRF       ANSELH+0
;voz.mbas,18 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;voz.mbas,19 :: 		WHILE(1)
L__main3:
;voz.mbas,21 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main8
;voz.mbas,22 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main8:
;voz.mbas,25 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main11
;voz.mbas,26 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;voz.mbas,27 :: 		DATO=0
	CLRF       _DATO+0
L__main11:
;voz.mbas,29 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main14
;voz.mbas,30 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;voz.mbas,31 :: 		DATO=0
	CLRF       _DATO+0
L__main14:
;voz.mbas,33 :: 		WEND
	GOTO       L__main3
	GOTO       $+0
; end of _main
