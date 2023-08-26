
distancia_1_sensor_ultrasonico1:

;distancia_1_sensor.mbas,7 :: 		dim distan,tiempo as word
;distancia_1_sensor.mbas,8 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;distancia_1_sensor.mbas,10 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;distancia_1_sensor.mbas,11 :: 		Delay_us(150)
	MOVLW      99
	MOVWF      R13+0
L_distancia_1_sensor_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_distancia_1_sensor_ultrasonico11
	NOP
	NOP
;distancia_1_sensor.mbas,12 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;distancia_1_sensor.mbas,14 :: 		DO
L_distancia_1_sensor_ultrasonico12:
;distancia_1_sensor.mbas,15 :: 		IF( PORTC.RC3 = 1 )THEN
	BTFSS      PORTC+0, 3
	GOTO       L_distancia_1_sensor_ultrasonico18
;distancia_1_sensor.mbas,16 :: 		TMR0 = 0
	CLRF       TMR0+0
;distancia_1_sensor.mbas,17 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_distancia_1_sensor_ultrasonico18:
;distancia_1_sensor.mbas,19 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_distancia_1_sensor_ultrasonico15
	GOTO       L_distancia_1_sensor_ultrasonico12
L_distancia_1_sensor_ultrasonico15:
;distancia_1_sensor.mbas,21 :: 		DO
L_distancia_1_sensor_ultrasonico110:
;distancia_1_sensor.mbas,22 :: 		IF( PORTC.RC3 = 0 )THEN
	BTFSC      PORTC+0, 3
	GOTO       L_distancia_1_sensor_ultrasonico116
;distancia_1_sensor.mbas,23 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;distancia_1_sensor.mbas,24 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_distancia_1_sensor_ultrasonico116:
;distancia_1_sensor.mbas,29 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_distancia_1_sensor_ultrasonico113
	GOTO       L_distancia_1_sensor_ultrasonico110
L_distancia_1_sensor_ultrasonico113:
;distancia_1_sensor.mbas,31 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_distancia_1_sensor_ultrasonico125:
	BTFSC      STATUS+0, 2
	GOTO       L_distancia_1_sensor_ultrasonico126
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_distancia_1_sensor_ultrasonico125
L_distancia_1_sensor_ultrasonico126:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;distancia_1_sensor.mbas,32 :: 		Delay_ms (50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_distancia_1_sensor_ultrasonico118:
	DECFSZ     R13+0, 1
	GOTO       L_distancia_1_sensor_ultrasonico118
	DECFSZ     R12+0, 1
	GOTO       L_distancia_1_sensor_ultrasonico118
	NOP
	NOP
;distancia_1_sensor.mbas,33 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of distancia_1_sensor_ultrasonico1

_main:

;distancia_1_sensor.mbas,35 :: 		main:
;distancia_1_sensor.mbas,36 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;distancia_1_sensor.mbas,37 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;distancia_1_sensor.mbas,38 :: 		TRISA  = %00000001
	MOVLW      1
	MOVWF      TRISA+0
;distancia_1_sensor.mbas,39 :: 		TRISB  = %00000000
	CLRF       TRISB+0
;distancia_1_sensor.mbas,40 :: 		TRISC  = %10001010
	MOVLW      138
	MOVWF      TRISC+0
;distancia_1_sensor.mbas,41 :: 		PORTA  = %00000000
	CLRF       PORTA+0
;distancia_1_sensor.mbas,42 :: 		PORTB  = %00000000
	CLRF       PORTB+0
;distancia_1_sensor.mbas,43 :: 		PORTC  = %00000000
	CLRF       PORTC+0
;distancia_1_sensor.mbas,44 :: 		ANSEL  = %00000001
	MOVLW      1
	MOVWF      ANSEL+0
;distancia_1_sensor.mbas,45 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;distancia_1_sensor.mbas,46 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;distancia_1_sensor.mbas,47 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;distancia_1_sensor.mbas,48 :: 		while 1
L__main21:
;distancia_1_sensor.mbas,51 :: 		WordToStr(distancia,texto)
	MOVF       _DISTANCIA+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _DISTANCIA+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;distancia_1_sensor.mbas,52 :: 		UART1_Write_Text("ultrasonico = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
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
;distancia_1_sensor.mbas,53 :: 		UART1_Write_Text(texto)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;distancia_1_sensor.mbas,54 :: 		UART1_Write(0x0d)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;distancia_1_sensor.mbas,55 :: 		UART1_Write(0x0a)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;distancia_1_sensor.mbas,56 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;distancia_1_sensor.mbas,59 :: 		UART1_Write_Text("LV = ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
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
;distancia_1_sensor.mbas,60 :: 		WordToStr(dato,texto)
	MOVF       _dato+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _dato+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;distancia_1_sensor.mbas,61 :: 		UART1_Write_Text(texto)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;distancia_1_sensor.mbas,62 :: 		UART1_Write(0x0d)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;distancia_1_sensor.mbas,63 :: 		UART1_Write(0x0a)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;distancia_1_sensor.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;distancia_1_sensor.mbas,66 :: 		wend
	GOTO       L__main21
	GOTO       $+0
; end of _main
