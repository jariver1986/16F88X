
Robot_droid_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Robot_droid.mbas,34 :: 		sub procedure interrupt
;Robot_droid.mbas,38 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_Robot_droid_interrupt2
;Robot_droid.mbas,39 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Robot_droid.mbas,47 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
L_Robot_droid_interrupt2:
;Robot_droid.mbas,49 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;Robot_droid.mbas,50 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Robot_droid.mbas,51 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_Robot_droid_interrupt41:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Robot_droid_interrupt

Robot_droid_adelante:

;Robot_droid.mbas,53 :: 		sub procedure adelante()
;Robot_droid.mbas,54 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Robot_droid.mbas,55 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_droid.mbas,56 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_droid.mbas,57 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Robot_droid_adelante

Robot_droid_atras:

;Robot_droid.mbas,59 :: 		sub procedure atras()
;Robot_droid.mbas,60 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Robot_droid.mbas,61 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
	RETURN
; end of Robot_droid_atras

Robot_droid_parar:

;Robot_droid.mbas,63 :: 		sub procedure parar()
;Robot_droid.mbas,64 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Robot_droid.mbas,65 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_droid.mbas,66 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_droid.mbas,67 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Robot_droid_parar

Robot_droid_derecha:

;Robot_droid.mbas,70 :: 		sub procedure derecha()
;Robot_droid.mbas,71 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_droid.mbas,72 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;Robot_droid.mbas,73 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Robot_droid.mbas,74 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
	RETURN
; end of Robot_droid_derecha

Robot_droid_izquierda:

;Robot_droid.mbas,76 :: 		sub procedure izquierda()
;Robot_droid.mbas,77 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;Robot_droid.mbas,78 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;Robot_droid.mbas,79 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Robot_droid.mbas,80 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
	RETURN
; end of Robot_droid_izquierda

_main:

;Robot_droid.mbas,83 :: 		main:
;Robot_droid.mbas,85 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Robot_droid.mbas,86 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;Robot_droid.mbas,87 :: 		INTCON = 0XE0      ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;Robot_droid.mbas,90 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Robot_droid.mbas,91 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Robot_droid.mbas,92 :: 		TRISA =0X01
	MOVLW      1
	MOVWF      TRISA+0
;Robot_droid.mbas,93 :: 		TRISB= 0X00
	CLRF       TRISB+0
;Robot_droid.mbas,94 :: 		PORTB= 0X00
	CLRF       PORTB+0
;Robot_droid.mbas,96 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;Robot_droid.mbas,97 :: 		PORTC = 0x00
	CLRF       PORTC+0
;Robot_droid.mbas,98 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;Robot_droid.mbas,99 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;Robot_droid.mbas,100 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Robot_droid.mbas,101 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Robot_droid.mbas,102 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,104 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,105 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Robot_droid.mbas,106 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Robot_droid.mbas,108 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot_droid.mbas,109 :: 		datos_set=0x00
	CLRF       _datos_set+0
;Robot_droid.mbas,110 :: 		viajero=0
	CLRF       _viajero+0
;Robot_droid.mbas,113 :: 		vel=Adc_Read(0)>>2
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
;Robot_droid.mbas,114 :: 		PORTB=vel
	MOVF       R2+0, 0
	MOVWF      PORTB+0
;Robot_droid.mbas,115 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
	NOP
;Robot_droid.mbas,116 :: 		portb=0
	CLRF       PORTB+0
;Robot_droid.mbas,118 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	DECFSZ     R12+0, 1
	GOTO       L__main11
	DECFSZ     R11+0, 1
	GOTO       L__main11
;Robot_droid.mbas,119 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Robot_droid.mbas,120 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
;Robot_droid.mbas,121 :: 		portb=0
	CLRF       PORTB+0
;Robot_droid.mbas,122 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
;Robot_droid.mbas,123 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Robot_droid.mbas,124 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
;Robot_droid.mbas,125 :: 		portb=0
	CLRF       PORTB+0
;Robot_droid.mbas,127 :: 		while(1)
L__main16:
;Robot_droid.mbas,128 :: 		vel=Adc_Read(0)>>2
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
;Robot_droid.mbas,129 :: 		if dato_recep="W" then    'ADELANTE
	MOVF       _dato_recep+0, 0
	XORLW      87
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;Robot_droid.mbas,130 :: 		adelante()
	CALL       Robot_droid_adelante+0
;Robot_droid.mbas,131 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,132 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,133 :: 		PORTB=1
	MOVLW      1
	MOVWF      PORTB+0
L__main21:
;Robot_droid.mbas,135 :: 		if dato_recep="X" then     'ATRAS
	MOVF       _dato_recep+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L__main24
;Robot_droid.mbas,136 :: 		atras()
	CALL       Robot_droid_atras+0
;Robot_droid.mbas,137 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,138 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,139 :: 		PORTB=2
	MOVLW      2
	MOVWF      PORTB+0
L__main24:
;Robot_droid.mbas,141 :: 		if dato_recep="A" then     'IZQUIERDA
	MOVF       _dato_recep+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;Robot_droid.mbas,142 :: 		izquierda()
	CALL       Robot_droid_izquierda+0
;Robot_droid.mbas,143 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,144 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,145 :: 		PORTB=4
	MOVLW      4
	MOVWF      PORTB+0
L__main27:
;Robot_droid.mbas,147 :: 		if dato_recep="D" then     'DERECHA
	MOVF       _dato_recep+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;Robot_droid.mbas,148 :: 		derecha()
	CALL       Robot_droid_derecha+0
;Robot_droid.mbas,149 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,150 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,151 :: 		PORTB=8
	MOVLW      8
	MOVWF      PORTB+0
L__main30:
;Robot_droid.mbas,153 :: 		if dato_recep="S" then     'PARAR
	MOVF       _dato_recep+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;Robot_droid.mbas,154 :: 		parar()
	CALL       Robot_droid_parar+0
;Robot_droid.mbas,155 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,156 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,157 :: 		PORTB=16
	MOVLW      16
	MOVWF      PORTB+0
L__main33:
;Robot_droid.mbas,159 :: 		if dato_recep="Z" then     'PARAR
	MOVF       _dato_recep+0, 0
	XORLW      90
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;Robot_droid.mbas,160 :: 		izquierda()
	CALL       Robot_droid_izquierda+0
;Robot_droid.mbas,161 :: 		atras()
	CALL       Robot_droid_atras+0
;Robot_droid.mbas,162 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,163 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,164 :: 		PORTB=32
	MOVLW      32
	MOVWF      PORTB+0
L__main36:
;Robot_droid.mbas,166 :: 		if dato_recep="C" then     'PARAR
	MOVF       _dato_recep+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;Robot_droid.mbas,167 :: 		derecha()
	CALL       Robot_droid_derecha+0
;Robot_droid.mbas,168 :: 		atras()
	CALL       Robot_droid_atras+0
;Robot_droid.mbas,169 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_droid.mbas,170 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_droid.mbas,171 :: 		PORTB=64
	MOVLW      64
	MOVWF      PORTB+0
L__main39:
;Robot_droid.mbas,175 :: 		wend
	GOTO       L__main16
	GOTO       $+0
; end of _main
