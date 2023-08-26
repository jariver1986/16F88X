
smartshoes_sonido:

;smartshoes.mbas,7 :: 		sub procedure sonido
;smartshoes.mbas,8 :: 		PORTA.RA0 = 1
	BSF        PORTA+0, 0
;smartshoes.mbas,9 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartshoes_sonido1:
	DECFSZ     R13+0, 1
	GOTO       L_smartshoes_sonido1
	DECFSZ     R12+0, 1
	GOTO       L_smartshoes_sonido1
	DECFSZ     R11+0, 1
	GOTO       L_smartshoes_sonido1
;smartshoes.mbas,10 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;smartshoes.mbas,11 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartshoes_sonido2:
	DECFSZ     R13+0, 1
	GOTO       L_smartshoes_sonido2
	DECFSZ     R12+0, 1
	GOTO       L_smartshoes_sonido2
	DECFSZ     R11+0, 1
	GOTO       L_smartshoes_sonido2
	RETURN
; end of smartshoes_sonido

smartshoes_sonidofin:

;smartshoes.mbas,14 :: 		sub procedure sonidofin
;smartshoes.mbas,15 :: 		PORTA.RA0 = 1
	BSF        PORTA+0, 0
;smartshoes.mbas,16 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_smartshoes_sonidofin4:
	DECFSZ     R13+0, 1
	GOTO       L_smartshoes_sonidofin4
	DECFSZ     R12+0, 1
	GOTO       L_smartshoes_sonidofin4
	DECFSZ     R11+0, 1
	GOTO       L_smartshoes_sonidofin4
	NOP
	NOP
;smartshoes.mbas,17 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;smartshoes.mbas,18 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_smartshoes_sonidofin5:
	DECFSZ     R13+0, 1
	GOTO       L_smartshoes_sonidofin5
	DECFSZ     R12+0, 1
	GOTO       L_smartshoes_sonidofin5
	DECFSZ     R11+0, 1
	GOTO       L_smartshoes_sonidofin5
	NOP
	NOP
	RETURN
; end of smartshoes_sonidofin

_main:

;smartshoes.mbas,21 :: 		main:
;smartshoes.mbas,22 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;smartshoes.mbas,23 :: 		PORTA  = 0X00
	CLRF       PORTA+0
;smartshoes.mbas,24 :: 		TRISA  = 0X00
	CLRF       TRISA+0
;smartshoes.mbas,25 :: 		PORTB  = 0X00
	CLRF       PORTB+0
;smartshoes.mbas,26 :: 		TRISB  = 0X00
	CLRF       TRISB+0
;smartshoes.mbas,27 :: 		PORTC  = 0X00
	CLRF       PORTC+0
;smartshoes.mbas,28 :: 		TRISC  = 0X00
	CLRF       TRISC+0
;smartshoes.mbas,29 :: 		PORTD  = 0X00
	CLRF       PORTD+0
;smartshoes.mbas,30 :: 		TRISD  = 0X03
	MOVLW      3
	MOVWF      TRISD+0
;smartshoes.mbas,31 :: 		ANSEL  = 0X00
	CLRF       ANSEL+0
;smartshoes.mbas,32 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;smartshoes.mbas,33 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;smartshoes.mbas,34 :: 		SONIDO
	CALL       smartshoes_sonido+0
;smartshoes.mbas,35 :: 		SONIDO
	CALL       smartshoes_sonido+0
;smartshoes.mbas,36 :: 		DATO=0
	CLRF       _DATO+0
;smartshoes.mbas,37 :: 		while true
L__main8:
;smartshoes.mbas,38 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;smartshoes.mbas,39 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main13:
;smartshoes.mbas,41 :: 		if DATO = "A" then
	MOVF       _DATO+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;smartshoes.mbas,42 :: 		SONIDO
	CALL       smartshoes_sonido+0
;smartshoes.mbas,43 :: 		SONIDO
	CALL       smartshoes_sonido+0
;smartshoes.mbas,44 :: 		SONIDO
	CALL       smartshoes_sonido+0
;smartshoes.mbas,45 :: 		DATO=0
	CLRF       _DATO+0
;smartshoes.mbas,46 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
L__main16:
;smartshoes.mbas,49 :: 		if PORTD.RD1=1 then
	BTFSS      PORTD+0, 1
	GOTO       L__main19
;smartshoes.mbas,50 :: 		while PORTD.RD1=1
L__main22:
	BTFSS      PORTD+0, 1
	GOTO       L__main23
;smartshoes.mbas,52 :: 		wend
	GOTO       L__main22
L__main23:
;smartshoes.mbas,53 :: 		INC(CONTADOR)
	INCF       _CONTADOR+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR+1, 1
L__main19:
;smartshoes.mbas,56 :: 		if CONTADOR=10 then
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      10
	XORWF      _CONTADOR+0, 0
L__main29:
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;smartshoes.mbas,57 :: 		SONIDOFIN
	CALL       smartshoes_sonidofin+0
;smartshoes.mbas,58 :: 		SONIDOFIN
	CALL       smartshoes_sonidofin+0
;smartshoes.mbas,59 :: 		SONIDOFIN
	CALL       smartshoes_sonidofin+0
;smartshoes.mbas,60 :: 		WordToStr(CONTADOR,TEXTO)
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;smartshoes.mbas,61 :: 		UART1_Write_Text("R")
	MOVLW      82
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;smartshoes.mbas,62 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
L__main27:
;smartshoes.mbas,64 :: 		wend
	GOTO       L__main8
	GOTO       $+0
; end of _main
