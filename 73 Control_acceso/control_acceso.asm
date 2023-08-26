
control_acceso_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;control_acceso.mbas,24 :: 		sub procedure interrupt
;control_acceso.mbas,28 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_control_acceso_interrupt2
;control_acceso.mbas,29 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;control_acceso.mbas,30 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;control_acceso.mbas,32 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt7
;control_acceso.mbas,33 :: 		if dato_recep = 0X02 then
	MOVF       _dato_recep+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt9
;control_acceso.mbas,34 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_control_acceso_interrupt10
;control_acceso.mbas,35 :: 		else
L_control_acceso_interrupt9:
;control_acceso.mbas,36 :: 		viajero = 0
	CLRF       _viajero+0
;control_acceso.mbas,37 :: 		end if
L_control_acceso_interrupt10:
	GOTO       L_control_acceso_interrupt4
L_control_acceso_interrupt7:
;control_acceso.mbas,38 :: 		case 1,2,3,4,5,6,7,8,9,10,11,12
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt13
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt13:
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt14
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt14:
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt15
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt15:
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt16
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt16:
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt17
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt17:
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt18
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt18:
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt19
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt19:
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt20
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt20:
	MOVF       _viajero+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt21
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt21:
	MOVF       _viajero+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt22
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt22:
	MOVF       _viajero+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt23
	GOTO       L_control_acceso_interrupt11
L_control_acceso_interrupt23:
	MOVF       _viajero+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt24
L_control_acceso_interrupt11:
;control_acceso.mbas,39 :: 		dato_rd[12-viajero] = dato_recep
	MOVF       _viajero+0, 0
	SUBLW      12
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       _dato_recep+0, 0
	MOVWF      INDF+0
;control_acceso.mbas,40 :: 		inc(viajero)
	INCF       _viajero+0, 1
	GOTO       L_control_acceso_interrupt4
L_control_acceso_interrupt24:
;control_acceso.mbas,41 :: 		case 13
	MOVF       _viajero+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt27
;control_acceso.mbas,42 :: 		if dato_recep = 0X0D then
	MOVF       _dato_recep+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt29
;control_acceso.mbas,43 :: 		viajero = 14
	MOVLW      14
	MOVWF      _viajero+0
	GOTO       L_control_acceso_interrupt30
;control_acceso.mbas,44 :: 		else
L_control_acceso_interrupt29:
;control_acceso.mbas,45 :: 		viajero = 0
	CLRF       _viajero+0
;control_acceso.mbas,46 :: 		end if
L_control_acceso_interrupt30:
	GOTO       L_control_acceso_interrupt4
L_control_acceso_interrupt27:
;control_acceso.mbas,47 :: 		case 14
	MOVF       _viajero+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt33
;control_acceso.mbas,48 :: 		if dato_recep = 0X0A then
	MOVF       _dato_recep+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt35
;control_acceso.mbas,49 :: 		viajero = 15
	MOVLW      15
	MOVWF      _viajero+0
	GOTO       L_control_acceso_interrupt36
;control_acceso.mbas,50 :: 		else
L_control_acceso_interrupt35:
;control_acceso.mbas,51 :: 		viajero = 0
	CLRF       _viajero+0
;control_acceso.mbas,52 :: 		end if
L_control_acceso_interrupt36:
	GOTO       L_control_acceso_interrupt4
L_control_acceso_interrupt33:
;control_acceso.mbas,53 :: 		case 15
	MOVF       _viajero+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt39
;control_acceso.mbas,54 :: 		if dato_recep = 0X03 then
	MOVF       _dato_recep+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_control_acceso_interrupt41
;control_acceso.mbas,55 :: 		dato_listo = 0xFF
	MOVLW      255
	MOVWF      _dato_listo+0
L_control_acceso_interrupt41:
;control_acceso.mbas,57 :: 		viajero = 0
	CLRF       _viajero+0
	GOTO       L_control_acceso_interrupt4
L_control_acceso_interrupt39:
L_control_acceso_interrupt4:
;control_acceso.mbas,58 :: 		end select
L_control_acceso_interrupt2:
;control_acceso.mbas,60 :: 		INTCON = INTCON or 0xC0
	MOVLW      192
	IORWF      INTCON+0, 1
L_control_acceso_interrupt119:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of control_acceso_interrupt

_main:

;control_acceso.mbas,62 :: 		main:
;control_acceso.mbas,63 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;control_acceso.mbas,65 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;control_acceso.mbas,66 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;control_acceso.mbas,67 :: 		INTCON = 0XC0 ' Activado interrupciones globales
	MOVLW      192
	MOVWF      INTCON+0
;control_acceso.mbas,69 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;control_acceso.mbas,70 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;control_acceso.mbas,71 :: 		TRISA =0X00
	CLRF       TRISA+0
;control_acceso.mbas,72 :: 		TRISB= 0X00
	CLRF       TRISB+0
;control_acceso.mbas,73 :: 		PORTB= 0X00
	CLRF       PORTB+0
;control_acceso.mbas,74 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;control_acceso.mbas,75 :: 		PORTC = 0x00
	CLRF       PORTC+0
;control_acceso.mbas,76 :: 		PORTE = 0x00
	CLRF       PORTE+0
;control_acceso.mbas,77 :: 		TRISE = 0x08
	MOVLW      8
	MOVWF      TRISE+0
;control_acceso.mbas,78 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;control_acceso.mbas,79 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;control_acceso.mbas,80 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_acceso.mbas,81 :: 		viajero=0
	CLRF       _viajero+0
;control_acceso.mbas,82 :: 		grabar = 0x00
	CLRF       _grabar+0
;control_acceso.mbas,83 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;control_acceso.mbas,84 :: 		dato[11] = EEPROM_Read(11)
	MOVLW      11
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+11
;control_acceso.mbas,85 :: 		delay_ms(10)
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
;control_acceso.mbas,86 :: 		dato[10] = EEPROM_Read(10)
	MOVLW      10
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+10
;control_acceso.mbas,87 :: 		delay_ms(10)
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
;control_acceso.mbas,88 :: 		dato[9] = EEPROM_Read(9)
	MOVLW      9
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+9
;control_acceso.mbas,89 :: 		delay_ms(10)
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
;control_acceso.mbas,90 :: 		dato[8] = EEPROM_Read(8)
	MOVLW      8
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+8
;control_acceso.mbas,91 :: 		delay_ms(10)
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
;control_acceso.mbas,92 :: 		dato[7] = EEPROM_Read(7)
	MOVLW      7
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+7
;control_acceso.mbas,93 :: 		delay_ms(10)
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
;control_acceso.mbas,94 :: 		dato[6] = EEPROM_Read(6)
	MOVLW      6
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+6
;control_acceso.mbas,95 :: 		delay_ms(10)
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
;control_acceso.mbas,96 :: 		dato[5] = EEPROM_Read(5)
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+5
;control_acceso.mbas,97 :: 		delay_ms(10)
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
;control_acceso.mbas,98 :: 		dato[4] = EEPROM_Read(4)
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+4
;control_acceso.mbas,99 :: 		delay_ms(10)
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
;control_acceso.mbas,100 :: 		dato[3] = EEPROM_Read(3)
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+3
;control_acceso.mbas,101 :: 		delay_ms(10)
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
;control_acceso.mbas,102 :: 		dato[2] = EEPROM_Read(2)
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+2
;control_acceso.mbas,103 :: 		delay_ms(10)
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
;control_acceso.mbas,104 :: 		dato[1] = EEPROM_Read(1)
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+1
;control_acceso.mbas,105 :: 		delay_ms(10)
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
;control_acceso.mbas,106 :: 		dato[0] = EEPROM_Read(0)
	CLRF       FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;control_acceso.mbas,107 :: 		delay_ms(10)
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
;control_acceso.mbas,109 :: 		dato1[11]=0x30
	MOVLW      48
	MOVWF      _dato1+11
;control_acceso.mbas,110 :: 		dato1[10]=0x31
	MOVLW      49
	MOVWF      _dato1+10
;control_acceso.mbas,111 :: 		dato1[9]= 0x30
	MOVLW      48
	MOVWF      _dato1+9
;control_acceso.mbas,112 :: 		dato1[8]= 0x30
	MOVLW      48
	MOVWF      _dato1+8
;control_acceso.mbas,113 :: 		dato1[7]= 0x38
	MOVLW      56
	MOVWF      _dato1+7
;control_acceso.mbas,114 :: 		dato1[6]= 0x31
	MOVLW      49
	MOVWF      _dato1+6
;control_acceso.mbas,115 :: 		dato1[5]= 0x45
	MOVLW      69
	MOVWF      _dato1+5
;control_acceso.mbas,116 :: 		dato1[4]= 0x45
	MOVLW      69
	MOVWF      _dato1+4
;control_acceso.mbas,117 :: 		dato1[3]= 0x35
	MOVLW      53
	MOVWF      _dato1+3
;control_acceso.mbas,118 :: 		dato1[2]= 0x38
	MOVLW      56
	MOVWF      _dato1+2
;control_acceso.mbas,119 :: 		dato1[1]= 0x33
	MOVLW      51
	MOVWF      _dato1+1
;control_acceso.mbas,120 :: 		dato1[0]= 0x36
	MOVLW      54
	MOVWF      _dato1+0
;control_acceso.mbas,122 :: 		dato2[11]=0x30
	MOVLW      48
	MOVWF      _dato2+11
;control_acceso.mbas,123 :: 		dato2[10]=0x31
	MOVLW      49
	MOVWF      _dato2+10
;control_acceso.mbas,124 :: 		dato2[9]= 0x30
	MOVLW      48
	MOVWF      _dato2+9
;control_acceso.mbas,125 :: 		dato2[8]= 0x30
	MOVLW      48
	MOVWF      _dato2+8
;control_acceso.mbas,126 :: 		dato2[7]= 0x38
	MOVLW      56
	MOVWF      _dato2+7
;control_acceso.mbas,127 :: 		dato2[6]= 0x31
	MOVLW      49
	MOVWF      _dato2+6
;control_acceso.mbas,128 :: 		dato2[5]= 0x45
	MOVLW      69
	MOVWF      _dato2+5
;control_acceso.mbas,129 :: 		dato2[4]= 0x42
	MOVLW      66
	MOVWF      _dato2+4
;control_acceso.mbas,130 :: 		dato2[3]= 0x37
	MOVLW      55
	MOVWF      _dato2+3
;control_acceso.mbas,131 :: 		dato2[2]= 0x45
	MOVLW      69
	MOVWF      _dato2+2
;control_acceso.mbas,132 :: 		dato2[1]= 0x31
	MOVLW      49
	MOVWF      _dato2+1
;control_acceso.mbas,133 :: 		dato2[0]= 0x35
	MOVLW      53
	MOVWF      _dato2+0
;control_acceso.mbas,134 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_acceso.mbas,135 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;control_acceso.mbas,136 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,137 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,138 :: 		Lcd_Out(1,1,"INSTITUTO")
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_acceso.mbas,139 :: 		Lcd_Out(2,1,"DUDAMERICANO")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
	MOVLW      78
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
;control_acceso.mbas,140 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main56:
	DECFSZ     R13+0, 1
	GOTO       L__main56
	DECFSZ     R12+0, 1
	GOTO       L__main56
	DECFSZ     R11+0, 1
	GOTO       L__main56
	NOP
;control_acceso.mbas,141 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,142 :: 		Lcd_Out(1,1,"PRESENTE")
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
;control_acceso.mbas,143 :: 		Lcd_Out(2,1,"IDENTIFICACION")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
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
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_acceso.mbas,145 :: 		while(1)
L__main58:
;control_acceso.mbas,146 :: 		if dato_listo = 0xFF then
	MOVF       _dato_listo+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main63
;control_acceso.mbas,147 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;control_acceso.mbas,148 :: 		if grabar then
	MOVF       _grabar+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main66
;control_acceso.mbas,149 :: 		grabar = 0x00
	CLRF       _grabar+0
;control_acceso.mbas,150 :: 		for i=0 to 11
	CLRF       _i+0
L__main69:
;control_acceso.mbas,151 :: 		dato[i] = dato_rd[i]
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
;control_acceso.mbas,152 :: 		EEPROM_Write(i,dato_rd[i])
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;control_acceso.mbas,153 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main73:
	DECFSZ     R13+0, 1
	GOTO       L__main73
	DECFSZ     R12+0, 1
	GOTO       L__main73
	NOP
;control_acceso.mbas,154 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main72
	INCF       _i+0, 1
	GOTO       L__main69
L__main72:
	GOTO       L__main67
;control_acceso.mbas,155 :: 		else
L__main66:
;control_acceso.mbas,156 :: 		veces = 0
	CLRF       _veces+0
;control_acceso.mbas,157 :: 		for i=0 to 11
	CLRF       _i+0
L__main75:
;control_acceso.mbas,158 :: 		if dato_rd[i] = dato1[i] then
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      R2+0
	MOVF       _i+0, 0
	ADDLW      _dato1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
;control_acceso.mbas,159 :: 		inc(veces)
	INCF       _veces+0, 1
L__main80:
;control_acceso.mbas,161 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main78
	INCF       _i+0, 1
	GOTO       L__main75
L__main78:
;control_acceso.mbas,162 :: 		if veces = 12 then
	MOVF       _veces+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L__main83
;control_acceso.mbas,163 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,164 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,165 :: 		Lcd_Out(2,1,"PERMITIDO")
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
;control_acceso.mbas,166 :: 		UART1_Write_Text(" Bien venido ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      118
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
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
;control_acceso.mbas,167 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main85:
	DECFSZ     R13+0, 1
	GOTO       L__main85
	DECFSZ     R12+0, 1
	GOTO       L__main85
	DECFSZ     R11+0, 1
	GOTO       L__main85
	NOP
;control_acceso.mbas,168 :: 		PORTB.RB0= 1
	BSF        PORTB+0, 0
;control_acceso.mbas,169 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main86:
	DECFSZ     R13+0, 1
	GOTO       L__main86
	DECFSZ     R12+0, 1
	GOTO       L__main86
	DECFSZ     R11+0, 1
	GOTO       L__main86
	NOP
;control_acceso.mbas,170 :: 		PORTB.RB0= 0
	BCF        PORTB+0, 0
;control_acceso.mbas,171 :: 		GOTO Main
	GOTO       _main+0
	GOTO       L__main84
;control_acceso.mbas,172 :: 		else
L__main83:
;control_acceso.mbas,173 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,174 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,175 :: 		Lcd_Out(2,1,"NEGADO")
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
;control_acceso.mbas,176 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main87:
	DECFSZ     R13+0, 1
	GOTO       L__main87
	DECFSZ     R12+0, 1
	GOTO       L__main87
	DECFSZ     R11+0, 1
	GOTO       L__main87
	NOP
;control_acceso.mbas,177 :: 		GOTO Main
	GOTO       _main+0
;control_acceso.mbas,178 :: 		end if
L__main84:
;control_acceso.mbas,179 :: 		veces = 0
	CLRF       _veces+0
;control_acceso.mbas,180 :: 		for i=0 to 11
	CLRF       _i+0
L__main89:
;control_acceso.mbas,181 :: 		if dato_rd[i] = dato2[i] then
	MOVF       _i+0, 0
	ADDLW      _dato_rd+0
	MOVWF      R2+0
	MOVF       _i+0, 0
	ADDLW      _dato2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
;control_acceso.mbas,182 :: 		inc(veces)
	INCF       _veces+0, 1
L__main94:
;control_acceso.mbas,184 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main92
	INCF       _i+0, 1
	GOTO       L__main89
L__main92:
;control_acceso.mbas,185 :: 		if veces = 12 then
	MOVF       _veces+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L__main97
;control_acceso.mbas,186 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,187 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,188 :: 		Lcd_Out(2,1,"PERMITIDO")
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
;control_acceso.mbas,189 :: 		UART1_Write_Text(" Acceso permitido")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_acceso.mbas,190 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main99:
	DECFSZ     R13+0, 1
	GOTO       L__main99
	DECFSZ     R12+0, 1
	GOTO       L__main99
	DECFSZ     R11+0, 1
	GOTO       L__main99
	NOP
;control_acceso.mbas,191 :: 		PORTB.RB0= 1
	BSF        PORTB+0, 0
;control_acceso.mbas,192 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main100:
	DECFSZ     R13+0, 1
	GOTO       L__main100
	DECFSZ     R12+0, 1
	GOTO       L__main100
	DECFSZ     R11+0, 1
	GOTO       L__main100
	NOP
;control_acceso.mbas,193 :: 		PORTB.RB0= 0
	BCF        PORTB+0, 0
;control_acceso.mbas,194 :: 		GOTO Main
	GOTO       _main+0
	GOTO       L__main98
;control_acceso.mbas,195 :: 		else
L__main97:
;control_acceso.mbas,196 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,197 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,198 :: 		Lcd_Out(2,1,"NEGADO")
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
;control_acceso.mbas,200 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main101:
	DECFSZ     R13+0, 1
	GOTO       L__main101
	DECFSZ     R12+0, 1
	GOTO       L__main101
	DECFSZ     R11+0, 1
	GOTO       L__main101
	NOP
;control_acceso.mbas,201 :: 		GOTO Main
	GOTO       _main+0
;control_acceso.mbas,202 :: 		end if
L__main98:
;control_acceso.mbas,203 :: 		veces = 0
	CLRF       _veces+0
;control_acceso.mbas,204 :: 		for i=0 to 11
	CLRF       _i+0
L__main103:
;control_acceso.mbas,205 :: 		if dato_rd[i] = dato[i] then
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
	GOTO       L__main108
;control_acceso.mbas,206 :: 		inc(veces)
	INCF       _veces+0, 1
L__main108:
;control_acceso.mbas,208 :: 		next i
	MOVF       _i+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main106
	INCF       _i+0, 1
	GOTO       L__main103
L__main106:
;control_acceso.mbas,209 :: 		if veces = 12 then
	MOVF       _veces+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L__main111
;control_acceso.mbas,210 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,211 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,212 :: 		Lcd_Out(2,1,"PERMITIDO")
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
;control_acceso.mbas,213 :: 		UART1_Write_Text(" Acceso permitido")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_acceso.mbas,214 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main113:
	DECFSZ     R13+0, 1
	GOTO       L__main113
	DECFSZ     R12+0, 1
	GOTO       L__main113
	DECFSZ     R11+0, 1
	GOTO       L__main113
	NOP
;control_acceso.mbas,215 :: 		PORTB.RB0= 1
	BSF        PORTB+0, 0
;control_acceso.mbas,216 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main114:
	DECFSZ     R13+0, 1
	GOTO       L__main114
	DECFSZ     R12+0, 1
	GOTO       L__main114
	DECFSZ     R11+0, 1
	GOTO       L__main114
	NOP
;control_acceso.mbas,217 :: 		PORTB.RB0= 0
	BCF        PORTB+0, 0
;control_acceso.mbas,218 :: 		GOTO Main
	GOTO       _main+0
	GOTO       L__main112
;control_acceso.mbas,219 :: 		else
L__main111:
;control_acceso.mbas,220 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_acceso.mbas,221 :: 		Lcd_Out(1,1,"ACCESO")
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
;control_acceso.mbas,222 :: 		Lcd_Out(2,1,"NEGADO")
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
;control_acceso.mbas,224 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main115:
	DECFSZ     R13+0, 1
	GOTO       L__main115
	DECFSZ     R12+0, 1
	GOTO       L__main115
	DECFSZ     R11+0, 1
	GOTO       L__main115
	NOP
;control_acceso.mbas,225 :: 		GOTO Main
	GOTO       _main+0
;control_acceso.mbas,226 :: 		end if
L__main112:
;control_acceso.mbas,227 :: 		end if
L__main67:
L__main63:
;control_acceso.mbas,229 :: 		if porte.3=0 then
	BTFSC      PORTE+0, 3
	GOTO       L__main117
;control_acceso.mbas,230 :: 		grabar = 0xFF
	MOVLW      255
	MOVWF      _grabar+0
L__main117:
;control_acceso.mbas,232 :: 		wend
	GOTO       L__main58
	GOTO       $+0
; end of _main
