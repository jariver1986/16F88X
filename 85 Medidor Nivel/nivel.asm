
_main:

;nivel.mbas,35 :: 		main:
;nivel.mbas,38 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;nivel.mbas,40 :: 		TRISA = 0X00
	CLRF       TRISA+0
;nivel.mbas,41 :: 		PORTA = 0x00
	CLRF       PORTA+0
;nivel.mbas,43 :: 		TRISB = 0X01
	MOVLW      1
	MOVWF      TRISB+0
;nivel.mbas,44 :: 		PORTB = 0X00
	CLRF       PORTB+0
;nivel.mbas,46 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;nivel.mbas,47 :: 		PORTC = 0X00
	CLRF       PORTC+0
;nivel.mbas,49 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;nivel.mbas,50 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;nivel.mbas,51 :: 		txt1 = "MEDIDOR DE NIVEL"
	MOVLW      _txt1+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
	CLRF       INDF+0
	INCF       FSR, 1
;nivel.mbas,52 :: 		txt2 = "ESPOL"
	MOVLW      _txt2+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;nivel.mbas,54 :: 		text7 = "P Ayarza"
	MOVLW      _text7+0
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
;nivel.mbas,55 :: 		text8 = "E Chalen"
	MOVLW      _text8+0
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
;nivel.mbas,56 :: 		text9 = "P Pacheco"
	MOVLW      _text9+0
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
;nivel.mbas,57 :: 		text10 ="P Figueroa"
	MOVLW      _text10+0
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
;nivel.mbas,58 :: 		text12 ="W Bagua"
	MOVLW      _text12+0
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
;nivel.mbas,59 :: 		text11 = "Grupo:"
	MOVLW      _text11+0
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
;nivel.mbas,61 :: 		Lcd_Init()                        ' Initialize Lcd
	CALL       _Lcd_Init+0
;nivel.mbas,62 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel.mbas,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel.mbas,65 :: 		Lcd_Out(1,1,txt1)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel.mbas,66 :: 		Lcd_Out(2,7,txt2)                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel.mbas,67 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;nivel.mbas,68 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;nivel.mbas,87 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;nivel.mbas,88 :: 		VUELTA=0
	CLRF       _VUELTA+0
	CLRF       _VUELTA+1
;nivel.mbas,89 :: 		constante=(9.7)/12
	MOVLW      239
	MOVWF      _constante+0
	MOVLW      238
	MOVWF      _constante+1
	MOVLW      78
	MOVWF      _constante+2
	MOVLW      126
	MOVWF      _constante+3
;nivel.mbas,90 :: 		revol=0
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
;nivel.mbas,91 :: 		revol=0
	MOVF       R0+0, 0
	MOVWF      _revol+0
	MOVF       R0+1, 0
	MOVWF      _revol+1
	MOVF       R0+2, 0
	MOVWF      _revol+2
	MOVF       R0+3, 0
	MOVWF      _revol+3
;nivel.mbas,92 :: 		while 1
L__main3:
;nivel.mbas,93 :: 		if portb.rb0=1 then
	BTFSS      PORTB+0, 0
	GOTO       L__main8
;nivel.mbas,94 :: 		while(portb.rb0=1)
L__main11:
	BTFSS      PORTB+0, 0
	GOTO       L__main12
;nivel.mbas,95 :: 		wend
	GOTO       L__main11
L__main12:
;nivel.mbas,96 :: 		revol=revol+1
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
L__main8:
;nivel.mbas,98 :: 		valor = (revol*pi)/2
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
	MOVLW      2
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
;nivel.mbas,99 :: 		FloatToStr(valor, txt5)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _txt5+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;nivel.mbas,107 :: 		Lcd_Out(2,5,txt5)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;nivel.mbas,108 :: 		Delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main15:
	DECFSZ     R13+0, 1
	GOTO       L__main15
	DECFSZ     R12+0, 1
	GOTO       L__main15
	NOP
;nivel.mbas,109 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
