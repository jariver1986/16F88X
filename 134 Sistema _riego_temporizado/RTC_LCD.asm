
RTC_LCD_read_ds1307:

;RTC_LCD.mbas,32 :: 		sub function read_ds1307(dim address as byte) as byte
;RTC_LCD.mbas,33 :: 		I2C1_Start() ' iniciamos la comunicacion i2c
	CALL       _I2C1_Start+0
;RTC_LCD.mbas,34 :: 		I2C1_Wr(0xd0) ' Control de formato de byte
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,35 :: 		I2C1_Wr(address) ' direccion que se va a leer en ds1307
	MOVF       FARG_read_ds1307_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,36 :: 		I2C1_Repeated_Start()
	CALL       _I2C1_Repeated_Start+0
;RTC_LCD.mbas,37 :: 		I2C1_Wr(0xd1) ' Control de formato de byte + 1bit de lectura
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,38 :: 		v_dato=I2C1_Rd(0) ' devuelve el valor buscado en ds1307
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _v_dato+0
;RTC_LCD.mbas,39 :: 		I2C1_Stop() ' finalizamos la comunicacion i2c
	CALL       _I2C1_Stop+0
;RTC_LCD.mbas,40 :: 		result = v_dato
	MOVF       _v_dato+0, 0
	MOVWF      read_ds1307_local_result+0
	MOVF       read_ds1307_local_result+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_read_ds1307

RTC_LCD_BCD2_H:

;RTC_LCD.mbas,45 :: 		dim temp as byte       ' bcd = 0x17
;RTC_LCD.mbas,46 :: 		temp = bcd >> 4        ' temp = 0x01
	MOVF       FARG_BCD2_H_bcd+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
;RTC_LCD.mbas,47 :: 		result = temp or 0x30  ' result = 0x31
	MOVLW      48
	IORWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_BCD2_H

RTC_LCD_BCD2_L:

;RTC_LCD.mbas,52 :: 		dim temp as byte       ' bcd = 0x17
;RTC_LCD.mbas,53 :: 		temp = bcd and 0x0F    ' temp = 0x07
	MOVLW      15
	ANDWF      FARG_BCD2_L_bcd+0, 0
	MOVWF      R0+0
;RTC_LCD.mbas,54 :: 		result = temp or 0x30  ' result = 0x37
	MOVLW      48
	IORWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_BCD2_L

RTC_LCD_DS1307_Write:

;RTC_LCD.mbas,59 :: 		sub procedure DS1307_Write(dim Addr, Dato as byte)
;RTC_LCD.mbas,60 :: 		I2C1_Start()  ' iniciamos la comunicacion i2c
	CALL       _I2C1_Start+0
;RTC_LCD.mbas,61 :: 		I2C1_Wr(0xd0) ' Control de formato de byte
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,62 :: 		I2C1_Wr(Addr) ' direccion que se va a leer
	MOVF       FARG_DS1307_Write_Addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,63 :: 		I2C1_Wr(Dato) ' dato que se va a escribir en el ds1307
	MOVF       FARG_DS1307_Write_Dato+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,64 :: 		I2C1_Stop()   ' finalizamos la comunicacion i2c
	CALL       _I2C1_Stop+0
	RETURN
; end of RTC_LCD_DS1307_Write

RTC_LCD_set_rtc:

;RTC_LCD.mbas,68 :: 		sub procedure set_rtc()
;RTC_LCD.mbas,69 :: 		DS1307_Write(0, $00) ' asignamos los segundos
	CLRF       FARG_DS1307_Write_Addr+0
	CLRF       FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,70 :: 		DS1307_Write(1, $16) ' asignamos los minutos
	MOVLW      1
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      22
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,71 :: 		DS1307_Write(2, $11) ' asignamos los horas
	MOVLW      2
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      17
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,72 :: 		DS1307_Write(4, $12) ' asignamos los dia
	MOVLW      4
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      18
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,73 :: 		DS1307_Write(5, $09) ' asignamos los mes
	MOVLW      5
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      9
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,74 :: 		DS1307_Write(6, $15) ' asignamos los ano
	MOVLW      6
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      21
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
	RETURN
; end of RTC_LCD_set_rtc

RTC_LCD_TECLADO4X4:

;RTC_LCD.mbas,76 :: 		sub procedure TECLADO4X4()
;RTC_LCD.mbas,77 :: 		kp = 255
	MOVLW      255
	MOVWF      _KP+0
;RTC_LCD.mbas,78 :: 		portb=%11101111        'EXPLORO FILA 1
	MOVLW      239
	MOVWF      PORTB+0
;RTC_LCD.mbas,79 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X47
;RTC_LCD.mbas,80 :: 		while(portb.0=0) wend
L_RTC_LCD_TECLADO4X410:
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X411
	GOTO       L_RTC_LCD_TECLADO4X410
L_RTC_LCD_TECLADO4X411:
;RTC_LCD.mbas,81 :: 		numero2 = 0x44   'D
	MOVLW      68
	MOVWF      _numero2+0
;RTC_LCD.mbas,82 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X47:
;RTC_LCD.mbas,85 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X415
;RTC_LCD.mbas,86 :: 		while(portb.1=0) wend
L_RTC_LCD_TECLADO4X418:
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X419
	GOTO       L_RTC_LCD_TECLADO4X418
L_RTC_LCD_TECLADO4X419:
;RTC_LCD.mbas,87 :: 		numero2 = 0x43   'C
	MOVLW      67
	MOVWF      _numero2+0
L_RTC_LCD_TECLADO4X415:
;RTC_LCD.mbas,91 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X423
;RTC_LCD.mbas,92 :: 		while(portb.2=0) wend
L_RTC_LCD_TECLADO4X426:
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X427
	GOTO       L_RTC_LCD_TECLADO4X426
L_RTC_LCD_TECLADO4X427:
;RTC_LCD.mbas,93 :: 		numero2 = 0x42   'B
	MOVLW      66
	MOVWF      _numero2+0
;RTC_LCD.mbas,94 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X423:
;RTC_LCD.mbas,97 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X431
;RTC_LCD.mbas,98 :: 		while(portb.3=0) wend
L_RTC_LCD_TECLADO4X434:
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X435
	GOTO       L_RTC_LCD_TECLADO4X434
L_RTC_LCD_TECLADO4X435:
;RTC_LCD.mbas,99 :: 		numero2 = 0x41    'A
	MOVLW      65
	MOVWF      _numero2+0
;RTC_LCD.mbas,100 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X431:
;RTC_LCD.mbas,103 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_TECLADO4X439
;RTC_LCD.mbas,104 :: 		portb=%11011111          'EXPLORO FILA 2
	MOVLW      223
	MOVWF      PORTB+0
;RTC_LCD.mbas,105 :: 		if(portb.0=0)then       'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X442
;RTC_LCD.mbas,106 :: 		while(portb.0=0) wend
L_RTC_LCD_TECLADO4X445:
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X446
	GOTO       L_RTC_LCD_TECLADO4X445
L_RTC_LCD_TECLADO4X446:
;RTC_LCD.mbas,107 :: 		numero2 = 0x23 ' #
	MOVLW      35
	MOVWF      _numero2+0
;RTC_LCD.mbas,108 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X442:
;RTC_LCD.mbas,111 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X450
;RTC_LCD.mbas,112 :: 		while(portb.1=0) wend
L_RTC_LCD_TECLADO4X453:
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X454
	GOTO       L_RTC_LCD_TECLADO4X453
L_RTC_LCD_TECLADO4X454:
;RTC_LCD.mbas,113 :: 		numero2 = 0x39 ' 9
	MOVLW      57
	MOVWF      _numero2+0
;RTC_LCD.mbas,114 :: 		KP=9
	MOVLW      9
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X450:
;RTC_LCD.mbas,116 :: 		if(portb.2=0)then     'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X458
;RTC_LCD.mbas,117 :: 		while(portb.2=0) wend
L_RTC_LCD_TECLADO4X461:
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X462
	GOTO       L_RTC_LCD_TECLADO4X461
L_RTC_LCD_TECLADO4X462:
;RTC_LCD.mbas,118 :: 		numero2 = 0x36 ' 6
	MOVLW      54
	MOVWF      _numero2+0
;RTC_LCD.mbas,119 :: 		KP=6
	MOVLW      6
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X458:
;RTC_LCD.mbas,121 :: 		if (portb.3=0)then    'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X466
;RTC_LCD.mbas,122 :: 		while(portb.3=0) wend
L_RTC_LCD_TECLADO4X469:
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X470
	GOTO       L_RTC_LCD_TECLADO4X469
L_RTC_LCD_TECLADO4X470:
;RTC_LCD.mbas,123 :: 		numero2 = 0x33 ' 3
	MOVLW      51
	MOVWF      _numero2+0
;RTC_LCD.mbas,124 :: 		KP=3
	MOVLW      3
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X466:
;RTC_LCD.mbas,125 :: 		end if'B
	GOTO       L_RTC_LCD_TECLADO4X440
;RTC_LCD.mbas,126 :: 		else return
L_RTC_LCD_TECLADO4X439:
	RETURN
;RTC_LCD.mbas,127 :: 		end if
L_RTC_LCD_TECLADO4X440:
;RTC_LCD.mbas,129 :: 		if(kp=255) then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_TECLADO4X474
;RTC_LCD.mbas,130 :: 		portb=%10111111         'EXPLORO FILA 3
	MOVLW      191
	MOVWF      PORTB+0
;RTC_LCD.mbas,131 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X477
;RTC_LCD.mbas,132 :: 		while(portb.0=0) wend
L_RTC_LCD_TECLADO4X480:
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X481
	GOTO       L_RTC_LCD_TECLADO4X480
L_RTC_LCD_TECLADO4X481:
;RTC_LCD.mbas,133 :: 		numero2 = 0x30 ' 0
	MOVLW      48
	MOVWF      _numero2+0
;RTC_LCD.mbas,134 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X477:
;RTC_LCD.mbas,137 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X485
;RTC_LCD.mbas,138 :: 		while(portb.1=0) wend
L_RTC_LCD_TECLADO4X488:
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X489
	GOTO       L_RTC_LCD_TECLADO4X488
L_RTC_LCD_TECLADO4X489:
;RTC_LCD.mbas,139 :: 		numero2 = 0x38 ' 8
	MOVLW      56
	MOVWF      _numero2+0
;RTC_LCD.mbas,140 :: 		KP=8
	MOVLW      8
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X485:
;RTC_LCD.mbas,142 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X493
;RTC_LCD.mbas,143 :: 		while(portb.2=0) wend
L_RTC_LCD_TECLADO4X496:
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X497
	GOTO       L_RTC_LCD_TECLADO4X496
L_RTC_LCD_TECLADO4X497:
;RTC_LCD.mbas,144 :: 		numero2 = 0x35 ' 5
	MOVLW      53
	MOVWF      _numero2+0
;RTC_LCD.mbas,145 :: 		KP=5
	MOVLW      5
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X493:
;RTC_LCD.mbas,148 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X4101
;RTC_LCD.mbas,149 :: 		while(portb.3=0) wend
L_RTC_LCD_TECLADO4X4104:
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X4105
	GOTO       L_RTC_LCD_TECLADO4X4104
L_RTC_LCD_TECLADO4X4105:
;RTC_LCD.mbas,150 :: 		numero2 = 0x32 ' 2
	MOVLW      50
	MOVWF      _numero2+0
;RTC_LCD.mbas,151 :: 		KP=2
	MOVLW      2
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X4101:
;RTC_LCD.mbas,152 :: 		end if'C
	GOTO       L_RTC_LCD_TECLADO4X475
;RTC_LCD.mbas,153 :: 		else return
L_RTC_LCD_TECLADO4X474:
	RETURN
;RTC_LCD.mbas,154 :: 		end if
L_RTC_LCD_TECLADO4X475:
;RTC_LCD.mbas,155 :: 		if(kp=255)then
	MOVF       _KP+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_TECLADO4X4109
;RTC_LCD.mbas,156 :: 		portb=%01111111  'EXPLORO FILA 4
	MOVLW      127
	MOVWF      PORTB+0
;RTC_LCD.mbas,157 :: 		if(portb.0=0)then      'EXPLORO COLUMNA1
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X4112
;RTC_LCD.mbas,158 :: 		while(portb.0=0) wend
L_RTC_LCD_TECLADO4X4115:
	BTFSC      PORTB+0, 0
	GOTO       L_RTC_LCD_TECLADO4X4116
	GOTO       L_RTC_LCD_TECLADO4X4115
L_RTC_LCD_TECLADO4X4116:
;RTC_LCD.mbas,159 :: 		numero2 = 0x2A ' *
	MOVLW      42
	MOVWF      _numero2+0
;RTC_LCD.mbas,160 :: 		KP=0
	CLRF       _KP+0
L_RTC_LCD_TECLADO4X4112:
;RTC_LCD.mbas,162 :: 		if(portb.1=0)then      'EXPLORO COLUMNA2
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X4120
;RTC_LCD.mbas,163 :: 		while(portb.1=0) wend
L_RTC_LCD_TECLADO4X4123:
	BTFSC      PORTB+0, 1
	GOTO       L_RTC_LCD_TECLADO4X4124
	GOTO       L_RTC_LCD_TECLADO4X4123
L_RTC_LCD_TECLADO4X4124:
;RTC_LCD.mbas,164 :: 		numero2 = 0x37 ' 7
	MOVLW      55
	MOVWF      _numero2+0
;RTC_LCD.mbas,165 :: 		KP=7
	MOVLW      7
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X4120:
;RTC_LCD.mbas,167 :: 		if(portb.2=0)then      'EXPLORO COLUMNA3
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X4128
;RTC_LCD.mbas,168 :: 		while(portb.2=0) wend
L_RTC_LCD_TECLADO4X4131:
	BTFSC      PORTB+0, 2
	GOTO       L_RTC_LCD_TECLADO4X4132
	GOTO       L_RTC_LCD_TECLADO4X4131
L_RTC_LCD_TECLADO4X4132:
;RTC_LCD.mbas,169 :: 		numero2 = 0x34 ' 4
	MOVLW      52
	MOVWF      _numero2+0
;RTC_LCD.mbas,170 :: 		KP=4
	MOVLW      4
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X4128:
;RTC_LCD.mbas,172 :: 		if (portb.3=0)then     'EXPLORO COLUMNA4
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X4136
;RTC_LCD.mbas,173 :: 		while(portb.3=0) wend
L_RTC_LCD_TECLADO4X4139:
	BTFSC      PORTB+0, 3
	GOTO       L_RTC_LCD_TECLADO4X4140
	GOTO       L_RTC_LCD_TECLADO4X4139
L_RTC_LCD_TECLADO4X4140:
;RTC_LCD.mbas,174 :: 		numero2 = 0x31 ' 1
	MOVLW      49
	MOVWF      _numero2+0
;RTC_LCD.mbas,175 :: 		KP=1
	MOVLW      1
	MOVWF      _KP+0
L_RTC_LCD_TECLADO4X4136:
;RTC_LCD.mbas,176 :: 		end if'D
	GOTO       L_RTC_LCD_TECLADO4X4110
;RTC_LCD.mbas,177 :: 		else return
L_RTC_LCD_TECLADO4X4109:
	RETURN
;RTC_LCD.mbas,178 :: 		end if
L_RTC_LCD_TECLADO4X4110:
	RETURN
; end of RTC_LCD_TECLADO4X4

RTC_LCD_INGRESA_NUMERO_HORA:

;RTC_LCD.mbas,182 :: 		sub procedure INGRESA_NUMERO_HORA()
;RTC_LCD.mbas,183 :: 		TECLADO4x4()
	CALL       RTC_LCD_TECLADO4X4+0
;RTC_LCD.mbas,184 :: 		if ((kp=0)or(kp=1)or(kp=2)or(kp=3)or(kp=4)or(kp=5)or(kp=6)or(kp=7)or(kp=8)or(kp=9)) then
	MOVF       _KP+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _KP+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      5
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      6
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      7
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      8
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      9
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_HORA145
;RTC_LCD.mbas,185 :: 		Lcd_Chr(1,I+12,NUMERICO[KP])
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      12
	ADDWF      _I+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _KP+0, 0
	ADDLW      _NUMERICO+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,186 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,187 :: 		ACUMULADO[I]=KP
	MOVF       _I+0, 0
	ADDLW      _ACUMULADO+0
	MOVWF      FSR
	MOVF       _KP+0, 0
	MOVWF      INDF+0
L_RTC_LCD_INGRESA_NUMERO_HORA145:
;RTC_LCD.mbas,189 :: 		IF (KP =  0X41) then'AND (K=I)THEN
	MOVF       _KP+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_HORA148
;RTC_LCD.mbas,190 :: 		I=1
	MOVLW      1
	MOVWF      _I+0
;RTC_LCD.mbas,191 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,192 :: 		TURNO=2
	MOVLW      2
	MOVWF      _TURNO+0
L_RTC_LCD_INGRESA_NUMERO_HORA148:
;RTC_LCD.mbas,194 :: 		IF (numero2 =  0X43) then'AND (K=I)THEN
	MOVF       _numero2+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_HORA151
;RTC_LCD.mbas,195 :: 		TURNO=2
	MOVLW      2
	MOVWF      _TURNO+0
L_RTC_LCD_INGRESA_NUMERO_HORA151:
;RTC_LCD.mbas,203 :: 		IF KP =  0X42 THEN
	MOVF       _KP+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_HORA154
;RTC_LCD.mbas,204 :: 		DEC(I)
	DECF       _I+0, 1
;RTC_LCD.mbas,205 :: 		Lcd_Chr(1,I,0x20)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVF       _I+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,206 :: 		DEC(I)
	DECF       _I+0, 1
;RTC_LCD.mbas,207 :: 		Lcd_Chr(1,I,0x20)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVF       _I+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,208 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_RTC_LCD_INGRESA_NUMERO_HORA154:
;RTC_LCD.mbas,209 :: 		END IF
	RETURN
; end of RTC_LCD_INGRESA_NUMERO_HORA

RTC_LCD_INGRESA_NUMERO_MINUTO:

;RTC_LCD.mbas,212 :: 		sub procedure INGRESA_NUMERO_MINUTO()
;RTC_LCD.mbas,213 :: 		numero2=0
	CLRF       _numero2+0
;RTC_LCD.mbas,214 :: 		TECLADO4x4()
	CALL       RTC_LCD_TECLADO4X4+0
;RTC_LCD.mbas,215 :: 		if ((kp=0)or(kp=1)or(kp=2)or(kp=3)or(kp=4)or(kp=5)or(kp=6)or(kp=7)or(kp=8)or(kp=9)) then
	MOVF       _KP+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _KP+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      5
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      6
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      7
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      8
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _KP+0, 0
	XORLW      9
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_MINUTO158
;RTC_LCD.mbas,216 :: 		Lcd_Chr(2,J+12,NUMERICO[KP])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      12
	ADDWF      _J+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _KP+0, 0
	ADDLW      _NUMERICO+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,217 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,218 :: 		ACUMULADO2[J]=KP
	MOVF       _J+0, 0
	ADDLW      _ACUMULADO2+0
	MOVWF      FSR
	MOVF       _KP+0, 0
	MOVWF      INDF+0
L_RTC_LCD_INGRESA_NUMERO_MINUTO158:
;RTC_LCD.mbas,220 :: 		IF (KP =  0X41) then'AND (K=I)THEN
	MOVF       _KP+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_MINUTO161
;RTC_LCD.mbas,221 :: 		J=1
	MOVLW      1
	MOVWF      _J+0
;RTC_LCD.mbas,222 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_RTC_LCD_INGRESA_NUMERO_MINUTO161:
;RTC_LCD.mbas,224 :: 		IF (numero2 =  0X43) then'AND (K=I)THEN
	MOVF       _numero2+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_MINUTO164
;RTC_LCD.mbas,225 :: 		TURNO=3
	MOVLW      3
	MOVWF      _TURNO+0
L_RTC_LCD_INGRESA_NUMERO_MINUTO164:
;RTC_LCD.mbas,233 :: 		IF KP =  0X42 THEN
	MOVF       _KP+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_RTC_LCD_INGRESA_NUMERO_MINUTO167
;RTC_LCD.mbas,234 :: 		DEC(J)
	DECF       _J+0, 1
;RTC_LCD.mbas,235 :: 		Lcd_Chr(1,J,0x20)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVF       _J+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,236 :: 		DEC(J)
	DECF       _J+0, 1
;RTC_LCD.mbas,237 :: 		Lcd_Chr(1,J,0x20)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVF       _J+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;RTC_LCD.mbas,238 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_RTC_LCD_INGRESA_NUMERO_MINUTO167:
;RTC_LCD.mbas,239 :: 		END IF
	RETURN
; end of RTC_LCD_INGRESA_NUMERO_MINUTO

RTC_LCD_MUEVE_CURSOR:

;RTC_LCD.mbas,242 :: 		sub procedure MUEVE_CURSOR
;RTC_LCD.mbas,244 :: 		if PORTE.RE0=0 then
	BTFSC      PORTE+0, 0
	GOTO       L_RTC_LCD_MUEVE_CURSOR171
;RTC_LCD.mbas,245 :: 		while(PORTE.RE0=0)wend
L_RTC_LCD_MUEVE_CURSOR174:
	BTFSC      PORTE+0, 0
	GOTO       L_RTC_LCD_MUEVE_CURSOR175
	GOTO       L_RTC_LCD_MUEVE_CURSOR174
L_RTC_LCD_MUEVE_CURSOR175:
;RTC_LCD.mbas,246 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,247 :: 		DEC(I)
	DECF       _I+0, 1
L_RTC_LCD_MUEVE_CURSOR171:
;RTC_LCD.mbas,249 :: 		if PORTE.RE1=0 then
	BTFSC      PORTE+0, 1
	GOTO       L_RTC_LCD_MUEVE_CURSOR179
;RTC_LCD.mbas,250 :: 		while(PORTE.RE1=0)wend
L_RTC_LCD_MUEVE_CURSOR182:
	BTFSC      PORTE+0, 1
	GOTO       L_RTC_LCD_MUEVE_CURSOR183
	GOTO       L_RTC_LCD_MUEVE_CURSOR182
L_RTC_LCD_MUEVE_CURSOR183:
;RTC_LCD.mbas,251 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT)
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,252 :: 		INC(I)
	INCF       _I+0, 1
L_RTC_LCD_MUEVE_CURSOR179:
;RTC_LCD.mbas,253 :: 		end if
	RETURN
; end of RTC_LCD_MUEVE_CURSOR

RTC_LCD_MUEVE_CURSOR2:

;RTC_LCD.mbas,256 :: 		sub procedure MUEVE_CURSOR2
;RTC_LCD.mbas,258 :: 		if PORTE.RE0=0 then
	BTFSC      PORTE+0, 0
	GOTO       L_RTC_LCD_MUEVE_CURSOR2188
;RTC_LCD.mbas,259 :: 		while(PORTE.RE0=0)wend
L_RTC_LCD_MUEVE_CURSOR2191:
	BTFSC      PORTE+0, 0
	GOTO       L_RTC_LCD_MUEVE_CURSOR2192
	GOTO       L_RTC_LCD_MUEVE_CURSOR2191
L_RTC_LCD_MUEVE_CURSOR2192:
;RTC_LCD.mbas,260 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT)
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,261 :: 		DEC(J)
	DECF       _J+0, 1
L_RTC_LCD_MUEVE_CURSOR2188:
;RTC_LCD.mbas,263 :: 		if PORTE.RE1=0 then
	BTFSC      PORTE+0, 1
	GOTO       L_RTC_LCD_MUEVE_CURSOR2196
;RTC_LCD.mbas,264 :: 		while(PORTE.RE1=0)wend
L_RTC_LCD_MUEVE_CURSOR2199:
	BTFSC      PORTE+0, 1
	GOTO       L_RTC_LCD_MUEVE_CURSOR2200
	GOTO       L_RTC_LCD_MUEVE_CURSOR2199
L_RTC_LCD_MUEVE_CURSOR2200:
;RTC_LCD.mbas,265 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT)
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,266 :: 		INC(J)
	INCF       _J+0, 1
L_RTC_LCD_MUEVE_CURSOR2196:
;RTC_LCD.mbas,267 :: 		end if
	RETURN
; end of RTC_LCD_MUEVE_CURSOR2

RTC_LCD_ACUMULA_HORA:

;RTC_LCD.mbas,270 :: 		sub procedure ACUMULA_HORA()
;RTC_LCD.mbas,272 :: 		TIEMPO = ACUMULADO[1]*10+ACUMULADO[2]
	MOVF       _ACUMULADO+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       _ACUMULADO+2, 0
	ADDWF      R0+0, 0
	MOVWF      _TIEMPO+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _TIEMPO+1
	RETURN
; end of RTC_LCD_ACUMULA_HORA

RTC_LCD_ACUMULA_MINUTO:

;RTC_LCD.mbas,276 :: 		sub procedure ACUMULA_MINUTO()
;RTC_LCD.mbas,278 :: 		TIEMPO2 = ACUMULADO2[1]*10+ACUMULADO2[2]
	MOVF       _ACUMULADO2+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       _ACUMULADO2+2, 0
	ADDWF      R0+0, 0
	MOVWF      _TIEMPO2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _TIEMPO2+1
	RETURN
; end of RTC_LCD_ACUMULA_MINUTO

_main:

;RTC_LCD.mbas,283 :: 		main:
;RTC_LCD.mbas,285 :: 		OPTION_REG = %00000111
	MOVLW      7
	MOVWF      OPTION_REG+0
;RTC_LCD.mbas,286 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;RTC_LCD.mbas,287 :: 		PORTA=0
	CLRF       PORTA+0
;RTC_LCD.mbas,288 :: 		TRISA=1
	MOVLW      1
	MOVWF      TRISA+0
;RTC_LCD.mbas,290 :: 		TRISB      = %00001111 ' PORTB.0 entrada digital
	MOVLW      15
	MOVWF      TRISB+0
;RTC_LCD.mbas,291 :: 		PORTB = 0X00
	CLRF       PORTB+0
;RTC_LCD.mbas,292 :: 		PORTD=0
	CLRF       PORTD+0
;RTC_LCD.mbas,293 :: 		TRISD=0
	CLRF       TRISD+0
;RTC_LCD.mbas,294 :: 		PORTe=0
	CLRF       PORTE+0
;RTC_LCD.mbas,295 :: 		TRISe=3
	MOVLW      3
	MOVWF      TRISE+0
;RTC_LCD.mbas,297 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;RTC_LCD.mbas,298 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;RTC_LCD.mbas,299 :: 		WPUB       = %00001111
	MOVLW      15
	MOVWF      WPUB+0
;RTC_LCD.mbas,300 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main206:
	DECFSZ     R13+0, 1
	GOTO       L__main206
	DECFSZ     R12+0, 1
	GOTO       L__main206
	DECFSZ     R11+0, 1
	GOTO       L__main206
	NOP
	NOP
;RTC_LCD.mbas,301 :: 		I2C1_Init(100000) ' Fijamos la velocidad i2c a 100khz
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;RTC_LCD.mbas,302 :: 		Lcd_Init() ' inicializamos la pantalla lcd
	CALL       _Lcd_Init+0
;RTC_LCD.mbas,303 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,304 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON)
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,305 :: 		Lcd_Out(1,6,"RIEGO") ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
;RTC_LCD.mbas,307 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main207:
	DECFSZ     R13+0, 1
	GOTO       L__main207
	DECFSZ     R12+0, 1
	GOTO       L__main207
	DECFSZ     R11+0, 1
	GOTO       L__main207
	NOP
	NOP
;RTC_LCD.mbas,308 :: 		Lcd_Out(1,1,"PROGRAMA H:") ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
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
;RTC_LCD.mbas,309 :: 		Lcd_Out(2,1,"PROGRAMA M:") ' Escribimos en la linea 1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
;RTC_LCD.mbas,310 :: 		texto_fecha = "Fecha 00/00/00 " ' formato que se va a representar en la lcd
	MOVLW      _texto_fecha+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      47
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      47
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;RTC_LCD.mbas,311 :: 		texto_hora = "Hora  00:00:00 " ' formato que se va a representar en la lcd
	MOVLW      _texto_hora+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;RTC_LCD.mbas,313 :: 		DS1307_Write(0x07,0x90) ' SQW seteada a una frecuencia de 1hz
	MOVLW      7
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      144
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,315 :: 		if EEPROM_Read(0xff) then
	MOVLW      255
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main209
;RTC_LCD.mbas,316 :: 		set_rtc() ' escribimos la hora a setear
	CALL       RTC_LCD_set_rtc+0
;RTC_LCD.mbas,317 :: 		EEPROM_Write(0xff,0x00) ' debido a se le cambia el valor de la memoria 0xff
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
L__main209:
;RTC_LCD.mbas,320 :: 		I=1
	MOVLW      1
	MOVWF      _I+0
;RTC_LCD.mbas,321 :: 		J=1
	MOVLW      1
	MOVWF      _J+0
;RTC_LCD.mbas,322 :: 		TURNO=1
	MOVLW      1
	MOVWF      _TURNO+0
;RTC_LCD.mbas,323 :: 		NUMERICO="0123456789"
	MOVLW      _NUMERICO+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      53
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;RTC_LCD.mbas,324 :: 		ACUMULADO=""
	CLRF       _ACUMULADO+0
;RTC_LCD.mbas,325 :: 		ACUMULADO2=""
	CLRF       _ACUMULADO2+0
;RTC_LCD.mbas,326 :: 		cont = 0
	CLRF       _cont+0
;RTC_LCD.mbas,328 :: 		while 1
L__main212:
;RTC_LCD.mbas,329 :: 		while TURNO=1
L__main217:
	MOVF       _TURNO+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main218
;RTC_LCD.mbas,330 :: 		INGRESA_NUMERO_HORA()
	CALL       RTC_LCD_INGRESA_NUMERO_HORA+0
;RTC_LCD.mbas,331 :: 		MUEVE_CURSOR()
	CALL       RTC_LCD_MUEVE_CURSOR+0
;RTC_LCD.mbas,332 :: 		ACUMULA_HORA
	CALL       RTC_LCD_ACUMULA_HORA+0
;RTC_LCD.mbas,333 :: 		wend
	GOTO       L__main217
L__main218:
;RTC_LCD.mbas,334 :: 		while TURNO=2
L__main222:
	MOVF       _TURNO+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main223
;RTC_LCD.mbas,335 :: 		INGRESA_NUMERO_MINUTO()
	CALL       RTC_LCD_INGRESA_NUMERO_MINUTO+0
;RTC_LCD.mbas,336 :: 		MUEVE_CURSOR2()
	CALL       RTC_LCD_MUEVE_CURSOR2+0
;RTC_LCD.mbas,337 :: 		ACUMULA_MINUTO
	CALL       RTC_LCD_ACUMULA_MINUTO+0
;RTC_LCD.mbas,338 :: 		wend
	GOTO       L__main222
L__main223:
;RTC_LCD.mbas,339 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main226:
	DECFSZ     R13+0, 1
	GOTO       L__main226
	DECFSZ     R12+0, 1
	GOTO       L__main226
	DECFSZ     R11+0, 1
	GOTO       L__main226
	NOP
;RTC_LCD.mbas,340 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,341 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,342 :: 		while TURNO=3
L__main228:
	MOVF       _TURNO+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main229
;RTC_LCD.mbas,343 :: 		Lcd_Out(1,1,"Hora        :00")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
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
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,344 :: 		Lcd_Out(2,1,"Minutos")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,345 :: 		WordToStr(TIEMPO,TEXTO)
	MOVF       _TIEMPO+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _TIEMPO+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;RTC_LCD.mbas,346 :: 		Lcd_Out(1,8,TEXTO)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,347 :: 		WordToStr(TIEMPO2,TEXTO)
	MOVF       _TIEMPO2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _TIEMPO2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;RTC_LCD.mbas,348 :: 		Lcd_Out(2,8,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,349 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main232:
	DECFSZ     R13+0, 1
	GOTO       L__main232
	DECFSZ     R12+0, 1
	GOTO       L__main232
	DECFSZ     R11+0, 1
	GOTO       L__main232
	NOP
	NOP
;RTC_LCD.mbas,350 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,351 :: 		Lcd_Out(1,1,"SISTEMA")
	MOVLW      1
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,352 :: 		Lcd_Out(2,1,"PROGRAMADO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVLW      77
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
;RTC_LCD.mbas,353 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main233:
	DECFSZ     R13+0, 1
	GOTO       L__main233
	DECFSZ     R12+0, 1
	GOTO       L__main233
	DECFSZ     R11+0, 1
	GOTO       L__main233
	NOP
	NOP
;RTC_LCD.mbas,354 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,355 :: 		inc(cont)
	INCF       _cont+0, 1
;RTC_LCD.mbas,356 :: 		if cont=2 then
	MOVF       _cont+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main235
;RTC_LCD.mbas,357 :: 		Lcd_Out(1,6,"RELOJ") ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,358 :: 		TURNO=4
	MOVLW      4
	MOVWF      _TURNO+0
;RTC_LCD.mbas,359 :: 		cont=0
	CLRF       _cont+0
L__main235:
;RTC_LCD.mbas,361 :: 		wend
	GOTO       L__main228
L__main229:
;RTC_LCD.mbas,362 :: 		while TURNO = 4
L__main238:
	MOVF       _TURNO+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main239
;RTC_LCD.mbas,363 :: 		if porta.0 = 1 then
	BTFSS      PORTA+0, 0
	GOTO       L__main243
;RTC_LCD.mbas,364 :: 		Seg  = read_ds1307(0) ' leemos los segundos
	CLRF       FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Seg+0
;RTC_LCD.mbas,365 :: 		Min  = read_ds1307(1) ' leemos los minutos
	MOVLW      1
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Min+0
;RTC_LCD.mbas,366 :: 		Hora = read_ds1307(2) ' leemos los horas
	MOVLW      2
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Hora+0
;RTC_LCD.mbas,367 :: 		Dia  = read_ds1307(4) ' leemos los dias
	MOVLW      4
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Dia+0
;RTC_LCD.mbas,368 :: 		Mes  = read_ds1307(5) ' leemos los mes
	MOVLW      5
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Mes+0
;RTC_LCD.mbas,369 :: 		Year = read_ds1307(6) ' leemos los ano
	MOVLW      6
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Year+0
L__main243:
;RTC_LCD.mbas,372 :: 		texto_fecha[6]  = BCD2_H(dia) ' tomamos la parte alta del valor dia
	MOVF       _Dia+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+6
;RTC_LCD.mbas,373 :: 		texto_fecha[7]  = BCD2_L(dia) ' tomamos la parte baja del valor dia
	MOVF       _Dia+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+7
;RTC_LCD.mbas,374 :: 		texto_fecha[8]  = "/"
	MOVLW      47
	MOVWF      _texto_fecha+8
;RTC_LCD.mbas,375 :: 		texto_fecha[9]  = BCD2_H(mes) ' tomamos la parte alta del valor mes
	MOVF       _Mes+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+9
;RTC_LCD.mbas,376 :: 		texto_fecha[10] = BCD2_L(mes) ' tomamos la parte baja del valor mes
	MOVF       _Mes+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+10
;RTC_LCD.mbas,377 :: 		texto_fecha[11] = "/"
	MOVLW      47
	MOVWF      _texto_fecha+11
;RTC_LCD.mbas,378 :: 		texto_fecha[12] = BCD2_H(year) ' tomamos la parte alta del valor ano
	MOVF       _Year+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+12
;RTC_LCD.mbas,379 :: 		texto_fecha[13] = BCD2_L(year) ' tomamos la parte baja del valor ano
	MOVF       _Year+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+13
;RTC_LCD.mbas,381 :: 		texto_hora[6] = BCD2_H(hora) ' tomamos la parte alta del valor hora
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+6
;RTC_LCD.mbas,382 :: 		texto_hora[7] = BCD2_L(hora) ' tomamos la parte baja del valor hora
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+7
;RTC_LCD.mbas,383 :: 		texto_hora[8] = ":"
	MOVLW      58
	MOVWF      _texto_hora+8
;RTC_LCD.mbas,384 :: 		texto_hora[9] = BCD2_H(min) ' tomamos la parte alta del valor min
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+9
;RTC_LCD.mbas,385 :: 		texto_hora[10] = BCD2_L(min) ' tomamos la parte baja del valor min
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+10
;RTC_LCD.mbas,386 :: 		texto_hora[11] = ":"
	MOVLW      58
	MOVWF      _texto_hora+11
;RTC_LCD.mbas,387 :: 		texto_hora[12] = BCD2_H(seg) ' tomamos la parte alta del valor seg
	MOVF       _Seg+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+12
;RTC_LCD.mbas,388 :: 		texto_hora[13] = BCD2_L(seg) ' tomamos la parte baja del valor seg
	MOVF       _Seg+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+13
;RTC_LCD.mbas,390 :: 		Lcd_Out(1,1,texto_hora) ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto_hora+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,391 :: 		Lcd_Out(2,1,texto_fecha) ' Escribimos en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto_fecha+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,392 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main245:
	DECFSZ     R13+0, 1
	GOTO       L__main245
	DECFSZ     R12+0, 1
	GOTO       L__main245
	DECFSZ     R11+0, 1
	GOTO       L__main245
	NOP
;RTC_LCD.mbas,393 :: 		if (((BCD2_H(hora))=(ACUMULADO[1]or 0x30)) and ((BCD2_L(hora))=(ACUMULADO[2]or 0x30)))AND (CONT=0)then
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVLW      48
	IORWF      _ACUMULADO+1, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
	XORWF      R1+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      FLOC__main+0
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVLW      48
	IORWF      _ACUMULADO+2, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	XORWF      R2+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       FLOC__main+0, 0
	ANDWF      R1+0, 1
	MOVF       _cont+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main247
;RTC_LCD.mbas,394 :: 		PORTD.RD0=1
	BSF        PORTD+0, 0
;RTC_LCD.mbas,395 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,396 :: 		Lcd_Out(1,1,"RIEGO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
;RTC_LCD.mbas,397 :: 		Lcd_Out(2,1,"ACTIVADO")
	MOVLW      2
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
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
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
;RTC_LCD.mbas,398 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;RTC_LCD.mbas,399 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;RTC_LCD.mbas,400 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,401 :: 		CONT=1
	MOVLW      1
	MOVWF      _cont+0
L__main247:
;RTC_LCD.mbas,403 :: 		if (((BCD2_H(min))=(ACUMULADO2[1]or 0x30)) and ((BCD2_L(min))=(ACUMULADO2[2]or 0x30))) AND (CONT=1)then
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVLW      48
	IORWF      _ACUMULADO2+1, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
	XORWF      R1+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      FLOC__main+0
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVLW      48
	IORWF      _ACUMULADO2+2, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
	XORWF      R2+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       FLOC__main+0, 0
	ANDWF      R1+0, 1
	MOVF       _cont+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main250
;RTC_LCD.mbas,404 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;RTC_LCD.mbas,405 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,406 :: 		Lcd_Out(1,1,"RIEGO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
;RTC_LCD.mbas,407 :: 		Lcd_Out(2,1,"DESACTIVADO")
	MOVLW      2
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
	MOVLW      83
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
	MOVLW      86
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
;RTC_LCD.mbas,408 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;RTC_LCD.mbas,409 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;RTC_LCD.mbas,410 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,411 :: 		CONT=2
	MOVLW      2
	MOVWF      _cont+0
L__main250:
;RTC_LCD.mbas,414 :: 		wend
	GOTO       L__main238
L__main239:
;RTC_LCD.mbas,417 :: 		wend
	GOTO       L__main212
	GOTO       $+0
; end of _main
