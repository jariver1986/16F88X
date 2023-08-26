
_main:

;puenteh.mbas,5 :: 		main:
;puenteh.mbas,6 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;puenteh.mbas,7 :: 		TRISA  = 0X01
	MOVLW      1
	MOVWF      TRISA+0
;puenteh.mbas,8 :: 		PORTA=0
	CLRF       PORTA+0
;puenteh.mbas,9 :: 		PORTC=0
	CLRF       PORTC+0
;puenteh.mbas,10 :: 		TRISC=0
	CLRF       TRISC+0
;puenteh.mbas,11 :: 		ANSEL=0X01
	MOVLW      1
	MOVWF      ANSEL+0
;puenteh.mbas,12 :: 		ANSELH=0
	CLRF       ANSELH+0
;puenteh.mbas,13 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;puenteh.mbas,14 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;puenteh.mbas,15 :: 		PWM1_Start
	CALL       _PWM1_Start+0
;puenteh.mbas,16 :: 		PWM2_Start
	CALL       _PWM2_Start+0
;puenteh.mbas,18 :: 		while
L__main2:
;puenteh.mbas,19 :: 		DATO = Adc_Read(0)>>2
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
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R2+0, 0
	XORWF      _dato+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L__main3
;puenteh.mbas,20 :: 		PWM1_Set_Duty(DATO)
	MOVF       _dato+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;puenteh.mbas,21 :: 		PWM2_Set_Duty(DATO)
	MOVF       _dato+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;puenteh.mbas,22 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
	NOP
;puenteh.mbas,23 :: 		wend
	GOTO       L__main2
L__main3:
	GOTO       $+0
; end of _main
