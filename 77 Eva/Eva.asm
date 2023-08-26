
_main:

;Eva.mbas,7 :: 		main:
;Eva.mbas,8 :: 		OSCCON = 0X75 ' RELOJ INTERNO
	MOVLW      117
	MOVWF      OSCCON+0
;Eva.mbas,9 :: 		PORTA  = 0
	CLRF       PORTA+0
;Eva.mbas,10 :: 		TRISA  = 0 'SENSOR DE LUZ Y POTENCIOMETRO
	CLRF       TRISA+0
;Eva.mbas,11 :: 		PORTB  = 0
	CLRF       PORTB+0
;Eva.mbas,12 :: 		TRISB  = 0
	CLRF       TRISB+0
;Eva.mbas,13 :: 		PORTC  = 0
	CLRF       PORTC+0
;Eva.mbas,14 :: 		TRISC  = %00000001 'RC0 SENSOR DE COLOR
	MOVLW      1
	MOVWF      TRISC+0
;Eva.mbas,15 :: 		ANSEL  = 0
	CLRF       ANSEL+0
;Eva.mbas,16 :: 		ANSELH = 0
	CLRF       ANSELH+0
;Eva.mbas,17 :: 		UART1_Init(9600) ' VELOCIDAD DE TRANSMISION
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Eva.mbas,18 :: 		while (1)
L__main2:
;Eva.mbas,20 :: 		IF (Ow_Reset(PORTC,0))=0 THEN
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      R0+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;Eva.mbas,21 :: 		Ow_Write(PORTC,0,0XCC)  'ATENCION
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Eva.mbas,22 :: 		Ow_Write(PORTC,0,0X44)  'PREPARAR TEMPERATURA
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Eva.mbas,23 :: 		Delay_us(120)
	MOVLW      79
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	NOP
	NOP
;Eva.mbas,24 :: 		Ow_Reset(PORTC,0) ' INICIO NUEVA COMUNICACION
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;Eva.mbas,25 :: 		Ow_Write(portc,0,0xCC)    'ATENCION
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Eva.mbas,26 :: 		Ow_Write(portc,0,0xBE)    ' PETICION DE TEMPERATURA
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;Eva.mbas,27 :: 		T1 = Ow_Read(PORTC,0) ' PARTE BAJA
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _T1+0
;Eva.mbas,28 :: 		T2 = Ow_Read(PORTC,0)  'PARTE ALTA
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _T2+0
;Eva.mbas,29 :: 		TEMP = (T2<<8) OR T1
	MOVF       R0+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       _T1+0, 0
	IORWF      R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _TEMP+0
	MOVF       R0+1, 0
	MOVWF      _TEMP+1
;Eva.mbas,30 :: 		TEMPC =  (TEMP AND $0FF0 )>>4
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	ANDLW      15
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _TEMPC+0
	MOVF       R0+1, 0
	MOVWF      _TEMPC+1
;Eva.mbas,31 :: 		WordToStr(TEMPC,TEMPERATURA)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEMPERATURA+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Eva.mbas,32 :: 		UART1_Write_Text(TEMPERATURA)
	MOVLW      _TEMPERATURA+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Eva.mbas,33 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;Eva.mbas,34 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
	NOP
;Eva.mbas,35 :: 		PORTB = 0X00
	CLRF       PORTB+0
L__main7:
;Eva.mbas,40 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
