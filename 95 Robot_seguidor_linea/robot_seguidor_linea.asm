
robot_seguidor_linea_ADELANTE:

;robot_seguidor_linea.mbas,15 :: 		sub procedure ADELANTE()
;robot_seguidor_linea.mbas,16 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_seguidor_linea.mbas,17 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_seguidor_linea.mbas,18 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_seguidor_linea.mbas,19 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_seguidor_linea.mbas,20 :: 		PWM1_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,21 :: 		PWM2_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_ADELANTE

robot_seguidor_linea_PARAR:

;robot_seguidor_linea.mbas,23 :: 		sub procedure PARAR()
;robot_seguidor_linea.mbas,24 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_seguidor_linea.mbas,25 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_seguidor_linea.mbas,26 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_seguidor_linea.mbas,27 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_seguidor_linea.mbas,28 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,29 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_PARAR

robot_seguidor_linea_ADELANTE_DERECHA:

;robot_seguidor_linea.mbas,31 :: 		sub procedure ADELANTE_DERECHA()
;robot_seguidor_linea.mbas,32 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_seguidor_linea.mbas,33 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_seguidor_linea.mbas,34 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_seguidor_linea.mbas,35 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_seguidor_linea.mbas,36 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,37 :: 		PWM2_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_ADELANTE_DERECHA

robot_seguidor_linea_ADELANTE_IZQUIERDA:

;robot_seguidor_linea.mbas,39 :: 		sub procedure ADELANTE_IZQUIERDA()
;robot_seguidor_linea.mbas,40 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_seguidor_linea.mbas,41 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_seguidor_linea.mbas,42 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_seguidor_linea.mbas,43 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_seguidor_linea.mbas,44 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,45 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_ADELANTE_IZQUIERDA

robot_seguidor_linea_GIRO_IZQUIERDA:

;robot_seguidor_linea.mbas,47 :: 		sub procedure GIRO_IZQUIERDA()
;robot_seguidor_linea.mbas,48 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_seguidor_linea.mbas,49 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_seguidor_linea.mbas,50 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_seguidor_linea.mbas,51 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_seguidor_linea.mbas,52 :: 		PWM1_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,53 :: 		PWM2_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_GIRO_IZQUIERDA

robot_seguidor_linea_GIRO_DERECHA:

;robot_seguidor_linea.mbas,55 :: 		sub procedure GIRO_DERECHA()
;robot_seguidor_linea.mbas,56 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_seguidor_linea.mbas,57 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_seguidor_linea.mbas,58 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_seguidor_linea.mbas,59 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_seguidor_linea.mbas,60 :: 		PWM1_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_seguidor_linea.mbas,61 :: 		PWM2_Set_Duty(velo)
	MOVF       _velo+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_seguidor_linea_GIRO_DERECHA

robot_seguidor_linea_ultrasonico1:

;robot_seguidor_linea.mbas,65 :: 		dim distan,tiempo as word
;robot_seguidor_linea.mbas,66 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robot_seguidor_linea.mbas,67 :: 		disparo1 = 1
	BSF        PORTC+0, 5
;robot_seguidor_linea.mbas,68 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robot_seguidor_linea_ultrasonico17:
	DECFSZ     R13+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico17
	NOP
;robot_seguidor_linea.mbas,69 :: 		disparo1 = 0
	BCF        PORTC+0, 5
;robot_seguidor_linea.mbas,70 :: 		DO
L_robot_seguidor_linea_ultrasonico18:
;robot_seguidor_linea.mbas,71 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 4
	GOTO       L_robot_seguidor_linea_ultrasonico114
;robot_seguidor_linea.mbas,72 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_seguidor_linea.mbas,73 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robot_seguidor_linea_ultrasonico114:
;robot_seguidor_linea.mbas,75 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico111
	GOTO       L_robot_seguidor_linea_ultrasonico18
L_robot_seguidor_linea_ultrasonico111:
;robot_seguidor_linea.mbas,76 :: 		DO
L_robot_seguidor_linea_ultrasonico116:
;robot_seguidor_linea.mbas,77 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 4
	GOTO       L_robot_seguidor_linea_ultrasonico122
;robot_seguidor_linea.mbas,78 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robot_seguidor_linea.mbas,79 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robot_seguidor_linea_ultrasonico122:
;robot_seguidor_linea.mbas,81 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_seguidor_linea_ultrasonico125
;robot_seguidor_linea.mbas,82 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robot_seguidor_linea_ultrasonico125:
;robot_seguidor_linea.mbas,84 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico119
	GOTO       L_robot_seguidor_linea_ultrasonico116
L_robot_seguidor_linea_ultrasonico119:
;robot_seguidor_linea.mbas,85 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_seguidor_linea_ultrasonico175:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico176
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_seguidor_linea_ultrasonico175
L_robot_seguidor_linea_ultrasonico176:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robot_seguidor_linea.mbas,86 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robot_seguidor_linea_ultrasonico127:
	DECFSZ     R13+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico127
	DECFSZ     R12+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico127
	NOP
;robot_seguidor_linea.mbas,87 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_seguidor_linea_ultrasonico1

robot_seguidor_linea_ultrasonico2:

;robot_seguidor_linea.mbas,91 :: 		dim distan,tiempo as word
;robot_seguidor_linea.mbas,92 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;robot_seguidor_linea.mbas,93 :: 		disparo2 = 1
	BSF        PORTC+0, 0
;robot_seguidor_linea.mbas,94 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robot_seguidor_linea_ultrasonico229:
	DECFSZ     R13+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico229
	NOP
;robot_seguidor_linea.mbas,95 :: 		disparo2 = 0
	BCF        PORTC+0, 0
;robot_seguidor_linea.mbas,96 :: 		DO
L_robot_seguidor_linea_ultrasonico230:
;robot_seguidor_linea.mbas,97 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTC+0, 3
	GOTO       L_robot_seguidor_linea_ultrasonico236
;robot_seguidor_linea.mbas,98 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_seguidor_linea.mbas,99 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_robot_seguidor_linea_ultrasonico236:
;robot_seguidor_linea.mbas,101 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico233
	GOTO       L_robot_seguidor_linea_ultrasonico230
L_robot_seguidor_linea_ultrasonico233:
;robot_seguidor_linea.mbas,102 :: 		DO
L_robot_seguidor_linea_ultrasonico238:
;robot_seguidor_linea.mbas,103 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTC+0, 3
	GOTO       L_robot_seguidor_linea_ultrasonico244
;robot_seguidor_linea.mbas,104 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robot_seguidor_linea.mbas,105 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_robot_seguidor_linea_ultrasonico244:
;robot_seguidor_linea.mbas,107 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_seguidor_linea_ultrasonico247
;robot_seguidor_linea.mbas,108 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_robot_seguidor_linea_ultrasonico247:
;robot_seguidor_linea.mbas,110 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico241
	GOTO       L_robot_seguidor_linea_ultrasonico238
L_robot_seguidor_linea_ultrasonico241:
;robot_seguidor_linea.mbas,111 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_seguidor_linea_ultrasonico277:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_seguidor_linea_ultrasonico278
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_seguidor_linea_ultrasonico277
L_robot_seguidor_linea_ultrasonico278:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robot_seguidor_linea.mbas,112 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robot_seguidor_linea_ultrasonico249:
	DECFSZ     R13+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico249
	DECFSZ     R12+0, 1
	GOTO       L_robot_seguidor_linea_ultrasonico249
	NOP
;robot_seguidor_linea.mbas,113 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_seguidor_linea_ultrasonico2

_main:

;robot_seguidor_linea.mbas,115 :: 		main:
;robot_seguidor_linea.mbas,116 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_seguidor_linea.mbas,117 :: 		OSCCON  = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;robot_seguidor_linea.mbas,118 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robot_seguidor_linea.mbas,119 :: 		TRISA   = %11000011
	MOVLW      195
	MOVWF      TRISA+0
;robot_seguidor_linea.mbas,120 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robot_seguidor_linea.mbas,121 :: 		TRISB   = %00000000
	CLRF       TRISB+0
;robot_seguidor_linea.mbas,122 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;robot_seguidor_linea.mbas,123 :: 		TRISC   = %10011000
	MOVLW      152
	MOVWF      TRISC+0
;robot_seguidor_linea.mbas,124 :: 		PORTE   = %00000000
	CLRF       PORTE+0
;robot_seguidor_linea.mbas,125 :: 		TRISE   = %10001000
	MOVLW      136
	MOVWF      TRISE+0
;robot_seguidor_linea.mbas,126 :: 		ANSEL   = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;robot_seguidor_linea.mbas,127 :: 		ANSELH  = %00010000
	MOVLW      16
	MOVWF      ANSELH+0
;robot_seguidor_linea.mbas,128 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_seguidor_linea.mbas,129 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_seguidor_linea.mbas,130 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_seguidor_linea.mbas,131 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_seguidor_linea.mbas,132 :: 		contador=2
	MOVLW      2
	MOVWF      _contador+0
;robot_seguidor_linea.mbas,133 :: 		while 1
L__main52:
;robot_seguidor_linea.mbas,157 :: 		velo = Adc_Read(0>>2)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _velo+0
;robot_seguidor_linea.mbas,158 :: 		if contador = 2 then
	MOVF       _contador+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main57
;robot_seguidor_linea.mbas,159 :: 		sensores=(S2*2)+(S1*1)
	CLRF       R2+0
	BTFSC      PORTA+0, 7
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	CLRF       R0+0
	BTFSC      PORTA+0, 6
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;robot_seguidor_linea.mbas,161 :: 		case 0' S2 S1 = 0 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
;robot_seguidor_linea.mbas,162 :: 		PARAR
	CALL       robot_seguidor_linea_PARAR+0
;robot_seguidor_linea.mbas,163 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main59
L__main62:
;robot_seguidor_linea.mbas,164 :: 		case 1' S2 S1 = 0 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main65
;robot_seguidor_linea.mbas,165 :: 		GIRO_IZQUIERDA
	CALL       robot_seguidor_linea_GIRO_IZQUIERDA+0
;robot_seguidor_linea.mbas,166 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main59
L__main65:
;robot_seguidor_linea.mbas,167 :: 		case 2' S2 S1 = 1 0
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main68
;robot_seguidor_linea.mbas,168 :: 		GIRO_DERECHA
	CALL       robot_seguidor_linea_GIRO_DERECHA+0
;robot_seguidor_linea.mbas,169 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main59
L__main68:
;robot_seguidor_linea.mbas,170 :: 		case 3' S2 S1 = 1 1
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main71
;robot_seguidor_linea.mbas,171 :: 		ADELANTE
	CALL       robot_seguidor_linea_ADELANTE+0
;robot_seguidor_linea.mbas,172 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main59
L__main71:
L__main59:
;robot_seguidor_linea.mbas,173 :: 		end select
L__main57:
;robot_seguidor_linea.mbas,176 :: 		if CONTADOR>=3 then
	MOVLW      3
	SUBWF      _contador+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main73
;robot_seguidor_linea.mbas,177 :: 		CONTADOR=0
	CLRF       _contador+0
L__main73:
;robot_seguidor_linea.mbas,179 :: 		wend
	GOTO       L__main52
	GOTO       $+0
; end of _main
