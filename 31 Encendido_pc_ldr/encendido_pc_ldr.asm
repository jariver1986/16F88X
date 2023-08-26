
encendido_pc_ldr_led:

;encendido_pc_ldr.mbas,8 :: 		sub procedure led()
;encendido_pc_ldr.mbas,9 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;encendido_pc_ldr.mbas,10 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_encendido_pc_ldr_led1:
	DECFSZ     R13+0, 1
	GOTO       L_encendido_pc_ldr_led1
	DECFSZ     R12+0, 1
	GOTO       L_encendido_pc_ldr_led1
	DECFSZ     R11+0, 1
	GOTO       L_encendido_pc_ldr_led1
	NOP
	NOP
;encendido_pc_ldr.mbas,11 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;encendido_pc_ldr.mbas,12 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_encendido_pc_ldr_led2:
	DECFSZ     R13+0, 1
	GOTO       L_encendido_pc_ldr_led2
	DECFSZ     R12+0, 1
	GOTO       L_encendido_pc_ldr_led2
	DECFSZ     R11+0, 1
	GOTO       L_encendido_pc_ldr_led2
	NOP
	NOP
	RETURN
; end of encendido_pc_ldr_led

encendido_pc_ldr_activa_relee:

;encendido_pc_ldr.mbas,15 :: 		sub procedure activa_relee()
;encendido_pc_ldr.mbas,16 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
	RETURN
; end of encendido_pc_ldr_activa_relee

encendido_pc_ldr_desactiva_relee:

;encendido_pc_ldr.mbas,19 :: 		sub procedure desactiva_relee()
;encendido_pc_ldr.mbas,20 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
	RETURN
; end of encendido_pc_ldr_desactiva_relee

_main:

;encendido_pc_ldr.mbas,24 :: 		main:
;encendido_pc_ldr.mbas,25 :: 		ANSEL  = %00000001  ' HABILITO CONVERTIDOR ANALOGICO PIN 1
	MOVLW      1
	MOVWF      ANSEL+0
;encendido_pc_ldr.mbas,26 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;encendido_pc_ldr.mbas,28 :: 		TRISA  = %00000001
	MOVLW      1
	MOVWF      TRISA+0
;encendido_pc_ldr.mbas,29 :: 		PORTA  = %00000000
	CLRF       PORTA+0
;encendido_pc_ldr.mbas,31 :: 		TRISB  = %00000000
	CLRF       TRISB+0
;encendido_pc_ldr.mbas,32 :: 		PORTB  = %00000000
	CLRF       PORTB+0
;encendido_pc_ldr.mbas,34 :: 		TRISC  = 0X00
	CLRF       TRISC+0
;encendido_pc_ldr.mbas,35 :: 		PORTC  = 0X00
	CLRF       PORTC+0
;encendido_pc_ldr.mbas,37 :: 		TRISD  = 0X00
	CLRF       TRISD+0
;encendido_pc_ldr.mbas,38 :: 		PORTD  = 0X00
	CLRF       PORTD+0
;encendido_pc_ldr.mbas,40 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;encendido_pc_ldr.mbas,42 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;encendido_pc_ldr.mbas,44 :: 		WHILE(1)
L__main7:
;encendido_pc_ldr.mbas,45 :: 		LUZ = ADC_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _luz+0
	MOVF       R0+1, 0
	MOVWF      _luz+1
	RRF        _luz+1, 1
	RRF        _luz+0, 1
	BCF        _luz+1, 7
	RRF        _luz+1, 1
	RRF        _luz+0, 1
	BCF        _luz+1, 7
;encendido_pc_ldr.mbas,46 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;encendido_pc_ldr.mbas,47 :: 		if (LUZ<200) and (centinela=1) then
	MOVLW      0
	SUBWF      _luz+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      200
	SUBWF      _luz+0, 0
L__main14:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _centinela+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main12
;encendido_pc_ldr.mbas,48 :: 		led()
	CALL       encendido_pc_ldr_led+0
;encendido_pc_ldr.mbas,49 :: 		activa_relee()
	CALL       encendido_pc_ldr_activa_relee+0
;encendido_pc_ldr.mbas,50 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;encendido_pc_ldr.mbas,51 :: 		desactiva_relee()
	CALL       encendido_pc_ldr_desactiva_relee+0
;encendido_pc_ldr.mbas,52 :: 		centinela=0
	CLRF       _centinela+0
L__main12:
;encendido_pc_ldr.mbas,56 :: 		WEND
	GOTO       L__main7
	GOTO       $+0
; end of _main
