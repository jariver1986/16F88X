
Control_parqueo_abrir:

;Control_parqueo.mbas,29 :: 		dim i as longword
;Control_parqueo.mbas,30 :: 		i=0
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
;Control_parqueo.mbas,31 :: 		while (i<10000)
L_Control_parqueo_abrir2:
	MOVLW      0
	SUBWF      R4+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_abrir99
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_abrir99
	MOVLW      39
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_abrir99
	MOVLW      16
	SUBWF      R4+0, 0
L_Control_parqueo_abrir99:
	BTFSC      STATUS+0, 0
	GOTO       L_Control_parqueo_abrir3
;Control_parqueo.mbas,32 :: 		inc(i)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;Control_parqueo.mbas,33 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_Control_parqueo_abrir7
;Control_parqueo.mbas,34 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_abrir10
;Control_parqueo.mbas,35 :: 		giro=109
	MOVLW      109
	MOVWF      _giro+0
;Control_parqueo.mbas,36 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Control_parqueo.mbas,37 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;Control_parqueo.mbas,38 :: 		GOTO final
	GOTO       L_Control_parqueo_abrir_final
L_Control_parqueo_abrir10:
;Control_parqueo.mbas,40 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_abrir14
;Control_parqueo.mbas,41 :: 		giro=243
	MOVLW      243
	MOVWF      _giro+0
;Control_parqueo.mbas,42 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;Control_parqueo.mbas,43 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
;Control_parqueo.mbas,44 :: 		GOTO final
	GOTO       L_Control_parqueo_abrir_final
L_Control_parqueo_abrir14:
;Control_parqueo.mbas,46 :: 		final:
L_Control_parqueo_abrir_final:
;Control_parqueo.mbas,47 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;Control_parqueo.mbas,48 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_Control_parqueo_abrir7:
;Control_parqueo.mbas,50 :: 		wend
	GOTO       L_Control_parqueo_abrir2
L_Control_parqueo_abrir3:
	RETURN
; end of Control_parqueo_abrir

Control_parqueo_cerrar:

;Control_parqueo.mbas,53 :: 		dim i as longword
;Control_parqueo.mbas,54 :: 		i=0
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
;Control_parqueo.mbas,55 :: 		while (i<10000)
L_Control_parqueo_cerrar18:
	MOVLW      0
	SUBWF      R4+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_cerrar100
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_cerrar100
	MOVLW      39
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_cerrar100
	MOVLW      16
	SUBWF      R4+0, 0
L_Control_parqueo_cerrar100:
	BTFSC      STATUS+0, 0
	GOTO       L_Control_parqueo_cerrar19
;Control_parqueo.mbas,56 :: 		inc(i)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;Control_parqueo.mbas,57 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_Control_parqueo_cerrar23
;Control_parqueo.mbas,58 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_cerrar26
;Control_parqueo.mbas,59 :: 		giro=114
	MOVLW      114
	MOVWF      _giro+0
;Control_parqueo.mbas,60 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Control_parqueo.mbas,61 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;Control_parqueo.mbas,62 :: 		GOTO final
	GOTO       L_Control_parqueo_cerrar_final
L_Control_parqueo_cerrar26:
;Control_parqueo.mbas,64 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Control_parqueo_cerrar30
;Control_parqueo.mbas,65 :: 		giro=238
	MOVLW      238
	MOVWF      _giro+0
;Control_parqueo.mbas,66 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;Control_parqueo.mbas,67 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
;Control_parqueo.mbas,68 :: 		GOTO final
	GOTO       L_Control_parqueo_cerrar_final
L_Control_parqueo_cerrar30:
;Control_parqueo.mbas,70 :: 		final:
L_Control_parqueo_cerrar_final:
;Control_parqueo.mbas,71 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;Control_parqueo.mbas,72 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_Control_parqueo_cerrar23:
;Control_parqueo.mbas,74 :: 		wend
	GOTO       L_Control_parqueo_cerrar18
L_Control_parqueo_cerrar19:
	RETURN
; end of Control_parqueo_cerrar

_main:

;Control_parqueo.mbas,77 :: 		main:
;Control_parqueo.mbas,78 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;Control_parqueo.mbas,79 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Control_parqueo.mbas,80 :: 		PORTA = %00000000
	CLRF       PORTA+0
;Control_parqueo.mbas,81 :: 		TRISA = %11111111
	MOVLW      255
	MOVWF      TRISA+0
;Control_parqueo.mbas,82 :: 		PORTB = %00000000
	CLRF       PORTB+0
;Control_parqueo.mbas,83 :: 		TRISB = %11111111
	MOVLW      255
	MOVWF      TRISB+0
;Control_parqueo.mbas,84 :: 		PORTC = %00000000
	CLRF       PORTC+0
;Control_parqueo.mbas,85 :: 		TRISC = %00000000
	CLRF       TRISC+0
;Control_parqueo.mbas,86 :: 		PORTD = %00000000
	CLRF       PORTD+0
;Control_parqueo.mbas,87 :: 		TRISD = %00000000
	CLRF       TRISD+0
;Control_parqueo.mbas,88 :: 		PORTE = %00000000
	CLRF       PORTE+0
;Control_parqueo.mbas,89 :: 		TRISE = %00000000
	CLRF       TRISE+0
;Control_parqueo.mbas,90 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;Control_parqueo.mbas,91 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;Control_parqueo.mbas,92 :: 		INTCON = 0XC0
	MOVLW      192
	MOVWF      INTCON+0
;Control_parqueo.mbas,93 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Control_parqueo.mbas,94 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Control_parqueo.mbas,95 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Control_parqueo.mbas,96 :: 		TMR0=100
	MOVLW      100
	MOVWF      TMR0+0
;Control_parqueo.mbas,98 :: 		CONT1 =0
	CLRF       _CONT1+0
;Control_parqueo.mbas,99 :: 		CONT2 =0
	CLRF       _CONT2+0
;Control_parqueo.mbas,100 :: 		CONT3 =0
	CLRF       _CONT3+0
;Control_parqueo.mbas,101 :: 		CONT4 =0
	CLRF       _CONT4+0
;Control_parqueo.mbas,102 :: 		CONT5 =0
	CLRF       _CONT5+0
;Control_parqueo.mbas,103 :: 		CONT6 =0
	CLRF       _CONT6+0
;Control_parqueo.mbas,104 :: 		CONT7 =0
	CLRF       _CONT7+0
;Control_parqueo.mbas,105 :: 		CONT8 =0
	CLRF       _CONT8+0
;Control_parqueo.mbas,106 :: 		CONT9 =0
	CLRF       _CONT9+0
;Control_parqueo.mbas,107 :: 		CONT10 =0
	CLRF       _CONT10+0
;Control_parqueo.mbas,108 :: 		CONT11 =0
	CLRF       _CONT11+0
;Control_parqueo.mbas,109 :: 		CONT12 =0
	CLRF       _CONT12+0
;Control_parqueo.mbas,110 :: 		CONT13 =0
	CLRF       _CONT13+0
;Control_parqueo.mbas,111 :: 		CONT14 =0
	CLRF       _CONT14+0
;Control_parqueo.mbas,112 :: 		CONT15 =0
	CLRF       _CONT15+0
;Control_parqueo.mbas,114 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;Control_parqueo.mbas,115 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,116 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,117 :: 		Lcd_Out(1,1,"ESPOL")
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
;Control_parqueo.mbas,118 :: 		Lcd_Out(2,1,"LAB. ELECTRO A")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,119 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main33:
	DECFSZ     R13+0, 1
	GOTO       L__main33
	DECFSZ     R12+0, 1
	GOTO       L__main33
	DECFSZ     R11+0, 1
	GOTO       L__main33
	NOP
	NOP
;Control_parqueo.mbas,120 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,122 :: 		Lcd_Out(1,1,"CONTROL DE ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
	MOVLW      76
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,123 :: 		Lcd_Out(2,1,"PARQUEO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,124 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main34:
	DECFSZ     R13+0, 1
	GOTO       L__main34
	DECFSZ     R12+0, 1
	GOTO       L__main34
	DECFSZ     R11+0, 1
	GOTO       L__main34
	NOP
	NOP
;Control_parqueo.mbas,126 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,127 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	DECFSZ     R11+0, 1
	GOTO       L__main35
	NOP
	NOP
;Control_parqueo.mbas,130 :: 		while 1
L__main37:
;Control_parqueo.mbas,132 :: 		ACUMULADOR=0
	CLRF       _ACUMULADOR+0
;Control_parqueo.mbas,133 :: 		Lcd_Out(1,1,"LIBRES:         ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
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
	MOVLW      58
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,134 :: 		Lcd_Out(2,1,"OCUPADOS:       ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
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
	MOVLW      32
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
;Control_parqueo.mbas,135 :: 		if PORTA.RA0 = 0 then CONT1 = 0 LED1=1 LED2=0 ELSE CONT1 = 1 LED1=0 LED2=1 end if
	BTFSC      PORTA+0, 0
	GOTO       L__main42
	CLRF       _CONT1+0
	BSF        PORTC+0, 0
	BCF        PORTC+0, 1
	GOTO       L__main43
L__main42:
	MOVLW      1
	MOVWF      _CONT1+0
	BCF        PORTC+0, 0
	BSF        PORTC+0, 1
L__main43:
;Control_parqueo.mbas,136 :: 		if PORTA.RA1 = 0 then CONT2 = 0 LED3=1 LED4=0 ELSE CONT2 = 1 LED3=0 LED4=1 end if
	BTFSC      PORTA+0, 1
	GOTO       L__main45
	CLRF       _CONT2+0
	BSF        PORTC+0, 2
	BCF        PORTC+0, 3
	GOTO       L__main46
L__main45:
	MOVLW      1
	MOVWF      _CONT2+0
	BCF        PORTC+0, 2
	BSF        PORTC+0, 3
L__main46:
;Control_parqueo.mbas,137 :: 		if PORTA.RA2 = 0 then CONT3 = 0 LED5=1 LED6=0 ELSE CONT3 = 1 LED5=0 LED6=1 end if
	BTFSC      PORTA+0, 2
	GOTO       L__main48
	CLRF       _CONT3+0
	BSF        PORTC+0, 4
	BCF        PORTC+0, 5
	GOTO       L__main49
L__main48:
	MOVLW      1
	MOVWF      _CONT3+0
	BCF        PORTC+0, 4
	BSF        PORTC+0, 5
L__main49:
;Control_parqueo.mbas,138 :: 		if PORTA.RA3 = 0 then CONT4 = 0 ELSE CONT4 = 1 end if
	BTFSC      PORTA+0, 3
	GOTO       L__main51
	CLRF       _CONT4+0
	GOTO       L__main52
L__main51:
	MOVLW      1
	MOVWF      _CONT4+0
L__main52:
;Control_parqueo.mbas,139 :: 		if PORTA.RA4 = 0 then CONT5 = 0 ELSE CONT5 = 1 end if
	BTFSC      PORTA+0, 4
	GOTO       L__main54
	CLRF       _CONT5+0
	GOTO       L__main55
L__main54:
	MOVLW      1
	MOVWF      _CONT5+0
L__main55:
;Control_parqueo.mbas,140 :: 		if PORTA.RA5 = 0 then CONT6 = 0 ELSE CONT6 = 1 end if
	BTFSC      PORTA+0, 5
	GOTO       L__main57
	CLRF       _CONT6+0
	GOTO       L__main58
L__main57:
	MOVLW      1
	MOVWF      _CONT6+0
L__main58:
;Control_parqueo.mbas,141 :: 		if PORTA.RA6 = 0 then CONT7 = 0 ELSE CONT7 = 1 end if
	BTFSC      PORTA+0, 6
	GOTO       L__main60
	CLRF       _CONT7+0
	GOTO       L__main61
L__main60:
	MOVLW      1
	MOVWF      _CONT7+0
L__main61:
;Control_parqueo.mbas,142 :: 		if PORTA.RA7 = 0 then CONT8 = 0 ELSE CONT8 = 1 end if
	BTFSC      PORTA+0, 7
	GOTO       L__main63
	CLRF       _CONT8+0
	GOTO       L__main64
L__main63:
	MOVLW      1
	MOVWF      _CONT8+0
L__main64:
;Control_parqueo.mbas,144 :: 		if PORTB.RB0 = 0 then CONT9 = 0 ELSE CONT9  = 1 end if
	BTFSC      PORTB+0, 0
	GOTO       L__main66
	CLRF       _CONT9+0
	GOTO       L__main67
L__main66:
	MOVLW      1
	MOVWF      _CONT9+0
L__main67:
;Control_parqueo.mbas,145 :: 		if PORTB.RB1 = 0 then CONT10 = 0 ELSE CONT10 = 1 end if
	BTFSC      PORTB+0, 1
	GOTO       L__main69
	CLRF       _CONT10+0
	GOTO       L__main70
L__main69:
	MOVLW      1
	MOVWF      _CONT10+0
L__main70:
;Control_parqueo.mbas,146 :: 		if PORTB.RB2 = 0 then CONT11 = 0 ELSE CONT11 = 1 end if
	BTFSC      PORTB+0, 2
	GOTO       L__main72
	CLRF       _CONT11+0
	GOTO       L__main73
L__main72:
	MOVLW      1
	MOVWF      _CONT11+0
L__main73:
;Control_parqueo.mbas,147 :: 		if PORTB.RB3 = 0 then CONT12 = 0 ELSE CONT12 = 1 end if
	BTFSC      PORTB+0, 3
	GOTO       L__main75
	CLRF       _CONT12+0
	GOTO       L__main76
L__main75:
	MOVLW      1
	MOVWF      _CONT12+0
L__main76:
;Control_parqueo.mbas,148 :: 		if PORTB.RB4 = 0 then CONT13 = 0 ELSE CONT13 = 1 end if
	BTFSC      PORTB+0, 4
	GOTO       L__main78
	CLRF       _CONT13+0
	GOTO       L__main79
L__main78:
	MOVLW      1
	MOVWF      _CONT13+0
L__main79:
;Control_parqueo.mbas,149 :: 		if PORTB.RB5 = 0 then CONT14 = 0 ELSE CONT14 = 1 end if
	BTFSC      PORTB+0, 5
	GOTO       L__main81
	CLRF       _CONT14+0
	GOTO       L__main82
L__main81:
	MOVLW      1
	MOVWF      _CONT14+0
L__main82:
;Control_parqueo.mbas,150 :: 		if PORTB.RB6 = 0 then CONT15 = 0 ELSE CONT15 = 1 end if
	BTFSC      PORTB+0, 6
	GOTO       L__main84
	CLRF       _CONT15+0
	GOTO       L__main85
L__main84:
	MOVLW      1
	MOVWF      _CONT15+0
L__main85:
;Control_parqueo.mbas,152 :: 		ACUMULADOR = CONT1 +CONT2 +CONT3 +CONT4 +CONT5 +CONT6 +CONT7 +CONT8 +CONT9 +CONT10 +CONT11 +CONT12 +CONT13 +CONT14 +CONT15
	MOVF       _CONT2+0, 0
	ADDWF      _CONT1+0, 0
	MOVWF      R0+0
	MOVF       _CONT3+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT4+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT5+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT6+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT7+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT8+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT9+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT10+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT11+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT12+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT13+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT14+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONT15+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _ACUMULADOR+0
;Control_parqueo.mbas,153 :: 		ByteToStr(ACUMULADOR, TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Control_parqueo.mbas,154 :: 		Lcd_Out(1,10,TEXTO)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,155 :: 		ByteToStr(15-ACUMULADOR, TEXTO)
	MOVF       _ACUMULADOR+0, 0
	SUBLW      15
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Control_parqueo.mbas,156 :: 		Lcd_Out(2,10,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,157 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main86:
	DECFSZ     R13+0, 1
	GOTO       L__main86
	DECFSZ     R12+0, 1
	GOTO       L__main86
	DECFSZ     R11+0, 1
	GOTO       L__main86
	NOP
	NOP
;Control_parqueo.mbas,159 :: 		if ACUMULADOR = 0 THEN
	MOVF       _ACUMULADOR+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
;Control_parqueo.mbas,160 :: 		Lcd_Out(1,1,"PARQUEADERO     ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      69
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,161 :: 		Lcd_Out(2,1,"LLENO           ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,162 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main90:
	DECFSZ     R13+0, 1
	GOTO       L__main90
	DECFSZ     R12+0, 1
	GOTO       L__main90
	DECFSZ     R11+0, 1
	GOTO       L__main90
	NOP
	NOP
;Control_parqueo.mbas,163 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,164 :: 		Lcd_Out(1,1,"INGRESO         ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      79
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,165 :: 		Lcd_Out(2,1,"BLOQUEADO       ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,166 :: 		LED7=1
	BSF        PORTD+0, 0
;Control_parqueo.mbas,167 :: 		LED8=0
	BCF        PORTD+0, 1
;Control_parqueo.mbas,168 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main91:
	DECFSZ     R13+0, 1
	GOTO       L__main91
	DECFSZ     R12+0, 1
	GOTO       L__main91
	DECFSZ     R11+0, 1
	GOTO       L__main91
	NOP
	NOP
;Control_parqueo.mbas,169 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Control_parqueo.mbas,171 :: 		CERRAR()
	CALL       Control_parqueo_cerrar+0
	GOTO       L__main89
;Control_parqueo.mbas,173 :: 		else
L__main88:
;Control_parqueo.mbas,174 :: 		if PORTB.RB7=0 then
	BTFSC      PORTB+0, 7
	GOTO       L__main93
;Control_parqueo.mbas,175 :: 		LED7=0
	BCF        PORTD+0, 0
;Control_parqueo.mbas,176 :: 		LED8=1
	BSF        PORTD+0, 1
;Control_parqueo.mbas,177 :: 		ABRIR()
	CALL       Control_parqueo_abrir+0
;Control_parqueo.mbas,178 :: 		Lcd_Out(1,1,"INGRESO         ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      79
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,179 :: 		Lcd_Out(2,1,"PERMITIDO       ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Control_parqueo.mbas,180 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main95:
	DECFSZ     R13+0, 1
	GOTO       L__main95
	DECFSZ     R12+0, 1
	GOTO       L__main95
	DECFSZ     R11+0, 1
	GOTO       L__main95
	NOP
	NOP
;Control_parqueo.mbas,181 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main96:
	DECFSZ     R13+0, 1
	GOTO       L__main96
	DECFSZ     R12+0, 1
	GOTO       L__main96
	DECFSZ     R11+0, 1
	GOTO       L__main96
	NOP
	NOP
;Control_parqueo.mbas,182 :: 		CERRAR()
	CALL       Control_parqueo_cerrar+0
;Control_parqueo.mbas,183 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main97:
	DECFSZ     R13+0, 1
	GOTO       L__main97
	DECFSZ     R12+0, 1
	GOTO       L__main97
	DECFSZ     R11+0, 1
	GOTO       L__main97
	NOP
	NOP
;Control_parqueo.mbas,184 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main93:
;Control_parqueo.mbas,186 :: 		end if
L__main89:
;Control_parqueo.mbas,187 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main98:
	DECFSZ     R13+0, 1
	GOTO       L__main98
	DECFSZ     R12+0, 1
	GOTO       L__main98
	DECFSZ     R11+0, 1
	GOTO       L__main98
	NOP
	NOP
;Control_parqueo.mbas,188 :: 		wend
	GOTO       L__main37
	GOTO       $+0
; end of _main
