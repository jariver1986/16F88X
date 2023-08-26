
_main:

;nivel2.mbas,23 :: 		main:
;nivel2.mbas,24 :: 		OPTION_REG = 0X00
	CLRF       OPTION_REG+0
;nivel2.mbas,26 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;nivel2.mbas,28 :: 		TRISA = 0X01 ' porta.0 como entrada
	MOVLW      1
	MOVWF      TRISA+0
;nivel2.mbas,29 :: 		PORTA = 0X00
	CLRF       PORTA+0
;nivel2.mbas,31 :: 		TRISB = 0X01
	MOVLW      1
	MOVWF      TRISB+0
;nivel2.mbas,32 :: 		PORTB = 0X00
	CLRF       PORTB+0
;nivel2.mbas,34 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;nivel2.mbas,35 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;nivel2.mbas,36 :: 		VALOR=0
	CLRF       R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;nivel2.mbas,37 :: 		texto3 = "Grupo:"
	MOVLW      _texto3+0
	MOVWF      FSR
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,38 :: 		texto4 = "P Ayarza"
	MOVLW      _texto4+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      121
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      122
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,39 :: 		texto5 = "E Chalen"
	MOVLW      _texto5+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,40 :: 		texto6 = "P Pacheco"
	MOVLW      _texto6+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,41 :: 		texto7 = "P Figueroa"
	MOVLW      _texto7+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
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
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,42 :: 		texto8 = "W Bagua"
	MOVLW      _texto8+0
	MOVWF      FSR
	MOVLW      87
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel2.mbas,44 :: 		delay_ms(250)
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
;nivel2.mbas,45 :: 		Lcd_Init() ' inicializamos la lcd
	CALL       _Lcd_Init+0
;nivel2.mbas,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel2.mbas,47 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel2.mbas,48 :: 		Lcd_Out(1, 1, texto3) ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,49 :: 		Lcd_Out(2, 1, texto4) ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,50 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
;nivel2.mbas,51 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel2.mbas,52 :: 		Lcd_Out(1, 1, texto5) ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,53 :: 		Lcd_Out(2, 1, texto6) ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,54 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
;nivel2.mbas,55 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel2.mbas,56 :: 		Lcd_Out(1, 1, texto7) ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,57 :: 		Lcd_Out(2, 1, texto8) ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto8+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,58 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main4:
	DECFSZ     R13+0, 1
	GOTO       L__main4
	DECFSZ     R12+0, 1
	GOTO       L__main4
	DECFSZ     R11+0, 1
	GOTO       L__main4
	NOP
;nivel2.mbas,59 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel2.mbas,60 :: 		Lcd_Out(1, 1, "NIVEL = [CM]") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,61 :: 		revol=0
	CLRF       R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      _revol+0
	MOVF       R0+1, 0
	MOVWF      _revol+1
	MOVF       R0+2, 0
	MOVWF      _revol+2
	MOVF       R0+3, 0
	MOVWF      _revol+3
;nivel2.mbas,62 :: 		valor=0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;nivel2.mbas,63 :: 		while (TRUE)
L__main6:
;nivel2.mbas,64 :: 		if portb.rb0=1 then
	BTFSS      PORTB+0, 0
	GOTO       L__main11
;nivel2.mbas,65 :: 		while(portb.rb0=1)
L__main14:
	BTFSS      PORTB+0, 0
	GOTO       L__main15
;nivel2.mbas,66 :: 		wend
	GOTO       L__main14
L__main15:
;nivel2.mbas,67 :: 		revol=revol +1
	MOVLW      1
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       _revol+0, 0
	MOVWF      R4+0
	MOVF       _revol+1, 0
	MOVWF      R4+1
	MOVF       _revol+2, 0
	MOVWF      R4+2
	MOVF       _revol+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _revol+0
	MOVF       R0+1, 0
	MOVWF      _revol+1
	MOVF       R0+2, 0
	MOVWF      _revol+2
	MOVF       R0+3, 0
	MOVWF      _revol+3
L__main11:
;nivel2.mbas,69 :: 		VALOR=(revol*PI)/10
	MOVF       _revol+0, 0
	MOVWF      R0+0
	MOVF       _revol+1, 0
	MOVWF      R0+1
	MOVF       _revol+2, 0
	MOVWF      R0+2
	MOVF       _revol+3, 0
	MOVWF      R0+3
	MOVLW      219
	MOVWF      R4+0
	MOVLW      15
	MOVWF      R4+1
	MOVLW      73
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVLW      10
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	MOVF       FLOC__main+2, 0
	MOVWF      R0+2
	MOVF       FLOC__main+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;nivel2.mbas,70 :: 		FLOATToStr(VALOR ,text)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _text+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;nivel2.mbas,71 :: 		Lcd_Out(2, 4, TEXT) ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel2.mbas,72 :: 		Delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	NOP
;nivel2.mbas,73 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
