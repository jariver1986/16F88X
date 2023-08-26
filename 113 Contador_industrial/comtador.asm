
_main:

;comtador.mbas,25 :: 		main:
;comtador.mbas,26 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;comtador.mbas,27 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;comtador.mbas,28 :: 		PORTA = %00000000
	CLRF       PORTA+0
;comtador.mbas,29 :: 		TRISA = %00000000
	CLRF       TRISA+0
;comtador.mbas,30 :: 		PORTB = %00000000
	CLRF       PORTB+0
;comtador.mbas,31 :: 		TRISB = %01110011  ' BOTONERAS RB4 RB5 RB6 Y SENSORES RB0 RB1
	MOVLW      115
	MOVWF      TRISB+0
;comtador.mbas,32 :: 		PORTC = %00000000
	CLRF       PORTC+0
;comtador.mbas,33 :: 		TRISC = %00000000
	CLRF       TRISC+0
;comtador.mbas,34 :: 		PORTD = %00000000
	CLRF       PORTD+0
;comtador.mbas,35 :: 		TRISD = %00000000
	CLRF       TRISD+0
;comtador.mbas,36 :: 		PORTE = %00000000
	CLRF       PORTE+0
;comtador.mbas,37 :: 		TRISE = %00000000
	CLRF       TRISE+0
;comtador.mbas,38 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;comtador.mbas,39 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;comtador.mbas,40 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;comtador.mbas,41 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;comtador.mbas,42 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;comtador.mbas,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;comtador.mbas,44 :: 		Lcd_Out(1,1,"ESPOL")
	MOVLW      1
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
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;comtador.mbas,45 :: 		Lcd_Out(2,1,"TESIS")
	MOVLW      2
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
	MOVLW      73
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
;comtador.mbas,46 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;comtador.mbas,48 :: 		Lcd_Out(1,1,"PROYECTO")
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
;comtador.mbas,49 :: 		Lcd_Out(2,1,"CONTADOR")
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;comtador.mbas,50 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
;comtador.mbas,51 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;comtador.mbas,54 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;comtador.mbas,55 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
	NOP
;comtador.mbas,56 :: 		Lcd_Out(1,1,"ENTRADA:")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;comtador.mbas,57 :: 		Lcd_Out(2,1,"SALIDA:")
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
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;comtador.mbas,58 :: 		ENTRADAS =0
	CLRF       _ENTRADAS+0
	CLRF       _ENTRADAS+1
	CLRF       _ENTRADAS+2
	CLRF       _ENTRADAS+3
;comtador.mbas,59 :: 		SALIDAS=0
	CLRF       _SALIDAS+0
	CLRF       _SALIDAS+1
	CLRF       _SALIDAS+2
	CLRF       _SALIDAS+3
;comtador.mbas,60 :: 		while 1
L__main5:
;comtador.mbas,61 :: 		IF NORMAL =0 THEN
	BTFSC      PORTB+0, 4
	GOTO       L__main10
;comtador.mbas,62 :: 		compuerta=1
	BSF        PORTA+0, 0
L__main10:
;comtador.mbas,64 :: 		IF EMERGENCIA =0 THEN
	BTFSC      PORTB+0, 5
	GOTO       L__main13
;comtador.mbas,65 :: 		compuerta=1
	BSF        PORTA+0, 0
L__main13:
;comtador.mbas,67 :: 		IF CIERRE =0 THEN
	BTFSC      PORTB+0, 6
	GOTO       L__main16
;comtador.mbas,68 :: 		compuerta=0
	BCF        PORTA+0, 0
;comtador.mbas,69 :: 		while (CIERRE =0)  wend
L__main19:
	BTFSC      PORTB+0, 6
	GOTO       L__main20
	GOTO       L__main19
L__main20:
;comtador.mbas,70 :: 		UART1_Write_Text("C1:")
	MOVLW      67
	MOVWF      _main_Local_Text+0
	MOVLW      49
	MOVWF      _main_Local_Text+1
	MOVLW      58
	MOVWF      _main_Local_Text+2
	CLRF       _main_Local_Text+3
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;comtador.mbas,71 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _TEXTO1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;comtador.mbas,72 :: 		UART1_Write_Text(":")
	MOVLW      58
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;comtador.mbas,73 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _TEXTO2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;comtador.mbas,74 :: 		UART1_Write_Text(":")
	MOVLW      58
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;comtador.mbas,75 :: 		UART1_Write_Text("HORA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;comtador.mbas,76 :: 		UART1_Write(0x0d)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;comtador.mbas,77 :: 		UART1_Write(0x0a)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main16:
;comtador.mbas,79 :: 		if (sensor1 = 0) and (compuerta=1) then
	BTFSC      PORTB+0, 0
	GOTO       L__main71
	BSF        116, 0
	GOTO       L__main72
L__main71:
	BCF        116, 0
L__main72:
	CLRF       R1+0
	BTFSS      PORTA+0, 0
	GOTO       L__main26
	MOVLW      255
	MOVWF      R1+0
L__main26:
	CLRF       R0+0
	BTFSC      116, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main24
;comtador.mbas,80 :: 		inc(ENTRADAS)
	MOVF       _ENTRADAS+0, 0
	MOVWF      R0+0
	MOVF       _ENTRADAS+1, 0
	MOVWF      R0+1
	MOVF       _ENTRADAS+2, 0
	MOVWF      R0+2
	MOVF       _ENTRADAS+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _ENTRADAS+0
	MOVF       R0+1, 0
	MOVWF      _ENTRADAS+1
	MOVF       R0+2, 0
	MOVWF      _ENTRADAS+2
	MOVF       R0+3, 0
	MOVWF      _ENTRADAS+3
;comtador.mbas,81 :: 		LongIntToStr(ENTRADAS,TEXTO1)
	MOVF       _ENTRADAS+0, 0
	MOVWF      FARG_LongIntToStr_input+0
	MOVF       _ENTRADAS+1, 0
	MOVWF      FARG_LongIntToStr_input+1
	MOVF       _ENTRADAS+2, 0
	MOVWF      FARG_LongIntToStr_input+2
	MOVF       _ENTRADAS+3, 0
	MOVWF      FARG_LongIntToStr_input+3
	MOVLW      _TEXTO1+0
	MOVWF      FARG_LongIntToStr_output+0
	CALL       _LongIntToStr+0
;comtador.mbas,82 :: 		for counter = 3 to  11
	MOVLW      3
	MOVWF      _COUNTER+0
L__main28:
;comtador.mbas,83 :: 		Lcd_Chr(1,counter+6,TEXTO1[counter])
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	ADDWF      _COUNTER+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _COUNTER+0, 0
	ADDLW      _TEXTO1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;comtador.mbas,84 :: 		next COUNTER
	MOVF       _COUNTER+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main31
	INCF       _COUNTER+0, 1
	GOTO       L__main28
L__main31:
;comtador.mbas,85 :: 		Delay_ms(1500)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
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
;comtador.mbas,86 :: 		if sensor1 = 0 then
	BTFSC      PORTB+0, 0
	GOTO       L__main34
;comtador.mbas,87 :: 		while (sensor1 = 0)
L__main37:
	BTFSC      PORTB+0, 0
	GOTO       L__main38
;comtador.mbas,88 :: 		INC(ENTRADAS)
	MOVF       _ENTRADAS+0, 0
	MOVWF      R0+0
	MOVF       _ENTRADAS+1, 0
	MOVWF      R0+1
	MOVF       _ENTRADAS+2, 0
	MOVWF      R0+2
	MOVF       _ENTRADAS+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _ENTRADAS+0
	MOVF       R0+1, 0
	MOVWF      _ENTRADAS+1
	MOVF       R0+2, 0
	MOVWF      _ENTRADAS+2
	MOVF       R0+3, 0
	MOVWF      _ENTRADAS+3
;comtador.mbas,89 :: 		LongIntToStr(ENTRADAS,TEXTO1)
	MOVF       _ENTRADAS+0, 0
	MOVWF      FARG_LongIntToStr_input+0
	MOVF       _ENTRADAS+1, 0
	MOVWF      FARG_LongIntToStr_input+1
	MOVF       _ENTRADAS+2, 0
	MOVWF      FARG_LongIntToStr_input+2
	MOVF       _ENTRADAS+3, 0
	MOVWF      FARG_LongIntToStr_input+3
	MOVLW      _TEXTO1+0
	MOVWF      FARG_LongIntToStr_output+0
	CALL       _LongIntToStr+0
;comtador.mbas,90 :: 		for counter = 3 to  11
	MOVLW      3
	MOVWF      _COUNTER+0
L__main42:
;comtador.mbas,91 :: 		Lcd_Chr(1,counter+6,TEXTO1[counter])
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	ADDWF      _COUNTER+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _COUNTER+0, 0
	ADDLW      _TEXTO1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;comtador.mbas,92 :: 		next COUNTER
	MOVF       _COUNTER+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main45
	INCF       _COUNTER+0, 1
	GOTO       L__main42
L__main45:
;comtador.mbas,93 :: 		Delay_ms(1500)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
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
;comtador.mbas,94 :: 		wend
	GOTO       L__main37
L__main38:
L__main34:
;comtador.mbas,95 :: 		END IF
L__main24:
;comtador.mbas,97 :: 		if (sensor2 = 0)and (compuerta=1) then
	BTFSC      PORTB+0, 1
	GOTO       L__main73
	BSF        116, 0
	GOTO       L__main74
L__main73:
	BCF        116, 0
L__main74:
	CLRF       R1+0
	BTFSS      PORTA+0, 0
	GOTO       L__main50
	MOVLW      255
	MOVWF      R1+0
L__main50:
	CLRF       R0+0
	BTFSC      116, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main48
;comtador.mbas,98 :: 		inc(SALIDAS)
	MOVF       _SALIDAS+0, 0
	MOVWF      R0+0
	MOVF       _SALIDAS+1, 0
	MOVWF      R0+1
	MOVF       _SALIDAS+2, 0
	MOVWF      R0+2
	MOVF       _SALIDAS+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _SALIDAS+0
	MOVF       R0+1, 0
	MOVWF      _SALIDAS+1
	MOVF       R0+2, 0
	MOVWF      _SALIDAS+2
	MOVF       R0+3, 0
	MOVWF      _SALIDAS+3
;comtador.mbas,99 :: 		LongIntToStr(SALIDAS,TEXTO2)
	MOVF       _SALIDAS+0, 0
	MOVWF      FARG_LongIntToStr_input+0
	MOVF       _SALIDAS+1, 0
	MOVWF      FARG_LongIntToStr_input+1
	MOVF       _SALIDAS+2, 0
	MOVWF      FARG_LongIntToStr_input+2
	MOVF       _SALIDAS+3, 0
	MOVWF      FARG_LongIntToStr_input+3
	MOVLW      _TEXTO2+0
	MOVWF      FARG_LongIntToStr_output+0
	CALL       _LongIntToStr+0
;comtador.mbas,100 :: 		for counter = 3 to  11
	MOVLW      3
	MOVWF      _COUNTER+0
L__main52:
;comtador.mbas,101 :: 		Lcd_Chr(2,counter+6,TEXTO2[counter])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	ADDWF      _COUNTER+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _COUNTER+0, 0
	ADDLW      _TEXTO2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;comtador.mbas,102 :: 		next COUNTER
	MOVF       _COUNTER+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main55
	INCF       _COUNTER+0, 1
	GOTO       L__main52
L__main55:
;comtador.mbas,103 :: 		Delay_ms(1500)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main56:
	DECFSZ     R13+0, 1
	GOTO       L__main56
	DECFSZ     R12+0, 1
	GOTO       L__main56
	DECFSZ     R11+0, 1
	GOTO       L__main56
	NOP
	NOP
;comtador.mbas,104 :: 		if sensor2 = 0 then
	BTFSC      PORTB+0, 1
	GOTO       L__main58
;comtador.mbas,105 :: 		while (sensor2 = 0)
L__main61:
	BTFSC      PORTB+0, 1
	GOTO       L__main62
;comtador.mbas,106 :: 		INC(SALIDAS)
	MOVF       _SALIDAS+0, 0
	MOVWF      R0+0
	MOVF       _SALIDAS+1, 0
	MOVWF      R0+1
	MOVF       _SALIDAS+2, 0
	MOVWF      R0+2
	MOVF       _SALIDAS+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _SALIDAS+0
	MOVF       R0+1, 0
	MOVWF      _SALIDAS+1
	MOVF       R0+2, 0
	MOVWF      _SALIDAS+2
	MOVF       R0+3, 0
	MOVWF      _SALIDAS+3
;comtador.mbas,107 :: 		LongIntToStr(SALIDAS,TEXTO2)
	MOVF       _SALIDAS+0, 0
	MOVWF      FARG_LongIntToStr_input+0
	MOVF       _SALIDAS+1, 0
	MOVWF      FARG_LongIntToStr_input+1
	MOVF       _SALIDAS+2, 0
	MOVWF      FARG_LongIntToStr_input+2
	MOVF       _SALIDAS+3, 0
	MOVWF      FARG_LongIntToStr_input+3
	MOVLW      _TEXTO2+0
	MOVWF      FARG_LongIntToStr_output+0
	CALL       _LongIntToStr+0
;comtador.mbas,108 :: 		for counter = 3 to  11
	MOVLW      3
	MOVWF      _COUNTER+0
L__main66:
;comtador.mbas,109 :: 		Lcd_Chr(2,counter+6,TEXTO2[counter])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	ADDWF      _COUNTER+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _COUNTER+0, 0
	ADDLW      _TEXTO2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;comtador.mbas,110 :: 		next COUNTER
	MOVF       _COUNTER+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__main69
	INCF       _COUNTER+0, 1
	GOTO       L__main66
L__main69:
;comtador.mbas,111 :: 		Delay_ms(1500)
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	DECFSZ     R12+0, 1
	GOTO       L__main70
	DECFSZ     R11+0, 1
	GOTO       L__main70
	NOP
	NOP
;comtador.mbas,112 :: 		wend
	GOTO       L__main61
L__main62:
L__main58:
;comtador.mbas,113 :: 		END IF
L__main48:
;comtador.mbas,115 :: 		wend
	GOTO       L__main5
	GOTO       $+0
; end of _main
