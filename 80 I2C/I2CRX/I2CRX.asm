
_main:

;I2CRX.mbas,3 :: 		main:
;I2CRX.mbas,4 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;I2CRX.mbas,6 :: 		ANSEL  = 0               ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;I2CRX.mbas,7 :: 		ANSELH = 0
	CLRF       ANSELH+0
;I2CRX.mbas,8 :: 		PORTA = 0
	CLRF       PORTA+0
;I2CRX.mbas,9 :: 		TRISA = 0
	CLRF       TRISA+0
;I2CRX.mbas,10 :: 		PORTB = 0
	CLRF       PORTB+0
;I2CRX.mbas,11 :: 		TRISB = 0
	CLRF       TRISB+0
;I2CRX.mbas,12 :: 		PORTC = 0
	CLRF       PORTC+0
;I2CRX.mbas,13 :: 		TRISC = 0
	CLRF       TRISC+0
;I2CRX.mbas,14 :: 		I2C1_Init(100000)        ' initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2CRX.mbas,15 :: 		I2C1_Start()             ' issue I2C start signal
	CALL       _I2C1_Start+0
;I2CRX.mbas,16 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;I2CRX.mbas,18 :: 		while 1
L__main2:
;I2CRX.mbas,19 :: 		DATO = I2C1_Rd(0)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
;I2CRX.mbas,23 :: 		UART1_Write(DATO)
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;I2CRX.mbas,25 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
;I2CRX.mbas,26 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
