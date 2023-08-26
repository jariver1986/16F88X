
_main:

;Odometro.mbas,32 :: 		main:
;Odometro.mbas,35 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Odometro.mbas,37 :: 		OPTION_REG = 0X83 ' Pull up PORTB desactivado
	MOVLW      131
	MOVWF      OPTION_REG+0
;Odometro.mbas,44 :: 		TRISA = 0X00
	CLRF       TRISA+0
;Odometro.mbas,45 :: 		PORTA = 0x00
	CLRF       PORTA+0
;Odometro.mbas,47 :: 		TRISB = 0X01
	MOVLW      1
	MOVWF      TRISB+0
;Odometro.mbas,48 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Odometro.mbas,50 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;Odometro.mbas,51 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Odometro.mbas,53 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;Odometro.mbas,54 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;Odometro.mbas,58 :: 		txt1 = "ODOMETRO DIGITAL"
	MOVLW      _txt1+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
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
	CLRF       INDF+0
	INCF       FSR, 1
;Odometro.mbas,59 :: 		txt2 = "Lab. Inst. "
	MOVLW      _txt2+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      98
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Odometro.mbas,61 :: 		text7 = "* Joffre"
	MOVLW      _text7+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      102
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      102
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Odometro.mbas,62 :: 		text8 = "* Ricardo"
	MOVLW      _text8+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      114
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
;Odometro.mbas,63 :: 		text9 = "* Andres"
	MOVLW      _text9+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Odometro.mbas,64 :: 		text10 ="* Lupe"
	MOVLW      _text10+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Odometro.mbas,65 :: 		text11 = "Grupo:"
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
;Odometro.mbas,67 :: 		Lcd_Init()                        ' Initialize Lcd
	CALL       _Lcd_Init+0
;Odometro.mbas,68 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,71 :: 		Lcd_Out(1,1,txt1)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,72 :: 		Lcd_Out(2,1,txt2)                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,73 :: 		Delay_ms(2000)
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
;Odometro.mbas,74 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,77 :: 		Lcd_Out(1,1,text11)                ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text11+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,78 :: 		Delay_ms(2000)
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
;Odometro.mbas,79 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,81 :: 		Lcd_Out(1,1,text7)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,82 :: 		Lcd_Out(2,1,text8)                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text8+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,83 :: 		Delay_ms(2000)
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
;Odometro.mbas,84 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,86 :: 		Lcd_Out(1,1,text9)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text9+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,87 :: 		Lcd_Out(2,1,text10)                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text10+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,88 :: 		Delay_ms(2000)
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
;Odometro.mbas,89 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Odometro.mbas,92 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;Odometro.mbas,93 :: 		VUELTA=0
	CLRF       _VUELTA+0
	CLRF       _VUELTA+1
;Odometro.mbas,95 :: 		constante = 6
	MOVLW      6
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      _constante+0
	MOVF       R0+1, 0
	MOVWF      _constante+1
	MOVF       R0+2, 0
	MOVWF      _constante+2
	MOVF       R0+3, 0
	MOVWF      _constante+3
;Odometro.mbas,96 :: 		revol=0
	CLRF       _revol+0
	CLRF       _revol+1
;Odometro.mbas,97 :: 		while 1
L__main6:
;Odometro.mbas,98 :: 		if portb.rb0=1 then
	BTFSS      PORTB+0, 0
	GOTO       L__main11
;Odometro.mbas,99 :: 		while(portb.rb0=1)
L__main14:
	BTFSS      PORTB+0, 0
	GOTO       L__main15
;Odometro.mbas,100 :: 		wend
	GOTO       L__main14
L__main15:
;Odometro.mbas,101 :: 		inc(revol) ' incrementamos las revoluciones para el calculo
	INCF       _revol+0, 1
	BTFSC      STATUS+0, 2
	INCF       _revol+1, 1
;Odometro.mbas,102 :: 		inc(CONTADOR)
	INCF       _CONTADOR+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR+1, 1
L__main11:
;Odometro.mbas,105 :: 		valor = (revol*(PI/6)*(constante))' asignamos las revoluciones al dato valor
	MOVF       _revol+0, 0
	MOVWF      R0+0
	MOVF       _revol+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVLW      146
	MOVWF      R4+0
	MOVLW      10
	MOVWF      R4+1
	MOVLW      6
	MOVWF      R4+2
	MOVLW      126
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       _constante+0, 0
	MOVWF      R4+0
	MOVF       _constante+1, 0
	MOVWF      R4+1
	MOVF       _constante+2, 0
	MOVWF      R4+2
	MOVF       _constante+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;Odometro.mbas,107 :: 		if CONTADOR=12 then  'contador de revoluciones
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      12
	XORWF      _CONTADOR+0, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Odometro.mbas,108 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;Odometro.mbas,109 :: 		INC(VUELTA)
	INCF       _VUELTA+0, 1
	BTFSC      STATUS+0, 2
	INCF       _VUELTA+1, 1
;Odometro.mbas,110 :: 		PORTB.RB7=1
	BSF        PORTB+0, 7
;Odometro.mbas,111 :: 		Delay_ms(200)
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
;Odometro.mbas,112 :: 		PORTB.RB7=0
	BCF        PORTB+0, 7
L__main19:
;Odometro.mbas,116 :: 		wordToStr(VUELTA,txt6)
	MOVF       _VUELTA+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _VUELTA+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _txt6+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Odometro.mbas,117 :: 		Lcd_Out(1,1,"ESPOL")                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,118 :: 		Lcd_Out(1,11,txt6)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,119 :: 		WordToStrWithZeros(valor, txt5)
	MOVF       _valor+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _valor+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _txt5+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;Odometro.mbas,120 :: 		Lcd_Out(2,1,"Dist=")                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
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
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,121 :: 		Lcd_Out(2,7,txt5)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,122 :: 		Lcd_Out(2,14,"cm")                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      99
	MOVWF      _main_Local_Text+0
	MOVLW      109
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Odometro.mbas,123 :: 		Delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main22:
	DECFSZ     R13+0, 1
	GOTO       L__main22
	DECFSZ     R12+0, 1
	GOTO       L__main22
	NOP
;Odometro.mbas,124 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
