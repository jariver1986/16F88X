
temperatura_led:

;temperatura.mbas,19 :: 		sub procedure led
;temperatura.mbas,20 :: 		PORTD.RD1=1
	BSF        PORTD+0, 1
;temperatura.mbas,21 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_temperatura_led1:
	DECFSZ     R13+0, 1
	GOTO       L_temperatura_led1
	DECFSZ     R12+0, 1
	GOTO       L_temperatura_led1
	DECFSZ     R11+0, 1
	GOTO       L_temperatura_led1
;temperatura.mbas,22 :: 		PORTD.RD1=0
	BCF        PORTD+0, 1
;temperatura.mbas,23 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_temperatura_led2:
	DECFSZ     R13+0, 1
	GOTO       L_temperatura_led2
	DECFSZ     R12+0, 1
	GOTO       L_temperatura_led2
	DECFSZ     R11+0, 1
	GOTO       L_temperatura_led2
	RETURN
; end of temperatura_led

_main:

;temperatura.mbas,25 :: 		main:
;temperatura.mbas,26 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;temperatura.mbas,28 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;temperatura.mbas,30 :: 		TRISA = 0X01 ' porta.5 como entrada digital
	MOVLW      1
	MOVWF      TRISA+0
;temperatura.mbas,31 :: 		PORTA = 0X00
	CLRF       PORTA+0
;temperatura.mbas,33 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;temperatura.mbas,34 :: 		PORTB = 0X00
	CLRF       PORTB+0
;temperatura.mbas,36 :: 		TRISC = 0X80 ' porta.5 como entrada digital
	MOVLW      128
	MOVWF      TRISC+0
;temperatura.mbas,37 :: 		PORTC = 0X00
	CLRF       PORTC+0
;temperatura.mbas,39 :: 		TRISD = 0X00 ' porta.5 como entrada digital
	CLRF       TRISD+0
;temperatura.mbas,40 :: 		PORTD = 0X00
	CLRF       PORTD+0
;temperatura.mbas,41 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;temperatura.mbas,42 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;temperatura.mbas,43 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;temperatura.mbas,44 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,47 :: 		texto = "000.0000" ' formato del texto a mostrar
	MOVLW      _texto+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;temperatura.mbas,48 :: 		Lcd_Out(1,1," U. Tecnica")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
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
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,49 :: 		Lcd_Out(2,1," de Machala")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,50 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,51 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,52 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,53 :: 		Lcd_Out(1,1," Por: Jhonathan")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,54 :: 		Lcd_Out(2,1,"      Rodriguez")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      122
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,55 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,56 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,57 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,58 :: 		Lcd_Out(1,1," Cargando")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temperatura.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,60 :: 		Lcd_Out(1,1," Cargando.")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
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
;temperatura.mbas,61 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,62 :: 		Lcd_Out(1,1," Cargando..")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;temperatura.mbas,63 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,64 :: 		Lcd_Out(1,1," Cargando...")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;temperatura.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,66 :: 		Lcd_Out(1,1," Cargando....")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;temperatura.mbas,67 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;temperatura.mbas,68 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temperatura.mbas,69 :: 		Lcd_Out(1,1," Temperatura[c]:")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
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
;temperatura.mbas,70 :: 		while (TRUE)
L__main5:
;temperatura.mbas,71 :: 		dato = Adc_Read(0)*0.488
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	CALL       _Word2Double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
	MOVF       R0+1, 0
	MOVWF      _dato+1
	MOVF       R0+2, 0
	MOVWF      _dato+2
	MOVF       R0+3, 0
	MOVWF      _dato+3
;temperatura.mbas,72 :: 		floatToStr(dato,texto)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _texto+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;temperatura.mbas,73 :: 		Lcd_Chr(2,7,texto[0])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _texto+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;temperatura.mbas,74 :: 		Lcd_Chr(2,8,texto[1])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _texto+1, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;temperatura.mbas,75 :: 		Lcd_Chr(2,9,texto[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _texto+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;temperatura.mbas,76 :: 		Lcd_Chr(2,10,texto[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _texto+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;temperatura.mbas,77 :: 		Lcd_Chr(2,11,texto[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _texto+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;temperatura.mbas,79 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	DECFSZ     R11+0, 1
	GOTO       L__main9
	NOP
	NOP
;temperatura.mbas,80 :: 		wend
	GOTO       L__main5
	GOTO       $+0
; end of _main
