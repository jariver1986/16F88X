
_main:

;PROYECTO_I2C.mbas,3 :: 		main:
;PROYECTO_I2C.mbas,4 :: 		ANSEL  = 0               ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;PROYECTO_I2C.mbas,5 :: 		ANSELH = 0
	CLRF       ANSELH+0
;PROYECTO_I2C.mbas,6 :: 		PORTB = 0
	CLRF       PORTB+0
;PROYECTO_I2C.mbas,7 :: 		TRISB = 0                ' Configure PORTB as output
	CLRF       TRISB+0
;PROYECTO_I2C.mbas,9 :: 		I2C1_Init(100000)        ' initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;PROYECTO_I2C.mbas,10 :: 		I2C1_Start()             ' issue I2C start signal
	CALL       _I2C1_Start+0
;PROYECTO_I2C.mbas,11 :: 		I2C1_Wr(0xA2)            ' send byte via I2C (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,12 :: 		I2C1_Wr(2)               ' send byte (address of EEPROM location)
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,13 :: 		I2C1_Wr(0xAA)            ' send data (data to be written)
	MOVLW      170
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,14 :: 		I2C1_Stop()              ' issue I2C stop signal
	CALL       _I2C1_Stop+0
;PROYECTO_I2C.mbas,16 :: 		Delay_100ms()
	CALL       _Delay_100ms+0
;PROYECTO_I2C.mbas,18 :: 		I2C1_Start()             ' issue I2C start signal
	CALL       _I2C1_Start+0
;PROYECTO_I2C.mbas,19 :: 		I2C1_Wr(0xA2)            ' send byte via I2C  (device address + W)
	MOVLW      162
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,20 :: 		I2C1_Wr(2)               ' send byte (data address)
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,21 :: 		I2C1_Repeated_Start()    ' issue I2C signal repeated start
	CALL       _I2C1_Repeated_Start+0
;PROYECTO_I2C.mbas,22 :: 		I2C1_Wr(0xA3)            ' send byte (device address + R)
	MOVLW      163
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;PROYECTO_I2C.mbas,23 :: 		PORTB = I2C1_Rd(0)       ' Read the data (NO acknowledge)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;PROYECTO_I2C.mbas,24 :: 		I2C1_Stop()              ' issue I2C stop signal
	CALL       _I2C1_Stop+0
	GOTO       $+0
; end of _main
