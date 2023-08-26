
robot_acelerometro_RETRO:

;robot_acelerometro.mbas,9 :: 		sub procedure RETRO()
;robot_acelerometro.mbas,10 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_acelerometro.mbas,11 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_acelerometro.mbas,12 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_acelerometro.mbas,13 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_acelerometro.mbas,14 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,15 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_acelerometro_RETRO

robot_acelerometro_AVANZAR:

;robot_acelerometro.mbas,17 :: 		sub procedure AVANZAR()
;robot_acelerometro.mbas,18 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_acelerometro.mbas,19 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_acelerometro.mbas,20 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_acelerometro.mbas,21 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_acelerometro.mbas,22 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,23 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_acelerometro_AVANZAR

robot_acelerometro_GIRO_DERECHA:

;robot_acelerometro.mbas,25 :: 		sub procedure GIRO_DERECHA()
;robot_acelerometro.mbas,26 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_acelerometro.mbas,27 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_acelerometro.mbas,28 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_acelerometro.mbas,29 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_acelerometro.mbas,30 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,31 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_acelerometro_GIRO_DERECHA

robot_acelerometro_GIRO_IZQUIERDA:

;robot_acelerometro.mbas,33 :: 		sub procedure GIRO_IZQUIERDA()
;robot_acelerometro.mbas,34 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_acelerometro.mbas,35 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_acelerometro.mbas,36 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_acelerometro.mbas,37 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_acelerometro.mbas,38 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,39 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_acelerometro_GIRO_IZQUIERDA

robot_acelerometro_DETENER:

;robot_acelerometro.mbas,41 :: 		sub procedure DETENER()
;robot_acelerometro.mbas,42 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_acelerometro.mbas,43 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_acelerometro.mbas,44 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_acelerometro.mbas,45 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_acelerometro.mbas,46 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,47 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_acelerometro_DETENER

robot_acelerometro_ADELANTE_IZQUIERDA:

;robot_acelerometro.mbas,49 :: 		sub procedure ADELANTE_IZQUIERDA()
;robot_acelerometro.mbas,50 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_acelerometro.mbas,51 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_acelerometro.mbas,52 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_acelerometro.mbas,53 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_acelerometro.mbas,54 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,55 :: 		PWM2_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_acelerometro.mbas,56 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_acelerometro_ADELANTE_IZQUIERDA6:
	DECFSZ     R13+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_IZQUIERDA6
	DECFSZ     R12+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_IZQUIERDA6
	DECFSZ     R11+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_IZQUIERDA6
	RETURN
; end of robot_acelerometro_ADELANTE_IZQUIERDA

robot_acelerometro_ADELANTE_DERECHA:

;robot_acelerometro.mbas,58 :: 		sub procedure ADELANTE_DERECHA()
;robot_acelerometro.mbas,59 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_acelerometro.mbas,60 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_acelerometro.mbas,61 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_acelerometro.mbas,62 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_acelerometro.mbas,63 :: 		PWM1_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_acelerometro.mbas,64 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_acelerometro.mbas,65 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_acelerometro_ADELANTE_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_robot_acelerometro_ADELANTE_DERECHA8
	RETURN
; end of robot_acelerometro_ADELANTE_DERECHA

robot_acelerometro_sonido:

;robot_acelerometro.mbas,67 :: 		sub procedure sonido
;robot_acelerometro.mbas,68 :: 		portb.rb0=1
	BSF        PORTB+0, 0
;robot_acelerometro.mbas,69 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_robot_acelerometro_sonido10:
	DECFSZ     R13+0, 1
	GOTO       L_robot_acelerometro_sonido10
	DECFSZ     R12+0, 1
	GOTO       L_robot_acelerometro_sonido10
	DECFSZ     R11+0, 1
	GOTO       L_robot_acelerometro_sonido10
	NOP
;robot_acelerometro.mbas,70 :: 		portb.rb0=0
	BCF        PORTB+0, 0
;robot_acelerometro.mbas,71 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_robot_acelerometro_sonido11:
	DECFSZ     R13+0, 1
	GOTO       L_robot_acelerometro_sonido11
	DECFSZ     R12+0, 1
	GOTO       L_robot_acelerometro_sonido11
	DECFSZ     R11+0, 1
	GOTO       L_robot_acelerometro_sonido11
	NOP
	RETURN
; end of robot_acelerometro_sonido

_main:

;robot_acelerometro.mbas,75 :: 		main:
;robot_acelerometro.mbas,76 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_acelerometro.mbas,77 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;robot_acelerometro.mbas,78 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robot_acelerometro.mbas,79 :: 		TRISA   = %11000011
	MOVLW      195
	MOVWF      TRISA+0
;robot_acelerometro.mbas,80 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robot_acelerometro.mbas,81 :: 		TRISB   = %00000000
	CLRF       TRISB+0
;robot_acelerometro.mbas,82 :: 		PORTC   = %10000000
	MOVLW      128
	MOVWF      PORTC+0
;robot_acelerometro.mbas,83 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;robot_acelerometro.mbas,84 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;robot_acelerometro.mbas,85 :: 		ANSELH  = %00010000
	MOVLW      16
	MOVWF      ANSELH+0
;robot_acelerometro.mbas,86 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_acelerometro.mbas,87 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_acelerometro.mbas,88 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_acelerometro.mbas,89 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_acelerometro.mbas,90 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_acelerometro.mbas,94 :: 		while 1
L__main14:
;robot_acelerometro.mbas,96 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main19
;robot_acelerometro.mbas,97 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main19:
;robot_acelerometro.mbas,99 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;robot_acelerometro.mbas,100 :: 		AVANZAR
	CALL       robot_acelerometro_AVANZAR+0
L__main22:
;robot_acelerometro.mbas,102 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;robot_acelerometro.mbas,103 :: 		DETENER
	CALL       robot_acelerometro_DETENER+0
L__main25:
;robot_acelerometro.mbas,105 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;robot_acelerometro.mbas,106 :: 		RETRO
	CALL       robot_acelerometro_RETRO+0
L__main28:
;robot_acelerometro.mbas,108 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;robot_acelerometro.mbas,109 :: 		GIRO_DERECHA
	CALL       robot_acelerometro_GIRO_DERECHA+0
;robot_acelerometro.mbas,110 :: 		sonido
	CALL       robot_acelerometro_sonido+0
L__main31:
;robot_acelerometro.mbas,112 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;robot_acelerometro.mbas,113 :: 		GIRO_IZQUIERDA
	CALL       robot_acelerometro_GIRO_IZQUIERDA+0
L__main34:
;robot_acelerometro.mbas,116 :: 		if DATO = "6" then
	MOVF       _DATO+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;robot_acelerometro.mbas,117 :: 		portb.rb0=0
	BCF        PORTB+0, 0
;robot_acelerometro.mbas,118 :: 		WHILE 1
L__main40:
;robot_acelerometro.mbas,119 :: 		sensores=(S2*2)+(S1*1)
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
;robot_acelerometro.mbas,121 :: 		case 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;robot_acelerometro.mbas,122 :: 		AVANZAR
	CALL       robot_acelerometro_AVANZAR+0
;robot_acelerometro.mbas,123 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main44
L__main47:
;robot_acelerometro.mbas,124 :: 		case 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main50
;robot_acelerometro.mbas,125 :: 		GIRO_IZQUIERDA
	CALL       robot_acelerometro_GIRO_IZQUIERDA+0
;robot_acelerometro.mbas,126 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main44
L__main50:
;robot_acelerometro.mbas,127 :: 		case 2
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;robot_acelerometro.mbas,128 :: 		GIRO_DERECHA
	CALL       robot_acelerometro_GIRO_DERECHA+0
;robot_acelerometro.mbas,129 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main44
L__main53:
;robot_acelerometro.mbas,130 :: 		case 3
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main56
;robot_acelerometro.mbas,131 :: 		AVANZAR
	CALL       robot_acelerometro_AVANZAR+0
;robot_acelerometro.mbas,132 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main44
L__main56:
L__main44:
;robot_acelerometro.mbas,134 :: 		WEND
	GOTO       L__main40
L__main37:
;robot_acelerometro.mbas,136 :: 		wend
	GOTO       L__main14
	GOTO       $+0
; end of _main
