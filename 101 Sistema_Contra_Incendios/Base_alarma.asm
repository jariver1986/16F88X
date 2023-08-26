
_main:

;Base_alarma.mbas,5 :: 		main:
;Base_alarma.mbas,6 :: 		OSCCON=0X75   'oscilador interno de 4 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;Base_alarma.mbas,8 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Base_alarma.mbas,9 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Base_alarma.mbas,12 :: 		TRISA = 0X00
	CLRF       TRISA+0
;Base_alarma.mbas,13 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Base_alarma.mbas,15 :: 		TRISB = 0X00
	CLRF       TRISB+0
;Base_alarma.mbas,16 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Base_alarma.mbas,18 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;Base_alarma.mbas,19 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Base_alarma.mbas,22 :: 		PORTD = 0x00
	CLRF       PORTD+0
;Base_alarma.mbas,23 :: 		TRISD = 0x00
	CLRF       TRISD+0
;Base_alarma.mbas,25 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;Base_alarma.mbas,26 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Base_alarma.mbas,28 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Base_alarma.mbas,29 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Base_alarma.mbas,30 :: 		dato=0
	CLRF       _dato+0
;Base_alarma.mbas,31 :: 		contador=0
	CLRF       _contador+0
;Base_alarma.mbas,32 :: 		UART1_Write_text("A")
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Base_alarma.mbas,33 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Base_alarma.mbas,35 :: 		while(1)
L__main2:
;Base_alarma.mbas,37 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;Base_alarma.mbas,38 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;Base_alarma.mbas,39 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main7:
;Base_alarma.mbas,41 :: 		if (dato="A") then
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;Base_alarma.mbas,42 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;Base_alarma.mbas,43 :: 		dato=0
	CLRF       _dato+0
;Base_alarma.mbas,45 :: 		PORTD.RD4=1
	BSF        PORTD+0, 4
;Base_alarma.mbas,46 :: 		Delay_ms(800)
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
	NOP
;Base_alarma.mbas,47 :: 		PORTD.RD4=0
	BCF        PORTD+0, 4
;Base_alarma.mbas,48 :: 		Delay_ms(800)
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
	NOP
;Base_alarma.mbas,49 :: 		PORTD.RD4=1
	BSF        PORTD+0, 4
;Base_alarma.mbas,50 :: 		Delay_ms(800)
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
	NOP
;Base_alarma.mbas,51 :: 		PORTD.RD4=0
	BCF        PORTD+0, 4
;Base_alarma.mbas,52 :: 		Delay_ms(1000)
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
;Base_alarma.mbas,54 :: 		PORTD.RD5=1
	BSF        PORTD+0, 5
;Base_alarma.mbas,55 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main16:
	DECFSZ     R13+0, 1
	GOTO       L__main16
	DECFSZ     R12+0, 1
	GOTO       L__main16
	DECFSZ     R11+0, 1
	GOTO       L__main16
	NOP
	NOP
;Base_alarma.mbas,56 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main17:
	DECFSZ     R13+0, 1
	GOTO       L__main17
	DECFSZ     R12+0, 1
	GOTO       L__main17
	DECFSZ     R11+0, 1
	GOTO       L__main17
	NOP
	NOP
;Base_alarma.mbas,58 :: 		PORTD.RD6=1
	BSF        PORTD+0, 6
;Base_alarma.mbas,59 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
	NOP
	NOP
;Base_alarma.mbas,60 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
	NOP
	NOP
L__main10:
;Base_alarma.mbas,63 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
