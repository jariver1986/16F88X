
contador_cajas_banano_ultrasonico1:

;contador_cajas_banano.mbas,22 :: 		dim distan,tiempo as word
;contador_cajas_banano.mbas,23 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;contador_cajas_banano.mbas,25 :: 		PORTB.RB0 = 1
	BSF        PORTB+0, 0
;contador_cajas_banano.mbas,26 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_contador_cajas_banano_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_contador_cajas_banano_ultrasonico11
	NOP
;contador_cajas_banano.mbas,27 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;contador_cajas_banano.mbas,29 :: 		DO
L_contador_cajas_banano_ultrasonico12:
;contador_cajas_banano.mbas,30 :: 		IF( PORTB.RB1 = 1 )THEN
	BTFSS      PORTB+0, 1
	GOTO       L_contador_cajas_banano_ultrasonico18
;contador_cajas_banano.mbas,31 :: 		TMR0 = 0
	CLRF       TMR0+0
;contador_cajas_banano.mbas,32 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_contador_cajas_banano_ultrasonico18:
;contador_cajas_banano.mbas,34 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_contador_cajas_banano_ultrasonico15
	GOTO       L_contador_cajas_banano_ultrasonico12
L_contador_cajas_banano_ultrasonico15:
;contador_cajas_banano.mbas,36 :: 		DO
L_contador_cajas_banano_ultrasonico110:
;contador_cajas_banano.mbas,37 :: 		IF( PORTB.RB1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_contador_cajas_banano_ultrasonico116
;contador_cajas_banano.mbas,38 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;contador_cajas_banano.mbas,39 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_contador_cajas_banano_ultrasonico116:
;contador_cajas_banano.mbas,41 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_contador_cajas_banano_ultrasonico119
;contador_cajas_banano.mbas,42 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_contador_cajas_banano_ultrasonico119:
;contador_cajas_banano.mbas,44 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_contador_cajas_banano_ultrasonico113
	GOTO       L_contador_cajas_banano_ultrasonico110
L_contador_cajas_banano_ultrasonico113:
;contador_cajas_banano.mbas,46 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_contador_cajas_banano_ultrasonico152:
	BTFSC      STATUS+0, 2
	GOTO       L_contador_cajas_banano_ultrasonico153
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_contador_cajas_banano_ultrasonico152
L_contador_cajas_banano_ultrasonico153:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;contador_cajas_banano.mbas,47 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_contador_cajas_banano_ultrasonico121:
	DECFSZ     R13+0, 1
	GOTO       L_contador_cajas_banano_ultrasonico121
	DECFSZ     R12+0, 1
	GOTO       L_contador_cajas_banano_ultrasonico121
	NOP
;contador_cajas_banano.mbas,48 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of contador_cajas_banano_ultrasonico1

_main:

;contador_cajas_banano.mbas,50 :: 		main:
;contador_cajas_banano.mbas,51 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;contador_cajas_banano.mbas,52 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;contador_cajas_banano.mbas,53 :: 		PORTA  =  0
	CLRF       PORTA+0
;contador_cajas_banano.mbas,54 :: 		TRISA  =  0
	CLRF       TRISA+0
;contador_cajas_banano.mbas,55 :: 		PORTB  =  0
	CLRF       PORTB+0
;contador_cajas_banano.mbas,56 :: 		TRISB  =  %00000010
	MOVLW      2
	MOVWF      TRISB+0
;contador_cajas_banano.mbas,57 :: 		PORTC  =  0
	CLRF       PORTC+0
;contador_cajas_banano.mbas,58 :: 		TRISC  =  %10000000
	MOVLW      128
	MOVWF      TRISC+0
;contador_cajas_banano.mbas,59 :: 		ANSEL =0
	CLRF       ANSEL+0
;contador_cajas_banano.mbas,60 :: 		ANSELH = 0
	CLRF       ANSELH+0
;contador_cajas_banano.mbas,61 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;contador_cajas_banano.mbas,62 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;contador_cajas_banano.mbas,63 :: 		Lcd_Cmd(_lcd_clear)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_cajas_banano.mbas,64 :: 		TURNO=0
	CLRF       _TURNO+0
;contador_cajas_banano.mbas,65 :: 		contador =0
	CLRF       _contador+0
	CLRF       _contador+1
;contador_cajas_banano.mbas,66 :: 		limite=0
	CLRF       _LIMITE+0
	CLRF       _LIMITE+1
;contador_cajas_banano.mbas,67 :: 		Lcd_Out(1,1,"TECSU")
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
;contador_cajas_banano.mbas,68 :: 		Lcd_Out(2,1,"PROYECTO")
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
	MOVLW      89
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
;contador_cajas_banano.mbas,69 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;contador_cajas_banano.mbas,70 :: 		Lcd_Cmd(_lcd_clear)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_cajas_banano.mbas,71 :: 		Lcd_Out(1,1,"POR:")
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_cajas_banano.mbas,72 :: 		Lcd_Out(2,1,"MARIO VEAS")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_cajas_banano.mbas,73 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;contador_cajas_banano.mbas,74 :: 		Lcd_Cmd(_lcd_clear)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_cajas_banano.mbas,75 :: 		Lcd_Out(1,1,"ULTIMO DATO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;contador_cajas_banano.mbas,76 :: 		DATO = EEPROM_Read(28)
	MOVLW      28
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
;contador_cajas_banano.mbas,77 :: 		Delay_ms(5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L__main23:
	DECFSZ     R13+0, 1
	GOTO       L__main23
	DECFSZ     R12+0, 1
	GOTO       L__main23
;contador_cajas_banano.mbas,78 :: 		ByteToStr(dato,texto)
	MOVF       _DATO+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;contador_cajas_banano.mbas,79 :: 		Lcd_Out(2,1,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_cajas_banano.mbas,80 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;contador_cajas_banano.mbas,81 :: 		Lcd_Cmd(_lcd_clear)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_cajas_banano.mbas,82 :: 		WHILE (1)
L__main25:
;contador_cajas_banano.mbas,84 :: 		distancia1 = ultrasonico1()
	CALL       contador_cajas_banano_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;contador_cajas_banano.mbas,85 :: 		if DISTANCIA1 <30 then
	MOVLW      0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      30
	SUBWF      R0+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L__main30
;contador_cajas_banano.mbas,86 :: 		while(DISTANCIA1 <50)
L__main33:
	MOVLW      0
	SUBWF      _DISTANCIA1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      50
	SUBWF      _DISTANCIA1+0, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L__main34
;contador_cajas_banano.mbas,87 :: 		distancia1 = ultrasonico1()
	CALL       contador_cajas_banano_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;contador_cajas_banano.mbas,88 :: 		wend
	GOTO       L__main33
L__main34:
;contador_cajas_banano.mbas,89 :: 		portc.rc3=1
	BSF        PORTC+0, 3
;contador_cajas_banano.mbas,90 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main37:
	DECFSZ     R13+0, 1
	GOTO       L__main37
	DECFSZ     R12+0, 1
	GOTO       L__main37
	DECFSZ     R11+0, 1
	GOTO       L__main37
	NOP
;contador_cajas_banano.mbas,91 :: 		portc.rc3=0
	BCF        PORTC+0, 3
;contador_cajas_banano.mbas,92 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main38:
	DECFSZ     R13+0, 1
	GOTO       L__main38
	DECFSZ     R12+0, 1
	GOTO       L__main38
	DECFSZ     R11+0, 1
	GOTO       L__main38
	NOP
;contador_cajas_banano.mbas,93 :: 		contador = contador + 1
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;contador_cajas_banano.mbas,94 :: 		Lcd_Cmd(_lcd_clear)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_cajas_banano.mbas,95 :: 		EEPROM_Write(28,CONTADOR)
	MOVLW      28
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _contador+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_cajas_banano.mbas,96 :: 		Delay_ms(5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L__main39:
	DECFSZ     R13+0, 1
	GOTO       L__main39
	DECFSZ     R12+0, 1
	GOTO       L__main39
;contador_cajas_banano.mbas,97 :: 		Lcd_Out(1,1,"CONTADOR = ")
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
;contador_cajas_banano.mbas,98 :: 		ByteToStr(contador,texto)
	MOVF       _contador+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;contador_cajas_banano.mbas,99 :: 		Lcd_Out(2,1,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main30:
;contador_cajas_banano.mbas,102 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main41
;contador_cajas_banano.mbas,103 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main41:
;contador_cajas_banano.mbas,105 :: 		if DATO = "L" then                  'LEE EL DATO DE LA MEMORIA
	MOVF       _DATO+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__main44
;contador_cajas_banano.mbas,106 :: 		DATO = EEPROM_Read(28)
	MOVLW      28
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
;contador_cajas_banano.mbas,107 :: 		Delay_ms(5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
;contador_cajas_banano.mbas,108 :: 		ByteToStr(dato,texto)
	MOVF       _DATO+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;contador_cajas_banano.mbas,109 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _TEXTO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;contador_cajas_banano.mbas,110 :: 		DATO=0
	CLRF       _DATO+0
;contador_cajas_banano.mbas,111 :: 		TEXTO=0
	MOVLW      0
	MOVWF      _TEXTO+0
L__main44:
;contador_cajas_banano.mbas,113 :: 		if DATO = "B" then                    'BORRA EL DATO DE LA MEMORIA
	MOVF       _DATO+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main48
;contador_cajas_banano.mbas,114 :: 		EEPROM_Write(28,0)
	MOVLW      28
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_cajas_banano.mbas,115 :: 		Delay_ms(5)
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
L__main48:
;contador_cajas_banano.mbas,117 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	DECFSZ     R11+0, 1
	GOTO       L__main51
	NOP
;contador_cajas_banano.mbas,118 :: 		WEND
	GOTO       L__main25
	GOTO       $+0
; end of _main
