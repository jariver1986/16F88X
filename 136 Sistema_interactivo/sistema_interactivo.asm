
sistema_interactivo_TECLADOMEMBRANA:

;sistema_interactivo.mbas,5 :: 		sub procedure TECLADOMEMBRANA()
;sistema_interactivo.mbas,6 :: 		kp = 255
	MOVLW      255
	MOVWF      _KP+0
;sistema_interactivo.mbas,7 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;sistema_interactivo.mbas,8 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA2
;sistema_interactivo.mbas,9 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADOMEMBRANA5:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA6
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA5
L_sistema_interactivo_TECLADOMEMBRANA6:
;sistema_interactivo.mbas,10 :: 		numero2 = 0x4f
	MOVLW      79
	MOVWF      _numero2+0
;sistema_interactivo.mbas,11 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA2:
;sistema_interactivo.mbas,14 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA10
;sistema_interactivo.mbas,15 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADOMEMBRANA13:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA14
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA13
L_sistema_interactivo_TECLADOMEMBRANA14:
;sistema_interactivo.mbas,16 :: 		numero2 = 0x55
	MOVLW      85
	MOVWF      _numero2+0
;sistema_interactivo.mbas,17 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA10:
;sistema_interactivo.mbas,20 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA18
;sistema_interactivo.mbas,21 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADOMEMBRANA21:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA22
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA21
L_sistema_interactivo_TECLADOMEMBRANA22:
;sistema_interactivo.mbas,22 :: 		numero2 = 0x30
	MOVLW      48
	MOVWF      _numero2+0
;sistema_interactivo.mbas,23 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA18:
;sistema_interactivo.mbas,26 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA26
;sistema_interactivo.mbas,27 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADOMEMBRANA29:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA30
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA29
L_sistema_interactivo_TECLADOMEMBRANA30:
;sistema_interactivo.mbas,28 :: 		numero2 = 0x4f
	MOVLW      79
	MOVWF      _numero2+0
;sistema_interactivo.mbas,29 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA26:
;sistema_interactivo.mbas,32 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA34
;sistema_interactivo.mbas,33 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;sistema_interactivo.mbas,34 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA37
;sistema_interactivo.mbas,35 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADOMEMBRANA40:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA41
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA40
L_sistema_interactivo_TECLADOMEMBRANA41:
;sistema_interactivo.mbas,36 :: 		numero2 = 0x49 ' c
	MOVLW      73
	MOVWF      _numero2+0
;sistema_interactivo.mbas,37 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA37:
;sistema_interactivo.mbas,41 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA45
;sistema_interactivo.mbas,42 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADOMEMBRANA48:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA49
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA48
L_sistema_interactivo_TECLADOMEMBRANA49:
;sistema_interactivo.mbas,43 :: 		numero2 = 0x39 ' 9
	MOVLW      57
	MOVWF      _numero2+0
;sistema_interactivo.mbas,44 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA45:
;sistema_interactivo.mbas,46 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA53
;sistema_interactivo.mbas,47 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADOMEMBRANA56:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA57
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA56
L_sistema_interactivo_TECLADOMEMBRANA57:
;sistema_interactivo.mbas,48 :: 		numero2 = 0x38 ' c
	MOVLW      56
	MOVWF      _numero2+0
;sistema_interactivo.mbas,49 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA53:
;sistema_interactivo.mbas,51 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA61
;sistema_interactivo.mbas,52 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADOMEMBRANA64:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA65
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA64
L_sistema_interactivo_TECLADOMEMBRANA65:
;sistema_interactivo.mbas,53 :: 		numero2 = 0x37 ' c
	MOVLW      55
	MOVWF      _numero2+0
;sistema_interactivo.mbas,54 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA61:
;sistema_interactivo.mbas,55 :: 		end if'B
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA35
;sistema_interactivo.mbas,56 :: 		else return
L_sistema_interactivo_TECLADOMEMBRANA34:
	RETURN
;sistema_interactivo.mbas,57 :: 		end if
L_sistema_interactivo_TECLADOMEMBRANA35:
;sistema_interactivo.mbas,59 :: 		if(kp=255) then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA69
;sistema_interactivo.mbas,60 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;sistema_interactivo.mbas,61 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA72
;sistema_interactivo.mbas,62 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADOMEMBRANA75:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA76
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA75
L_sistema_interactivo_TECLADOMEMBRANA76:
;sistema_interactivo.mbas,63 :: 		numero2 = 0x45 ' c
	MOVLW      69
	MOVWF      _numero2+0
;sistema_interactivo.mbas,64 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA72:
;sistema_interactivo.mbas,67 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA80
;sistema_interactivo.mbas,68 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADOMEMBRANA83:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA84
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA83
L_sistema_interactivo_TECLADOMEMBRANA84:
;sistema_interactivo.mbas,69 :: 		numero2 = 0x36 ' c
	MOVLW      54
	MOVWF      _numero2+0
;sistema_interactivo.mbas,70 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA80:
;sistema_interactivo.mbas,72 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA88
;sistema_interactivo.mbas,73 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADOMEMBRANA91:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA92
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA91
L_sistema_interactivo_TECLADOMEMBRANA92:
;sistema_interactivo.mbas,74 :: 		numero2 = 0x35 ' c
	MOVLW      53
	MOVWF      _numero2+0
;sistema_interactivo.mbas,75 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA88:
;sistema_interactivo.mbas,78 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA96
;sistema_interactivo.mbas,79 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADOMEMBRANA99:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA100
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA99
L_sistema_interactivo_TECLADOMEMBRANA100:
;sistema_interactivo.mbas,80 :: 		numero2 = 0x34 ' c
	MOVLW      52
	MOVWF      _numero2+0
;sistema_interactivo.mbas,81 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA96:
;sistema_interactivo.mbas,82 :: 		end if'C
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA70
;sistema_interactivo.mbas,83 :: 		else return
L_sistema_interactivo_TECLADOMEMBRANA69:
	RETURN
;sistema_interactivo.mbas,84 :: 		end if
L_sistema_interactivo_TECLADOMEMBRANA70:
;sistema_interactivo.mbas,85 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA104
;sistema_interactivo.mbas,86 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;sistema_interactivo.mbas,87 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA107
;sistema_interactivo.mbas,88 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADOMEMBRANA110:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA111
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA110
L_sistema_interactivo_TECLADOMEMBRANA111:
;sistema_interactivo.mbas,89 :: 		numero2 = 0x2A ' c
	MOVLW      42
	MOVWF      _numero2+0
;sistema_interactivo.mbas,90 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA107:
;sistema_interactivo.mbas,92 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA115
;sistema_interactivo.mbas,93 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADOMEMBRANA118:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA119
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA118
L_sistema_interactivo_TECLADOMEMBRANA119:
;sistema_interactivo.mbas,94 :: 		numero2 = 0x33 ' c
	MOVLW      51
	MOVWF      _numero2+0
;sistema_interactivo.mbas,95 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA115:
;sistema_interactivo.mbas,97 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA123
;sistema_interactivo.mbas,98 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADOMEMBRANA126:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA127
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA126
L_sistema_interactivo_TECLADOMEMBRANA127:
;sistema_interactivo.mbas,99 :: 		numero2 = 0x32 ' c
	MOVLW      50
	MOVWF      _numero2+0
;sistema_interactivo.mbas,100 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA123:
;sistema_interactivo.mbas,102 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA131
;sistema_interactivo.mbas,103 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADOMEMBRANA134:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA135
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA134
L_sistema_interactivo_TECLADOMEMBRANA135:
;sistema_interactivo.mbas,104 :: 		numero2 = 0x31 ' c
	MOVLW      49
	MOVWF      _numero2+0
;sistema_interactivo.mbas,105 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADOMEMBRANA131:
;sistema_interactivo.mbas,106 :: 		end if'D
	GOTO       L_sistema_interactivo_TECLADOMEMBRANA105
;sistema_interactivo.mbas,107 :: 		else return
L_sistema_interactivo_TECLADOMEMBRANA104:
	RETURN
;sistema_interactivo.mbas,108 :: 		end if
L_sistema_interactivo_TECLADOMEMBRANA105:
	RETURN
; end of sistema_interactivo_TECLADOMEMBRANA

sistema_interactivo_TECLADO4X4:

;sistema_interactivo.mbas,111 :: 		sub procedure TECLADO4X4()
;sistema_interactivo.mbas,112 :: 		kp = 255
	MOVLW      255
	MOVWF      _KP+0
;sistema_interactivo.mbas,113 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;sistema_interactivo.mbas,114 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4140
;sistema_interactivo.mbas,115 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADO4X4143:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4144
	GOTO       L_sistema_interactivo_TECLADO4X4143
L_sistema_interactivo_TECLADO4X4144:
;sistema_interactivo.mbas,116 :: 		numero2 = 0x44
	MOVLW      68
	MOVWF      _numero2+0
;sistema_interactivo.mbas,117 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4140:
;sistema_interactivo.mbas,120 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4148
;sistema_interactivo.mbas,121 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADO4X4151:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4152
	GOTO       L_sistema_interactivo_TECLADO4X4151
L_sistema_interactivo_TECLADO4X4152:
;sistema_interactivo.mbas,122 :: 		numero2 = 0x43
	MOVLW      67
	MOVWF      _numero2+0
;sistema_interactivo.mbas,123 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4148:
;sistema_interactivo.mbas,126 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4156
;sistema_interactivo.mbas,127 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADO4X4159:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4160
	GOTO       L_sistema_interactivo_TECLADO4X4159
L_sistema_interactivo_TECLADO4X4160:
;sistema_interactivo.mbas,128 :: 		numero2 = 0x42
	MOVLW      66
	MOVWF      _numero2+0
;sistema_interactivo.mbas,129 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4156:
;sistema_interactivo.mbas,132 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4164
;sistema_interactivo.mbas,133 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADO4X4167:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4168
	GOTO       L_sistema_interactivo_TECLADO4X4167
L_sistema_interactivo_TECLADO4X4168:
;sistema_interactivo.mbas,134 :: 		numero2 = 0x41
	MOVLW      65
	MOVWF      _numero2+0
;sistema_interactivo.mbas,135 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4164:
;sistema_interactivo.mbas,138 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4172
;sistema_interactivo.mbas,139 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;sistema_interactivo.mbas,140 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4175
;sistema_interactivo.mbas,141 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADO4X4178:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4179
	GOTO       L_sistema_interactivo_TECLADO4X4178
L_sistema_interactivo_TECLADO4X4179:
;sistema_interactivo.mbas,142 :: 		numero2 = 0x23 ' c
	MOVLW      35
	MOVWF      _numero2+0
;sistema_interactivo.mbas,143 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4175:
;sistema_interactivo.mbas,146 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4183
;sistema_interactivo.mbas,147 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADO4X4186:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4187
	GOTO       L_sistema_interactivo_TECLADO4X4186
L_sistema_interactivo_TECLADO4X4187:
;sistema_interactivo.mbas,148 :: 		numero2 = 0x39 ' 9
	MOVLW      57
	MOVWF      _numero2+0
;sistema_interactivo.mbas,149 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4183:
;sistema_interactivo.mbas,151 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4191
;sistema_interactivo.mbas,152 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADO4X4194:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4195
	GOTO       L_sistema_interactivo_TECLADO4X4194
L_sistema_interactivo_TECLADO4X4195:
;sistema_interactivo.mbas,153 :: 		numero2 = 0x36 ' c
	MOVLW      54
	MOVWF      _numero2+0
;sistema_interactivo.mbas,154 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4191:
;sistema_interactivo.mbas,156 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4199
;sistema_interactivo.mbas,157 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADO4X4202:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4203
	GOTO       L_sistema_interactivo_TECLADO4X4202
L_sistema_interactivo_TECLADO4X4203:
;sistema_interactivo.mbas,158 :: 		numero2 = 0x33 ' c
	MOVLW      51
	MOVWF      _numero2+0
;sistema_interactivo.mbas,159 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4199:
;sistema_interactivo.mbas,160 :: 		end if'B
	GOTO       L_sistema_interactivo_TECLADO4X4173
;sistema_interactivo.mbas,161 :: 		else return
L_sistema_interactivo_TECLADO4X4172:
	RETURN
;sistema_interactivo.mbas,162 :: 		end if
L_sistema_interactivo_TECLADO4X4173:
;sistema_interactivo.mbas,164 :: 		if(kp=255) then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4207
;sistema_interactivo.mbas,165 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;sistema_interactivo.mbas,166 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4210
;sistema_interactivo.mbas,167 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADO4X4213:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4214
	GOTO       L_sistema_interactivo_TECLADO4X4213
L_sistema_interactivo_TECLADO4X4214:
;sistema_interactivo.mbas,168 :: 		numero2 = 0x30 ' c
	MOVLW      48
	MOVWF      _numero2+0
;sistema_interactivo.mbas,169 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4210:
;sistema_interactivo.mbas,172 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4218
;sistema_interactivo.mbas,173 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADO4X4221:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4222
	GOTO       L_sistema_interactivo_TECLADO4X4221
L_sistema_interactivo_TECLADO4X4222:
;sistema_interactivo.mbas,174 :: 		numero2 = 0x38 ' c
	MOVLW      56
	MOVWF      _numero2+0
;sistema_interactivo.mbas,175 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4218:
;sistema_interactivo.mbas,177 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4226
;sistema_interactivo.mbas,178 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADO4X4229:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4230
	GOTO       L_sistema_interactivo_TECLADO4X4229
L_sistema_interactivo_TECLADO4X4230:
;sistema_interactivo.mbas,179 :: 		numero2 = 0x35 ' c
	MOVLW      53
	MOVWF      _numero2+0
;sistema_interactivo.mbas,180 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4226:
;sistema_interactivo.mbas,183 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4234
;sistema_interactivo.mbas,184 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADO4X4237:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4238
	GOTO       L_sistema_interactivo_TECLADO4X4237
L_sistema_interactivo_TECLADO4X4238:
;sistema_interactivo.mbas,185 :: 		numero2 = 0x32 ' c
	MOVLW      50
	MOVWF      _numero2+0
;sistema_interactivo.mbas,186 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4234:
;sistema_interactivo.mbas,187 :: 		end if'C
	GOTO       L_sistema_interactivo_TECLADO4X4208
;sistema_interactivo.mbas,188 :: 		else return
L_sistema_interactivo_TECLADO4X4207:
	RETURN
;sistema_interactivo.mbas,189 :: 		end if
L_sistema_interactivo_TECLADO4X4208:
;sistema_interactivo.mbas,190 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4242
;sistema_interactivo.mbas,191 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;sistema_interactivo.mbas,192 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4245
;sistema_interactivo.mbas,193 :: 		while(portb.0=0) wend
L_sistema_interactivo_TECLADO4X4248:
	BTFSC      PORTB+0, 0
	GOTO       L_sistema_interactivo_TECLADO4X4249
	GOTO       L_sistema_interactivo_TECLADO4X4248
L_sistema_interactivo_TECLADO4X4249:
;sistema_interactivo.mbas,194 :: 		numero2 = 0x2A ' c
	MOVLW      42
	MOVWF      _numero2+0
;sistema_interactivo.mbas,195 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4245:
;sistema_interactivo.mbas,197 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4253
;sistema_interactivo.mbas,198 :: 		while(portb.1=0) wend
L_sistema_interactivo_TECLADO4X4256:
	BTFSC      PORTB+0, 1
	GOTO       L_sistema_interactivo_TECLADO4X4257
	GOTO       L_sistema_interactivo_TECLADO4X4256
L_sistema_interactivo_TECLADO4X4257:
;sistema_interactivo.mbas,199 :: 		numero2 = 0x37 ' c
	MOVLW      55
	MOVWF      _numero2+0
;sistema_interactivo.mbas,200 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4253:
;sistema_interactivo.mbas,202 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4261
;sistema_interactivo.mbas,203 :: 		while(portb.2=0) wend
L_sistema_interactivo_TECLADO4X4264:
	BTFSC      PORTB+0, 2
	GOTO       L_sistema_interactivo_TECLADO4X4265
	GOTO       L_sistema_interactivo_TECLADO4X4264
L_sistema_interactivo_TECLADO4X4265:
;sistema_interactivo.mbas,204 :: 		numero2 = 0x34 ' c
	MOVLW      52
	MOVWF      _numero2+0
;sistema_interactivo.mbas,205 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4261:
;sistema_interactivo.mbas,207 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4269
;sistema_interactivo.mbas,208 :: 		while(portb.3=0) wend
L_sistema_interactivo_TECLADO4X4272:
	BTFSC      PORTB+0, 3
	GOTO       L_sistema_interactivo_TECLADO4X4273
	GOTO       L_sistema_interactivo_TECLADO4X4272
L_sistema_interactivo_TECLADO4X4273:
;sistema_interactivo.mbas,209 :: 		numero2 = 0x31 ' c
	MOVLW      49
	MOVWF      _numero2+0
;sistema_interactivo.mbas,210 :: 		KP=0
	CLRF       _KP+0
L_sistema_interactivo_TECLADO4X4269:
;sistema_interactivo.mbas,211 :: 		end if'D
	GOTO       L_sistema_interactivo_TECLADO4X4243
;sistema_interactivo.mbas,212 :: 		else return
L_sistema_interactivo_TECLADO4X4242:
	RETURN
;sistema_interactivo.mbas,213 :: 		end if
L_sistema_interactivo_TECLADO4X4243:
	RETURN
; end of sistema_interactivo_TECLADO4X4

_main:

;sistema_interactivo.mbas,218 :: 		main:
;sistema_interactivo.mbas,220 :: 		OSCCON     = %01110101
	MOVLW      117
	MOVWF      OSCCON+0
;sistema_interactivo.mbas,221 :: 		OPTION_REG = %00000111
	MOVLW      7
	MOVWF      OPTION_REG+0
;sistema_interactivo.mbas,222 :: 		TRISB      = %00001111
	MOVLW      15
	MOVWF      TRISB+0
;sistema_interactivo.mbas,223 :: 		PORTB      = %00000000
	CLRF       PORTB+0
;sistema_interactivo.mbas,224 :: 		TRISC      = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;sistema_interactivo.mbas,225 :: 		PORTC      = %00000000
	CLRF       PORTC+0
;sistema_interactivo.mbas,226 :: 		ANSEL      = %00000000
	CLRF       ANSEL+0
;sistema_interactivo.mbas,227 :: 		ANSELH     = %00000000
	CLRF       ANSELH+0
;sistema_interactivo.mbas,228 :: 		WPUB       = %00001111
	MOVLW      15
	MOVWF      WPUB+0
;sistema_interactivo.mbas,229 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sistema_interactivo.mbas,230 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sistema_interactivo.mbas,232 :: 		while(1)
L__main278:
;sistema_interactivo.mbas,233 :: 		TECLADO4X4          'LEE TECLADO
	CALL       sistema_interactivo_TECLADO4X4+0
;sistema_interactivo.mbas,234 :: 		if KP<>255 then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L__main283
;sistema_interactivo.mbas,235 :: 		UART1_Write(numero2)       ' ENVIA NUMERO
	MOVF       _numero2+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema_interactivo.mbas,236 :: 		Delay_ms(200)             ' TIEMPO DE ESPERA
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main285:
	DECFSZ     R13+0, 1
	GOTO       L__main285
	DECFSZ     R12+0, 1
	GOTO       L__main285
	DECFSZ     R11+0, 1
	GOTO       L__main285
L__main283:
;sistema_interactivo.mbas,239 :: 		wend
	GOTO       L__main278
	GOTO       $+0
; end of _main
