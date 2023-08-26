
controlparqueo_buzzer:

;controlparqueo.mbas,26 :: 		sub procedure buzzer()
;controlparqueo.mbas,27 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;controlparqueo.mbas,28 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_controlparqueo_buzzer1:
	DECFSZ     R13+0, 1
	GOTO       L_controlparqueo_buzzer1
	DECFSZ     R12+0, 1
	GOTO       L_controlparqueo_buzzer1
	DECFSZ     R11+0, 1
	GOTO       L_controlparqueo_buzzer1
	NOP
;controlparqueo.mbas,29 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;controlparqueo.mbas,30 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_controlparqueo_buzzer2:
	DECFSZ     R13+0, 1
	GOTO       L_controlparqueo_buzzer2
	DECFSZ     R12+0, 1
	GOTO       L_controlparqueo_buzzer2
	DECFSZ     R11+0, 1
	GOTO       L_controlparqueo_buzzer2
	NOP
	RETURN
; end of controlparqueo_buzzer

controlparqueo_leer_teclado:

;controlparqueo.mbas,34 :: 		sub procedure leer_teclado()
;controlparqueo.mbas,35 :: 		kp = 0
	CLRF       _kp+0
;controlparqueo.mbas,36 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;controlparqueo.mbas,37 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado5
;controlparqueo.mbas,38 :: 		while(portb.0=0) wend
L_controlparqueo_leer_teclado8:
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado9
	GOTO       L_controlparqueo_leer_teclado8
L_controlparqueo_leer_teclado9:
;controlparqueo.mbas,39 :: 		kp=0x31 end if'1
	MOVLW      49
	MOVWF      _kp+0
L_controlparqueo_leer_teclado5:
;controlparqueo.mbas,40 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado13
;controlparqueo.mbas,41 :: 		while(portb.1=0) wend
L_controlparqueo_leer_teclado16:
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado17
	GOTO       L_controlparqueo_leer_teclado16
L_controlparqueo_leer_teclado17:
;controlparqueo.mbas,42 :: 		kp=0x32 end if'2
	MOVLW      50
	MOVWF      _kp+0
L_controlparqueo_leer_teclado13:
;controlparqueo.mbas,43 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado21
;controlparqueo.mbas,44 :: 		while(portb.2=0) wend
L_controlparqueo_leer_teclado24:
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado25
	GOTO       L_controlparqueo_leer_teclado24
L_controlparqueo_leer_teclado25:
;controlparqueo.mbas,45 :: 		kp=0x33 end if'3
	MOVLW      51
	MOVWF      _kp+0
L_controlparqueo_leer_teclado21:
;controlparqueo.mbas,46 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado29
;controlparqueo.mbas,47 :: 		while(portb.3=0) wend
L_controlparqueo_leer_teclado32:
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado33
	GOTO       L_controlparqueo_leer_teclado32
L_controlparqueo_leer_teclado33:
;controlparqueo.mbas,48 :: 		kp=$41 end if'A
	MOVLW      65
	MOVWF      _kp+0
L_controlparqueo_leer_teclado29:
;controlparqueo.mbas,49 :: 		if(kp=0)then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_controlparqueo_leer_teclado37
;controlparqueo.mbas,50 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;controlparqueo.mbas,51 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado40
;controlparqueo.mbas,52 :: 		while(portb.0=0) wend
L_controlparqueo_leer_teclado43:
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado44
	GOTO       L_controlparqueo_leer_teclado43
L_controlparqueo_leer_teclado44:
;controlparqueo.mbas,53 :: 		kp=0x34 end if'4
	MOVLW      52
	MOVWF      _kp+0
L_controlparqueo_leer_teclado40:
;controlparqueo.mbas,54 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado48
;controlparqueo.mbas,55 :: 		while(portb.1=0) wend
L_controlparqueo_leer_teclado51:
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado52
	GOTO       L_controlparqueo_leer_teclado51
L_controlparqueo_leer_teclado52:
;controlparqueo.mbas,56 :: 		kp=0x35 end if'5
	MOVLW      53
	MOVWF      _kp+0
L_controlparqueo_leer_teclado48:
;controlparqueo.mbas,57 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado56
;controlparqueo.mbas,58 :: 		while(portb.2=0) wend
L_controlparqueo_leer_teclado59:
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado60
	GOTO       L_controlparqueo_leer_teclado59
L_controlparqueo_leer_teclado60:
;controlparqueo.mbas,59 :: 		kp=0x36 end if'6
	MOVLW      54
	MOVWF      _kp+0
L_controlparqueo_leer_teclado56:
;controlparqueo.mbas,60 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado64
;controlparqueo.mbas,61 :: 		while(portb.3=0) wend
L_controlparqueo_leer_teclado67:
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado68
	GOTO       L_controlparqueo_leer_teclado67
L_controlparqueo_leer_teclado68:
;controlparqueo.mbas,62 :: 		kp=$42 end if'B
	MOVLW      66
	MOVWF      _kp+0
L_controlparqueo_leer_teclado64:
	GOTO       L_controlparqueo_leer_teclado38
;controlparqueo.mbas,63 :: 		else return
L_controlparqueo_leer_teclado37:
	RETURN
;controlparqueo.mbas,64 :: 		end if
L_controlparqueo_leer_teclado38:
;controlparqueo.mbas,65 :: 		if(kp=0) then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_controlparqueo_leer_teclado72
;controlparqueo.mbas,66 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;controlparqueo.mbas,67 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado75
;controlparqueo.mbas,68 :: 		while(portb.0=0) wend
L_controlparqueo_leer_teclado78:
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado79
	GOTO       L_controlparqueo_leer_teclado78
L_controlparqueo_leer_teclado79:
;controlparqueo.mbas,69 :: 		kp=0x37 end if'7
	MOVLW      55
	MOVWF      _kp+0
L_controlparqueo_leer_teclado75:
;controlparqueo.mbas,70 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado83
;controlparqueo.mbas,71 :: 		while(portb.1=0) wend
L_controlparqueo_leer_teclado86:
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado87
	GOTO       L_controlparqueo_leer_teclado86
L_controlparqueo_leer_teclado87:
;controlparqueo.mbas,72 :: 		kp=0x38 end if'8
	MOVLW      56
	MOVWF      _kp+0
L_controlparqueo_leer_teclado83:
;controlparqueo.mbas,73 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado91
;controlparqueo.mbas,74 :: 		while(portb.2=0) wend
L_controlparqueo_leer_teclado94:
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado95
	GOTO       L_controlparqueo_leer_teclado94
L_controlparqueo_leer_teclado95:
;controlparqueo.mbas,75 :: 		kp=0x39 end if'9
	MOVLW      57
	MOVWF      _kp+0
L_controlparqueo_leer_teclado91:
;controlparqueo.mbas,76 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado99
;controlparqueo.mbas,77 :: 		while(portb.3=0) wend
L_controlparqueo_leer_teclado102:
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado103
	GOTO       L_controlparqueo_leer_teclado102
L_controlparqueo_leer_teclado103:
;controlparqueo.mbas,78 :: 		kp=$43 end if'C
	MOVLW      67
	MOVWF      _kp+0
L_controlparqueo_leer_teclado99:
	GOTO       L_controlparqueo_leer_teclado73
;controlparqueo.mbas,79 :: 		else return
L_controlparqueo_leer_teclado72:
	RETURN
;controlparqueo.mbas,80 :: 		end if
L_controlparqueo_leer_teclado73:
;controlparqueo.mbas,81 :: 		if(kp=0)then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_controlparqueo_leer_teclado107
;controlparqueo.mbas,82 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;controlparqueo.mbas,83 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado110
;controlparqueo.mbas,84 :: 		while(portb.0=0) wend
L_controlparqueo_leer_teclado113:
	BTFSC      PORTB+0, 0
	GOTO       L_controlparqueo_leer_teclado114
	GOTO       L_controlparqueo_leer_teclado113
L_controlparqueo_leer_teclado114:
;controlparqueo.mbas,85 :: 		kp=$23 end if '*
	MOVLW      35
	MOVWF      _kp+0
L_controlparqueo_leer_teclado110:
;controlparqueo.mbas,86 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado118
;controlparqueo.mbas,87 :: 		while(portb.1=0) wend
L_controlparqueo_leer_teclado121:
	BTFSC      PORTB+0, 1
	GOTO       L_controlparqueo_leer_teclado122
	GOTO       L_controlparqueo_leer_teclado121
L_controlparqueo_leer_teclado122:
;controlparqueo.mbas,88 :: 		kp=0x30 end if'0
	MOVLW      48
	MOVWF      _kp+0
L_controlparqueo_leer_teclado118:
;controlparqueo.mbas,89 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado126
;controlparqueo.mbas,90 :: 		while(portb.2=0) wend
L_controlparqueo_leer_teclado129:
	BTFSC      PORTB+0, 2
	GOTO       L_controlparqueo_leer_teclado130
	GOTO       L_controlparqueo_leer_teclado129
L_controlparqueo_leer_teclado130:
;controlparqueo.mbas,91 :: 		kp=$24 end if'#
	MOVLW      36
	MOVWF      _kp+0
L_controlparqueo_leer_teclado126:
;controlparqueo.mbas,92 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado134
;controlparqueo.mbas,93 :: 		while(portb.3=0) wend
L_controlparqueo_leer_teclado137:
	BTFSC      PORTB+0, 3
	GOTO       L_controlparqueo_leer_teclado138
	GOTO       L_controlparqueo_leer_teclado137
L_controlparqueo_leer_teclado138:
;controlparqueo.mbas,94 :: 		kp=$44 end if'D
	MOVLW      68
	MOVWF      _kp+0
L_controlparqueo_leer_teclado134:
	GOTO       L_controlparqueo_leer_teclado108
;controlparqueo.mbas,95 :: 		else return
L_controlparqueo_leer_teclado107:
	RETURN
;controlparqueo.mbas,96 :: 		end if
L_controlparqueo_leer_teclado108:
	RETURN
; end of controlparqueo_leer_teclado

controlparqueo_ultrasonico1:

;controlparqueo.mbas,103 :: 		dim distan,tiempo as word
;controlparqueo.mbas,104 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;controlparqueo.mbas,106 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;controlparqueo.mbas,107 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_controlparqueo_ultrasonico1142:
	DECFSZ     R13+0, 1
	GOTO       L_controlparqueo_ultrasonico1142
	NOP
	NOP
;controlparqueo.mbas,108 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;controlparqueo.mbas,110 :: 		DO
L_controlparqueo_ultrasonico1143:
;controlparqueo.mbas,111 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_controlparqueo_ultrasonico1149
;controlparqueo.mbas,112 :: 		TMR0 = 0
	CLRF       TMR0+0
;controlparqueo.mbas,113 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_controlparqueo_ultrasonico1149:
;controlparqueo.mbas,115 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_controlparqueo_ultrasonico1146
	GOTO       L_controlparqueo_ultrasonico1143
L_controlparqueo_ultrasonico1146:
;controlparqueo.mbas,117 :: 		DO
L_controlparqueo_ultrasonico1151:
;controlparqueo.mbas,118 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_controlparqueo_ultrasonico1157
;controlparqueo.mbas,119 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;controlparqueo.mbas,120 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_controlparqueo_ultrasonico1157:
;controlparqueo.mbas,125 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_controlparqueo_ultrasonico1154
	GOTO       L_controlparqueo_ultrasonico1151
L_controlparqueo_ultrasonico1154:
;controlparqueo.mbas,127 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_controlparqueo_ultrasonico1247:
	BTFSC      STATUS+0, 2
	GOTO       L_controlparqueo_ultrasonico1248
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_controlparqueo_ultrasonico1247
L_controlparqueo_ultrasonico1248:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;controlparqueo.mbas,128 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_controlparqueo_ultrasonico1159:
	DECFSZ     R13+0, 1
	GOTO       L_controlparqueo_ultrasonico1159
	DECFSZ     R12+0, 1
	GOTO       L_controlparqueo_ultrasonico1159
	NOP
;controlparqueo.mbas,129 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of controlparqueo_ultrasonico1

_main:

;controlparqueo.mbas,132 :: 		main:
;controlparqueo.mbas,133 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;controlparqueo.mbas,134 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;controlparqueo.mbas,135 :: 		WPUB = $0F
	MOVLW      15
	MOVWF      WPUB+0
;controlparqueo.mbas,136 :: 		PORTA = %00000000
	CLRF       PORTA+0
;controlparqueo.mbas,137 :: 		TRISA = %11111111
	MOVLW      255
	MOVWF      TRISA+0
;controlparqueo.mbas,138 :: 		PORTB = %00000000
	CLRF       PORTB+0
;controlparqueo.mbas,139 :: 		TRISB = %00001111
	MOVLW      15
	MOVWF      TRISB+0
;controlparqueo.mbas,140 :: 		PORTC = %00000000
	CLRF       PORTC+0
;controlparqueo.mbas,141 :: 		TRISC = %10000010
	MOVLW      130
	MOVWF      TRISC+0
;controlparqueo.mbas,142 :: 		PORTD = %00000000
	CLRF       PORTD+0
;controlparqueo.mbas,143 :: 		TRISD = %00000000
	CLRF       TRISD+0
;controlparqueo.mbas,144 :: 		PORTE = %00000000
	CLRF       PORTE+0
;controlparqueo.mbas,145 :: 		TRISE = %00000000
	CLRF       TRISE+0
;controlparqueo.mbas,146 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;controlparqueo.mbas,147 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;controlparqueo.mbas,148 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;controlparqueo.mbas,149 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main161:
	DECFSZ     R13+0, 1
	GOTO       L__main161
	DECFSZ     R12+0, 1
	GOTO       L__main161
	DECFSZ     R11+0, 1
	GOTO       L__main161
	NOP
;controlparqueo.mbas,151 :: 		listo=0
	CLRF       _listo+0
;controlparqueo.mbas,152 :: 		dato=0
	CLRF       _dato+0
;controlparqueo.mbas,154 :: 		CONT1 =0
	CLRF       _CONT1+0
;controlparqueo.mbas,155 :: 		CONT2 =0
	CLRF       _CONT2+0
;controlparqueo.mbas,156 :: 		CONT3 =0
	CLRF       _CONT3+0
;controlparqueo.mbas,157 :: 		CONT4 =0
	CLRF       _CONT4+0
;controlparqueo.mbas,158 :: 		CONT5 =0
	CLRF       _CONT5+0
;controlparqueo.mbas,159 :: 		CONT6 =0
	CLRF       _CONT6+0
;controlparqueo.mbas,160 :: 		CONT7 =0
	CLRF       _CONT7+0
;controlparqueo.mbas,161 :: 		CONT8 =0
	CLRF       _CONT8+0
;controlparqueo.mbas,162 :: 		CONT9 =0
	CLRF       _CONT9+0
;controlparqueo.mbas,163 :: 		CONT10 =0
	CLRF       _CONT10+0
;controlparqueo.mbas,164 :: 		CONT11 =0
	CLRF       _CONT11+0
;controlparqueo.mbas,165 :: 		CONT12 =0
	CLRF       _CONT12+0
;controlparqueo.mbas,166 :: 		CONT13 =0
	CLRF       _CONT13+0
;controlparqueo.mbas,167 :: 		CONT14 =0
	CLRF       _CONT14+0
;controlparqueo.mbas,168 :: 		CONT15 =0
	CLRF       _CONT15+0
;controlparqueo.mbas,169 :: 		ESTACION1=0
	BCF        _ESTACION1+0, BitPos(_ESTACION1+0)
;controlparqueo.mbas,170 :: 		ESTACION2=0
	BCF        _ESTACION2+0, BitPos(_ESTACION2+0)
;controlparqueo.mbas,171 :: 		ESTACION3=0
	BCF        _ESTACION3+0, BitPos(_ESTACION3+0)
;controlparqueo.mbas,173 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;controlparqueo.mbas,174 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,175 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,176 :: 		Lcd_Out(1,1,"TESCU")
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,177 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,178 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main162:
	DECFSZ     R13+0, 1
	GOTO       L__main162
	DECFSZ     R12+0, 1
	GOTO       L__main162
	DECFSZ     R11+0, 1
	GOTO       L__main162
	NOP
	NOP
;controlparqueo.mbas,179 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,181 :: 		Lcd_Out(1,1,"CONTROL DE ")
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
;controlparqueo.mbas,182 :: 		Lcd_Out(2,1,"PARQUEO")
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
;controlparqueo.mbas,183 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main163:
	DECFSZ     R13+0, 1
	GOTO       L__main163
	DECFSZ     R12+0, 1
	GOTO       L__main163
	DECFSZ     R11+0, 1
	GOTO       L__main163
	NOP
	NOP
;controlparqueo.mbas,184 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,186 :: 		Lcd_Out(1,1,"POR: NELSON")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
;controlparqueo.mbas,187 :: 		Lcd_Out(2,1,"     GUZMAN")
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
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;controlparqueo.mbas,188 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main164:
	DECFSZ     R13+0, 1
	GOTO       L__main164
	DECFSZ     R12+0, 1
	GOTO       L__main164
	DECFSZ     R11+0, 1
	GOTO       L__main164
	NOP
	NOP
;controlparqueo.mbas,189 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,190 :: 		contador=0
	CLRF       _contador+0
;controlparqueo.mbas,191 :: 		tecla=1
	MOVLW      1
	MOVWF      _tecla+0
;controlparqueo.mbas,192 :: 		SENSOR=0
	CLRF       _SENSOR+0
	CLRF       _SENSOR+1
;controlparqueo.mbas,193 :: 		while 1
L__main166:
;controlparqueo.mbas,194 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main171
;controlparqueo.mbas,195 :: 		datorx = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _datorx+0
L__main171:
;controlparqueo.mbas,197 :: 		if datorx="X" then
	MOVF       _datorx+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L__main174
;controlparqueo.mbas,198 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,199 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;controlparqueo.mbas,200 :: 		Lcd_Out(2,1,"CORRECTO")                 ' escribe la cadena en la segunda fila
	MOVLW      2
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
	MOVLW      82
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
	MOVLW      84
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
;controlparqueo.mbas,201 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main176:
	DECFSZ     R13+0, 1
	GOTO       L__main176
	DECFSZ     R12+0, 1
	GOTO       L__main176
	DECFSZ     R11+0, 1
	GOTO       L__main176
	NOP
	NOP
;controlparqueo.mbas,202 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,203 :: 		datorx=0
	CLRF       _datorx+0
L__main174:
;controlparqueo.mbas,205 :: 		if datorx="Y" then
	MOVF       _datorx+0, 0
	XORLW      89
	BTFSS      STATUS+0, 2
	GOTO       L__main178
;controlparqueo.mbas,206 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,207 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;controlparqueo.mbas,208 :: 		Lcd_Out(2,1,"NEGADO")                 ' escribe la cadena en la segunda fila
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
;controlparqueo.mbas,209 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main180:
	DECFSZ     R13+0, 1
	GOTO       L__main180
	DECFSZ     R12+0, 1
	GOTO       L__main180
	DECFSZ     R11+0, 1
	GOTO       L__main180
	NOP
	NOP
;controlparqueo.mbas,210 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,211 :: 		datorx=0
	CLRF       _datorx+0
L__main178:
;controlparqueo.mbas,215 :: 		leer_teclado()
	CALL       controlparqueo_leer_teclado+0
;controlparqueo.mbas,216 :: 		if KP<>0 then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main182
;controlparqueo.mbas,218 :: 		while(tecla=1)
L__main185:
	MOVF       _tecla+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main186
;controlparqueo.mbas,219 :: 		leer_teclado()
	CALL       controlparqueo_leer_teclado+0
;controlparqueo.mbas,220 :: 		if KP<>0 then
	MOVF       _kp+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main190
;controlparqueo.mbas,221 :: 		Delay_ms(200)             ' TIEMPO DE ESPERA
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main192:
	DECFSZ     R13+0, 1
	GOTO       L__main192
	DECFSZ     R12+0, 1
	GOTO       L__main192
	DECFSZ     R11+0, 1
	GOTO       L__main192
	NOP
;controlparqueo.mbas,222 :: 		contador = contador+1
	INCF       _contador+0, 1
;controlparqueo.mbas,223 :: 		buzzer
	CALL       controlparqueo_buzzer+0
;controlparqueo.mbas,224 :: 		IF (kp = 0X31) and (contador=1)  then
	MOVF       _kp+0, 0
	XORLW      49
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main194
;controlparqueo.mbas,225 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,226 :: 		listo = listo + 1
	INCF       _listo+0, 1
;controlparqueo.mbas,227 :: 		Lcd_Out(2,1,"*")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main194:
;controlparqueo.mbas,229 :: 		IF (kp = 0X32) and (contador=2) then
	MOVF       _kp+0, 0
	XORLW      50
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main197
;controlparqueo.mbas,230 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,231 :: 		listo = listo + 1
	INCF       _listo+0, 1
;controlparqueo.mbas,232 :: 		Lcd_Out(2,1,"**")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	MOVLW      42
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main197:
;controlparqueo.mbas,234 :: 		IF (kp = 0X33) and (contador=3) then
	MOVF       _kp+0, 0
	XORLW      51
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main200
;controlparqueo.mbas,235 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,236 :: 		listo = listo + 1
	INCF       _listo+0, 1
;controlparqueo.mbas,237 :: 		Lcd_Out(2,1,"***")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	MOVLW      42
	MOVWF      _main_Local_Text+1
	MOVLW      42
	MOVWF      _main_Local_Text+2
	CLRF       _main_Local_Text+3
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main200:
;controlparqueo.mbas,239 :: 		IF (kp = 0X34) and (contador=4) then
	MOVF       _kp+0, 0
	XORLW      52
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _contador+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main203
;controlparqueo.mbas,240 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,241 :: 		listo = listo + 1
	INCF       _listo+0, 1
;controlparqueo.mbas,242 :: 		Lcd_Out(2,1,"****")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      42
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main203:
;controlparqueo.mbas,244 :: 		Delay_ms(300)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L__main205:
	DECFSZ     R13+0, 1
	GOTO       L__main205
	DECFSZ     R12+0, 1
	GOTO       L__main205
	DECFSZ     R11+0, 1
	GOTO       L__main205
;controlparqueo.mbas,245 :: 		if CONTADOR=4 then
	MOVF       _contador+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main207
;controlparqueo.mbas,246 :: 		buzzer
	CALL       controlparqueo_buzzer+0
;controlparqueo.mbas,247 :: 		buzzer
	CALL       controlparqueo_buzzer+0
;controlparqueo.mbas,248 :: 		buzzer
	CALL       controlparqueo_buzzer+0
;controlparqueo.mbas,249 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,251 :: 		if listo=4 then
	MOVF       _listo+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main210
;controlparqueo.mbas,252 :: 		listo=0
	CLRF       _listo+0
;controlparqueo.mbas,253 :: 		contador=0
	CLRF       _contador+0
;controlparqueo.mbas,254 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;controlparqueo.mbas,255 :: 		Lcd_Out(2,1,"CORRECTO")                 ' escribe la cadena en la segunda fila
	MOVLW      2
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
	MOVLW      82
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
	MOVLW      84
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
;controlparqueo.mbas,256 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main212:
	DECFSZ     R13+0, 1
	GOTO       L__main212
	DECFSZ     R12+0, 1
	GOTO       L__main212
	DECFSZ     R11+0, 1
	GOTO       L__main212
	NOP
	NOP
;controlparqueo.mbas,257 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,258 :: 		tecla=0
	CLRF       _tecla+0
	GOTO       L__main211
;controlparqueo.mbas,259 :: 		else
L__main210:
;controlparqueo.mbas,260 :: 		contador=0
	CLRF       _contador+0
;controlparqueo.mbas,261 :: 		listo=0
	CLRF       _listo+0
;controlparqueo.mbas,262 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;controlparqueo.mbas,263 :: 		Lcd_Out(2,1,"INCORRECTO")                 ' escribe la cadena en la segunda fila
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      84
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
;controlparqueo.mbas,264 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main213:
	DECFSZ     R13+0, 1
	GOTO       L__main213
	DECFSZ     R12+0, 1
	GOTO       L__main213
	DECFSZ     R11+0, 1
	GOTO       L__main213
	NOP
	NOP
;controlparqueo.mbas,265 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,266 :: 		Lcd_Out(1,1,"INGRESE CLAVE")                 ' escribe la cadena en la primera fila
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
;controlparqueo.mbas,267 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,268 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main214:
	DECFSZ     R13+0, 1
	GOTO       L__main214
	DECFSZ     R12+0, 1
	GOTO       L__main214
	DECFSZ     R11+0, 1
	GOTO       L__main214
	NOP
	NOP
;controlparqueo.mbas,269 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,270 :: 		tecla=0
	CLRF       _tecla+0
;controlparqueo.mbas,271 :: 		end if
L__main211:
L__main207:
;controlparqueo.mbas,273 :: 		end if
L__main190:
;controlparqueo.mbas,275 :: 		wend
	GOTO       L__main185
L__main186:
L__main182:
;controlparqueo.mbas,278 :: 		ACUMULADOR=0
	CLRF       _ACUMULADOR+0
;controlparqueo.mbas,279 :: 		Lcd_Out(1,1,"LIBRES:         ")
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
;controlparqueo.mbas,280 :: 		Lcd_Out(2,1,"OCUPADOS:       ")
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
;controlparqueo.mbas,281 :: 		Lcd_Out(3,1,"ESTACION:")
	MOVLW      3
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
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
;controlparqueo.mbas,282 :: 		if ESTACION1=1 THEN
	BTFSS      _ESTACION1+0, BitPos(_ESTACION1+0)
	GOTO       L__main216
;controlparqueo.mbas,283 :: 		Lcd_Out(4,3,"A")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L__main217
;controlparqueo.mbas,284 :: 		else
L__main216:
;controlparqueo.mbas,285 :: 		Lcd_Out(4,3,"_")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,286 :: 		end if
L__main217:
;controlparqueo.mbas,287 :: 		if ESTACION2=1 THEN
	BTFSS      _ESTACION2+0, BitPos(_ESTACION2+0)
	GOTO       L__main219
;controlparqueo.mbas,288 :: 		Lcd_Out(4,7,"B")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      66
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L__main220
;controlparqueo.mbas,289 :: 		else
L__main219:
;controlparqueo.mbas,290 :: 		Lcd_Out(4,7,"_")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,291 :: 		end if
L__main220:
;controlparqueo.mbas,292 :: 		if ESTACION3=1 THEN
	BTFSS      _ESTACION3+0, BitPos(_ESTACION3+0)
	GOTO       L__main222
;controlparqueo.mbas,293 :: 		Lcd_Out(4,11,"C")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      67
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L__main223
;controlparqueo.mbas,294 :: 		else
L__main222:
;controlparqueo.mbas,295 :: 		Lcd_Out(4,11,"_")
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      95
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,296 :: 		end if
L__main223:
;controlparqueo.mbas,297 :: 		SENSOR=ULTRASONICO1
	CALL       controlparqueo_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _SENSOR+0
	MOVF       R0+1, 0
	MOVWF      _SENSOR+1
;controlparqueo.mbas,298 :: 		if PORTA.RA0 = 0 then CONT1 = 0 ESTACION1=0 ELSE CONT1 = 1 ESTACION1=1  end if
	BTFSC      PORTA+0, 0
	GOTO       L__main225
	CLRF       _CONT1+0
	BCF        _ESTACION1+0, BitPos(_ESTACION1+0)
	GOTO       L__main226
L__main225:
	MOVLW      1
	MOVWF      _CONT1+0
	BSF        _ESTACION1+0, BitPos(_ESTACION1+0)
L__main226:
;controlparqueo.mbas,299 :: 		if PORTA.RA1 = 0 then CONT2 = 0 ESTACION2=0 ELSE CONT2 = 1 ESTACION2=1 end if
	BTFSC      PORTA+0, 1
	GOTO       L__main228
	CLRF       _CONT2+0
	BCF        _ESTACION2+0, BitPos(_ESTACION2+0)
	GOTO       L__main229
L__main228:
	MOVLW      1
	MOVWF      _CONT2+0
	BSF        _ESTACION2+0, BitPos(_ESTACION2+0)
L__main229:
;controlparqueo.mbas,301 :: 		if SENSOR > 20 then CONT3 = 0 ESTACION3=0 ELSE CONT3 = 1 ESTACION3=1 end if
	MOVF       _SENSOR+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main249
	MOVF       _SENSOR+0, 0
	SUBLW      20
L__main249:
	BTFSC      STATUS+0, 0
	GOTO       L__main231
	CLRF       _CONT3+0
	BCF        _ESTACION3+0, BitPos(_ESTACION3+0)
	GOTO       L__main232
L__main231:
	MOVLW      1
	MOVWF      _CONT3+0
	BSF        _ESTACION3+0, BitPos(_ESTACION3+0)
L__main232:
;controlparqueo.mbas,316 :: 		ACUMULADOR = CONT1 +CONT2 +CONT3 +CONT4 +CONT5 +CONT6 +CONT7 +CONT8 +CONT9 +CONT10 +CONT11 +CONT12 +CONT13 +CONT14 +CONT15
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
;controlparqueo.mbas,317 :: 		ByteToStr(3-ACUMULADOR, TEXTO)
	MOVF       R0+0, 0
	SUBLW      3
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;controlparqueo.mbas,318 :: 		Lcd_Out(1,10,TEXTO)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,319 :: 		ByteToStr(ACUMULADOR, TEXTO)
	MOVF       _ACUMULADOR+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;controlparqueo.mbas,320 :: 		Lcd_Out(2,10,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;controlparqueo.mbas,321 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main233:
	DECFSZ     R13+0, 1
	GOTO       L__main233
	DECFSZ     R12+0, 1
	GOTO       L__main233
	NOP
	NOP
;controlparqueo.mbas,322 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main235
;controlparqueo.mbas,323 :: 		dato = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main235:
;controlparqueo.mbas,325 :: 		if (ACUMULADOR = 3)and(PORTA.RA3=1)  THEN
	MOVF       _ACUMULADOR+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSS      PORTA+0, 3
	GOTO       L__main240
	MOVLW      255
	MOVWF      R0+0
L__main240:
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main238
;controlparqueo.mbas,326 :: 		Lcd_Out(1,1,"PARQUEADERO     ")
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
;controlparqueo.mbas,327 :: 		Lcd_Out(2,1,"LLENO           ")
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
;controlparqueo.mbas,328 :: 		sonido=1
	BSF        PORTD+0, 2
;controlparqueo.mbas,329 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main241:
	DECFSZ     R13+0, 1
	GOTO       L__main241
	DECFSZ     R12+0, 1
	GOTO       L__main241
	DECFSZ     R11+0, 1
	GOTO       L__main241
	NOP
	NOP
;controlparqueo.mbas,330 :: 		sonido=0
	BCF        PORTD+0, 2
;controlparqueo.mbas,331 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;controlparqueo.mbas,332 :: 		Lcd_Out(1,1,"INGRESO         ")
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
;controlparqueo.mbas,333 :: 		Lcd_Out(2,1,"BLOQUEADO       ")
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
;controlparqueo.mbas,334 :: 		led1=1
	BSF        PORTD+0, 3
;controlparqueo.mbas,335 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main242:
	DECFSZ     R13+0, 1
	GOTO       L__main242
	DECFSZ     R12+0, 1
	GOTO       L__main242
	DECFSZ     R11+0, 1
	GOTO       L__main242
	NOP
	NOP
;controlparqueo.mbas,336 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L__main239
;controlparqueo.mbas,337 :: 		else
L__main238:
;controlparqueo.mbas,338 :: 		if PORTA.RA3=1 then
	BTFSS      PORTA+0, 3
	GOTO       L__main244
;controlparqueo.mbas,339 :: 		led1=0
	BCF        PORTD+0, 3
;controlparqueo.mbas,340 :: 		Lcd_Out(1,1,"INGRESO         ")
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
;controlparqueo.mbas,341 :: 		Lcd_Out(2,1,"PERMITIDO       ")
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
;controlparqueo.mbas,342 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main246:
	DECFSZ     R13+0, 1
	GOTO       L__main246
	DECFSZ     R12+0, 1
	GOTO       L__main246
	DECFSZ     R11+0, 1
	GOTO       L__main246
	NOP
	NOP
;controlparqueo.mbas,343 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main244:
;controlparqueo.mbas,345 :: 		end if
L__main239:
;controlparqueo.mbas,347 :: 		wend
	GOTO       L__main166
	GOTO       $+0
; end of _main
