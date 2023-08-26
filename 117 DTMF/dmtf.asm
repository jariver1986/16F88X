
dmtf_Init_Main:

;dmtf.mbas,18 :: 		sub procedure Init_Main
;dmtf.mbas,22 :: 		TRISE=0X07
	MOVLW       7
	MOVWF       TRISE+0 
;dmtf.mbas,23 :: 		PORTE=0
	CLRF        PORTE+0 
;dmtf.mbas,24 :: 		TRISD=0
	CLRF        TRISD+0 
;dmtf.mbas,25 :: 		PORTD=0
	CLRF        PORTD+0 
;dmtf.mbas,26 :: 		INTCON = 0                             ' Disable GIE, PEIE, TMR0IE,INT0IE,RBIE
	CLRF        INTCON+0 
;dmtf.mbas,27 :: 		INTCON2 = 0xF5
	MOVLW       245
	MOVWF       INTCON2+0 
;dmtf.mbas,28 :: 		INTCON3 = 0xC0
	MOVLW       192
	MOVWF       INTCON3+0 
;dmtf.mbas,29 :: 		RCON.IPEN = 0                          ' Disable Priority Levels on interrupts
	BCF         RCON+0, 7 
;dmtf.mbas,30 :: 		PIE1 = 0
	CLRF        PIE1+0 
;dmtf.mbas,31 :: 		PIE2 = 0
	CLRF        PIE2+0 
;dmtf.mbas,32 :: 		PIR1 = 0
	CLRF        PIR1+0 
;dmtf.mbas,33 :: 		PIR2 = 0
	CLRF        PIR2+0 
;dmtf.mbas,35 :: 		ADCON1 = ADCON1 or 0x0F                         ' Configure all ports with analog sub function as digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;dmtf.mbas,39 :: 		TRISA = 0xFF
	MOVLW       255
	MOVWF       TRISA+0 
;dmtf.mbas,40 :: 		TRISB = 0x00
	CLRF        TRISB+0 
;dmtf.mbas,41 :: 		PORTB = 0
	CLRF        PORTB+0 
;dmtf.mbas,42 :: 		TRISC = 0xFF
	MOVLW       255
	MOVWF       TRISC+0 
;dmtf.mbas,43 :: 		PORTC=0
	CLRF        PORTC+0 
;dmtf.mbas,44 :: 		TRISD = 0
	CLRF        TRISD+0 
;dmtf.mbas,45 :: 		TRISE = 0x07
	MOVLW       7
	MOVWF       TRISE+0 
;dmtf.mbas,48 :: 		LATA = 0
	CLRF        LATA+0 
;dmtf.mbas,49 :: 		LATB = 0
	CLRF        LATB+0 
;dmtf.mbas,50 :: 		LATC = 0
	CLRF        LATC+0 
;dmtf.mbas,51 :: 		LATD = 0
	CLRF        LATD+0 
;dmtf.mbas,52 :: 		LATE = 0
	CLRF        LATE+0 
	RETURN      0
; end of dmtf_Init_Main

_main:

;dmtf.mbas,55 :: 		main:
;dmtf.mbas,56 :: 		Init_Main
	CALL        dmtf_Init_Main+0, 0
;dmtf.mbas,57 :: 		CENTINELA=100
	MOVLW       100
	MOVWF       _CENTINELA+0 
;dmtf.mbas,58 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL        _Lcd_Init+0, 0
;dmtf.mbas,59 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;dmtf.mbas,60 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;dmtf.mbas,61 :: 		Lcd_Out(1,1,"PROYECTO")                 ' escribe la cadena en la primera fila
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FSR1H 
	MOVLW       80
	MOVWF       POSTINC1+0 
	MOVLW       82
	MOVWF       POSTINC1+0 
	MOVLW       79
	MOVWF       POSTINC1+0 
	MOVLW       89
	MOVWF       POSTINC1+0 
	MOVLW       69
	MOVWF       POSTINC1+0 
	MOVLW       67
	MOVWF       POSTINC1+0 
	MOVLW       84
	MOVWF       POSTINC1+0 
	MOVLW       79
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;dmtf.mbas,62 :: 		Lcd_Out(2,1,"GSM LLAMADAS")                 ' escribe la cadena en la segunda fila
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FSR1H 
	MOVLW       71
	MOVWF       POSTINC1+0 
	MOVLW       83
	MOVWF       POSTINC1+0 
	MOVLW       77
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       76
	MOVWF       POSTINC1+0 
	MOVLW       76
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       77
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       68
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       83
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;dmtf.mbas,63 :: 		Lcd_Out(3,1,"POR")                 ' escribe la cadena en la segunda fila
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       80
	MOVWF       _main_Local_Text+0 
	MOVLW       79
	MOVWF       _main_Local_Text+1 
	MOVLW       82
	MOVWF       _main_Local_Text+2 
	CLRF        _main_Local_Text+3 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;dmtf.mbas,64 :: 		Lcd_Out(4,1,"JOSE SAENZ")                 ' escribe la cadena en la segunda fila
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FSR1H 
	MOVLW       74
	MOVWF       POSTINC1+0 
	MOVLW       79
	MOVWF       POSTINC1+0 
	MOVLW       83
	MOVWF       POSTINC1+0 
	MOVLW       69
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       83
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       69
	MOVWF       POSTINC1+0 
	MOVLW       78
	MOVWF       POSTINC1+0 
	MOVLW       90
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;dmtf.mbas,65 :: 		Delay_ms(2000)
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L__main2:
	DECFSZ      R13, 1, 0
	BRA         L__main2
	DECFSZ      R12, 1, 0
	BRA         L__main2
	DECFSZ      R11, 1, 0
	BRA         L__main2
	NOP
	NOP
;dmtf.mbas,67 :: 		contador=0
	CLRF        _contador+0 
;dmtf.mbas,68 :: 		UART1_Init(9600)
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;dmtf.mbas,70 :: 		while TRUE
L__main4:
;dmtf.mbas,73 :: 		UART1_Write_Text("ATA")
	MOVLW       65
	MOVWF       _main_Local_Text+0 
	MOVLW       84
	MOVWF       _main_Local_Text+1 
	MOVLW       65
	MOVWF       _main_Local_Text+2 
	CLRF        _main_Local_Text+3 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;dmtf.mbas,74 :: 		UART1_Write(0x0d)
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,75 :: 		UART1_Write(0x0a)
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,76 :: 		Delay_ms(200)
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main8:
	DECFSZ      R13, 1, 0
	BRA         L__main8
	DECFSZ      R12, 1, 0
	BRA         L__main8
	DECFSZ      R11, 1, 0
	BRA         L__main8
	NOP
	NOP
;dmtf.mbas,77 :: 		UART1_Write_Text("ATA")
	MOVLW       65
	MOVWF       _main_Local_Text+0 
	MOVLW       84
	MOVWF       _main_Local_Text+1 
	MOVLW       65
	MOVWF       _main_Local_Text+2 
	CLRF        _main_Local_Text+3 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;dmtf.mbas,78 :: 		UART1_Write(0x0d)
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,79 :: 		UART1_Write(0x0a)
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,80 :: 		Delay_ms(200)
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main9:
	DECFSZ      R13, 1, 0
	BRA         L__main9
	DECFSZ      R12, 1, 0
	BRA         L__main9
	DECFSZ      R11, 1, 0
	BRA         L__main9
	NOP
	NOP
;dmtf.mbas,81 :: 		UART1_Write_Text("ATA")
	MOVLW       65
	MOVWF       _main_Local_Text+0 
	MOVLW       84
	MOVWF       _main_Local_Text+1 
	MOVLW       65
	MOVWF       _main_Local_Text+2 
	CLRF        _main_Local_Text+3 
	MOVLW       _main_Local_Text+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_main_Local_Text+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;dmtf.mbas,82 :: 		UART1_Write(0x0d)
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,83 :: 		UART1_Write(0x0a)
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;dmtf.mbas,84 :: 		Delay_ms(200)
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L__main10:
	DECFSZ      R13, 1, 0
	BRA         L__main10
	DECFSZ      R12, 1, 0
	BRA         L__main10
	DECFSZ      R11, 1, 0
	BRA         L__main10
	NOP
	NOP
;dmtf.mbas,86 :: 		while (CENTINELA=0)
L__main12:
	MOVF        _CENTINELA+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
;dmtf.mbas,87 :: 		DATO = PORTD
	MOVF        PORTD+0, 0 
	MOVWF       _DATO+0 
;dmtf.mbas,88 :: 		if DATO=1 then
	MOVF        _DATO+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
;dmtf.mbas,89 :: 		CENTINELA=1
	MOVLW       1
	MOVWF       _CENTINELA+0 
L__main17:
;dmtf.mbas,91 :: 		if DATO=5 then
	MOVF        _DATO+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
;dmtf.mbas,92 :: 		CENTINELA=1
	MOVLW       1
	MOVWF       _CENTINELA+0 
L__main20:
;dmtf.mbas,94 :: 		wend
	GOTO        L__main12
L__main13:
;dmtf.mbas,95 :: 		while (CENTINELA=1)
L__main23:
	MOVF        _CENTINELA+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
;dmtf.mbas,96 :: 		DATO = PORTD
	MOVF        PORTD+0, 0 
	MOVWF       _DATO+0 
;dmtf.mbas,97 :: 		if DATO=2 then
	MOVF        _DATO+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
;dmtf.mbas,98 :: 		CENTINELA=2
	MOVLW       2
	MOVWF       _CENTINELA+0 
L__main28:
;dmtf.mbas,100 :: 		if DATO=6 then
	MOVF        _DATO+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
;dmtf.mbas,101 :: 		CENTINELA=2
	MOVLW       2
	MOVWF       _CENTINELA+0 
L__main31:
;dmtf.mbas,103 :: 		wend
	GOTO        L__main23
L__main24:
;dmtf.mbas,104 :: 		while (CENTINELA=2)
L__main34:
	MOVF        _CENTINELA+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
;dmtf.mbas,105 :: 		DATO = PORTD
	MOVF        PORTD+0, 0 
	MOVWF       _DATO+0 
;dmtf.mbas,106 :: 		if DATO=3 then
	MOVF        _DATO+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
;dmtf.mbas,107 :: 		CENTINELA=3
	MOVLW       3
	MOVWF       _CENTINELA+0 
L__main39:
;dmtf.mbas,109 :: 		if DATO=7 then
	MOVF        _DATO+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
;dmtf.mbas,110 :: 		CENTINELA=3
	MOVLW       3
	MOVWF       _CENTINELA+0 
L__main42:
;dmtf.mbas,112 :: 		wend
	GOTO        L__main34
L__main35:
;dmtf.mbas,113 :: 		while (CENTINELA=3)
L__main45:
	MOVF        _CENTINELA+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
;dmtf.mbas,114 :: 		DATO = PORTD
	MOVF        PORTD+0, 0 
	MOVWF       _DATO+0 
;dmtf.mbas,115 :: 		if DATO=4 then
	MOVF        _DATO+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
;dmtf.mbas,116 :: 		CENTINELA=4
	MOVLW       4
	MOVWF       _CENTINELA+0 
L__main50:
;dmtf.mbas,118 :: 		if DATO=8 then
	MOVF        _DATO+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
;dmtf.mbas,119 :: 		CENTINELA=5
	MOVLW       5
	MOVWF       _CENTINELA+0 
L__main53:
;dmtf.mbas,121 :: 		wend
	GOTO        L__main45
L__main46:
;dmtf.mbas,122 :: 		if CENTINELA=4 then
	MOVF        _CENTINELA+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
;dmtf.mbas,123 :: 		PORTA=3
	MOVLW       3
	MOVWF       PORTA+0 
;dmtf.mbas,124 :: 		CENTINELA=0
	CLRF        _CENTINELA+0 
L__main56:
;dmtf.mbas,126 :: 		if CENTINELA=5 then
	MOVF        _CENTINELA+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
;dmtf.mbas,127 :: 		PORTA=0
	CLRF        PORTA+0 
;dmtf.mbas,128 :: 		CENTINELA=0
	CLRF        _CENTINELA+0 
L__main59:
;dmtf.mbas,130 :: 		wend
	GOTO        L__main4
	GOTO        $+0
; end of _main
