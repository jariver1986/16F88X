
rtc_read_ds1307:

;rtc.mbas,30 :: 		dim temp as byte
;rtc.mbas,31 :: 		I2C1_Start()
	CALL       _I2C1_Start+0
;rtc.mbas,32 :: 		I2C1_Wr(0xD0)
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,33 :: 		I2C1_Wr(address)
	MOVF       FARG_read_ds1307_ADDRESS+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,34 :: 		I2C1_Repeated_Start()
	CALL       _I2C1_Repeated_Start+0
;rtc.mbas,35 :: 		I2C1_Wr(0xD1)
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,36 :: 		temp = I2C1_Rd(0)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
;rtc.mbas,37 :: 		I2C1_Stop()
	CALL       _I2C1_Stop+0
	RETURN
; end of rtc_read_ds1307

rtc_LECTURA:

;rtc.mbas,40 :: 		sub procedure LECTURA
;rtc.mbas,41 :: 		I2C1_Start()
	CALL       _I2C1_Start+0
;rtc.mbas,42 :: 		I2C1_Wr(0xD0)
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,43 :: 		I2C1_Wr(0)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,44 :: 		I2C1_Repeated_Start()
	CALL       _I2C1_Repeated_Start+0
;rtc.mbas,45 :: 		I2C1_Wr(0xD1)
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,46 :: 		temp = I2C1_Rd(0)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _TEMP+0
	CLRF       _TEMP+1
;rtc.mbas,47 :: 		I2C1_Stop()
	CALL       _I2C1_Stop+0
	RETURN
; end of rtc_LECTURA

rtc_write_ds1307:

;rtc.mbas,51 :: 		sub procedure write_ds1307(dim  ADDRESS as byte, dim w_data as byte)
;rtc.mbas,53 :: 		I2C1_Start()
	CALL       _I2C1_Start+0
;rtc.mbas,54 :: 		I2C1_Wr(0xD0)
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,55 :: 		I2C1_Wr(address)
	MOVF       FARG_write_ds1307_ADDRESS+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,56 :: 		I2C1_Wr(w_data)
	MOVF       FARG_write_ds1307_w_data+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.mbas,57 :: 		I2C1_Stop()
	CALL       _I2C1_Stop+0
;rtc.mbas,58 :: 		PORTA=TEMP
	MOVF       _TEMP+0, 0
	MOVWF      PORTA+0
	RETURN
; end of rtc_write_ds1307

_main:

;rtc.mbas,61 :: 		main:
;rtc.mbas,62 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;rtc.mbas,63 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;rtc.mbas,64 :: 		PORTA = %00000000
	CLRF       PORTA+0
;rtc.mbas,65 :: 		TRISA = %00000000
	CLRF       TRISA+0
;rtc.mbas,66 :: 		PORTB = %00000000
	CLRF       PORTB+0
;rtc.mbas,67 :: 		TRISB = %01110011  ' BOTONERAS RB4 RB5 RB6 Y SENSORES RB0 RB1
	MOVLW      115
	MOVWF      TRISB+0
;rtc.mbas,68 :: 		PORTC = %00000000
	CLRF       PORTC+0
;rtc.mbas,69 :: 		TRISC = %00000000
	CLRF       TRISC+0
;rtc.mbas,70 :: 		PORTD = %00000000
	CLRF       PORTD+0
;rtc.mbas,71 :: 		TRISD = %00000000
	CLRF       TRISD+0
;rtc.mbas,72 :: 		PORTE = %00000000
	CLRF       PORTE+0
;rtc.mbas,73 :: 		TRISE = %00000000
	CLRF       TRISE+0
;rtc.mbas,74 :: 		ANSEL = %00000000
	CLRF       ANSEL+0
;rtc.mbas,75 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;rtc.mbas,76 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;rtc.mbas,77 :: 		i2c1_init(100000)
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;rtc.mbas,78 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;rtc.mbas,79 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rtc.mbas,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rtc.mbas,81 :: 		Lcd_Out(1,1,"ESPOL")
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
;rtc.mbas,82 :: 		Lcd_Out(2,1,"TESIS")
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
;rtc.mbas,83 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main4:
	DECFSZ     R13+0, 1
	GOTO       L__main4
	DECFSZ     R12+0, 1
	GOTO       L__main4
	DECFSZ     R11+0, 1
	GOTO       L__main4
	NOP
;rtc.mbas,85 :: 		Lcd_Out(1,1,"PROYECTO")
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
;rtc.mbas,86 :: 		Lcd_Out(2,1,"CONTADOR")
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
;rtc.mbas,87 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main5:
	DECFSZ     R13+0, 1
	GOTO       L__main5
	DECFSZ     R12+0, 1
	GOTO       L__main5
	DECFSZ     R11+0, 1
	GOTO       L__main5
	NOP
;rtc.mbas,88 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rtc.mbas,91 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rtc.mbas,92 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
	NOP
;rtc.mbas,93 :: 		Lcd_Out(1,1,"ENTRADA:")
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
;rtc.mbas,94 :: 		Lcd_Out(2,1,"SALIDA:")
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
;rtc.mbas,95 :: 		ENTRADAS =0
	CLRF       _ENTRADAS+0
	CLRF       _ENTRADAS+1
	CLRF       _ENTRADAS+2
	CLRF       _ENTRADAS+3
;rtc.mbas,96 :: 		SALIDAS=0
	CLRF       _SALIDAS+0
	CLRF       _SALIDAS+1
	CLRF       _SALIDAS+2
	CLRF       _SALIDAS+3
;rtc.mbas,97 :: 		while 1
L__main8:
;rtc.mbas,98 :: 		LECTURA
	CALL       rtc_LECTURA+0
;rtc.mbas,101 :: 		wend
	GOTO       L__main8
	GOTO       $+0
; end of _main
