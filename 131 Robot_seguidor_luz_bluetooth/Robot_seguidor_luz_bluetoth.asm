
Robot_seguidor_luz_bluetoth_ADELANTE:

;Robot_seguidor_luz_bluetoth.mbas,10 :: 		sub procedure ADELANTE()
;Robot_seguidor_luz_bluetoth.mbas,11 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,12 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,13 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,14 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,15 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,16 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_seguidor_luz_bluetoth_ADELANTE

Robot_seguidor_luz_bluetoth_ATRAS:

;Robot_seguidor_luz_bluetoth.mbas,18 :: 		sub procedure ATRAS()
;Robot_seguidor_luz_bluetoth.mbas,19 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,20 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,21 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,22 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,23 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,24 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_seguidor_luz_bluetoth_ATRAS

Robot_seguidor_luz_bluetoth_ADELANTE_DERECHA:

;Robot_seguidor_luz_bluetoth.mbas,26 :: 		sub procedure ADELANTE_DERECHA()
;Robot_seguidor_luz_bluetoth.mbas,27 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,28 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,29 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,30 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,31 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,32 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_seguidor_luz_bluetoth_ADELANTE_DERECHA

Robot_seguidor_luz_bluetoth_ADELANTE_IZQUIERDA:

;Robot_seguidor_luz_bluetoth.mbas,34 :: 		sub procedure ADELANTE_IZQUIERDA()
;Robot_seguidor_luz_bluetoth.mbas,35 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,36 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,37 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,38 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,39 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,40 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_seguidor_luz_bluetoth_ADELANTE_IZQUIERDA

Robot_seguidor_luz_bluetoth_PARAR:

;Robot_seguidor_luz_bluetoth.mbas,42 :: 		sub procedure PARAR()
;Robot_seguidor_luz_bluetoth.mbas,43 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,44 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,45 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,46 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,47 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,48 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_seguidor_luz_bluetoth_PARAR

Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA:

;Robot_seguidor_luz_bluetoth.mbas,50 :: 		sub procedure ATRAS_IZQUIERDA()
;Robot_seguidor_luz_bluetoth.mbas,51 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,52 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,53 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,54 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,55 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,56 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,57 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA6:
	DECFSZ     R13+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA6
	DECFSZ     R12+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA6
	DECFSZ     R11+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA6
	RETURN
; end of Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA

Robot_seguidor_luz_bluetoth_ATRAS_DERECHA:

;Robot_seguidor_luz_bluetoth.mbas,59 :: 		sub procedure ATRAS_DERECHA()
;Robot_seguidor_luz_bluetoth.mbas,60 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;Robot_seguidor_luz_bluetoth.mbas,61 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;Robot_seguidor_luz_bluetoth.mbas,62 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;Robot_seguidor_luz_bluetoth.mbas,63 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;Robot_seguidor_luz_bluetoth.mbas,64 :: 		PWM1_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,65 :: 		PWM2_Set_Duty(250)
	MOVLW      250
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_seguidor_luz_bluetoth.mbas,66 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_Robot_seguidor_luz_bluetoth_ATRAS_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_Robot_seguidor_luz_bluetoth_ATRAS_DERECHA8
	RETURN
; end of Robot_seguidor_luz_bluetoth_ATRAS_DERECHA

_main:

;Robot_seguidor_luz_bluetoth.mbas,68 :: 		main:
;Robot_seguidor_luz_bluetoth.mbas,69 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;Robot_seguidor_luz_bluetoth.mbas,70 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;Robot_seguidor_luz_bluetoth.mbas,71 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;Robot_seguidor_luz_bluetoth.mbas,72 :: 		TRISA   = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;Robot_seguidor_luz_bluetoth.mbas,73 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;Robot_seguidor_luz_bluetoth.mbas,74 :: 		TRISB   = %00000100
	MOVLW      4
	MOVWF      TRISB+0
;Robot_seguidor_luz_bluetoth.mbas,75 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;Robot_seguidor_luz_bluetoth.mbas,76 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;Robot_seguidor_luz_bluetoth.mbas,77 :: 		PORTE=0
	CLRF       PORTE+0
;Robot_seguidor_luz_bluetoth.mbas,78 :: 		TRISE=0X80
	MOVLW      128
	MOVWF      TRISE+0
;Robot_seguidor_luz_bluetoth.mbas,79 :: 		ANSEL   = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;Robot_seguidor_luz_bluetoth.mbas,80 :: 		ANSELH  = %00010001
	MOVLW      17
	MOVWF      ANSELH+0
;Robot_seguidor_luz_bluetoth.mbas,81 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Robot_seguidor_luz_bluetoth.mbas,82 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Robot_seguidor_luz_bluetoth.mbas,83 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Robot_seguidor_luz_bluetoth.mbas,84 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Robot_seguidor_luz_bluetoth.mbas,85 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot_seguidor_luz_bluetoth.mbas,86 :: 		limite=50
	MOVLW      50
	MOVWF      _limite+0
	CLRF       _limite+1
;Robot_seguidor_luz_bluetoth.mbas,88 :: 		while 1
L__main11:
;Robot_seguidor_luz_bluetoth.mbas,89 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main16
;Robot_seguidor_luz_bluetoth.mbas,90 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main16:
;Robot_seguidor_luz_bluetoth.mbas,92 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Robot_seguidor_luz_bluetoth.mbas,93 :: 		ADELANTE
	CALL       Robot_seguidor_luz_bluetoth_ADELANTE+0
;Robot_seguidor_luz_bluetoth.mbas,94 :: 		DATO=0
	CLRF       _DATO+0
L__main19:
;Robot_seguidor_luz_bluetoth.mbas,96 :: 		if DATO = "7" then
	MOVF       _DATO+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;Robot_seguidor_luz_bluetoth.mbas,97 :: 		PARAR
	CALL       Robot_seguidor_luz_bluetoth_PARAR+0
;Robot_seguidor_luz_bluetoth.mbas,98 :: 		DATO=0
	CLRF       _DATO+0
L__main22:
;Robot_seguidor_luz_bluetoth.mbas,100 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;Robot_seguidor_luz_bluetoth.mbas,101 :: 		ATRAS
	CALL       Robot_seguidor_luz_bluetoth_ATRAS+0
;Robot_seguidor_luz_bluetoth.mbas,102 :: 		DATO=0
	CLRF       _DATO+0
L__main25:
;Robot_seguidor_luz_bluetoth.mbas,104 :: 		if DATO = "3" then
	MOVF       _DATO+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Robot_seguidor_luz_bluetoth.mbas,105 :: 		ADELANTE_IZQUIERDA
	CALL       Robot_seguidor_luz_bluetoth_ADELANTE_IZQUIERDA+0
;Robot_seguidor_luz_bluetoth.mbas,106 :: 		DATO=0
	CLRF       _DATO+0
L__main28:
;Robot_seguidor_luz_bluetoth.mbas,108 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;Robot_seguidor_luz_bluetoth.mbas,109 :: 		ADELANTE_DERECHA
	CALL       Robot_seguidor_luz_bluetoth_ADELANTE_DERECHA+0
;Robot_seguidor_luz_bluetoth.mbas,110 :: 		DATO=0
	CLRF       _DATO+0
L__main31:
;Robot_seguidor_luz_bluetoth.mbas,112 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Robot_seguidor_luz_bluetoth.mbas,113 :: 		ATRAS_IZQUIERDA
	CALL       Robot_seguidor_luz_bluetoth_ATRAS_IZQUIERDA+0
;Robot_seguidor_luz_bluetoth.mbas,114 :: 		DATO=0
	CLRF       _DATO+0
L__main34:
;Robot_seguidor_luz_bluetoth.mbas,116 :: 		if DATO = "6" then
	MOVF       _DATO+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;Robot_seguidor_luz_bluetoth.mbas,117 :: 		ATRAS_DERECHA
	CALL       Robot_seguidor_luz_bluetoth_ATRAS_DERECHA+0
;Robot_seguidor_luz_bluetoth.mbas,118 :: 		DATO=0
	CLRF       _DATO+0
L__main37:
;Robot_seguidor_luz_bluetoth.mbas,120 :: 		wend
	GOTO       L__main11
	GOTO       $+0
; end of _main
