
ROBOT_LABERINTO_ultrasonico1:

;ROBOT_LABERINTO.mbas,36 :: 		dim distan,tiempo as word
;ROBOT_LABERINTO.mbas,37 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;ROBOT_LABERINTO.mbas,39 :: 		disparo1 = 1
	BSF        PORTB+0, 0
;ROBOT_LABERINTO.mbas,40 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_ROBOT_LABERINTO_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico11
	NOP
;ROBOT_LABERINTO.mbas,41 :: 		disparo1 = 0
	BCF        PORTB+0, 0
;ROBOT_LABERINTO.mbas,43 :: 		DO
L_ROBOT_LABERINTO_ultrasonico12:
;ROBOT_LABERINTO.mbas,44 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTB+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico18
;ROBOT_LABERINTO.mbas,45 :: 		TMR0 = 0
	CLRF       TMR0+0
;ROBOT_LABERINTO.mbas,46 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_ROBOT_LABERINTO_ultrasonico18:
;ROBOT_LABERINTO.mbas,48 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico15
	GOTO       L_ROBOT_LABERINTO_ultrasonico12
L_ROBOT_LABERINTO_ultrasonico15:
;ROBOT_LABERINTO.mbas,50 :: 		DO
L_ROBOT_LABERINTO_ultrasonico110:
;ROBOT_LABERINTO.mbas,51 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico116
;ROBOT_LABERINTO.mbas,52 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;ROBOT_LABERINTO.mbas,53 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_ROBOT_LABERINTO_ultrasonico116:
;ROBOT_LABERINTO.mbas,55 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_ROBOT_LABERINTO_ultrasonico119
;ROBOT_LABERINTO.mbas,56 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_ROBOT_LABERINTO_ultrasonico119:
;ROBOT_LABERINTO.mbas,58 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico113
	GOTO       L_ROBOT_LABERINTO_ultrasonico110
L_ROBOT_LABERINTO_ultrasonico113:
;ROBOT_LABERINTO.mbas,60 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_ROBOT_LABERINTO_ultrasonico176:
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico177
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_ROBOT_LABERINTO_ultrasonico176
L_ROBOT_LABERINTO_ultrasonico177:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;ROBOT_LABERINTO.mbas,61 :: 		Delay_ms (5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_ROBOT_LABERINTO_ultrasonico121:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico121
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico121
;ROBOT_LABERINTO.mbas,62 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of ROBOT_LABERINTO_ultrasonico1

ROBOT_LABERINTO_ultrasonico2:

;ROBOT_LABERINTO.mbas,66 :: 		dim distan,tiempo as word
;ROBOT_LABERINTO.mbas,68 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;ROBOT_LABERINTO.mbas,70 :: 		disparo2 = 1
	BSF        PORTB+0, 2
;ROBOT_LABERINTO.mbas,71 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_ROBOT_LABERINTO_ultrasonico223:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico223
	NOP
;ROBOT_LABERINTO.mbas,72 :: 		disparo2 = 0
	BCF        PORTB+0, 2
;ROBOT_LABERINTO.mbas,74 :: 		DO
L_ROBOT_LABERINTO_ultrasonico224:
;ROBOT_LABERINTO.mbas,75 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTB+0, 3
	GOTO       L_ROBOT_LABERINTO_ultrasonico230
;ROBOT_LABERINTO.mbas,76 :: 		TMR0 = 0
	CLRF       TMR0+0
;ROBOT_LABERINTO.mbas,77 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_ROBOT_LABERINTO_ultrasonico230:
;ROBOT_LABERINTO.mbas,79 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico227
	GOTO       L_ROBOT_LABERINTO_ultrasonico224
L_ROBOT_LABERINTO_ultrasonico227:
;ROBOT_LABERINTO.mbas,81 :: 		DO
L_ROBOT_LABERINTO_ultrasonico232:
;ROBOT_LABERINTO.mbas,82 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTB+0, 3
	GOTO       L_ROBOT_LABERINTO_ultrasonico238
;ROBOT_LABERINTO.mbas,83 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;ROBOT_LABERINTO.mbas,84 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_ROBOT_LABERINTO_ultrasonico238:
;ROBOT_LABERINTO.mbas,86 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_ROBOT_LABERINTO_ultrasonico241
;ROBOT_LABERINTO.mbas,87 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_ROBOT_LABERINTO_ultrasonico241:
;ROBOT_LABERINTO.mbas,89 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico235
	GOTO       L_ROBOT_LABERINTO_ultrasonico232
L_ROBOT_LABERINTO_ultrasonico235:
;ROBOT_LABERINTO.mbas,91 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_ROBOT_LABERINTO_ultrasonico278:
	BTFSC      STATUS+0, 2
	GOTO       L_ROBOT_LABERINTO_ultrasonico279
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_ROBOT_LABERINTO_ultrasonico278
L_ROBOT_LABERINTO_ultrasonico279:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;ROBOT_LABERINTO.mbas,92 :: 		Delay_ms (5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_ROBOT_LABERINTO_ultrasonico243:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico243
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_ultrasonico243
;ROBOT_LABERINTO.mbas,93 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of ROBOT_LABERINTO_ultrasonico2

ROBOT_LABERINTO_adelante:

;ROBOT_LABERINTO.mbas,128 :: 		sub procedure adelante()
;ROBOT_LABERINTO.mbas,131 :: 		DIR1 =  1
	BSF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,132 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,134 :: 		DIR2 =  1
	BSF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,135 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of ROBOT_LABERINTO_adelante

ROBOT_LABERINTO_atras:

;ROBOT_LABERINTO.mbas,138 :: 		sub procedure atras()
;ROBOT_LABERINTO.mbas,140 :: 		DIR1 =  0
	BCF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,141 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,143 :: 		DIR2 =  0
	BCF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,144 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;ROBOT_LABERINTO.mbas,146 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_ROBOT_LABERINTO_atras46:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_atras46
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_atras46
	NOP
	NOP
	RETURN
; end of ROBOT_LABERINTO_atras

ROBOT_LABERINTO_parar:

;ROBOT_LABERINTO.mbas,148 :: 		sub procedure parar()
;ROBOT_LABERINTO.mbas,150 :: 		DIR1 = 0
	BCF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,151 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,153 :: 		DIR2 = 0
	BCF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,154 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;ROBOT_LABERINTO.mbas,156 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ROBOT_LABERINTO_parar48:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_parar48
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_parar48
	NOP
	NOP
	RETURN
; end of ROBOT_LABERINTO_parar

ROBOT_LABERINTO_izquierda:

;ROBOT_LABERINTO.mbas,160 :: 		sub procedure izquierda()
;ROBOT_LABERINTO.mbas,161 :: 		DIR1 =  1
	BSF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,162 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,164 :: 		DIR2 =  0
	BCF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,165 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;ROBOT_LABERINTO.mbas,167 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ROBOT_LABERINTO_izquierda50:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_izquierda50
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_izquierda50
	NOP
	NOP
;ROBOT_LABERINTO.mbas,168 :: 		DIR1 =  1
	BSF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,169 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,171 :: 		DIR2 =  1
	BSF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,172 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;ROBOT_LABERINTO.mbas,173 :: 		Delay_ms(5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_ROBOT_LABERINTO_izquierda51:
	DECFSZ     R13+0, 1
	GOTO       L_ROBOT_LABERINTO_izquierda51
	DECFSZ     R12+0, 1
	GOTO       L_ROBOT_LABERINTO_izquierda51
	RETURN
; end of ROBOT_LABERINTO_izquierda

ROBOT_LABERINTO_derecha:

;ROBOT_LABERINTO.mbas,176 :: 		sub procedure derecha()
;ROBOT_LABERINTO.mbas,177 :: 		DIR1 =  0
	BCF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,178 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,180 :: 		DIR2 =  1
	BSF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,181 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of ROBOT_LABERINTO_derecha

ROBOT_LABERINTO_repelederecha:

;ROBOT_LABERINTO.mbas,184 :: 		sub procedure repelederecha()
;ROBOT_LABERINTO.mbas,186 :: 		DIR1 =  1
	BSF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,187 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;ROBOT_LABERINTO.mbas,189 :: 		DIR2 =  1
	BSF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,190 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of ROBOT_LABERINTO_repelederecha

ROBOT_LABERINTO_repeleizquierda:

;ROBOT_LABERINTO.mbas,193 :: 		sub procedure repeleizquierda()
;ROBOT_LABERINTO.mbas,195 :: 		DIR2 =  1
	BSF        PORTA+0, 3
;ROBOT_LABERINTO.mbas,196 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;ROBOT_LABERINTO.mbas,198 :: 		DIR1 =  0
	BCF        PORTA+0, 2
;ROBOT_LABERINTO.mbas,199 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
	RETURN
; end of ROBOT_LABERINTO_repeleizquierda

_main:

;ROBOT_LABERINTO.mbas,205 :: 		main:
;ROBOT_LABERINTO.mbas,207 :: 		OSCCON = 0X65 ' Oscilador interno de 8mhz
	MOVLW      101
	MOVWF      OSCCON+0
;ROBOT_LABERINTO.mbas,209 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;ROBOT_LABERINTO.mbas,211 :: 		TRISA = 0X01
	MOVLW      1
	MOVWF      TRISA+0
;ROBOT_LABERINTO.mbas,212 :: 		PORTA = 0x00
	CLRF       PORTA+0
;ROBOT_LABERINTO.mbas,213 :: 		TRISB = %11101010
	MOVLW      234
	MOVWF      TRISB+0
;ROBOT_LABERINTO.mbas,214 :: 		PORTB = 0X00
	CLRF       PORTB+0
;ROBOT_LABERINTO.mbas,215 :: 		TRISC = 0X00
	CLRF       TRISC+0
;ROBOT_LABERINTO.mbas,216 :: 		PORTC = 0X00
	CLRF       PORTC+0
;ROBOT_LABERINTO.mbas,217 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;ROBOT_LABERINTO.mbas,218 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;ROBOT_LABERINTO.mbas,219 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ROBOT_LABERINTO.mbas,220 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;ROBOT_LABERINTO.mbas,221 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;ROBOT_LABERINTO.mbas,222 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;ROBOT_LABERINTO.mbas,223 :: 		velocidad = ADC_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _velocidad+0
	MOVF       R0+1, 0
	MOVWF      _velocidad+1
;ROBOT_LABERINTO.mbas,224 :: 		PWM1_Set_Duty(velocidad)
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ROBOT_LABERINTO.mbas,225 :: 		PWM2_Set_Duty(velocidad)
	MOVF       _velocidad+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ROBOT_LABERINTO.mbas,226 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;ROBOT_LABERINTO.mbas,227 :: 		distancia1 = ultrasonico1()
	CALL       ROBOT_LABERINTO_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;ROBOT_LABERINTO.mbas,228 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;ROBOT_LABERINTO.mbas,229 :: 		sigue=0
	BCF        _sigue+0, BitPos(_sigue+0)
;ROBOT_LABERINTO.mbas,230 :: 		while (1)
L__main57:
;ROBOT_LABERINTO.mbas,231 :: 		velocidad = ADC_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _velocidad+0
	MOVF       R0+1, 0
	MOVWF      _velocidad+1
;ROBOT_LABERINTO.mbas,232 :: 		PWM1_Set_Duty(velocidad)
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ROBOT_LABERINTO.mbas,233 :: 		PWM2_Set_Duty(velocidad)
	MOVF       _velocidad+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ROBOT_LABERINTO.mbas,234 :: 		distancia1 = ultrasonico1()   'distancia frente
	CALL       ROBOT_LABERINTO_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;ROBOT_LABERINTO.mbas,236 :: 		distancia2 = ultrasonico2()   'distancia izquierda
	CALL       ROBOT_LABERINTO_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _distancia2+0
	MOVF       R0+1, 0
	MOVWF      _distancia2+1
;ROBOT_LABERINTO.mbas,237 :: 		if (distancia1>10) then
	MOVF       _distancia1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVF       _distancia1+0, 0
	SUBLW      10
L__main80:
	BTFSC      STATUS+0, 0
	GOTO       L__main62
;ROBOT_LABERINTO.mbas,239 :: 		distancia2 = ultrasonico2()
	CALL       ROBOT_LABERINTO_ultrasonico2+0
	MOVF       R0+0, 0
	MOVWF      _distancia2+0
	MOVF       R0+1, 0
	MOVWF      _distancia2+1
;ROBOT_LABERINTO.mbas,240 :: 		if (distancia2=5) OR (distancia2=6) OR (distancia2=7) then   'incrementa velocidad
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      5
	XORWF      R0+0, 0
L__main81:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R3+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      6
	XORWF      R0+0, 0
L__main82:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R2+0
	MOVF       R2+0, 0
	IORWF      R3+0, 1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      7
	XORWF      R0+0, 0
L__main83:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R2+0
	MOVF       R2+0, 0
	IORWF      R3+0, 0
	MOVWF      R0+0
	BTFSC      STATUS+0, 2
	GOTO       L__main65
;ROBOT_LABERINTO.mbas,241 :: 		adelante()
	CALL       ROBOT_LABERINTO_adelante+0
	GOTO       L__main66
;ROBOT_LABERINTO.mbas,242 :: 		else
L__main65:
;ROBOT_LABERINTO.mbas,243 :: 		if (distancia2<5) then   'antichoque izquierda
	MOVLW      0
	SUBWF      _distancia2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      5
	SUBWF      _distancia2+0, 0
L__main84:
	BTFSC      STATUS+0, 0
	GOTO       L__main68
;ROBOT_LABERINTO.mbas,244 :: 		repeleizquierda()
	CALL       ROBOT_LABERINTO_repeleizquierda+0
;ROBOT_LABERINTO.mbas,245 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	DECFSZ     R12+0, 1
	GOTO       L__main70
	NOP
	NOP
L__main68:
;ROBOT_LABERINTO.mbas,247 :: 		if (distancia2>=7) then   'antichoque derecha
	MOVLW      0
	SUBWF      _distancia2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      7
	SUBWF      _distancia2+0, 0
L__main85:
	BTFSS      STATUS+0, 0
	GOTO       L__main72
;ROBOT_LABERINTO.mbas,248 :: 		izquierda()
	CALL       ROBOT_LABERINTO_izquierda+0
;ROBOT_LABERINTO.mbas,249 :: 		repelederecha()
	CALL       ROBOT_LABERINTO_repelederecha+0
;ROBOT_LABERINTO.mbas,250 :: 		Delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main74:
	DECFSZ     R13+0, 1
	GOTO       L__main74
	DECFSZ     R12+0, 1
	GOTO       L__main74
	NOP
	NOP
L__main72:
;ROBOT_LABERINTO.mbas,252 :: 		adelante()                'adelante
	CALL       ROBOT_LABERINTO_adelante+0
;ROBOT_LABERINTO.mbas,253 :: 		end if
L__main66:
	GOTO       L__main63
;ROBOT_LABERINTO.mbas,254 :: 		else
L__main62:
;ROBOT_LABERINTO.mbas,255 :: 		derecha()                     'gira a la derecha
	CALL       ROBOT_LABERINTO_derecha+0
;ROBOT_LABERINTO.mbas,256 :: 		Delay_ms(50)                  'si se pega mucho a la pared
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L__main75:
	DECFSZ     R13+0, 1
	GOTO       L__main75
	DECFSZ     R12+0, 1
	GOTO       L__main75
	NOP
;ROBOT_LABERINTO.mbas,257 :: 		end if
L__main63:
;ROBOT_LABERINTO.mbas,259 :: 		wend
	GOTO       L__main57
	GOTO       $+0
; end of _main
