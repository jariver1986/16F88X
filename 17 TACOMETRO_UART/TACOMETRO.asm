
TACOMETRO_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;TACOMETRO.mbas,11 :: 		sub procedure interrupt
;TACOMETRO.mbas,12 :: 		if TestBit(INTCON,INTF) then ' hubo la interrupcion por portb.0
	CLRF       R0+0
	BTFSS      INTCON+0, 1
	GOTO       L_TACOMETRO_interrupt4
	MOVLW      1
	MOVWF      R0+0
L_TACOMETRO_interrupt4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_TACOMETRO_interrupt2
;TACOMETRO.mbas,13 :: 		ClearBit(INTCON,INTF)
	BCF        INTCON+0, 1
;TACOMETRO.mbas,14 :: 		inc(revol) ' incrementamos las revoluciones
	INCF       _revol+0, 1
	BTFSC      STATUS+0, 2
	INCF       _revol+1, 1
L_TACOMETRO_interrupt2:
;TACOMETRO.mbas,15 :: 		end if
L_TACOMETRO_interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of TACOMETRO_interrupt

_main:

;TACOMETRO.mbas,19 :: 		main:
;TACOMETRO.mbas,22 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;TACOMETRO.mbas,24 :: 		OPTION_REG = 0X83 ' Pull up PORTB desactivado
	MOVLW      131
	MOVWF      OPTION_REG+0
;TACOMETRO.mbas,27 :: 		INTCON = 0XD0 ' Activado interrupciones globales
	MOVLW      208
	MOVWF      INTCON+0
;TACOMETRO.mbas,31 :: 		TRISA = 0X01
	MOVLW      1
	MOVWF      TRISA+0
;TACOMETRO.mbas,32 :: 		PORTA = 0x00
	CLRF       PORTA+0
;TACOMETRO.mbas,34 :: 		TRISB = 0X01
	MOVLW      1
	MOVWF      TRISB+0
;TACOMETRO.mbas,35 :: 		PORTB = 0X00
	CLRF       PORTB+0
;TACOMETRO.mbas,37 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;TACOMETRO.mbas,38 :: 		PORTC = 0X00
	CLRF       PORTC+0
;TACOMETRO.mbas,40 :: 		ANSEL = 0X01
	MOVLW      1
	MOVWF      ANSEL+0
;TACOMETRO.mbas,41 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;TACOMETRO.mbas,43 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;TACOMETRO.mbas,44 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;TACOMETRO.mbas,45 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;TACOMETRO.mbas,46 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;TACOMETRO.mbas,47 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;TACOMETRO.mbas,49 :: 		DIRA = 0
	BCF        PORTA+0, 2
;TACOMETRO.mbas,50 :: 		DIRNA = 1
	BSF        PORTA+0, 4
;TACOMETRO.mbas,52 :: 		veloc = 0x00
	CLRF       _veloc+0
;TACOMETRO.mbas,54 :: 		while 1
L__main7:
;TACOMETRO.mbas,56 :: 		veloc = Adc_Read(0)>>2 ' obtenemos el valor del adc
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
	MOVWF      _veloc+0
;TACOMETRO.mbas,57 :: 		PWM2_Set_Duty(veloc) ' variamos la velocidad del motor
	MOVF       R2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;TACOMETRO.mbas,58 :: 		PWM1_Set_Duty(veloc) ' variamos la velocidad del motor
	MOVF       _veloc+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;TACOMETRO.mbas,60 :: 		revol = 0 ' revoluciones son iguales a 0
	CLRF       _revol+0
	CLRF       _revol+1
;TACOMETRO.mbas,61 :: 		Delay_ms(1000) ' con este tiempo sabemos cuantas revoluciones van haber en 1seg
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	DECFSZ     R12+0, 1
	GOTO       L__main11
	DECFSZ     R11+0, 1
	GOTO       L__main11
	NOP
	NOP
;TACOMETRO.mbas,62 :: 		valor = revol ' asignamos las revoluciones al dato valor
	MOVF       _revol+0, 0
	MOVWF      _valor+0
	MOVF       _revol+1, 0
	MOVWF      _valor+1
;TACOMETRO.mbas,63 :: 		WordToStr(valor, txt)
	MOVF       _revol+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _revol+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;TACOMETRO.mbas,64 :: 		PORTB= revol
	MOVF       _revol+0, 0
	MOVWF      PORTB+0
;TACOMETRO.mbas,65 :: 		UART1_Write_Text("RPS = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TACOMETRO.mbas,66 :: 		UART1_Write_Text(txt)
	MOVLW      _txt+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TACOMETRO.mbas,67 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TACOMETRO.mbas,68 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TACOMETRO.mbas,70 :: 		wend
	GOTO       L__main7
	GOTO       $+0
; end of _main
