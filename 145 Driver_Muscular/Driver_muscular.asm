
_main:

;Driver_muscular.mbas,22 :: 		main:
;Driver_muscular.mbas,24 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Driver_muscular.mbas,26 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Driver_muscular.mbas,27 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Driver_muscular.mbas,29 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;Driver_muscular.mbas,30 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Driver_muscular.mbas,32 :: 		TRISC = 0XFF ' PORTC salidas
	MOVLW      255
	MOVWF      TRISC+0
;Driver_muscular.mbas,33 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Driver_muscular.mbas,35 :: 		TRISD = 0X00 ' PORTE  como salidas digital
	CLRF       TRISD+0
;Driver_muscular.mbas,36 :: 		PORTD = 0X00
	CLRF       PORTD+0
;Driver_muscular.mbas,38 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Driver_muscular.mbas,39 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Driver_muscular.mbas,40 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;Driver_muscular.mbas,41 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Driver_muscular.mbas,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor of
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Driver_muscular.mbas,43 :: 		Lcd_Out(1,1,"AUTOR:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
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
;Driver_muscular.mbas,44 :: 		Lcd_Out(2,1,"JOSE JACOME ")                 ' escribe la cadena en la segunda fila
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Driver_muscular.mbas,45 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
	NOP
;Driver_muscular.mbas,46 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Driver_muscular.mbas,47 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Driver_muscular.mbas,48 :: 		Lcd_Out(1,1,"DATOS:")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      83
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
;Driver_muscular.mbas,49 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;Driver_muscular.mbas,50 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main2:
	DECFSZ     R13+0, 1
	GOTO       L__main2
	DECFSZ     R12+0, 1
	GOTO       L__main2
	DECFSZ     R11+0, 1
	GOTO       L__main2
	NOP
;Driver_muscular.mbas,51 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;Driver_muscular.mbas,52 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main3:
	DECFSZ     R13+0, 1
	GOTO       L__main3
	DECFSZ     R12+0, 1
	GOTO       L__main3
	DECFSZ     R11+0, 1
	GOTO       L__main3
	NOP
;Driver_muscular.mbas,53 :: 		txt2 = ""
	CLRF       _txt2+0
;Driver_muscular.mbas,54 :: 		while(1)
L__main5:
;Driver_muscular.mbas,55 :: 		Lcd_Out(1,1,"DATOS:")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      83
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
;Driver_muscular.mbas,56 :: 		if (UART1_Data_Ready() <> 0) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main10
;Driver_muscular.mbas,57 :: 		UART1_Read_Text(txt2,"A",32)
	MOVLW      _txt2+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      32
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;Driver_muscular.mbas,58 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Driver_muscular.mbas,59 :: 		Lcd_OUT(3,1,TXT2)
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main10:
;Driver_muscular.mbas,62 :: 		wend
	GOTO       L__main5
	GOTO       $+0
; end of _main
