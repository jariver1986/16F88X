
_main:

;alarma_antirrobo.mbas,5 :: 		main:
;alarma_antirrobo.mbas,7 :: 		ANSEL  = 0x01
	MOVLW      1
	MOVWF      ANSEL+0
;alarma_antirrobo.mbas,8 :: 		ANSELH = 0x00
	CLRF       ANSELH+0
;alarma_antirrobo.mbas,9 :: 		TRISA  = 0X01
	MOVLW      1
	MOVWF      TRISA+0
;alarma_antirrobo.mbas,10 :: 		PORTA  = 0X00
	CLRF       PORTA+0
;alarma_antirrobo.mbas,12 :: 		TRISB  = 0X00
	CLRF       TRISB+0
;alarma_antirrobo.mbas,13 :: 		PORTB  = 0X00
	CLRF       PORTB+0
;alarma_antirrobo.mbas,15 :: 		TRISC  = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;alarma_antirrobo.mbas,16 :: 		PORTC  = 0X00
	CLRF       PORTC+0
;alarma_antirrobo.mbas,18 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;alarma_antirrobo.mbas,20 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;alarma_antirrobo.mbas,23 :: 		while (1)
L__main2:
;alarma_antirrobo.mbas,24 :: 		sensor1 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor1+0
	MOVF       R0+1, 0
	MOVWF      _sensor1+1
	RRF        _sensor1+1, 1
	RRF        _sensor1+0, 1
	BCF        _sensor1+1, 7
	RRF        _sensor1+1, 1
	RRF        _sensor1+0, 1
	BCF        _sensor1+1, 7
;alarma_antirrobo.mbas,25 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
;alarma_antirrobo.mbas,26 :: 		sensor2 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor2+0
	MOVF       R0+1, 0
	MOVWF      _sensor2+1
	RRF        _sensor2+1, 1
	RRF        _sensor2+0, 1
	BCF        _sensor2+1, 7
	RRF        _sensor2+1, 1
	RRF        _sensor2+0, 1
	BCF        _sensor2+1, 7
;alarma_antirrobo.mbas,27 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
;alarma_antirrobo.mbas,28 :: 		sensor3 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor3+0
	MOVF       R0+1, 0
	MOVWF      _sensor3+1
	RRF        _sensor3+1, 1
	RRF        _sensor3+0, 1
	BCF        _sensor3+1, 7
	RRF        _sensor3+1, 1
	RRF        _sensor3+0, 1
	BCF        _sensor3+1, 7
;alarma_antirrobo.mbas,29 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
	NOP
;alarma_antirrobo.mbas,30 :: 		sensor4 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor4+0
	MOVF       R0+1, 0
	MOVWF      _sensor4+1
	RRF        _sensor4+1, 1
	RRF        _sensor4+0, 1
	BCF        _sensor4+1, 7
	RRF        _sensor4+1, 1
	RRF        _sensor4+0, 1
	BCF        _sensor4+1, 7
;alarma_antirrobo.mbas,31 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	DECFSZ     R11+0, 1
	GOTO       L__main9
	NOP
;alarma_antirrobo.mbas,32 :: 		sensor5 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor5+0
	MOVF       R0+1, 0
	MOVWF      _sensor5+1
	RRF        _sensor5+1, 1
	RRF        _sensor5+0, 1
	BCF        _sensor5+1, 7
	RRF        _sensor5+1, 1
	RRF        _sensor5+0, 1
	BCF        _sensor5+1, 7
;alarma_antirrobo.mbas,33 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
;alarma_antirrobo.mbas,34 :: 		sensor6 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor6+0
	MOVF       R0+1, 0
	MOVWF      _sensor6+1
	RRF        _sensor6+1, 1
	RRF        _sensor6+0, 1
	BCF        _sensor6+1, 7
	RRF        _sensor6+1, 1
	RRF        _sensor6+0, 1
	BCF        _sensor6+1, 7
;alarma_antirrobo.mbas,35 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	DECFSZ     R12+0, 1
	GOTO       L__main11
	DECFSZ     R11+0, 1
	GOTO       L__main11
	NOP
;alarma_antirrobo.mbas,36 :: 		sensor7 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor7+0
	MOVF       R0+1, 0
	MOVWF      _sensor7+1
	RRF        _sensor7+1, 1
	RRF        _sensor7+0, 1
	BCF        _sensor7+1, 7
	RRF        _sensor7+1, 1
	RRF        _sensor7+0, 1
	BCF        _sensor7+1, 7
;alarma_antirrobo.mbas,37 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
	NOP
;alarma_antirrobo.mbas,38 :: 		sensor8 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor8+0
	MOVF       R0+1, 0
	MOVWF      _sensor8+1
	RRF        _sensor8+1, 1
	RRF        _sensor8+0, 1
	BCF        _sensor8+1, 7
	RRF        _sensor8+1, 1
	RRF        _sensor8+0, 1
	BCF        _sensor8+1, 7
;alarma_antirrobo.mbas,39 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
	NOP
;alarma_antirrobo.mbas,40 :: 		sensor9 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor9+0
	MOVF       R0+1, 0
	MOVWF      _sensor9+1
	RRF        _sensor9+1, 1
	RRF        _sensor9+0, 1
	BCF        _sensor9+1, 7
	RRF        _sensor9+1, 1
	RRF        _sensor9+0, 1
	BCF        _sensor9+1, 7
;alarma_antirrobo.mbas,41 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
	NOP
;alarma_antirrobo.mbas,42 :: 		sensor10 = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _sensor10+0
	MOVF       R0+1, 0
	MOVWF      _sensor10+1
	RRF        _sensor10+1, 1
	RRF        _sensor10+0, 1
	BCF        _sensor10+1, 7
	RRF        _sensor10+1, 1
	RRF        _sensor10+0, 1
	BCF        _sensor10+1, 7
;alarma_antirrobo.mbas,43 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main15:
	DECFSZ     R13+0, 1
	GOTO       L__main15
	DECFSZ     R12+0, 1
	GOTO       L__main15
	DECFSZ     R11+0, 1
	GOTO       L__main15
	NOP
;alarma_antirrobo.mbas,44 :: 		promedio=(sensor1+sensor2+sensor3+sensor4+sensor5+sensor6+sensor7+sensor8+sensor9+sensor10)/10
	MOVF       _sensor2+0, 0
	ADDWF      _sensor1+0, 0
	MOVWF      R0+0
	MOVF       _sensor1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _sensor2+1, 0
	MOVWF      R0+1
	MOVF       _sensor3+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor4+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor4+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor5+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor5+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor6+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor6+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor7+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor7+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor8+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor8+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor9+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor9+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _sensor10+0, 0
	ADDWF      R0+0, 1
	MOVF       _sensor10+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _promedio+0
	MOVF       R0+1, 0
	MOVWF      _promedio+1
;alarma_antirrobo.mbas,45 :: 		WordToStr(promedio,texto)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;alarma_antirrobo.mbas,46 :: 		UART1_Write_Text(texto)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;alarma_antirrobo.mbas,47 :: 		IF promedio>100 THEN
	MOVF       _promedio+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       _promedio+0, 0
	SUBLW      100
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L__main17
;alarma_antirrobo.mbas,48 :: 		PORTB=0X00
	CLRF       PORTB+0
;alarma_antirrobo.mbas,49 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
;alarma_antirrobo.mbas,50 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;alarma_antirrobo.mbas,51 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
;alarma_antirrobo.mbas,52 :: 		PORTB=0X00
	CLRF       PORTB+0
;alarma_antirrobo.mbas,53 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	DECFSZ     R11+0, 1
	GOTO       L__main21
;alarma_antirrobo.mbas,54 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;alarma_antirrobo.mbas,55 :: 		Delay_ms(800)
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L__main22:
	DECFSZ     R13+0, 1
	GOTO       L__main22
	DECFSZ     R12+0, 1
	GOTO       L__main22
	DECFSZ     R11+0, 1
	GOTO       L__main22
	NOP
	GOTO       L__main18
;alarma_antirrobo.mbas,56 :: 		ELSE
L__main17:
;alarma_antirrobo.mbas,57 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;alarma_antirrobo.mbas,58 :: 		END IF
L__main18:
;alarma_antirrobo.mbas,59 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
