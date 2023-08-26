
_main:

;sensor_humo.mbas,7 :: 		main:
;sensor_humo.mbas,8 :: 		OSCCON=0X75   'oscilador interno de 4 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;sensor_humo.mbas,12 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;sensor_humo.mbas,13 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sensor_humo.mbas,17 :: 		TRISA = 0X00
	CLRF       TRISA+0
;sensor_humo.mbas,18 :: 		PORTA = 0X00
	CLRF       PORTA+0
;sensor_humo.mbas,22 :: 		TRISB = 0X00
	CLRF       TRISB+0
;sensor_humo.mbas,23 :: 		PORTB = 0X00
	CLRF       PORTB+0
;sensor_humo.mbas,26 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;sensor_humo.mbas,27 :: 		PORTC = 0X00
	CLRF       PORTC+0
;sensor_humo.mbas,31 :: 		PORTD = 0x00
	CLRF       PORTD+0
;sensor_humo.mbas,32 :: 		TRISD = 0xFF
	MOVLW      255
	MOVWF      TRISD+0
;sensor_humo.mbas,35 :: 		TRISE = 0X00
	CLRF       TRISE+0
;sensor_humo.mbas,36 :: 		PORTE = 0X00
	CLRF       PORTE+0
;sensor_humo.mbas,38 :: 		ANSEL  = 0X00
	CLRF       ANSEL+0
;sensor_humo.mbas,39 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;sensor_humo.mbas,40 :: 		dato=0
	CLRF       _dato+0
;sensor_humo.mbas,41 :: 		contador=0
	CLRF       _contador+0
;sensor_humo.mbas,43 :: 		while(1)
L__main2:
;sensor_humo.mbas,44 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;sensor_humo.mbas,45 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;sensor_humo.mbas,46 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;sensor_humo.mbas,47 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main7:
;sensor_humo.mbas,50 :: 		if (dato="A") then
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;sensor_humo.mbas,51 :: 		PORTB=0X00
	CLRF       PORTB+0
;sensor_humo.mbas,52 :: 		dato=0
	CLRF       _dato+0
L__main10:
;sensor_humo.mbas,55 :: 		if (PORTD.RD4=1) and (contador=0) then
	BTFSC      PORTD+0, 4
	GOTO       L__main15
	BCF        114, 0
	GOTO       L__main16
L__main15:
	BSF        114, 0
L__main16:
	MOVF       _contador+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main13
;sensor_humo.mbas,56 :: 		contador=1
	MOVLW      1
	MOVWF      _contador+0
;sensor_humo.mbas,57 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;sensor_humo.mbas,58 :: 		UART1_Write_text("A")
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor_humo.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,60 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,61 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,62 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,63 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,64 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_humo.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main13:
;sensor_humo.mbas,69 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
