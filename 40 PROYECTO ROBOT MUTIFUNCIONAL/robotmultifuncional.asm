
robotmultifuncional_set_motor:

;robotmultifuncional.mbas,28 :: 		sub procedure set_motor(dim motor1, motor2 as integer)
;robotmultifuncional.mbas,29 :: 		if motor1 < 0 then
	MOVLW      128
	XORWF      FARG_set_motor_motor1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_set_motor188
	MOVLW      0
	SUBWF      FARG_set_motor_motor1+0, 0
L_robotmultifuncional_set_motor188:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_set_motor2
;robotmultifuncional.mbas,30 :: 		motor1 = -motor1
	MOVF       FARG_set_motor_motor1+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       FARG_set_motor_motor1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
;robotmultifuncional.mbas,31 :: 		dir1 = 0
	BCF        PORTA+0, 2
;robotmultifuncional.mbas,32 :: 		ndir1 = 1
	BSF        PORTA+0, 4
	GOTO       L_robotmultifuncional_set_motor3
;robotmultifuncional.mbas,33 :: 		else
L_robotmultifuncional_set_motor2:
;robotmultifuncional.mbas,34 :: 		dir1 = 1
	BSF        PORTA+0, 2
;robotmultifuncional.mbas,35 :: 		ndir1 = 0
	BCF        PORTA+0, 4
;robotmultifuncional.mbas,36 :: 		end if
L_robotmultifuncional_set_motor3:
;robotmultifuncional.mbas,38 :: 		if motor2 < 0 then
	MOVLW      128
	XORWF      FARG_set_motor_motor2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_set_motor189
	MOVLW      0
	SUBWF      FARG_set_motor_motor2+0, 0
L_robotmultifuncional_set_motor189:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_set_motor5
;robotmultifuncional.mbas,39 :: 		motor2 = -motor2
	MOVF       FARG_set_motor_motor2+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       FARG_set_motor_motor2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
;robotmultifuncional.mbas,40 :: 		dir2 = 0
	BCF        PORTA+0, 3
;robotmultifuncional.mbas,41 :: 		ndir2 = 1
	BSF        PORTA+0, 5
	GOTO       L_robotmultifuncional_set_motor6
;robotmultifuncional.mbas,42 :: 		else
L_robotmultifuncional_set_motor5:
;robotmultifuncional.mbas,43 :: 		dir2 = 1
	BSF        PORTA+0, 3
;robotmultifuncional.mbas,44 :: 		ndir2 = 0
	BCF        PORTA+0, 5
;robotmultifuncional.mbas,45 :: 		end if
L_robotmultifuncional_set_motor6:
;robotmultifuncional.mbas,47 :: 		if motor1 > 0xFF then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_set_motor_motor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_set_motor190
	MOVF       FARG_set_motor_motor1+0, 0
	SUBLW      255
L_robotmultifuncional_set_motor190:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_set_motor8
;robotmultifuncional.mbas,48 :: 		motor1 = 0xFF
	MOVLW      255
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
L_robotmultifuncional_set_motor8:
;robotmultifuncional.mbas,51 :: 		if motor2 > 0xFF then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_set_motor_motor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_set_motor191
	MOVF       FARG_set_motor_motor2+0, 0
	SUBLW      255
L_robotmultifuncional_set_motor191:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_set_motor11
;robotmultifuncional.mbas,52 :: 		motor2 = 0xFF
	MOVLW      255
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
L_robotmultifuncional_set_motor11:
;robotmultifuncional.mbas,55 :: 		PWM1_Set_Duty(motor1)
	MOVF       FARG_set_motor_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotmultifuncional.mbas,56 :: 		PWM2_Set_Duty(motor2)
	MOVF       FARG_set_motor_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotmultifuncional_set_motor

robotmultifuncional_seguidor_luz:

;robotmultifuncional.mbas,59 :: 		sub procedure seguidor_luz(dim speed as byte)
;robotmultifuncional.mbas,60 :: 		temp_ldr1 = Adc_Read(13) ' right
	MOVLW      13
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_ldr1+0
	MOVF       R0+1, 0
	MOVWF      _temp_ldr1+1
;robotmultifuncional.mbas,61 :: 		temp_ldr2 = Adc_Read(11) ' left
	MOVLW      11
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_ldr2+0
	MOVF       R0+1, 0
	MOVWF      _temp_ldr2+1
;robotmultifuncional.mbas,63 :: 		if (adc_ldr1 > temp_ldr1) and (adc_ldr2 > temp_ldr2) then
	MOVF       _adc_ldr1+1, 0
	SUBWF      _temp_ldr1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_luz192
	MOVF       _adc_ldr1+0, 0
	SUBWF      _temp_ldr1+0, 0
L_robotmultifuncional_seguidor_luz192:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R3+0
	MOVF       _adc_ldr2+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_luz193
	MOVF       _adc_ldr2+0, 0
	SUBWF      R0+0, 0
L_robotmultifuncional_seguidor_luz193:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R2+0
	MOVF       R2+0, 0
	ANDWF      R3+0, 0
	MOVWF      R0+0
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_luz15
;robotmultifuncional.mbas,64 :: 		set_motor(speed, speed)
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_luz16
;robotmultifuncional.mbas,65 :: 		else
L_robotmultifuncional_seguidor_luz15:
;robotmultifuncional.mbas,66 :: 		if adc_ldr1 > temp_ldr1 then
	MOVF       _adc_ldr1+1, 0
	SUBWF      _temp_ldr1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_luz194
	MOVF       _adc_ldr1+0, 0
	SUBWF      _temp_ldr1+0, 0
L_robotmultifuncional_seguidor_luz194:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_seguidor_luz18
;robotmultifuncional.mbas,67 :: 		set_motor(speed div 2, speed)
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_luz19
;robotmultifuncional.mbas,68 :: 		else
L_robotmultifuncional_seguidor_luz18:
;robotmultifuncional.mbas,69 :: 		if adc_ldr2 > temp_ldr2 then
	MOVF       _adc_ldr2+1, 0
	SUBWF      _temp_ldr2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_luz195
	MOVF       _adc_ldr2+0, 0
	SUBWF      _temp_ldr2+0, 0
L_robotmultifuncional_seguidor_luz195:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_seguidor_luz21
;robotmultifuncional.mbas,70 :: 		set_motor(speed, speed div 2)
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_luz_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_luz22
;robotmultifuncional.mbas,71 :: 		else
L_robotmultifuncional_seguidor_luz21:
;robotmultifuncional.mbas,72 :: 		set_motor(0x00, 0x00)
	CLRF       FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	CLRF       FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,73 :: 		end if
L_robotmultifuncional_seguidor_luz22:
;robotmultifuncional.mbas,74 :: 		end if
L_robotmultifuncional_seguidor_luz19:
;robotmultifuncional.mbas,75 :: 		end if
L_robotmultifuncional_seguidor_luz16:
	RETURN
; end of robotmultifuncional_seguidor_luz

robotmultifuncional_ultrasonico1:

;robotmultifuncional.mbas,80 :: 		dim distan, tiempo as word
;robotmultifuncional.mbas,82 :: 		distan = 0x0000
	CLRF       ultrasonico1_distan+0
	CLRF       ultrasonico1_distan+1
;robotmultifuncional.mbas,83 :: 		tiempo = 0x0000
	CLRF       ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robotmultifuncional.mbas,84 :: 		flanco = 0x00
	CLRF       ultrasonico1_flanco+0
;robotmultifuncional.mbas,86 :: 		disparo1 = 1
	BSF        PORTB+0, 1
;robotmultifuncional.mbas,87 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robotmultifuncional_ultrasonico124:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_ultrasonico124
	NOP
;robotmultifuncional.mbas,88 :: 		disparo1 = 0
	BCF        PORTB+0, 1
;robotmultifuncional.mbas,90 :: 		do
L_robotmultifuncional_ultrasonico125:
;robotmultifuncional.mbas,91 :: 		if eco1 = 1 then
	BTFSS      PORTB+0, 0
	GOTO       L_robotmultifuncional_ultrasonico131
;robotmultifuncional.mbas,92 :: 		TMR0 = 0x00
	CLRF       TMR0+0
;robotmultifuncional.mbas,93 :: 		flanco = 0xFF
	MOVLW      255
	MOVWF      ultrasonico1_flanco+0
L_robotmultifuncional_ultrasonico131:
;robotmultifuncional.mbas,95 :: 		loop until( flanco = 0xFF )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico128
	GOTO       L_robotmultifuncional_ultrasonico125
L_robotmultifuncional_ultrasonico128:
;robotmultifuncional.mbas,97 :: 		do
L_robotmultifuncional_ultrasonico133:
;robotmultifuncional.mbas,98 :: 		if eco1 = 0 then
	BTFSC      PORTB+0, 0
	GOTO       L_robotmultifuncional_ultrasonico139
;robotmultifuncional.mbas,99 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robotmultifuncional.mbas,100 :: 		flanco = 0x00
	CLRF       ultrasonico1_flanco+0
L_robotmultifuncional_ultrasonico139:
;robotmultifuncional.mbas,102 :: 		if TMR0 > 0xFE then
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_ultrasonico142
;robotmultifuncional.mbas,103 :: 		flanco = 0x00
	CLRF       ultrasonico1_flanco+0
L_robotmultifuncional_ultrasonico142:
;robotmultifuncional.mbas,105 :: 		loop until( flanco = 0x00 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico136
	GOTO       L_robotmultifuncional_ultrasonico133
L_robotmultifuncional_ultrasonico136:
;robotmultifuncional.mbas,107 :: 		distan = tiempo * 128
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotmultifuncional_ultrasonico1196:
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico1197
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotmultifuncional_ultrasonico1196
L_robotmultifuncional_ultrasonico1197:
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robotmultifuncional.mbas,108 :: 		distan = distan / 58
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robotmultifuncional.mbas,110 :: 		Delay_ms(50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robotmultifuncional_ultrasonico144:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_ultrasonico144
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_ultrasonico144
	NOP
;robotmultifuncional.mbas,111 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotmultifuncional_ultrasonico1

robotmultifuncional_ultrasonico2:

;robotmultifuncional.mbas,116 :: 		dim distan, tiempo as word
;robotmultifuncional.mbas,118 :: 		distan = 0x0000
	CLRF       ultrasonico2_distan+0
	CLRF       ultrasonico2_distan+1
;robotmultifuncional.mbas,119 :: 		tiempo = 0x0000
	CLRF       ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robotmultifuncional.mbas,120 :: 		flanco = 0x00
	CLRF       ultrasonico2_flanco+0
;robotmultifuncional.mbas,122 :: 		disparo2 = 1
	BSF        PORTB+0, 3
;robotmultifuncional.mbas,123 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robotmultifuncional_ultrasonico246:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_ultrasonico246
	NOP
;robotmultifuncional.mbas,124 :: 		disparo2 = 0
	BCF        PORTB+0, 3
;robotmultifuncional.mbas,126 :: 		do
L_robotmultifuncional_ultrasonico247:
;robotmultifuncional.mbas,127 :: 		if eco2 = 1 then
	BTFSS      PORTB+0, 2
	GOTO       L_robotmultifuncional_ultrasonico253
;robotmultifuncional.mbas,128 :: 		TMR0 = 0x00
	CLRF       TMR0+0
;robotmultifuncional.mbas,129 :: 		flanco = 0xFF
	MOVLW      255
	MOVWF      ultrasonico2_flanco+0
L_robotmultifuncional_ultrasonico253:
;robotmultifuncional.mbas,131 :: 		loop until( flanco = 0xFF )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico250
	GOTO       L_robotmultifuncional_ultrasonico247
L_robotmultifuncional_ultrasonico250:
;robotmultifuncional.mbas,133 :: 		do
L_robotmultifuncional_ultrasonico255:
;robotmultifuncional.mbas,134 :: 		if eco2 = 0 then
	BTFSC      PORTB+0, 2
	GOTO       L_robotmultifuncional_ultrasonico261
;robotmultifuncional.mbas,135 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robotmultifuncional.mbas,136 :: 		flanco = 0x00
	CLRF       ultrasonico2_flanco+0
L_robotmultifuncional_ultrasonico261:
;robotmultifuncional.mbas,138 :: 		if TMR0 > 0xFE then
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_ultrasonico264
;robotmultifuncional.mbas,139 :: 		flanco = 0x00
	CLRF       ultrasonico2_flanco+0
L_robotmultifuncional_ultrasonico264:
;robotmultifuncional.mbas,141 :: 		loop until( flanco = 0x00 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico258
	GOTO       L_robotmultifuncional_ultrasonico255
L_robotmultifuncional_ultrasonico258:
;robotmultifuncional.mbas,143 :: 		distan = tiempo * 128
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotmultifuncional_ultrasonico2198:
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_ultrasonico2199
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotmultifuncional_ultrasonico2198
L_robotmultifuncional_ultrasonico2199:
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robotmultifuncional.mbas,144 :: 		distan = distan / 58
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robotmultifuncional.mbas,146 :: 		Delay_ms(50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robotmultifuncional_ultrasonico266:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_ultrasonico266
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_ultrasonico266
	NOP
;robotmultifuncional.mbas,147 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotmultifuncional_ultrasonico2

robotmultifuncional_seguidor_ultrasonico:

;robotmultifuncional.mbas,150 :: 		sub procedure seguidor_ultrasonico(dim distance, speed as byte)
;robotmultifuncional.mbas,152 :: 		srf05_1 = distance
	MOVF       FARG_seguidor_ultrasonico_distance+0, 0
	MOVWF      _srf05_1+0
	CLRF       _srf05_1+1
;robotmultifuncional.mbas,153 :: 		srf05_2 = distance
	MOVF       FARG_seguidor_ultrasonico_distance+0, 0
	MOVWF      _srf05_2+0
	CLRF       _srf05_2+1
;robotmultifuncional.mbas,155 :: 		temp_srf05_1 = ultrasonico1()
	CALL       robotmultifuncional_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _temp_srf05_1+0
	MOVF       R0+1, 0
	MOVWF      _temp_srf05_1+1
;robotmultifuncional.mbas,156 :: 		temp_srf05_2 = ultrasonico2()
	CALL       robotmultifuncional_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _temp_srf05_2+0
	MOVF       R0+1, 0
	MOVWF      _temp_srf05_2+1
;robotmultifuncional.mbas,158 :: 		if (srf05_1 > temp_srf05_1) and (srf05_2 > temp_srf05_2) then
	MOVF       _srf05_1+1, 0
	SUBWF      _temp_srf05_1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico200
	MOVF       _srf05_1+0, 0
	SUBWF      _temp_srf05_1+0, 0
L_robotmultifuncional_seguidor_ultrasonico200:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R3+0
	MOVF       _srf05_2+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico201
	MOVF       _srf05_2+0, 0
	SUBWF      R0+0, 0
L_robotmultifuncional_seguidor_ultrasonico201:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R2+0
	MOVF       R2+0, 0
	ANDWF      R3+0, 0
	MOVWF      R0+0
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico69
;robotmultifuncional.mbas,159 :: 		set_motor(speed, speed)
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_ultrasonico70
;robotmultifuncional.mbas,160 :: 		else
L_robotmultifuncional_seguidor_ultrasonico69:
;robotmultifuncional.mbas,161 :: 		if srf05_1 > temp_srf05_1 then
	MOVF       _srf05_1+1, 0
	SUBWF      _temp_srf05_1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico202
	MOVF       _srf05_1+0, 0
	SUBWF      _temp_srf05_1+0, 0
L_robotmultifuncional_seguidor_ultrasonico202:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_seguidor_ultrasonico72
;robotmultifuncional.mbas,162 :: 		set_motor(speed, speed div 2)
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_ultrasonico73
;robotmultifuncional.mbas,163 :: 		else
L_robotmultifuncional_seguidor_ultrasonico72:
;robotmultifuncional.mbas,164 :: 		if srf05_2 > temp_srf05_2 then
	MOVF       _srf05_2+1, 0
	SUBWF      _temp_srf05_2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico203
	MOVF       _srf05_2+0, 0
	SUBWF      _temp_srf05_2+0, 0
L_robotmultifuncional_seguidor_ultrasonico203:
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_seguidor_ultrasonico75
;robotmultifuncional.mbas,165 :: 		set_motor(speed div 2, speed)
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_ultrasonico_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
	GOTO       L_robotmultifuncional_seguidor_ultrasonico76
;robotmultifuncional.mbas,166 :: 		else
L_robotmultifuncional_seguidor_ultrasonico75:
;robotmultifuncional.mbas,167 :: 		set_motor(0x00, 0x00)
	CLRF       FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	CLRF       FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,168 :: 		end if
L_robotmultifuncional_seguidor_ultrasonico76:
;robotmultifuncional.mbas,169 :: 		end if
L_robotmultifuncional_seguidor_ultrasonico73:
;robotmultifuncional.mbas,170 :: 		end if
L_robotmultifuncional_seguidor_ultrasonico70:
;robotmultifuncional.mbas,171 :: 		if ( temp_srf05_1<10) and (temp_srf05_2<10) then
	MOVLW      0
	SUBWF      _temp_srf05_1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico204
	MOVLW      10
	SUBWF      _temp_srf05_1+0, 0
L_robotmultifuncional_seguidor_ultrasonico204:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	SUBWF      _temp_srf05_2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico205
	MOVLW      10
	SUBWF      _temp_srf05_2+0, 0
L_robotmultifuncional_seguidor_ultrasonico205:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_ultrasonico78
;robotmultifuncional.mbas,172 :: 		set_motor(0x00, 0x00)
	CLRF       FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	CLRF       FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
L_robotmultifuncional_seguidor_ultrasonico78:
;robotmultifuncional.mbas,173 :: 		end if
	RETURN
; end of robotmultifuncional_seguidor_ultrasonico

robotmultifuncional_seguidor_linea:

;robotmultifuncional.mbas,177 :: 		sub procedure seguidor_linea(dim speed as byte)
;robotmultifuncional.mbas,179 :: 		sensores = (linea3*8) + (linea2*4) + (linea1*2) + (linea0*1)
	CLRF       R1+0
	BTFSC      PORTC+0, 4
	INCF       R1+0, 1
	MOVF       R1+0, 0
	MOVWF      R3+0
	RLF        R3+0, 1
	BCF        R3+0, 0
	RLF        R3+0, 1
	BCF        R3+0, 0
	RLF        R3+0, 1
	BCF        R3+0, 0
	CLRF       R2+0
	BTFSC      PORTC+0, 7
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R3+0, 1
	CLRF       R2+0
	BTFSC      PORTC+0, 6
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R3+0, 0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      PORTC+0, 5
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;robotmultifuncional.mbas,182 :: 		case 0' S4 S3 S2 S1 = 0 0 0 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea84
;robotmultifuncional.mbas,183 :: 		banda = banda + 1
	INCF       _banda+0, 1
;robotmultifuncional.mbas,184 :: 		if banda < 4 then
	MOVLW      4
	SUBWF      _banda+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_robotmultifuncional_seguidor_linea86
;robotmultifuncional.mbas,185 :: 		set_motor(speed, speed)
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,186 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea88:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea88
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea88
	NOP
	NOP
	GOTO       L_robotmultifuncional_seguidor_linea87
;robotmultifuncional.mbas,187 :: 		else
L_robotmultifuncional_seguidor_linea86:
;robotmultifuncional.mbas,188 :: 		if (banda>4) and (banda<24) then
	MOVF       _banda+0, 0
	SUBLW      4
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      24
	SUBWF      _banda+0, 0
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea90
;robotmultifuncional.mbas,189 :: 		set_motor(-(speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,190 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea92:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea92
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea92
	NOP
	NOP
	GOTO       L_robotmultifuncional_seguidor_linea91
;robotmultifuncional.mbas,191 :: 		else
L_robotmultifuncional_seguidor_linea90:
;robotmultifuncional.mbas,192 :: 		set_motor((speed div 2), -(speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,193 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea93:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea93
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea93
	NOP
	NOP
;robotmultifuncional.mbas,194 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea94:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea94
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea94
	NOP
	NOP
;robotmultifuncional.mbas,195 :: 		end if
L_robotmultifuncional_seguidor_linea91:
;robotmultifuncional.mbas,196 :: 		end if
L_robotmultifuncional_seguidor_linea87:
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea84:
;robotmultifuncional.mbas,197 :: 		case 1' S4 S3 S2 S1 = 0 0 0 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea97
;robotmultifuncional.mbas,198 :: 		set_motor( (speed div 2), -(speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,199 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea98:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea98
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea98
	NOP
	NOP
;robotmultifuncional.mbas,200 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea97:
;robotmultifuncional.mbas,201 :: 		case 2' S4 S3 S2 S1 = 0 0 1 0
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea101
;robotmultifuncional.mbas,202 :: 		set_motor( (speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,203 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea102:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea102
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea102
	NOP
	NOP
;robotmultifuncional.mbas,204 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea101:
;robotmultifuncional.mbas,205 :: 		case 3' S4 S3 S2 S1 = 0 0 1 1      4
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea105
;robotmultifuncional.mbas,206 :: 		set_motor( (speed div 2), -(speed div 2) )
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,207 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea106:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea106
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea106
	NOP
	NOP
;robotmultifuncional.mbas,208 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea107:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea107
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea107
	NOP
	NOP
;robotmultifuncional.mbas,209 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea105:
;robotmultifuncional.mbas,210 :: 		case 4' S4 S3 S2 S1 = 0 1 0 0
	MOVF       _sensores+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea110
;robotmultifuncional.mbas,211 :: 		SET_MOTOR(-(speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,212 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea111:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea111
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea111
	NOP
	NOP
;robotmultifuncional.mbas,213 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea110:
;robotmultifuncional.mbas,214 :: 		case 5' S4 S3 S2 S1 = 0 1 0 1
	MOVF       _sensores+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea114
;robotmultifuncional.mbas,215 :: 		set_motor((speed div 2), -(speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,216 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea115:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea115
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea115
	NOP
	NOP
;robotmultifuncional.mbas,217 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea114:
;robotmultifuncional.mbas,218 :: 		case 6' S4 S3 S2 S1 = 0 1 1 0    4
	MOVF       _sensores+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea118
;robotmultifuncional.mbas,219 :: 		set_motor(-(speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,220 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea119:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea119
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea119
	NOP
	NOP
;robotmultifuncional.mbas,221 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea118:
;robotmultifuncional.mbas,222 :: 		case 7' S4 S3 S2 S1 = 0 1 1 1
	MOVF       _sensores+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea122
;robotmultifuncional.mbas,223 :: 		set_motor( (speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,224 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea123:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea123
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea123
	NOP
	NOP
;robotmultifuncional.mbas,225 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea122:
;robotmultifuncional.mbas,226 :: 		case 8' S4 S3 S2 S1 = 1 0 0 0
	MOVF       _sensores+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea126
;robotmultifuncional.mbas,227 :: 		set_motor( speed, speed)
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,228 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea127:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea127
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea127
	NOP
	NOP
;robotmultifuncional.mbas,229 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea128:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea128
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea128
	NOP
	NOP
;robotmultifuncional.mbas,230 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea126:
;robotmultifuncional.mbas,231 :: 		case 9' S4 S3 S2 S1 = 1 0 0 1    x
	MOVF       _sensores+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea131
;robotmultifuncional.mbas,232 :: 		set_motor( (speed div 2), -(speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,233 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea132:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea132
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea132
	NOP
	NOP
;robotmultifuncional.mbas,234 :: 		banda = 0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea131:
;robotmultifuncional.mbas,235 :: 		case 10'S4 S3 S2 S1 = 1 0 1 0   x
	MOVF       _sensores+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea135
;robotmultifuncional.mbas,236 :: 		set_motor( speed , speed )
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor1+0
	CLRF       FARG_set_motor_motor1+1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      FARG_set_motor_motor2+0
	CLRF       FARG_set_motor_motor2+1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,237 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea136:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea136
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea136
	NOP
	NOP
;robotmultifuncional.mbas,238 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea137:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea137
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea137
	NOP
	NOP
;robotmultifuncional.mbas,239 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea135:
;robotmultifuncional.mbas,240 :: 		case 11'S4 S3 S2 S1 = 1 0 1 1   x    4
	MOVF       _sensores+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea140
;robotmultifuncional.mbas,241 :: 		set_motor((speed div 2), -(speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor2+1
	SUBWF      FARG_set_motor_motor2+1, 1
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,242 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea141:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea141
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea141
	NOP
	NOP
;robotmultifuncional.mbas,243 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea140:
;robotmultifuncional.mbas,244 :: 		case 12'S4 S3 S2 S1 = 1 1 0 0    x
	MOVF       _sensores+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea144
;robotmultifuncional.mbas,245 :: 		set_motor(-(speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,246 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea145:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea145
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea145
	NOP
	NOP
;robotmultifuncional.mbas,247 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea144:
;robotmultifuncional.mbas,248 :: 		case 13'S4 S3 S2 S1 = 1 1 0 1    x
	MOVF       _sensores+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea148
;robotmultifuncional.mbas,249 :: 		set_motor((speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,250 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea149:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea149
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea149
	NOP
	NOP
;robotmultifuncional.mbas,251 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea148:
;robotmultifuncional.mbas,252 :: 		case 14'S4 S3 S2 S1 = 1 1 1 0    x  2
	MOVF       _sensores+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea152
;robotmultifuncional.mbas,253 :: 		set_motor(-(speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motor_motor1+1
	SUBWF      FARG_set_motor_motor1+1, 1
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,254 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea153:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea153
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea153
	NOP
	NOP
;robotmultifuncional.mbas,255 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea152:
;robotmultifuncional.mbas,256 :: 		case 15'S4 S3 S2 S1 = 1 1 1 1    x
	MOVF       _sensores+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_robotmultifuncional_seguidor_linea156
;robotmultifuncional.mbas,257 :: 		set_motor( (speed div 2), (speed div 2))
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor1+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor1+1
	RRF        FARG_set_motor_motor1+1, 1
	RRF        FARG_set_motor_motor1+0, 1
	BCF        FARG_set_motor_motor1+1, 7
	BTFSC      FARG_set_motor_motor1+1, 6
	BSF        FARG_set_motor_motor1+1, 7
	MOVF       FARG_seguidor_linea_speed+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R1+0, 0
	MOVWF      FARG_set_motor_motor2+0
	MOVF       R1+1, 0
	MOVWF      FARG_set_motor_motor2+1
	RRF        FARG_set_motor_motor2+1, 1
	RRF        FARG_set_motor_motor2+0, 1
	BCF        FARG_set_motor_motor2+1, 7
	BTFSC      FARG_set_motor_motor2+1, 6
	BSF        FARG_set_motor_motor2+1, 7
	CALL       robotmultifuncional_set_motor+0
;robotmultifuncional.mbas,258 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robotmultifuncional_seguidor_linea157:
	DECFSZ     R13+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea157
	DECFSZ     R12+0, 1
	GOTO       L_robotmultifuncional_seguidor_linea157
	NOP
	NOP
;robotmultifuncional.mbas,259 :: 		banda=0
	CLRF       _banda+0
	GOTO       L_robotmultifuncional_seguidor_linea81
L_robotmultifuncional_seguidor_linea156:
L_robotmultifuncional_seguidor_linea81:
;robotmultifuncional.mbas,260 :: 		end select
	RETURN
; end of robotmultifuncional_seguidor_linea

_main:

;robotmultifuncional.mbas,263 :: 		main:
;robotmultifuncional.mbas,264 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;robotmultifuncional.mbas,265 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robotmultifuncional.mbas,267 :: 		TRISA = 0x01
	MOVLW      1
	MOVWF      TRISA+0
;robotmultifuncional.mbas,268 :: 		PORTA = 0x00
	CLRF       PORTA+0
;robotmultifuncional.mbas,270 :: 		TRISB = 0x35
	MOVLW      53
	MOVWF      TRISB+0
;robotmultifuncional.mbas,271 :: 		PORTB = 0X00
	CLRF       PORTB+0
;robotmultifuncional.mbas,273 :: 		TRISC = 0xF0
	MOVLW      240
	MOVWF      TRISC+0
;robotmultifuncional.mbas,274 :: 		PORTC = 0X00
	CLRF       PORTC+0
;robotmultifuncional.mbas,276 :: 		TRISE = 0x08
	MOVLW      8
	MOVWF      TRISE+0
;robotmultifuncional.mbas,277 :: 		PORTE = 0x08
	MOVLW      8
	MOVWF      PORTE+0
;robotmultifuncional.mbas,279 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;robotmultifuncional.mbas,280 :: 		ANSELH = 0X28
	MOVLW      40
	MOVWF      ANSELH+0
;robotmultifuncional.mbas,282 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__main159:
	DECFSZ     R13+0, 1
	GOTO       L__main159
	DECFSZ     R12+0, 1
	GOTO       L__main159
	DECFSZ     R11+0, 1
	GOTO       L__main159
	NOP
	NOP
;robotmultifuncional.mbas,284 :: 		PWM1_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robotmultifuncional.mbas,285 :: 		PWM1_Set_Duty(0x00)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotmultifuncional.mbas,286 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robotmultifuncional.mbas,288 :: 		PWM2_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robotmultifuncional.mbas,289 :: 		PWM2_Set_Duty(0x00)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robotmultifuncional.mbas,290 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robotmultifuncional.mbas,292 :: 		Delay_ms(250)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L__main160:
	DECFSZ     R13+0, 1
	GOTO       L__main160
	DECFSZ     R12+0, 1
	GOTO       L__main160
	DECFSZ     R11+0, 1
	GOTO       L__main160
	NOP
	NOP
;robotmultifuncional.mbas,294 :: 		temp_ldr1 = 0
	CLRF       _temp_ldr1+0
	CLRF       _temp_ldr1+1
;robotmultifuncional.mbas,295 :: 		temp_ldr2 = 0
	CLRF       _temp_ldr2+0
	CLRF       _temp_ldr2+1
;robotmultifuncional.mbas,296 :: 		banda = 0
	CLRF       _banda+0
;robotmultifuncional.mbas,298 :: 		for i=0 to 63
	CLRF       _i+0
L__main162:
;robotmultifuncional.mbas,299 :: 		temp_ldr1 = temp_ldr1 + Adc_Read(13)
	MOVLW      13
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	ADDWF      _temp_ldr1+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _temp_ldr1+1, 1
;robotmultifuncional.mbas,300 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main166:
	DECFSZ     R13+0, 1
	GOTO       L__main166
	DECFSZ     R12+0, 1
	GOTO       L__main166
	NOP
	NOP
;robotmultifuncional.mbas,301 :: 		temp_ldr2 = temp_ldr2 + Adc_Read(11)
	MOVLW      11
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	ADDWF      _temp_ldr2+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _temp_ldr2+1, 1
;robotmultifuncional.mbas,302 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main167:
	DECFSZ     R13+0, 1
	GOTO       L__main167
	DECFSZ     R12+0, 1
	GOTO       L__main167
	NOP
	NOP
;robotmultifuncional.mbas,303 :: 		next i
	MOVF       _i+0, 0
	XORLW      63
	BTFSC      STATUS+0, 2
	GOTO       L__main165
	INCF       _i+0, 1
	GOTO       L__main162
L__main165:
;robotmultifuncional.mbas,305 :: 		adc_ldr1 = temp_ldr1 div 64
	MOVLW      6
	MOVWF      R0+0
	MOVF       _temp_ldr1+0, 0
	MOVWF      _adc_ldr1+0
	MOVF       _temp_ldr1+1, 0
	MOVWF      _adc_ldr1+1
	MOVF       R0+0, 0
L__main206:
	BTFSC      STATUS+0, 2
	GOTO       L__main207
	RRF        _adc_ldr1+1, 1
	RRF        _adc_ldr1+0, 1
	BCF        _adc_ldr1+1, 7
	ADDLW      255
	GOTO       L__main206
L__main207:
;robotmultifuncional.mbas,306 :: 		adc_ldr2 = temp_ldr2 div 64
	MOVLW      6
	MOVWF      R0+0
	MOVF       _temp_ldr2+0, 0
	MOVWF      _adc_ldr2+0
	MOVF       _temp_ldr2+1, 0
	MOVWF      _adc_ldr2+1
	MOVF       R0+0, 0
L__main208:
	BTFSC      STATUS+0, 2
	GOTO       L__main209
	RRF        _adc_ldr2+1, 1
	RRF        _adc_ldr2+0, 1
	BCF        _adc_ldr2+1, 7
	ADDLW      255
	GOTO       L__main208
L__main209:
;robotmultifuncional.mbas,308 :: 		adc_ldr1 = adc_ldr1 + 0X0F
	MOVLW      15
	ADDWF      _adc_ldr1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _adc_ldr1+1, 1
;robotmultifuncional.mbas,309 :: 		adc_ldr2 = adc_ldr2 + 0X0F
	MOVLW      15
	ADDWF      _adc_ldr2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _adc_ldr2+1, 1
;robotmultifuncional.mbas,311 :: 		while 1
L__main169:
;robotmultifuncional.mbas,312 :: 		velocidad = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _velocidad+0
;robotmultifuncional.mbas,314 :: 		if button(PORTE, 3, 1, 1) then
	MOVLW      PORTE+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time+0
	MOVLW      1
	MOVWF      FARG_Button_activeState+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main174
;robotmultifuncional.mbas,315 :: 		old_state = 0xFF
	MOVLW      255
	MOVWF      _old_state+0
L__main174:
;robotmultifuncional.mbas,318 :: 		if button(PORTE, 3, 1, 0) and old_state then
	MOVLW      PORTE+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time+0
	CLRF       FARG_Button_activeState+0
	CALL       _Button+0
	MOVF       _old_state+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main177
;robotmultifuncional.mbas,319 :: 		old_state = 0x00
	CLRF       _old_state+0
;robotmultifuncional.mbas,320 :: 		inc(modo)
	INCF       _modo+0, 1
L__main177:
;robotmultifuncional.mbas,324 :: 		case 1
	MOVF       _modo+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main182
;robotmultifuncional.mbas,325 :: 		PORTB.7 = 1
	BSF        PORTB+0, 7
;robotmultifuncional.mbas,326 :: 		PORTB.6 = 0
	BCF        PORTB+0, 6
;robotmultifuncional.mbas,327 :: 		seguidor_luz( velocidad )
	MOVF       _velocidad+0, 0
	MOVWF      FARG_seguidor_luz_speed+0
	CALL       robotmultifuncional_seguidor_luz+0
;robotmultifuncional.mbas,328 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main183:
	DECFSZ     R13+0, 1
	GOTO       L__main183
	DECFSZ     R12+0, 1
	GOTO       L__main183
	NOP
	NOP
	GOTO       L__main179
L__main182:
;robotmultifuncional.mbas,329 :: 		case 2
	MOVF       _modo+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main186
;robotmultifuncional.mbas,330 :: 		PORTB.7 = 0
	BCF        PORTB+0, 7
;robotmultifuncional.mbas,331 :: 		PORTB.6 = 1
	BSF        PORTB+0, 6
;robotmultifuncional.mbas,332 :: 		seguidor_linea( velocidad )
	MOVF       _velocidad+0, 0
	MOVWF      FARG_seguidor_linea_speed+0
	CALL       robotmultifuncional_seguidor_linea+0
;robotmultifuncional.mbas,333 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main187:
	DECFSZ     R13+0, 1
	GOTO       L__main187
	DECFSZ     R12+0, 1
	GOTO       L__main187
	NOP
	NOP
	GOTO       L__main179
L__main186:
;robotmultifuncional.mbas,335 :: 		PORTB.7 = 1
	BSF        PORTB+0, 7
;robotmultifuncional.mbas,336 :: 		PORTB.6 = 1
	BSF        PORTB+0, 6
;robotmultifuncional.mbas,337 :: 		seguidor_ultrasonico( 30 , velocidad )
	MOVLW      30
	MOVWF      FARG_seguidor_ultrasonico_distance+0
	MOVF       _velocidad+0, 0
	MOVWF      FARG_seguidor_ultrasonico_speed+0
	CALL       robotmultifuncional_seguidor_ultrasonico+0
;robotmultifuncional.mbas,338 :: 		modo = 0
	CLRF       _modo+0
L__main179:
;robotmultifuncional.mbas,340 :: 		wend
	GOTO       L__main169
	GOTO       $+0
; end of _main
