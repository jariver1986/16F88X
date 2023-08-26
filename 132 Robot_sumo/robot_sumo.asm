
robot_sumo_SET_MOTOR:

;robot_sumo.mbas,54 :: 		SUB PROCEDURE SET_MOTOR(DIM MOTOR2,MOTOR1 AS INTEGER)
;robot_sumo.mbas,56 :: 		IF(MOTOR1<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_sumo_SET_MOTOR162
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR1+0, 0
L_robot_sumo_SET_MOTOR162:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_SET_MOTOR2
;robot_sumo.mbas,57 :: 		MOTOR1=-MOTOR1
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       FARG_SET_MOTOR_MOTOR1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
;robot_sumo.mbas,58 :: 		MOTOR1_A=0
	BCF        PORTA+0, 2
;robot_sumo.mbas,59 :: 		NMOTOR1_A=1
	BSF        PORTA+0, 4
	GOTO       L_robot_sumo_SET_MOTOR3
;robot_sumo.mbas,60 :: 		ELSE
L_robot_sumo_SET_MOTOR2:
;robot_sumo.mbas,61 :: 		MOTOR1_A=1
	BSF        PORTA+0, 2
;robot_sumo.mbas,62 :: 		NMOTOR1_A=0
	BCF        PORTA+0, 4
;robot_sumo.mbas,63 :: 		END IF
L_robot_sumo_SET_MOTOR3:
;robot_sumo.mbas,65 :: 		IF(MOTOR2<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_sumo_SET_MOTOR163
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR2+0, 0
L_robot_sumo_SET_MOTOR163:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_SET_MOTOR5
;robot_sumo.mbas,66 :: 		MOTOR2=-MOTOR2
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       FARG_SET_MOTOR_MOTOR2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
;robot_sumo.mbas,67 :: 		DIR2=0
	BCF        PORTA+0, 3
;robot_sumo.mbas,68 :: 		NDIR2=1
	BSF        PORTA+0, 5
	GOTO       L_robot_sumo_SET_MOTOR6
;robot_sumo.mbas,69 :: 		ELSE
L_robot_sumo_SET_MOTOR5:
;robot_sumo.mbas,70 :: 		DIR2=1
	BSF        PORTA+0, 3
;robot_sumo.mbas,71 :: 		NDIR2=0
	BCF        PORTA+0, 5
;robot_sumo.mbas,72 :: 		END IF
L_robot_sumo_SET_MOTOR6:
;robot_sumo.mbas,73 :: 		PWM1_Set_Duty(MOTOR1)
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_sumo.mbas,74 :: 		PWM2_Set_Duty(MOTOR2)
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_sumo.mbas,75 :: 		Delay_5ms
	CALL       _Delay_5ms+0
	RETURN
; end of robot_sumo_SET_MOTOR

robot_sumo_ultrasonico1:

;robot_sumo.mbas,81 :: 		dim distan,tiempo as word
;robot_sumo.mbas,82 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robot_sumo.mbas,84 :: 		disparo1 = 1
	BSF        PORTC+0, 5
;robot_sumo.mbas,85 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_sumo_ultrasonico18:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico18
;robot_sumo.mbas,86 :: 		disparo1 = 0
	BCF        PORTC+0, 5
;robot_sumo.mbas,88 :: 		DO
L_robot_sumo_ultrasonico19:
;robot_sumo.mbas,89 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 4
	GOTO       L_robot_sumo_ultrasonico115
;robot_sumo.mbas,90 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_sumo.mbas,91 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robot_sumo_ultrasonico115:
;robot_sumo.mbas,93 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico112
	GOTO       L_robot_sumo_ultrasonico19
L_robot_sumo_ultrasonico112:
;robot_sumo.mbas,95 :: 		DO
L_robot_sumo_ultrasonico117:
;robot_sumo.mbas,96 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 4
	GOTO       L_robot_sumo_ultrasonico123
;robot_sumo.mbas,97 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robot_sumo.mbas,98 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robot_sumo_ultrasonico123:
;robot_sumo.mbas,100 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_ultrasonico126
;robot_sumo.mbas,101 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robot_sumo_ultrasonico126:
;robot_sumo.mbas,103 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico120
	GOTO       L_robot_sumo_ultrasonico117
L_robot_sumo_ultrasonico120:
;robot_sumo.mbas,105 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_sumo_ultrasonico1164:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico1165
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_sumo_ultrasonico1164
L_robot_sumo_ultrasonico1165:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robot_sumo.mbas,106 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_sumo_ultrasonico128:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico128
	DECFSZ     R12+0, 1
	GOTO       L_robot_sumo_ultrasonico128
	NOP
	NOP
;robot_sumo.mbas,107 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_sumo_ultrasonico1

robot_sumo_ultrasonico2:

;robot_sumo.mbas,112 :: 		dim distan,tiempo as word
;robot_sumo.mbas,114 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;robot_sumo.mbas,116 :: 		disparo2 = 1
	BSF        PORTA+0, 6
;robot_sumo.mbas,117 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_sumo_ultrasonico230:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico230
;robot_sumo.mbas,118 :: 		disparo2 = 0
	BCF        PORTA+0, 6
;robot_sumo.mbas,120 :: 		DO
L_robot_sumo_ultrasonico231:
;robot_sumo.mbas,121 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTA+0, 1
	GOTO       L_robot_sumo_ultrasonico237
;robot_sumo.mbas,122 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_sumo.mbas,123 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_robot_sumo_ultrasonico237:
;robot_sumo.mbas,125 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico234
	GOTO       L_robot_sumo_ultrasonico231
L_robot_sumo_ultrasonico234:
;robot_sumo.mbas,127 :: 		DO
L_robot_sumo_ultrasonico239:
;robot_sumo.mbas,128 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTA+0, 1
	GOTO       L_robot_sumo_ultrasonico245
;robot_sumo.mbas,129 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robot_sumo.mbas,130 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_robot_sumo_ultrasonico245:
;robot_sumo.mbas,132 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_ultrasonico248
;robot_sumo.mbas,133 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_robot_sumo_ultrasonico248:
;robot_sumo.mbas,135 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico242
	GOTO       L_robot_sumo_ultrasonico239
L_robot_sumo_ultrasonico242:
;robot_sumo.mbas,137 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_sumo_ultrasonico2166:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico2167
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_sumo_ultrasonico2166
L_robot_sumo_ultrasonico2167:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robot_sumo.mbas,138 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_sumo_ultrasonico250:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico250
	DECFSZ     R12+0, 1
	GOTO       L_robot_sumo_ultrasonico250
	NOP
	NOP
;robot_sumo.mbas,139 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_sumo_ultrasonico2

robot_sumo_ultrasonico3:

;robot_sumo.mbas,144 :: 		dim distan,tiempo as word
;robot_sumo.mbas,146 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
;robot_sumo.mbas,148 :: 		disparo3 = 1
	BSF        PORTB+0, 4
;robot_sumo.mbas,149 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_sumo_ultrasonico352:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico352
;robot_sumo.mbas,150 :: 		disparo3 = 0
	BCF        PORTB+0, 4
;robot_sumo.mbas,152 :: 		DO
L_robot_sumo_ultrasonico353:
;robot_sumo.mbas,153 :: 		IF( eco3 = 1 )THEN
	BTFSS      PORTB+0, 5
	GOTO       L_robot_sumo_ultrasonico359
;robot_sumo.mbas,154 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_sumo.mbas,155 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico3_flanco+0
L_robot_sumo_ultrasonico359:
;robot_sumo.mbas,158 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico356
	GOTO       L_robot_sumo_ultrasonico353
L_robot_sumo_ultrasonico356:
;robot_sumo.mbas,160 :: 		DO
L_robot_sumo_ultrasonico361:
;robot_sumo.mbas,161 :: 		IF( eco3 = 0 )THEN
	BTFSC      PORTB+0, 5
	GOTO       L_robot_sumo_ultrasonico367
;robot_sumo.mbas,162 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico3_tiempo+0
	CLRF       ultrasonico3_tiempo+1
;robot_sumo.mbas,163 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
L_robot_sumo_ultrasonico367:
;robot_sumo.mbas,165 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_ultrasonico370
;robot_sumo.mbas,166 :: 		FLANCO=0
	CLRF       ultrasonico3_flanco+0
L_robot_sumo_ultrasonico370:
;robot_sumo.mbas,168 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico364
	GOTO       L_robot_sumo_ultrasonico361
L_robot_sumo_ultrasonico364:
;robot_sumo.mbas,170 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico3_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_sumo_ultrasonico3168:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico3169
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_sumo_ultrasonico3168
L_robot_sumo_ultrasonico3169:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico3_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico3_distan+1
;robot_sumo.mbas,171 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_sumo_ultrasonico372:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico372
	DECFSZ     R12+0, 1
	GOTO       L_robot_sumo_ultrasonico372
	NOP
	NOP
;robot_sumo.mbas,172 :: 		result = distan
	MOVF       ultrasonico3_distan+0, 0
	MOVWF      ultrasonico3_local_result+0
	MOVF       ultrasonico3_distan+1, 0
	MOVWF      ultrasonico3_local_result+1
	MOVF       ultrasonico3_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_sumo_ultrasonico3

robot_sumo_ultrasonico4:

;robot_sumo.mbas,177 :: 		dim distan,tiempo as word
;robot_sumo.mbas,179 :: 		flanco = 0
	CLRF       ultrasonico4_flanco+0
;robot_sumo.mbas,181 :: 		disparo4 = 1
	BSF        PORTC+0, 3
;robot_sumo.mbas,182 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robot_sumo_ultrasonico474:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico474
;robot_sumo.mbas,183 :: 		disparo4 = 0
	BCF        PORTC+0, 3
;robot_sumo.mbas,185 :: 		DO
L_robot_sumo_ultrasonico475:
;robot_sumo.mbas,186 :: 		IF( eco4 = 1 )THEN
	BTFSS      PORTC+0, 0
	GOTO       L_robot_sumo_ultrasonico481
;robot_sumo.mbas,187 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_sumo.mbas,188 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico4_flanco+0
L_robot_sumo_ultrasonico481:
;robot_sumo.mbas,191 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico4_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico478
	GOTO       L_robot_sumo_ultrasonico475
L_robot_sumo_ultrasonico478:
;robot_sumo.mbas,193 :: 		DO
L_robot_sumo_ultrasonico483:
;robot_sumo.mbas,194 :: 		IF( eco4 = 0 )THEN
	BTFSC      PORTC+0, 0
	GOTO       L_robot_sumo_ultrasonico489
;robot_sumo.mbas,195 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico4_tiempo+0
	CLRF       ultrasonico4_tiempo+1
;robot_sumo.mbas,196 :: 		flanco = 0
	CLRF       ultrasonico4_flanco+0
L_robot_sumo_ultrasonico489:
;robot_sumo.mbas,198 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_sumo_ultrasonico492
;robot_sumo.mbas,199 :: 		FLANCO=0
	CLRF       ultrasonico4_flanco+0
L_robot_sumo_ultrasonico492:
;robot_sumo.mbas,201 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico4_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico486
	GOTO       L_robot_sumo_ultrasonico483
L_robot_sumo_ultrasonico486:
;robot_sumo.mbas,203 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico4_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico4_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_sumo_ultrasonico4170:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_sumo_ultrasonico4171
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_sumo_ultrasonico4170
L_robot_sumo_ultrasonico4171:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico4_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico4_distan+1
;robot_sumo.mbas,204 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robot_sumo_ultrasonico494:
	DECFSZ     R13+0, 1
	GOTO       L_robot_sumo_ultrasonico494
	DECFSZ     R12+0, 1
	GOTO       L_robot_sumo_ultrasonico494
	NOP
	NOP
;robot_sumo.mbas,205 :: 		result = distan
	MOVF       ultrasonico4_distan+0, 0
	MOVWF      ultrasonico4_local_result+0
	MOVF       ultrasonico4_distan+1, 0
	MOVWF      ultrasonico4_local_result+1
	MOVF       ultrasonico4_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico4_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_sumo_ultrasonico4

_main:

;robot_sumo.mbas,208 :: 		main:
;robot_sumo.mbas,210 :: 		OPTION_REG = %10000110 ' pull up desactivado
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_sumo.mbas,211 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;robot_sumo.mbas,214 :: 		TRISA = %10000011
	MOVLW      131
	MOVWF      TRISA+0
;robot_sumo.mbas,215 :: 		PORTA = %00000000
	CLRF       PORTA+0
;robot_sumo.mbas,218 :: 		TRISB = %01101111  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	MOVLW      111
	MOVWF      TRISB+0
;robot_sumo.mbas,219 :: 		PORTB = %00000000
	CLRF       PORTB+0
;robot_sumo.mbas,222 :: 		TRISC = %10010001
	MOVLW      145
	MOVWF      TRISC+0
;robot_sumo.mbas,223 :: 		PORTC = %00000000
	CLRF       PORTC+0
;robot_sumo.mbas,225 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;robot_sumo.mbas,226 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;robot_sumo.mbas,227 :: 		delante=0
	CLRF       _delante+0
;robot_sumo.mbas,228 :: 		delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main96:
	DECFSZ     R13+0, 1
	GOTO       L__main96
	DECFSZ     R12+0, 1
	GOTO       L__main96
	DECFSZ     R11+0, 1
	GOTO       L__main96
	NOP
;robot_sumo.mbas,231 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_sumo.mbas,232 :: 		PWM2_Init (1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_sumo.mbas,233 :: 		PWM1_Start ()
	CALL       _PWM1_Start+0
;robot_sumo.mbas,234 :: 		PWM2_Start ()
	CALL       _PWM2_Start+0
;robot_sumo.mbas,235 :: 		PWM1_Set_Duty (0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_sumo.mbas,236 :: 		PWM2_Set_Duty (0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_sumo.mbas,238 :: 		delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main97:
	DECFSZ     R13+0, 1
	GOTO       L__main97
	DECFSZ     R12+0, 1
	GOTO       L__main97
	DECFSZ     R11+0, 1
	GOTO       L__main97
	NOP
;robot_sumo.mbas,239 :: 		WHILE(1)
L__main99:
;robot_sumo.mbas,240 :: 		CONTINUAR:
L__main_continuar:
;robot_sumo.mbas,242 :: 		distancia1 = ultrasonico1()  'SENSOR FRENTE
	CALL       robot_sumo_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;robot_sumo.mbas,243 :: 		distancia2 = ultrasonico2()  'SENSOR ATRAS
	CALL       robot_sumo_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _distancia2+0
	MOVF       R0+1, 0
	MOVWF      _distancia2+1
;robot_sumo.mbas,244 :: 		distancia3 = ultrasonico4()  'SENSOR IZQUIERDA
	CALL       robot_sumo_ultrasonico4+0
	MOVF       R0+0, 0
	MOVWF      _distancia3+0
	MOVF       R0+1, 0
	MOVWF      _distancia3+1
;robot_sumo.mbas,245 :: 		distancia4 = ultrasonico3()  'SENSOR DERECHA
	CALL       robot_sumo_ultrasonico3+0
	MOVF       R0+0, 0
	MOVWF      _distancia4+0
	MOVF       R0+1, 0
	MOVWF      _distancia4+1
;robot_sumo.mbas,247 :: 		IF((S1=1) AND (S2=1) AND (S3=1) AND (S4=1))THEN
	BTFSC      PORTA+0, 7
	GOTO       L__main172
	BCF        114, 0
	GOTO       L__main173
L__main172:
	BSF        114, 0
L__main173:
	CLRF       R1+0
	BTFSS      PORTB+0, 3
	GOTO       L__main107
	MOVLW      255
	MOVWF      R1+0
L__main107:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTA+0, 0
	GOTO       L__main108
	MOVLW      255
	MOVWF      R0+0
L__main108:
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTB+0, 0
	GOTO       L__main109
	MOVLW      255
	MOVWF      R0+0
L__main109:
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main105
;robot_sumo.mbas,248 :: 		IF(distancia1<35)THEN 'SENSOR FRENTE
	MOVLW      0
	SUBWF      _distancia1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main174
	MOVLW      35
	SUBWF      _distancia1+0, 0
L__main174:
	BTFSC      STATUS+0, 0
	GOTO       L__main111
;robot_sumo.mbas,249 :: 		delante=1
	MOVLW      1
	MOVWF      _delante+0
;robot_sumo.mbas,250 :: 		SET_MOTOR(255,255)   'ADELANTE
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
	GOTO       L__main112
;robot_sumo.mbas,251 :: 		ELSE
L__main111:
;robot_sumo.mbas,252 :: 		IF(distancia2<35)THEN  'SENSOR ATRAS
	MOVLW      0
	SUBWF      _distancia2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main175
	MOVLW      35
	SUBWF      _distancia2+0, 0
L__main175:
	BTFSC      STATUS+0, 0
	GOTO       L__main114
;robot_sumo.mbas,253 :: 		delante=0
	CLRF       _delante+0
;robot_sumo.mbas,254 :: 		SET_MOTOR(-255,-255)   'Atras
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
	GOTO       L__main115
;robot_sumo.mbas,255 :: 		ELSE
L__main114:
;robot_sumo.mbas,256 :: 		IF((distancia3<35) AND (DELANTE=1))THEN   'SENSOR IZQUIERDA
	MOVLW      0
	SUBWF      _distancia3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main176
	MOVLW      35
	SUBWF      _distancia3+0, 0
L__main176:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _delante+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main117
;robot_sumo.mbas,257 :: 		SET_MOTOR(-255,255)  'IZQUIERDA
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
	GOTO       L__main118
;robot_sumo.mbas,258 :: 		ELSE
L__main117:
;robot_sumo.mbas,259 :: 		IF((distancia4<35) AND (DELANTE=1))THEN   'SENSOR DERECHA
	MOVLW      0
	SUBWF      _distancia4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main177
	MOVLW      35
	SUBWF      _distancia4+0, 0
L__main177:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _delante+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main120
;robot_sumo.mbas,260 :: 		SET_MOTOR(255,-255) 'DERECHA
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
	GOTO       L__main121
;robot_sumo.mbas,261 :: 		ELSE
L__main120:
;robot_sumo.mbas,262 :: 		IF((distancia3<35) AND (DELANTE=0))THEN   'SENSOR IZQUIERDA
	MOVLW      0
	SUBWF      _distancia3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main178
	MOVLW      35
	SUBWF      _distancia3+0, 0
L__main178:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _delante+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main123
;robot_sumo.mbas,263 :: 		SET_MOTOR(255,-255)  'IZQUIERDA
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
	GOTO       L__main124
;robot_sumo.mbas,264 :: 		ELSE
L__main123:
;robot_sumo.mbas,265 :: 		IF((distancia4<35) AND (DELANTE=0))THEN   'SENSOR DERECHA
	MOVLW      0
	SUBWF      _distancia4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main179
	MOVLW      35
	SUBWF      _distancia4+0, 0
L__main179:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _delante+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main126
;robot_sumo.mbas,266 :: 		SET_MOTOR(-255,255) 'DERECHA
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
L__main126:
;robot_sumo.mbas,268 :: 		END IF
L__main124:
;robot_sumo.mbas,269 :: 		END IF
L__main121:
;robot_sumo.mbas,270 :: 		END IF
L__main118:
;robot_sumo.mbas,271 :: 		END IF
L__main115:
;robot_sumo.mbas,272 :: 		END IF
L__main112:
	GOTO       L__main106
;robot_sumo.mbas,273 :: 		ELSE
L__main105:
;robot_sumo.mbas,274 :: 		IF (S1=0)AND (S2=0) THEN
	BTFSC      PORTA+0, 7
	GOTO       L__main180
	BSF        114, 0
	GOTO       L__main181
L__main180:
	BCF        114, 0
L__main181:
	CLRF       R1+0
	BTFSC      PORTB+0, 3
	GOTO       L__main131
	MOVLW      255
	MOVWF      R1+0
L__main131:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main129
;robot_sumo.mbas,275 :: 		SET_MOTOR(-255,-255)
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      1
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,276 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main132:
	DECFSZ     R13+0, 1
	GOTO       L__main132
	DECFSZ     R12+0, 1
	GOTO       L__main132
	DECFSZ     R11+0, 1
	GOTO       L__main132
	NOP
	NOP
	GOTO       L__main130
;robot_sumo.mbas,277 :: 		ELSE
L__main129:
;robot_sumo.mbas,278 :: 		IF (S3=0)AND (S4=0) THEN
	BTFSC      PORTA+0, 0
	GOTO       L__main182
	BSF        114, 0
	GOTO       L__main183
L__main182:
	BCF        114, 0
L__main183:
	CLRF       R1+0
	BTFSC      PORTB+0, 0
	GOTO       L__main136
	MOVLW      255
	MOVWF      R1+0
L__main136:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main134
;robot_sumo.mbas,279 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,280 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main137:
	DECFSZ     R13+0, 1
	GOTO       L__main137
	DECFSZ     R12+0, 1
	GOTO       L__main137
	DECFSZ     R11+0, 1
	GOTO       L__main137
	NOP
	NOP
	GOTO       L__main135
;robot_sumo.mbas,281 :: 		ELSE
L__main134:
;robot_sumo.mbas,282 :: 		IF (S1=0)AND (S3=0) THEN
	BTFSC      PORTA+0, 7
	GOTO       L__main184
	BSF        114, 0
	GOTO       L__main185
L__main184:
	BCF        114, 0
L__main185:
	CLRF       R1+0
	BTFSC      PORTA+0, 0
	GOTO       L__main141
	MOVLW      255
	MOVWF      R1+0
L__main141:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main139
;robot_sumo.mbas,283 :: 		SET_MOTOR(-200,200)
	MOVLW      56
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVLW      200
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,284 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main142:
	DECFSZ     R13+0, 1
	GOTO       L__main142
	DECFSZ     R12+0, 1
	GOTO       L__main142
	DECFSZ     R11+0, 1
	GOTO       L__main142
	NOP
	NOP
;robot_sumo.mbas,285 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,286 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main143:
	DECFSZ     R13+0, 1
	GOTO       L__main143
	DECFSZ     R12+0, 1
	GOTO       L__main143
	DECFSZ     R11+0, 1
	GOTO       L__main143
	NOP
	NOP
	GOTO       L__main140
;robot_sumo.mbas,287 :: 		ELSE
L__main139:
;robot_sumo.mbas,288 :: 		IF (S2=0)AND (S4=0) THEN
	BTFSC      PORTB+0, 3
	GOTO       L__main186
	BSF        114, 0
	GOTO       L__main187
L__main186:
	BCF        114, 0
L__main187:
	CLRF       R1+0
	BTFSC      PORTB+0, 0
	GOTO       L__main147
	MOVLW      255
	MOVWF      R1+0
L__main147:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main145
;robot_sumo.mbas,289 :: 		SET_MOTOR(200,-200) 'DERECHA
	MOVLW      200
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      56
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,290 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main148:
	DECFSZ     R13+0, 1
	GOTO       L__main148
	DECFSZ     R12+0, 1
	GOTO       L__main148
	DECFSZ     R11+0, 1
	GOTO       L__main148
	NOP
	NOP
;robot_sumo.mbas,291 :: 		SET_MOTOR(255,255)
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	MOVLW      255
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	CALL       robot_sumo_SET_MOTOR+0
;robot_sumo.mbas,292 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main149:
	DECFSZ     R13+0, 1
	GOTO       L__main149
	DECFSZ     R12+0, 1
	GOTO       L__main149
	DECFSZ     R11+0, 1
	GOTO       L__main149
	NOP
	NOP
	GOTO       L__main146
;robot_sumo.mbas,293 :: 		ELSE
L__main145:
;robot_sumo.mbas,294 :: 		IF (S1=0)THEN
	BTFSC      PORTA+0, 7
	GOTO       L__main151
;robot_sumo.mbas,295 :: 		GOTO CONTINUAR
	GOTO       L__main_continuar
;robot_sumo.mbas,296 :: 		ELSE
L__main151:
;robot_sumo.mbas,297 :: 		IF (S2=0)THEN
	BTFSC      PORTB+0, 3
	GOTO       L__main154
;robot_sumo.mbas,298 :: 		GOTO CONTINUAR
	GOTO       L__main_continuar
;robot_sumo.mbas,299 :: 		ELSE
L__main154:
;robot_sumo.mbas,300 :: 		IF (S3=0)THEN
	BTFSC      PORTA+0, 0
	GOTO       L__main157
;robot_sumo.mbas,301 :: 		GOTO CONTINUAR
	GOTO       L__main_continuar
;robot_sumo.mbas,302 :: 		ELSE
L__main157:
;robot_sumo.mbas,303 :: 		IF (S4=0)THEN
	BTFSC      PORTB+0, 0
	GOTO       L__main160
;robot_sumo.mbas,304 :: 		GOTO CONTINUAR
	GOTO       L__main_continuar
;robot_sumo.mbas,305 :: 		ELSE
L__main160:
;robot_sumo.mbas,306 :: 		DIR2=0
	BCF        PORTA+0, 3
;robot_sumo.mbas,307 :: 		NDIR2=0
	BCF        PORTA+0, 5
;robot_sumo.mbas,308 :: 		MOTOR1_A=0
	BCF        PORTA+0, 2
;robot_sumo.mbas,309 :: 		NMOTOR1_A=0
	BCF        PORTA+0, 4
;robot_sumo.mbas,314 :: 		END IF
L__main146:
;robot_sumo.mbas,315 :: 		END IF
L__main140:
;robot_sumo.mbas,316 :: 		END IF
L__main135:
;robot_sumo.mbas,317 :: 		END IF
L__main130:
;robot_sumo.mbas,318 :: 		END IF
L__main106:
;robot_sumo.mbas,319 :: 		WEND
	GOTO       L__main99
	GOTO       $+0
; end of _main
