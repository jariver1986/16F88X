
robot_aplicacion_seguidor_linea_AVANZAR:

;robot_aplicacion_seguidor_linea.mbas,9 :: 		sub procedure AVANZAR()
;robot_aplicacion_seguidor_linea.mbas,10 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,11 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,12 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,13 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,14 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,15 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_aplicacion_seguidor_linea_AVANZAR

robot_aplicacion_seguidor_linea_RETRO:

;robot_aplicacion_seguidor_linea.mbas,17 :: 		sub procedure RETRO()
;robot_aplicacion_seguidor_linea.mbas,18 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,19 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,20 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,21 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,22 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,23 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_aplicacion_seguidor_linea_RETRO

robot_aplicacion_seguidor_linea_GIRO_DERECHA:

;robot_aplicacion_seguidor_linea.mbas,25 :: 		sub procedure GIRO_DERECHA()
;robot_aplicacion_seguidor_linea.mbas,26 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,27 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,28 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,29 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,30 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,31 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_aplicacion_seguidor_linea_GIRO_DERECHA

robot_aplicacion_seguidor_linea_GIRO_IZQUIERDA:

;robot_aplicacion_seguidor_linea.mbas,33 :: 		sub procedure GIRO_IZQUIERDA()
;robot_aplicacion_seguidor_linea.mbas,34 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,35 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,36 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,37 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,38 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,39 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_aplicacion_seguidor_linea_GIRO_IZQUIERDA

robot_aplicacion_seguidor_linea_DETENER:

;robot_aplicacion_seguidor_linea.mbas,41 :: 		sub procedure DETENER()
;robot_aplicacion_seguidor_linea.mbas,42 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,43 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,44 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,45 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,46 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,47 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_aplicacion_seguidor_linea_DETENER

robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA:

;robot_aplicacion_seguidor_linea.mbas,49 :: 		sub procedure ADELANTE_IZQUIERDA()
;robot_aplicacion_seguidor_linea.mbas,50 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,51 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,52 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,53 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,54 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,55 :: 		PWM2_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,56 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA6:
	DECFSZ     R13+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA6
	DECFSZ     R12+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA6
	DECFSZ     R11+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA6
	RETURN
; end of robot_aplicacion_seguidor_linea_ADELANTE_IZQUIERDA

robot_aplicacion_seguidor_linea_ADELANTE_DERECHA:

;robot_aplicacion_seguidor_linea.mbas,58 :: 		sub procedure ADELANTE_DERECHA()
;robot_aplicacion_seguidor_linea.mbas,59 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_aplicacion_seguidor_linea.mbas,60 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_aplicacion_seguidor_linea.mbas,61 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_aplicacion_seguidor_linea.mbas,62 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_aplicacion_seguidor_linea.mbas,63 :: 		PWM1_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,64 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_aplicacion_seguidor_linea.mbas,65 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_aplicacion_seguidor_linea_ADELANTE_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_robot_aplicacion_seguidor_linea_ADELANTE_DERECHA8
	RETURN
; end of robot_aplicacion_seguidor_linea_ADELANTE_DERECHA

_main:

;robot_aplicacion_seguidor_linea.mbas,67 :: 		main:
;robot_aplicacion_seguidor_linea.mbas,68 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_aplicacion_seguidor_linea.mbas,69 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;robot_aplicacion_seguidor_linea.mbas,70 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robot_aplicacion_seguidor_linea.mbas,71 :: 		TRISA   = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;robot_aplicacion_seguidor_linea.mbas,72 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robot_aplicacion_seguidor_linea.mbas,73 :: 		TRISB   = %10000001
	MOVLW      129
	MOVWF      TRISB+0
;robot_aplicacion_seguidor_linea.mbas,74 :: 		PORTC   = %10000000
	MOVLW      128
	MOVWF      PORTC+0
;robot_aplicacion_seguidor_linea.mbas,75 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;robot_aplicacion_seguidor_linea.mbas,76 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;robot_aplicacion_seguidor_linea.mbas,77 :: 		ANSELH  = %00010000
	MOVLW      16
	MOVWF      ANSELH+0
;robot_aplicacion_seguidor_linea.mbas,78 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_aplicacion_seguidor_linea.mbas,79 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_aplicacion_seguidor_linea.mbas,80 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_aplicacion_seguidor_linea.mbas,81 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_aplicacion_seguidor_linea.mbas,84 :: 		while 1
L__main11:
;robot_aplicacion_seguidor_linea.mbas,107 :: 		sensores=(S2*2)+(S1*1)
	CLRF       R2+0
	BTFSC      PORTB+0, 7
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	CLRF       R0+0
	BTFSC      PORTB+0, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;robot_aplicacion_seguidor_linea.mbas,109 :: 		case 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;robot_aplicacion_seguidor_linea.mbas,110 :: 		AVANZAR
	CALL       robot_aplicacion_seguidor_linea_AVANZAR+0
;robot_aplicacion_seguidor_linea.mbas,111 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main15
L__main18:
;robot_aplicacion_seguidor_linea.mbas,112 :: 		case 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;robot_aplicacion_seguidor_linea.mbas,113 :: 		GIRO_IZQUIERDA
	CALL       robot_aplicacion_seguidor_linea_GIRO_IZQUIERDA+0
;robot_aplicacion_seguidor_linea.mbas,114 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main15
L__main21:
;robot_aplicacion_seguidor_linea.mbas,115 :: 		case 2
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main24
;robot_aplicacion_seguidor_linea.mbas,116 :: 		GIRO_DERECHA
	CALL       robot_aplicacion_seguidor_linea_GIRO_DERECHA+0
;robot_aplicacion_seguidor_linea.mbas,117 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main15
L__main24:
;robot_aplicacion_seguidor_linea.mbas,118 :: 		case 3
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;robot_aplicacion_seguidor_linea.mbas,119 :: 		AVANZAR
	CALL       robot_aplicacion_seguidor_linea_AVANZAR+0
;robot_aplicacion_seguidor_linea.mbas,120 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main15
L__main27:
L__main15:
;robot_aplicacion_seguidor_linea.mbas,124 :: 		wend
	GOTO       L__main11
	GOTO       $+0
; end of _main
