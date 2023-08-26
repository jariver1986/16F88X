
_main:

;lcd_uart.mbas,17 :: 		main:
;lcd_uart.mbas,19 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;lcd_uart.mbas,21 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;lcd_uart.mbas,22 :: 		PORTA = 0X00
	CLRF       PORTA+0
;lcd_uart.mbas,24 :: 		TRISB = 0X0F ' PORTB salidas
	MOVLW      15
	MOVWF      TRISB+0
;lcd_uart.mbas,25 :: 		PORTB = 0X00
	CLRF       PORTB+0
;lcd_uart.mbas,27 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;lcd_uart.mbas,28 :: 		PORTC = 0X00
	CLRF       PORTC+0
;lcd_uart.mbas,30 :: 		TRISE = 0X00 ' PORTE como salidas digital
	CLRF       TRISE+0
;lcd_uart.mbas,31 :: 		PORTE = 0X00
	CLRF       PORTE+0
;lcd_uart.mbas,33 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;lcd_uart.mbas,34 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;lcd_uart.mbas,35 :: 		Lcd_Init() ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;lcd_uart.mbas,36 :: 		Lcd_Cmd(_LCD_CLEAR) ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF) ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,38 :: 		Lcd_Out(1,2,"INSTITUTO ") ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_uart.mbas,39 :: 		Lcd_Out(2,2,"SUDAMERICANO") ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
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
;lcd_uart.mbas,40 :: 		delay_ms(3000)
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;lcd_uart.mbas,41 :: 		Lcd_Cmd(_LCD_CLEAR) ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF) ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,43 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
	NOP
;lcd_uart.mbas,44 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;lcd_uart.mbas,45 :: 		Lcd_Out(1,2,"SISTEMA DE  ") ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_uart.mbas,46 :: 		Lcd_Out(2,2,"MENSAJERIA") ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd_uart.mbas,47 :: 		delay_ms(3000)
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
;lcd_uart.mbas,48 :: 		while(1)
L__main5:
;lcd_uart.mbas,49 :: 		if (UART1_Data_Ready() <> 0) then ' If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main10
;lcd_uart.mbas,50 :: 		UART1_Read_Text(txt2,".",32) ' lee la cadena hasta que encuentre PUNTO
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      46
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      32
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;lcd_uart.mbas,51 :: 		UART1_Write_Text(txt2) ' envia un eco de la cadena
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;lcd_uart.mbas,52 :: 		Lcd_Cmd(_LCD_CLEAR) ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF) ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd_uart.mbas,54 :: 		Lcd_Out(1,1,txt2) 'me muestra la cadena que escribiste via serial en el lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main10:
;lcd_uart.mbas,56 :: 		wend
	GOTO       L__main5
	GOTO       $+0
; end of _main
