
_main:

;casa_playa.mbas,6 :: 		main:
;casa_playa.mbas,8 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;casa_playa.mbas,10 :: 		TRISA = 0X01 ' PORTA.0 Entrada
	MOVLW      1
	MOVWF      TRISA+0
;casa_playa.mbas,11 :: 		PORTA = 0X00
	CLRF       PORTA+0
;casa_playa.mbas,13 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;casa_playa.mbas,14 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_playa.mbas,16 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;casa_playa.mbas,17 :: 		PORTC = 0X00
	CLRF       PORTC+0
;casa_playa.mbas,19 :: 		TRISD = 0X00 ' PORTD
	CLRF       TRISD+0
;casa_playa.mbas,20 :: 		PORTD = 0X00
	CLRF       PORTD+0
;casa_playa.mbas,22 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;casa_playa.mbas,23 :: 		PORTE = 0X00
	CLRF       PORTE+0
;casa_playa.mbas,25 :: 		ANSEL = 0X01  ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;casa_playa.mbas,26 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;casa_playa.mbas,27 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;casa_playa.mbas,28 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
;casa_playa.mbas,29 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
;casa_playa.mbas,30 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;casa_playa.mbas,32 :: 		while(1)
L__main2:
;casa_playa.mbas,33 :: 		dato =  Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _DATO+0
	MOVF       R2+1, 0
	MOVWF      _DATO+1
;casa_playa.mbas,34 :: 		if dato>100 then
	MOVF       R2+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVF       R2+0, 0
	SUBLW      100
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L__main7
;casa_playa.mbas,35 :: 		CONTADOR = 1
	MOVLW      1
	MOVWF      _CONTADOR+0
L__main7:
;casa_playa.mbas,37 :: 		if CONTADOR=1 then
	MOVF       _CONTADOR+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;casa_playa.mbas,38 :: 		PORTB.RB0=0     'luz
	BCF        PORTB+0, 0
;casa_playa.mbas,39 :: 		Delay_ms(10000)
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
;casa_playa.mbas,40 :: 		PORTB.RB1=1      'radio
	BSF        PORTB+0, 1
;casa_playa.mbas,41 :: 		Delay_ms(20000)
	MOVLW      203
	MOVWF      R11+0
	MOVLW      236
	MOVWF      R12+0
	MOVLW      132
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
	NOP
;casa_playa.mbas,42 :: 		PORTB.RB1=0      'radio
	BCF        PORTB+0, 1
;casa_playa.mbas,43 :: 		Delay_ms(10000)
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
;casa_playa.mbas,44 :: 		PORTB.RB0=1       'luz
	BSF        PORTB+0, 0
;casa_playa.mbas,45 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main15:
	DECFSZ     R13+0, 1
	GOTO       L__main15
	DECFSZ     R12+0, 1
	GOTO       L__main15
	DECFSZ     R11+0, 1
	GOTO       L__main15
	NOP
	NOP
;casa_playa.mbas,46 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
L__main10:
;casa_playa.mbas,48 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
