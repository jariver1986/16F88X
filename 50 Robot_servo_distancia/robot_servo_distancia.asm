
robot_servo_distancia_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;robot_servo_distancia.mbas,21 :: 		sub procedure interrupt
;robot_servo_distancia.mbas,25 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_robot_servo_distancia_interrupt2
;robot_servo_distancia.mbas,27 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;robot_servo_distancia.mbas,30 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt7
;robot_servo_distancia.mbas,31 :: 		if dato_recep = 0X24 then ' I
	MOVF       _dato_recep+0, 0
	XORLW      36
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt9
;robot_servo_distancia.mbas,32 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt10
;robot_servo_distancia.mbas,33 :: 		else
L_robot_servo_distancia_interrupt9:
;robot_servo_distancia.mbas,34 :: 		viajero = 0
	CLRF       _viajero+0
;robot_servo_distancia.mbas,35 :: 		end if
L_robot_servo_distancia_interrupt10:
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt7:
;robot_servo_distancia.mbas,36 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt13
;robot_servo_distancia.mbas,37 :: 		if dato_recep = 0X07then
	MOVF       _dato_recep+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt15
;robot_servo_distancia.mbas,38 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt16
;robot_servo_distancia.mbas,39 :: 		else
L_robot_servo_distancia_interrupt15:
;robot_servo_distancia.mbas,40 :: 		viajero=0
	CLRF       _viajero+0
;robot_servo_distancia.mbas,41 :: 		end if
L_robot_servo_distancia_interrupt16:
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt13:
;robot_servo_distancia.mbas,42 :: 		case 2
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt19
;robot_servo_distancia.mbas,43 :: 		dato1 = dato_recep    'ADELANTE
	MOVF       _dato_recep+0, 0
	MOVWF      _dato1+0
;robot_servo_distancia.mbas,44 :: 		viajero=3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt19:
;robot_servo_distancia.mbas,45 :: 		case 3
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt22
;robot_servo_distancia.mbas,46 :: 		vel1 = dato_recep    'ATRAS
	MOVF       _dato_recep+0, 0
	MOVWF      _vel1+0
;robot_servo_distancia.mbas,47 :: 		viajero=4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt22:
;robot_servo_distancia.mbas,48 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt25
;robot_servo_distancia.mbas,49 :: 		dato2 = dato_recep    'IZQUIERDA
	MOVF       _dato_recep+0, 0
	MOVWF      _dato2+0
;robot_servo_distancia.mbas,50 :: 		viajero=5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt25:
;robot_servo_distancia.mbas,51 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_robot_servo_distancia_interrupt28
;robot_servo_distancia.mbas,52 :: 		vel2 = dato_recep    'DERECHA
	MOVF       _dato_recep+0, 0
	MOVWF      _vel2+0
;robot_servo_distancia.mbas,53 :: 		viajero=6
	MOVLW      6
	MOVWF      _viajero+0
	GOTO       L_robot_servo_distancia_interrupt4
L_robot_servo_distancia_interrupt28:
L_robot_servo_distancia_interrupt4:
;robot_servo_distancia.mbas,56 :: 		end select
L_robot_servo_distancia_interrupt2:
;robot_servo_distancia.mbas,58 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;robot_servo_distancia.mbas,59 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;robot_servo_distancia.mbas,60 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_robot_servo_distancia_interrupt89:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of robot_servo_distancia_interrupt

robot_servo_distancia_adelante_m1:

;robot_servo_distancia.mbas,63 :: 		sub procedure adelante_m1()
;robot_servo_distancia.mbas,64 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;robot_servo_distancia.mbas,65 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
	RETURN
; end of robot_servo_distancia_adelante_m1

robot_servo_distancia_adelante_m2:

;robot_servo_distancia.mbas,67 :: 		sub procedure adelante_m2()
;robot_servo_distancia.mbas,68 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;robot_servo_distancia.mbas,69 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of robot_servo_distancia_adelante_m2

robot_servo_distancia_atras_m1:

;robot_servo_distancia.mbas,71 :: 		sub procedure atras_m1()
;robot_servo_distancia.mbas,72 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;robot_servo_distancia.mbas,73 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
	RETURN
; end of robot_servo_distancia_atras_m1

robot_servo_distancia_atras_m2:

;robot_servo_distancia.mbas,75 :: 		sub procedure atras_m2()
;robot_servo_distancia.mbas,76 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;robot_servo_distancia.mbas,77 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
	RETURN
; end of robot_servo_distancia_atras_m2

robot_servo_distancia_parar_m1:

;robot_servo_distancia.mbas,80 :: 		sub procedure parar_m1()
;robot_servo_distancia.mbas,81 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;robot_servo_distancia.mbas,82 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
	RETURN
; end of robot_servo_distancia_parar_m1

robot_servo_distancia_parar_m2:

;robot_servo_distancia.mbas,85 :: 		sub procedure parar_m2()
;robot_servo_distancia.mbas,86 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;robot_servo_distancia.mbas,87 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of robot_servo_distancia_parar_m2

robot_servo_distancia_ultrasonico1:

;robot_servo_distancia.mbas,91 :: 		dim distan,tiempo as word
;robot_servo_distancia.mbas,92 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robot_servo_distancia.mbas,94 :: 		disparo1 = 1
	BSF        PORTB+0, 7
;robot_servo_distancia.mbas,95 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robot_servo_distancia_ultrasonico136:
	DECFSZ     R13+0, 1
	GOTO       L_robot_servo_distancia_ultrasonico136
	NOP
;robot_servo_distancia.mbas,96 :: 		disparo1 = 0
	BCF        PORTB+0, 7
;robot_servo_distancia.mbas,98 :: 		DO
L_robot_servo_distancia_ultrasonico137:
;robot_servo_distancia.mbas,99 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTB+0, 6
	GOTO       L_robot_servo_distancia_ultrasonico143
;robot_servo_distancia.mbas,100 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_servo_distancia.mbas,101 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robot_servo_distancia_ultrasonico143:
;robot_servo_distancia.mbas,103 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_servo_distancia_ultrasonico140
	GOTO       L_robot_servo_distancia_ultrasonico137
L_robot_servo_distancia_ultrasonico140:
;robot_servo_distancia.mbas,105 :: 		DO
L_robot_servo_distancia_ultrasonico145:
;robot_servo_distancia.mbas,106 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTB+0, 6
	GOTO       L_robot_servo_distancia_ultrasonico151
;robot_servo_distancia.mbas,107 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robot_servo_distancia.mbas,108 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robot_servo_distancia_ultrasonico151:
;robot_servo_distancia.mbas,110 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_servo_distancia_ultrasonico154
;robot_servo_distancia.mbas,111 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robot_servo_distancia_ultrasonico154:
;robot_servo_distancia.mbas,113 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_servo_distancia_ultrasonico148
	GOTO       L_robot_servo_distancia_ultrasonico145
L_robot_servo_distancia_ultrasonico148:
;robot_servo_distancia.mbas,115 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_servo_distancia_ultrasonico190:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_servo_distancia_ultrasonico191
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_servo_distancia_ultrasonico190
L_robot_servo_distancia_ultrasonico191:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robot_servo_distancia.mbas,116 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robot_servo_distancia_ultrasonico156:
	DECFSZ     R13+0, 1
	GOTO       L_robot_servo_distancia_ultrasonico156
	DECFSZ     R12+0, 1
	GOTO       L_robot_servo_distancia_ultrasonico156
	NOP
;robot_servo_distancia.mbas,117 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_servo_distancia_ultrasonico1

_main:

;robot_servo_distancia.mbas,119 :: 		main:
;robot_servo_distancia.mbas,120 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;robot_servo_distancia.mbas,122 :: 		OSCCON = 0X65 ' Oscilador interno de 8mhz
	MOVLW      101
	MOVWF      OSCCON+0
;robot_servo_distancia.mbas,124 :: 		INTCON = 0XE0      ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;robot_servo_distancia.mbas,127 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;robot_servo_distancia.mbas,128 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;robot_servo_distancia.mbas,130 :: 		TRISA = 0X01 ' como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;robot_servo_distancia.mbas,131 :: 		PORTA = 0X00
	CLRF       PORTA+0
;robot_servo_distancia.mbas,133 :: 		TRISB = 0X40 '  como entrada digital
	MOVLW      64
	MOVWF      TRISB+0
;robot_servo_distancia.mbas,134 :: 		PORTB = 0X00
	CLRF       PORTB+0
;robot_servo_distancia.mbas,136 :: 		TRISC = 0X80 '  como entrada digital
	MOVLW      128
	MOVWF      TRISC+0
;robot_servo_distancia.mbas,137 :: 		PORTC = 0X00
	CLRF       PORTC+0
;robot_servo_distancia.mbas,139 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_servo_distancia.mbas,140 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_servo_distancia.mbas,141 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_servo_distancia.mbas,143 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_servo_distancia.mbas,144 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_servo_distancia.mbas,145 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_servo_distancia.mbas,147 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_servo_distancia.mbas,148 :: 		viajero=0
	CLRF       _viajero+0
;robot_servo_distancia.mbas,149 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;robot_servo_distancia.mbas,150 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;robot_servo_distancia.mbas,152 :: 		while (TRUE)
L__main59:
;robot_servo_distancia.mbas,154 :: 		if viajero=6 then
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;robot_servo_distancia.mbas,155 :: 		viajero=0
	CLRF       _viajero+0
;robot_servo_distancia.mbas,156 :: 		if (dato1=0x01)and (dato2=0x01) then
	MOVF       _dato1+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _dato2+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main67
;robot_servo_distancia.mbas,157 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_servo_distancia.mbas,158 :: 		Delay_us(1400)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      208
	MOVWF      R13+0
L__main69:
	DECFSZ     R13+0, 1
	GOTO       L__main69
	DECFSZ     R12+0, 1
	GOTO       L__main69
	NOP
;robot_servo_distancia.mbas,159 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_servo_distancia.mbas,160 :: 		Delay_us(600)
	MOVLW      199
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	NOP
	NOP
;robot_servo_distancia.mbas,161 :: 		adelante_m2()
	CALL       robot_servo_distancia_adelante_m2+0
;robot_servo_distancia.mbas,163 :: 		PWM1_Set_Duty(vel1)
	MOVF       _vel1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_servo_distancia.mbas,164 :: 		PWM2_Set_Duty(vel2)
	MOVF       _vel2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L__main68
;robot_servo_distancia.mbas,165 :: 		else
L__main67:
;robot_servo_distancia.mbas,166 :: 		if (dato1=0x01)and (dato2=0x00) then
	MOVF       _dato1+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _dato2+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main72
;robot_servo_distancia.mbas,167 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_servo_distancia.mbas,168 :: 		Delay_us(2200)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      218
	MOVWF      R13+0
L__main74:
	DECFSZ     R13+0, 1
	GOTO       L__main74
	DECFSZ     R12+0, 1
	GOTO       L__main74
	NOP
;robot_servo_distancia.mbas,169 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_servo_distancia.mbas,170 :: 		Delay_us(400)
	MOVLW      133
	MOVWF      R13+0
L__main75:
	DECFSZ     R13+0, 1
	GOTO       L__main75
;robot_servo_distancia.mbas,171 :: 		adelante_m1()
	CALL       robot_servo_distancia_adelante_m1+0
;robot_servo_distancia.mbas,173 :: 		PWM1_Set_Duty(vel1)
	MOVF       _vel1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_servo_distancia.mbas,174 :: 		PWM2_Set_Duty(vel2)
	MOVF       _vel2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L__main73
;robot_servo_distancia.mbas,175 :: 		else
L__main72:
;robot_servo_distancia.mbas,176 :: 		if (dato1=0x00)and (dato2=0x01) then
	MOVF       _dato1+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _dato2+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main77
;robot_servo_distancia.mbas,177 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_servo_distancia.mbas,178 :: 		Delay_us(600)
	MOVLW      199
	MOVWF      R13+0
L__main79:
	DECFSZ     R13+0, 1
	GOTO       L__main79
	NOP
	NOP
;robot_servo_distancia.mbas,179 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_servo_distancia.mbas,180 :: 		Delay_us(1400)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      208
	MOVWF      R13+0
L__main80:
	DECFSZ     R13+0, 1
	GOTO       L__main80
	DECFSZ     R12+0, 1
	GOTO       L__main80
	NOP
;robot_servo_distancia.mbas,182 :: 		atras_m1()
	CALL       robot_servo_distancia_atras_m1+0
;robot_servo_distancia.mbas,183 :: 		PWM1_Set_Duty(vel1)
	MOVF       _vel1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_servo_distancia.mbas,184 :: 		PWM2_Set_Duty(vel2)
	MOVF       _vel2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L__main78
;robot_servo_distancia.mbas,185 :: 		else
L__main77:
;robot_servo_distancia.mbas,186 :: 		if (dato1=0x00)and (dato2=0x00) then
	MOVF       _dato1+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _dato2+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main82
;robot_servo_distancia.mbas,187 :: 		parar_m2()
	CALL       robot_servo_distancia_parar_m2+0
;robot_servo_distancia.mbas,188 :: 		parar_m1()
	CALL       robot_servo_distancia_parar_m1+0
L__main82:
;robot_servo_distancia.mbas,191 :: 		end if
L__main78:
;robot_servo_distancia.mbas,192 :: 		end if
L__main73:
;robot_servo_distancia.mbas,193 :: 		end if
L__main68:
L__main64:
;robot_servo_distancia.mbas,195 :: 		while(viajero=0)
L__main85:
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
;robot_servo_distancia.mbas,196 :: 		distancia1 = ultrasonico1()
	CALL       robot_servo_distancia_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;robot_servo_distancia.mbas,197 :: 		WordToStr(distancia1,dato)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _dato+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;robot_servo_distancia.mbas,198 :: 		UART1_Write_Text(dato)
	MOVLW      _dato+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;robot_servo_distancia.mbas,199 :: 		UART1_Write_Text("cm")
	MOVLW      99
	MOVWF      _main_Local_Text+0
	MOVLW      109
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;robot_servo_distancia.mbas,200 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;robot_servo_distancia.mbas,201 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;robot_servo_distancia.mbas,202 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;robot_servo_distancia.mbas,203 :: 		wend
	GOTO       L__main85
L__main86:
;robot_servo_distancia.mbas,204 :: 		wend
	GOTO       L__main59
	GOTO       $+0
; end of _main
