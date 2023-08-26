
robot_barco_radiocontrolado_SET_MOTOR:

;robot_barco_radiocontrolado.mbas,29 :: 		SUB PROCEDURE SET_MOTOR(DIM MOTOR2,MOTOR1 AS INTEGER)
;robot_barco_radiocontrolado.mbas,31 :: 		IF(MOTOR1<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR71
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR1+0, 0
L_robot_barco_radiocontrolado_SET_MOTOR71:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR2
;robot_barco_radiocontrolado.mbas,32 :: 		MOTOR1=-MOTOR1
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       FARG_SET_MOTOR_MOTOR1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
;robot_barco_radiocontrolado.mbas,33 :: 		DIR1=0
	BCF        PORTA+0, 2
;robot_barco_radiocontrolado.mbas,34 :: 		NDIR1=1
	BSF        PORTA+0, 4
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR3
;robot_barco_radiocontrolado.mbas,35 :: 		ELSE
L_robot_barco_radiocontrolado_SET_MOTOR2:
;robot_barco_radiocontrolado.mbas,36 :: 		DIR1=1
	BSF        PORTA+0, 2
;robot_barco_radiocontrolado.mbas,37 :: 		NDIR1=0
	BCF        PORTA+0, 4
;robot_barco_radiocontrolado.mbas,38 :: 		END IF
L_robot_barco_radiocontrolado_SET_MOTOR3:
;robot_barco_radiocontrolado.mbas,40 :: 		IF(MOTOR2<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR72
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR2+0, 0
L_robot_barco_radiocontrolado_SET_MOTOR72:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR5
;robot_barco_radiocontrolado.mbas,41 :: 		MOTOR2=-MOTOR2
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       FARG_SET_MOTOR_MOTOR2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
;robot_barco_radiocontrolado.mbas,42 :: 		DIR2=0
	BCF        PORTA+0, 3
;robot_barco_radiocontrolado.mbas,43 :: 		NDIR2=1
	BSF        PORTA+0, 5
	GOTO       L_robot_barco_radiocontrolado_SET_MOTOR6
;robot_barco_radiocontrolado.mbas,44 :: 		ELSE
L_robot_barco_radiocontrolado_SET_MOTOR5:
;robot_barco_radiocontrolado.mbas,45 :: 		DIR2=1
	BSF        PORTA+0, 3
;robot_barco_radiocontrolado.mbas,46 :: 		NDIR2=0
	BCF        PORTA+0, 5
;robot_barco_radiocontrolado.mbas,47 :: 		END IF
L_robot_barco_radiocontrolado_SET_MOTOR6:
;robot_barco_radiocontrolado.mbas,48 :: 		PWM1_Set_Duty(MOTOR1)
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_barco_radiocontrolado.mbas,49 :: 		PWM2_Set_Duty(MOTOR2)
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_barco_radiocontrolado_SET_MOTOR

robot_barco_radiocontrolado_ultrasonico1:

;robot_barco_radiocontrolado.mbas,54 :: 		dim distan,tiempo as word
;robot_barco_radiocontrolado.mbas,55 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robot_barco_radiocontrolado.mbas,57 :: 		disparo1 = 1
	BSF        PORTC+0, 5
;robot_barco_radiocontrolado.mbas,58 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_barco_radiocontrolado_ultrasonico18:
	DECFSZ     R13+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico18
;robot_barco_radiocontrolado.mbas,59 :: 		disparo1 = 0
	BCF        PORTC+0, 5
;robot_barco_radiocontrolado.mbas,61 :: 		DO
L_robot_barco_radiocontrolado_ultrasonico19:
;robot_barco_radiocontrolado.mbas,62 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 4
	GOTO       L_robot_barco_radiocontrolado_ultrasonico115
;robot_barco_radiocontrolado.mbas,63 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_barco_radiocontrolado.mbas,64 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robot_barco_radiocontrolado_ultrasonico115:
;robot_barco_radiocontrolado.mbas,66 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico112
	GOTO       L_robot_barco_radiocontrolado_ultrasonico19
L_robot_barco_radiocontrolado_ultrasonico112:
;robot_barco_radiocontrolado.mbas,68 :: 		DO
L_robot_barco_radiocontrolado_ultrasonico117:
;robot_barco_radiocontrolado.mbas,69 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 4
	GOTO       L_robot_barco_radiocontrolado_ultrasonico123
;robot_barco_radiocontrolado.mbas,70 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robot_barco_radiocontrolado.mbas,71 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robot_barco_radiocontrolado_ultrasonico123:
;robot_barco_radiocontrolado.mbas,73 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_barco_radiocontrolado_ultrasonico126
;robot_barco_radiocontrolado.mbas,74 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robot_barco_radiocontrolado_ultrasonico126:
;robot_barco_radiocontrolado.mbas,76 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico120
	GOTO       L_robot_barco_radiocontrolado_ultrasonico117
L_robot_barco_radiocontrolado_ultrasonico120:
;robot_barco_radiocontrolado.mbas,78 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_barco_radiocontrolado_ultrasonico173:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico174
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_barco_radiocontrolado_ultrasonico173
L_robot_barco_radiocontrolado_ultrasonico174:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robot_barco_radiocontrolado.mbas,79 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_barco_radiocontrolado_ultrasonico128:
	DECFSZ     R13+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico128
	DECFSZ     R12+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico128
	NOP
	NOP
;robot_barco_radiocontrolado.mbas,80 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_barco_radiocontrolado_ultrasonico1

robot_barco_radiocontrolado_ultrasonico2:

;robot_barco_radiocontrolado.mbas,85 :: 		dim distan,tiempo as word
;robot_barco_radiocontrolado.mbas,87 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;robot_barco_radiocontrolado.mbas,89 :: 		disparo2 = 1
	BSF        PORTA+0, 6
;robot_barco_radiocontrolado.mbas,90 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_barco_radiocontrolado_ultrasonico230:
	DECFSZ     R13+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico230
;robot_barco_radiocontrolado.mbas,91 :: 		disparo2 = 0
	BCF        PORTA+0, 6
;robot_barco_radiocontrolado.mbas,93 :: 		DO
L_robot_barco_radiocontrolado_ultrasonico231:
;robot_barco_radiocontrolado.mbas,94 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTA+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico237
;robot_barco_radiocontrolado.mbas,95 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_barco_radiocontrolado.mbas,96 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_robot_barco_radiocontrolado_ultrasonico237:
;robot_barco_radiocontrolado.mbas,98 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico234
	GOTO       L_robot_barco_radiocontrolado_ultrasonico231
L_robot_barco_radiocontrolado_ultrasonico234:
;robot_barco_radiocontrolado.mbas,100 :: 		DO
L_robot_barco_radiocontrolado_ultrasonico239:
;robot_barco_radiocontrolado.mbas,101 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTA+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico245
;robot_barco_radiocontrolado.mbas,102 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robot_barco_radiocontrolado.mbas,103 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_robot_barco_radiocontrolado_ultrasonico245:
;robot_barco_radiocontrolado.mbas,105 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_barco_radiocontrolado_ultrasonico248
;robot_barco_radiocontrolado.mbas,106 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_robot_barco_radiocontrolado_ultrasonico248:
;robot_barco_radiocontrolado.mbas,108 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico242
	GOTO       L_robot_barco_radiocontrolado_ultrasonico239
L_robot_barco_radiocontrolado_ultrasonico242:
;robot_barco_radiocontrolado.mbas,110 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_barco_radiocontrolado_ultrasonico275:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_barco_radiocontrolado_ultrasonico276
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_barco_radiocontrolado_ultrasonico275
L_robot_barco_radiocontrolado_ultrasonico276:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robot_barco_radiocontrolado.mbas,111 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_barco_radiocontrolado_ultrasonico250:
	DECFSZ     R13+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico250
	DECFSZ     R12+0, 1
	GOTO       L_robot_barco_radiocontrolado_ultrasonico250
	NOP
	NOP
;robot_barco_radiocontrolado.mbas,112 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_barco_radiocontrolado_ultrasonico2

_main:

;robot_barco_radiocontrolado.mbas,115 :: 		main:
;robot_barco_radiocontrolado.mbas,116 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;robot_barco_radiocontrolado.mbas,118 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_barco_radiocontrolado.mbas,120 :: 		TRISA = %10000011
	MOVLW      131
	MOVWF      TRISA+0
;robot_barco_radiocontrolado.mbas,121 :: 		PORTA = %00000000
	CLRF       PORTA+0
;robot_barco_radiocontrolado.mbas,124 :: 		TRISB = %00000000  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	CLRF       TRISB+0
;robot_barco_radiocontrolado.mbas,125 :: 		PORTB = %00000000
	CLRF       PORTB+0
;robot_barco_radiocontrolado.mbas,128 :: 		TRISC = %10010001
	MOVLW      145
	MOVWF      TRISC+0
;robot_barco_radiocontrolado.mbas,129 :: 		PORTC = %00000000
	CLRF       PORTC+0
;robot_barco_radiocontrolado.mbas,131 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;robot_barco_radiocontrolado.mbas,132 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;robot_barco_radiocontrolado.mbas,133 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_barco_radiocontrolado.mbas,135 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_barco_radiocontrolado.mbas,136 :: 		PWM2_Init (1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_barco_radiocontrolado.mbas,137 :: 		PWM1_Start ()
	CALL       _PWM1_Start+0
;robot_barco_radiocontrolado.mbas,138 :: 		PWM2_Start ()
	CALL       _PWM2_Start+0
;robot_barco_radiocontrolado.mbas,139 :: 		PWM1_Set_Duty (0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_barco_radiocontrolado.mbas,140 :: 		PWM2_Set_Duty (0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_barco_radiocontrolado.mbas,141 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_barco_radiocontrolado_SET_MOTOR+0
;robot_barco_radiocontrolado.mbas,142 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main52:
	DECFSZ     R13+0, 1
	GOTO       L__main52
	DECFSZ     R12+0, 1
	GOTO       L__main52
	DECFSZ     R11+0, 1
	GOTO       L__main52
	NOP
	NOP
;robot_barco_radiocontrolado.mbas,143 :: 		SET_MOTOR(0,0)
	CLRF       FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	CLRF       FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_barco_radiocontrolado_SET_MOTOR+0
;robot_barco_radiocontrolado.mbas,144 :: 		dato=0
	CLRF       _dato+0
;robot_barco_radiocontrolado.mbas,145 :: 		dato_recep=0
	CLRF       _dato_recep+0
;robot_barco_radiocontrolado.mbas,146 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;robot_barco_radiocontrolado.mbas,147 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main53:
	DECFSZ     R13+0, 1
	GOTO       L__main53
	DECFSZ     R12+0, 1
	GOTO       L__main53
	DECFSZ     R11+0, 1
	GOTO       L__main53
	NOP
	NOP
;robot_barco_radiocontrolado.mbas,148 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_barco_radiocontrolado.mbas,149 :: 		WHILE(1)
L__main55:
;robot_barco_radiocontrolado.mbas,150 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main60
;robot_barco_radiocontrolado.mbas,151 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;robot_barco_radiocontrolado.mbas,152 :: 		dato= dato_recep
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main60:
;robot_barco_radiocontrolado.mbas,157 :: 		if dato="W" then     'IZQUIERDA
	MOVF       _dato+0, 0
	XORLW      87
	BTFSS      STATUS+0, 2
	GOTO       L__main63
;robot_barco_radiocontrolado.mbas,158 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_barco_radiocontrolado_SET_MOTOR+0
;robot_barco_radiocontrolado.mbas,159 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
L__main63:
;robot_barco_radiocontrolado.mbas,161 :: 		if dato="X" then     'DERECHA
	MOVF       _dato+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L__main66
;robot_barco_radiocontrolado.mbas,162 :: 		SET_MOTOR(-255,-255)
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_barco_radiocontrolado_SET_MOTOR+0
;robot_barco_radiocontrolado.mbas,163 :: 		PORTB=0X00
	CLRF       PORTB+0
L__main66:
;robot_barco_radiocontrolado.mbas,165 :: 		if dato="S" then     'PARAR
	MOVF       _dato+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main69
;robot_barco_radiocontrolado.mbas,166 :: 		SET_MOTOR(0,0)
	CLRF       FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	CLRF       FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_barco_radiocontrolado_SET_MOTOR+0
L__main69:
;robot_barco_radiocontrolado.mbas,170 :: 		WEND
	GOTO       L__main55
	GOTO       $+0
; end of _main
