
prueba_puente_h_adelante:

;prueba_puente_h.mbas,11 :: 		sub procedure adelante()
;prueba_puente_h.mbas,12 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;prueba_puente_h.mbas,13 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;prueba_puente_h.mbas,15 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;prueba_puente_h.mbas,16 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;prueba_puente_h.mbas,18 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;prueba_puente_h.mbas,19 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;prueba_puente_h.mbas,20 :: 		PORTB=1
	MOVLW      1
	MOVWF      PORTB+0
	RETURN
; end of prueba_puente_h_adelante

prueba_puente_h_parar:

;prueba_puente_h.mbas,22 :: 		sub procedure parar()
;prueba_puente_h.mbas,23 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;prueba_puente_h.mbas,24 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;prueba_puente_h.mbas,26 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;prueba_puente_h.mbas,27 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of prueba_puente_h_parar

prueba_puente_h_izquierda:

;prueba_puente_h.mbas,29 :: 		sub procedure izquierda()
;prueba_puente_h.mbas,30 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;prueba_puente_h.mbas,31 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;prueba_puente_h.mbas,33 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;prueba_puente_h.mbas,34 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;prueba_puente_h.mbas,36 :: 		PORTB=4
	MOVLW      4
	MOVWF      PORTB+0
	RETURN
; end of prueba_puente_h_izquierda

prueba_puente_h_derecha:

;prueba_puente_h.mbas,38 :: 		sub procedure derecha()
;prueba_puente_h.mbas,39 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;prueba_puente_h.mbas,40 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;prueba_puente_h.mbas,42 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;prueba_puente_h.mbas,43 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;prueba_puente_h.mbas,45 :: 		PORTB=8
	MOVLW      8
	MOVWF      PORTB+0
	RETURN
; end of prueba_puente_h_derecha

prueba_puente_h_atras:

;prueba_puente_h.mbas,47 :: 		sub procedure atras()
;prueba_puente_h.mbas,48 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;prueba_puente_h.mbas,49 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;prueba_puente_h.mbas,51 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;prueba_puente_h.mbas,52 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;prueba_puente_h.mbas,54 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;prueba_puente_h.mbas,55 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;prueba_puente_h.mbas,56 :: 		PORTB=2
	MOVLW      2
	MOVWF      PORTB+0
	RETURN
; end of prueba_puente_h_atras

_main:

;prueba_puente_h.mbas,58 :: 		main:
;prueba_puente_h.mbas,60 :: 		OPTION_REG=%10000000
	MOVLW      128
	MOVWF      OPTION_REG+0
;prueba_puente_h.mbas,61 :: 		TRISA=%00000001
	MOVLW      1
	MOVWF      TRISA+0
;prueba_puente_h.mbas,62 :: 		TRISB=%00000000  '
	CLRF       TRISB+0
;prueba_puente_h.mbas,63 :: 		TRISC=%01111000  'RC3,RC4,RC5,RC6 ENTRADAS   (C1 Y C2 PWM)
	MOVLW      120
	MOVWF      TRISC+0
;prueba_puente_h.mbas,64 :: 		ANSEL=1
	MOVLW      1
	MOVWF      ANSEL+0
;prueba_puente_h.mbas,65 :: 		ANSELH=0
	CLRF       ANSELH+0
;prueba_puente_h.mbas,66 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;prueba_puente_h.mbas,67 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;prueba_puente_h.mbas,68 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;prueba_puente_h.mbas,70 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;prueba_puente_h.mbas,71 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;prueba_puente_h.mbas,72 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;prueba_puente_h.mbas,74 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;prueba_puente_h.mbas,75 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
;prueba_puente_h.mbas,76 :: 		portb=0
	CLRF       PORTB+0
;prueba_puente_h.mbas,77 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
;prueba_puente_h.mbas,78 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;prueba_puente_h.mbas,79 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
;prueba_puente_h.mbas,80 :: 		portb=0
	CLRF       PORTB+0
;prueba_puente_h.mbas,84 :: 		WHILE(1)
L__main10:
;prueba_puente_h.mbas,85 :: 		vel=Adc_Read(0)>>2
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
	MOVWF      _vel+0
;prueba_puente_h.mbas,86 :: 		adelante()
	CALL       prueba_puente_h_adelante+0
;prueba_puente_h.mbas,87 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,88 :: 		parar()
	CALL       prueba_puente_h_parar+0
;prueba_puente_h.mbas,89 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,90 :: 		atras()
	CALL       prueba_puente_h_atras+0
;prueba_puente_h.mbas,91 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,92 :: 		parar()
	CALL       prueba_puente_h_parar+0
;prueba_puente_h.mbas,93 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,94 :: 		izquierda()
	CALL       prueba_puente_h_izquierda+0
;prueba_puente_h.mbas,95 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,96 :: 		parar()
	CALL       prueba_puente_h_parar+0
;prueba_puente_h.mbas,97 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,98 :: 		derecha()
	CALL       prueba_puente_h_derecha+0
;prueba_puente_h.mbas,99 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,100 :: 		parar()
	CALL       prueba_puente_h_parar+0
;prueba_puente_h.mbas,101 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_puente_h.mbas,104 :: 		WEND
	GOTO       L__main10
	GOTO       $+0
; end of _main
