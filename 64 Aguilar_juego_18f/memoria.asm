
_main:

;memoria.mbas,39 :: 		main:
;memoria.mbas,40 :: 		OSCCON=0X75
	MOVLW      117
	MOVWF      OSCCON+0
;memoria.mbas,41 :: 		TRISA = 0x00
	CLRF       TRISA+0
;memoria.mbas,42 :: 		TRISB = 0
	CLRF       TRISB+0
;memoria.mbas,43 :: 		TRISC = 0xFF
	MOVLW      255
	MOVWF      TRISC+0
;memoria.mbas,44 :: 		TRISD = 0
	CLRF       TRISD+0
;memoria.mbas,45 :: 		TRISE = 0x01
	MOVLW      1
	MOVWF      TRISE+0
;memoria.mbas,46 :: 		PORTA = 0
	CLRF       PORTA+0
;memoria.mbas,47 :: 		PORTB = 0
	CLRF       PORTB+0
;memoria.mbas,48 :: 		PORTC = 0
	CLRF       PORTC+0
;memoria.mbas,49 :: 		PORTD = 0
	CLRF       PORTD+0
;memoria.mbas,50 :: 		PORTE = 0
	CLRF       PORTE+0
;memoria.mbas,51 :: 		ANSEL = 0
	CLRF       ANSEL+0
;memoria.mbas,52 :: 		ANSELH= 0
	CLRF       ANSELH+0
;memoria.mbas,53 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;memoria.mbas,54 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,55 :: 		Lcd_Out(1,1,"RETENCION")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
;memoria.mbas,56 :: 		Lcd_Out(2,1,"DE MEMORIA")
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;memoria.mbas,58 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,59 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,60 :: 		Lcd_Out(1,1,"PRESIONE BOTON")
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
;memoria.mbas,61 :: 		Lcd_Out(2,1,"INICIO")
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
	MOVLW      73
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;memoria.mbas,63 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,64 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,65 :: 		ALEATORIO =1
	MOVLW      1
	MOVWF      _ALEATORIO+0
;memoria.mbas,66 :: 		TURNO=0
	CLRF       _TURNO+0
;memoria.mbas,67 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
;memoria.mbas,68 :: 		HISTORIAL=0
	CLRF       _HISTORIAL+0
;memoria.mbas,69 :: 		TURNO2=0
	CLRF       _TURNO2+0
;memoria.mbas,70 :: 		VALIDA=1
	MOVLW      1
	MOVWF      _VALIDA+0
;memoria.mbas,71 :: 		ARREGLO[0]=0
	CLRF       _ARREGLO+0
;memoria.mbas,72 :: 		ARREGLO[1]=0
	CLRF       _ARREGLO+1
;memoria.mbas,73 :: 		ARREGLO[2]=0
	CLRF       _ARREGLO+2
;memoria.mbas,74 :: 		ARREGLO[3]=0
	CLRF       _ARREGLO+3
;memoria.mbas,75 :: 		ARREGLO[4]=0
	CLRF       _ARREGLO+4
;memoria.mbas,76 :: 		ARREGLO[5]=0
	CLRF       _ARREGLO+5
;memoria.mbas,77 :: 		ARREGLO[6]=0
	CLRF       _ARREGLO+6
;memoria.mbas,78 :: 		ARREGLO[7]=0
	CLRF       _ARREGLO+7
;memoria.mbas,79 :: 		ARREGLO[8]=0
	CLRF       _ARREGLO+8
;memoria.mbas,80 :: 		ARREGLO[9]=0
	CLRF       _ARREGLO+9
;memoria.mbas,81 :: 		USUARIO[0] = 0
	CLRF       _USUARIO+0
;memoria.mbas,82 :: 		USUARIO[1] = 0
	CLRF       _USUARIO+1
;memoria.mbas,83 :: 		USUARIO[2] = 0
	CLRF       _USUARIO+2
;memoria.mbas,84 :: 		USUARIO[3] = 0
	CLRF       _USUARIO+3
;memoria.mbas,85 :: 		USUARIO[4] = 0
	CLRF       _USUARIO+4
;memoria.mbas,86 :: 		USUARIO[5] = 0
	CLRF       _USUARIO+5
;memoria.mbas,87 :: 		USUARIO[6] = 0
	CLRF       _USUARIO+6
;memoria.mbas,88 :: 		USUARIO[7] = 0
	CLRF       _USUARIO+7
;memoria.mbas,89 :: 		USUARIO[8] = 0
	CLRF       _USUARIO+8
;memoria.mbas,90 :: 		USUARIO[9] = 0
	CLRF       _USUARIO+9
;memoria.mbas,91 :: 		while 1
L__main2:
;memoria.mbas,92 :: 		if PORTE.RE0=1 then
	BTFSS      PORTE+0, 0
	GOTO       L__main7
;memoria.mbas,93 :: 		INC(TURNO)
	INCF       _TURNO+0, 1
;memoria.mbas,94 :: 		while(PORTE.RE0=1)
L__main10:
	BTFSS      PORTE+0, 0
	GOTO       L__main11
;memoria.mbas,95 :: 		ALEATORIO = ALEATORIO*2
	MOVF       _ALEATORIO+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVF       R1+0, 0
	MOVWF      _ALEATORIO+0
;memoria.mbas,96 :: 		if ALEATORIO=16 then
	MOVF       R1+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;memoria.mbas,97 :: 		ALEATORIO=1
	MOVLW      1
	MOVWF      _ALEATORIO+0
L__main15:
;memoria.mbas,99 :: 		wend
	GOTO       L__main10
L__main11:
;memoria.mbas,100 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,101 :: 		Lcd_Out(1,1,"SECUENCIA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
;memoria.mbas,102 :: 		ARREGLO[HISTORIAL]=ALEATORIO
	MOVF       _HISTORIAL+0, 0
	ADDLW      _ARREGLO+0
	MOVWF      FSR
	MOVF       _ALEATORIO+0, 0
	MOVWF      INDF+0
;memoria.mbas,103 :: 		PORTD= ARREGLO[0]
	MOVF       _ARREGLO+0, 0
	MOVWF      PORTD+0
;memoria.mbas,104 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main17:
	DECFSZ     R13+0, 1
	GOTO       L__main17
	DECFSZ     R12+0, 1
	GOTO       L__main17
	DECFSZ     R11+0, 1
	GOTO       L__main17
	NOP
	NOP
;memoria.mbas,105 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,106 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
	NOP
	NOP
;memoria.mbas,107 :: 		PORTD= ARREGLO[1]
	MOVF       _ARREGLO+1, 0
	MOVWF      PORTD+0
;memoria.mbas,108 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
	NOP
	NOP
;memoria.mbas,109 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,110 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
	NOP
;memoria.mbas,111 :: 		PORTD= ARREGLO[2]
	MOVF       _ARREGLO+2, 0
	MOVWF      PORTD+0
;memoria.mbas,112 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	DECFSZ     R11+0, 1
	GOTO       L__main21
	NOP
	NOP
;memoria.mbas,113 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,114 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main22:
	DECFSZ     R13+0, 1
	GOTO       L__main22
	DECFSZ     R12+0, 1
	GOTO       L__main22
	DECFSZ     R11+0, 1
	GOTO       L__main22
	NOP
	NOP
;memoria.mbas,115 :: 		PORTD= ARREGLO[3]
	MOVF       _ARREGLO+3, 0
	MOVWF      PORTD+0
;memoria.mbas,116 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main23:
	DECFSZ     R13+0, 1
	GOTO       L__main23
	DECFSZ     R12+0, 1
	GOTO       L__main23
	DECFSZ     R11+0, 1
	GOTO       L__main23
	NOP
	NOP
;memoria.mbas,117 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,118 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main24:
	DECFSZ     R13+0, 1
	GOTO       L__main24
	DECFSZ     R12+0, 1
	GOTO       L__main24
	DECFSZ     R11+0, 1
	GOTO       L__main24
	NOP
	NOP
;memoria.mbas,119 :: 		PORTD= ARREGLO[4]
	MOVF       _ARREGLO+4, 0
	MOVWF      PORTD+0
;memoria.mbas,120 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main25:
	DECFSZ     R13+0, 1
	GOTO       L__main25
	DECFSZ     R12+0, 1
	GOTO       L__main25
	DECFSZ     R11+0, 1
	GOTO       L__main25
	NOP
	NOP
;memoria.mbas,121 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,122 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main26:
	DECFSZ     R13+0, 1
	GOTO       L__main26
	DECFSZ     R12+0, 1
	GOTO       L__main26
	DECFSZ     R11+0, 1
	GOTO       L__main26
	NOP
	NOP
;memoria.mbas,123 :: 		PORTD= ARREGLO[5]
	MOVF       _ARREGLO+5, 0
	MOVWF      PORTD+0
;memoria.mbas,124 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main27:
	DECFSZ     R13+0, 1
	GOTO       L__main27
	DECFSZ     R12+0, 1
	GOTO       L__main27
	DECFSZ     R11+0, 1
	GOTO       L__main27
	NOP
	NOP
;memoria.mbas,125 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,126 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main28:
	DECFSZ     R13+0, 1
	GOTO       L__main28
	DECFSZ     R12+0, 1
	GOTO       L__main28
	DECFSZ     R11+0, 1
	GOTO       L__main28
	NOP
	NOP
;memoria.mbas,127 :: 		PORTD= ARREGLO[6]
	MOVF       _ARREGLO+6, 0
	MOVWF      PORTD+0
;memoria.mbas,128 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	DECFSZ     R11+0, 1
	GOTO       L__main29
	NOP
	NOP
;memoria.mbas,129 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,130 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main30:
	DECFSZ     R13+0, 1
	GOTO       L__main30
	DECFSZ     R12+0, 1
	GOTO       L__main30
	DECFSZ     R11+0, 1
	GOTO       L__main30
	NOP
	NOP
;memoria.mbas,131 :: 		PORTD= ARREGLO[7]
	MOVF       _ARREGLO+7, 0
	MOVWF      PORTD+0
;memoria.mbas,132 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main31:
	DECFSZ     R13+0, 1
	GOTO       L__main31
	DECFSZ     R12+0, 1
	GOTO       L__main31
	DECFSZ     R11+0, 1
	GOTO       L__main31
	NOP
	NOP
;memoria.mbas,133 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,134 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main32:
	DECFSZ     R13+0, 1
	GOTO       L__main32
	DECFSZ     R12+0, 1
	GOTO       L__main32
	DECFSZ     R11+0, 1
	GOTO       L__main32
	NOP
	NOP
;memoria.mbas,135 :: 		PORTD= ARREGLO[8]
	MOVF       _ARREGLO+8, 0
	MOVWF      PORTD+0
;memoria.mbas,136 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main33:
	DECFSZ     R13+0, 1
	GOTO       L__main33
	DECFSZ     R12+0, 1
	GOTO       L__main33
	DECFSZ     R11+0, 1
	GOTO       L__main33
	NOP
	NOP
;memoria.mbas,137 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,138 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main34:
	DECFSZ     R13+0, 1
	GOTO       L__main34
	DECFSZ     R12+0, 1
	GOTO       L__main34
	DECFSZ     R11+0, 1
	GOTO       L__main34
	NOP
	NOP
;memoria.mbas,139 :: 		PORTD= ARREGLO[9]
	MOVF       _ARREGLO+9, 0
	MOVWF      PORTD+0
;memoria.mbas,140 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	DECFSZ     R11+0, 1
	GOTO       L__main35
	NOP
	NOP
;memoria.mbas,141 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,142 :: 		Delay_ms(200)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main36:
	DECFSZ     R13+0, 1
	GOTO       L__main36
	DECFSZ     R12+0, 1
	GOTO       L__main36
	DECFSZ     R11+0, 1
	GOTO       L__main36
	NOP
	NOP
;memoria.mbas,143 :: 		INC(HISTORIAL)
	INCF       _HISTORIAL+0, 1
;memoria.mbas,144 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,145 :: 		Lcd_Out(1,1,"PRESIONE")
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
;memoria.mbas,146 :: 		Lcd_Out(2,1,"SECUENCIA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
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
;memoria.mbas,147 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,148 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main7:
;memoria.mbas,151 :: 		if (PORTC.RC0=1)OR(PORTC.RC1=1)OR(PORTC.RC2=1)OR(PORTC.RC3=1) then
	BTFSC      PORTC+0, 0
	GOTO       L__main87
	BCF        114, 0
	GOTO       L__main88
L__main87:
	BSF        114, 0
L__main88:
	CLRF       R1+0
	BTFSS      PORTC+0, 1
	GOTO       L__main40
	MOVLW      255
	MOVWF      R1+0
L__main40:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTC+0, 2
	GOTO       L__main41
	MOVLW      255
	MOVWF      R0+0
L__main41:
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTC+0, 3
	GOTO       L__main42
	MOVLW      255
	MOVWF      R0+0
L__main42:
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main38
;memoria.mbas,153 :: 		while((PORTC.RC0=1)OR(PORTC.RC1=1)OR(PORTC.RC2=1)OR(PORTC.RC3=1))
L__main44:
	BTFSC      PORTC+0, 0
	GOTO       L__main89
	BCF        114, 0
	GOTO       L__main90
L__main89:
	BSF        114, 0
L__main90:
	CLRF       R1+0
	BTFSS      PORTC+0, 1
	GOTO       L__main48
	MOVLW      255
	MOVWF      R1+0
L__main48:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTC+0, 2
	GOTO       L__main49
	MOVLW      255
	MOVWF      R0+0
L__main49:
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSS      PORTC+0, 3
	GOTO       L__main50
	MOVLW      255
	MOVWF      R0+0
L__main50:
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main45
;memoria.mbas,154 :: 		ALEATORIO2=PORTB
	MOVF       PORTB+0, 0
	MOVWF      _ALEATORIO2+0
;memoria.mbas,155 :: 		PORTD= ALEATORIO2
	MOVF       _ALEATORIO2+0, 0
	MOVWF      PORTD+0
;memoria.mbas,156 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;memoria.mbas,157 :: 		wend
	GOTO       L__main44
L__main45:
;memoria.mbas,158 :: 		USUARIO[TURNO2]=ALEATORIO2
	MOVF       _TURNO2+0, 0
	ADDLW      _USUARIO+0
	MOVWF      FSR
	MOVF       _ALEATORIO2+0, 0
	MOVWF      INDF+0
;memoria.mbas,159 :: 		PORTD=0
	CLRF       PORTD+0
;memoria.mbas,160 :: 		INC(TURNO2)
	INCF       _TURNO2+0, 1
;memoria.mbas,162 :: 		Lcd_Out(1,1,"TURNO")
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
	MOVLW      82
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
;memoria.mbas,163 :: 		PORTADOR=TURNO
	MOVF       _TURNO+0, 0
	MOVWF      _PORTADOR+0
	CLRF       _PORTADOR+1
;memoria.mbas,164 :: 		WordToStr(PORTADOR,TEXTO)
	MOVF       _PORTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _PORTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;memoria.mbas,165 :: 		Lcd_Out(2,1,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main38:
;memoria.mbas,172 :: 		if VALIDA=TURNO2 then
	MOVF       _VALIDA+0, 0
	XORWF      _TURNO2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
;memoria.mbas,173 :: 		INC(VALIDA)
	INCF       _VALIDA+0, 1
;memoria.mbas,174 :: 		TURNO2=0
	CLRF       _TURNO2+0
;memoria.mbas,175 :: 		if ARREGLO[0]=USUARIO[0]THEN
	MOVF       _ARREGLO+0, 0
	XORWF      _USUARIO+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
;memoria.mbas,176 :: 		if ARREGLO[1]=USUARIO[1]THEN
	MOVF       _ARREGLO+1, 0
	XORWF      _USUARIO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
;memoria.mbas,177 :: 		if ARREGLO[2]=USUARIO[2]THEN
	MOVF       _ARREGLO+2, 0
	XORWF      _USUARIO+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
;memoria.mbas,178 :: 		if ARREGLO[3]=USUARIO[3]THEN
	MOVF       _ARREGLO+3, 0
	XORWF      _USUARIO+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;memoria.mbas,179 :: 		if ARREGLO[4]=USUARIO[4]THEN
	MOVF       _ARREGLO+4, 0
	XORWF      _USUARIO+4, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;memoria.mbas,180 :: 		if ARREGLO[5]=USUARIO[5]THEN
	MOVF       _ARREGLO+5, 0
	XORWF      _USUARIO+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
;memoria.mbas,181 :: 		if ARREGLO[6]=USUARIO[6]THEN
	MOVF       _ARREGLO+6, 0
	XORWF      _USUARIO+6, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
;memoria.mbas,182 :: 		if ARREGLO[7]=USUARIO[7]THEN
	MOVF       _ARREGLO+7, 0
	XORWF      _USUARIO+7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
;memoria.mbas,183 :: 		if ARREGLO[8]=USUARIO[8]THEN
	MOVF       _ARREGLO+8, 0
	XORWF      _USUARIO+8, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
;memoria.mbas,184 :: 		if ARREGLO[9]=USUARIO[9]THEN
	MOVF       _ARREGLO+9, 0
	XORWF      _USUARIO+9, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
;memoria.mbas,185 :: 		INC(CONTADOR)
	INCF       _CONTADOR+0, 1
;memoria.mbas,186 :: 		ALEATORIO2=0
	CLRF       _ALEATORIO2+0
;memoria.mbas,187 :: 		Lcd_Out(1,1,"CORRECTO =)")
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      41
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;memoria.mbas,188 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,189 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main82:
;memoria.mbas,190 :: 		end if
L__main79:
;memoria.mbas,191 :: 		end if
L__main76:
;memoria.mbas,192 :: 		end if
L__main73:
;memoria.mbas,193 :: 		end if
L__main70:
;memoria.mbas,194 :: 		end if
L__main67:
;memoria.mbas,195 :: 		end if
L__main64:
;memoria.mbas,196 :: 		end if
L__main61:
;memoria.mbas,197 :: 		end if
L__main58:
;memoria.mbas,198 :: 		end if
L__main55:
;memoria.mbas,199 :: 		end if
L__main52:
;memoria.mbas,203 :: 		if TURNO=11 then
	MOVF       _TURNO+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L__main85
;memoria.mbas,204 :: 		TURNO=0
	CLRF       _TURNO+0
;memoria.mbas,205 :: 		Lcd_Out(1,1,"FIN DE JUEGO")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
;memoria.mbas,206 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,207 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,208 :: 		Lcd_Out(1,1,"ACIERTOS")
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
;memoria.mbas,209 :: 		PORTADOR=CONTADOR
	MOVF       _CONTADOR+0, 0
	MOVWF      _PORTADOR+0
	CLRF       _PORTADOR+1
;memoria.mbas,210 :: 		WordToStr(PORTADOR,TEXTO)
	MOVF       _PORTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _PORTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXTO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;memoria.mbas,211 :: 		Lcd_Out(2,1,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;memoria.mbas,212 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;memoria.mbas,213 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;memoria.mbas,214 :: 		GOTO main
	GOTO       _main+0
L__main85:
;memoria.mbas,216 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
