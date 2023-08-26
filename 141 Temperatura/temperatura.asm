
_main:

;temperatura.mbas,22 :: 		main:
;temperatura.mbas,23 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;temperatura.mbas,24 :: 		PORTA = %00000000
	CLRF       PORTA+0
;temperatura.mbas,25 :: 		TRISA = %11111111
	MOVLW      255
	MOVWF      TRISA+0
;temperatura.mbas,26 :: 		PORTB = %00000000
	CLRF       PORTB+0
;temperatura.mbas,27 :: 		TRISB = %00000000
	CLRF       TRISB+0
;temperatura.mbas,28 :: 		PORTC = %00000000
	CLRF       PORTC+0
;temperatura.mbas,29 :: 		TRISC = %00000000
	CLRF       TRISC+0
;temperatura.mbas,30 :: 		PORTD = %00000000
	CLRF       PORTD+0
;temperatura.mbas,31 :: 		TRISD = %00000000
	CLRF       TRISD+0
;temperatura.mbas,32 :: 		PORTE = %00000000
	CLRF       PORTE+0
;temperatura.mbas,33 :: 		TRISE = %00000000
	CLRF       TRISE+0
;temperatura.mbas,34 :: 		ANSEL = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;temperatura.mbas,35 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;temperatura.mbas,37 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;temperatura.mbas,38 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,40 :: 		Lcd_Out(1,1,"SENSOR DE")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,41 :: 		Lcd_Out(2,1,"TEMPERATURA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,42 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;temperatura.mbas,43 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,45 :: 		Lcd_Out(1,1,"ANDRES C.")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,46 :: 		Lcd_Out(2,1,"OSCAR Z.")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,47 :: 		Delay_ms(1000)
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
;temperatura.mbas,48 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,49 :: 		Lcd_Out(1,1,"ITALO O.")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,50 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
	NOP
;temperatura.mbas,52 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,53 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main4:
	DECFSZ     R13+0, 1
	GOTO       L__main4
	DECFSZ     R12+0, 1
	GOTO       L__main4
	DECFSZ     R11+0, 1
	GOTO       L__main4
	NOP
	NOP
;temperatura.mbas,55 :: 		DESEADA=0
	CLRF       R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      _DESEADA+0
	MOVF       R0+1, 0
	MOVWF      _DESEADA+1
	MOVF       R0+2, 0
	MOVWF      _DESEADA+2
	MOVF       R0+3, 0
	MOVWF      _DESEADA+3
;temperatura.mbas,56 :: 		TEMP =0
	MOVF       R0+0, 0
	MOVWF      _TEMP+0
	MOVF       R0+1, 0
	MOVWF      _TEMP+1
	MOVF       R0+2, 0
	MOVWF      _TEMP+2
	MOVF       R0+3, 0
	MOVWF      _TEMP+3
;temperatura.mbas,59 :: 		while 1
L__main6:
;temperatura.mbas,60 :: 		temp = Adc_Read(0)*0.48875
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	CALL       _Word2Double+0
	MOVLW      113
	MOVWF      R4+0
	MOVLW      61
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _TEMP+0
	MOVF       R0+1, 0
	MOVWF      _TEMP+1
	MOVF       R0+2, 0
	MOVWF      _TEMP+2
	MOVF       R0+3, 0
	MOVWF      _TEMP+3
;temperatura.mbas,61 :: 		valor1=Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR1+0
	MOVF       R0+1, 0
	MOVWF      _VALOR1+1
;temperatura.mbas,62 :: 		deseada = Adc_Read(1)*0.48875
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	CALL       _Word2Double+0
	MOVLW      113
	MOVWF      R4+0
	MOVLW      61
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _DESEADA+0
	MOVF       R0+1, 0
	MOVWF      _DESEADA+1
	MOVF       R0+2, 0
	MOVWF      _DESEADA+2
	MOVF       R0+3, 0
	MOVWF      _DESEADA+3
;temperatura.mbas,63 :: 		valor2=Adc_Read(1)
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _VALOR2+0
	MOVF       R0+1, 0
	MOVWF      _VALOR2+1
;temperatura.mbas,64 :: 		if valor1>valor2 then
	MOVF       _VALOR1+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVF       _VALOR1+0, 0
	SUBWF      R0+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L__main11
;temperatura.mbas,65 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,66 :: 		Lcd_Out(1,1,"SISTEMA EN")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,67 :: 		Lcd_Out(2,1,"ALERTA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,68 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
	NOP
	NOP
;temperatura.mbas,69 :: 		PORTB.RB7=1
	BSF        PORTB+0, 7
;temperatura.mbas,70 :: 		Delay_ms(200)
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
;temperatura.mbas,71 :: 		PORTB.RB7=0
	BCF        PORTB+0, 7
;temperatura.mbas,72 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main15:
	DECFSZ     R13+0, 1
	GOTO       L__main15
	DECFSZ     R12+0, 1
	GOTO       L__main15
	DECFSZ     R11+0, 1
	GOTO       L__main15
;temperatura.mbas,73 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L__main12
;temperatura.mbas,74 :: 		ELSE
L__main11:
;temperatura.mbas,75 :: 		PORTB.RB7=0
	BCF        PORTB+0, 7
;temperatura.mbas,76 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,77 :: 		end if
L__main12:
;temperatura.mbas,79 :: 		floatToStr(temp,texto)
	MOVF       _TEMP+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       _TEMP+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       _TEMP+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       _TEMP+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _TEXTO+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;temperatura.mbas,80 :: 		Lcd_Out(1,1,"TEMP :")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,81 :: 		Lcd_Out(1,14,texto)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,84 :: 		floatToStr(deseada,texto2)
	MOVF       _DESEADA+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       _DESEADA+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       _DESEADA+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       _DESEADA+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _TEXTO2+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;temperatura.mbas,85 :: 		Lcd_Out(2,1,"SETEADO:")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,86 :: 		Lcd_Out(2,14,texto2)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,87 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,90 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,91 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
