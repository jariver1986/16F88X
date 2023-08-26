
_main:

;Sistema_comunicacion.mbas,29 :: 		main:
;Sistema_comunicacion.mbas,31 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Sistema_comunicacion.mbas,33 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Sistema_comunicacion.mbas,34 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Sistema_comunicacion.mbas,36 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;Sistema_comunicacion.mbas,37 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Sistema_comunicacion.mbas,39 :: 		TRISC = 0X8F ' PORTC salidas
	MOVLW      143
	MOVWF      TRISC+0
;Sistema_comunicacion.mbas,40 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Sistema_comunicacion.mbas,42 :: 		TRISD = 0X03 ' PORTE  como salidas digital
	MOVLW      3
	MOVWF      TRISD+0
;Sistema_comunicacion.mbas,43 :: 		PORTD = 0X00
	CLRF       PORTD+0
;Sistema_comunicacion.mbas,45 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Sistema_comunicacion.mbas,46 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Sistema_comunicacion.mbas,47 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Sistema_comunicacion.mbas,48 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;Sistema_comunicacion.mbas,49 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_comunicacion.mbas,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_comunicacion.mbas,51 :: 		Lcd_Out(1,1,"SISTEMA XBEE ")                 ' escribe la cadena en la primera fila
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
;Sistema_comunicacion.mbas,52 :: 		Lcd_Out(2,1,"COMUNICACION ")                 ' escribe la cadena en la segunda fila
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
;Sistema_comunicacion.mbas,53 :: 		delay_ms(2000)
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
;Sistema_comunicacion.mbas,54 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_comunicacion.mbas,55 :: 		Lcd_Out(1,1,"POR:")                 ' escribe la cadena en la primera fila
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
;Sistema_comunicacion.mbas,56 :: 		Lcd_Out(2,1,"RAUL ESPINOZA")                 ' escribe la cadena en la segunda fila
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
;Sistema_comunicacion.mbas,57 :: 		delay_ms(2000)
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
;Sistema_comunicacion.mbas,58 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_comunicacion.mbas,59 :: 		delay_ms(250)
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
;Sistema_comunicacion.mbas,60 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Sistema_comunicacion.mbas,61 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;Sistema_comunicacion.mbas,62 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,63 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;Sistema_comunicacion.mbas,64 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,65 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;Sistema_comunicacion.mbas,66 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,67 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;Sistema_comunicacion.mbas,68 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,69 :: 		while(1)
L__main9:
;Sistema_comunicacion.mbas,70 :: 		if (UART1_Data_Ready() <> 0) then ' If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main14
;Sistema_comunicacion.mbas,71 :: 		UART1_Read_Text(txt2,"-",32)     ' lee la cadena hasta que encuentre la letra K mayuscula
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
;Sistema_comunicacion.mbas,72 :: 		UART1_Write_Text(txt2)           ' envia un eco de la cadena
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_comunicacion.mbas,73 :: 		Lcd_Cmd(_LCD_CLEAR)              ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Sistema_comunicacion.mbas,74 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;Sistema_comunicacion.mbas,75 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,76 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;Sistema_comunicacion.mbas,77 :: 		Delay_ms(200)
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
;Sistema_comunicacion.mbas,78 :: 		for counter = 0 to 15
	CLRF       _counter+0
L__main19:
;Sistema_comunicacion.mbas,79 :: 		Lcd_Chr(1,counter+1,txt2[counter])
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
;Sistema_comunicacion.mbas,80 :: 		next counter
	MOVF       _counter+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L__main22
	INCF       _counter+0, 1
	GOTO       L__main19
L__main22:
;Sistema_comunicacion.mbas,81 :: 		for counter = 0 to 15
	CLRF       _counter+0
L__main24:
;Sistema_comunicacion.mbas,82 :: 		Lcd_Chr(2,counter+1,txt2[counter+16])
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
;Sistema_comunicacion.mbas,83 :: 		next counter
	MOVF       _counter+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L__main27
	INCF       _counter+0, 1
	GOTO       L__main24
L__main27:
;Sistema_comunicacion.mbas,84 :: 		txt2 ="                             "
	MOVLW      _txt2+0
	MOVWF      FSR
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
	CLRF       INDF+0
	INCF       FSR, 1
L__main14:
;Sistema_comunicacion.mbas,86 :: 		if BOTON1=1 then
	BTFSS      PORTC+0, 0
	GOTO       L__main29
;Sistema_comunicacion.mbas,87 :: 		while BOTON1=1 wend
L__main32:
	BTFSS      PORTC+0, 0
	GOTO       L__main33
	GOTO       L__main32
L__main33:
;Sistema_comunicacion.mbas,88 :: 		UART1_Write_Text("OK")
	MOVLW      79
	MOVWF      _main_Local_Text+0
	MOVLW      75
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Sistema_comunicacion.mbas,89 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Sistema_comunicacion.mbas,90 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main29:
;Sistema_comunicacion.mbas,122 :: 		wend
	GOTO       L__main9
	GOTO       $+0
; end of _main
