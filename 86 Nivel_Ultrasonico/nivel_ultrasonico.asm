
nivel_ultrasonico_PULSO:

;nivel_ultrasonico.mbas,8 :: 		SUB PROCEDURE PULSO()
;nivel_ultrasonico.mbas,9 :: 		PORTC.3=1
	BSF        PORTC+0, 3
;nivel_ultrasonico.mbas,10 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_nivel_ultrasonico_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_nivel_ultrasonico_PULSO1
	NOP
	NOP
;nivel_ultrasonico.mbas,11 :: 		PORTC.3=0
	BCF        PORTC+0, 3
	RETURN
; end of nivel_ultrasonico_PULSO

_main:

;nivel_ultrasonico.mbas,14 :: 		main:
;nivel_ultrasonico.mbas,16 :: 		OPTION_REG=%00000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      6
	MOVWF      OPTION_REG+0
;nivel_ultrasonico.mbas,19 :: 		OSCCON = 0X65 ' Oscilador interno de 4mhz
	MOVLW      101
	MOVWF      OSCCON+0
;nivel_ultrasonico.mbas,21 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;nivel_ultrasonico.mbas,22 :: 		PORTB = 0X00
	CLRF       PORTB+0
;nivel_ultrasonico.mbas,24 :: 		TRISC = 0XF1 ' PORTC salidas
	MOVLW      241
	MOVWF      TRISC+0
;nivel_ultrasonico.mbas,25 :: 		PORTC = 0X00
	CLRF       PORTC+0
;nivel_ultrasonico.mbas,27 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;nivel_ultrasonico.mbas,28 :: 		PORTE = 0X00
	CLRF       PORTE+0
;nivel_ultrasonico.mbas,29 :: 		TRISA = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;nivel_ultrasonico.mbas,30 :: 		PORTA = %00001100
	MOVLW      12
	MOVWF      PORTA+0
;nivel_ultrasonico.mbas,32 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;nivel_ultrasonico.mbas,33 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;nivel_ultrasonico.mbas,34 :: 		FLANCO=0
	CLRF       _FLANCO+0
;nivel_ultrasonico.mbas,35 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;nivel_ultrasonico.mbas,36 :: 		DISTANCIA = 0
	CLRF       _DISTANCIA+0
	CLRF       _DISTANCIA+1
;nivel_ultrasonico.mbas,37 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
;nivel_ultrasonico.mbas,38 :: 		i=0
	CLRF       _i+0
;nivel_ultrasonico.mbas,39 :: 		WHILE(1)
L__main4:
;nivel_ultrasonico.mbas,40 :: 		PULSO()
	CALL       nivel_ultrasonico_PULSO+0
;nivel_ultrasonico.mbas,41 :: 		DO
L__main8:
;nivel_ultrasonico.mbas,42 :: 		IF(PORTC.0=1)THEN'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSS      PORTC+0, 0
	GOTO       L__main14
;nivel_ultrasonico.mbas,43 :: 		TMR0=0
	CLRF       TMR0+0
;nivel_ultrasonico.mbas,44 :: 		FLANCO=1
	MOVLW      1
	MOVWF      _FLANCO+0
L__main14:
;nivel_ultrasonico.mbas,46 :: 		LOOP UNTIL(FLANCO=1)
	MOVF       _FLANCO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main11
	GOTO       L__main8
L__main11:
;nivel_ultrasonico.mbas,47 :: 		DO
L__main16:
;nivel_ultrasonico.mbas,48 :: 		IF(PORTC.0=0)THEN 'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSC      PORTC+0, 0
	GOTO       L__main22
;nivel_ultrasonico.mbas,49 :: 		TIEMPO=TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;nivel_ultrasonico.mbas,50 :: 		FLANCO=0
	CLRF       _FLANCO+0
L__main22:
;nivel_ultrasonico.mbas,52 :: 		LOOP UNTIL(FLANCO=0)
	MOVF       _FLANCO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main19
	GOTO       L__main16
L__main19:
;nivel_ultrasonico.mbas,53 :: 		DISTANCIA=(TIEMPO*128)/58 'DISTANCIA EN cm
	MOVF       _TIEMPO+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVLW      7
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main30:
	BTFSC      STATUS+0, 2
	GOTO       L__main31
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main30
L__main31:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;nivel_ultrasonico.mbas,54 :: 		PORTB = DISTANCIA
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;nivel_ultrasonico.mbas,55 :: 		if PORTA.RA0=1 then
	BTFSS      PORTA+0, 0
	GOTO       L__main25
;nivel_ultrasonico.mbas,56 :: 		PORTA.RA2=0
	BCF        PORTA+0, 2
	GOTO       L__main26
;nivel_ultrasonico.mbas,57 :: 		ELSE
L__main25:
;nivel_ultrasonico.mbas,58 :: 		PORTA.RA2=1
	BSF        PORTA+0, 2
;nivel_ultrasonico.mbas,59 :: 		end if
L__main26:
;nivel_ultrasonico.mbas,60 :: 		if PORTA.RA1=1 then
	BTFSS      PORTA+0, 1
	GOTO       L__main28
;nivel_ultrasonico.mbas,61 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
	GOTO       L__main29
;nivel_ultrasonico.mbas,62 :: 		ELSE
L__main28:
;nivel_ultrasonico.mbas,63 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;nivel_ultrasonico.mbas,64 :: 		end if
L__main29:
;nivel_ultrasonico.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;nivel_ultrasonico.mbas,66 :: 		WEND
	GOTO       L__main4
	GOTO       $+0
; end of _main
