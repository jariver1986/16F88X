
I2C_TX_leer_teclado:

;I2C_TX.mbas,5 :: 		sub procedure leer_teclado()
;I2C_TX.mbas,6 :: 		kp = 0
	CLRF       _KP+0
;I2C_TX.mbas,7 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;I2C_TX.mbas,8 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado2
;I2C_TX.mbas,9 :: 		while(portb.0=0) wend
L_I2C_TX_leer_teclado5:
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado6
	GOTO       L_I2C_TX_leer_teclado5
L_I2C_TX_leer_teclado6:
;I2C_TX.mbas,10 :: 		kp=1 end if'1
	MOVLW      1
	MOVWF      _KP+0
L_I2C_TX_leer_teclado2:
;I2C_TX.mbas,11 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado10
;I2C_TX.mbas,12 :: 		while(portb.1=0) wend
L_I2C_TX_leer_teclado13:
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado14
	GOTO       L_I2C_TX_leer_teclado13
L_I2C_TX_leer_teclado14:
;I2C_TX.mbas,13 :: 		kp=2 end if'2
	MOVLW      2
	MOVWF      _KP+0
L_I2C_TX_leer_teclado10:
;I2C_TX.mbas,14 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado18
;I2C_TX.mbas,15 :: 		while(portb.2=0) wend
L_I2C_TX_leer_teclado21:
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado22
	GOTO       L_I2C_TX_leer_teclado21
L_I2C_TX_leer_teclado22:
;I2C_TX.mbas,16 :: 		kp=3 end if'3
	MOVLW      3
	MOVWF      _KP+0
L_I2C_TX_leer_teclado18:
;I2C_TX.mbas,17 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado26
;I2C_TX.mbas,18 :: 		while(portb.3=0) wend
L_I2C_TX_leer_teclado29:
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado30
	GOTO       L_I2C_TX_leer_teclado29
L_I2C_TX_leer_teclado30:
;I2C_TX.mbas,19 :: 		kp=$41 end if'A
	MOVLW      65
	MOVWF      _KP+0
L_I2C_TX_leer_teclado26:
;I2C_TX.mbas,20 :: 		if(kp=0)then
	MOVF       _KP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_TX_leer_teclado34
;I2C_TX.mbas,21 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;I2C_TX.mbas,22 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado37
;I2C_TX.mbas,23 :: 		while(portb.0=0) wend
L_I2C_TX_leer_teclado40:
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado41
	GOTO       L_I2C_TX_leer_teclado40
L_I2C_TX_leer_teclado41:
;I2C_TX.mbas,24 :: 		kp=4 end if'4
	MOVLW      4
	MOVWF      _KP+0
L_I2C_TX_leer_teclado37:
;I2C_TX.mbas,25 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado45
;I2C_TX.mbas,26 :: 		while(portb.1=0) wend
L_I2C_TX_leer_teclado48:
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado49
	GOTO       L_I2C_TX_leer_teclado48
L_I2C_TX_leer_teclado49:
;I2C_TX.mbas,27 :: 		kp=5 end if'5
	MOVLW      5
	MOVWF      _KP+0
L_I2C_TX_leer_teclado45:
;I2C_TX.mbas,28 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado53
;I2C_TX.mbas,29 :: 		while(portb.2=0) wend
L_I2C_TX_leer_teclado56:
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado57
	GOTO       L_I2C_TX_leer_teclado56
L_I2C_TX_leer_teclado57:
;I2C_TX.mbas,30 :: 		kp=6 end if'6
	MOVLW      6
	MOVWF      _KP+0
L_I2C_TX_leer_teclado53:
;I2C_TX.mbas,31 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado61
;I2C_TX.mbas,32 :: 		while(portb.3=0) wend
L_I2C_TX_leer_teclado64:
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado65
	GOTO       L_I2C_TX_leer_teclado64
L_I2C_TX_leer_teclado65:
;I2C_TX.mbas,33 :: 		kp=$42 end if'B
	MOVLW      66
	MOVWF      _KP+0
L_I2C_TX_leer_teclado61:
	GOTO       L_I2C_TX_leer_teclado35
;I2C_TX.mbas,34 :: 		else return
L_I2C_TX_leer_teclado34:
	RETURN
;I2C_TX.mbas,35 :: 		end if
L_I2C_TX_leer_teclado35:
;I2C_TX.mbas,36 :: 		if(kp=0) then
	MOVF       _KP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_TX_leer_teclado69
;I2C_TX.mbas,37 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;I2C_TX.mbas,38 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado72
;I2C_TX.mbas,39 :: 		while(portb.0=0) wend
L_I2C_TX_leer_teclado75:
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado76
	GOTO       L_I2C_TX_leer_teclado75
L_I2C_TX_leer_teclado76:
;I2C_TX.mbas,40 :: 		kp=7 end if'7
	MOVLW      7
	MOVWF      _KP+0
L_I2C_TX_leer_teclado72:
;I2C_TX.mbas,41 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado80
;I2C_TX.mbas,42 :: 		while(portb.1=0) wend
L_I2C_TX_leer_teclado83:
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado84
	GOTO       L_I2C_TX_leer_teclado83
L_I2C_TX_leer_teclado84:
;I2C_TX.mbas,43 :: 		kp=8 end if'8
	MOVLW      8
	MOVWF      _KP+0
L_I2C_TX_leer_teclado80:
;I2C_TX.mbas,44 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado88
;I2C_TX.mbas,45 :: 		while(portb.2=0) wend
L_I2C_TX_leer_teclado91:
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado92
	GOTO       L_I2C_TX_leer_teclado91
L_I2C_TX_leer_teclado92:
;I2C_TX.mbas,46 :: 		kp=9 end if'9
	MOVLW      9
	MOVWF      _KP+0
L_I2C_TX_leer_teclado88:
;I2C_TX.mbas,47 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado96
;I2C_TX.mbas,48 :: 		while(portb.3=0) wend
L_I2C_TX_leer_teclado99:
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado100
	GOTO       L_I2C_TX_leer_teclado99
L_I2C_TX_leer_teclado100:
;I2C_TX.mbas,49 :: 		kp=$43 end if'C
	MOVLW      67
	MOVWF      _KP+0
L_I2C_TX_leer_teclado96:
	GOTO       L_I2C_TX_leer_teclado70
;I2C_TX.mbas,50 :: 		else return
L_I2C_TX_leer_teclado69:
	RETURN
;I2C_TX.mbas,51 :: 		end if
L_I2C_TX_leer_teclado70:
;I2C_TX.mbas,52 :: 		if(kp=0)then
	MOVF       _KP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_TX_leer_teclado104
;I2C_TX.mbas,53 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;I2C_TX.mbas,54 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado107
;I2C_TX.mbas,55 :: 		while(portb.0=0) wend
L_I2C_TX_leer_teclado110:
	BTFSC      PORTB+0, 0
	GOTO       L_I2C_TX_leer_teclado111
	GOTO       L_I2C_TX_leer_teclado110
L_I2C_TX_leer_teclado111:
;I2C_TX.mbas,56 :: 		kp=$23 end if '*
	MOVLW      35
	MOVWF      _KP+0
L_I2C_TX_leer_teclado107:
;I2C_TX.mbas,57 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado115
;I2C_TX.mbas,58 :: 		while(portb.1=0) wend
L_I2C_TX_leer_teclado118:
	BTFSC      PORTB+0, 1
	GOTO       L_I2C_TX_leer_teclado119
	GOTO       L_I2C_TX_leer_teclado118
L_I2C_TX_leer_teclado119:
;I2C_TX.mbas,59 :: 		kp=48 end if'0
	MOVLW      48
	MOVWF      _KP+0
L_I2C_TX_leer_teclado115:
;I2C_TX.mbas,60 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado123
;I2C_TX.mbas,61 :: 		while(portb.2=0) wend
L_I2C_TX_leer_teclado126:
	BTFSC      PORTB+0, 2
	GOTO       L_I2C_TX_leer_teclado127
	GOTO       L_I2C_TX_leer_teclado126
L_I2C_TX_leer_teclado127:
;I2C_TX.mbas,62 :: 		kp=$24 end if'#
	MOVLW      36
	MOVWF      _KP+0
L_I2C_TX_leer_teclado123:
;I2C_TX.mbas,63 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado131
;I2C_TX.mbas,64 :: 		while(portb.3=0) wend
L_I2C_TX_leer_teclado134:
	BTFSC      PORTB+0, 3
	GOTO       L_I2C_TX_leer_teclado135
	GOTO       L_I2C_TX_leer_teclado134
L_I2C_TX_leer_teclado135:
;I2C_TX.mbas,65 :: 		kp=$44 end if'D
	MOVLW      68
	MOVWF      _KP+0
L_I2C_TX_leer_teclado131:
	GOTO       L_I2C_TX_leer_teclado105
;I2C_TX.mbas,66 :: 		else return
L_I2C_TX_leer_teclado104:
	RETURN
;I2C_TX.mbas,67 :: 		end if
L_I2C_TX_leer_teclado105:
	RETURN
; end of I2C_TX_leer_teclado

_main:

;I2C_TX.mbas,71 :: 		main:
;I2C_TX.mbas,72 :: 		ANSEL  = 0               ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;I2C_TX.mbas,73 :: 		ANSELH = 0
	CLRF       ANSELH+0
;I2C_TX.mbas,74 :: 		PORTB = 0
	CLRF       PORTB+0
;I2C_TX.mbas,75 :: 		TRISB = 0x0F               ' PORTB<7,6,5,4> salidas  PORTB<3,2,1,0> ENTRADAS
	MOVLW      15
	MOVWF      TRISB+0
;I2C_TX.mbas,76 :: 		TRISC=0
	CLRF       TRISC+0
;I2C_TX.mbas,77 :: 		PORTC=0
	CLRF       PORTC+0
;I2C_TX.mbas,78 :: 		PORTA=0
	CLRF       PORTA+0
;I2C_TX.mbas,79 :: 		TRISA=0
	CLRF       TRISA+0
;I2C_TX.mbas,81 :: 		WPUB = $0F                 'RESISTENCIAS INTERNAR ACTIVADAS
	MOVLW      15
	MOVWF      WPUB+0
;I2C_TX.mbas,82 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;I2C_TX.mbas,83 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;I2C_TX.mbas,84 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main141:
	DECFSZ     R13+0, 1
	GOTO       L__main141
	DECFSZ     R12+0, 1
	GOTO       L__main141
	DECFSZ     R11+0, 1
	GOTO       L__main141
	NOP
	NOP
;I2C_TX.mbas,86 :: 		while (1)
L__main143:
;I2C_TX.mbas,87 :: 		I2C1_Init(100000)        ' initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2C_TX.mbas,88 :: 		I2C1_Start()                      ' issue I2C start signal
	CALL       _I2C1_Start+0
;I2C_TX.mbas,92 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main147:
	DECFSZ     R13+0, 1
	GOTO       L__main147
	DECFSZ     R12+0, 1
	GOTO       L__main147
	DECFSZ     R11+0, 1
	GOTO       L__main147
	NOP
	NOP
;I2C_TX.mbas,93 :: 		I2C1_Wr("A")
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,94 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main148:
	DECFSZ     R13+0, 1
	GOTO       L__main148
	DECFSZ     R12+0, 1
	GOTO       L__main148
	DECFSZ     R11+0, 1
	GOTO       L__main148
	NOP
	NOP
;I2C_TX.mbas,95 :: 		I2C1_Wr("N")                     ' send data (data to be written)
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,96 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main149:
	DECFSZ     R13+0, 1
	GOTO       L__main149
	DECFSZ     R12+0, 1
	GOTO       L__main149
	DECFSZ     R11+0, 1
	GOTO       L__main149
	NOP
	NOP
;I2C_TX.mbas,97 :: 		I2C1_Wr("A")                     ' send data (data to be written)
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,98 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main150:
	DECFSZ     R13+0, 1
	GOTO       L__main150
	DECFSZ     R12+0, 1
	GOTO       L__main150
	DECFSZ     R11+0, 1
	GOTO       L__main150
	NOP
	NOP
;I2C_TX.mbas,99 :: 		I2C1_Wr("L")                     ' send data (data to be written)
	MOVLW      76
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,100 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main151:
	DECFSZ     R13+0, 1
	GOTO       L__main151
	DECFSZ     R12+0, 1
	GOTO       L__main151
	DECFSZ     R11+0, 1
	GOTO       L__main151
	NOP
	NOP
;I2C_TX.mbas,101 :: 		I2C1_Wr("I")                     ' send data (data to be written)
	MOVLW      73
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,102 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main152:
	DECFSZ     R13+0, 1
	GOTO       L__main152
	DECFSZ     R12+0, 1
	GOTO       L__main152
	DECFSZ     R11+0, 1
	GOTO       L__main152
	NOP
	NOP
;I2C_TX.mbas,103 :: 		I2C1_Wr("Z")                     ' send data (data to be written)
	MOVLW      90
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,104 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main153:
	DECFSZ     R13+0, 1
	GOTO       L__main153
	DECFSZ     R12+0, 1
	GOTO       L__main153
	DECFSZ     R11+0, 1
	GOTO       L__main153
	NOP
	NOP
;I2C_TX.mbas,105 :: 		I2C1_Wr("A")                     ' send data (data to be written)
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,106 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main154:
	DECFSZ     R13+0, 1
	GOTO       L__main154
	DECFSZ     R12+0, 1
	GOTO       L__main154
	DECFSZ     R11+0, 1
	GOTO       L__main154
	NOP
	NOP
;I2C_TX.mbas,107 :: 		I2C1_Wr("D")                     ' send data (data to be written)
	MOVLW      68
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,108 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main155:
	DECFSZ     R13+0, 1
	GOTO       L__main155
	DECFSZ     R12+0, 1
	GOTO       L__main155
	DECFSZ     R11+0, 1
	GOTO       L__main155
	NOP
	NOP
;I2C_TX.mbas,109 :: 		I2C1_Wr("O")                     ' send data (data to be written)
	MOVLW      79
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,110 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main156:
	DECFSZ     R13+0, 1
	GOTO       L__main156
	DECFSZ     R12+0, 1
	GOTO       L__main156
	DECFSZ     R11+0, 1
	GOTO       L__main156
	NOP
	NOP
;I2C_TX.mbas,111 :: 		I2C1_Wr("R")                     ' send data (data to be written)
	MOVLW      82
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,112 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main157:
	DECFSZ     R13+0, 1
	GOTO       L__main157
	DECFSZ     R12+0, 1
	GOTO       L__main157
	DECFSZ     R11+0, 1
	GOTO       L__main157
	NOP
	NOP
;I2C_TX.mbas,113 :: 		I2C1_Wr(" ")                     ' send data (data to be written)
	MOVLW      32
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,114 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main158:
	DECFSZ     R13+0, 1
	GOTO       L__main158
	DECFSZ     R12+0, 1
	GOTO       L__main158
	DECFSZ     R11+0, 1
	GOTO       L__main158
	NOP
	NOP
;I2C_TX.mbas,115 :: 		I2C1_Wr("I")                     ' send data (data to be written)
	MOVLW      73
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,116 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main159:
	DECFSZ     R13+0, 1
	GOTO       L__main159
	DECFSZ     R12+0, 1
	GOTO       L__main159
	DECFSZ     R11+0, 1
	GOTO       L__main159
	NOP
	NOP
;I2C_TX.mbas,117 :: 		I2C1_Wr("2")                     ' send data (data to be written)
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,118 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main160:
	DECFSZ     R13+0, 1
	GOTO       L__main160
	DECFSZ     R12+0, 1
	GOTO       L__main160
	DECFSZ     R11+0, 1
	GOTO       L__main160
	NOP
	NOP
;I2C_TX.mbas,119 :: 		I2C1_Wr("C")                     ' send data (data to be written)
	MOVLW      67
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,120 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main161:
	DECFSZ     R13+0, 1
	GOTO       L__main161
	DECFSZ     R12+0, 1
	GOTO       L__main161
	DECFSZ     R11+0, 1
	GOTO       L__main161
	NOP
	NOP
;I2C_TX.mbas,125 :: 		leer_teclado() 'EXPLORO TECLADO
	CALL       I2C_TX_leer_teclado+0
;I2C_TX.mbas,126 :: 		if(kp > 0)then  'PREGUNTO SI HE PRESIONADO ALGUNA TECLA
	MOVF       _KP+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L__main163
;I2C_TX.mbas,127 :: 		VALOR =kp 'GUARDO EL VALOR DE LA TECLA PRESIONADA PRA VISUALIZAR EN DISPLAY
	MOVF       _KP+0, 0
	MOVWF      _VALOR+0
L__main163:
;I2C_TX.mbas,129 :: 		if VALOR=48 then
	MOVF       _VALOR+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L__main166
;I2C_TX.mbas,130 :: 		I2C1_Wr("0")                     ' send data (data to be written)
	MOVLW      48
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,131 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main168:
	DECFSZ     R13+0, 1
	GOTO       L__main168
	DECFSZ     R12+0, 1
	GOTO       L__main168
	DECFSZ     R11+0, 1
	GOTO       L__main168
	NOP
L__main166:
;I2C_TX.mbas,133 :: 		if VALOR=1 then
	MOVF       _VALOR+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main170
;I2C_TX.mbas,134 :: 		I2C1_Wr("1")                     ' send data (data to be written)
	MOVLW      49
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,135 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main172:
	DECFSZ     R13+0, 1
	GOTO       L__main172
	DECFSZ     R12+0, 1
	GOTO       L__main172
	DECFSZ     R11+0, 1
	GOTO       L__main172
	NOP
L__main170:
;I2C_TX.mbas,137 :: 		if VALOR=2 then
	MOVF       _VALOR+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main174
;I2C_TX.mbas,138 :: 		I2C1_Wr("2")                     ' send data (data to be written)
	MOVLW      50
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,139 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main176:
	DECFSZ     R13+0, 1
	GOTO       L__main176
	DECFSZ     R12+0, 1
	GOTO       L__main176
	DECFSZ     R11+0, 1
	GOTO       L__main176
	NOP
L__main174:
;I2C_TX.mbas,141 :: 		if VALOR=3 then
	MOVF       _VALOR+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main178
;I2C_TX.mbas,142 :: 		I2C1_Wr("3")                     ' send data (data to be written)
	MOVLW      51
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,143 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main180:
	DECFSZ     R13+0, 1
	GOTO       L__main180
	DECFSZ     R12+0, 1
	GOTO       L__main180
	DECFSZ     R11+0, 1
	GOTO       L__main180
	NOP
L__main178:
;I2C_TX.mbas,145 :: 		if VALOR=4 then
	MOVF       _VALOR+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main182
;I2C_TX.mbas,146 :: 		I2C1_Wr("4")                     ' send data (data to be written)
	MOVLW      52
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,147 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main184:
	DECFSZ     R13+0, 1
	GOTO       L__main184
	DECFSZ     R12+0, 1
	GOTO       L__main184
	DECFSZ     R11+0, 1
	GOTO       L__main184
	NOP
L__main182:
;I2C_TX.mbas,149 :: 		if VALOR=5 then
	MOVF       _VALOR+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main186
;I2C_TX.mbas,150 :: 		I2C1_Wr("5")                     ' send data (data to be written)
	MOVLW      53
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,151 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main188:
	DECFSZ     R13+0, 1
	GOTO       L__main188
	DECFSZ     R12+0, 1
	GOTO       L__main188
	DECFSZ     R11+0, 1
	GOTO       L__main188
	NOP
L__main186:
;I2C_TX.mbas,153 :: 		if VALOR=6 then
	MOVF       _VALOR+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main190
;I2C_TX.mbas,154 :: 		I2C1_Wr("6")                     ' send data (data to be written)
	MOVLW      54
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,155 :: 		Delay_ms(100)
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
L__main190:
;I2C_TX.mbas,157 :: 		if VALOR=7 then
	MOVF       _VALOR+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main194
;I2C_TX.mbas,158 :: 		I2C1_Wr("7")                     ' send data (data to be written)
	MOVLW      55
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,159 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main196:
	DECFSZ     R13+0, 1
	GOTO       L__main196
	DECFSZ     R12+0, 1
	GOTO       L__main196
	DECFSZ     R11+0, 1
	GOTO       L__main196
	NOP
L__main194:
;I2C_TX.mbas,161 :: 		if VALOR=8 then
	MOVF       _VALOR+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main198
;I2C_TX.mbas,162 :: 		I2C1_Wr("8")                     ' send data (data to be written)
	MOVLW      56
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,163 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main200:
	DECFSZ     R13+0, 1
	GOTO       L__main200
	DECFSZ     R12+0, 1
	GOTO       L__main200
	DECFSZ     R11+0, 1
	GOTO       L__main200
	NOP
L__main198:
;I2C_TX.mbas,165 :: 		if VALOR=9 then
	MOVF       _VALOR+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L__main202
;I2C_TX.mbas,166 :: 		I2C1_Wr("9")                     ' send data (data to be written)
	MOVLW      57
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,167 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main204:
	DECFSZ     R13+0, 1
	GOTO       L__main204
	DECFSZ     R12+0, 1
	GOTO       L__main204
	DECFSZ     R11+0, 1
	GOTO       L__main204
	NOP
L__main202:
;I2C_TX.mbas,169 :: 		if VALOR=$41 then
	MOVF       _VALOR+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main206
;I2C_TX.mbas,170 :: 		I2C1_Wr("A")                     ' send data (data to be written)
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,171 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main208:
	DECFSZ     R13+0, 1
	GOTO       L__main208
	DECFSZ     R12+0, 1
	GOTO       L__main208
	DECFSZ     R11+0, 1
	GOTO       L__main208
	NOP
L__main206:
;I2C_TX.mbas,173 :: 		if VALOR=$42 then
	MOVF       _VALOR+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main210
;I2C_TX.mbas,174 :: 		I2C1_Wr("B")                     ' send data (data to be written)
	MOVLW      66
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,175 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main212:
	DECFSZ     R13+0, 1
	GOTO       L__main212
	DECFSZ     R12+0, 1
	GOTO       L__main212
	DECFSZ     R11+0, 1
	GOTO       L__main212
	NOP
L__main210:
;I2C_TX.mbas,177 :: 		if VALOR=$43 then
	MOVF       _VALOR+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main214
;I2C_TX.mbas,178 :: 		I2C1_Wr("C")                     ' send data (data to be written)
	MOVLW      67
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,179 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main216:
	DECFSZ     R13+0, 1
	GOTO       L__main216
	DECFSZ     R12+0, 1
	GOTO       L__main216
	DECFSZ     R11+0, 1
	GOTO       L__main216
	NOP
L__main214:
;I2C_TX.mbas,181 :: 		if VALOR=$44 then
	MOVF       _VALOR+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main218
;I2C_TX.mbas,182 :: 		I2C1_Wr("D")                     ' send data (data to be written)
	MOVLW      68
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,183 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main220:
	DECFSZ     R13+0, 1
	GOTO       L__main220
	DECFSZ     R12+0, 1
	GOTO       L__main220
	DECFSZ     R11+0, 1
	GOTO       L__main220
	NOP
L__main218:
;I2C_TX.mbas,185 :: 		if VALOR=$23 then
	MOVF       _VALOR+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L__main222
;I2C_TX.mbas,186 :: 		I2C1_Wr("*")                     ' send data (data to be written)
	MOVLW      42
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,187 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main224:
	DECFSZ     R13+0, 1
	GOTO       L__main224
	DECFSZ     R12+0, 1
	GOTO       L__main224
	DECFSZ     R11+0, 1
	GOTO       L__main224
	NOP
L__main222:
;I2C_TX.mbas,189 :: 		if VALOR=$24 then
	MOVF       _VALOR+0, 0
	XORLW      36
	BTFSS      STATUS+0, 2
	GOTO       L__main226
;I2C_TX.mbas,190 :: 		I2C1_Wr("#")                     ' send data (data to be written)
	MOVLW      35
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_TX.mbas,191 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main228:
	DECFSZ     R13+0, 1
	GOTO       L__main228
	DECFSZ     R12+0, 1
	GOTO       L__main228
	DECFSZ     R11+0, 1
	GOTO       L__main228
	NOP
L__main226:
;I2C_TX.mbas,194 :: 		wend
	GOTO       L__main143
	GOTO       $+0
; end of _main
