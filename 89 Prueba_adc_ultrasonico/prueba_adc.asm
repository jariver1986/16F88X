
prueba_adc_PULSO:

;prueba_adc.mbas,7 :: 		SUB PROCEDURE PULSO()
;prueba_adc.mbas,8 :: 		PORTC.3=1
	BSF        PORTC+0, 3
;prueba_adc.mbas,9 :: 		Delay_us(150)
	MOVLW      99
	MOVWF      R13+0
L_prueba_adc_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_adc_PULSO1
	NOP
	NOP
;prueba_adc.mbas,10 :: 		PORTC.3=0
	BCF        PORTC+0, 3
	RETURN
; end of prueba_adc_PULSO

_main:

;prueba_adc.mbas,13 :: 		main:
;prueba_adc.mbas,15 :: 		OPTION_REG=%10000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      134
	MOVWF      OPTION_REG+0
;prueba_adc.mbas,18 :: 		OSCCON = 0X75 ' Oscilador interno de 4mhz
	MOVLW      117
	MOVWF      OSCCON+0
;prueba_adc.mbas,20 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;prueba_adc.mbas,21 :: 		PORTB = 0X00
	CLRF       PORTB+0
;prueba_adc.mbas,23 :: 		TRISA = 0X01 ' PORTC salidas
	MOVLW      1
	MOVWF      TRISA+0
;prueba_adc.mbas,24 :: 		PORTA = 0X00
	CLRF       PORTA+0
;prueba_adc.mbas,26 :: 		TRISC = 0X31 ' PORTC salidas
	MOVLW      49
	MOVWF      TRISC+0
;prueba_adc.mbas,27 :: 		PORTC = 0X00
	CLRF       PORTC+0
;prueba_adc.mbas,29 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;prueba_adc.mbas,30 :: 		PORTE = 0X00
	CLRF       PORTE+0
;prueba_adc.mbas,32 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;prueba_adc.mbas,33 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;prueba_adc.mbas,34 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;prueba_adc.mbas,35 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;prueba_adc.mbas,36 :: 		UART1_Write_Text("HOLA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_adc.mbas,37 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
;prueba_adc.mbas,40 :: 		WHILE(1)
L__main5:
;prueba_adc.mbas,41 :: 		PULSO()
	CALL       prueba_adc_PULSO+0
;prueba_adc.mbas,42 :: 		DISTANCIA = Adc_Read(0)>>2 + DISTANCIA
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
	MOVF       _DISTANCIA+0, 0
	ADDWF      R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _DISTANCIA+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;prueba_adc.mbas,43 :: 		WordToStr(DISTANCIA/CONTADOR,TEXT)
	MOVF       _CONTADOR+0, 0
	MOVWF      R4+0
	MOVF       _CONTADOR+1, 0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;prueba_adc.mbas,44 :: 		UART1_Write_Text("XX")
	MOVLW      88
	MOVWF      _main_Local_Text+0
	MOVLW      88
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_adc.mbas,45 :: 		UART1_Write_Text(TEXT)
	MOVLW      _TEXT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_adc.mbas,46 :: 		Delay_ms(200)
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
;prueba_adc.mbas,47 :: 		if (CONTADOR>60000)or(distancia>60000) then
	MOVF       _CONTADOR+1, 0
	SUBLW      234
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _CONTADOR+0, 0
	SUBLW      96
L__main13:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _DISTANCIA+1, 0
	SUBLW      234
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       _DISTANCIA+0, 0
	SUBLW      96
L__main14:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main11
;prueba_adc.mbas,48 :: 		DISTANCIA=0
	CLRF       _DISTANCIA+0
	CLRF       _DISTANCIA+1
;prueba_adc.mbas,49 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
L__main11:
;prueba_adc.mbas,52 :: 		WEND
	GOTO       L__main5
	GOTO       $+0
; end of _main
