
sumito_SET_MOTOR:

;sumito.mbas,20 :: 		SUB PROCEDURE SET_MOTOR(DIM MOTOR2,MOTOR1 AS INTEGER)
;sumito.mbas,22 :: 		IF(MOTOR1<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_sumito_SET_MOTOR52
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR1+0, 0
L_sumito_SET_MOTOR52:
	BTFSC      STATUS+0, 0
	GOTO       L_sumito_SET_MOTOR2
;sumito.mbas,23 :: 		MOTOR1=-MOTOR1
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       FARG_SET_MOTOR_MOTOR1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
;sumito.mbas,24 :: 		DIR1=0
	BCF        PORTA+0, 2
;sumito.mbas,25 :: 		NDIR1=1
	BSF        PORTA+0, 4
	GOTO       L_sumito_SET_MOTOR3
;sumito.mbas,26 :: 		ELSE
L_sumito_SET_MOTOR2:
;sumito.mbas,27 :: 		DIR1=1
	BSF        PORTA+0, 2
;sumito.mbas,28 :: 		NDIR1=0
	BCF        PORTA+0, 4
;sumito.mbas,29 :: 		END IF
L_sumito_SET_MOTOR3:
;sumito.mbas,31 :: 		IF(MOTOR2<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_sumito_SET_MOTOR53
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR2+0, 0
L_sumito_SET_MOTOR53:
	BTFSC      STATUS+0, 0
	GOTO       L_sumito_SET_MOTOR5
;sumito.mbas,32 :: 		MOTOR2=-MOTOR2
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       FARG_SET_MOTOR_MOTOR2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
;sumito.mbas,33 :: 		DIR2=0
	BCF        PORTA+0, 3
;sumito.mbas,34 :: 		NDIR2=1
	BSF        PORTA+0, 5
	GOTO       L_sumito_SET_MOTOR6
;sumito.mbas,35 :: 		ELSE
L_sumito_SET_MOTOR5:
;sumito.mbas,36 :: 		DIR2=1
	BSF        PORTA+0, 3
;sumito.mbas,37 :: 		NDIR2=0
	BCF        PORTA+0, 5
;sumito.mbas,38 :: 		END IF
L_sumito_SET_MOTOR6:
;sumito.mbas,39 :: 		PWM1_Set_Duty(MOTOR1)
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;sumito.mbas,40 :: 		PWM2_Set_Duty(MOTOR2)
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;sumito.mbas,41 :: 		Delay_5ms
	CALL       _Delay_5ms+0
	RETURN
; end of sumito_SET_MOTOR

sumito_ultrasonico1:

;sumito.mbas,47 :: 		dim distan,tiempo as word
;sumito.mbas,48 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;sumito.mbas,50 :: 		disparo1 = 1
	BSF        PORTC+0, 5
;sumito.mbas,51 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_sumito_ultrasonico18:
	DECFSZ     R13+0, 1
	GOTO       L_sumito_ultrasonico18
	NOP
;sumito.mbas,52 :: 		disparo1 = 0
	BCF        PORTC+0, 5
;sumito.mbas,54 :: 		DO
L_sumito_ultrasonico19:
;sumito.mbas,55 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 4
	GOTO       L_sumito_ultrasonico115
;sumito.mbas,56 :: 		TMR0 = 0
	CLRF       TMR0+0
;sumito.mbas,57 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_sumito_ultrasonico115:
;sumito.mbas,59 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_sumito_ultrasonico112
	GOTO       L_sumito_ultrasonico19
L_sumito_ultrasonico112:
;sumito.mbas,61 :: 		DO
L_sumito_ultrasonico117:
;sumito.mbas,62 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 4
	GOTO       L_sumito_ultrasonico123
;sumito.mbas,63 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;sumito.mbas,64 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_sumito_ultrasonico123:
;sumito.mbas,66 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_sumito_ultrasonico126
;sumito.mbas,67 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_sumito_ultrasonico126:
;sumito.mbas,69 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_sumito_ultrasonico120
	GOTO       L_sumito_ultrasonico117
L_sumito_ultrasonico120:
;sumito.mbas,71 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_sumito_ultrasonico154:
	BTFSC      STATUS+0, 2
	GOTO       L_sumito_ultrasonico155
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_sumito_ultrasonico154
L_sumito_ultrasonico155:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;sumito.mbas,72 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_sumito_ultrasonico128:
	DECFSZ     R13+0, 1
	GOTO       L_sumito_ultrasonico128
	DECFSZ     R12+0, 1
	GOTO       L_sumito_ultrasonico128
	NOP
;sumito.mbas,73 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of sumito_ultrasonico1

_main:

;sumito.mbas,77 :: 		main:
;sumito.mbas,79 :: 		OPTION_REG = %10000110 ' pull up desactivado
	MOVLW      134
	MOVWF      OPTION_REG+0
;sumito.mbas,80 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;sumito.mbas,83 :: 		TRISA = %10000011
	MOVLW      131
	MOVWF      TRISA+0
;sumito.mbas,84 :: 		PORTA = %00000000
	CLRF       PORTA+0
;sumito.mbas,87 :: 		TRISB = %01101111  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	MOVLW      111
	MOVWF      TRISB+0
;sumito.mbas,88 :: 		PORTB = %00000000
	CLRF       PORTB+0
;sumito.mbas,91 :: 		TRISC = %10010001
	MOVLW      145
	MOVWF      TRISC+0
;sumito.mbas,92 :: 		PORTC = %00000000
	CLRF       PORTC+0
;sumito.mbas,94 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;sumito.mbas,95 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;sumito.mbas,96 :: 		delante=0
	CLRF       _delante+0
;sumito.mbas,97 :: 		delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main30:
	DECFSZ     R13+0, 1
	GOTO       L__main30
	DECFSZ     R12+0, 1
	GOTO       L__main30
	NOP
	NOP
;sumito.mbas,100 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;sumito.mbas,101 :: 		PWM2_Init (1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;sumito.mbas,102 :: 		PWM1_Start ()
	CALL       _PWM1_Start+0
;sumito.mbas,103 :: 		PWM2_Start ()
	CALL       _PWM2_Start+0
;sumito.mbas,104 :: 		PWM1_Set_Duty (0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;sumito.mbas,105 :: 		PWM2_Set_Duty (0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;sumito.mbas,107 :: 		delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main31:
	DECFSZ     R13+0, 1
	GOTO       L__main31
	DECFSZ     R12+0, 1
	GOTO       L__main31
	NOP
	NOP
;sumito.mbas,108 :: 		WHILE(1)
L__main33:
;sumito.mbas,109 :: 		distancia1 = ultrasonico1()  'SENSOR FRENTE
	CALL       sumito_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;sumito.mbas,110 :: 		IF ((S1=1) AND (S2=1)) THEN
	BTFSC      PORTB+0, 0
	GOTO       L__main56
	BCF        114, 0
	GOTO       L__main57
L__main56:
	BSF        114, 0
L__main57:
	CLRF       R1+0
	BTFSS      PORTB+0, 3
	GOTO       L__main40
	MOVLW      255
	MOVWF      R1+0
L__main40:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main38
;sumito.mbas,111 :: 		IF(distancia1<35)THEN
	MOVLW      0
	SUBWF      _distancia1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      35
	SUBWF      _distancia1+0, 0
L__main58:
	BTFSC      STATUS+0, 0
	GOTO       L__main42
;sumito.mbas,112 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       sumito_SET_MOTOR+0
	GOTO       L__main43
;sumito.mbas,113 :: 		ELSE
L__main42:
;sumito.mbas,114 :: 		SET_MOTOR(-255,255)
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       sumito_SET_MOTOR+0
;sumito.mbas,115 :: 		END IF
L__main43:
	GOTO       L__main39
;sumito.mbas,116 :: 		ELSE
L__main38:
;sumito.mbas,117 :: 		IF (S1=0) THEN
	BTFSC      PORTB+0, 0
	GOTO       L__main45
;sumito.mbas,118 :: 		SET_MOTOR(-255,-255)
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       sumito_SET_MOTOR+0
;sumito.mbas,119 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	DECFSZ     R11+0, 1
	GOTO       L__main47
	NOP
	NOP
	GOTO       L__main46
;sumito.mbas,120 :: 		ELSE
L__main45:
;sumito.mbas,121 :: 		IF (S2=0) THEN
	BTFSC      PORTB+0, 3
	GOTO       L__main49
;sumito.mbas,122 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       sumito_SET_MOTOR+0
;sumito.mbas,123 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	DECFSZ     R11+0, 1
	GOTO       L__main51
	NOP
	NOP
L__main49:
;sumito.mbas,125 :: 		END IF
L__main46:
;sumito.mbas,126 :: 		END IF
L__main39:
;sumito.mbas,127 :: 		WEND
	GOTO       L__main33
	GOTO       $+0
; end of _main
