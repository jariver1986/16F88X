
linea_AVANZAR:

;linea.mbas,9 :: 		sub procedure AVANZAR()
;linea.mbas,10 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;linea.mbas,11 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;linea.mbas,12 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;linea.mbas,13 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;linea.mbas,14 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;linea.mbas,15 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of linea_AVANZAR

linea_GIRO_DERECHA:

;linea.mbas,18 :: 		sub procedure GIRO_DERECHA()
;linea.mbas,19 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;linea.mbas,20 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;linea.mbas,21 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;linea.mbas,22 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;linea.mbas,23 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;linea.mbas,24 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of linea_GIRO_DERECHA

linea_GIRO_IZQUIERDA:

;linea.mbas,27 :: 		sub procedure GIRO_IZQUIERDA()
;linea.mbas,28 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;linea.mbas,29 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;linea.mbas,30 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;linea.mbas,31 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;linea.mbas,32 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;linea.mbas,33 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of linea_GIRO_IZQUIERDA

_main:

;linea.mbas,36 :: 		main:
;linea.mbas,37 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;linea.mbas,38 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;linea.mbas,39 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;linea.mbas,40 :: 		TRISA   = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;linea.mbas,41 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;linea.mbas,42 :: 		TRISB   = %10000001
	MOVLW      129
	MOVWF      TRISB+0
;linea.mbas,43 :: 		PORTC   = %10000000
	MOVLW      128
	MOVWF      PORTC+0
;linea.mbas,44 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;linea.mbas,45 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;linea.mbas,46 :: 		ANSELH  = %00000000
	CLRF       ANSELH+0
;linea.mbas,47 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;linea.mbas,48 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;linea.mbas,49 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;linea.mbas,50 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;linea.mbas,51 :: 		sensores=0
	CLRF       _sensores+0
;linea.mbas,54 :: 		while 1
L__main5:
;linea.mbas,56 :: 		sensores=(S2*2)+(S1*1)
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
;linea.mbas,58 :: 		case 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
;linea.mbas,59 :: 		AVANZAR
	CALL       linea_AVANZAR+0
;linea.mbas,60 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main9
L__main12:
;linea.mbas,61 :: 		case 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;linea.mbas,62 :: 		GIRO_IZQUIERDA
	CALL       linea_GIRO_IZQUIERDA+0
;linea.mbas,63 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main9
L__main15:
;linea.mbas,64 :: 		case 2
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;linea.mbas,65 :: 		GIRO_DERECHA
	CALL       linea_GIRO_DERECHA+0
;linea.mbas,66 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main9
L__main18:
;linea.mbas,67 :: 		case 3
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;linea.mbas,68 :: 		AVANZAR
	CALL       linea_AVANZAR+0
;linea.mbas,69 :: 		Delay_10ms
	CALL       _Delay_10ms+0
	GOTO       L__main9
L__main21:
L__main9:
;linea.mbas,71 :: 		wend
	GOTO       L__main5
	GOTO       $+0
; end of _main
