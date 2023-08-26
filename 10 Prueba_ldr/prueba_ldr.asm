
_main:

;prueba_ldr.mbas,7 :: 		main:
;prueba_ldr.mbas,8 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;prueba_ldr.mbas,10 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;prueba_ldr.mbas,12 :: 		TRISA = 0X02 ' porta.5 como entrada digital
	MOVLW      2
	MOVWF      TRISA+0
;prueba_ldr.mbas,13 :: 		PORTA = 0X00
	CLRF       PORTA+0
;prueba_ldr.mbas,15 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;prueba_ldr.mbas,16 :: 		PORTB = 0X00
	CLRF       PORTB+0
;prueba_ldr.mbas,18 :: 		TRISB = 0X80
	MOVLW      128
	MOVWF      TRISB+0
;prueba_ldr.mbas,19 :: 		PORTB = 0X00
	CLRF       PORTB+0
;prueba_ldr.mbas,21 :: 		ANSEL = 0X02 ' AN<7:0>
	MOVLW      2
	MOVWF      ANSEL+0
;prueba_ldr.mbas,22 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;prueba_ldr.mbas,23 :: 		TRISC=0X00
	CLRF       TRISC+0
;prueba_ldr.mbas,24 :: 		PORTC=0X00
	CLRF       PORTC+0
;prueba_ldr.mbas,25 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
	NOP
;prueba_ldr.mbas,26 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;prueba_ldr.mbas,27 :: 		UART1_Write_Text("IDEAS&TECNOLOGIA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      38
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
;prueba_ldr.mbas,28 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,29 :: 		UART1_Write_Text("  LDR  ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
;prueba_ldr.mbas,30 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,31 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
	NOP
;prueba_ldr.mbas,32 :: 		while (TRUE)
L__main4:
;prueba_ldr.mbas,33 :: 		VALOR=Adc_Read(1)
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR+0
	MOVF       R0+1, 0
	MOVWF      _VALOR+1
;prueba_ldr.mbas,34 :: 		WordToStr(VALOR,TEXT)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;prueba_ldr.mbas,36 :: 		PUERTO=VALOR>>2
	MOVF       _VALOR+0, 0
	MOVWF      R0+0
	MOVF       _VALOR+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _PUERTO+0
;prueba_ldr.mbas,37 :: 		PORTB = PUERTO
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;prueba_ldr.mbas,41 :: 		UART1_Write_Text(" distancia: ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
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
;prueba_ldr.mbas,42 :: 		UART1_Write(text[0])
	MOVF       _text+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,43 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,44 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,45 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,46 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,47 :: 		UART1_Write(text[5])
	MOVF       _text+5, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,49 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,50 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_ldr.mbas,51 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
	NOP
	NOP
;prueba_ldr.mbas,52 :: 		wend
	GOTO       L__main4
	GOTO       $+0
; end of _main
