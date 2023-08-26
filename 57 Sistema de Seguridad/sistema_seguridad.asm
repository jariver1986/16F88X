
_main:

;sistema_seguridad.mbas,7 :: 		main:
;sistema_seguridad.mbas,9 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;sistema_seguridad.mbas,11 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;sistema_seguridad.mbas,13 :: 		TRISA = 0X00 ' porta.5 como entrada digital
	CLRF       TRISA+0
;sistema_seguridad.mbas,14 :: 		PORTA = 0X00
	CLRF       PORTA+0
;sistema_seguridad.mbas,16 :: 		TRISB = 0X01 ' porta.5 como entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;sistema_seguridad.mbas,17 :: 		PORTB = 0X00
	CLRF       PORTB+0
;sistema_seguridad.mbas,19 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;sistema_seguridad.mbas,20 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;sistema_seguridad.mbas,21 :: 		TRISC=0X03
	MOVLW      3
	MOVWF      TRISC+0
;sistema_seguridad.mbas,22 :: 		PORTC=0X00
	CLRF       PORTC+0
;sistema_seguridad.mbas,23 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
	NOP
;sistema_seguridad.mbas,24 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sistema_seguridad.mbas,25 :: 		bandera=0
	CLRF       _bandera+0
;sistema_seguridad.mbas,27 :: 		while (TRUE)
L__main3:
;sistema_seguridad.mbas,28 :: 		if (PORTC.RC0=0) THEN
	BTFSC      PORTC+0, 0
	GOTO       L__main8
;sistema_seguridad.mbas,29 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_seguridad.mbas,30 :: 		UART1_Write(0x31)
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema_seguridad.mbas,31 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;sistema_seguridad.mbas,33 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_seguridad.mbas,34 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_seguridad.mbas,35 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_seguridad.mbas,36 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_seguridad.mbas,37 :: 		PORTB=0X00
	CLRF       PORTB+0
;sistema_seguridad.mbas,38 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	GOTO       L__main9
;sistema_seguridad.mbas,39 :: 		else
L__main8:
;sistema_seguridad.mbas,41 :: 		end if
L__main9:
;sistema_seguridad.mbas,42 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
