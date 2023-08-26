
lcd_Move_Delay:

;lcd.mbas,25 :: 		sub procedure Move_Delay()
;lcd.mbas,26 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_lcd_Move_Delay1:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_Move_Delay1
	DECFSZ     R12+0, 1
	GOTO       L_lcd_Move_Delay1
	DECFSZ     R11+0, 1
	GOTO       L_lcd_Move_Delay1
	NOP
	NOP
	RETURN
; end of lcd_Move_Delay

_main:

;lcd.mbas,31 :: 		main:
;lcd.mbas,33 :: 		TRISA = 0
	CLRF       TRISA+0
;lcd.mbas,34 :: 		PORTA = 0xFF
	MOVLW      255
	MOVWF      PORTA+0
;lcd.mbas,35 :: 		TRISA = 0xFF
	MOVLW      255
	MOVWF      TRISA+0
;lcd.mbas,38 :: 		ANSEL  = 0
	CLRF       ANSEL+0
;lcd.mbas,39 :: 		ANSELH = 0
	CLRF       ANSELH+0
;lcd.mbas,41 :: 		txt2 = "IDEAS Y TECNOLOGIAS"
	MOVLW      _txt2+0
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;lcd.mbas,42 :: 		txt3 = " M.E. I&T 04"
	MOVLW      _txt3+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      38
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;lcd.mbas,43 :: 		txt4 = "PRACTICA  LCD"
	MOVLW      _txt4+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;lcd.mbas,45 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;lcd.mbas,46 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,48 :: 		Lcd_Out(1,4,txt3)                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.mbas,49 :: 		Lcd_Out(2,4,txt4)                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.mbas,50 :: 		Delay_ms(2000)
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
;lcd.mbas,51 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,53 :: 		Lcd_Out(1,4,txt3)                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.mbas,54 :: 		Lcd_Out(2,1,txt2)                 ' escribe la cadena en la primera fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd.mbas,55 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;lcd.mbas,59 :: 		for i=0 to 3                      ' Mueve la cadena hacia la derecha 4 veces
	CLRF       _i+0
L__main6:
;lcd.mbas,60 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT)
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,61 :: 		Move_Delay()
	CALL       lcd_Move_Delay+0
;lcd.mbas,62 :: 		next i
	MOVF       _i+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	INCF       _i+0, 1
	GOTO       L__main6
L__main9:
;lcd.mbas,64 :: 		while TRUE
L__main11:
;lcd.mbas,65 :: 		for i=0 to 7                    ' Mueve la cadena hacia la izquierda 8 veces
	CLRF       _i+0
L__main16:
;lcd.mbas,66 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT)
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,67 :: 		Move_Delay()
	CALL       lcd_Move_Delay+0
;lcd.mbas,68 :: 		next i
	MOVF       _i+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__main19
	INCF       _i+0, 1
	GOTO       L__main16
L__main19:
;lcd.mbas,70 :: 		for i=0 to 7                    ' Mueve la cadena hacia la derecha 8 veces
	CLRF       _i+0
L__main21:
;lcd.mbas,71 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT)
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd.mbas,72 :: 		Move_Delay()
	CALL       lcd_Move_Delay+0
;lcd.mbas,73 :: 		next i
	MOVF       _i+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__main24
	INCF       _i+0, 1
	GOTO       L__main21
L__main24:
;lcd.mbas,74 :: 		wend
	GOTO       L__main11
	GOTO       $+0
; end of _main
