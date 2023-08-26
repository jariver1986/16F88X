
Robot_teleoperado_android_tablet_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Robot_teleoperado_android_tablet.mbas,14 :: 		sub procedure interrupt
;Robot_teleoperado_android_tablet.mbas,18 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_Robot_teleoperado_android_tablet_interrupt2
;Robot_teleoperado_android_tablet.mbas,19 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Robot_teleoperado_android_tablet.mbas,26 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;Robot_teleoperado_android_tablet.mbas,29 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt7
;Robot_teleoperado_android_tablet.mbas,30 :: 		if dato_recep = "I" then ' I
	MOVF       _dato_recep+0, 0
	XORLW      73
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt9
;Robot_teleoperado_android_tablet.mbas,31 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt10
;Robot_teleoperado_android_tablet.mbas,32 :: 		else
L_Robot_teleoperado_android_tablet_interrupt9:
;Robot_teleoperado_android_tablet.mbas,33 :: 		viajero = 0
	CLRF       _viajero+0
;Robot_teleoperado_android_tablet.mbas,34 :: 		end if
L_Robot_teleoperado_android_tablet_interrupt10:
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt7:
;Robot_teleoperado_android_tablet.mbas,35 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt13
;Robot_teleoperado_android_tablet.mbas,36 :: 		if dato_recep = "&" then
	MOVF       _dato_recep+0, 0
	XORLW      38
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt15
;Robot_teleoperado_android_tablet.mbas,37 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt16
;Robot_teleoperado_android_tablet.mbas,38 :: 		else
L_Robot_teleoperado_android_tablet_interrupt15:
;Robot_teleoperado_android_tablet.mbas,39 :: 		viajero=0
	CLRF       _viajero+0
;Robot_teleoperado_android_tablet.mbas,40 :: 		end if
L_Robot_teleoperado_android_tablet_interrupt16:
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt13:
;Robot_teleoperado_android_tablet.mbas,41 :: 		case 2
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt19
;Robot_teleoperado_android_tablet.mbas,42 :: 		if dato_recep = "T" then
	MOVF       _dato_recep+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt21
;Robot_teleoperado_android_tablet.mbas,43 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt22
;Robot_teleoperado_android_tablet.mbas,44 :: 		else
L_Robot_teleoperado_android_tablet_interrupt21:
;Robot_teleoperado_android_tablet.mbas,45 :: 		viajero=0
	CLRF       _viajero+0
;Robot_teleoperado_android_tablet.mbas,46 :: 		end if
L_Robot_teleoperado_android_tablet_interrupt22:
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt19:
;Robot_teleoperado_android_tablet.mbas,48 :: 		case 3
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt25
;Robot_teleoperado_android_tablet.mbas,49 :: 		comando[1] = dato_recep    'ADELANTE
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+1
;Robot_teleoperado_android_tablet.mbas,50 :: 		viajero=4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt25:
;Robot_teleoperado_android_tablet.mbas,51 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt28
;Robot_teleoperado_android_tablet.mbas,52 :: 		comando[2] = dato_recep    'ATRAS
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+2
;Robot_teleoperado_android_tablet.mbas,53 :: 		viajero=5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt28:
;Robot_teleoperado_android_tablet.mbas,54 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt31
;Robot_teleoperado_android_tablet.mbas,55 :: 		comando[3] = dato_recep    'IZQUIERDA
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+3
;Robot_teleoperado_android_tablet.mbas,56 :: 		viajero=6
	MOVLW      6
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt31:
;Robot_teleoperado_android_tablet.mbas,57 :: 		case 6
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt34
;Robot_teleoperado_android_tablet.mbas,58 :: 		comando[4] = dato_recep    'DERECHA
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+4
;Robot_teleoperado_android_tablet.mbas,59 :: 		viajero=7
	MOVLW      7
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt34:
;Robot_teleoperado_android_tablet.mbas,60 :: 		case 7
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt37
;Robot_teleoperado_android_tablet.mbas,61 :: 		comando[5] = dato_recep    'ATRAS
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+5
;Robot_teleoperado_android_tablet.mbas,62 :: 		viajero = 8
	MOVLW      8
	MOVWF      _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt37:
;Robot_teleoperado_android_tablet.mbas,63 :: 		case 8
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_teleoperado_android_tablet_interrupt40
;Robot_teleoperado_android_tablet.mbas,64 :: 		viajero=0
	CLRF       _viajero+0
	GOTO       L_Robot_teleoperado_android_tablet_interrupt4
L_Robot_teleoperado_android_tablet_interrupt40:
L_Robot_teleoperado_android_tablet_interrupt4:
;Robot_teleoperado_android_tablet.mbas,66 :: 		end select
L_Robot_teleoperado_android_tablet_interrupt2:
;Robot_teleoperado_android_tablet.mbas,68 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;Robot_teleoperado_android_tablet.mbas,69 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Robot_teleoperado_android_tablet.mbas,70 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_Robot_teleoperado_android_tablet_interrupt72:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Robot_teleoperado_android_tablet_interrupt

Robot_teleoperado_android_tablet_adelante:

;Robot_teleoperado_android_tablet.mbas,72 :: 		sub procedure adelante()
;Robot_teleoperado_android_tablet.mbas,73 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Robot_teleoperado_android_tablet.mbas,74 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_teleoperado_android_tablet.mbas,76 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;Robot_teleoperado_android_tablet.mbas,77 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Robot_teleoperado_android_tablet_adelante

Robot_teleoperado_android_tablet_parar:

;Robot_teleoperado_android_tablet.mbas,79 :: 		sub procedure parar()
;Robot_teleoperado_android_tablet.mbas,80 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Robot_teleoperado_android_tablet.mbas,81 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_teleoperado_android_tablet.mbas,83 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_teleoperado_android_tablet.mbas,84 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Robot_teleoperado_android_tablet_parar

Robot_teleoperado_android_tablet_izquierda:

;Robot_teleoperado_android_tablet.mbas,86 :: 		sub procedure izquierda()
;Robot_teleoperado_android_tablet.mbas,87 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Robot_teleoperado_android_tablet.mbas,88 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_teleoperado_android_tablet.mbas,90 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_teleoperado_android_tablet.mbas,91 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
	RETURN
; end of Robot_teleoperado_android_tablet_izquierda

Robot_teleoperado_android_tablet_derecha:

;Robot_teleoperado_android_tablet.mbas,93 :: 		sub procedure derecha()
;Robot_teleoperado_android_tablet.mbas,94 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Robot_teleoperado_android_tablet.mbas,95 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;Robot_teleoperado_android_tablet.mbas,97 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;Robot_teleoperado_android_tablet.mbas,98 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Robot_teleoperado_android_tablet_derecha

Robot_teleoperado_android_tablet_atras:

;Robot_teleoperado_android_tablet.mbas,100 :: 		sub procedure atras()
;Robot_teleoperado_android_tablet.mbas,101 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Robot_teleoperado_android_tablet.mbas,102 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;Robot_teleoperado_android_tablet.mbas,104 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Robot_teleoperado_android_tablet.mbas,105 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
	RETURN
; end of Robot_teleoperado_android_tablet_atras

_main:

;Robot_teleoperado_android_tablet.mbas,108 :: 		main:
;Robot_teleoperado_android_tablet.mbas,110 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Robot_teleoperado_android_tablet.mbas,111 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;Robot_teleoperado_android_tablet.mbas,112 :: 		INTCON = 0XE0      ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;Robot_teleoperado_android_tablet.mbas,115 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Robot_teleoperado_android_tablet.mbas,116 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Robot_teleoperado_android_tablet.mbas,117 :: 		TRISA =0X01
	MOVLW      1
	MOVWF      TRISA+0
;Robot_teleoperado_android_tablet.mbas,118 :: 		TRISB= 0X00
	CLRF       TRISB+0
;Robot_teleoperado_android_tablet.mbas,119 :: 		PORTB= 0X00
	CLRF       PORTB+0
;Robot_teleoperado_android_tablet.mbas,121 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;Robot_teleoperado_android_tablet.mbas,122 :: 		PORTC = 0x00
	CLRF       PORTC+0
;Robot_teleoperado_android_tablet.mbas,123 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;Robot_teleoperado_android_tablet.mbas,124 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;Robot_teleoperado_android_tablet.mbas,125 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Robot_teleoperado_android_tablet.mbas,126 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Robot_teleoperado_android_tablet.mbas,127 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,129 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,130 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Robot_teleoperado_android_tablet.mbas,131 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Robot_teleoperado_android_tablet.mbas,133 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot_teleoperado_android_tablet.mbas,134 :: 		datos_set=0x00
	CLRF       _datos_set+0
;Robot_teleoperado_android_tablet.mbas,135 :: 		viajero=0
	CLRF       _viajero+0
;Robot_teleoperado_android_tablet.mbas,136 :: 		vel=Adc_Read(0)>>2
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
;Robot_teleoperado_android_tablet.mbas,137 :: 		PORTB=vel
	MOVF       R2+0, 0
	MOVWF      PORTB+0
;Robot_teleoperado_android_tablet.mbas,138 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	DECFSZ     R11+0, 1
	GOTO       L__main47
	NOP
	NOP
;Robot_teleoperado_android_tablet.mbas,139 :: 		portb=0
	CLRF       PORTB+0
;Robot_teleoperado_android_tablet.mbas,140 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, 1
	GOTO       L__main48
	DECFSZ     R12+0, 1
	GOTO       L__main48
	DECFSZ     R11+0, 1
	GOTO       L__main48
;Robot_teleoperado_android_tablet.mbas,141 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Robot_teleoperado_android_tablet.mbas,142 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main49:
	DECFSZ     R13+0, 1
	GOTO       L__main49
	DECFSZ     R12+0, 1
	GOTO       L__main49
	DECFSZ     R11+0, 1
	GOTO       L__main49
;Robot_teleoperado_android_tablet.mbas,143 :: 		portb=0
	CLRF       PORTB+0
;Robot_teleoperado_android_tablet.mbas,144 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	DECFSZ     R11+0, 1
	GOTO       L__main50
;Robot_teleoperado_android_tablet.mbas,145 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Robot_teleoperado_android_tablet.mbas,146 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	DECFSZ     R11+0, 1
	GOTO       L__main51
;Robot_teleoperado_android_tablet.mbas,147 :: 		portb=0
	CLRF       PORTB+0
;Robot_teleoperado_android_tablet.mbas,149 :: 		while(1)
L__main53:
;Robot_teleoperado_android_tablet.mbas,150 :: 		vel=Adc_Read(0)>>2
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
;Robot_teleoperado_android_tablet.mbas,154 :: 		if comando[1]=0x31 then    'ADELANTE
	MOVF       _comando+1, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main58
;Robot_teleoperado_android_tablet.mbas,155 :: 		adelante()
	CALL       Robot_teleoperado_android_tablet_adelante+0
;Robot_teleoperado_android_tablet.mbas,156 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,157 :: 		PWM2_Set_Duty(vel/3)
	MOVLW      3
	MOVWF      R4+0
	MOVF       _vel+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,158 :: 		PORTB=1
	MOVLW      1
	MOVWF      PORTB+0
L__main58:
;Robot_teleoperado_android_tablet.mbas,160 :: 		if comando[2]=0x31 then     'ATRAS
	MOVF       _comando+2, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main61
;Robot_teleoperado_android_tablet.mbas,161 :: 		atras()
	CALL       Robot_teleoperado_android_tablet_atras+0
;Robot_teleoperado_android_tablet.mbas,162 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,163 :: 		PWM2_Set_Duty(vel/3)
	MOVLW      3
	MOVWF      R4+0
	MOVF       _vel+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,164 :: 		PORTB=2
	MOVLW      2
	MOVWF      PORTB+0
L__main61:
;Robot_teleoperado_android_tablet.mbas,166 :: 		if comando[3]=0x31 then     'IZQUIERDA
	MOVF       _comando+3, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;Robot_teleoperado_android_tablet.mbas,167 :: 		adelante()
	CALL       Robot_teleoperado_android_tablet_adelante+0
;Robot_teleoperado_android_tablet.mbas,168 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,169 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,170 :: 		PORTB=4
	MOVLW      4
	MOVWF      PORTB+0
L__main64:
;Robot_teleoperado_android_tablet.mbas,172 :: 		if comando[4]=0x31 then     'DERECHA
	MOVF       _comando+4, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;Robot_teleoperado_android_tablet.mbas,173 :: 		adelante()
	CALL       Robot_teleoperado_android_tablet_adelante+0
;Robot_teleoperado_android_tablet.mbas,174 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,175 :: 		PWM2_Set_Duty(vel/4)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	RRF        FARG_PWM2_Set_Duty_new_duty+0, 1
	BCF        FARG_PWM2_Set_Duty_new_duty+0, 7
	RRF        FARG_PWM2_Set_Duty_new_duty+0, 1
	BCF        FARG_PWM2_Set_Duty_new_duty+0, 7
	CALL       _PWM2_Set_Duty+0
;Robot_teleoperado_android_tablet.mbas,176 :: 		PORTB=8
	MOVLW      8
	MOVWF      PORTB+0
L__main67:
;Robot_teleoperado_android_tablet.mbas,178 :: 		if comando[5]=0x31 then     'PARAR
	MOVF       _comando+5, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main70
;Robot_teleoperado_android_tablet.mbas,179 :: 		parar()
	CALL       Robot_teleoperado_android_tablet_parar+0
;Robot_teleoperado_android_tablet.mbas,180 :: 		PORTB=0
	CLRF       PORTB+0
L__main70:
;Robot_teleoperado_android_tablet.mbas,182 :: 		wend
	GOTO       L__main53
	GOTO       $+0
; end of _main
