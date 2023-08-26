
PRACTICA2_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;PRACTICA2.mbas,9 :: 		sub procedure interrupt
;PRACTICA2.mbas,13 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_PRACTICA2_interrupt2
;PRACTICA2.mbas,14 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;PRACTICA2.mbas,15 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;PRACTICA2.mbas,18 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt7
;PRACTICA2.mbas,19 :: 		if dato_recep = "L" then ' I
	MOVF       _dato_recep+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt9
;PRACTICA2.mbas,20 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt10
;PRACTICA2.mbas,21 :: 		else
L_PRACTICA2_interrupt9:
;PRACTICA2.mbas,22 :: 		viajero = 0
	CLRF       _viajero+0
;PRACTICA2.mbas,23 :: 		end if
L_PRACTICA2_interrupt10:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt7:
;PRACTICA2.mbas,24 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt13
;PRACTICA2.mbas,25 :: 		if dato_recep = "U" then
	MOVF       _dato_recep+0, 0
	XORLW      85
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt15
;PRACTICA2.mbas,26 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt16
;PRACTICA2.mbas,27 :: 		else
L_PRACTICA2_interrupt15:
;PRACTICA2.mbas,28 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,29 :: 		end if
L_PRACTICA2_interrupt16:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt13:
;PRACTICA2.mbas,30 :: 		case 2
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt19
;PRACTICA2.mbas,31 :: 		if dato_recep = "Z" then
	MOVF       _dato_recep+0, 0
	XORLW      90
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt21
;PRACTICA2.mbas,32 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt22
;PRACTICA2.mbas,33 :: 		else
L_PRACTICA2_interrupt21:
;PRACTICA2.mbas,34 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,35 :: 		end if
L_PRACTICA2_interrupt22:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt19:
;PRACTICA2.mbas,37 :: 		case 3
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt25
;PRACTICA2.mbas,38 :: 		if dato_recep = "0" then
	MOVF       _dato_recep+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt27
;PRACTICA2.mbas,39 :: 		viajero = 4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt28
;PRACTICA2.mbas,40 :: 		else
L_PRACTICA2_interrupt27:
;PRACTICA2.mbas,41 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,42 :: 		end if
L_PRACTICA2_interrupt28:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt25:
;PRACTICA2.mbas,43 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt31
;PRACTICA2.mbas,44 :: 		if dato_recep = "0" then
	MOVF       _dato_recep+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt33
;PRACTICA2.mbas,45 :: 		viajero = 5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt34
;PRACTICA2.mbas,46 :: 		else
L_PRACTICA2_interrupt33:
;PRACTICA2.mbas,47 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,48 :: 		end if
L_PRACTICA2_interrupt34:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt31:
;PRACTICA2.mbas,49 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt37
;PRACTICA2.mbas,50 :: 		if dato_recep = "1" then
	MOVF       _dato_recep+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt39
;PRACTICA2.mbas,51 :: 		viajero = 6
	MOVLW      6
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt40
;PRACTICA2.mbas,52 :: 		else
L_PRACTICA2_interrupt39:
;PRACTICA2.mbas,53 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,54 :: 		end if
L_PRACTICA2_interrupt40:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt37:
;PRACTICA2.mbas,55 :: 		case 6
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt43
;PRACTICA2.mbas,56 :: 		temp4 = dato_recep    ' 1=0n  ; 2=off  ; 3=automático
	MOVF       _dato_recep+0, 0
	MOVWF      _temp4+0
;PRACTICA2.mbas,57 :: 		viajero=7
	MOVLW      7
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt43:
;PRACTICA2.mbas,58 :: 		case 7
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt46
;PRACTICA2.mbas,59 :: 		if dato_recep = "F" then
	MOVF       _dato_recep+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt48
;PRACTICA2.mbas,60 :: 		viajero = 8
	MOVLW      8
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt49
;PRACTICA2.mbas,61 :: 		else
L_PRACTICA2_interrupt48:
;PRACTICA2.mbas,62 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,63 :: 		end if
L_PRACTICA2_interrupt49:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt46:
;PRACTICA2.mbas,64 :: 		case 8
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt52
;PRACTICA2.mbas,65 :: 		viajero=0
	CLRF       _viajero+0
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt52:
L_PRACTICA2_interrupt4:
;PRACTICA2.mbas,66 :: 		end select
L_PRACTICA2_interrupt2:
;PRACTICA2.mbas,68 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;PRACTICA2.mbas,69 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;PRACTICA2.mbas,70 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_PRACTICA2_interrupt106:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of PRACTICA2_interrupt

PRACTICA2_LED1_ON:

;PRACTICA2.mbas,73 :: 		SUB PROCEDURE LED1_ON()
;PRACTICA2.mbas,74 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
	RETURN
; end of PRACTICA2_LED1_ON

PRACTICA2_LED1_OFF:

;PRACTICA2.mbas,76 :: 		SUB PROCEDURE LED1_OFF()
;PRACTICA2.mbas,77 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
	RETURN
; end of PRACTICA2_LED1_OFF

PRACTICA2_LED2_ON:

;PRACTICA2.mbas,80 :: 		SUB PROCEDURE LED2_ON()
;PRACTICA2.mbas,81 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
	RETURN
; end of PRACTICA2_LED2_ON

PRACTICA2_LED2_OFF:

;PRACTICA2.mbas,83 :: 		SUB PROCEDURE LED2_OFF()
;PRACTICA2.mbas,84 :: 		PORTB.RB2=0
	BCF        PORTB+0, 2
	RETURN
; end of PRACTICA2_LED2_OFF

_main:

;PRACTICA2.mbas,87 :: 		main:
;PRACTICA2.mbas,88 :: 		ANSEL  = 0x07                          ' Configure AN pins as digital I/O
	MOVLW      7
	MOVWF      ANSEL+0
;PRACTICA2.mbas,89 :: 		ANSELH = 0
	CLRF       ANSELH+0
;PRACTICA2.mbas,90 :: 		TRISA=0X07
	MOVLW      7
	MOVWF      TRISA+0
;PRACTICA2.mbas,91 :: 		PORTA=0X00
	CLRF       PORTA+0
;PRACTICA2.mbas,93 :: 		TRISB=0X00
	CLRF       TRISB+0
;PRACTICA2.mbas,94 :: 		PORTB=0X00
	CLRF       PORTB+0
;PRACTICA2.mbas,96 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;PRACTICA2.mbas,97 :: 		PORTC=0X00
	CLRF       PORTC+0
;PRACTICA2.mbas,100 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;PRACTICA2.mbas,101 :: 		OPTION_REG=%1000100
	MOVLW      68
	MOVWF      OPTION_REG+0
;PRACTICA2.mbas,104 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PRACTICA2.mbas,105 :: 		INTCON=%11100000
	MOVLW      224
	MOVWF      INTCON+0
;PRACTICA2.mbas,107 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;PRACTICA2.mbas,108 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;PRACTICA2.mbas,110 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PRACTICA2.mbas,111 :: 		PWM1_Start
	CALL       _PWM1_Start+0
;PRACTICA2.mbas,114 :: 		TMR0=0
	CLRF       TMR0+0
;PRACTICA2.mbas,115 :: 		TEMP=0
	CLRF       _TEMP+0
	CLRF       _TEMP+1
;PRACTICA2.mbas,116 :: 		LUZ=0
	CLRF       _LUZ+0
	CLRF       _LUZ+1
;PRACTICA2.mbas,117 :: 		CONT=0
	CLRF       _CONT+0
;PRACTICA2.mbas,118 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,119 :: 		dato_listo=0
	BCF        _dato_listo+0, BitPos(_dato_listo+0)
;PRACTICA2.mbas,120 :: 		TIEMPO=0
	CLRF       _TIEMPO+0
	CLRF       _TIEMPO+1
;PRACTICA2.mbas,121 :: 		CIRCUITO2=0
	CLRF       _CIRCUITO2+0
;PRACTICA2.mbas,122 :: 		CIRCUITO1=0
	CLRF       _CIRCUITO1+0
;PRACTICA2.mbas,123 :: 		BANDERA=0
	CLRF       _BANDERA+0
;PRACTICA2.mbas,124 :: 		LDR=0
	CLRF       _LDR+0
	CLRF       _LDR+1
;PRACTICA2.mbas,125 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;PRACTICA2.mbas,126 :: 		MOVIMIENTO=0
	CLRF       _MOVIMIENTO+0
;PRACTICA2.mbas,127 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,128 :: 		contador=0
	CLRF       _contador+0
	CLRF       _contador+1
;PRACTICA2.mbas,129 :: 		temp4=0X33
	MOVLW      51
	MOVWF      _temp4+0
;PRACTICA2.mbas,132 :: 		WHILE(1)
L__main60:
;PRACTICA2.mbas,134 :: 		while(temp4=0X31)          'enncender
L__main65:
	MOVF       _temp4+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main66
;PRACTICA2.mbas,135 :: 		PWM1_Set_Duty(255)
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,136 :: 		wend
	GOTO       L__main65
L__main66:
;PRACTICA2.mbas,138 :: 		while(temp4=0X32)          'apagar
L__main70:
	MOVF       _temp4+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main71
;PRACTICA2.mbas,139 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,140 :: 		wend
	GOTO       L__main70
L__main71:
;PRACTICA2.mbas,142 :: 		while(temp4=0X33)
L__main75:
	MOVF       _temp4+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main76
;PRACTICA2.mbas,143 :: 		IF  CENTINELA=0 THEN  'EN EL DIA
	MOVF       _CENTINELA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
;PRACTICA2.mbas,144 :: 		MOVIMIENTO=0
	CLRF       _MOVIMIENTO+0
;PRACTICA2.mbas,145 :: 		LED1_OFF()
	CALL       PRACTICA2_LED1_OFF+0
;PRACTICA2.mbas,146 :: 		LED2_OFF()
	CALL       PRACTICA2_LED2_OFF+0
;PRACTICA2.mbas,149 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,151 :: 		LDR = Adc_Read(1)>>2
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	MOVWF      R3+1
	RRF        R3+1, 1
	RRF        R3+0, 1
	BCF        R3+1, 7
	RRF        R3+1, 1
	RRF        R3+0, 1
	BCF        R3+1, 7
	MOVF       R3+0, 0
	MOVWF      _LDR+0
	MOVF       R3+1, 0
	MOVWF      _LDR+1
;PRACTICA2.mbas,152 :: 		IF (LDR=250)or(LDR=251)or(LDR=252)or(LDR=253)or(LDR=254) THEN  'ENTRA SI ES DE NOCHE
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main107
	MOVLW      250
	XORWF      R3+0, 0
L__main107:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main108
	MOVLW      251
	XORWF      R3+0, 0
L__main108:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main109
	MOVLW      252
	XORWF      R3+0, 0
L__main109:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main110
	MOVLW      253
	XORWF      R3+0, 0
L__main110:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main111
	MOVLW      254
	XORWF      R3+0, 0
L__main111:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main83
;PRACTICA2.mbas,153 :: 		BANDERA=1     'CONTEO DEL TIEMPO
	MOVLW      1
	MOVWF      _BANDERA+0
;PRACTICA2.mbas,156 :: 		PWM1_Set_Duty(255)
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,157 :: 		CENTINELA=1
	MOVLW      1
	MOVWF      _CENTINELA+0
;PRACTICA2.mbas,158 :: 		LED1_ON()
	CALL       PRACTICA2_LED1_ON+0
;PRACTICA2.mbas,159 :: 		LED2_ON()
	CALL       PRACTICA2_LED2_ON+0
L__main83:
;PRACTICA2.mbas,161 :: 		if (LDR=255) then
	MOVLW      0
	XORWF      _LDR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main112
	MOVLW      255
	XORWF      _LDR+0, 0
L__main112:
	BTFSS      STATUS+0, 2
	GOTO       L__main86
;PRACTICA2.mbas,162 :: 		UART1_Write_Text("LUZ0014F")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main86:
;PRACTICA2.mbas,163 :: 		end if
L__main80:
;PRACTICA2.mbas,166 :: 		IF CENTINELA =1 THEN  'EN LA NOCHE
	MOVF       _CENTINELA+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main89
;PRACTICA2.mbas,167 :: 		LDR = Adc_Read(1)>>2
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
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
	MOVWF      _LDR+0
	MOVF       R2+1, 0
	MOVWF      _LDR+1
;PRACTICA2.mbas,168 :: 		IF LDR<250 THEN  'ENTRA SI ES DE DIA
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main113
	MOVLW      250
	SUBWF      R2+0, 0
L__main113:
	BTFSC      STATUS+0, 0
	GOTO       L__main92
;PRACTICA2.mbas,170 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;PRACTICA2.mbas,171 :: 		LED1_OFF()
	CALL       PRACTICA2_LED1_OFF+0
L__main92:
;PRACTICA2.mbas,172 :: 		END IF
L__main89:
;PRACTICA2.mbas,176 :: 		IF BANDERA=1 THEN  'CONTEO DEL TIEMPO
	MOVF       _BANDERA+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main95
;PRACTICA2.mbas,177 :: 		INC(TIEMPO)
	INCF       _TIEMPO+0, 1
	BTFSC      STATUS+0, 2
	INCF       _TIEMPO+1, 1
;PRACTICA2.mbas,178 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,179 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,180 :: 		IF TIEMPO=10 THEN   'tiempo=10 segundos
	MOVLW      0
	XORWF      _TIEMPO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main114
	MOVLW      10
	XORWF      _TIEMPO+0, 0
L__main114:
	BTFSS      STATUS+0, 2
	GOTO       L__main98
;PRACTICA2.mbas,181 :: 		TIEMPO=0
	CLRF       _TIEMPO+0
	CLRF       _TIEMPO+1
;PRACTICA2.mbas,183 :: 		PWM1_Set_Duty(25)
	MOVLW      25
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,184 :: 		BANDERA=0
	CLRF       _BANDERA+0
;PRACTICA2.mbas,185 :: 		MOVIMIENTO=1
	MOVLW      1
	MOVWF      _MOVIMIENTO+0
;PRACTICA2.mbas,186 :: 		LED2_OFF()
	CALL       PRACTICA2_LED2_OFF+0
L__main98:
;PRACTICA2.mbas,187 :: 		END IF
L__main95:
;PRACTICA2.mbas,191 :: 		IF MOVIMIENTO=1 THEN
	MOVF       _MOVIMIENTO+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main101
;PRACTICA2.mbas,193 :: 		SENSOR = Adc_Read(0)>>2
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
	MOVWF      _SENSOR+0
;PRACTICA2.mbas,194 :: 		IF SENSOR>70 THEN
	MOVF       R2+0, 0
	SUBLW      70
	BTFSC      STATUS+0, 0
	GOTO       L__main104
;PRACTICA2.mbas,196 :: 		PWM1_Set_Duty(255)
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,197 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,198 :: 		LED2_ON()
	CALL       PRACTICA2_LED2_ON+0
	GOTO       L__main105
;PRACTICA2.mbas,199 :: 		ELSE
L__main104:
;PRACTICA2.mbas,201 :: 		PWM1_Set_Duty(25)
	MOVLW      25
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PRACTICA2.mbas,202 :: 		LED2_OFF()
	CALL       PRACTICA2_LED2_OFF+0
;PRACTICA2.mbas,203 :: 		END IF
L__main105:
L__main101:
;PRACTICA2.mbas,205 :: 		wend
	GOTO       L__main75
L__main76:
;PRACTICA2.mbas,206 :: 		WEND
	GOTO       L__main60
	GOTO       $+0
; end of _main
