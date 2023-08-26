
robot_android_luz_ADELANTE:

;robot_android_luz.mbas,8 :: 		sub procedure ADELANTE()
;robot_android_luz.mbas,9 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_android_luz.mbas,10 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_android_luz.mbas,11 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_android_luz.mbas,12 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_android_luz.mbas,13 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,14 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_android_luz_ADELANTE

robot_android_luz_ATRAS:

;robot_android_luz.mbas,16 :: 		sub procedure ATRAS()
;robot_android_luz.mbas,17 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_android_luz.mbas,18 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_android_luz.mbas,19 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_android_luz.mbas,20 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_android_luz.mbas,21 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,22 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_android_luz_ATRAS

robot_android_luz_GIRO_DERECHA:

;robot_android_luz.mbas,24 :: 		sub procedure GIRO_DERECHA()
;robot_android_luz.mbas,25 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_android_luz.mbas,26 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_android_luz.mbas,27 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_android_luz.mbas,28 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_android_luz.mbas,29 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,30 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_android_luz_GIRO_DERECHA

robot_android_luz_GIRO_IZQUIERDA:

;robot_android_luz.mbas,32 :: 		sub procedure GIRO_IZQUIERDA()
;robot_android_luz.mbas,33 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_android_luz.mbas,34 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_android_luz.mbas,35 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_android_luz.mbas,36 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_android_luz.mbas,37 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,38 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_android_luz_GIRO_IZQUIERDA

robot_android_luz_PARAR:

;robot_android_luz.mbas,40 :: 		sub procedure PARAR()
;robot_android_luz.mbas,41 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_android_luz.mbas,42 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_android_luz.mbas,43 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_android_luz.mbas,44 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_android_luz.mbas,45 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,46 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_android_luz_PARAR

robot_android_luz_ADELANTE_IZQUIERDA:

;robot_android_luz.mbas,48 :: 		sub procedure ADELANTE_IZQUIERDA()
;robot_android_luz.mbas,49 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_android_luz.mbas,50 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_android_luz.mbas,51 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_android_luz.mbas,52 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_android_luz.mbas,53 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,54 :: 		PWM2_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_android_luz.mbas,55 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_android_luz_ADELANTE_IZQUIERDA6:
	DECFSZ     R13+0, 1
	GOTO       L_robot_android_luz_ADELANTE_IZQUIERDA6
	DECFSZ     R12+0, 1
	GOTO       L_robot_android_luz_ADELANTE_IZQUIERDA6
	DECFSZ     R11+0, 1
	GOTO       L_robot_android_luz_ADELANTE_IZQUIERDA6
	RETURN
; end of robot_android_luz_ADELANTE_IZQUIERDA

robot_android_luz_ADELANTE_DERECHA:

;robot_android_luz.mbas,57 :: 		sub procedure ADELANTE_DERECHA()
;robot_android_luz.mbas,58 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_android_luz.mbas,59 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_android_luz.mbas,60 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_android_luz.mbas,61 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_android_luz.mbas,62 :: 		PWM1_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_android_luz.mbas,63 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_android_luz.mbas,64 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_android_luz_ADELANTE_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_robot_android_luz_ADELANTE_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_robot_android_luz_ADELANTE_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_robot_android_luz_ADELANTE_DERECHA8
	RETURN
; end of robot_android_luz_ADELANTE_DERECHA

_main:

;robot_android_luz.mbas,66 :: 		main:
;robot_android_luz.mbas,67 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_android_luz.mbas,68 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;robot_android_luz.mbas,69 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robot_android_luz.mbas,70 :: 		TRISA   = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;robot_android_luz.mbas,71 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robot_android_luz.mbas,72 :: 		TRISB   = %00000000
	CLRF       TRISB+0
;robot_android_luz.mbas,73 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;robot_android_luz.mbas,74 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;robot_android_luz.mbas,75 :: 		ANSEL   = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;robot_android_luz.mbas,76 :: 		ANSELH  = %00010000
	MOVLW      16
	MOVWF      ANSELH+0
;robot_android_luz.mbas,77 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_android_luz.mbas,78 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_android_luz.mbas,79 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_android_luz.mbas,80 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_android_luz.mbas,81 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_android_luz.mbas,82 :: 		PORTB=0Xff
	MOVLW      255
	MOVWF      PORTB+0
;robot_android_luz.mbas,83 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;robot_android_luz.mbas,84 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_android_luz.mbas,86 :: 		while 1
L__main11:
;robot_android_luz.mbas,92 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main16
;robot_android_luz.mbas,93 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main16:
;robot_android_luz.mbas,95 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;robot_android_luz.mbas,96 :: 		ADELANTE
	CALL       robot_android_luz_ADELANTE+0
L__main19:
;robot_android_luz.mbas,98 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;robot_android_luz.mbas,99 :: 		PARAR
	CALL       robot_android_luz_PARAR+0
L__main22:
;robot_android_luz.mbas,101 :: 		if DATO = "3" then
	MOVF       _DATO+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;robot_android_luz.mbas,102 :: 		ATRAS
	CALL       robot_android_luz_ATRAS+0
L__main25:
;robot_android_luz.mbas,104 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;robot_android_luz.mbas,105 :: 		GIRO_IZQUIERDA
	CALL       robot_android_luz_GIRO_IZQUIERDA+0
L__main28:
;robot_android_luz.mbas,110 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;robot_android_luz.mbas,111 :: 		GIRO_DERECHA
	CALL       robot_android_luz_GIRO_DERECHA+0
L__main31:
;robot_android_luz.mbas,116 :: 		if DATO = "K" then
	MOVF       _DATO+0, 0
	XORLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;robot_android_luz.mbas,117 :: 		PORTB.RB0= 1
	BSF        PORTB+0, 0
;robot_android_luz.mbas,118 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;robot_android_luz.mbas,119 :: 		PORTB.RB0= 0
	BCF        PORTB+0, 0
L__main34:
;robot_android_luz.mbas,121 :: 		DATO=0
	CLRF       _DATO+0
;robot_android_luz.mbas,124 :: 		wend
	GOTO       L__main11
	GOTO       $+0
; end of _main
