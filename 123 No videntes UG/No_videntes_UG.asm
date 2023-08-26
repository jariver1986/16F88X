
No_videntes_UG_ultrasonico1:

;No_videntes_UG.mbas,11 :: 		dim distan,tiempo as word
;No_videntes_UG.mbas,12 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;No_videntes_UG.mbas,14 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;No_videntes_UG.mbas,15 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_No_videntes_UG_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_No_videntes_UG_ultrasonico11
	NOP
	NOP
;No_videntes_UG.mbas,16 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;No_videntes_UG.mbas,18 :: 		DO
L_No_videntes_UG_ultrasonico12:
;No_videntes_UG.mbas,19 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_No_videntes_UG_ultrasonico18
;No_videntes_UG.mbas,20 :: 		TMR0 = 0
	CLRF       TMR0+0
;No_videntes_UG.mbas,21 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_No_videntes_UG_ultrasonico18:
;No_videntes_UG.mbas,23 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_No_videntes_UG_ultrasonico15
	GOTO       L_No_videntes_UG_ultrasonico12
L_No_videntes_UG_ultrasonico15:
;No_videntes_UG.mbas,25 :: 		DO
L_No_videntes_UG_ultrasonico110:
;No_videntes_UG.mbas,26 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_No_videntes_UG_ultrasonico116
;No_videntes_UG.mbas,27 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;No_videntes_UG.mbas,28 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_No_videntes_UG_ultrasonico116:
;No_videntes_UG.mbas,33 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_No_videntes_UG_ultrasonico113
	GOTO       L_No_videntes_UG_ultrasonico110
L_No_videntes_UG_ultrasonico113:
;No_videntes_UG.mbas,35 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_No_videntes_UG_ultrasonico139:
	BTFSC      STATUS+0, 2
	GOTO       L_No_videntes_UG_ultrasonico140
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_No_videntes_UG_ultrasonico139
L_No_videntes_UG_ultrasonico140:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;No_videntes_UG.mbas,36 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_No_videntes_UG_ultrasonico118:
	DECFSZ     R13+0, 1
	GOTO       L_No_videntes_UG_ultrasonico118
	DECFSZ     R12+0, 1
	GOTO       L_No_videntes_UG_ultrasonico118
	NOP
;No_videntes_UG.mbas,37 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of No_videntes_UG_ultrasonico1

_main:

;No_videntes_UG.mbas,41 :: 		main:
;No_videntes_UG.mbas,42 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;No_videntes_UG.mbas,43 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;No_videntes_UG.mbas,44 :: 		PORTA  =  0
	CLRF       PORTA+0
;No_videntes_UG.mbas,45 :: 		TRISA  =  %00010100
	MOVLW      20
	MOVWF      TRISA+0
;No_videntes_UG.mbas,46 :: 		PORTB  =  0
	CLRF       PORTB+0
;No_videntes_UG.mbas,47 :: 		TRISB  =  %00101010
	MOVLW      42
	MOVWF      TRISB+0
;No_videntes_UG.mbas,48 :: 		PORTC  =  0
	CLRF       PORTC+0
;No_videntes_UG.mbas,49 :: 		TRISC  =  %10000010
	MOVLW      130
	MOVWF      TRISC+0
;No_videntes_UG.mbas,50 :: 		PORTD  =  0
	CLRF       PORTD+0
;No_videntes_UG.mbas,51 :: 		TRISD  =  %00000000
	CLRF       TRISD+0
;No_videntes_UG.mbas,52 :: 		ANSEL =0
	CLRF       ANSEL+0
;No_videntes_UG.mbas,53 :: 		ANSELH = 0
	CLRF       ANSELH+0
;No_videntes_UG.mbas,54 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;No_videntes_UG.mbas,55 :: 		TURNO=0
	CLRF       _TURNO+0
;No_videntes_UG.mbas,56 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;No_videntes_UG.mbas,57 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
;No_videntes_UG.mbas,58 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;No_videntes_UG.mbas,59 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	DECFSZ     R11+0, 1
	GOTO       L__main21
	NOP
;No_videntes_UG.mbas,60 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;No_videntes_UG.mbas,61 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main22:
	DECFSZ     R13+0, 1
	GOTO       L__main22
	DECFSZ     R12+0, 1
	GOTO       L__main22
	DECFSZ     R11+0, 1
	GOTO       L__main22
	NOP
;No_videntes_UG.mbas,62 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;No_videntes_UG.mbas,63 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main23:
	DECFSZ     R13+0, 1
	GOTO       L__main23
	DECFSZ     R12+0, 1
	GOTO       L__main23
	DECFSZ     R11+0, 1
	GOTO       L__main23
	NOP
;No_videntes_UG.mbas,64 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;No_videntes_UG.mbas,66 :: 		UART1_Write_Text("SALUDOS A TODOS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;No_videntes_UG.mbas,67 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main25:
	DECFSZ     R13+0, 1
	GOTO       L__main25
	DECFSZ     R12+0, 1
	GOTO       L__main25
	DECFSZ     R11+0, 1
	GOTO       L__main25
	NOP
	NOP
;No_videntes_UG.mbas,68 :: 		distancia1 = ultrasonico1()
	CALL       No_videntes_UG_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;No_videntes_UG.mbas,69 :: 		distancia1 = ultrasonico1()
	CALL       No_videntes_UG_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;No_videntes_UG.mbas,71 :: 		while 1
L__main27:
;No_videntes_UG.mbas,72 :: 		distancia1 = ultrasonico1()
	CALL       No_videntes_UG_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;No_videntes_UG.mbas,73 :: 		if DISTANCIA1 <150 then
	MOVLW      0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      150
	SUBWF      R0+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L__main32
;No_videntes_UG.mbas,74 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;No_videntes_UG.mbas,75 :: 		Delay_ms(200)
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
;No_videntes_UG.mbas,76 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;No_videntes_UG.mbas,77 :: 		Delay_ms(200)
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
;No_videntes_UG.mbas,78 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;No_videntes_UG.mbas,79 :: 		Delay_ms(200)
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
;No_videntes_UG.mbas,80 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;No_videntes_UG.mbas,81 :: 		Delay_ms(200)
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
;No_videntes_UG.mbas,82 :: 		WordToStr(DISTANCIA1,TEXTO)
	MOVF       _DISTANCIA1+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA1+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;No_videntes_UG.mbas,83 :: 		UART1_Write_Text(" ATENCION OBJETO A ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
;No_videntes_UG.mbas,84 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;No_videntes_UG.mbas,85 :: 		UART1_Write_Text(" centimetros")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;No_videntes_UG.mbas,86 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
L__main32:
;No_videntes_UG.mbas,88 :: 		WEND
	GOTO       L__main27
	GOTO       $+0
; end of _main
