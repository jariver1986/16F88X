
_main:

;sistema2.mbas,30 :: 		main:
;sistema2.mbas,32 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;sistema2.mbas,34 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;sistema2.mbas,35 :: 		PORTA = 0X00
	CLRF       PORTA+0
;sistema2.mbas,37 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;sistema2.mbas,38 :: 		PORTB = 0X00
	CLRF       PORTB+0
;sistema2.mbas,40 :: 		TRISC = 0X8F ' PORTC salidas
	MOVLW      143
	MOVWF      TRISC+0
;sistema2.mbas,41 :: 		PORTC = 0X00
	CLRF       PORTC+0
;sistema2.mbas,43 :: 		TRISD = 0X03 ' PORTE  como salidas digital
	MOVLW      3
	MOVWF      TRISD+0
;sistema2.mbas,44 :: 		PORTD = 0X00
	CLRF       PORTD+0
;sistema2.mbas,46 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;sistema2.mbas,47 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;sistema2.mbas,48 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sistema2.mbas,49 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;sistema2.mbas,50 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sistema2.mbas,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sistema2.mbas,52 :: 		Lcd_Out(1,1,"SISTEMA XBEE ")                 ' escribe la cadena en la primera fila
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      88
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
;sistema2.mbas,53 :: 		Lcd_Out(2,1,"COMUNICACION ")                 ' escribe la cadena en la segunda fila
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sistema2.mbas,54 :: 		delay_ms(2000)
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
;sistema2.mbas,55 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sistema2.mbas,56 :: 		Lcd_Out(1,1,"POR:")                 ' escribe la cadena en la primera fila
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
;sistema2.mbas,57 :: 		Lcd_Out(2,1,"RAUL ESPINOZA")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
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
;sistema2.mbas,58 :: 		delay_ms(2000)
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
;sistema2.mbas,59 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sistema2.mbas,60 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;sistema2.mbas,61 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sistema2.mbas,62 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;sistema2.mbas,63 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main4:
	DECFSZ     R13+0, 1
	GOTO       L__main4
	DECFSZ     R12+0, 1
	GOTO       L__main4
	DECFSZ     R11+0, 1
	GOTO       L__main4
;sistema2.mbas,64 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;sistema2.mbas,65 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main5:
	DECFSZ     R13+0, 1
	GOTO       L__main5
	DECFSZ     R12+0, 1
	GOTO       L__main5
	DECFSZ     R11+0, 1
	GOTO       L__main5
;sistema2.mbas,66 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;sistema2.mbas,67 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
;sistema2.mbas,68 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;sistema2.mbas,69 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
;sistema2.mbas,70 :: 		txt2 ="________________________________"
	MOVLW      _txt2+0
	MOVWF      FSR
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;sistema2.mbas,71 :: 		while(1)
L__main9:
;sistema2.mbas,72 :: 		if (UART1_Data_Ready() = 1) then ' If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main14
;sistema2.mbas,73 :: 		UART1_Read_Text(txt2,"-",32)     ' lee la cadena hasta que encuentre la letra K mayuscula
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      45
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      32
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;sistema2.mbas,74 :: 		UART1_Write_Text(txt2)           ' envia un eco de la cadena
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,76 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;sistema2.mbas,77 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main16:
	DECFSZ     R13+0, 1
	GOTO       L__main16
	DECFSZ     R12+0, 1
	GOTO       L__main16
	DECFSZ     R11+0, 1
	GOTO       L__main16
;sistema2.mbas,78 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;sistema2.mbas,79 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main17:
	DECFSZ     R13+0, 1
	GOTO       L__main17
	DECFSZ     R12+0, 1
	GOTO       L__main17
	DECFSZ     R11+0, 1
	GOTO       L__main17
;sistema2.mbas,80 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sistema2.mbas,81 :: 		for counter = 0 to 15
	CLRF       _counter+0
L__main19:
;sistema2.mbas,82 :: 		Lcd_Chr(1,counter+1,txt2[counter])
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_Row+0
	INCF       _counter+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _counter+0, 0
	ADDLW      _txt2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;sistema2.mbas,83 :: 		next counter
	MOVF       _counter+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	INCF       _counter+0, 1
	GOTO       L__main19
L__main22:
;sistema2.mbas,84 :: 		for counter = 0 to 15
	CLRF       _counter+0
L__main24:
;sistema2.mbas,85 :: 		Lcd_Chr(2,counter+1,txt2[counter+16])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	INCF       _counter+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      16
	ADDWF      _counter+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _txt2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;sistema2.mbas,86 :: 		next counter
	MOVF       _counter+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L__main27
	INCF       _counter+0, 1
	GOTO       L__main24
L__main27:
;sistema2.mbas,87 :: 		txt2 ="________________________________"
	MOVLW      _txt2+0
	MOVWF      FSR
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      95
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
L__main14:
;sistema2.mbas,89 :: 		if BOTON1=1 then
	BTFSS      PORTC+0, 0
	GOTO       L__main29
;sistema2.mbas,90 :: 		while BOTON1=1 wend
L__main32:
	BTFSS      PORTC+0, 0
	GOTO       L__main33
	GOTO       L__main32
L__main33:
;sistema2.mbas,92 :: 		UART1_Write_Text("OK")
	MOVLW      79
	MOVWF      _main_Local_Text+0
	MOVLW      75
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,93 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,94 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main29:
;sistema2.mbas,96 :: 		if BOTON2=1 then
	BTFSS      PORTC+0, 1
	GOTO       L__main37
;sistema2.mbas,97 :: 		while BOTON2=1 wend
L__main40:
	BTFSS      PORTC+0, 1
	GOTO       L__main41
	GOTO       L__main40
L__main41:
;sistema2.mbas,98 :: 		UART1_Write_Text("RECIBIDO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,99 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,100 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main37:
;sistema2.mbas,102 :: 		if BOTON3=1 then
	BTFSS      PORTC+0, 2
	GOTO       L__main45
;sistema2.mbas,103 :: 		while BOTON3=1 wend
L__main48:
	BTFSS      PORTC+0, 2
	GOTO       L__main49
	GOTO       L__main48
L__main49:
;sistema2.mbas,104 :: 		UART1_Write_Text("ESTOY EN CAMINO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,105 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,106 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main45:
;sistema2.mbas,108 :: 		if BOTON4=1 then
	BTFSS      PORTC+0, 3
	GOTO       L__main53
;sistema2.mbas,109 :: 		while BOTON4=1 wend
L__main56:
	BTFSS      PORTC+0, 3
	GOTO       L__main57
	GOTO       L__main56
L__main57:
;sistema2.mbas,110 :: 		UART1_Write_Text("ESTOY OCUPADO ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,111 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,112 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main53:
;sistema2.mbas,114 :: 		if BOTON5=1 then
	BTFSS      PORTD+0, 0
	GOTO       L__main61
;sistema2.mbas,115 :: 		while BOTON5=1 wend
L__main64:
	BTFSS      PORTD+0, 0
	GOTO       L__main65
	GOTO       L__main64
L__main65:
;sistema2.mbas,116 :: 		UART1_Write_Text("ESTOY LIBRE")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;sistema2.mbas,117 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,118 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main61:
;sistema2.mbas,120 :: 		if BOTON6=1 then
	BTFSS      PORTD+0, 1
	GOTO       L__main69
;sistema2.mbas,121 :: 		while BOTON6=1 wend
L__main72:
	BTFSS      PORTD+0, 1
	GOTO       L__main73
	GOTO       L__main72
L__main73:
;sistema2.mbas,122 :: 		UART1_Write_Text("NECESITO AYUDA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      73
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sistema2.mbas,123 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sistema2.mbas,124 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main69:
;sistema2.mbas,126 :: 		wend
	GOTO       L__main9
	GOTO       $+0
; end of _main
