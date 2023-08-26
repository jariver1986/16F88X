
no_videntes_botoneras_TECLADO:

;no_videntes_botoneras.mbas,4 :: 		sub procedure TECLADO()
;no_videntes_botoneras.mbas,5 :: 		KP=0
	CLRF       _KP+0
;no_videntes_botoneras.mbas,6 :: 		PORTA=%00000110
	MOVLW      6
	MOVWF      PORTA+0
;no_videntes_botoneras.mbas,7 :: 		if PORTB.0=0 then
	BTFSC      PORTB+0, 0
	GOTO       L_no_videntes_botoneras_TECLADO2
;no_videntes_botoneras.mbas,8 :: 		while(PORTB.0=0) wend
L_no_videntes_botoneras_TECLADO5:
	BTFSC      PORTB+0, 0
	GOTO       L_no_videntes_botoneras_TECLADO6
	GOTO       L_no_videntes_botoneras_TECLADO5
L_no_videntes_botoneras_TECLADO6:
;no_videntes_botoneras.mbas,9 :: 		KP= 0X31
	MOVLW      49
	MOVWF      _KP+0
L_no_videntes_botoneras_TECLADO2:
;no_videntes_botoneras.mbas,12 :: 		if KP=0 then
	MOVF       _KP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_no_videntes_botoneras_TECLADO10
;no_videntes_botoneras.mbas,13 :: 		PORTA=%00000101
	MOVLW      5
	MOVWF      PORTA+0
;no_videntes_botoneras.mbas,14 :: 		if PORTB.1=0 then
	BTFSC      PORTB+0, 1
	GOTO       L_no_videntes_botoneras_TECLADO13
;no_videntes_botoneras.mbas,15 :: 		while(PORTB.1=0) wend
L_no_videntes_botoneras_TECLADO16:
	BTFSC      PORTB+0, 1
	GOTO       L_no_videntes_botoneras_TECLADO17
	GOTO       L_no_videntes_botoneras_TECLADO16
L_no_videntes_botoneras_TECLADO17:
;no_videntes_botoneras.mbas,16 :: 		KP= 0X32
	MOVLW      50
	MOVWF      _KP+0
L_no_videntes_botoneras_TECLADO13:
;no_videntes_botoneras.mbas,17 :: 		end if
	GOTO       L_no_videntes_botoneras_TECLADO11
;no_videntes_botoneras.mbas,18 :: 		ELSE
L_no_videntes_botoneras_TECLADO10:
;no_videntes_botoneras.mbas,19 :: 		RETURN
	RETURN
;no_videntes_botoneras.mbas,20 :: 		END IF
L_no_videntes_botoneras_TECLADO11:
;no_videntes_botoneras.mbas,21 :: 		if KP=0 then
	MOVF       _KP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_no_videntes_botoneras_TECLADO21
;no_videntes_botoneras.mbas,22 :: 		PORTA=%00000011
	MOVLW      3
	MOVWF      PORTA+0
;no_videntes_botoneras.mbas,23 :: 		if PORTB.2=0 then
	BTFSC      PORTB+0, 2
	GOTO       L_no_videntes_botoneras_TECLADO24
;no_videntes_botoneras.mbas,24 :: 		while(PORTB.2=0) wend
L_no_videntes_botoneras_TECLADO27:
	BTFSC      PORTB+0, 2
	GOTO       L_no_videntes_botoneras_TECLADO28
	GOTO       L_no_videntes_botoneras_TECLADO27
L_no_videntes_botoneras_TECLADO28:
;no_videntes_botoneras.mbas,25 :: 		KP= 0X33
	MOVLW      51
	MOVWF      _KP+0
L_no_videntes_botoneras_TECLADO24:
;no_videntes_botoneras.mbas,26 :: 		end if
	GOTO       L_no_videntes_botoneras_TECLADO22
;no_videntes_botoneras.mbas,27 :: 		ELSE
L_no_videntes_botoneras_TECLADO21:
;no_videntes_botoneras.mbas,28 :: 		RETURN
	RETURN
;no_videntes_botoneras.mbas,29 :: 		end if
L_no_videntes_botoneras_TECLADO22:
	RETURN
; end of no_videntes_botoneras_TECLADO

_main:

;no_videntes_botoneras.mbas,32 :: 		main:
;no_videntes_botoneras.mbas,33 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;no_videntes_botoneras.mbas,34 :: 		PORTA = 0
	CLRF       PORTA+0
;no_videntes_botoneras.mbas,35 :: 		PORTB = 0
	CLRF       PORTB+0
;no_videntes_botoneras.mbas,36 :: 		PORTC = 0
	CLRF       PORTC+0
;no_videntes_botoneras.mbas,37 :: 		TRISA = 0
	CLRF       TRISA+0
;no_videntes_botoneras.mbas,38 :: 		TRISB = %00000111
	MOVLW      7
	MOVWF      TRISB+0
;no_videntes_botoneras.mbas,39 :: 		TRISC = 0
	CLRF       TRISC+0
;no_videntes_botoneras.mbas,40 :: 		ANSEL = 0
	CLRF       ANSEL+0
;no_videntes_botoneras.mbas,41 :: 		ANSELH= 0
	CLRF       ANSELH+0
;no_videntes_botoneras.mbas,42 :: 		OPTION_REG = 0X07
	MOVLW      7
	MOVWF      OPTION_REG+0
;no_videntes_botoneras.mbas,43 :: 		WPUB = %00000111
	MOVLW      7
	MOVWF      WPUB+0
;no_videntes_botoneras.mbas,44 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;no_videntes_botoneras.mbas,46 :: 		while (1)
L__main33:
;no_videntes_botoneras.mbas,47 :: 		TECLADO()
	CALL       no_videntes_botoneras_TECLADO+0
;no_videntes_botoneras.mbas,48 :: 		IF KP>0 THEN
	MOVF       _KP+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L__main38
;no_videntes_botoneras.mbas,49 :: 		if (KP = 0x31)  then
	MOVF       _KP+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main41
;no_videntes_botoneras.mbas,50 :: 		UART1_Write_Text("F")
	MOVLW      70
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes_botoneras.mbas,51 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,52 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main43:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main43
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main43
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main43
;no_videntes_botoneras.mbas,53 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,54 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main44
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main44
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main44
L__main41:
;no_videntes_botoneras.mbas,56 :: 		if (KP = 0x32)  then
	MOVF       _KP+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main46
;no_videntes_botoneras.mbas,57 :: 		UART1_Write_Text("D")
	MOVLW      68
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes_botoneras.mbas,58 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,59 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main48
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main48
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main48
;no_videntes_botoneras.mbas,60 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,61 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main49:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main49
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main49
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main49
;no_videntes_botoneras.mbas,62 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,63 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main50
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main50
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main50
;no_videntes_botoneras.mbas,64 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,65 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main51
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main51
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main51
L__main46:
;no_videntes_botoneras.mbas,67 :: 		if (KP = 0x33)  then
	MOVF       _KP+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;no_videntes_botoneras.mbas,68 :: 		UART1_Write_Text("I")
	MOVLW      73
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;no_videntes_botoneras.mbas,69 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,70 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main55:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main55
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main55
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main55
;no_videntes_botoneras.mbas,71 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,72 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main56:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main56
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main56
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main56
;no_videntes_botoneras.mbas,73 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,74 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main57:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main57
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main57
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main57
;no_videntes_botoneras.mbas,75 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,76 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main58:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main58
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main58
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main58
;no_videntes_botoneras.mbas,77 :: 		PORTA.RA3=1
	BSF        PORTA+0, 3
;no_videntes_botoneras.mbas,78 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main59:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main59
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main59
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main59
;no_videntes_botoneras.mbas,79 :: 		PORTA.RA3=0
	BCF        PORTA+0, 3
;no_videntes_botoneras.mbas,80 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main60:
	DECFSZ     R13+0, _main_Local_Text+0
	GOTO       L__main60
	DECFSZ     R12+0, _main_Local_Text+0
	GOTO       L__main60
	DECFSZ     R11+0, _main_Local_Text+0
	GOTO       L__main60
L__main53:
;no_videntes_botoneras.mbas,82 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;no_videntes_botoneras.mbas,83 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;no_videntes_botoneras.mbas,84 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main38:
;no_videntes_botoneras.mbas,86 :: 		wend
	GOTO       L__main33
	GOTO       $+0
; end of _main
