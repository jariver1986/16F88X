
Laberinto_Basico_SET_MOTOR:

;Laberinto_Basico.mbas,15 :: 		SUB PROCEDURE SET_MOTOR(DIM MOTOR1,MOTOR2 AS INTEGER)
;Laberinto_Basico.mbas,17 :: 		IF(MOTOR1<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Laberinto_Basico_SET_MOTOR79
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR1+0, 0
L_Laberinto_Basico_SET_MOTOR79:
	BTFSC      STATUS+0, 0
	GOTO       L_Laberinto_Basico_SET_MOTOR2
;Laberinto_Basico.mbas,18 :: 		MOTOR1=-MOTOR1
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       FARG_SET_MOTOR_MOTOR1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
;Laberinto_Basico.mbas,19 :: 		DIR1=0
	BCF        PORTA+0, 2
;Laberinto_Basico.mbas,20 :: 		NDIR1=1
	BSF        PORTA+0, 4
	GOTO       L_Laberinto_Basico_SET_MOTOR3
;Laberinto_Basico.mbas,21 :: 		ELSE
L_Laberinto_Basico_SET_MOTOR2:
;Laberinto_Basico.mbas,22 :: 		IF(MOTOR1>0)THEN
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Laberinto_Basico_SET_MOTOR80
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
L_Laberinto_Basico_SET_MOTOR80:
	BTFSC      STATUS+0, 0
	GOTO       L_Laberinto_Basico_SET_MOTOR5
;Laberinto_Basico.mbas,23 :: 		DIR1=1
	BSF        PORTA+0, 2
;Laberinto_Basico.mbas,24 :: 		NDIR1=0
	BCF        PORTA+0, 4
L_Laberinto_Basico_SET_MOTOR5:
;Laberinto_Basico.mbas,26 :: 		END IF
L_Laberinto_Basico_SET_MOTOR3:
;Laberinto_Basico.mbas,28 :: 		IF(MOTOR2<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Laberinto_Basico_SET_MOTOR81
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR2+0, 0
L_Laberinto_Basico_SET_MOTOR81:
	BTFSC      STATUS+0, 0
	GOTO       L_Laberinto_Basico_SET_MOTOR8
;Laberinto_Basico.mbas,29 :: 		MOTOR2=-MOTOR2
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       FARG_SET_MOTOR_MOTOR2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
;Laberinto_Basico.mbas,30 :: 		DIR2=0
	BCF        PORTA+0, 3
;Laberinto_Basico.mbas,31 :: 		NDIR2=1
	BSF        PORTA+0, 5
	GOTO       L_Laberinto_Basico_SET_MOTOR9
;Laberinto_Basico.mbas,32 :: 		ELSE
L_Laberinto_Basico_SET_MOTOR8:
;Laberinto_Basico.mbas,33 :: 		IF(MOTOR2>0)THEN
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Laberinto_Basico_SET_MOTOR82
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
L_Laberinto_Basico_SET_MOTOR82:
	BTFSC      STATUS+0, 0
	GOTO       L_Laberinto_Basico_SET_MOTOR11
;Laberinto_Basico.mbas,34 :: 		DIR2=1
	BSF        PORTA+0, 3
;Laberinto_Basico.mbas,35 :: 		NDIR2=0
	BCF        PORTA+0, 5
L_Laberinto_Basico_SET_MOTOR11:
;Laberinto_Basico.mbas,37 :: 		END IF
L_Laberinto_Basico_SET_MOTOR9:
;Laberinto_Basico.mbas,38 :: 		PWM1_Set_Duty(MOTOR2)
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Laberinto_Basico.mbas,39 :: 		PWM2_Set_Duty(MOTOR1)
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Laberinto_Basico_SET_MOTOR

Laberinto_Basico_MEDICION_FRENTE:

;Laberinto_Basico.mbas,43 :: 		SUB PROCEDURE MEDICION_FRENTE()
;Laberinto_Basico.mbas,44 :: 		VOLT_FRENTE =Adc_Read(0)   ' ANALOGICO(13) RETORNA 10BITS  0-0V  1023->5V
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VOLT_FRENTE+0
	MOVF       R0+1, 0
	MOVWF      _VOLT_FRENTE+1
;Laberinto_Basico.mbas,45 :: 		Delay_ms(30)
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_Laberinto_Basico_MEDICION_FRENTE14:
	DECFSZ     R13+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_FRENTE14
	DECFSZ     R12+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_FRENTE14
;Laberinto_Basico.mbas,46 :: 		DIST_FRENTE=(2914/(VOLT_FRENTE+5))-1         'ec sensores 4-30cm
	MOVLW      5
	ADDWF      _VOLT_FRENTE+0, 0
	MOVWF      R4+0
	MOVF       _VOLT_FRENTE+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R4+1
	MOVLW      98
	MOVWF      R0+0
	MOVLW      11
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      1
	SUBWF      R0+0, 0
	MOVWF      _DIST_FRENTE+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R0+1, 0
	MOVWF      _DIST_FRENTE+1
	RETURN
; end of Laberinto_Basico_MEDICION_FRENTE

Laberinto_Basico_MEDICION_DERECHA:

;Laberinto_Basico.mbas,50 :: 		SUB PROCEDURE MEDICION_DERECHA()
;Laberinto_Basico.mbas,51 :: 		VOLT_FRENTE =Adc_Read(1)   ' ANALOGICO(13) RETORNA 10BITS  0-0V  1023->5V
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VOLT_FRENTE+0
	MOVF       R0+1, 0
	MOVWF      _VOLT_FRENTE+1
;Laberinto_Basico.mbas,52 :: 		Delay_ms(30)
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_Laberinto_Basico_MEDICION_DERECHA16:
	DECFSZ     R13+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_DERECHA16
	DECFSZ     R12+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_DERECHA16
;Laberinto_Basico.mbas,53 :: 		DIST_DERECHA=(2914/(VOLT_FRENTE+5))-1         'ec sensores 4-30cm
	MOVLW      5
	ADDWF      _VOLT_FRENTE+0, 0
	MOVWF      R4+0
	MOVF       _VOLT_FRENTE+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R4+1
	MOVLW      98
	MOVWF      R0+0
	MOVLW      11
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      1
	SUBWF      R0+0, 0
	MOVWF      _DIST_DERECHA+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R0+1, 0
	MOVWF      _DIST_DERECHA+1
	RETURN
; end of Laberinto_Basico_MEDICION_DERECHA

Laberinto_Basico_MEDICION_IZQUIERDA:

;Laberinto_Basico.mbas,56 :: 		SUB PROCEDURE MEDICION_IZQUIERDA()
;Laberinto_Basico.mbas,57 :: 		VOLT_FRENTE =Adc_Read(12)   ' ANALOGICO(13) RETORNA 10BITS  0-0V  1023->5V
	MOVLW      12
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VOLT_FRENTE+0
	MOVF       R0+1, 0
	MOVWF      _VOLT_FRENTE+1
;Laberinto_Basico.mbas,58 :: 		Delay_ms(30)
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_Laberinto_Basico_MEDICION_IZQUIERDA18:
	DECFSZ     R13+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_IZQUIERDA18
	DECFSZ     R12+0, 1
	GOTO       L_Laberinto_Basico_MEDICION_IZQUIERDA18
;Laberinto_Basico.mbas,59 :: 		DIST_IZQUIERDA=(2914/(VOLT_FRENTE+5))-1         'ec sensores 4-30cm
	MOVLW      5
	ADDWF      _VOLT_FRENTE+0, 0
	MOVWF      R4+0
	MOVF       _VOLT_FRENTE+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R4+1
	MOVLW      98
	MOVWF      R0+0
	MOVLW      11
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      1
	SUBWF      R0+0, 0
	MOVWF      _DIST_IZQUIERDA+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R0+1, 0
	MOVWF      _DIST_IZQUIERDA+1
	RETURN
; end of Laberinto_Basico_MEDICION_IZQUIERDA

_main:

;Laberinto_Basico.mbas,62 :: 		main:
;Laberinto_Basico.mbas,63 :: 		OPTION_REG=$80
	MOVLW      128
	MOVWF      OPTION_REG+0
;Laberinto_Basico.mbas,64 :: 		INTCON=0
	CLRF       INTCON+0
;Laberinto_Basico.mbas,65 :: 		TRISA=3
	MOVLW      3
	MOVWF      TRISA+0
;Laberinto_Basico.mbas,66 :: 		TRISC=1
	MOVLW      1
	MOVWF      TRISC+0
;Laberinto_Basico.mbas,67 :: 		TRISB=1
	MOVLW      1
	MOVWF      TRISB+0
;Laberinto_Basico.mbas,68 :: 		ANSEL=3
	MOVLW      3
	MOVWF      ANSEL+0
;Laberinto_Basico.mbas,69 :: 		ANSELH=$10
	MOVLW      16
	MOVWF      ANSELH+0
;Laberinto_Basico.mbas,70 :: 		PORTB=0
	CLRF       PORTB+0
;Laberinto_Basico.mbas,71 :: 		PORTA=0
	CLRF       PORTA+0
;Laberinto_Basico.mbas,72 :: 		PORTC=0
	CLRF       PORTC+0
;Laberinto_Basico.mbas,73 :: 		alerta=0
	CLRF       _alerta+0
	CLRF       _alerta+1
;Laberinto_Basico.mbas,74 :: 		DIST_FRENTE =0
	CLRF       _DIST_FRENTE+0
	CLRF       _DIST_FRENTE+1
;Laberinto_Basico.mbas,75 :: 		DIST_IZQUIERDA =0
	CLRF       _DIST_IZQUIERDA+0
	CLRF       _DIST_IZQUIERDA+1
;Laberinto_Basico.mbas,76 :: 		max=255
	MOVLW      255
	MOVWF      _max+0
	CLRF       _max+1
;Laberinto_Basico.mbas,77 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Laberinto_Basico.mbas,78 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Laberinto_Basico.mbas,79 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Laberinto_Basico.mbas,80 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Laberinto_Basico.mbas,81 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Laberinto_Basico.mbas,82 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Laberinto_Basico.mbas,83 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
;Laberinto_Basico.mbas,84 :: 		MEDICION_FRENTE()
	CALL       Laberinto_Basico_MEDICION_FRENTE+0
;Laberinto_Basico.mbas,85 :: 		MEDICION_DERECHA()
	CALL       Laberinto_Basico_MEDICION_DERECHA+0
;Laberinto_Basico.mbas,86 :: 		MEDICION_IZQUIERDA ()
	CALL       Laberinto_Basico_MEDICION_IZQUIERDA+0
;Laberinto_Basico.mbas,87 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	NOP
	NOP
;Laberinto_Basico.mbas,88 :: 		WHILE(1)
L__main23:
;Laberinto_Basico.mbas,90 :: 		IF(PORTC.0=1)THEN
	BTFSS      PORTC+0, 0
	GOTO       L__main28
;Laberinto_Basico.mbas,91 :: 		MEDICION_FRENTE()
	CALL       Laberinto_Basico_MEDICION_FRENTE+0
;Laberinto_Basico.mbas,92 :: 		MEDICION_DERECHA()
	CALL       Laberinto_Basico_MEDICION_DERECHA+0
;Laberinto_Basico.mbas,93 :: 		errordist = (9 - DIST_DERECHA )
	MOVF       _DIST_DERECHA+0, 0
	SUBLW      9
	MOVWF      _errordist+0
	MOVF       _DIST_DERECHA+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _errordist+1
	SUBWF      _errordist+1, 1
;Laberinto_Basico.mbas,95 :: 		if(DIST_FRENTE >10)then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _DIST_FRENTE+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVF       _DIST_FRENTE+0, 0
	SUBLW      10
L__main83:
	BTFSC      STATUS+0, 0
	GOTO       L__main31
;Laberinto_Basico.mbas,97 :: 		if(errordist >0) AND (errordist <4) then      'DIST_IZQUIERDA >=8cm  AND  DIST_IZQUIERDA <=6cm
	MOVLW      128
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVF       _errordist+0, 0
	SUBLW      0
L__main84:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      4
	SUBWF      _errordist+0, 0
L__main85:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main34
;Laberinto_Basico.mbas,98 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
	GOTO       L__main35
;Laberinto_Basico.mbas,99 :: 		else
L__main34:
;Laberinto_Basico.mbas,100 :: 		if(errordist <=0) AND (errordist >=-2) then         'DIST_IZQUIERDA >=9cm
	MOVLW      128
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVF       _errordist+0, 0
	SUBLW      0
L__main86:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      254
	SUBWF      _errordist+0, 0
L__main87:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main37
;Laberinto_Basico.mbas,101 :: 		set_motor(max,-max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,102 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main39:
	DECFSZ     R13+0, 1
	GOTO       L__main39
	DECFSZ     R12+0, 1
	GOTO       L__main39
	NOP
;Laberinto_Basico.mbas,103 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,104 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main40:
	DECFSZ     R13+0, 1
	GOTO       L__main40
	DECFSZ     R12+0, 1
	GOTO       L__main40
	NOP
	GOTO       L__main38
;Laberinto_Basico.mbas,105 :: 		else
L__main37:
;Laberinto_Basico.mbas,106 :: 		if(errordist <=-7) then       'DIST_IZQUIERDA >=16
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVF       _errordist+0, 0
	SUBLW      249
L__main88:
	BTFSS      STATUS+0, 0
	GOTO       L__main42
;Laberinto_Basico.mbas,107 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,108 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	DECFSZ     R11+0, 1
	GOTO       L__main44
	NOP
	NOP
;Laberinto_Basico.mbas,109 :: 		set_motor(max,-max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,110 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	DECFSZ     R11+0, 1
	GOTO       L__main45
	NOP
	NOP
;Laberinto_Basico.mbas,111 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,112 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	DECFSZ     R11+0, 1
	GOTO       L__main46
	NOP
	NOP
	GOTO       L__main43
;Laberinto_Basico.mbas,113 :: 		else
L__main42:
;Laberinto_Basico.mbas,114 :: 		if(errordist >=4) then       'DIST_IZQUIERDA <=5cm
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      4
	SUBWF      _errordist+0, 0
L__main89:
	BTFSS      STATUS+0, 0
	GOTO       L__main48
;Laberinto_Basico.mbas,115 :: 		set_motor(-max,max)
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,116 :: 		Delay_ms(40)
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	NOP
	NOP
;Laberinto_Basico.mbas,117 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,118 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	NOP
L__main48:
;Laberinto_Basico.mbas,121 :: 		end if
L__main43:
;Laberinto_Basico.mbas,122 :: 		end if
L__main38:
;Laberinto_Basico.mbas,123 :: 		end if
L__main35:
	GOTO       L__main32
;Laberinto_Basico.mbas,124 :: 		else
L__main31:
;Laberinto_Basico.mbas,125 :: 		SET_MOTOR(-max,max)
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,126 :: 		Delay_ms(10)                  'si se pega mucho a la pared
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main52:
	DECFSZ     R13+0, 1
	GOTO       L__main52
	DECFSZ     R12+0, 1
	GOTO       L__main52
	NOP
	NOP
;Laberinto_Basico.mbas,127 :: 		end if
L__main32:
	GOTO       L__main29
;Laberinto_Basico.mbas,128 :: 		ELSE
L__main28:
;Laberinto_Basico.mbas,129 :: 		IF(PORTC.0=0)THEN
	BTFSC      PORTC+0, 0
	GOTO       L__main54
;Laberinto_Basico.mbas,131 :: 		MEDICION_FRENTE()
	CALL       Laberinto_Basico_MEDICION_FRENTE+0
;Laberinto_Basico.mbas,132 :: 		MEDICION_IZQUIERDA()
	CALL       Laberinto_Basico_MEDICION_IZQUIERDA+0
;Laberinto_Basico.mbas,133 :: 		errordist = (9 - DIST_IZQUIERDA )
	MOVF       _DIST_IZQUIERDA+0, 0
	SUBLW      9
	MOVWF      _errordist+0
	MOVF       _DIST_IZQUIERDA+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _errordist+1
	SUBWF      _errordist+1, 1
;Laberinto_Basico.mbas,135 :: 		if(DIST_FRENTE >10)then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _DIST_FRENTE+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVF       _DIST_FRENTE+0, 0
	SUBLW      10
L__main90:
	BTFSC      STATUS+0, 0
	GOTO       L__main57
;Laberinto_Basico.mbas,137 :: 		if(errordist >0) AND (errordist <4) then      'DIST_IZQUIERDA >=8cm  AND  DIST_IZQUIERDA <=6cm
	MOVLW      128
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVF       _errordist+0, 0
	SUBLW      0
L__main91:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      4
	SUBWF      _errordist+0, 0
L__main92:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main60
;Laberinto_Basico.mbas,138 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
	GOTO       L__main61
;Laberinto_Basico.mbas,139 :: 		else
L__main60:
;Laberinto_Basico.mbas,140 :: 		if(errordist <=0) AND (errordist >=-2) then         'DIST_IZQUIERDA >=9cm
	MOVLW      128
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVF       _errordist+0, 0
	SUBLW      0
L__main93:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      254
	SUBWF      _errordist+0, 0
L__main94:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main63
;Laberinto_Basico.mbas,141 :: 		set_motor(-max,max)
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,142 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main65:
	DECFSZ     R13+0, 1
	GOTO       L__main65
	DECFSZ     R12+0, 1
	GOTO       L__main65
	NOP
;Laberinto_Basico.mbas,143 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,144 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main66:
	DECFSZ     R13+0, 1
	GOTO       L__main66
	DECFSZ     R12+0, 1
	GOTO       L__main66
	NOP
	GOTO       L__main64
;Laberinto_Basico.mbas,145 :: 		else
L__main63:
;Laberinto_Basico.mbas,146 :: 		if(errordist <=-7) then       'DIST_IZQUIERDA >=16
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      _errordist+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVF       _errordist+0, 0
	SUBLW      249
L__main95:
	BTFSS      STATUS+0, 0
	GOTO       L__main68
;Laberinto_Basico.mbas,147 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,148 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	DECFSZ     R12+0, 1
	GOTO       L__main70
	DECFSZ     R11+0, 1
	GOTO       L__main70
	NOP
	NOP
;Laberinto_Basico.mbas,149 :: 		set_motor(-max,max)
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,150 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main71:
	DECFSZ     R13+0, 1
	GOTO       L__main71
	DECFSZ     R12+0, 1
	GOTO       L__main71
	DECFSZ     R11+0, 1
	GOTO       L__main71
	NOP
	NOP
;Laberinto_Basico.mbas,151 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,152 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__main72:
	DECFSZ     R13+0, 1
	GOTO       L__main72
	DECFSZ     R12+0, 1
	GOTO       L__main72
	DECFSZ     R11+0, 1
	GOTO       L__main72
	NOP
	NOP
	GOTO       L__main69
;Laberinto_Basico.mbas,153 :: 		else
L__main68:
;Laberinto_Basico.mbas,154 :: 		if(errordist >=4) then       'DIST_IZQUIERDA <=5cm
	MOVLW      128
	XORWF      _errordist+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVLW      4
	SUBWF      _errordist+0, 0
L__main96:
	BTFSS      STATUS+0, 0
	GOTO       L__main74
;Laberinto_Basico.mbas,155 :: 		set_motor(max,-max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,156 :: 		Delay_ms(40)
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__main76:
	DECFSZ     R13+0, 1
	GOTO       L__main76
	DECFSZ     R12+0, 1
	GOTO       L__main76
	NOP
	NOP
;Laberinto_Basico.mbas,157 :: 		set_motor(max,max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,158 :: 		Delay_ms(20)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main77:
	DECFSZ     R13+0, 1
	GOTO       L__main77
	DECFSZ     R12+0, 1
	GOTO       L__main77
	NOP
L__main74:
;Laberinto_Basico.mbas,161 :: 		end if
L__main69:
;Laberinto_Basico.mbas,162 :: 		end if
L__main64:
;Laberinto_Basico.mbas,163 :: 		end if
L__main61:
	GOTO       L__main58
;Laberinto_Basico.mbas,164 :: 		else
L__main57:
;Laberinto_Basico.mbas,165 :: 		SET_MOTOR(max,-max)
	MOVF       _max+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _max+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	MOVF       _max+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _max+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	CALL       Laberinto_Basico_SET_MOTOR+0
;Laberinto_Basico.mbas,166 :: 		Delay_ms(10)                  'si se pega mucho a la pared
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main78:
	DECFSZ     R13+0, 1
	GOTO       L__main78
	DECFSZ     R12+0, 1
	GOTO       L__main78
	NOP
	NOP
;Laberinto_Basico.mbas,167 :: 		end if
L__main58:
L__main54:
;Laberinto_Basico.mbas,170 :: 		END IF
L__main29:
;Laberinto_Basico.mbas,171 :: 		WEND
	GOTO       L__main23
	GOTO       $+0
; end of _main
