
control_motor_PARAR:

;control_motor.mbas,24 :: 		sub procedure PARAR()
;control_motor.mbas,25 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;control_motor.mbas,26 :: 		PORTC.RC1 = 1
	BSF        PORTC+0, 1
;control_motor.mbas,27 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;control_motor.mbas,28 :: 		PORTC.RC3 = 1
	BSF        PORTC+0, 3
	RETURN
; end of control_motor_PARAR

control_motor_ADELANTE:

;control_motor.mbas,30 :: 		sub procedure ADELANTE()
;control_motor.mbas,31 :: 		PARAR()
	CALL       control_motor_PARAR+0
;control_motor.mbas,32 :: 		Delay_ms(400)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_control_motor_ADELANTE2:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_ADELANTE2
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_ADELANTE2
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_ADELANTE2
;control_motor.mbas,33 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;control_motor.mbas,34 :: 		PORTC.RC1 = 1
	BSF        PORTC+0, 1
;control_motor.mbas,35 :: 		PORTC.RC2 = 0
	BCF        PORTC+0, 2
;control_motor.mbas,36 :: 		PORTC.RC3 = 1
	BSF        PORTC+0, 3
	RETURN
; end of control_motor_ADELANTE

control_motor_ATRAS:

;control_motor.mbas,38 :: 		sub procedure ATRAS()
;control_motor.mbas,39 :: 		PARAR()
	CALL       control_motor_PARAR+0
;control_motor.mbas,40 :: 		Delay_ms(400)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_control_motor_ATRAS4:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_ATRAS4
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_ATRAS4
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_ATRAS4
;control_motor.mbas,41 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;control_motor.mbas,42 :: 		PORTC.RC1 = 0
	BCF        PORTC+0, 1
;control_motor.mbas,43 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;control_motor.mbas,44 :: 		PORTC.RC3 = 0
	BCF        PORTC+0, 3
	RETURN
; end of control_motor_ATRAS

control_motor_DERECHA:

;control_motor.mbas,46 :: 		sub procedure DERECHA()
;control_motor.mbas,47 :: 		PARAR()
	CALL       control_motor_PARAR+0
;control_motor.mbas,48 :: 		Delay_ms(400)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_control_motor_DERECHA6:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_DERECHA6
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_DERECHA6
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_DERECHA6
;control_motor.mbas,49 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;control_motor.mbas,50 :: 		PORTC.RC1 = 0
	BCF        PORTC+0, 1
;control_motor.mbas,51 :: 		Delay_ms(300)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_control_motor_DERECHA7:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_DERECHA7
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_DERECHA7
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_DERECHA7
	NOP
	NOP
;control_motor.mbas,52 :: 		PARAR
	CALL       control_motor_PARAR+0
;control_motor.mbas,53 :: 		PORTC.RC2 = 0
	BCF        PORTC+0, 2
;control_motor.mbas,54 :: 		PORTC.RC3 = 1
	BSF        PORTC+0, 3
;control_motor.mbas,55 :: 		Delay_ms(300)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_control_motor_DERECHA8:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_DERECHA8
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_DERECHA8
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_DERECHA8
	NOP
	NOP
;control_motor.mbas,56 :: 		PARAR
	CALL       control_motor_PARAR+0
	RETURN
; end of control_motor_DERECHA

control_motor_IZQUIERDA:

;control_motor.mbas,58 :: 		sub procedure IZQUIERDA()
;control_motor.mbas,59 :: 		PARAR()
	CALL       control_motor_PARAR+0
;control_motor.mbas,60 :: 		Delay_ms(400)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_control_motor_IZQUIERDA10:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_IZQUIERDA10
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_IZQUIERDA10
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_IZQUIERDA10
;control_motor.mbas,61 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;control_motor.mbas,62 :: 		PORTC.RC1 = 1
	BSF        PORTC+0, 1
;control_motor.mbas,63 :: 		Delay_ms(300)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_control_motor_IZQUIERDA11:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_IZQUIERDA11
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_IZQUIERDA11
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_IZQUIERDA11
	NOP
	NOP
;control_motor.mbas,64 :: 		PARAR
	CALL       control_motor_PARAR+0
;control_motor.mbas,65 :: 		PORTC.RC2 = 1
	BSF        PORTC+0, 2
;control_motor.mbas,66 :: 		PORTC.RC3 = 0
	BCF        PORTC+0, 3
;control_motor.mbas,67 :: 		Delay_ms(300)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_control_motor_IZQUIERDA12:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_IZQUIERDA12
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_IZQUIERDA12
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_IZQUIERDA12
	NOP
	NOP
;control_motor.mbas,68 :: 		PARAR
	CALL       control_motor_PARAR+0
	RETURN
; end of control_motor_IZQUIERDA

control_motor_sonido:

;control_motor.mbas,70 :: 		sub procedure sonido()
;control_motor.mbas,71 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;control_motor.mbas,72 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_motor_sonido14:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_sonido14
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_sonido14
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_sonido14
;control_motor.mbas,73 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;control_motor.mbas,74 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_motor_sonido15:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_sonido15
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_sonido15
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_sonido15
	RETURN
; end of control_motor_sonido

control_motor_led:

;control_motor.mbas,76 :: 		sub procedure led()
;control_motor.mbas,77 :: 		PORTD.RD3 = 0
	BCF        PORTD+0, 3
;control_motor.mbas,78 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_motor_led17:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_led17
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_led17
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_led17
;control_motor.mbas,79 :: 		PORTD.RD3 = 1
	BSF        PORTD+0, 3
;control_motor.mbas,80 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_motor_led18:
	DECFSZ     R13+0, 1
	GOTO       L_control_motor_led18
	DECFSZ     R12+0, 1
	GOTO       L_control_motor_led18
	DECFSZ     R11+0, 1
	GOTO       L_control_motor_led18
	RETURN
; end of control_motor_led

control_motor_TECLADOMEMBRANA:

;control_motor.mbas,82 :: 		sub procedure TECLADOMEMBRANA()
;control_motor.mbas,83 :: 		kp = 255
	MOVLW      255
	MOVWF      _KP+0
;control_motor.mbas,84 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;control_motor.mbas,85 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA21
;control_motor.mbas,86 :: 		while(portb.0=0) wend
L_control_motor_TECLADOMEMBRANA24:
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA25
	GOTO       L_control_motor_TECLADOMEMBRANA24
L_control_motor_TECLADOMEMBRANA25:
;control_motor.mbas,87 :: 		numero2 = 0x4f
	MOVLW      79
	MOVWF      _NUMERO2+0
;control_motor.mbas,88 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA21:
;control_motor.mbas,91 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA29
;control_motor.mbas,92 :: 		while(portb.1=0) wend
L_control_motor_TECLADOMEMBRANA32:
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA33
	GOTO       L_control_motor_TECLADOMEMBRANA32
L_control_motor_TECLADOMEMBRANA33:
;control_motor.mbas,93 :: 		numero2 = 0x55
	MOVLW      85
	MOVWF      _NUMERO2+0
;control_motor.mbas,94 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA29:
;control_motor.mbas,97 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA37
;control_motor.mbas,98 :: 		while(portb.2=0) wend
L_control_motor_TECLADOMEMBRANA40:
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA41
	GOTO       L_control_motor_TECLADOMEMBRANA40
L_control_motor_TECLADOMEMBRANA41:
;control_motor.mbas,99 :: 		numero2 = 0x30
	MOVLW      48
	MOVWF      _NUMERO2+0
;control_motor.mbas,100 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA37:
;control_motor.mbas,103 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA45
;control_motor.mbas,104 :: 		while(portb.3=0) wend
L_control_motor_TECLADOMEMBRANA48:
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA49
	GOTO       L_control_motor_TECLADOMEMBRANA48
L_control_motor_TECLADOMEMBRANA49:
;control_motor.mbas,105 :: 		numero2 = 0x4f
	MOVLW      79
	MOVWF      _NUMERO2+0
;control_motor.mbas,106 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA45:
;control_motor.mbas,109 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA53
;control_motor.mbas,110 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;control_motor.mbas,111 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA56
;control_motor.mbas,112 :: 		while(portb.0=0) wend
L_control_motor_TECLADOMEMBRANA59:
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA60
	GOTO       L_control_motor_TECLADOMEMBRANA59
L_control_motor_TECLADOMEMBRANA60:
;control_motor.mbas,113 :: 		numero2 = 0x49 ' c
	MOVLW      73
	MOVWF      _NUMERO2+0
;control_motor.mbas,114 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA56:
;control_motor.mbas,118 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA64
;control_motor.mbas,119 :: 		while(portb.1=0) wend
L_control_motor_TECLADOMEMBRANA67:
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA68
	GOTO       L_control_motor_TECLADOMEMBRANA67
L_control_motor_TECLADOMEMBRANA68:
;control_motor.mbas,120 :: 		numero2 = 0x39 ' 9
	MOVLW      57
	MOVWF      _NUMERO2+0
;control_motor.mbas,121 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA64:
;control_motor.mbas,123 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA72
;control_motor.mbas,124 :: 		while(portb.2=0) wend
L_control_motor_TECLADOMEMBRANA75:
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA76
	GOTO       L_control_motor_TECLADOMEMBRANA75
L_control_motor_TECLADOMEMBRANA76:
;control_motor.mbas,125 :: 		numero2 = 0x38 ' c
	MOVLW      56
	MOVWF      _NUMERO2+0
;control_motor.mbas,126 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA72:
;control_motor.mbas,128 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA80
;control_motor.mbas,129 :: 		while(portb.3=0) wend
L_control_motor_TECLADOMEMBRANA83:
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA84
	GOTO       L_control_motor_TECLADOMEMBRANA83
L_control_motor_TECLADOMEMBRANA84:
;control_motor.mbas,130 :: 		numero2 = 0x37 ' c
	MOVLW      55
	MOVWF      _NUMERO2+0
;control_motor.mbas,131 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA80:
;control_motor.mbas,132 :: 		end if'B
	GOTO       L_control_motor_TECLADOMEMBRANA54
;control_motor.mbas,133 :: 		else return
L_control_motor_TECLADOMEMBRANA53:
	RETURN
;control_motor.mbas,134 :: 		end if
L_control_motor_TECLADOMEMBRANA54:
;control_motor.mbas,136 :: 		if(kp=255) then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA88
;control_motor.mbas,137 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;control_motor.mbas,138 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA91
;control_motor.mbas,139 :: 		while(portb.0=0) wend
L_control_motor_TECLADOMEMBRANA94:
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA95
	GOTO       L_control_motor_TECLADOMEMBRANA94
L_control_motor_TECLADOMEMBRANA95:
;control_motor.mbas,140 :: 		numero2 = 0x45 ' c
	MOVLW      69
	MOVWF      _NUMERO2+0
;control_motor.mbas,141 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA91:
;control_motor.mbas,144 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA99
;control_motor.mbas,145 :: 		while(portb.1=0) wend
L_control_motor_TECLADOMEMBRANA102:
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA103
	GOTO       L_control_motor_TECLADOMEMBRANA102
L_control_motor_TECLADOMEMBRANA103:
;control_motor.mbas,146 :: 		numero2 = 0x36 ' c
	MOVLW      54
	MOVWF      _NUMERO2+0
;control_motor.mbas,147 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA99:
;control_motor.mbas,149 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA107
;control_motor.mbas,150 :: 		while(portb.2=0) wend
L_control_motor_TECLADOMEMBRANA110:
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA111
	GOTO       L_control_motor_TECLADOMEMBRANA110
L_control_motor_TECLADOMEMBRANA111:
;control_motor.mbas,151 :: 		numero2 = 0x35 ' c
	MOVLW      53
	MOVWF      _NUMERO2+0
;control_motor.mbas,152 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA107:
;control_motor.mbas,155 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA115
;control_motor.mbas,156 :: 		while(portb.3=0) wend
L_control_motor_TECLADOMEMBRANA118:
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA119
	GOTO       L_control_motor_TECLADOMEMBRANA118
L_control_motor_TECLADOMEMBRANA119:
;control_motor.mbas,157 :: 		numero2 = 0x34 ' c
	MOVLW      52
	MOVWF      _NUMERO2+0
;control_motor.mbas,158 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA115:
;control_motor.mbas,159 :: 		end if'C
	GOTO       L_control_motor_TECLADOMEMBRANA89
;control_motor.mbas,160 :: 		else return
L_control_motor_TECLADOMEMBRANA88:
	RETURN
;control_motor.mbas,161 :: 		end if
L_control_motor_TECLADOMEMBRANA89:
;control_motor.mbas,162 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA123
;control_motor.mbas,163 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;control_motor.mbas,164 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA126
;control_motor.mbas,165 :: 		while(portb.0=0) wend
L_control_motor_TECLADOMEMBRANA129:
	BTFSC      PORTB+0, 0
	GOTO       L_control_motor_TECLADOMEMBRANA130
	GOTO       L_control_motor_TECLADOMEMBRANA129
L_control_motor_TECLADOMEMBRANA130:
;control_motor.mbas,166 :: 		numero2 = 0x2A ' c
	MOVLW      42
	MOVWF      _NUMERO2+0
;control_motor.mbas,167 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA126:
;control_motor.mbas,169 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA134
;control_motor.mbas,170 :: 		while(portb.1=0) wend
L_control_motor_TECLADOMEMBRANA137:
	BTFSC      PORTB+0, 1
	GOTO       L_control_motor_TECLADOMEMBRANA138
	GOTO       L_control_motor_TECLADOMEMBRANA137
L_control_motor_TECLADOMEMBRANA138:
;control_motor.mbas,171 :: 		numero2 = 0x33 ' c
	MOVLW      51
	MOVWF      _NUMERO2+0
;control_motor.mbas,172 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA134:
;control_motor.mbas,174 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA142
;control_motor.mbas,175 :: 		while(portb.2=0) wend
L_control_motor_TECLADOMEMBRANA145:
	BTFSC      PORTB+0, 2
	GOTO       L_control_motor_TECLADOMEMBRANA146
	GOTO       L_control_motor_TECLADOMEMBRANA145
L_control_motor_TECLADOMEMBRANA146:
;control_motor.mbas,176 :: 		numero2 = 0x32 ' c
	MOVLW      50
	MOVWF      _NUMERO2+0
;control_motor.mbas,177 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA142:
;control_motor.mbas,179 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA150
;control_motor.mbas,180 :: 		while(portb.3=0) wend
L_control_motor_TECLADOMEMBRANA153:
	BTFSC      PORTB+0, 3
	GOTO       L_control_motor_TECLADOMEMBRANA154
	GOTO       L_control_motor_TECLADOMEMBRANA153
L_control_motor_TECLADOMEMBRANA154:
;control_motor.mbas,181 :: 		numero2 = 0x31 ' c
	MOVLW      49
	MOVWF      _NUMERO2+0
;control_motor.mbas,182 :: 		KP=0
	CLRF       _KP+0
L_control_motor_TECLADOMEMBRANA150:
;control_motor.mbas,183 :: 		end if'D
	GOTO       L_control_motor_TECLADOMEMBRANA124
;control_motor.mbas,184 :: 		else return
L_control_motor_TECLADOMEMBRANA123:
	RETURN
;control_motor.mbas,185 :: 		end if
L_control_motor_TECLADOMEMBRANA124:
	RETURN
; end of control_motor_TECLADOMEMBRANA

_main:

;control_motor.mbas,188 :: 		main:
;control_motor.mbas,189 :: 		OPTION_REG = %00000111
	MOVLW      7
	MOVWF      OPTION_REG+0
;control_motor.mbas,190 :: 		OSCCON  = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;control_motor.mbas,191 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;control_motor.mbas,192 :: 		TRISA   = %10000000
	MOVLW      128
	MOVWF      TRISA+0
;control_motor.mbas,193 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;control_motor.mbas,194 :: 		TRISB   = %00001111
	MOVLW      15
	MOVWF      TRISB+0
;control_motor.mbas,195 :: 		PORTC   = %00001111
	MOVLW      15
	MOVWF      PORTC+0
;control_motor.mbas,196 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;control_motor.mbas,197 :: 		PORTD   = %00001000
	MOVLW      8
	MOVWF      PORTD+0
;control_motor.mbas,198 :: 		TRISD   = %00000000
	CLRF       TRISD+0
;control_motor.mbas,199 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;control_motor.mbas,200 :: 		ANSELH  = %00000000
	CLRF       ANSELH+0
;control_motor.mbas,201 :: 		WPUB       = %00001111
	MOVLW      15
	MOVWF      WPUB+0
;control_motor.mbas,202 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_motor.mbas,203 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;control_motor.mbas,204 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_motor.mbas,205 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_motor.mbas,206 :: 		Lcd_Out(1,1,"INGRESE CLAVE")                 ' escribe la cadena en la primera fila
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
;control_motor.mbas,207 :: 		Lcd_Out(2,1,"")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_motor.mbas,208 :: 		LED
	CALL       control_motor_led+0
;control_motor.mbas,209 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,210 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
;control_motor.mbas,211 :: 		LISTO=0
	CLRF       _LISTO+0
;control_motor.mbas,212 :: 		turno=1
	MOVLW      1
	MOVWF      _turno+0
;control_motor.mbas,213 :: 		while 1
L__main159:
;control_motor.mbas,214 :: 		while (turno=1)
L__main164:
	MOVF       _turno+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main165
;control_motor.mbas,215 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main169
;control_motor.mbas,216 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main169:
;control_motor.mbas,218 :: 		if DATO = "C" then
	MOVF       _DATO+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main172
;control_motor.mbas,219 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,220 :: 		turno=2
	MOVLW      2
	MOVWF      _turno+0
L__main172:
;control_motor.mbas,222 :: 		TECLADOMEMBRANA
	CALL       control_motor_TECLADOMEMBRANA+0
;control_motor.mbas,223 :: 		if KP<>255 then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__main175
;control_motor.mbas,224 :: 		UART1_Write(numero2)       ' ENVIA NUMERO
	MOVF       _NUMERO2+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_motor.mbas,225 :: 		Delay_ms(200)             ' TIEMPO DE ESPERA
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main177:
	DECFSZ     R13+0, 1
	GOTO       L__main177
	DECFSZ     R12+0, 1
	GOTO       L__main177
	DECFSZ     R11+0, 1
	GOTO       L__main177
;control_motor.mbas,226 :: 		contador = contador+1
	INCF       _CONTADOR+0, 1
;control_motor.mbas,227 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,228 :: 		IF (NUMERO2 = 0X31) and (contador=1)  then
	MOVF       _NUMERO2+0, 0
	XORLW      49
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main179
;control_motor.mbas,229 :: 		listo = listo + 1
	INCF       _LISTO+0, 1
L__main179:
;control_motor.mbas,231 :: 		IF (NUMERO2 = 0X32) and (contador=2) then
	MOVF       _NUMERO2+0, 0
	XORLW      50
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main182
;control_motor.mbas,232 :: 		listo = listo + 1
	INCF       _LISTO+0, 1
L__main182:
;control_motor.mbas,234 :: 		IF (NUMERO2 = 0X33) and (contador=3) then
	MOVF       _NUMERO2+0, 0
	XORLW      51
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main185
;control_motor.mbas,235 :: 		listo = listo + 1
	INCF       _LISTO+0, 1
L__main185:
;control_motor.mbas,237 :: 		IF (NUMERO2 = 0X34) and (contador=4) then
	MOVF       _NUMERO2+0, 0
	XORLW      52
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main188
;control_motor.mbas,238 :: 		listo = listo + 1
	INCF       _LISTO+0, 1
L__main188:
;control_motor.mbas,240 :: 		Lcd_Out(2,contador,"*")
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
;control_motor.mbas,241 :: 		if CONTADOR=4 then
	MOVF       _CONTADOR+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main191
;control_motor.mbas,242 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,243 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,244 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,245 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_motor.mbas,247 :: 		if listo=4 then
	MOVF       _LISTO+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main194
;control_motor.mbas,248 :: 		listo=0
	CLRF       _LISTO+0
;control_motor.mbas,249 :: 		contador=0
	CLRF       _CONTADOR+0
;control_motor.mbas,250 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;control_motor.mbas,251 :: 		Lcd_Out(2,1,"CORRECTO")                 ' escribe la cadena en la segunda fila
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
;control_motor.mbas,252 :: 		led
	CALL       control_motor_led+0
;control_motor.mbas,253 :: 		led
	CALL       control_motor_led+0
;control_motor.mbas,254 :: 		turno=2
	MOVLW      2
	MOVWF      _turno+0
;control_motor.mbas,255 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L__main195
;control_motor.mbas,256 :: 		else
L__main194:
;control_motor.mbas,257 :: 		contador=0
	CLRF       _CONTADOR+0
;control_motor.mbas,258 :: 		listo=0
	CLRF       _LISTO+0
;control_motor.mbas,259 :: 		Lcd_Out(1,1,"ACCESO")                 ' escribe la cadena en la primera fila
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
;control_motor.mbas,260 :: 		Lcd_Out(2,1,"INCORRECTO")                 ' escribe la cadena en la segunda fila
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
;control_motor.mbas,261 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main196:
	DECFSZ     R13+0, 1
	GOTO       L__main196
	DECFSZ     R12+0, 1
	GOTO       L__main196
	DECFSZ     R11+0, 1
	GOTO       L__main196
	NOP
;control_motor.mbas,262 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_motor.mbas,263 :: 		Lcd_Out(1,1,"INGRESE CLAVE")                 ' escribe la cadena en la primera fila
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
;control_motor.mbas,264 :: 		Lcd_Out(2,1,"")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	CLRF       _main_Local_Text+0
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_motor.mbas,265 :: 		end if
L__main195:
L__main191:
;control_motor.mbas,267 :: 		end if
L__main175:
;control_motor.mbas,270 :: 		wend
	GOTO       L__main164
L__main165:
;control_motor.mbas,272 :: 		while ((turno=2))
L__main198:
	MOVF       _turno+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main199
;control_motor.mbas,273 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main203
;control_motor.mbas,274 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
;control_motor.mbas,275 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main203:
;control_motor.mbas,277 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main206
;control_motor.mbas,278 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,279 :: 		ADELANTE
	CALL       control_motor_ADELANTE+0
;control_motor.mbas,280 :: 		UART1_Write_Text("ADELANTE")
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
;control_motor.mbas,281 :: 		Lcd_Out(1,1,"ADELANTE")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main206:
;control_motor.mbas,283 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main209
;control_motor.mbas,284 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,285 :: 		PARAR
	CALL       control_motor_PARAR+0
;control_motor.mbas,286 :: 		UART1_Write_Text("PARAR")
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
;control_motor.mbas,287 :: 		Lcd_Out(1,1,"PARAR")
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
	MOVLW      65
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
L__main209:
;control_motor.mbas,289 :: 		if DATO = "3" then
	MOVF       _DATO+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main212
;control_motor.mbas,290 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,291 :: 		ATRAS
	CALL       control_motor_ATRAS+0
;control_motor.mbas,292 :: 		UART1_Write_Text("ATRAS")
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
;control_motor.mbas,293 :: 		Lcd_Out(1,1,"ATRAS")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main212:
;control_motor.mbas,295 :: 		if DATO = "4" then
	MOVF       _DATO+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main215
;control_motor.mbas,296 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,297 :: 		IZQUIERDA
	CALL       control_motor_IZQUIERDA+0
;control_motor.mbas,298 :: 		UART1_Write_Text("GIRO IZQUIERDA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
;control_motor.mbas,299 :: 		Lcd_Out(1,1,"IZQUIERDA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main215:
;control_motor.mbas,301 :: 		if DATO = "5" then
	MOVF       _DATO+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main218
;control_motor.mbas,302 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,303 :: 		DERECHA
	CALL       control_motor_DERECHA+0
;control_motor.mbas,304 :: 		UART1_Write_Text("GIRO DERECHA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
;control_motor.mbas,305 :: 		Lcd_Out(1,1,"DERECHA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main218:
;control_motor.mbas,307 :: 		if DATO = "B" then
	MOVF       _DATO+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main221
;control_motor.mbas,308 :: 		SONIDO
	CALL       control_motor_sonido+0
;control_motor.mbas,309 :: 		DATO=0
	CLRF       _DATO+0
;control_motor.mbas,310 :: 		TURNO=1
	MOVLW      1
	MOVWF      _turno+0
;control_motor.mbas,311 :: 		GOTO main
	GOTO       _main+0
L__main221:
;control_motor.mbas,313 :: 		DATO=0
	CLRF       _DATO+0
;control_motor.mbas,314 :: 		wend
	GOTO       L__main198
L__main199:
;control_motor.mbas,316 :: 		wend
	GOTO       L__main159
	GOTO       $+0
; end of _main
