
robot_clima_TECLADO:

;robot_clima.mbas,19 :: 		sub procedure TECLADO()
;robot_clima.mbas,20 :: 		kp = 255
	MOVLW      255
	MOVWF      _KP+0
;robot_clima.mbas,21 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;robot_clima.mbas,22 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO2
;robot_clima.mbas,23 :: 		while(portb.0=0) wend
L_robot_clima_TECLADO5:
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO6
	GOTO       L_robot_clima_TECLADO5
L_robot_clima_TECLADO6:
;robot_clima.mbas,24 :: 		kp=1 end if'1
	MOVLW      1
	MOVWF      _KP+0
L_robot_clima_TECLADO2:
;robot_clima.mbas,25 :: 		numero = 0x31
	MOVLW      49
	MOVWF      _NUMERO+0
;robot_clima.mbas,26 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO10
;robot_clima.mbas,27 :: 		while(portb.1=0) wend
L_robot_clima_TECLADO13:
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO14
	GOTO       L_robot_clima_TECLADO13
L_robot_clima_TECLADO14:
;robot_clima.mbas,28 :: 		kp=2 end if'2
	MOVLW      2
	MOVWF      _KP+0
L_robot_clima_TECLADO10:
;robot_clima.mbas,29 :: 		numero = 0x32
	MOVLW      50
	MOVWF      _NUMERO+0
;robot_clima.mbas,30 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO18
;robot_clima.mbas,31 :: 		while(portb.2=0) wend
L_robot_clima_TECLADO21:
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO22
	GOTO       L_robot_clima_TECLADO21
L_robot_clima_TECLADO22:
;robot_clima.mbas,32 :: 		kp=3 end if'3
	MOVLW      3
	MOVWF      _KP+0
L_robot_clima_TECLADO18:
;robot_clima.mbas,33 :: 		numero = 0x33
	MOVLW      51
	MOVWF      _NUMERO+0
;robot_clima.mbas,34 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO26
;robot_clima.mbas,35 :: 		while(portb.3=0) wend
L_robot_clima_TECLADO29:
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO30
	GOTO       L_robot_clima_TECLADO29
L_robot_clima_TECLADO30:
;robot_clima.mbas,36 :: 		kp=$41 end if'A
	MOVLW      65
	MOVWF      _KP+0
L_robot_clima_TECLADO26:
;robot_clima.mbas,37 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_robot_clima_TECLADO34
;robot_clima.mbas,38 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;robot_clima.mbas,39 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO37
;robot_clima.mbas,40 :: 		while(portb.0=0) wend
L_robot_clima_TECLADO40:
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO41
	GOTO       L_robot_clima_TECLADO40
L_robot_clima_TECLADO41:
;robot_clima.mbas,41 :: 		kp=4 end if'4
	MOVLW      4
	MOVWF      _KP+0
L_robot_clima_TECLADO37:
;robot_clima.mbas,42 :: 		numero = 0x34
	MOVLW      52
	MOVWF      _NUMERO+0
;robot_clima.mbas,43 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO45
;robot_clima.mbas,44 :: 		while(portb.1=0) wend
L_robot_clima_TECLADO48:
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO49
	GOTO       L_robot_clima_TECLADO48
L_robot_clima_TECLADO49:
;robot_clima.mbas,45 :: 		kp=5 end if'5
	MOVLW      5
	MOVWF      _KP+0
L_robot_clima_TECLADO45:
;robot_clima.mbas,46 :: 		numero = 0x35
	MOVLW      53
	MOVWF      _NUMERO+0
;robot_clima.mbas,47 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO53
;robot_clima.mbas,48 :: 		while(portb.2=0) wend
L_robot_clima_TECLADO56:
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO57
	GOTO       L_robot_clima_TECLADO56
L_robot_clima_TECLADO57:
;robot_clima.mbas,49 :: 		kp=6 end if'6
	MOVLW      6
	MOVWF      _KP+0
L_robot_clima_TECLADO53:
;robot_clima.mbas,50 :: 		numero = 0x36
	MOVLW      54
	MOVWF      _NUMERO+0
;robot_clima.mbas,51 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO61
;robot_clima.mbas,52 :: 		while(portb.3=0) wend
L_robot_clima_TECLADO64:
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO65
	GOTO       L_robot_clima_TECLADO64
L_robot_clima_TECLADO65:
;robot_clima.mbas,53 :: 		kp=$42 end if'B
	MOVLW      66
	MOVWF      _KP+0
L_robot_clima_TECLADO61:
	GOTO       L_robot_clima_TECLADO35
;robot_clima.mbas,54 :: 		else return
L_robot_clima_TECLADO34:
	RETURN
;robot_clima.mbas,55 :: 		end if
L_robot_clima_TECLADO35:
;robot_clima.mbas,56 :: 		if(kp=255) then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_robot_clima_TECLADO69
;robot_clima.mbas,57 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;robot_clima.mbas,58 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO72
;robot_clima.mbas,59 :: 		while(portb.0=0) wend
L_robot_clima_TECLADO75:
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO76
	GOTO       L_robot_clima_TECLADO75
L_robot_clima_TECLADO76:
;robot_clima.mbas,60 :: 		kp=7 end if'7
	MOVLW      7
	MOVWF      _KP+0
L_robot_clima_TECLADO72:
;robot_clima.mbas,61 :: 		numero = 0x37
	MOVLW      55
	MOVWF      _NUMERO+0
;robot_clima.mbas,62 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO80
;robot_clima.mbas,63 :: 		while(portb.1=0) wend
L_robot_clima_TECLADO83:
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO84
	GOTO       L_robot_clima_TECLADO83
L_robot_clima_TECLADO84:
;robot_clima.mbas,64 :: 		kp=8 end if'8
	MOVLW      8
	MOVWF      _KP+0
L_robot_clima_TECLADO80:
;robot_clima.mbas,65 :: 		numero = 0x38
	MOVLW      56
	MOVWF      _NUMERO+0
;robot_clima.mbas,66 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO88
;robot_clima.mbas,67 :: 		while(portb.2=0) wend
L_robot_clima_TECLADO91:
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO92
	GOTO       L_robot_clima_TECLADO91
L_robot_clima_TECLADO92:
;robot_clima.mbas,68 :: 		kp=9 end if'9
	MOVLW      9
	MOVWF      _KP+0
L_robot_clima_TECLADO88:
;robot_clima.mbas,69 :: 		numero = 0x39
	MOVLW      57
	MOVWF      _NUMERO+0
;robot_clima.mbas,70 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO96
;robot_clima.mbas,71 :: 		while(portb.3=0) wend
L_robot_clima_TECLADO99:
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO100
	GOTO       L_robot_clima_TECLADO99
L_robot_clima_TECLADO100:
;robot_clima.mbas,72 :: 		kp=$43 end if'C
	MOVLW      67
	MOVWF      _KP+0
L_robot_clima_TECLADO96:
	GOTO       L_robot_clima_TECLADO70
;robot_clima.mbas,73 :: 		else return
L_robot_clima_TECLADO69:
	RETURN
;robot_clima.mbas,74 :: 		end if
L_robot_clima_TECLADO70:
;robot_clima.mbas,75 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_robot_clima_TECLADO104
;robot_clima.mbas,76 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;robot_clima.mbas,77 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO107
;robot_clima.mbas,78 :: 		while(portb.0=0) wend
L_robot_clima_TECLADO110:
	BTFSC      PORTB+0, 0
	GOTO       L_robot_clima_TECLADO111
	GOTO       L_robot_clima_TECLADO110
L_robot_clima_TECLADO111:
;robot_clima.mbas,79 :: 		kp=$2A end if '*
	MOVLW      42
	MOVWF      _KP+0
L_robot_clima_TECLADO107:
;robot_clima.mbas,80 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO115
;robot_clima.mbas,81 :: 		while(portb.1=0) wend
L_robot_clima_TECLADO118:
	BTFSC      PORTB+0, 1
	GOTO       L_robot_clima_TECLADO119
	GOTO       L_robot_clima_TECLADO118
L_robot_clima_TECLADO119:
;robot_clima.mbas,82 :: 		kp=0 end if'0
	CLRF       _KP+0
L_robot_clima_TECLADO115:
;robot_clima.mbas,83 :: 		numero = 0x30
	MOVLW      48
	MOVWF      _NUMERO+0
;robot_clima.mbas,84 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO123
;robot_clima.mbas,85 :: 		while(portb.2=0) wend
L_robot_clima_TECLADO126:
	BTFSC      PORTB+0, 2
	GOTO       L_robot_clima_TECLADO127
	GOTO       L_robot_clima_TECLADO126
L_robot_clima_TECLADO127:
;robot_clima.mbas,86 :: 		kp=$23 end if'#
	MOVLW      35
	MOVWF      _KP+0
L_robot_clima_TECLADO123:
;robot_clima.mbas,87 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO131
;robot_clima.mbas,88 :: 		while(portb.3=0) wend
L_robot_clima_TECLADO134:
	BTFSC      PORTB+0, 3
	GOTO       L_robot_clima_TECLADO135
	GOTO       L_robot_clima_TECLADO134
L_robot_clima_TECLADO135:
;robot_clima.mbas,89 :: 		kp=$44 end if'D
	MOVLW      68
	MOVWF      _KP+0
L_robot_clima_TECLADO131:
	GOTO       L_robot_clima_TECLADO105
;robot_clima.mbas,90 :: 		else return
L_robot_clima_TECLADO104:
	RETURN
;robot_clima.mbas,91 :: 		end if
L_robot_clima_TECLADO105:
	RETURN
; end of robot_clima_TECLADO

_main:

;robot_clima.mbas,95 :: 		main:
;robot_clima.mbas,97 :: 		OSCCON     = %01110101
	MOVLW      117
	MOVWF      OSCCON+0
;robot_clima.mbas,98 :: 		OPTION_REG = %00000111
	MOVLW      7
	MOVWF      OPTION_REG+0
;robot_clima.mbas,99 :: 		TRISA      = %11000011
	MOVLW      195
	MOVWF      TRISA+0
;robot_clima.mbas,100 :: 		PORTA      = %00000000
	CLRF       PORTA+0
;robot_clima.mbas,101 :: 		TRISB      = %00001111
	MOVLW      15
	MOVWF      TRISB+0
;robot_clima.mbas,102 :: 		PORTB      = %00000000
	CLRF       PORTB+0
;robot_clima.mbas,103 :: 		TRISC      = %10000001
	MOVLW      129
	MOVWF      TRISC+0
;robot_clima.mbas,104 :: 		PORTC      = %00000000
	CLRF       PORTC+0
;robot_clima.mbas,105 :: 		TRISC      = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;robot_clima.mbas,106 :: 		PORTC      = %00000000
	CLRF       PORTC+0
;robot_clima.mbas,107 :: 		TRISE      = %00001111
	MOVLW      15
	MOVWF      TRISE+0
;robot_clima.mbas,108 :: 		PORTE      = %00000000
	CLRF       PORTE+0
;robot_clima.mbas,109 :: 		ANSEL      = %00000000
	CLRF       ANSEL+0
;robot_clima.mbas,110 :: 		ANSELH     = %00000000
	CLRF       ANSELH+0
;robot_clima.mbas,111 :: 		WPUB       = %00001111
	MOVLW      15
	MOVWF      WPUB+0
;robot_clima.mbas,112 :: 		UART1_Init(1382400)
	CLRF       SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_clima.mbas,114 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;robot_clima.mbas,115 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,116 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,117 :: 		Lcd_Out(1,1,"  UNIVERSIDAD  ")                 ' escribe la cadena en la primera fila
	MOVLW      1
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
	MOVLW      85
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
;robot_clima.mbas,118 :: 		Lcd_Out(2,1,"    AGRARIA    ")                 ' escribe la cadena en la segunda fila
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
;robot_clima.mbas,119 :: 		Lcd_Out(3,1,"ING. SISTEMAS")                 ' escribe la cadena en la primera fila
	MOVLW      3
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
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,120 :: 		delay_ms(2000)
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L__main139:
	DECFSZ     R13+0, 1
	GOTO       L__main139
	DECFSZ     R12+0, 1
	GOTO       L__main139
	DECFSZ     R11+0, 1
	GOTO       L__main139
	NOP
	NOP
;robot_clima.mbas,121 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,122 :: 		Lcd_Out(1,1,"AUTORES:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,123 :: 		Lcd_Out(2,1,"SIMON DAVILA ")                 ' escribe la cadena en la segunda fila
	MOVLW      2
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;robot_clima.mbas,124 :: 		Lcd_Out(3,1,"XXXXXXXXXXXX")                 ' escribe la cadena en la segunda fila
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,125 :: 		delay_ms(2000)
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L__main140:
	DECFSZ     R13+0, 1
	GOTO       L__main140
	DECFSZ     R12+0, 1
	GOTO       L__main140
	DECFSZ     R11+0, 1
	GOTO       L__main140
	NOP
	NOP
;robot_clima.mbas,126 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,127 :: 		Lcd_Out(1,1,"TUTOR")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,128 :: 		Lcd_Out(2,1,"ING. JOHN RIVERA")                 ' escribe la cadena en la segunda fila
	MOVLW      2
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
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;robot_clima.mbas,129 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,130 :: 		Lcd_Out(1,1,"INGRESE CLAVE")                 ' escribe la cadena en la primera fila
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
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
;robot_clima.mbas,133 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;robot_clima.mbas,134 :: 		KP=0
	CLRF       _KP+0
;robot_clima.mbas,135 :: 		NUMERO=0
	CLRF       _NUMERO+0
;robot_clima.mbas,136 :: 		TURNO=0
	CLRF       _TURNO+0
;robot_clima.mbas,137 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
;robot_clima.mbas,138 :: 		CLAVE[1]=6
	MOVLW      6
	MOVWF      _CLAVE+1
;robot_clima.mbas,139 :: 		CLAVE[2]=7
	MOVLW      7
	MOVWF      _CLAVE+2
;robot_clima.mbas,140 :: 		CLAVE[3]=8
	MOVLW      8
	MOVWF      _CLAVE+3
;robot_clima.mbas,141 :: 		CLAVE[4]=9
	MOVLW      9
	MOVWF      _CLAVE+4
;robot_clima.mbas,143 :: 		ACCESO[1]=6
	MOVLW      6
	MOVWF      _ACCESO+1
;robot_clima.mbas,144 :: 		ACCESO[2]=7
	MOVLW      7
	MOVWF      _ACCESO+2
;robot_clima.mbas,145 :: 		ACCESO[3]=8
	MOVLW      8
	MOVWF      _ACCESO+3
;robot_clima.mbas,146 :: 		ACCESO[4]=9
	MOVLW      9
	MOVWF      _ACCESO+4
;robot_clima.mbas,147 :: 		SERIAL =0
	CLRF       _SERIAL+0
;robot_clima.mbas,149 :: 		while(1)
L__main142:
;robot_clima.mbas,150 :: 		while TURNO=0
L__main147:
	MOVF       _TURNO+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main148
;robot_clima.mbas,151 :: 		TECLADO()
	CALL       robot_clima_TECLADO+0
;robot_clima.mbas,152 :: 		if boton =1 then 'if KP<>255 then
	BTFSS      PORTC+0, 0
	GOTO       L__main152
;robot_clima.mbas,153 :: 		while   boton =1
L__main155:
	BTFSS      PORTC+0, 0
	GOTO       L__main156
;robot_clima.mbas,154 :: 		wend
	GOTO       L__main155
L__main156:
;robot_clima.mbas,155 :: 		INC(CONTADOR)
	INCF       _CONTADOR+0, 1
;robot_clima.mbas,156 :: 		Lcd_Out(2,CONTADOR,"*")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main152:
;robot_clima.mbas,159 :: 		if CONTADOR=4 then
	MOVF       _CONTADOR+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main160
;robot_clima.mbas,160 :: 		TURNO=1
	MOVLW      1
	MOVWF      _TURNO+0
;robot_clima.mbas,161 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
L__main160:
;robot_clima.mbas,163 :: 		wend
	GOTO       L__main147
L__main148:
;robot_clima.mbas,164 :: 		while TURNO=1
L__main163:
	MOVF       _TURNO+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main164
;robot_clima.mbas,165 :: 		DATO=0
	CLRF       _DATO+0
;robot_clima.mbas,166 :: 		for counter = 1 to 4
	MOVLW      1
	MOVWF      _COUNTER+0
L__main168:
;robot_clima.mbas,167 :: 		if CLAVE[COUNTER]= ACCESO[COUNTER] then
	MOVF       _COUNTER+0, 0
	ADDLW      _CLAVE+0
	MOVWF      R2+0
	MOVF       _COUNTER+0, 0
	ADDLW      _ACCESO+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main173
;robot_clima.mbas,168 :: 		INC(DATO)
	INCF       _DATO+0, 1
L__main173:
;robot_clima.mbas,170 :: 		next counter
	MOVF       _COUNTER+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__main171
	INCF       _COUNTER+0, 1
	GOTO       L__main168
L__main171:
;robot_clima.mbas,171 :: 		if DATO = 4 then
	MOVF       _DATO+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main176
;robot_clima.mbas,172 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,173 :: 		TURNO=2
	MOVLW      2
	MOVWF      _TURNO+0
;robot_clima.mbas,174 :: 		Lcd_Out(1,1,"ACCESO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,175 :: 		Lcd_Out(2,1,"PERMITIDO")
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L__main177
;robot_clima.mbas,176 :: 		ELSE
L__main176:
;robot_clima.mbas,177 :: 		TURNO=0
	CLRF       _TURNO+0
;robot_clima.mbas,178 :: 		Lcd_Out(1,1,"ACCESO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,179 :: 		Lcd_Out(2,1,"NEGADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;robot_clima.mbas,181 :: 		end if
L__main177:
;robot_clima.mbas,182 :: 		Delay_ms(2000)
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L__main178:
	DECFSZ     R13+0, 1
	GOTO       L__main178
	DECFSZ     R12+0, 1
	GOTO       L__main178
	DECFSZ     R11+0, 1
	GOTO       L__main178
	NOP
	NOP
;robot_clima.mbas,183 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;robot_clima.mbas,184 :: 		wend
	GOTO       L__main163
L__main164:
;robot_clima.mbas,186 :: 		while TURNO=2
L__main180:
	MOVF       _TURNO+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main181
;robot_clima.mbas,187 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main185
;robot_clima.mbas,188 :: 		SERIAL = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _SERIAL+0
;robot_clima.mbas,189 :: 		if SERIAL = "W"   then
	MOVF       R0+0, 0
	XORLW      87
	BTFSS      STATUS+0, 2
	GOTO       L__main188
;robot_clima.mbas,190 :: 		UART1_Write_Text("ADELANTE")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main188:
;robot_clima.mbas,192 :: 		if SERIAL = "X"   then
	MOVF       _SERIAL+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L__main191
;robot_clima.mbas,193 :: 		UART1_Write_Text("ATRAS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main191:
;robot_clima.mbas,195 :: 		if SERIAL = "A"   then
	MOVF       _SERIAL+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main194
;robot_clima.mbas,196 :: 		UART1_Write_Text("IZQUIERDA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
L__main194:
;robot_clima.mbas,198 :: 		if SERIAL = "D"   then
	MOVF       _SERIAL+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main197
;robot_clima.mbas,199 :: 		UART1_Write_Text("DERECHA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
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
L__main197:
;robot_clima.mbas,201 :: 		if SERIAL = "S"   then
	MOVF       _SERIAL+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main200
;robot_clima.mbas,202 :: 		UART1_Write_Text("PARAR")
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main200:
;robot_clima.mbas,204 :: 		if SERIAL = "1"   then
	MOVF       _SERIAL+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main203
;robot_clima.mbas,205 :: 		UART1_Write_Text("Alerta Sensor 1 ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
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
L__main203:
;robot_clima.mbas,207 :: 		if SERIAL = "2"   then
	MOVF       _SERIAL+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main206
;robot_clima.mbas,208 :: 		UART1_Write_Text("Alerta Sensor 2")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main206:
;robot_clima.mbas,209 :: 		end if
L__main185:
;robot_clima.mbas,211 :: 		SERIAL=0
	CLRF       _SERIAL+0
;robot_clima.mbas,216 :: 		wend
	GOTO       L__main180
L__main181:
;robot_clima.mbas,218 :: 		wend
	GOTO       L__main142
	GOTO       $+0
; end of _main
