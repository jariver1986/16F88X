
_main:

;PWM_10.mbas,12 :: 		main:
;PWM_10.mbas,13 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;PWM_10.mbas,14 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;PWM_10.mbas,16 :: 		TRISA = %10000011
	MOVLW      131
	MOVWF      TRISA+0
;PWM_10.mbas,17 :: 		PORTA = %00000000
	CLRF       PORTA+0
;PWM_10.mbas,20 :: 		TRISB = %00000000  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	CLRF       TRISB+0
;PWM_10.mbas,21 :: 		PORTB = %00000000
	CLRF       PORTB+0
;PWM_10.mbas,24 :: 		TRISC = %10010001
	MOVLW      145
	MOVWF      TRISC+0
;PWM_10.mbas,25 :: 		PORTC = %00000000
	CLRF       PORTC+0
;PWM_10.mbas,27 :: 		TRISE = %00001000
	MOVLW      8
	MOVWF      TRISE+0
;PWM_10.mbas,28 :: 		PORTE = %00000000
	CLRF       PORTE+0
;PWM_10.mbas,30 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;PWM_10.mbas,31 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;PWM_10.mbas,33 :: 		PWM1_Init(500)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_10.mbas,34 :: 		PWM2_Init (500)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;PWM_10.mbas,35 :: 		PWM1_Start ()
	CALL       _PWM1_Start+0
;PWM_10.mbas,36 :: 		PWM2_Start ()
	CALL       _PWM2_Start+0
;PWM_10.mbas,37 :: 		PWM1_Set_Duty (0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_10.mbas,38 :: 		PWM2_Set_Duty (0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;PWM_10.mbas,39 :: 		VAR=0
	CLRF       _VAR+0
	CLRF       _VAR+1
;PWM_10.mbas,41 :: 		WHILE(1)
L__main2:
;PWM_10.mbas,43 :: 		IF PORTE.RE3 = 0 then
	BTFSC      PORTE+0, 3
	GOTO       L__main7
;PWM_10.mbas,44 :: 		VAR = VAR + 25
	MOVLW      25
	ADDWF      _VAR+0, 0
	MOVWF      R0+0
	MOVF       _VAR+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _VAR+0
	MOVF       R0+1, 0
	MOVWF      _VAR+1
;PWM_10.mbas,45 :: 		PWM1_Set_Duty(VAR)
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_10.mbas,46 :: 		PWM2_Set_Duty(VAR)
	MOVF       _VAR+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;PWM_10.mbas,47 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	DECFSZ     R11+0, 1
	GOTO       L__main9
	GOTO       L__main8
;PWM_10.mbas,48 :: 		ELSE
L__main7:
;PWM_10.mbas,49 :: 		VAR=0
	CLRF       _VAR+0
	CLRF       _VAR+1
;PWM_10.mbas,50 :: 		end if
L__main8:
;PWM_10.mbas,51 :: 		if VAR = 250 then
	MOVLW      0
	XORWF      _VAR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      250
	XORWF      _VAR+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L__main11
;PWM_10.mbas,52 :: 		VAR = 0
	CLRF       _VAR+0
	CLRF       _VAR+1
L__main11:
;PWM_10.mbas,55 :: 		WEND
	GOTO       L__main2
	GOTO       $+0
; end of _main
