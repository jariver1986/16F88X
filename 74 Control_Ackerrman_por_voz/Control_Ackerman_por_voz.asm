
Control_Ackerman_por_voz_robot_adelante:

;Control_Ackerman_por_voz.mbas,7 :: 		sub procedure robot_adelante()
;Control_Ackerman_por_voz.mbas,9 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,10 :: 		PORTB.RB1 = 0
	BCF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,12 :: 		PORTB.RB2 = 1
	BSF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,13 :: 		PORTB.RB3 = 0
	BCF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,14 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,15 :: 		PWM2_Set_Duty(velocidad_motor2)
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_adelante

Control_Ackerman_por_voz_robot_atras:

;Control_Ackerman_por_voz.mbas,17 :: 		sub procedure robot_atras()
;Control_Ackerman_por_voz.mbas,19 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,20 :: 		PORTB.RB1 = 0
	BCF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,22 :: 		PORTB.RB2 = 0
	BCF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,23 :: 		PORTB.RB3 = 1
	BSF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,24 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,25 :: 		PWM2_Set_Duty(velocidad_motor2)
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_atras

Control_Ackerman_por_voz_robot_izquierda_adelante:

;Control_Ackerman_por_voz.mbas,27 :: 		sub procedure robot_izquierda_adelante()
;Control_Ackerman_por_voz.mbas,29 :: 		PORTB.RB0 = 1
	BSF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,30 :: 		PORTB.RB1 = 0
	BCF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,32 :: 		PORTB.RB2 = 1
	BSF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,33 :: 		PORTB.RB3 = 0
	BCF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,34 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,35 :: 		PWM2_Set_Duty(velocidad_motor2)
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_izquierda_adelante

Control_Ackerman_por_voz_robot_derecha_adelante:

;Control_Ackerman_por_voz.mbas,37 :: 		sub procedure robot_derecha_adelante()
;Control_Ackerman_por_voz.mbas,39 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,40 :: 		PORTB.RB1 = 1
	BSF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,42 :: 		PORTB.RB2 = 1
	BSF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,43 :: 		PORTB.RB3 = 0
	BCF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,44 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,45 :: 		PWM2_Set_Duty(velocidad_motor2)end sub
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_derecha_adelante

Control_Ackerman_por_voz_robot_parar:

;Control_Ackerman_por_voz.mbas,46 :: 		sub procedure robot_parar()
;Control_Ackerman_por_voz.mbas,48 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,49 :: 		PORTB.RB1 = 0
	BCF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,51 :: 		PORTB.RB2 = 0
	BCF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,52 :: 		PORTB.RB3 = 0
	BCF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,53 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,54 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_parar

Control_Ackerman_por_voz_robot_izquierda_atras:

;Control_Ackerman_por_voz.mbas,56 :: 		sub procedure robot_izquierda_atras()
;Control_Ackerman_por_voz.mbas,58 :: 		PORTB.RB0 = 1
	BSF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,59 :: 		PORTB.RB1 = 0
	BCF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,61 :: 		PORTB.RB2 = 0
	BCF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,62 :: 		PORTB.RB3 = 1
	BSF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,63 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,64 :: 		PWM2_Set_Duty(velocidad_motor2)
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_izquierda_atras

Control_Ackerman_por_voz_robot_derecha_atras:

;Control_Ackerman_por_voz.mbas,66 :: 		sub procedure robot_derecha_atras()
;Control_Ackerman_por_voz.mbas,68 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;Control_Ackerman_por_voz.mbas,69 :: 		PORTB.RB1 = 1
	BSF        PORTB+0, 1
;Control_Ackerman_por_voz.mbas,71 :: 		PORTB.RB2 = 0
	BCF        PORTB+0, 2
;Control_Ackerman_por_voz.mbas,72 :: 		PORTB.RB3 = 1
	BSF        PORTB+0, 3
;Control_Ackerman_por_voz.mbas,73 :: 		PWM1_Set_Duty(velocidad_motor1)
	MOVF       _velocidad_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Control_Ackerman_por_voz.mbas,74 :: 		PWM2_Set_Duty(velocidad_motor2)
	MOVF       _velocidad_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Control_Ackerman_por_voz_robot_derecha_atras

Control_Ackerman_por_voz_ultrasonico1:

;Control_Ackerman_por_voz.mbas,78 :: 		dim distan,tiempo as word
;Control_Ackerman_por_voz.mbas,79 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;Control_Ackerman_por_voz.mbas,81 :: 		disparo1 = 1
	BSF        PORTD+0, 7
;Control_Ackerman_por_voz.mbas,82 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_Control_Ackerman_por_voz_ultrasonico18:
	DECFSZ     R13+0, 1
	GOTO       L_Control_Ackerman_por_voz_ultrasonico18
	NOP
;Control_Ackerman_por_voz.mbas,83 :: 		disparo1 = 0
	BCF        PORTD+0, 7
;Control_Ackerman_por_voz.mbas,85 :: 		DO
L_Control_Ackerman_por_voz_ultrasonico19:
;Control_Ackerman_por_voz.mbas,86 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTD+0, 6
	GOTO       L_Control_Ackerman_por_voz_ultrasonico115
;Control_Ackerman_por_voz.mbas,87 :: 		TMR0 = 0
	CLRF       TMR0+0
;Control_Ackerman_por_voz.mbas,88 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_Control_Ackerman_por_voz_ultrasonico115:
;Control_Ackerman_por_voz.mbas,90 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Control_Ackerman_por_voz_ultrasonico112
	GOTO       L_Control_Ackerman_por_voz_ultrasonico19
L_Control_Ackerman_por_voz_ultrasonico112:
;Control_Ackerman_por_voz.mbas,92 :: 		DO
L_Control_Ackerman_por_voz_ultrasonico117:
;Control_Ackerman_por_voz.mbas,93 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTD+0, 6
	GOTO       L_Control_Ackerman_por_voz_ultrasonico123
;Control_Ackerman_por_voz.mbas,94 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;Control_Ackerman_por_voz.mbas,95 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_Control_Ackerman_por_voz_ultrasonico123:
;Control_Ackerman_por_voz.mbas,97 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_Control_Ackerman_por_voz_ultrasonico126
;Control_Ackerman_por_voz.mbas,98 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_Control_Ackerman_por_voz_ultrasonico126:
;Control_Ackerman_por_voz.mbas,100 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Control_Ackerman_por_voz_ultrasonico120
	GOTO       L_Control_Ackerman_por_voz_ultrasonico117
L_Control_Ackerman_por_voz_ultrasonico120:
;Control_Ackerman_por_voz.mbas,102 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_Control_Ackerman_por_voz_ultrasonico177:
	BTFSC      STATUS+0, 2
	GOTO       L_Control_Ackerman_por_voz_ultrasonico178
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_Control_Ackerman_por_voz_ultrasonico177
L_Control_Ackerman_por_voz_ultrasonico178:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;Control_Ackerman_por_voz.mbas,103 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Control_Ackerman_por_voz_ultrasonico128:
	DECFSZ     R13+0, 1
	GOTO       L_Control_Ackerman_por_voz_ultrasonico128
	DECFSZ     R12+0, 1
	GOTO       L_Control_Ackerman_por_voz_ultrasonico128
	NOP
;Control_Ackerman_por_voz.mbas,104 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of Control_Ackerman_por_voz_ultrasonico1

_main:

;Control_Ackerman_por_voz.mbas,107 :: 		main:
;Control_Ackerman_por_voz.mbas,108 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;Control_Ackerman_por_voz.mbas,109 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;Control_Ackerman_por_voz.mbas,110 :: 		PORTA  = %00000000
	CLRF       PORTA+0
;Control_Ackerman_por_voz.mbas,111 :: 		TRISA  = %00000001
	MOVLW      1
	MOVWF      TRISA+0
;Control_Ackerman_por_voz.mbas,112 :: 		PORTB  = %00000000
	CLRF       PORTB+0
;Control_Ackerman_por_voz.mbas,113 :: 		TRISB  = %00000000
	CLRF       TRISB+0
;Control_Ackerman_por_voz.mbas,114 :: 		PORTC  = %00000000
	CLRF       PORTC+0
;Control_Ackerman_por_voz.mbas,115 :: 		TRISC  = %10010000
	MOVLW      144
	MOVWF      TRISC+0
;Control_Ackerman_por_voz.mbas,116 :: 		PORTD  = %00000000
	CLRF       PORTD+0
;Control_Ackerman_por_voz.mbas,117 :: 		TRISD  = %01000000
	MOVLW      64
	MOVWF      TRISD+0
;Control_Ackerman_por_voz.mbas,118 :: 		ANSEL  = %00000001
	MOVLW      1
	MOVWF      ANSEL+0
;Control_Ackerman_por_voz.mbas,119 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;Control_Ackerman_por_voz.mbas,120 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Control_Ackerman_por_voz.mbas,121 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Control_Ackerman_por_voz.mbas,122 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Control_Ackerman_por_voz.mbas,123 :: 		PWM1_Start
	CALL       _PWM1_Start+0
;Control_Ackerman_por_voz.mbas,124 :: 		PWM2_Start
	CALL       _PWM2_Start+0
;Control_Ackerman_por_voz.mbas,125 :: 		velocidad_motor1=150
	MOVLW      150
	MOVWF      _velocidad_motor1+0
;Control_Ackerman_por_voz.mbas,126 :: 		velocidad_motor2=250
	MOVLW      250
	MOVWF      _velocidad_motor2+0
;Control_Ackerman_por_voz.mbas,128 :: 		while (1)
L__main31:
;Control_Ackerman_por_voz.mbas,129 :: 		distancia = ultrasonico1()
	CALL       Control_Ackerman_por_voz_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia+0
	MOVF       R0+1, 0
	MOVWF      _distancia+1
;Control_Ackerman_por_voz.mbas,130 :: 		if UART1_Data_Ready = 1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;Control_Ackerman_por_voz.mbas,131 :: 		instruccion = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _instruccion+0
L__main36:
;Control_Ackerman_por_voz.mbas,138 :: 		if instruccion = "T" then
	MOVF       _instruccion+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;Control_Ackerman_por_voz.mbas,139 :: 		if distancia < 50 then
	MOVLW      0
	SUBWF      _distancia+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      50
	SUBWF      _distancia+0, 0
L__main79:
	BTFSC      STATUS+0, 0
	GOTO       L__main42
	GOTO       L__main43
;Control_Ackerman_por_voz.mbas,141 :: 		else
L__main42:
;Control_Ackerman_por_voz.mbas,142 :: 		robot_adelante()
	CALL       Control_Ackerman_por_voz_robot_adelante+0
;Control_Ackerman_por_voz.mbas,143 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,144 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
;Control_Ackerman_por_voz.mbas,145 :: 		end if
L__main43:
L__main39:
;Control_Ackerman_por_voz.mbas,147 :: 		if instruccion = "B" then
	MOVF       _instruccion+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main45
;Control_Ackerman_por_voz.mbas,148 :: 		robot_atras()
	CALL       Control_Ackerman_por_voz_robot_atras+0
;Control_Ackerman_por_voz.mbas,149 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,150 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
L__main45:
;Control_Ackerman_por_voz.mbas,152 :: 		if instruccion = "R" then
	MOVF       _instruccion+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L__main48
;Control_Ackerman_por_voz.mbas,153 :: 		if distancia < 50 then
	MOVLW      0
	SUBWF      _distancia+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      50
	SUBWF      _distancia+0, 0
L__main80:
	BTFSC      STATUS+0, 0
	GOTO       L__main51
	GOTO       L__main52
;Control_Ackerman_por_voz.mbas,155 :: 		else
L__main51:
;Control_Ackerman_por_voz.mbas,156 :: 		robot_izquierda_adelante()
	CALL       Control_Ackerman_por_voz_robot_izquierda_adelante+0
;Control_Ackerman_por_voz.mbas,157 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,158 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
;Control_Ackerman_por_voz.mbas,159 :: 		end if
L__main52:
L__main48:
;Control_Ackerman_por_voz.mbas,161 :: 		if instruccion = "Y" then
	MOVF       _instruccion+0, 0
	XORLW      89
	BTFSS      STATUS+0, 2
	GOTO       L__main54
;Control_Ackerman_por_voz.mbas,162 :: 		if distancia < 50 then
	MOVLW      0
	SUBWF      _distancia+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      50
	SUBWF      _distancia+0, 0
L__main81:
	BTFSC      STATUS+0, 0
	GOTO       L__main57
	GOTO       L__main58
;Control_Ackerman_por_voz.mbas,164 :: 		else
L__main57:
;Control_Ackerman_por_voz.mbas,165 :: 		robot_derecha_adelante()
	CALL       Control_Ackerman_por_voz_robot_derecha_adelante+0
;Control_Ackerman_por_voz.mbas,166 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,167 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
;Control_Ackerman_por_voz.mbas,168 :: 		end if
L__main58:
L__main54:
;Control_Ackerman_por_voz.mbas,170 :: 		if instruccion = "G" then
	MOVF       _instruccion+0, 0
	XORLW      71
	BTFSS      STATUS+0, 2
	GOTO       L__main60
;Control_Ackerman_por_voz.mbas,171 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
L__main60:
;Control_Ackerman_por_voz.mbas,173 :: 		if instruccion = "V" then
	MOVF       _instruccion+0, 0
	XORLW      86
	BTFSS      STATUS+0, 2
	GOTO       L__main63
;Control_Ackerman_por_voz.mbas,174 :: 		robot_izquierda_atras()
	CALL       Control_Ackerman_por_voz_robot_izquierda_atras+0
;Control_Ackerman_por_voz.mbas,175 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,176 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
L__main63:
;Control_Ackerman_por_voz.mbas,178 :: 		if instruccion = "N" then
	MOVF       _instruccion+0, 0
	XORLW      78
	BTFSS      STATUS+0, 2
	GOTO       L__main66
;Control_Ackerman_por_voz.mbas,179 :: 		robot_derecha_atras()
	CALL       Control_Ackerman_por_voz_robot_derecha_atras+0
;Control_Ackerman_por_voz.mbas,180 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;Control_Ackerman_por_voz.mbas,181 :: 		robot_parar()
	CALL       Control_Ackerman_por_voz_robot_parar+0
L__main66:
;Control_Ackerman_por_voz.mbas,183 :: 		if instruccion = "1" then
	MOVF       _instruccion+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main69
;Control_Ackerman_por_voz.mbas,184 :: 		velocidad_motor1=150
	MOVLW      150
	MOVWF      _velocidad_motor1+0
L__main69:
;Control_Ackerman_por_voz.mbas,186 :: 		if instruccion = "2" then
	MOVF       _instruccion+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main72
;Control_Ackerman_por_voz.mbas,187 :: 		velocidad_motor1=200
	MOVLW      200
	MOVWF      _velocidad_motor1+0
L__main72:
;Control_Ackerman_por_voz.mbas,189 :: 		if instruccion = "3" then
	MOVF       _instruccion+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main75
;Control_Ackerman_por_voz.mbas,190 :: 		velocidad_motor1=250
	MOVLW      250
	MOVWF      _velocidad_motor1+0
L__main75:
;Control_Ackerman_por_voz.mbas,192 :: 		instruccion = 0
	CLRF       _instruccion+0
;Control_Ackerman_por_voz.mbas,193 :: 		wend
	GOTO       L__main31
	GOTO       $+0
; end of _main
