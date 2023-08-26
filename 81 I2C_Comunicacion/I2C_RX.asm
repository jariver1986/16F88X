
_main:

;I2C_RX.mbas,20 :: 		main:
;I2C_RX.mbas,21 :: 		ANSEL  = 0               ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;I2C_RX.mbas,22 :: 		ANSELH = 0
	CLRF       ANSELH+0
;I2C_RX.mbas,23 :: 		PORTB = 0
	CLRF       PORTB+0
;I2C_RX.mbas,24 :: 		TRISB = 0                ' Configure PORTB as output
	CLRF       TRISB+0
;I2C_RX.mbas,32 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;I2C_RX.mbas,33 :: 		RX_I2C=0
	CLRF       _RX_I2C+0
;I2C_RX.mbas,35 :: 		I2C1_Init(100000)        ' initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2C_RX.mbas,36 :: 		I2C1_Start()             ' issue I2C start signal
	CALL       _I2C1_Start+0
;I2C_RX.mbas,38 :: 		txt3 = "SISTEMAS"
	MOVLW      _txt3+0
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;I2C_RX.mbas,39 :: 		txt4 = "EMBEBIDOS"
	MOVLW      _txt4+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;I2C_RX.mbas,40 :: 		pos=1
	MOVLW      1
	MOVWF      _pos+0
;I2C_RX.mbas,41 :: 		fil=1
	MOVLW      1
	MOVWF      _fil+0
;I2C_RX.mbas,43 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;I2C_RX.mbas,44 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;I2C_RX.mbas,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;I2C_RX.mbas,46 :: 		Lcd_Out(1,4,txt3)                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;I2C_RX.mbas,47 :: 		Lcd_Out(2,4,txt4)                 ' escribe la cadena en la segunda fila
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;I2C_RX.mbas,48 :: 		Delay_ms(2000)
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
;I2C_RX.mbas,49 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;I2C_RX.mbas,53 :: 		while (1)
L__main3:
;I2C_RX.mbas,59 :: 		RX_I2C = I2C1_Rd(0)       ' Read the data (NO acknowledge)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _RX_I2C+0
;I2C_RX.mbas,60 :: 		PORTB =  RX_I2C
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;I2C_RX.mbas,62 :: 		if  isalpha(RX_I2C) or isalnum(RX_I2C)or(RX_I2C=$23)or(RX_I2C=$24)  then
	MOVF       R0+0, 0
	MOVWF      FARG_isalpha_character+0
	CALL       _isalpha+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       _RX_I2C+0, 0
	MOVWF      FARG_isalnum_character+0
	CALL       _isalnum+0
	MOVF       R0+0, 0
	IORWF      FLOC__main+0, 0
	MOVWF      R1+0
	MOVF       _RX_I2C+0, 0
	XORLW      35
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVF       _RX_I2C+0, 0
	XORLW      36
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main8
;I2C_RX.mbas,63 :: 		UART1_Write(RX_I2C)
	MOVF       _RX_I2C+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;I2C_RX.mbas,64 :: 		Lcd_CHR(fil,pos,RX_I2C)
	MOVF       _fil+0, 0
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVF       _pos+0, 0
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _RX_I2C+0, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;I2C_RX.mbas,65 :: 		inc(pos)
	INCF       _pos+0, 1
;I2C_RX.mbas,66 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
L__main8:
;I2C_RX.mbas,68 :: 		if pos=11 then
	MOVF       _pos+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L__main12
;I2C_RX.mbas,69 :: 		pos=1
	MOVLW      1
	MOVWF      _pos+0
;I2C_RX.mbas,70 :: 		fil=2
	MOVLW      2
	MOVWF      _fil+0
L__main12:
;I2C_RX.mbas,74 :: 		Delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	DECFSZ     R11+0, 1
	GOTO       L__main14
	NOP
	NOP
;I2C_RX.mbas,75 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
