
contador_personal_ultrasonico1:

;contador_personal.mbas,36 :: 		dim distan,tiempo as word
;contador_personal.mbas,37 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;contador_personal.mbas,39 :: 		disparo1 = 1
	BSF        PORTC+0, 3
;contador_personal.mbas,40 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_contador_personal_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_contador_personal_ultrasonico11
	NOP
;contador_personal.mbas,41 :: 		disparo1 = 0
	BCF        PORTC+0, 3
;contador_personal.mbas,43 :: 		DO
L_contador_personal_ultrasonico12:
;contador_personal.mbas,44 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTC+0, 0
	GOTO       L_contador_personal_ultrasonico18
;contador_personal.mbas,45 :: 		TMR0 = 0
	CLRF       TMR0+0
;contador_personal.mbas,46 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_contador_personal_ultrasonico18:
;contador_personal.mbas,48 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico15
	GOTO       L_contador_personal_ultrasonico12
L_contador_personal_ultrasonico15:
;contador_personal.mbas,50 :: 		DO
L_contador_personal_ultrasonico110:
;contador_personal.mbas,51 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTC+0, 0
	GOTO       L_contador_personal_ultrasonico116
;contador_personal.mbas,52 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;contador_personal.mbas,53 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_contador_personal_ultrasonico116:
;contador_personal.mbas,55 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_contador_personal_ultrasonico119
;contador_personal.mbas,56 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_contador_personal_ultrasonico119:
;contador_personal.mbas,58 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico113
	GOTO       L_contador_personal_ultrasonico110
L_contador_personal_ultrasonico113:
;contador_personal.mbas,60 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_contador_personal_ultrasonico184:
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico185
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_contador_personal_ultrasonico184
L_contador_personal_ultrasonico185:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;contador_personal.mbas,61 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_contador_personal_ultrasonico121:
	DECFSZ     R13+0, 1
	GOTO       L_contador_personal_ultrasonico121
	DECFSZ     R12+0, 1
	GOTO       L_contador_personal_ultrasonico121
	NOP
;contador_personal.mbas,62 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of contador_personal_ultrasonico1

contador_personal_ultrasonico2:

;contador_personal.mbas,67 :: 		dim distan,tiempo as word
;contador_personal.mbas,69 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
;contador_personal.mbas,71 :: 		disparo2 = 1
	BSF        PORTA+0, 0
;contador_personal.mbas,72 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_contador_personal_ultrasonico223:
	DECFSZ     R13+0, 1
	GOTO       L_contador_personal_ultrasonico223
	NOP
;contador_personal.mbas,73 :: 		disparo2 = 0
	BCF        PORTA+0, 0
;contador_personal.mbas,75 :: 		DO
L_contador_personal_ultrasonico224:
;contador_personal.mbas,76 :: 		IF( eco2 = 1 )THEN
	BTFSS      PORTA+0, 1
	GOTO       L_contador_personal_ultrasonico230
;contador_personal.mbas,77 :: 		TMR0 = 0
	CLRF       TMR0+0
;contador_personal.mbas,78 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico2_flanco+0
L_contador_personal_ultrasonico230:
;contador_personal.mbas,80 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico227
	GOTO       L_contador_personal_ultrasonico224
L_contador_personal_ultrasonico227:
;contador_personal.mbas,82 :: 		DO
L_contador_personal_ultrasonico232:
;contador_personal.mbas,83 :: 		IF( eco2 = 0 )THEN
	BTFSC      PORTA+0, 1
	GOTO       L_contador_personal_ultrasonico238
;contador_personal.mbas,84 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico2_tiempo+0
	CLRF       ultrasonico2_tiempo+1
;contador_personal.mbas,85 :: 		flanco = 0
	CLRF       ultrasonico2_flanco+0
L_contador_personal_ultrasonico238:
;contador_personal.mbas,87 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_contador_personal_ultrasonico241
;contador_personal.mbas,88 :: 		FLANCO=0
	CLRF       ultrasonico2_flanco+0
L_contador_personal_ultrasonico241:
;contador_personal.mbas,90 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico2_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico235
	GOTO       L_contador_personal_ultrasonico232
L_contador_personal_ultrasonico235:
;contador_personal.mbas,92 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico2_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_contador_personal_ultrasonico286:
	BTFSC      STATUS+0, 2
	GOTO       L_contador_personal_ultrasonico287
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_contador_personal_ultrasonico286
L_contador_personal_ultrasonico287:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico2_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico2_distan+1
;contador_personal.mbas,93 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_contador_personal_ultrasonico243:
	DECFSZ     R13+0, 1
	GOTO       L_contador_personal_ultrasonico243
	DECFSZ     R12+0, 1
	GOTO       L_contador_personal_ultrasonico243
	NOP
;contador_personal.mbas,94 :: 		result = distan
	MOVF       ultrasonico2_distan+0, 0
	MOVWF      ultrasonico2_local_result+0
	MOVF       ultrasonico2_distan+1, 0
	MOVWF      ultrasonico2_local_result+1
	MOVF       ultrasonico2_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico2_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of contador_personal_ultrasonico2

_main:

;contador_personal.mbas,97 :: 		main:
;contador_personal.mbas,98 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;contador_personal.mbas,100 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;contador_personal.mbas,102 :: 		TRISA = %10000010
	MOVLW      130
	MOVWF      TRISA+0
;contador_personal.mbas,103 :: 		PORTA = %00000000
	CLRF       PORTA+0
;contador_personal.mbas,106 :: 		TRISB = %10000000  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	MOVLW      128
	MOVWF      TRISB+0
;contador_personal.mbas,107 :: 		PORTB = %00000000
	CLRF       PORTB+0
;contador_personal.mbas,110 :: 		TRISC = %10010001
	MOVLW      145
	MOVWF      TRISC+0
;contador_personal.mbas,111 :: 		PORTC = %00000000
	CLRF       PORTC+0
;contador_personal.mbas,114 :: 		TRISE = %00001000
	MOVLW      8
	MOVWF      TRISE+0
;contador_personal.mbas,115 :: 		PORTE = %00000000
	CLRF       PORTE+0
;contador_personal.mbas,118 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;contador_personal.mbas,119 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;contador_personal.mbas,122 :: 		WPUB=0X80
	MOVLW      128
	MOVWF      WPUB+0
;contador_personal.mbas,123 :: 		dato=0
	CLRF       _dato+0
;contador_personal.mbas,124 :: 		dato_recep=0
	CLRF       _dato_recep+0
;contador_personal.mbas,125 :: 		centinela1=0
	CLRF       _centinela1+0
;contador_personal.mbas,126 :: 		centinela2=0
	CLRF       _centinela2+0
;contador_personal.mbas,127 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;contador_personal.mbas,128 :: 		CONTADOR2=0
	CLRF       _CONTADOR2+0
	CLRF       _CONTADOR2+1
;contador_personal.mbas,129 :: 		personal= EEPROM_Read($30)
	MOVLW      48
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _personal+0
;contador_personal.mbas,130 :: 		CONTADOR2=EEPROM_Read($10)
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _CONTADOR2+0
	CLRF       _CONTADOR2+1
;contador_personal.mbas,131 :: 		CONTADOR3=EEPROM_Read($20)
	MOVLW      32
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _CONTADOR3+0
	CLRF       _CONTADOR3+1
;contador_personal.mbas,132 :: 		CONTADOR4=EEPROM_Read($40)
	MOVLW      64
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _CONTADOR4+0
	CLRF       _CONTADOR4+1
;contador_personal.mbas,133 :: 		CONTADOR5=EEPROM_Read($50)
	MOVLW      80
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _CONTADOR5+0
	CLRF       _CONTADOR5+1
;contador_personal.mbas,134 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	NOP
;contador_personal.mbas,135 :: 		Lcd_Init() ' inicializamos la lcd
	CALL       _Lcd_Init+0
;contador_personal.mbas,136 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_personal.mbas,137 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_personal.mbas,138 :: 		Lcd_Out(1, 1, "IDEAS&TECNOLOGIA") ' lo que se va a mostrar en la linea 1
	MOVLW      1
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      38
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
;contador_personal.mbas,139 :: 		Lcd_Out(2, 1, "SALUDOS") ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,140 :: 		delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	DECFSZ     R11+0, 1
	GOTO       L__main46
	NOP
	NOP
;contador_personal.mbas,141 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_personal.mbas,142 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_personal.mbas,143 :: 		Lcd_Out(1, 1, "NUMERO PERSONAL:") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
;contador_personal.mbas,144 :: 		distancia1= ultrasonico1()
	CALL       contador_personal_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;contador_personal.mbas,145 :: 		turno=0
	BCF        _turno+0, BitPos(_turno+0)
;contador_personal.mbas,147 :: 		WHILE(1)
L__main48:
;contador_personal.mbas,149 :: 		distancia1= ultrasonico1()
	CALL       contador_personal_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;contador_personal.mbas,151 :: 		if distancia1<30 then
	MOVLW      0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      30
	SUBWF      R0+0, 0
L__main88:
	BTFSC      STATUS+0, 0
	GOTO       L__main53
;contador_personal.mbas,152 :: 		while(distancia1<30)
L__main56:
	MOVLW      0
	SUBWF      _distancia1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      30
	SUBWF      _distancia1+0, 0
L__main89:
	BTFSC      STATUS+0, 0
	GOTO       L__main57
;contador_personal.mbas,153 :: 		distancia1= ultrasonico1()
	CALL       contador_personal_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;contador_personal.mbas,154 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;contador_personal.mbas,155 :: 		wend
	GOTO       L__main56
L__main57:
;contador_personal.mbas,156 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main60:
	DECFSZ     R13+0, 1
	GOTO       L__main60
	DECFSZ     R12+0, 1
	GOTO       L__main60
	DECFSZ     R11+0, 1
	GOTO       L__main60
	NOP
	NOP
;contador_personal.mbas,157 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;contador_personal.mbas,158 :: 		INC(CONTADOR)
	INCF       _CONTADOR+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR+1, 1
;contador_personal.mbas,159 :: 		INC(personal)
	INCF       _personal+0, 1
L__main53:
;contador_personal.mbas,162 :: 		if (CONTADOR>0)AND(CONTADOR<=255) then
	MOVF       _CONTADOR+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVF       _CONTADOR+0, 0
	SUBLW      0
L__main90:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVF       _CONTADOR+0, 0
	SUBLW      255
L__main91:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main62
;contador_personal.mbas,163 :: 		EEPROM_Write(0X10,personal+CONTADOR2)
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _CONTADOR2+0, 0
	ADDWF      _personal+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,164 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main64:
	DECFSZ     R13+0, 1
	GOTO       L__main64
	DECFSZ     R12+0, 1
	GOTO       L__main64
	NOP
L__main62:
;contador_personal.mbas,167 :: 		if (CONTADOR>255)AND(CONTADOR<=510) then
	MOVF       _CONTADOR+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVF       _CONTADOR+0, 0
	SUBLW      255
L__main92:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVF       _CONTADOR+0, 0
	SUBLW      254
L__main93:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main66
;contador_personal.mbas,168 :: 		EEPROM_Write(0X20,personal+CONTADOR3)
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _CONTADOR3+0, 0
	ADDWF      _personal+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,169 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main68:
	DECFSZ     R13+0, 1
	GOTO       L__main68
	DECFSZ     R12+0, 1
	GOTO       L__main68
	NOP
L__main66:
;contador_personal.mbas,171 :: 		if (CONTADOR>510)AND(CONTADOR<=765) then
	MOVF       _CONTADOR+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVF       _CONTADOR+0, 0
	SUBLW      254
L__main94:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVF       _CONTADOR+0, 0
	SUBLW      253
L__main95:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main70
;contador_personal.mbas,172 :: 		EEPROM_Write(0X40,personal+CONTADOR4)
	MOVLW      64
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _CONTADOR4+0, 0
	ADDWF      _personal+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,173 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main72:
	DECFSZ     R13+0, 1
	GOTO       L__main72
	DECFSZ     R12+0, 1
	GOTO       L__main72
	NOP
L__main70:
;contador_personal.mbas,176 :: 		if (CONTADOR>765)AND(CONTADOR<=1020) then
	MOVF       _CONTADOR+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVF       _CONTADOR+0, 0
	SUBLW      253
L__main96:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CONTADOR+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main97
	MOVF       _CONTADOR+0, 0
	SUBLW      252
L__main97:
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main74
;contador_personal.mbas,177 :: 		EEPROM_Write(0X50,personal+CONTADOR5)
	MOVLW      80
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _CONTADOR5+0, 0
	ADDWF      _personal+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,178 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main76:
	DECFSZ     R13+0, 1
	GOTO       L__main76
	DECFSZ     R12+0, 1
	GOTO       L__main76
	NOP
L__main74:
;contador_personal.mbas,181 :: 		EEPROM_Write(0X30,personal)
	MOVLW      48
	MOVWF      FARG_EEPROM_Write_address+0
	MOVF       _personal+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,183 :: 		if personal=255 then
	MOVF       _personal+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main78
;contador_personal.mbas,184 :: 		personal=0
	CLRF       _personal+0
L__main78:
;contador_personal.mbas,188 :: 		CONTADOR=EEPROM_Read($10)+EEPROM_Read($20)+EEPROM_Read($40)+EEPROM_Read($50)  -3*PERSONAL
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVLW      32
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R0+0, 0
	ADDWF      R1+0, 0
	MOVWF      FLOC__main+0
	MOVF       R1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FLOC__main+1
	MOVLW      64
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	ADDWF      FLOC__main+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__main+1, 1
	MOVLW      80
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	ADDWF      FLOC__main+0, 0
	MOVWF      _CONTADOR+0
	MOVF       FLOC__main+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _CONTADOR+1
	MOVLW      3
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       _personal+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	SUBWF      _CONTADOR+0, 1
	BTFSS      STATUS+0, 0
	DECF       _CONTADOR+1, 1
	MOVF       R0+1, 0
	SUBWF      _CONTADOR+1, 1
;contador_personal.mbas,189 :: 		Delay_ms(25)
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L__main80:
	DECFSZ     R13+0, 1
	GOTO       L__main80
	DECFSZ     R12+0, 1
	GOTO       L__main80
	NOP
;contador_personal.mbas,190 :: 		WordToStr(CONTADOR,text2)
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;contador_personal.mbas,191 :: 		Lcd_Out(2,2,"N")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      78
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,192 :: 		Lcd_Out(2,3,"=")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      61
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,193 :: 		Lcd_Out(2,4,text2)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,196 :: 		if PORTE.RE3=0 then
	BTFSC      PORTE+0, 3
	GOTO       L__main82
;contador_personal.mbas,197 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;contador_personal.mbas,198 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;contador_personal.mbas,199 :: 		CONTADOR2=0
	CLRF       _CONTADOR2+0
	CLRF       _CONTADOR2+1
;contador_personal.mbas,200 :: 		CONTADOR3=0
	CLRF       _CONTADOR3+0
	CLRF       _CONTADOR3+1
;contador_personal.mbas,201 :: 		CONTADOR4=0
	CLRF       _CONTADOR4+0
	CLRF       _CONTADOR4+1
;contador_personal.mbas,202 :: 		CONTADOR5=0
	CLRF       _CONTADOR5+0
	CLRF       _CONTADOR5+1
;contador_personal.mbas,203 :: 		PERSONAL=0
	CLRF       _personal+0
;contador_personal.mbas,204 :: 		EEPROM_write($10,0x00)
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,205 :: 		EEPROM_write($20,0x00)
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,206 :: 		EEPROM_write($40,0x00)
	MOVLW      64
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;contador_personal.mbas,207 :: 		Lcd_Out(1, 1, "NUMERO PERSONAL:") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
;contador_personal.mbas,208 :: 		WordToStr(CONTADOR,text2)
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _text2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;contador_personal.mbas,209 :: 		Lcd_Out(2,2,"N")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      78
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,210 :: 		Lcd_Out(2,3,"=")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      61
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;contador_personal.mbas,211 :: 		Lcd_Out(2,4,text2)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main82:
;contador_personal.mbas,219 :: 		WEND
	GOTO       L__main48
	GOTO       $+0
; end of _main
