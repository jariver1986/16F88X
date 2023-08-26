
ID_20_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ID_20.mbas,11 :: 		sub procedure interrupt
;ID_20.mbas,15 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_ID_20_interrupt2
;ID_20.mbas,16 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;ID_20.mbas,17 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;ID_20.mbas,19 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt7
;ID_20.mbas,20 :: 		if dato_recep = 0X02 then
	MOVF       _dato_recep+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt9
;ID_20.mbas,21 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_ID_20_interrupt10
;ID_20.mbas,22 :: 		else
L_ID_20_interrupt9:
;ID_20.mbas,23 :: 		viajero = 0
	CLRF       _viajero+0
;ID_20.mbas,24 :: 		end if
L_ID_20_interrupt10:
	GOTO       L_ID_20_interrupt4
L_ID_20_interrupt7:
;ID_20.mbas,25 :: 		case 1,2,3,4,5,6,7,8,9,10,11,12
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt13
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt13:
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt14
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt14:
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt15
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt15:
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt16
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt16:
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt17
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt17:
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt18
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt18:
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt19
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt19:
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt20
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt20:
	MOVF       _viajero+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt21
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt21:
	MOVF       _viajero+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt22
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt22:
	MOVF       _viajero+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt23
	GOTO       L_ID_20_interrupt11
L_ID_20_interrupt23:
	MOVF       _viajero+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt24
L_ID_20_interrupt11:
;ID_20.mbas,26 :: 		dato_rd[12-viajero] = dato_recep
	MOVF       _viajero+0, 0
	SUBLW      12
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       _dato_recep+0, 0
	MOVWF      INDF+0
;ID_20.mbas,27 :: 		inc(viajero)
	INCF       _viajero+0, 1
	GOTO       L_ID_20_interrupt4
L_ID_20_interrupt24:
;ID_20.mbas,28 :: 		case 13
	MOVF       _viajero+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt27
;ID_20.mbas,29 :: 		if dato_recep = 0X0D then
	MOVF       _dato_recep+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt29
;ID_20.mbas,30 :: 		viajero = 14
	MOVLW      14
	MOVWF      _viajero+0
	GOTO       L_ID_20_interrupt30
;ID_20.mbas,31 :: 		else
L_ID_20_interrupt29:
;ID_20.mbas,32 :: 		viajero = 0
	CLRF       _viajero+0
;ID_20.mbas,33 :: 		end if
L_ID_20_interrupt30:
	GOTO       L_ID_20_interrupt4
L_ID_20_interrupt27:
;ID_20.mbas,34 :: 		case 14
	MOVF       _viajero+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt33
;ID_20.mbas,35 :: 		if dato_recep = 0X0A then
	MOVF       _dato_recep+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt35
;ID_20.mbas,36 :: 		viajero = 15
	MOVLW      15
	MOVWF      _viajero+0
	GOTO       L_ID_20_interrupt36
;ID_20.mbas,37 :: 		else
L_ID_20_interrupt35:
;ID_20.mbas,38 :: 		viajero = 0
	CLRF       _viajero+0
;ID_20.mbas,39 :: 		end if
L_ID_20_interrupt36:
	GOTO       L_ID_20_interrupt4
L_ID_20_interrupt33:
;ID_20.mbas,40 :: 		case 15
	MOVF       _viajero+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt39
;ID_20.mbas,41 :: 		if dato_recep = 0X03 then
	MOVF       _dato_recep+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_ID_20_interrupt41
;ID_20.mbas,42 :: 		dato_listo = 0xFF
	MOVLW      255
	MOVWF      _dato_listo+0
L_ID_20_interrupt41:
;ID_20.mbas,44 :: 		viajero = 0
	CLRF       _viajero+0
	GOTO       L_ID_20_interrupt4
L_ID_20_interrupt39:
L_ID_20_interrupt4:
;ID_20.mbas,45 :: 		end select
L_ID_20_interrupt2:
;ID_20.mbas,47 :: 		INTCON = INTCON or 0xC0
	MOVLW      192
	IORWF      INTCON+0, 1
L_ID_20_interrupt88:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of ID_20_interrupt

_main:

;ID_20.mbas,49 :: 		main:
;ID_20.mbas,50 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;ID_20.mbas,52 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;ID_20.mbas,53 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;ID_20.mbas,54 :: 		INTCON = 0XC0 ' Activado interrupciones globales
	MOVLW      192
	MOVWF      INTCON+0
;ID_20.mbas,56 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;ID_20.mbas,57 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;ID_20.mbas,59 :: 		TRISA =0X00
	CLRF       TRISA+0
;ID_20.mbas,60 :: 		TRISB= 0X00
	CLRF       TRISB+0
;ID_20.mbas,62 :: 		PORTB= 0X00
	CLRF       PORTB+0
;ID_20.mbas,63 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;ID_20.mbas,64 :: 		PORTC = 0x00
	CLRF       PORTC+0
;ID_20.mbas,66 :: 		PORTE = 0x08
	MOVLW      8
	MOVWF      PORTE+0
;ID_20.mbas,68 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;ID_20.mbas,69 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;ID_20.mbas,71 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ID_20.mbas,73 :: 		viajero=0
	CLRF       _viajero+0
;ID_20.mbas,74 :: 		grabar = 0x00
	CLRF       _grabar+0
;ID_20.mbas,75 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;ID_20.mbas,90 :: 		dato[11] = EEPROM_Read(11)
	MOVLW      11
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+11
;ID_20.mbas,91 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	NOP
;ID_20.mbas,92 :: 		dato[10] = EEPROM_Read(10)
	MOVLW      10
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+10
;ID_20.mbas,93 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	NOP
;ID_20.mbas,94 :: 		dato[9] = EEPROM_Read(9)
	MOVLW      9
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+9
;ID_20.mbas,95 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	NOP
;ID_20.mbas,96 :: 		dato[8] = EEPROM_Read(8)
	MOVLW      8
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+8
;ID_20.mbas,97 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	NOP
;ID_20.mbas,98 :: 		dato[7] = EEPROM_Read(7)
	MOVLW      7
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+7
;ID_20.mbas,99 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, 1
	GOTO       L__main48
	DECFSZ     R12+0, 1
	GOTO       L__main48
	NOP
;ID_20.mbas,100 :: 		dato[6] = EEPROM_Read(6)
	MOVLW      6
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+6
;ID_20.mbas,101 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main49:
	DECFSZ     R13+0, 1
	GOTO       L__main49
	DECFSZ     R12+0, 1
	GOTO       L__main49
	NOP
;ID_20.mbas,102 :: 		dato[5] = EEPROM_Read(5)
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+5
;ID_20.mbas,103 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	NOP
;ID_20.mbas,104 :: 		dato[4] = EEPROM_Read(4)
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+4
;ID_20.mbas,105 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	NOP
;ID_20.mbas,106 :: 		dato[3] = EEPROM_Read(3)
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+3
;ID_20.mbas,107 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main52:
	DECFSZ     R13+0, 1
	GOTO       L__main52
	DECFSZ     R12+0, 1
	GOTO       L__main52
	NOP
;ID_20.mbas,108 :: 		dato[2] = EEPROM_Read(2)
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+2
;ID_20.mbas,109 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main53:
	DECFSZ     R13+0, 1
	GOTO       L__main53
	DECFSZ     R12+0, 1
	GOTO       L__main53
	NOP
;ID_20.mbas,110 :: 		dato[1] = EEPROM_Read(1)
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+1
;ID_20.mbas,111 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main54:
	DECFSZ     R13+0, 1
	GOTO       L__main54
	DECFSZ     R12+0, 1
	GOTO       L__main54
	NOP
;ID_20.mbas,112 :: 		dato[0] = EEPROM_Read(0)
	CLRF       FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;ID_20.mbas,113 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main55:
	DECFSZ     R13+0, 1
	GOTO       L__main55
	DECFSZ     R12+0, 1
	GOTO       L__main55
	NOP
;ID_20.mbas,116 :: 		while(1)
L__main57:
;ID_20.mbas,117 :: 		if dato_listo = 0xFF then
	MOVF       _dato_listo+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main62
;ID_20.mbas,118 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;ID_20.mbas,119 :: 		if grabar then
	MOVF       _grabar+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main65
;ID_20.mbas,120 :: 		grabar = 0x00
	CLRF       _grabar+0
;ID_20.mbas,121 :: 		for i=0 to 11
	CLRF       _i+0
L__main68:
;ID_20.mbas,122 :: 		dato[i] = dato_rd[i]
	MOVF       _i+0, 0
	ADDLW      _dato+0
	MOVWF      R1+0
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;ID_20.mbas,123 :: 		EEPROM_Write(i,dato_rd[i])
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;ID_20.mbas,124 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main72:
	DECFSZ     R13+0, 1
	GOTO       L__main72
	DECFSZ     R12+0, 1
	GOTO       L__main72
	NOP
;ID_20.mbas,125 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main71
	INCF       _i+0, 1
	GOTO       L__main68
L__main71:
	GOTO       L__main66
;ID_20.mbas,126 :: 		else
L__main65:
;ID_20.mbas,127 :: 		veces = 0
	CLRF       _veces+0
;ID_20.mbas,128 :: 		for i=0 to 11
	CLRF       _i+0
L__main74:
;ID_20.mbas,129 :: 		if dato_rd[i] = dato[i] then
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      R2+0
	MOVF       _i+0, 0
	ADDLW      _dato+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
;ID_20.mbas,130 :: 		inc(veces)
	INCF       _veces+0, 1
L__main79:
;ID_20.mbas,132 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main77
	INCF       _i+0, 1
	GOTO       L__main74
L__main77:
;ID_20.mbas,133 :: 		if veces = 12 then
	MOVF       _veces+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L__main82
;ID_20.mbas,134 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;ID_20.mbas,135 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main84:
	DECFSZ     R13+0, 1
	GOTO       L__main84
	DECFSZ     R12+0, 1
	GOTO       L__main84
	DECFSZ     R11+0, 1
	GOTO       L__main84
	NOP
	NOP
;ID_20.mbas,136 :: 		PORTB=0X00
	CLRF       PORTB+0
L__main82:
;ID_20.mbas,138 :: 		end if
L__main66:
L__main62:
;ID_20.mbas,140 :: 		if porte.3=0 then
	BTFSC      PORTE+0, 3
	GOTO       L__main86
;ID_20.mbas,141 :: 		grabar = 0xFF
	MOVLW      255
	MOVWF      _grabar+0
L__main86:
;ID_20.mbas,143 :: 		wend
	GOTO       L__main57
	GOTO       $+0
; end of _main
