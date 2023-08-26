
_main:

;LCD_Drone.mbas,29 :: 		main:
;LCD_Drone.mbas,31 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;LCD_Drone.mbas,33 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;LCD_Drone.mbas,34 :: 		PORTA = 0X00
	CLRF       PORTA+0
;LCD_Drone.mbas,36 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;LCD_Drone.mbas,37 :: 		PORTB = 0X00
	CLRF       PORTB+0
;LCD_Drone.mbas,39 :: 		TRISC = 0X8F ' PORTC salidas
	MOVLW      143
	MOVWF      TRISC+0
;LCD_Drone.mbas,40 :: 		PORTC = 0X00
	CLRF       PORTC+0
;LCD_Drone.mbas,42 :: 		TRISD = 0X03 ' PORTE  como salidas digital
	MOVLW      3
	MOVWF      TRISD+0
;LCD_Drone.mbas,43 :: 		PORTD = 0X00
	CLRF       PORTD+0
;LCD_Drone.mbas,45 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;LCD_Drone.mbas,46 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;LCD_Drone.mbas,47 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;LCD_Drone.mbas,48 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;LCD_Drone.mbas,49 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,51 :: 		Lcd_Out(1,1,"SISTEMA DE CONTROL ")                 ' escribe la cadena en la primera fila
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
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
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
;LCD_Drone.mbas,52 :: 		Lcd_Out(2,1,"ELECTROMUSCULAR ")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      82
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;LCD_Drone.mbas,53 :: 		delay_ms(2000)
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
;LCD_Drone.mbas,54 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,55 :: 		Lcd_Out(1,1,"POR:")                 ' escribe la cadena en la primera fila
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
;LCD_Drone.mbas,56 :: 		Lcd_Out(2,1,"JOSE JACOME")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
;LCD_Drone.mbas,57 :: 		delay_ms(2000)
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
;LCD_Drone.mbas,58 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,59 :: 		delay_ms(250)
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
;LCD_Drone.mbas,60 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;LCD_Drone.mbas,61 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;LCD_Drone.mbas,62 :: 		Delay_ms(200)
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
;LCD_Drone.mbas,63 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;LCD_Drone.mbas,64 :: 		Delay_ms(200)
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
;LCD_Drone.mbas,65 :: 		portd.rd2=1
	BSF        PORTD+0, 2
;LCD_Drone.mbas,66 :: 		Delay_ms(200)
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
;LCD_Drone.mbas,67 :: 		portd.rd2=0
	BCF        PORTD+0, 2
;LCD_Drone.mbas,68 :: 		Delay_ms(200)
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
;LCD_Drone.mbas,69 :: 		txt2 ="________________________________"
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
;LCD_Drone.mbas,70 :: 		while(1)
L__main9:
;LCD_Drone.mbas,71 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,72 :: 		Lcd_Out(1,1,"SISTEMA CONTROL")                 ' escribe la cadena en la primera fila
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
	MOVLW      82
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
;LCD_Drone.mbas,73 :: 		Lcd_Out(2,1,"ELECTROMUSCULAR ")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
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
	MOVLW      82
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
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
;LCD_Drone.mbas,74 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main13:
	DECFSZ     R13+0, 1
	GOTO       L__main13
	DECFSZ     R12+0, 1
	GOTO       L__main13
	DECFSZ     R11+0, 1
	GOTO       L__main13
	NOP
;LCD_Drone.mbas,76 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,77 :: 		Lcd_Out(1,1,"POR:")                 ' escribe la cadena en la primera fila
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
;LCD_Drone.mbas,78 :: 		Lcd_Out(2,1,"JOSE JACOME")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
;LCD_Drone.mbas,79 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
	NOP
;LCD_Drone.mbas,81 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Drone.mbas,82 :: 		Lcd_Out(1,1,"TECNOLOGICO")                 ' escribe la cadena en la primera fila
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
	MOVLW      67
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
;LCD_Drone.mbas,83 :: 		Lcd_Out(2,1,"SUDAMERICANO")                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
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
;LCD_Drone.mbas,84 :: 		delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main15:
	DECFSZ     R13+0, 1
	GOTO       L__main15
	DECFSZ     R12+0, 1
	GOTO       L__main15
	DECFSZ     R11+0, 1
	GOTO       L__main15
	NOP
;LCD_Drone.mbas,86 :: 		wend
	GOTO       L__main9
	GOTO       $+0
; end of _main
