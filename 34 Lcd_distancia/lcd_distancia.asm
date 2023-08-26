
lcd_distancia_PULSO:

;lcd_distancia.mbas,36 :: 		SUB PROCEDURE PULSO()
;lcd_distancia.mbas,37 :: 		PORTC.3=1
	BSF        PORTC+0, 3
;lcd_distancia.mbas,38 :: 		Delay_us(150)
	MOVLW      99
	MOVWF      R13+0
L_lcd_distancia_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_distancia_PULSO1
	NOP
	NOP
;lcd_distancia.mbas,39 :: 		PORTC.3=0
	BCF        PORTC+0, 3
	RETURN
; end of lcd_distancia_PULSO

_main:

;lcd_distancia.mbas,42 :: 		main:
;lcd_distancia.mbas,43 :: 		OPTION_REG=%10000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      134
	MOVWF      OPTION_REG+0
;lcd_distancia.mbas,46 :: 		OSCCON = 0X65 ' Oscilador interno de 4mhz
	MOVLW      101
	MOVWF      OSCCON+0
;lcd_distancia.mbas,48 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;lcd_distancia.mbas,49 :: 		PORTB = 0X00
	CLRF       PORTB+0
;lcd_distancia.mbas,51 :: 		TRISC = 0X31 ' PORTC salidas
	MOVLW      49
	MOVWF      TRISC+0
;lcd_distancia.mbas,52 :: 		PORTC = 0X00
	CLRF       PORTC+0
;lcd_distancia.mbas,54 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;lcd_distancia.mbas,55 :: 		PORTE = 0X00
	CLRF       PORTE+0
;lcd_distancia.mbas,57 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;lcd_distancia.mbas,58 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;lcd_distancia.mbas,59 :: 		FLANCO=0
	CLRF       _FLANCO+0
;lcd_distancia.mbas,60 :: 		Lcd_Init() ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;lcd_distancia.mbas,61 :: 		Lcd_Cmd(_LCD_CLEAR) ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_distancia.mbas,62 :: 		Lcd_Cmd(_LCD_CURSOR_OFF) ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_distancia.mbas,63 :: 		Lcd_Out(1,2,"IDEAS Y TECNOLOGIAS") ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_distancia.mbas,64 :: 		Lcd_Out(2,4," M.E. I&T 04")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_distancia.mbas,65 :: 		Delay_ms(2000)
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
;lcd_distancia.mbas,66 :: 		WHILE(1)
L__main5:
;lcd_distancia.mbas,67 :: 		PULSO()
	CALL       lcd_distancia_PULSO+0
;lcd_distancia.mbas,68 :: 		DO
L__main9:
;lcd_distancia.mbas,69 :: 		IF(PORTC.0=1)THEN'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSS      PORTC+0, 0
	GOTO       L__main15
;lcd_distancia.mbas,70 :: 		TMR0=0
	CLRF       TMR0+0
;lcd_distancia.mbas,71 :: 		FLANCO=1
	MOVLW      1
	MOVWF      _FLANCO+0
L__main15:
;lcd_distancia.mbas,74 :: 		LOOP UNTIL(FLANCO=1)
	MOVF       _FLANCO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main12
	GOTO       L__main9
L__main12:
;lcd_distancia.mbas,75 :: 		DO
L__main17:
;lcd_distancia.mbas,76 :: 		IF(PORTC.0=0)THEN 'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSC      PORTC+0, 0
	GOTO       L__main23
;lcd_distancia.mbas,77 :: 		TIEMPO=TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;lcd_distancia.mbas,78 :: 		FLANCO=0
	CLRF       _FLANCO+0
L__main23:
;lcd_distancia.mbas,80 :: 		LOOP UNTIL(FLANCO=0)
	MOVF       _FLANCO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main20
	GOTO       L__main17
L__main20:
;lcd_distancia.mbas,81 :: 		DISTANCIA=(TIEMPO*128)/58 'DISTANCIA EN cm
	MOVF       _TIEMPO+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVLW      7
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main26:
	BTFSC      STATUS+0, 2
	GOTO       L__main27
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main26
L__main27:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;lcd_distancia.mbas,82 :: 		WordToStr(DISTANCIA,TEXT)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;lcd_distancia.mbas,83 :: 		Lcd_Cmd(_LCD_CLEAR) ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_distancia.mbas,84 :: 		Lcd_Cmd(_LCD_CURSOR_OFF) ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_distancia.mbas,85 :: 		Lcd_Out(1,2,"Distancia(cm)= ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
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
	MOVLW      40
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      41
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
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_distancia.mbas,86 :: 		Lcd_Out(2,2,TEXT)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXT+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_distancia.mbas,87 :: 		Delay_ms(50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main25:
	DECFSZ     R13+0, 1
	GOTO       L__main25
	DECFSZ     R12+0, 1
	GOTO       L__main25
	NOP
	NOP
;lcd_distancia.mbas,88 :: 		WEND
	GOTO       L__main5
	GOTO       $+0
; end of _main
