
velocimetro_PULSO:

;velocimetro.mbas,24 :: 		SUB PROCEDURE PULSO()
;velocimetro.mbas,25 :: 		PORTC.3=1
	BSF        PORTC+0, 3
;velocimetro.mbas,26 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_velocimetro_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_velocimetro_PULSO1
	NOP
	NOP
;velocimetro.mbas,27 :: 		PORTC.3=0
	BCF        PORTC+0, 3
	RETURN
; end of velocimetro_PULSO

velocimetro_PULSO2:

;velocimetro.mbas,29 :: 		SUB PROCEDURE PULSO2()
;velocimetro.mbas,30 :: 		PORTB.4=1
	BSF        PORTB+0, 4
;velocimetro.mbas,31 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_velocimetro_PULSO23:
	DECFSZ     R13+0, 1
	GOTO       L_velocimetro_PULSO23
	NOP
	NOP
;velocimetro.mbas,32 :: 		PORTB.4=0
	BCF        PORTB+0, 4
	RETURN
; end of velocimetro_PULSO2

_main:

;velocimetro.mbas,35 :: 		main:
;velocimetro.mbas,37 :: 		OPTION_REG=%10000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      134
	MOVWF      OPTION_REG+0
;velocimetro.mbas,40 :: 		OSCCON = 0X65 ' Oscilador interno de 4mhz
	MOVLW      101
	MOVWF      OSCCON+0
;velocimetro.mbas,42 :: 		TRISB = 0X20 ' PORTB salidas
	MOVLW      32
	MOVWF      TRISB+0
;velocimetro.mbas,43 :: 		PORTB = 0X00
	CLRF       PORTB+0
;velocimetro.mbas,45 :: 		TRISC = 0X50 '
	MOVLW      80
	MOVWF      TRISC+0
;velocimetro.mbas,46 :: 		PORTC = 0X00
	CLRF       PORTC+0
;velocimetro.mbas,48 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;velocimetro.mbas,49 :: 		PORTE = 0X00
	CLRF       PORTE+0
;velocimetro.mbas,51 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;velocimetro.mbas,52 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;velocimetro.mbas,53 :: 		FLANCO=0
	CLRF       _FLANCO+0
;velocimetro.mbas,54 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;velocimetro.mbas,55 :: 		MOSTRAR=0
	CLRF       _MOSTRAR+0
;velocimetro.mbas,56 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;velocimetro.mbas,57 :: 		CONTADOR2=0
	CLRF       _CONTADOR2+0
	CLRF       _CONTADOR2+1
;velocimetro.mbas,58 :: 		ENA =0
	CLRF       _ENA+0
;velocimetro.mbas,59 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;velocimetro.mbas,60 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;velocimetro.mbas,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;velocimetro.mbas,62 :: 		Lcd_Out(1,2,"ESPOL")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
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
;velocimetro.mbas,63 :: 		Lcd_Out(2,2,"FIMCBOR")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
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
;velocimetro.mbas,64 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main5:
	DECFSZ     R13+0, 1
	GOTO       L__main5
	DECFSZ     R12+0, 1
	GOTO       L__main5
	DECFSZ     R11+0, 1
	GOTO       L__main5
	NOP
	NOP
;velocimetro.mbas,65 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;velocimetro.mbas,66 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;velocimetro.mbas,67 :: 		Lcd_Out(2,1,"T[s]")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;velocimetro.mbas,68 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;velocimetro.mbas,70 :: 		WHILE(1)
L__main7:
;velocimetro.mbas,71 :: 		if ENA=0 then
	MOVF       _ENA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
;velocimetro.mbas,72 :: 		PULSO()
	CALL       velocimetro_PULSO+0
;velocimetro.mbas,73 :: 		DO
L__main14:
;velocimetro.mbas,74 :: 		IF(PORTC.4=1)THEN'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSS      PORTC+0, 4
	GOTO       L__main20
;velocimetro.mbas,75 :: 		TMR0=0
	CLRF       TMR0+0
;velocimetro.mbas,76 :: 		FLANCO=1
	MOVLW      1
	MOVWF      _FLANCO+0
L__main20:
;velocimetro.mbas,78 :: 		LOOP UNTIL(FLANCO=1)
	MOVF       _FLANCO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main17
	GOTO       L__main14
L__main17:
;velocimetro.mbas,79 :: 		DO
L__main22:
;velocimetro.mbas,80 :: 		IF(PORTC.4=0)THEN 'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSC      PORTC+0, 4
	GOTO       L__main28
;velocimetro.mbas,81 :: 		TIEMPO=TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;velocimetro.mbas,82 :: 		FLANCO=0
	CLRF       _FLANCO+0
L__main28:
;velocimetro.mbas,84 :: 		LOOP UNTIL(FLANCO=0)
	MOVF       _FLANCO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main25
	GOTO       L__main22
L__main25:
;velocimetro.mbas,85 :: 		DISTANCIA=(TIEMPO*128)/58 'DISTANCIA EN cm
	MOVF       _TIEMPO+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVLW      7
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main66:
	BTFSC      STATUS+0, 2
	GOTO       L__main67
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main66
L__main67:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
L__main12:
;velocimetro.mbas,89 :: 		PULSO2()
	CALL       velocimetro_PULSO2+0
;velocimetro.mbas,90 :: 		DO
L__main30:
;velocimetro.mbas,91 :: 		IF(PORTB.5=1)THEN'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSS      PORTB+0, 5
	GOTO       L__main36
;velocimetro.mbas,92 :: 		TMR0=0
	CLRF       TMR0+0
;velocimetro.mbas,93 :: 		FLANCO=1
	MOVLW      1
	MOVWF      _FLANCO+0
L__main36:
;velocimetro.mbas,95 :: 		LOOP UNTIL(FLANCO=1)
	MOVF       _FLANCO+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main33
	GOTO       L__main30
L__main33:
;velocimetro.mbas,96 :: 		DO
L__main38:
;velocimetro.mbas,97 :: 		IF(PORTB.5=0)THEN 'DETECTO FLANCO SUBIDA ECHO PULSE
	BTFSC      PORTB+0, 5
	GOTO       L__main44
;velocimetro.mbas,98 :: 		TIEMPO=TMR0
	MOVF       TMR0+0, 0
	MOVWF      _TIEMPO+0
;velocimetro.mbas,99 :: 		FLANCO=0
	CLRF       _FLANCO+0
L__main44:
;velocimetro.mbas,101 :: 		LOOP UNTIL(FLANCO=0)
	MOVF       _FLANCO+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main41
	GOTO       L__main38
L__main41:
;velocimetro.mbas,102 :: 		DISTANCIA2=(TIEMPO*128)/58 'DISTANCIA EN cm
	MOVF       _TIEMPO+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVLW      7
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main68:
	BTFSC      STATUS+0, 2
	GOTO       L__main69
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main68
L__main69:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA2+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA2+1
;velocimetro.mbas,103 :: 		if DISTANCIA < 50 then
	MOVLW      0
	SUBWF      _DISTANCIA+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      50
	SUBWF      _DISTANCIA+0, 0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L__main47
;velocimetro.mbas,104 :: 		ENA=1
	MOVLW      1
	MOVWF      _ENA+0
;velocimetro.mbas,105 :: 		CENTINELA=1
	MOVLW      1
	MOVWF      _CENTINELA+0
;velocimetro.mbas,106 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;velocimetro.mbas,107 :: 		Lcd_Out(1,1,"S1")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      49
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main47:
;velocimetro.mbas,109 :: 		if (DISTANCIA2 < 40) AND (CENTINELA=1) then
	MOVLW      0
	SUBWF      _DISTANCIA2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      40
	SUBWF      _DISTANCIA2+0, 0
L__main71:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CENTINELA+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main50
;velocimetro.mbas,110 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;velocimetro.mbas,111 :: 		MOSTRAR=1
	MOVLW      1
	MOVWF      _MOSTRAR+0
;velocimetro.mbas,112 :: 		PORTB.RB7=1
	BSF        PORTB+0, 7
;velocimetro.mbas,113 :: 		Lcd_Out(1,7,"S2")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      50
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;velocimetro.mbas,114 :: 		UART1_Write_Text("TIEMPO= ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;velocimetro.mbas,115 :: 		WordToStr(CONTADOR2,TEXT)
	MOVF       _CONTADOR2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;velocimetro.mbas,116 :: 		UART1_Write_Text(TEXT)
	MOVLW      _TEXT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;velocimetro.mbas,117 :: 		UART1_Write_Text(":")
	MOVLW      58
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;velocimetro.mbas,118 :: 		WordToStr(CONTADOR,TEXT)
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;velocimetro.mbas,119 :: 		UART1_Write_Text(TEXT)
	MOVLW      _TEXT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;velocimetro.mbas,120 :: 		UART1_Write_Text(" Segundos")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;velocimetro.mbas,121 :: 		while 1
L__main53:
;velocimetro.mbas,123 :: 		wend
	GOTO       L__main53
L__main50:
;velocimetro.mbas,125 :: 		if CENTINELA=1  then
	MOVF       _CENTINELA+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main58
;velocimetro.mbas,126 :: 		CONTADOR= CONTADOR+1
	INCF       _CONTADOR+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR+1, 1
;velocimetro.mbas,127 :: 		if (CONTADOR=30)or(CONTADOR=60)or(CONTADOR=90) then
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      30
	XORWF      _CONTADOR+0, 0
L__main72:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      60
	XORWF      _CONTADOR+0, 0
L__main73:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      90
	XORWF      _CONTADOR+0, 0
L__main74:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main61
;velocimetro.mbas,128 :: 		CONTADOR2= CONTADOR2+1
	INCF       _CONTADOR2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR2+1, 1
L__main61:
;velocimetro.mbas,130 :: 		if CONTADOR=90 then
	MOVLW      0
	XORWF      _CONTADOR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      90
	XORWF      _CONTADOR+0, 0
L__main75:
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;velocimetro.mbas,131 :: 		CONTADOR=0
	CLRF       _CONTADOR+0
	CLRF       _CONTADOR+1
;velocimetro.mbas,132 :: 		CONTADOR2= CONTADOR2+1
	INCF       _CONTADOR2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONTADOR2+1, 1
L__main64:
;velocimetro.mbas,134 :: 		WordToStr(CONTADOR,TEXT)
	MOVF       _CONTADOR+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;velocimetro.mbas,135 :: 		Lcd_Out(2,12,TEXT)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXT+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;velocimetro.mbas,136 :: 		WordToStr(CONTADOR2,TEXT)
	MOVF       _CONTADOR2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _CONTADOR2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _TEXT+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;velocimetro.mbas,137 :: 		Lcd_Out(2,7,TEXT)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXT+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;velocimetro.mbas,138 :: 		Lcd_Out(2,13,":")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      58
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L__main58:
;velocimetro.mbas,141 :: 		WEND
	GOTO       L__main7
	GOTO       $+0
; end of _main
