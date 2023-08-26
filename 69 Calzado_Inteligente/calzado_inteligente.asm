
calzado_inteligente_sensor2:

;calzado_inteligente.mbas,7 :: 		dim distancia,tiempo as word
;calzado_inteligente.mbas,8 :: 		turno = 0
	CLRF       sensor2_turno+0
;calzado_inteligente.mbas,9 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;calzado_inteligente.mbas,10 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_calzado_inteligente_sensor21:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_sensor21
	NOP
	NOP
;calzado_inteligente.mbas,11 :: 		PORTC.RC2 = 0
	BCF        PORTC+0, 2
;calzado_inteligente.mbas,12 :: 		DO
L_calzado_inteligente_sensor22:
;calzado_inteligente.mbas,13 :: 		IF( PORTC.RC3 = 1 )THEN
	BTFSS      PORTC+0, 3
	GOTO       L_calzado_inteligente_sensor28
;calzado_inteligente.mbas,14 :: 		TMR0 = 0
	CLRF       TMR0+0
;calzado_inteligente.mbas,15 :: 		turno = 1
	MOVLW      1
	MOVWF      sensor2_turno+0
L_calzado_inteligente_sensor28:
;calzado_inteligente.mbas,17 :: 		LOOP UNTIL( turno = 1 )
	MOVF       sensor2_turno+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor25
	GOTO       L_calzado_inteligente_sensor22
L_calzado_inteligente_sensor25:
;calzado_inteligente.mbas,18 :: 		DO
L_calzado_inteligente_sensor210:
;calzado_inteligente.mbas,19 :: 		IF( PORTC.RC3 = 0 )THEN
	BTFSC      PORTC+0, 3
	GOTO       L_calzado_inteligente_sensor216
;calzado_inteligente.mbas,20 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      sensor2_tiempo+0
	CLRF       sensor2_tiempo+1
;calzado_inteligente.mbas,21 :: 		turno = 0
	CLRF       sensor2_turno+0
L_calzado_inteligente_sensor216:
;calzado_inteligente.mbas,23 :: 		LOOP UNTIL( turno = 0 )
	MOVF       sensor2_turno+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor213
	GOTO       L_calzado_inteligente_sensor210
L_calzado_inteligente_sensor213:
;calzado_inteligente.mbas,24 :: 		distancia = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       sensor2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       sensor2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_calzado_inteligente_sensor256:
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor257
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_calzado_inteligente_sensor256
L_calzado_inteligente_sensor257:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      sensor2_distancia+0
	MOVF       R0+1, 0
	MOVWF      sensor2_distancia+1
;calzado_inteligente.mbas,25 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_calzado_inteligente_sensor218:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_sensor218
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_sensor218
	NOP
;calzado_inteligente.mbas,26 :: 		result = distancia
	MOVF       sensor2_distancia+0, 0
	MOVWF      sensor2_local_result+0
	MOVF       sensor2_distancia+1, 0
	MOVWF      sensor2_local_result+1
	MOVF       sensor2_local_result+0, 0
	MOVWF      R0+0
	MOVF       sensor2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of calzado_inteligente_sensor2

calzado_inteligente_sensor1:

;calzado_inteligente.mbas,30 :: 		dim distancia,tiempo as word
;calzado_inteligente.mbas,31 :: 		turno = 0
	CLRF       sensor1_turno+0
;calzado_inteligente.mbas,32 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;calzado_inteligente.mbas,33 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_calzado_inteligente_sensor120:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_sensor120
	NOP
	NOP
;calzado_inteligente.mbas,34 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;calzado_inteligente.mbas,35 :: 		DO
L_calzado_inteligente_sensor121:
;calzado_inteligente.mbas,36 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_calzado_inteligente_sensor127
;calzado_inteligente.mbas,37 :: 		TMR0 = 0
	CLRF       TMR0+0
;calzado_inteligente.mbas,38 :: 		turno = 1
	MOVLW      1
	MOVWF      sensor1_turno+0
L_calzado_inteligente_sensor127:
;calzado_inteligente.mbas,40 :: 		LOOP UNTIL( turno = 1 )
	MOVF       sensor1_turno+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor124
	GOTO       L_calzado_inteligente_sensor121
L_calzado_inteligente_sensor124:
;calzado_inteligente.mbas,41 :: 		DO
L_calzado_inteligente_sensor129:
;calzado_inteligente.mbas,42 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_calzado_inteligente_sensor135
;calzado_inteligente.mbas,43 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      sensor1_tiempo+0
	CLRF       sensor1_tiempo+1
;calzado_inteligente.mbas,44 :: 		turno = 0
	CLRF       sensor1_turno+0
L_calzado_inteligente_sensor135:
;calzado_inteligente.mbas,46 :: 		LOOP UNTIL( turno = 0 )
	MOVF       sensor1_turno+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor132
	GOTO       L_calzado_inteligente_sensor129
L_calzado_inteligente_sensor132:
;calzado_inteligente.mbas,47 :: 		distancia = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       sensor1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       sensor1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_calzado_inteligente_sensor158:
	BTFSC      STATUS+0, 2
	GOTO       L_calzado_inteligente_sensor159
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_calzado_inteligente_sensor158
L_calzado_inteligente_sensor159:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      sensor1_distancia+0
	MOVF       R0+1, 0
	MOVWF      sensor1_distancia+1
;calzado_inteligente.mbas,48 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_calzado_inteligente_sensor137:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_sensor137
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_sensor137
	NOP
;calzado_inteligente.mbas,49 :: 		result = distancia
	MOVF       sensor1_distancia+0, 0
	MOVWF      sensor1_local_result+0
	MOVF       sensor1_distancia+1, 0
	MOVWF      sensor1_local_result+1
	MOVF       sensor1_local_result+0, 0
	MOVWF      R0+0
	MOVF       sensor1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of calzado_inteligente_sensor1

calzado_inteligente_BUZZER:

;calzado_inteligente.mbas,51 :: 		sub procedure BUZZER
;calzado_inteligente.mbas,52 :: 		PORTA.RA0 = 1
	BSF        PORTA+0, 0
;calzado_inteligente.mbas,53 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_calzado_inteligente_BUZZER39:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_BUZZER39
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_BUZZER39
	DECFSZ     R11+0, 1
	GOTO       L_calzado_inteligente_BUZZER39
	NOP
;calzado_inteligente.mbas,54 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;calzado_inteligente.mbas,55 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_calzado_inteligente_BUZZER40:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_BUZZER40
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_BUZZER40
	DECFSZ     R11+0, 1
	GOTO       L_calzado_inteligente_BUZZER40
	NOP
;calzado_inteligente.mbas,56 :: 		PORTA.RA0 = 1
	BSF        PORTA+0, 0
;calzado_inteligente.mbas,57 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_calzado_inteligente_BUZZER41:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_BUZZER41
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_BUZZER41
	DECFSZ     R11+0, 1
	GOTO       L_calzado_inteligente_BUZZER41
	NOP
;calzado_inteligente.mbas,58 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;calzado_inteligente.mbas,59 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_calzado_inteligente_BUZZER42:
	DECFSZ     R13+0, 1
	GOTO       L_calzado_inteligente_BUZZER42
	DECFSZ     R12+0, 1
	GOTO       L_calzado_inteligente_BUZZER42
	DECFSZ     R11+0, 1
	GOTO       L_calzado_inteligente_BUZZER42
	NOP
	RETURN
; end of calzado_inteligente_BUZZER

_main:

;calzado_inteligente.mbas,62 :: 		main:
;calzado_inteligente.mbas,63 :: 		OPTION_REG =  6
	MOVLW      6
	MOVWF      OPTION_REG+0
;calzado_inteligente.mbas,64 :: 		OSCCON     =  0x65
	MOVLW      101
	MOVWF      OSCCON+0
;calzado_inteligente.mbas,65 :: 		PORTA      =  %00000110
	MOVLW      6
	MOVWF      PORTA+0
;calzado_inteligente.mbas,66 :: 		TRISA      =  0
	CLRF       TRISA+0
;calzado_inteligente.mbas,67 :: 		PORTB      =  0
	CLRF       PORTB+0
;calzado_inteligente.mbas,68 :: 		TRISB      =  %00000010
	MOVLW      2
	MOVWF      TRISB+0
;calzado_inteligente.mbas,69 :: 		PORTC      =  0
	CLRF       PORTC+0
;calzado_inteligente.mbas,70 :: 		TRISC      =  %10001010
	MOVLW      138
	MOVWF      TRISC+0
;calzado_inteligente.mbas,71 :: 		ANSEL      =0
	CLRF       ANSEL+0
;calzado_inteligente.mbas,72 :: 		ANSELH     = 0
	CLRF       ANSELH+0
;calzado_inteligente.mbas,74 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;calzado_inteligente.mbas,75 :: 		acumulador1 = 0
	CLRF       _acumulador1+0
	CLRF       _acumulador1+1
;calzado_inteligente.mbas,76 :: 		acumulador2 = 0
	CLRF       _acumulador2+0
	CLRF       _acumulador2+1
;calzado_inteligente.mbas,77 :: 		contador = 0
	CLRF       _contador+0
;calzado_inteligente.mbas,78 :: 		limite   = 50
	MOVLW      50
	MOVWF      _limite+0
;calzado_inteligente.mbas,79 :: 		comando=0
	CLRF       _comando+0
;calzado_inteligente.mbas,80 :: 		WHILE (1)
L__main45:
;calzado_inteligente.mbas,82 :: 		DISTANCIA_DERECHA = SENSOR1
	CALL       calzado_inteligente_sensor1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA_DERECHA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA_DERECHA+1
;calzado_inteligente.mbas,83 :: 		DISTANCIA_IZQUIERDA = SENSOR2
	CALL       calzado_inteligente_sensor2+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA_IZQUIERDA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA_IZQUIERDA+1
;calzado_inteligente.mbas,86 :: 		if DISTANCIA_DERECHA < 50 then
	MOVLW      0
	SUBWF      _DISTANCIA_DERECHA+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      50
	SUBWF      _DISTANCIA_DERECHA+0, 0
L__main60:
	BTFSC      STATUS+0, 0
	GOTO       L__main50
;calzado_inteligente.mbas,87 :: 		WordToStr(DISTANCIA_DERECHA,texto)
	MOVF       _DISTANCIA_DERECHA+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA_DERECHA+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;calzado_inteligente.mbas,88 :: 		UART1_Write_Text(" ATENCION OBJETO POR EL COSTADO DERECHO A ")
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
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;calzado_inteligente.mbas,89 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;calzado_inteligente.mbas,90 :: 		UART1_Write_Text(" CENTIMETROS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;calzado_inteligente.mbas,91 :: 		BUZZER
	CALL       calzado_inteligente_BUZZER+0
;calzado_inteligente.mbas,92 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;calzado_inteligente.mbas,93 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;calzado_inteligente.mbas,94 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main50:
;calzado_inteligente.mbas,96 :: 		if DISTANCIA_IZQUIERDA < 50 then
	MOVLW      0
	SUBWF      _DISTANCIA_IZQUIERDA+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      50
	SUBWF      _DISTANCIA_IZQUIERDA+0, 0
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L__main53
;calzado_inteligente.mbas,97 :: 		WordToStr(DISTANCIA_IZQUIERDA,texto)
	MOVF       _DISTANCIA_IZQUIERDA+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA_IZQUIERDA+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;calzado_inteligente.mbas,98 :: 		UART1_Write_Text(" ATENCIÓN OBJETO POR EL COSTADO IZQUIERDO A ")
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
	MOVLW      211
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
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;calzado_inteligente.mbas,99 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;calzado_inteligente.mbas,100 :: 		UART1_Write_Text(" CENTIMETROS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;calzado_inteligente.mbas,101 :: 		BUZZER
	CALL       calzado_inteligente_BUZZER+0
;calzado_inteligente.mbas,102 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;calzado_inteligente.mbas,103 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;calzado_inteligente.mbas,104 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main53:
;calzado_inteligente.mbas,106 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main55:
	DECFSZ     R13+0, 1
	GOTO       L__main55
	DECFSZ     R12+0, 1
	GOTO       L__main55
	DECFSZ     R11+0, 1
	GOTO       L__main55
	NOP
	NOP
;calzado_inteligente.mbas,107 :: 		WEND
	GOTO       L__main45
	GOTO       $+0
; end of _main
