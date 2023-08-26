
_main:

;Onda_triangular.mbas,12 :: 		main:
;Onda_triangular.mbas,13 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;Onda_triangular.mbas,14 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;Onda_triangular.mbas,16 :: 		TRISA = %10000011
	MOVLW      131
	MOVWF      TRISA+0
;Onda_triangular.mbas,17 :: 		PORTA = %00000000
	CLRF       PORTA+0
;Onda_triangular.mbas,20 :: 		TRISB = %00000000  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	CLRF       TRISB+0
;Onda_triangular.mbas,21 :: 		PORTB = %00000000
	CLRF       PORTB+0
;Onda_triangular.mbas,24 :: 		TRISC = %00000000
	CLRF       TRISC+0
;Onda_triangular.mbas,25 :: 		PORTC = %00000000
	CLRF       PORTC+0
;Onda_triangular.mbas,27 :: 		TRISE = 0x08
	MOVLW      8
	MOVWF      TRISE+0
;Onda_triangular.mbas,28 :: 		PORTE = %00000000
	CLRF       PORTE+0
;Onda_triangular.mbas,30 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;Onda_triangular.mbas,31 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;Onda_triangular.mbas,33 :: 		VAR=200
	MOVLW      200
	MOVWF      _VAR+0
	CLRF       _VAR+1
;Onda_triangular.mbas,34 :: 		WHILE(1)
L__main2:
;Onda_triangular.mbas,36 :: 		IF PORTE.RE3 = 0 then
	BTFSC      PORTE+0, 3
	GOTO       L__main7
;Onda_triangular.mbas,37 :: 		VAR = VAR + 1
	INCF       _VAR+0, 1
	BTFSC      STATUS+0, 2
	INCF       _VAR+1, 1
;Onda_triangular.mbas,38 :: 		PORTB=VAR
	MOVF       _VAR+0, 0
	MOVWF      PORTB+0
;Onda_triangular.mbas,40 :: 		Delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	NOP
	GOTO       L__main8
;Onda_triangular.mbas,42 :: 		ELSE
L__main7:
;Onda_triangular.mbas,43 :: 		VAR=0
	CLRF       _VAR+0
	CLRF       _VAR+1
;Onda_triangular.mbas,44 :: 		PORTB=VAR
	CLRF       PORTB+0
;Onda_triangular.mbas,45 :: 		end if
L__main8:
;Onda_triangular.mbas,47 :: 		if VAR = 255 then
	MOVLW      0
	XORWF      _VAR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      255
	XORWF      _VAR+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L__main11
;Onda_triangular.mbas,48 :: 		VAR = 0
	CLRF       _VAR+0
	CLRF       _VAR+1
L__main11:
;Onda_triangular.mbas,53 :: 		WEND
	GOTO       L__main2
	GOTO       $+0
; end of _main
