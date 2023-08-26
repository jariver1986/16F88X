
robotina_ADELANTE:

;robotina.mbas,16 :: 		sub procedure ADELANTE()
;robotina.mbas,17 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robotina.mbas,18 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robotina.mbas,19 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robotina.mbas,20 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robotina.mbas,21 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotina.mbas,22 :: 		PWM2_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotina_ADELANTE

robotina_ATRAS:

;robotina.mbas,24 :: 		sub procedure ATRAS()
;robotina.mbas,25 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robotina.mbas,26 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robotina.mbas,27 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robotina.mbas,28 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robotina.mbas,29 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotina.mbas,30 :: 		PWM2_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotina_ATRAS

robotina_PARAR:

;robotina.mbas,32 :: 		sub procedure PARAR()
;robotina.mbas,33 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robotina.mbas,34 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robotina.mbas,35 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robotina.mbas,36 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robotina.mbas,37 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotina.mbas,38 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotina_PARAR

robotina_GIRO_IZQUIERDA:

;robotina.mbas,40 :: 		sub procedure GIRO_IZQUIERDA()
;robotina.mbas,41 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;robotina.mbas,42 :: 		PORTA.RA4 = 0
	BCF        PORTA+0, 4
;robotina.mbas,43 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;robotina.mbas,44 :: 		PORTA.RA5 = 0
	BCF        PORTA+0, 5
;robotina.mbas,45 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotina.mbas,46 :: 		PWM2_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotina_GIRO_IZQUIERDA

robotina_GIRO_DERECHA:

;robotina.mbas,48 :: 		sub procedure GIRO_DERECHA()
;robotina.mbas,49 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;robotina.mbas,50 :: 		PORTA.RA4 = 1
	BSF        PORTA+0, 4
;robotina.mbas,51 :: 		PORTA.RA3 = 0
	BCF        PORTA+0, 3
;robotina.mbas,52 :: 		PORTA.RA5 = 1
	BSF        PORTA+0, 5
;robotina.mbas,53 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robotina.mbas,54 :: 		PWM2_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robotina_GIRO_DERECHA

robotina_ultrasonico1:

;robotina.mbas,58 :: 		dim distan,tiempo as word
;robotina.mbas,59 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robotina.mbas,60 :: 		disparo1 = 1
	BSF        PORTB+0, 4
;robotina.mbas,61 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robotina_ultrasonico16:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico16
;robotina.mbas,62 :: 		disparo1 = 0
	BCF        PORTB+0, 4
;robotina.mbas,63 :: 		DO
L_robotina_ultrasonico17:
;robotina.mbas,64 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 4
	GOTO       L_robotina_ultrasonico113
;robotina.mbas,65 :: 		TMR0 = 0
	CLRF       TMR0+0
;robotina.mbas,66 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robotina_ultrasonico113:
;robotina.mbas,68 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico110
	GOTO       L_robotina_ultrasonico17
L_robotina_ultrasonico110:
;robotina.mbas,69 :: 		DO
L_robotina_ultrasonico115:
;robotina.mbas,70 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 4
	GOTO       L_robotina_ultrasonico121
;robotina.mbas,71 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robotina.mbas,72 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robotina_ultrasonico121:
;robotina.mbas,74 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_ultrasonico124
;robotina.mbas,75 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robotina_ultrasonico124:
;robotina.mbas,77 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico118
	GOTO       L_robotina_ultrasonico115
L_robotina_ultrasonico118:
;robotina.mbas,78 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotina_ultrasonico1122:
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico1123
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotina_ultrasonico1122
L_robotina_ultrasonico1123:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robotina.mbas,79 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robotina_ultrasonico126:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico126
	DECFSZ     R12+0, 1
	GOTO       L_robotina_ultrasonico126
	NOP
	NOP
;robotina.mbas,80 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotina_ultrasonico1

robotina_ultrasonico2:

;robotina.mbas,84 :: 		dim distan,tiempo as word
;robotina.mbas,85 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;robotina.mbas,86 :: 		disparo2 = 1
	BSF        PORTB+0, 5
;robotina.mbas,87 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robotina_ultrasonico228:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico228
;robotina.mbas,88 :: 		disparo2 = 0
	BCF        PORTB+0, 5
;robotina.mbas,89 :: 		DO
L_robotina_ultrasonico229:
;robotina.mbas,90 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTC+0, 5
	GOTO       L_robotina_ultrasonico235
;robotina.mbas,91 :: 		TMR0 = 0
	CLRF       TMR0+0
;robotina.mbas,92 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_robotina_ultrasonico235:
;robotina.mbas,94 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico232
	GOTO       L_robotina_ultrasonico229
L_robotina_ultrasonico232:
;robotina.mbas,95 :: 		DO
L_robotina_ultrasonico237:
;robotina.mbas,96 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTC+0, 5
	GOTO       L_robotina_ultrasonico243
;robotina.mbas,97 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;robotina.mbas,98 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_robotina_ultrasonico243:
;robotina.mbas,100 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_ultrasonico246
;robotina.mbas,101 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_robotina_ultrasonico246:
;robotina.mbas,103 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico240
	GOTO       L_robotina_ultrasonico237
L_robotina_ultrasonico240:
;robotina.mbas,104 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotina_ultrasonico2124:
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico2125
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotina_ultrasonico2124
L_robotina_ultrasonico2125:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;robotina.mbas,105 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robotina_ultrasonico248:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico248
	DECFSZ     R12+0, 1
	GOTO       L_robotina_ultrasonico248
	NOP
	NOP
;robotina.mbas,106 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotina_ultrasonico2

robotina_ultrasonico3:

;robotina.mbas,110 :: 		dim distan,tiempo as word
;robotina.mbas,111 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
;robotina.mbas,112 :: 		disparo3 = 1
	BSF        PORTB+0, 6
;robotina.mbas,113 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robotina_ultrasonico350:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico350
;robotina.mbas,114 :: 		disparo3 = 0
	BCF        PORTB+0, 6
;robotina.mbas,115 :: 		DO
L_robotina_ultrasonico351:
;robotina.mbas,116 :: 		IF( eco3 = 1 )THEN
	BTFSS      PORTC+0, 6
	GOTO       L_robotina_ultrasonico357
;robotina.mbas,117 :: 		TMR0 = 0
	CLRF       TMR0+0
;robotina.mbas,118 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico3_flanco+0
L_robotina_ultrasonico357:
;robotina.mbas,120 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico354
	GOTO       L_robotina_ultrasonico351
L_robotina_ultrasonico354:
;robotina.mbas,121 :: 		DO
L_robotina_ultrasonico359:
;robotina.mbas,122 :: 		IF( eco3 = 0 )THEN
	BTFSC      PORTC+0, 6
	GOTO       L_robotina_ultrasonico365
;robotina.mbas,123 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico3_tiempo+0
	CLRF       ultrasonico3_tiempo+1
;robotina.mbas,124 :: 		flanco = 0
	CLRF       ultrasonico3_flanco+0
L_robotina_ultrasonico365:
;robotina.mbas,126 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_ultrasonico368
;robotina.mbas,127 :: 		FLANCO=0
	CLRF       ultrasonico3_flanco+0
L_robotina_ultrasonico368:
;robotina.mbas,129 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico3_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico362
	GOTO       L_robotina_ultrasonico359
L_robotina_ultrasonico362:
;robotina.mbas,130 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico3_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotina_ultrasonico3126:
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico3127
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotina_ultrasonico3126
L_robotina_ultrasonico3127:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico3_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico3_distan+1
;robotina.mbas,131 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robotina_ultrasonico370:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico370
	DECFSZ     R12+0, 1
	GOTO       L_robotina_ultrasonico370
	NOP
	NOP
;robotina.mbas,132 :: 		result = distan
	MOVF       ultrasonico3_distan+0, 0
	MOVWF      ultrasonico3_local_result+0
	MOVF       ultrasonico3_distan+1, 0
	MOVWF      ultrasonico3_local_result+1
	MOVF       ultrasonico3_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico3_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotina_ultrasonico3

robotina_ultrasonico4:

;robotina.mbas,136 :: 		dim distan,tiempo as word
;robotina.mbas,137 :: 		flanco = 0
	CLRF       ultrasonico4_flanco+0
;robotina.mbas,138 :: 		disparo4 = 1
	BSF        PORTB+0, 7
;robotina.mbas,139 :: 		Delay_us(50)
	MOVLW      33
	MOVWF      R13+0
L_robotina_ultrasonico472:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico472
;robotina.mbas,140 :: 		disparo4 = 0
	BCF        PORTB+0, 7
;robotina.mbas,141 :: 		DO
L_robotina_ultrasonico473:
;robotina.mbas,142 :: 		IF( eco4 = 1 )THEN
	BTFSS      PORTC+0, 7
	GOTO       L_robotina_ultrasonico479
;robotina.mbas,143 :: 		TMR0 = 0
	CLRF       TMR0+0
;robotina.mbas,144 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico4_flanco+0
L_robotina_ultrasonico479:
;robotina.mbas,146 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico4_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico476
	GOTO       L_robotina_ultrasonico473
L_robotina_ultrasonico476:
;robotina.mbas,147 :: 		DO
L_robotina_ultrasonico481:
;robotina.mbas,148 :: 		IF( eco4 = 0 )THEN
	BTFSC      PORTC+0, 7
	GOTO       L_robotina_ultrasonico487
;robotina.mbas,149 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico4_tiempo+0
	CLRF       ultrasonico4_tiempo+1
;robotina.mbas,150 :: 		flanco = 0
	CLRF       ultrasonico4_flanco+0
L_robotina_ultrasonico487:
;robotina.mbas,152 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_ultrasonico490
;robotina.mbas,153 :: 		FLANCO=0
	CLRF       ultrasonico4_flanco+0
L_robotina_ultrasonico490:
;robotina.mbas,155 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico4_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico484
	GOTO       L_robotina_ultrasonico481
L_robotina_ultrasonico484:
;robotina.mbas,156 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico4_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico4_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robotina_ultrasonico4128:
	BTFSC      STATUS+0, 2
	GOTO       L_robotina_ultrasonico4129
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robotina_ultrasonico4128
L_robotina_ultrasonico4129:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico4_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico4_distan+1
;robotina.mbas,157 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_robotina_ultrasonico492:
	DECFSZ     R13+0, 1
	GOTO       L_robotina_ultrasonico492
	DECFSZ     R12+0, 1
	GOTO       L_robotina_ultrasonico492
	NOP
	NOP
;robotina.mbas,158 :: 		result = distan
	MOVF       ultrasonico4_distan+0, 0
	MOVWF      ultrasonico4_local_result+0
	MOVF       ultrasonico4_distan+1, 0
	MOVWF      ultrasonico4_local_result+1
	MOVF       ultrasonico4_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico4_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robotina_ultrasonico4

robotina_BUZZER:

;robotina.mbas,160 :: 		sub procedure BUZZER
;robotina.mbas,163 :: 		contador=800
	MOVLW      32
	MOVWF      _contador+0
	MOVLW      3
	MOVWF      _contador+1
;robotina.mbas,164 :: 		while (contador<1200)
L_robotina_BUZZER95:
	MOVLW      4
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robotina_BUZZER130
	MOVLW      176
	SUBWF      _contador+0, 0
L_robotina_BUZZER130:
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_BUZZER96
;robotina.mbas,165 :: 		Sound_Play(contador,50)
	MOVF       _contador+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       _contador+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      50
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;robotina.mbas,166 :: 		contador = contador +100
	MOVLW      100
	ADDWF      _contador+0, 1
	BTFSC      STATUS+0, 0
	INCF       _contador+1, 1
;robotina.mbas,167 :: 		wend
	GOTO       L_robotina_BUZZER95
L_robotina_BUZZER96:
;robotina.mbas,168 :: 		while (contador>800)
L_robotina_BUZZER100:
	MOVF       _contador+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robotina_BUZZER131
	MOVF       _contador+0, 0
	SUBLW      32
L_robotina_BUZZER131:
	BTFSC      STATUS+0, 0
	GOTO       L_robotina_BUZZER101
;robotina.mbas,169 :: 		Sound_Play(contador,50)
	MOVF       _contador+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       _contador+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      50
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;robotina.mbas,170 :: 		contador = contador -100
	MOVLW      100
	SUBWF      _contador+0, 1
	BTFSS      STATUS+0, 0
	DECF       _contador+1, 1
;robotina.mbas,171 :: 		wend
	GOTO       L_robotina_BUZZER100
L_robotina_BUZZER101:
	RETURN
; end of robotina_BUZZER

_main:

;robotina.mbas,174 :: 		main:
;robotina.mbas,175 :: 		OPTION_REG=0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robotina.mbas,176 :: 		OSCCON  = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;robotina.mbas,177 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;robotina.mbas,178 :: 		TRISA   = %00000000
	CLRF       TRISA+0
;robotina.mbas,179 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;robotina.mbas,180 :: 		TRISB   = %00000000
	CLRF       TRISB+0
;robotina.mbas,181 :: 		PORTC   = %00000000
	CLRF       PORTC+0
;robotina.mbas,182 :: 		TRISC   = %11110000
	MOVLW      240
	MOVWF      TRISC+0
;robotina.mbas,183 :: 		PORTE   = %00000000
	CLRF       PORTE+0
;robotina.mbas,184 :: 		TRISE   = %10000000
	MOVLW      128
	MOVWF      TRISE+0
;robotina.mbas,185 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;robotina.mbas,186 :: 		ANSELH  = %00010000
	MOVLW      16
	MOVWF      ANSELH+0
;robotina.mbas,187 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robotina.mbas,188 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robotina.mbas,189 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robotina.mbas,190 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robotina.mbas,191 :: 		Sound_Init(porta,0)
	MOVLW      PORTA+0
	MOVWF      FARG_Sound_Init_snd_port+0
	CLRF       FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;robotina.mbas,192 :: 		while 1
L__main106:
;robotina.mbas,193 :: 		distancia1=ultrasonico1()
	CALL       robotina_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;robotina.mbas,194 :: 		distancia2=ultrasonico2()
	CALL       robotina_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _distancia2+0
	MOVF       R0+1, 0
	MOVWF      _distancia2+1
;robotina.mbas,195 :: 		distancia3=ultrasonico3()
	CALL       robotina_ultrasonico3+0
	MOVF       R0+0, 0
	MOVWF      _distancia3+0
	MOVF       R0+1, 0
	MOVWF      _distancia3+1
;robotina.mbas,196 :: 		distancia4=ultrasonico4()
	CALL       robotina_ultrasonico4+0
	MOVF       R0+0, 0
	MOVWF      _distancia4+0
	MOVF       R0+1, 0
	MOVWF      _distancia4+1
;robotina.mbas,197 :: 		if distancia1<30 then
	MOVLW      0
	SUBWF      _distancia1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main132
	MOVLW      30
	SUBWF      _distancia1+0, 0
L__main132:
	BTFSC      STATUS+0, 0
	GOTO       L__main111
;robotina.mbas,198 :: 		BUZZER
	CALL       robotina_BUZZER+0
;robotina.mbas,199 :: 		ATRAS
	CALL       robotina_ATRAS+0
	GOTO       L__main112
;robotina.mbas,200 :: 		else
L__main111:
;robotina.mbas,201 :: 		if distancia2<30 then
	MOVLW      0
	SUBWF      _distancia2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main133
	MOVLW      30
	SUBWF      _distancia2+0, 0
L__main133:
	BTFSC      STATUS+0, 0
	GOTO       L__main114
;robotina.mbas,202 :: 		BUZZER
	CALL       robotina_BUZZER+0
;robotina.mbas,203 :: 		ADELANTE
	CALL       robotina_ADELANTE+0
	GOTO       L__main115
;robotina.mbas,204 :: 		else
L__main114:
;robotina.mbas,205 :: 		if distancia3<30 then
	MOVLW      0
	SUBWF      _distancia3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main134
	MOVLW      30
	SUBWF      _distancia3+0, 0
L__main134:
	BTFSC      STATUS+0, 0
	GOTO       L__main117
;robotina.mbas,206 :: 		GIRO_IZQUIERDA
	CALL       robotina_GIRO_IZQUIERDA+0
	GOTO       L__main118
;robotina.mbas,207 :: 		else
L__main117:
;robotina.mbas,208 :: 		if distancia4<30 then
	MOVLW      0
	SUBWF      _distancia4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main135
	MOVLW      30
	SUBWF      _distancia4+0, 0
L__main135:
	BTFSC      STATUS+0, 0
	GOTO       L__main120
;robotina.mbas,209 :: 		GIRO_DERECHA
	CALL       robotina_GIRO_DERECHA+0
	GOTO       L__main121
;robotina.mbas,210 :: 		else
L__main120:
;robotina.mbas,211 :: 		PARAR
	CALL       robotina_PARAR+0
;robotina.mbas,212 :: 		end if
L__main121:
;robotina.mbas,213 :: 		end if
L__main118:
;robotina.mbas,214 :: 		end if
L__main115:
;robotina.mbas,215 :: 		end if
L__main112:
;robotina.mbas,216 :: 		wend
	GOTO       L__main106
	GOTO       $+0
; end of _main
