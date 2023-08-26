
codigo_fuente_ultrasonico1:

;codigo_fuente.mbas,15 :: 		dim flanco as byte
;codigo_fuente.mbas,16 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;codigo_fuente.mbas,17 :: 		tiempo=0
	CLRF       _tiempo+0
	CLRF       _tiempo+1
;codigo_fuente.mbas,18 :: 		disparo1 = 1
	BSF        PORTB+0, 0
;codigo_fuente.mbas,19 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_codigo_fuente_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_codigo_fuente_ultrasonico11
	NOP
;codigo_fuente.mbas,20 :: 		disparo1 = 0
	BCF        PORTB+0, 0
;codigo_fuente.mbas,21 :: 		DO
L_codigo_fuente_ultrasonico12:
;codigo_fuente.mbas,22 :: 		IF( eco1 = 1 ) THEN
	BTFSS      PORTB+0, 1
	GOTO       L_codigo_fuente_ultrasonico18
;codigo_fuente.mbas,23 :: 		TMR0 = 0
	CLRF       TMR0+0
;codigo_fuente.mbas,24 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_codigo_fuente_ultrasonico18:
;codigo_fuente.mbas,26 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_codigo_fuente_ultrasonico15
	GOTO       L_codigo_fuente_ultrasonico12
L_codigo_fuente_ultrasonico15:
;codigo_fuente.mbas,27 :: 		DO
L_codigo_fuente_ultrasonico110:
;codigo_fuente.mbas,28 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_codigo_fuente_ultrasonico116
;codigo_fuente.mbas,29 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      _tiempo+0
	CLRF       _tiempo+1
;codigo_fuente.mbas,30 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_codigo_fuente_ultrasonico116:
;codigo_fuente.mbas,32 :: 		if(TMR0>202)THEN
	MOVF       TMR0+0, 0
	SUBLW      202
	BTFSC      STATUS+0, 0
	GOTO       L_codigo_fuente_ultrasonico119
;codigo_fuente.mbas,33 :: 		tiempo=204
	MOVLW      204
	MOVWF      _tiempo+0
	CLRF       _tiempo+1
L_codigo_fuente_ultrasonico119:
;codigo_fuente.mbas,35 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_codigo_fuente_ultrasonico113
	GOTO       L_codigo_fuente_ultrasonico110
L_codigo_fuente_ultrasonico113:
;codigo_fuente.mbas,36 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       _tiempo+0, 0
	MOVWF      R0+0
	MOVF       _tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_codigo_fuente_ultrasonico130:
	BTFSC      STATUS+0, 2
	GOTO       L_codigo_fuente_ultrasonico131
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_codigo_fuente_ultrasonico130
L_codigo_fuente_ultrasonico131:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _distan+0
	MOVF       R0+1, 0
	MOVWF      _distan+1
;codigo_fuente.mbas,37 :: 		Delay_ms (5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_codigo_fuente_ultrasonico121:
	DECFSZ     R13+0, 1
	GOTO       L_codigo_fuente_ultrasonico121
	DECFSZ     R12+0, 1
	GOTO       L_codigo_fuente_ultrasonico121
;codigo_fuente.mbas,38 :: 		result = distan
	MOVF       _distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       _distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of codigo_fuente_ultrasonico1

codigo_fuente_pwm1_set_data:

;codigo_fuente.mbas,42 :: 		dim tmp2 as integer
;codigo_fuente.mbas,43 :: 		tmp2 = (pwmduty/4)
	MOVF       FARG_pwm1_set_data_pwmduty+0, 0
	MOVWF      R0+0
	MOVF       FARG_pwm1_set_data_pwmduty+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
;codigo_fuente.mbas,44 :: 		CCPR1L = tmp2
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;codigo_fuente.mbas,45 :: 		tmp2 = (pwmduty and 0x0003)
	MOVLW      3
	ANDWF      FARG_pwm1_set_data_pwmduty+0, 0
	MOVWF      R2+0
	MOVF       FARG_pwm1_set_data_pwmduty+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
;codigo_fuente.mbas,47 :: 		CCP1CON.CCP1X = ((tmp>>1) and 0x01)
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 1
	BTFSC      R0+0, 0
	GOTO       L_codigo_fuente_pwm1_set_data32
	BCF        CCP1CON+0, 5
	GOTO       L_codigo_fuente_pwm1_set_data33
L_codigo_fuente_pwm1_set_data32:
	BSF        CCP1CON+0, 5
L_codigo_fuente_pwm1_set_data33:
;codigo_fuente.mbas,48 :: 		CCP1CON.CCP1Y = (tmp and 0x01)
	MOVLW      1
	ANDWF      R2+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L_codigo_fuente_pwm1_set_data34
	BCF        CCP1CON+0, 4
	GOTO       L_codigo_fuente_pwm1_set_data35
L_codigo_fuente_pwm1_set_data34:
	BSF        CCP1CON+0, 4
L_codigo_fuente_pwm1_set_data35:
	RETURN
; end of codigo_fuente_pwm1_set_data

_main:

;codigo_fuente.mbas,50 :: 		main:
;codigo_fuente.mbas,51 :: 		CMCON = 0X07  'comparadores desabilitados y activada pines de I/O
	MOVLW      7
	MOVWF      CMCON+0
;codigo_fuente.mbas,52 :: 		TRISA = 0X00
	CLRF       TRISA+0
;codigo_fuente.mbas,53 :: 		PORTA = 0X00
	CLRF       PORTA+0
;codigo_fuente.mbas,54 :: 		TRISB = 0X06
	MOVLW      6
	MOVWF      TRISB+0
;codigo_fuente.mbas,55 :: 		PORTB = 0X00
	CLRF       PORTB+0
;codigo_fuente.mbas,57 :: 		PCON       = 0X0B  '0X0B  'OSC A 4 MHz
	MOVLW      11
	MOVWF      PCON+0
;codigo_fuente.mbas,58 :: 		OPTION_REG = 0x86  'PREESCALADOR A 128
	MOVLW      134
	MOVWF      OPTION_REG+0
;codigo_fuente.mbas,59 :: 		PR2        = 0XF9
	MOVLW      249
	MOVWF      PR2+0
;codigo_fuente.mbas,60 :: 		T2CON      = 0X05  'TIMER 2 ON PREESCALADOR 4
	MOVLW      5
	MOVWF      T2CON+0
;codigo_fuente.mbas,61 :: 		CCPR1L     = 0X00
	CLRF       CCPR1L+0
;codigo_fuente.mbas,62 :: 		CCP1CON    = 0X0C
	MOVLW      12
	MOVWF      CCP1CON+0
;codigo_fuente.mbas,64 :: 		oldstate_1 =0
	CLRF       _oldstate_1+0
;codigo_fuente.mbas,65 :: 		control_voltaje = 0
	CLRF       _control_voltaje+0
	CLRF       _control_voltaje+1
	CLRF       _control_voltaje+2
	CLRF       _control_voltaje+3
;codigo_fuente.mbas,66 :: 		flanco=0
	CLRF       _flanco+0
;codigo_fuente.mbas,67 :: 		distancia=0
	CLRF       _distancia+0
	CLRF       _distancia+1
	CLRF       _distancia+2
	CLRF       _distancia+3
;codigo_fuente.mbas,69 :: 		while TRUE
L__main25:
;codigo_fuente.mbas,70 :: 		PORTA.RA0= PORTA.0 XOR 1
	MOVLW      1
	XORWF      PORTA+0, 1
;codigo_fuente.mbas,71 :: 		distancia=  ultrasonico1()
	CALL       codigo_fuente_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia+0
	MOVF       R0+1, 0
	MOVWF      _distancia+1
	CLRF       _distancia+2
	CLRF       _distancia+3
;codigo_fuente.mbas,72 :: 		control_voltaje = ((distancia*1023)/450)
	MOVF       _distancia+0, 0
	MOVWF      R0+0
	MOVF       _distancia+1, 0
	MOVWF      R0+1
	MOVF       _distancia+2, 0
	MOVWF      R0+2
	MOVF       _distancia+3, 0
	MOVWF      R0+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      194
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _control_voltaje+0
	MOVF       R0+1, 0
	MOVWF      _control_voltaje+1
	MOVF       R0+2, 0
	MOVWF      _control_voltaje+2
	MOVF       R0+3, 0
	MOVWF      _control_voltaje+3
;codigo_fuente.mbas,73 :: 		pwm1_set_data(control_voltaje )
	MOVF       R0+0, 0
	MOVWF      FARG_pwm1_set_data_pwmduty+0
	MOVF       R0+1, 0
	MOVWF      FARG_pwm1_set_data_pwmduty+1
	CALL       codigo_fuente_pwm1_set_data+0
;codigo_fuente.mbas,74 :: 		Delay_ms(50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	NOP
;codigo_fuente.mbas,75 :: 		wend
	GOTO       L__main25
	GOTO       $+0
; end of _main
