
robot_bluetooth_ADELANTE:

;robot_bluetooth.mbas,11 :: 		sub procedure ADELANTE()
;robot_bluetooth.mbas,12 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_bluetooth.mbas,13 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_bluetooth.mbas,14 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_bluetooth.mbas,15 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_bluetooth.mbas,16 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,17 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_bluetooth_ADELANTE

robot_bluetooth_ATRAS:

;robot_bluetooth.mbas,19 :: 		sub procedure ATRAS()
;robot_bluetooth.mbas,20 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_bluetooth.mbas,21 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_bluetooth.mbas,22 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_bluetooth.mbas,23 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_bluetooth.mbas,24 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,25 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_bluetooth_ATRAS

robot_bluetooth_GIRO_DERECHA:

;robot_bluetooth.mbas,27 :: 		sub procedure GIRO_DERECHA()
;robot_bluetooth.mbas,28 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_bluetooth.mbas,29 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_bluetooth.mbas,30 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_bluetooth.mbas,31 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robot_bluetooth.mbas,32 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,33 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_bluetooth_GIRO_DERECHA

robot_bluetooth_GIRO_IZQUIERDA:

;robot_bluetooth.mbas,35 :: 		sub procedure GIRO_IZQUIERDA()
;robot_bluetooth.mbas,36 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robot_bluetooth.mbas,37 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_bluetooth.mbas,38 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_bluetooth.mbas,39 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_bluetooth.mbas,40 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,41 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_bluetooth_GIRO_IZQUIERDA

robot_bluetooth_PARAR:

;robot_bluetooth.mbas,43 :: 		sub procedure PARAR()
;robot_bluetooth.mbas,44 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_bluetooth.mbas,45 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robot_bluetooth.mbas,46 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robot_bluetooth.mbas,47 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_bluetooth.mbas,48 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,49 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_bluetooth_PARAR

robot_bluetooth_ADELANTE_IZQUIERDA:

;robot_bluetooth.mbas,51 :: 		sub procedure ADELANTE_IZQUIERDA()
;robot_bluetooth.mbas,52 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_bluetooth.mbas,53 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_bluetooth.mbas,54 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_bluetooth.mbas,55 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_bluetooth.mbas,56 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,57 :: 		PWM2_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_bluetooth.mbas,58 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_bluetooth_ADELANTE_IZQUIERDA6:
	DECFSZ     R13+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_IZQUIERDA6
	DECFSZ     R12+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_IZQUIERDA6
	DECFSZ     R11+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_IZQUIERDA6
	RETURN
; end of robot_bluetooth_ADELANTE_IZQUIERDA

robot_bluetooth_ADELANTE_DERECHA:

;robot_bluetooth.mbas,60 :: 		sub procedure ADELANTE_DERECHA()
;robot_bluetooth.mbas,61 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robot_bluetooth.mbas,62 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robot_bluetooth.mbas,63 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robot_bluetooth.mbas,64 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robot_bluetooth.mbas,65 :: 		PWM1_Set_Duty(150)
	MOVLW      150
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_bluetooth.mbas,66 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_bluetooth.mbas,67 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_robot_bluetooth_ADELANTE_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_robot_bluetooth_ADELANTE_DERECHA8
	RETURN
; end of robot_bluetooth_ADELANTE_DERECHA

_main:

;robot_bluetooth.mbas,69 :: 		main:
;robot_bluetooth.mbas,70 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_bluetooth.mbas,71 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;robot_bluetooth.mbas,72 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robot_bluetooth.mbas,73 :: 		TRISA   = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;robot_bluetooth.mbas,74 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robot_bluetooth.mbas,75 :: 		TRISB   = %00000100
	MOVLW      4
	MOVWF      TRISB+0
;robot_bluetooth.mbas,76 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;robot_bluetooth.mbas,77 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;robot_bluetooth.mbas,78 :: 		PORTE=0
	CLRF       PORTE+0
;robot_bluetooth.mbas,79 :: 		TRISE=0X80
	MOVLW      128
	MOVWF      TRISE+0
;robot_bluetooth.mbas,80 :: 		ANSEL   = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;robot_bluetooth.mbas,81 :: 		ANSELH  = %00010001
	MOVLW      17
	MOVWF      ANSELH+0
;robot_bluetooth.mbas,82 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_bluetooth.mbas,83 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_bluetooth.mbas,84 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_bluetooth.mbas,85 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_bluetooth.mbas,86 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_bluetooth.mbas,87 :: 		limite=50
	MOVLW      50
	MOVWF      _limite+0
	CLRF       _limite+1
;robot_bluetooth.mbas,89 :: 		while 1
L__main11:
;robot_bluetooth.mbas,90 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main16
;robot_bluetooth.mbas,91 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main16:
;robot_bluetooth.mbas,93 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;robot_bluetooth.mbas,94 :: 		portb= 1
	MOVLW      1
	MOVWF      PORTB+0
;robot_bluetooth.mbas,95 :: 		ADELANTE
	CALL       robot_bluetooth_ADELANTE+0
;robot_bluetooth.mbas,96 :: 		DATO=0
	CLRF       _DATO+0
L__main19:
;robot_bluetooth.mbas,98 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;robot_bluetooth.mbas,99 :: 		portb= 2
	MOVLW      2
	MOVWF      PORTB+0
;robot_bluetooth.mbas,100 :: 		PARAR
	CALL       robot_bluetooth_PARAR+0
;robot_bluetooth.mbas,101 :: 		DATO=0
	CLRF       _DATO+0
L__main22:
;robot_bluetooth.mbas,103 :: 		if DATO = "3" then
	MOVF       _DATO+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;robot_bluetooth.mbas,104 :: 		ATRAS
	CALL       robot_bluetooth_ATRAS+0
;robot_bluetooth.mbas,105 :: 		DATO=0
	CLRF       _DATO+0
;robot_bluetooth.mbas,106 :: 		portb= 4
	MOVLW      4
	MOVWF      PORTB+0
L__main25:
;robot_bluetooth.mbas,108 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;robot_bluetooth.mbas,109 :: 		GIRO_IZQUIERDA
	CALL       robot_bluetooth_GIRO_IZQUIERDA+0
;robot_bluetooth.mbas,110 :: 		DATO=0
	CLRF       _DATO+0
;robot_bluetooth.mbas,111 :: 		portb= 8
	MOVLW      8
	MOVWF      PORTB+0
L__main28:
;robot_bluetooth.mbas,113 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;robot_bluetooth.mbas,114 :: 		GIRO_DERECHA
	CALL       robot_bluetooth_GIRO_DERECHA+0
;robot_bluetooth.mbas,115 :: 		DATO=0
	CLRF       _DATO+0
;robot_bluetooth.mbas,116 :: 		portb= 16
	MOVLW      16
	MOVWF      PORTB+0
L__main31:
;robot_bluetooth.mbas,119 :: 		wend
	GOTO       L__main11
	GOTO       $+0
; end of _main
