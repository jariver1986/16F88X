
_main:

;casa_abierta.mbas,5 :: 		main:
;casa_abierta.mbas,6 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;casa_abierta.mbas,7 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;casa_abierta.mbas,8 :: 		PORTA  =  %00001100
	MOVLW      12
	MOVWF      PORTA+0
;casa_abierta.mbas,9 :: 		TRISA  =  %00010011
	MOVLW      19
	MOVWF      TRISA+0
;casa_abierta.mbas,10 :: 		PORTB  =  0
	CLRF       PORTB+0
;casa_abierta.mbas,11 :: 		TRISB  =  0
	CLRF       TRISB+0
;casa_abierta.mbas,12 :: 		PORTC  =  0
	CLRF       PORTC+0
;casa_abierta.mbas,13 :: 		TRISC  =  %00000001
	MOVLW      1
	MOVWF      TRISC+0
;casa_abierta.mbas,14 :: 		ANSEL =0
	CLRF       ANSEL+0
;casa_abierta.mbas,15 :: 		ANSELH = 0
	CLRF       ANSELH+0
;casa_abierta.mbas,16 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;casa_abierta.mbas,17 :: 		TURNO=0
	CLRF       _TURNO+0
;casa_abierta.mbas,18 :: 		WHILE (1)
L__main2:
;casa_abierta.mbas,19 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;casa_abierta.mbas,20 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	NOP
	NOP
;casa_abierta.mbas,21 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;casa_abierta.mbas,22 :: 		do
L__main7:
;casa_abierta.mbas,23 :: 		IF PORTC.RC0=1 THEN  'SE DETECTO EL PRIMER PULSO
	BTFSS      PORTC+0, 0
	GOTO       L__main13
;casa_abierta.mbas,24 :: 		TMR0=0
	CLRF       TMR0+0
;casa_abierta.mbas,25 :: 		TURNO=1
	MOVLW      1
	MOVWF      _TURNO+0
L__main13:
;casa_abierta.mbas,27 :: 		loop until(TURNO=1)
	MOVF       _TURNO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main10
	GOTO       L__main7
L__main10:
;casa_abierta.mbas,28 :: 		DO
L__main15:
;casa_abierta.mbas,29 :: 		IF PORTC.RC0= 0 THEN
	BTFSC      PORTC+0, 0
	GOTO       L__main21
;casa_abierta.mbas,30 :: 		TIEMPO = TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;casa_abierta.mbas,31 :: 		TURNO=0
	CLRF       _TURNO+0
L__main21:
;casa_abierta.mbas,33 :: 		LOOP UNTIL(TURNO=0)
	MOVF       _TURNO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main18
	GOTO       L__main15
L__main18:
;casa_abierta.mbas,34 :: 		DISTANCIA = (TIEMPO*128)/58    'FACTOR DE CONVERSION
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
L__main47:
	BTFSC      STATUS+0, 2
	GOTO       L__main48
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main47
L__main48:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;casa_abierta.mbas,35 :: 		WordToStr(DISTANCIA,TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;casa_abierta.mbas,36 :: 		UART1_Write_Text(" DISTANCIA = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
;casa_abierta.mbas,37 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;casa_abierta.mbas,38 :: 		UART1_Write_Text(" cm  ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
;casa_abierta.mbas,39 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,40 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,41 :: 		if DISTANCIA < 100 then
	MOVLW      0
	SUBWF      _DISTANCIA+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      100
	SUBWF      _DISTANCIA+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L__main24
;casa_abierta.mbas,42 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,43 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main26:
	DECFSZ     R13+0, 1
	GOTO       L__main26
	DECFSZ     R12+0, 1
	GOTO       L__main26
	DECFSZ     R11+0, 1
	GOTO       L__main26
	NOP
;casa_abierta.mbas,44 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,45 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main27:
	DECFSZ     R13+0, 1
	GOTO       L__main27
	DECFSZ     R12+0, 1
	GOTO       L__main27
	DECFSZ     R11+0, 1
	GOTO       L__main27
	NOP
;casa_abierta.mbas,46 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,47 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main28:
	DECFSZ     R13+0, 1
	GOTO       L__main28
	DECFSZ     R12+0, 1
	GOTO       L__main28
	DECFSZ     R11+0, 1
	GOTO       L__main28
	NOP
;casa_abierta.mbas,48 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,49 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	DECFSZ     R11+0, 1
	GOTO       L__main29
	NOP
;casa_abierta.mbas,50 :: 		Delay_ms(3000)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main30:
	DECFSZ     R13+0, 1
	GOTO       L__main30
	DECFSZ     R12+0, 1
	GOTO       L__main30
	DECFSZ     R11+0, 1
	GOTO       L__main30
	NOP
	NOP
L__main24:
;casa_abierta.mbas,52 :: 		if PORTA.RA0 = 0 then
	BTFSC      PORTA+0, 0
	GOTO       L__main32
;casa_abierta.mbas,53 :: 		UART1_Write_Text(" PIE DERECHO FUERA TRAYECTORIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;casa_abierta.mbas,54 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,55 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,56 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;casa_abierta.mbas,57 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,58 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main34:
	DECFSZ     R13+0, 1
	GOTO       L__main34
	DECFSZ     R12+0, 1
	GOTO       L__main34
	DECFSZ     R11+0, 1
	GOTO       L__main34
	NOP
;casa_abierta.mbas,59 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,60 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	DECFSZ     R11+0, 1
	GOTO       L__main35
	NOP
;casa_abierta.mbas,61 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,62 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main36:
	DECFSZ     R13+0, 1
	GOTO       L__main36
	DECFSZ     R12+0, 1
	GOTO       L__main36
	DECFSZ     R11+0, 1
	GOTO       L__main36
	NOP
;casa_abierta.mbas,63 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,64 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main37:
	DECFSZ     R13+0, 1
	GOTO       L__main37
	DECFSZ     R12+0, 1
	GOTO       L__main37
	DECFSZ     R11+0, 1
	GOTO       L__main37
	NOP
;casa_abierta.mbas,65 :: 		Delay_ms(3000)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main38:
	DECFSZ     R13+0, 1
	GOTO       L__main38
	DECFSZ     R12+0, 1
	GOTO       L__main38
	DECFSZ     R11+0, 1
	GOTO       L__main38
	NOP
	NOP
	GOTO       L__main33
;casa_abierta.mbas,66 :: 		ELSE
L__main32:
;casa_abierta.mbas,67 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;casa_abierta.mbas,68 :: 		end iF
L__main33:
;casa_abierta.mbas,69 :: 		if PORTA.RA4 = 0 then
	BTFSC      PORTA+0, 4
	GOTO       L__main40
;casa_abierta.mbas,70 :: 		UART1_Write_Text(" PIE IZQUIERDO FUERA TRAYECTORIA ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;casa_abierta.mbas,71 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,72 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;casa_abierta.mbas,73 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;casa_abierta.mbas,74 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,75 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main42:
	DECFSZ     R13+0, 1
	GOTO       L__main42
	DECFSZ     R12+0, 1
	GOTO       L__main42
	DECFSZ     R11+0, 1
	GOTO       L__main42
	NOP
;casa_abierta.mbas,76 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,77 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main43:
	DECFSZ     R13+0, 1
	GOTO       L__main43
	DECFSZ     R12+0, 1
	GOTO       L__main43
	DECFSZ     R11+0, 1
	GOTO       L__main43
	NOP
;casa_abierta.mbas,78 :: 		PORTB = 0XFF
	MOVLW      255
	MOVWF      PORTB+0
;casa_abierta.mbas,79 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	DECFSZ     R11+0, 1
	GOTO       L__main44
	NOP
;casa_abierta.mbas,80 :: 		PORTB = 0X00
	CLRF       PORTB+0
;casa_abierta.mbas,81 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	DECFSZ     R11+0, 1
	GOTO       L__main45
	NOP
;casa_abierta.mbas,82 :: 		Delay_ms(3000)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	DECFSZ     R11+0, 1
	GOTO       L__main46
	NOP
	NOP
	GOTO       L__main41
;casa_abierta.mbas,83 :: 		ELSE
L__main40:
;casa_abierta.mbas,84 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;casa_abierta.mbas,85 :: 		end if
L__main41:
;casa_abierta.mbas,86 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;casa_abierta.mbas,89 :: 		WEND
	GOTO       L__main2
	GOTO       $+0
; end of _main
