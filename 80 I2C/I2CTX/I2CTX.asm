
_main:

;I2CTX.mbas,5 :: 		main:
;I2CTX.mbas,6 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;I2CTX.mbas,8 :: 		ANSEL  = 0               ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;I2CTX.mbas,9 :: 		ANSELH = 0
	CLRF       ANSELH+0
;I2CTX.mbas,10 :: 		PORTA = 0
	CLRF       PORTA+0
;I2CTX.mbas,11 :: 		TRISA = 0
	CLRF       TRISA+0
;I2CTX.mbas,12 :: 		PORTB = 0
	CLRF       PORTB+0
;I2CTX.mbas,13 :: 		TRISB = 0
	CLRF       TRISB+0
;I2CTX.mbas,14 :: 		PORTC = 0
	CLRF       PORTC+0
;I2CTX.mbas,15 :: 		TRISC = 0
	CLRF       TRISC+0
;I2CTX.mbas,16 :: 		I2C1_Init(100000)        ' initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2CTX.mbas,17 :: 		I2C1_Start()             ' issue I2C start signal
	CALL       _I2C1_Start+0
;I2CTX.mbas,19 :: 		while 1
L__main2:
;I2CTX.mbas,21 :: 		I2C1_Wr("H")
	MOVLW      72
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2CTX.mbas,22 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
	NOP
;I2CTX.mbas,23 :: 		I2C1_Wr("O")
	MOVLW      79
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2CTX.mbas,24 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
	NOP
;I2CTX.mbas,25 :: 		I2C1_Wr("L")
	MOVLW      76
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2CTX.mbas,26 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
	NOP
	NOP
;I2CTX.mbas,27 :: 		I2C1_Wr("A")
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2CTX.mbas,28 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	DECFSZ     R11+0, 1
	GOTO       L__main9
	NOP
	NOP
;I2CTX.mbas,29 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
