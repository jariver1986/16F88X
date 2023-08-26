
prueba_sr04_PULSO:

;prueba_sr04.mbas,10 :: 		SUB PROCEDURE PULSO()
;prueba_sr04.mbas,11 :: 		PORTC.3=1
	BSF        PORTC+0, 3
;prueba_sr04.mbas,12 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_prueba_sr04_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_sr04_PULSO1
	NOP
	NOP
;prueba_sr04.mbas,13 :: 		PORTC.3=0
	BCF        PORTC+0, 3
	RETURN
; end of prueba_sr04_PULSO

_main:

;prueba_sr04.mbas,17 :: 		main:
;prueba_sr04.mbas,18 :: 		OPTION_REG=%00000110'
	MOVLW      6
	MOVWF      OPTION_REG+0
;prueba_sr04.mbas,19 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;prueba_sr04.mbas,20 :: 		TRISB = %00000001
	MOVLW      1
	MOVWF      TRISB+0
;prueba_sr04.mbas,21 :: 		PORTB = %00000000
	CLRF       PORTB+0
;prueba_sr04.mbas,22 :: 		TRISC = %10000001
	MOVLW      129
	MOVWF      TRISC+0
;prueba_sr04.mbas,23 :: 		PORTC = %00000000
	CLRF       PORTC+0
;prueba_sr04.mbas,24 :: 		TRISE = %00000000
	CLRF       TRISE+0
;prueba_sr04.mbas,25 :: 		PORTE = %00000000
	CLRF       PORTE+0
;prueba_sr04.mbas,26 :: 		TRISA = %00000000
	CLRF       TRISA+0
;prueba_sr04.mbas,27 :: 		PORTA = %00000000
	CLRF       PORTA+0
;prueba_sr04.mbas,28 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;prueba_sr04.mbas,29 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;prueba_sr04.mbas,30 :: 		FLANCO=0
	CLRF       _FLANCO+0
;prueba_sr04.mbas,31 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;prueba_sr04.mbas,33 :: 		DISTANCIA = 0
	CLRF       _DISTANCIA+0
	CLRF       _DISTANCIA+1
;prueba_sr04.mbas,37 :: 		WHILE(1)
L__main4:
;prueba_sr04.mbas,38 :: 		PULSO()
	CALL       prueba_sr04_PULSO+0
;prueba_sr04.mbas,39 :: 		DO
L__main8:
;prueba_sr04.mbas,40 :: 		IF(PORTC.0=1)THEN
	BTFSS      PORTC+0, 0
	GOTO       L__main14
;prueba_sr04.mbas,41 :: 		TMR0=0
	CLRF       TMR0+0
;prueba_sr04.mbas,42 :: 		FLANCO=1
	MOVLW      1
	MOVWF      _FLANCO+0
L__main14:
;prueba_sr04.mbas,44 :: 		LOOP UNTIL(FLANCO=1)
	MOVF       _FLANCO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main11
	GOTO       L__main8
L__main11:
;prueba_sr04.mbas,45 :: 		DO
L__main16:
;prueba_sr04.mbas,46 :: 		IF(PORTC.0=0)THEN
	BTFSC      PORTC+0, 0
	GOTO       L__main22
;prueba_sr04.mbas,47 :: 		TIEMPO=TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;prueba_sr04.mbas,48 :: 		FLANCO=0
	CLRF       _FLANCO+0
L__main22:
;prueba_sr04.mbas,50 :: 		LOOP UNTIL(FLANCO=0)
	MOVF       _FLANCO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main19
	GOTO       L__main16
L__main19:
;prueba_sr04.mbas,51 :: 		DISTANCIA=258-(TIEMPO*128)/58 'DISTANCIA EN cm
	MOVF       _TIEMPO+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVLW      7
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main25:
	BTFSC      STATUS+0, 2
	GOTO       L__main26
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main25
L__main26:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	SUBLW      2
	MOVWF      R0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;prueba_sr04.mbas,52 :: 		WordToStr(DISTANCIA, TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;prueba_sr04.mbas,53 :: 		UART1_Write_Text("DISTANCIA = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_sr04.mbas,54 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_sr04.mbas,55 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_sr04.mbas,56 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_sr04.mbas,57 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main24:
	DECFSZ     R13+0, 1
	GOTO       L__main24
	DECFSZ     R12+0, 1
	GOTO       L__main24
	DECFSZ     R11+0, 1
	GOTO       L__main24
	NOP
	NOP
;prueba_sr04.mbas,59 :: 		WEND
	GOTO       L__main4
	GOTO       $+0
; end of _main
