
RTC_LCD_read_ds1307:

;RTC_LCD.mbas,43 :: 		sub function read_ds1307(dim address as byte) as byte
;RTC_LCD.mbas,44 :: 		I2C1_Start() ' iniciamos la comunicacion i2c
	CALL       _I2C1_Start+0
;RTC_LCD.mbas,45 :: 		I2C1_Wr(0xd0) ' Control de formato de byte
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,46 :: 		I2C1_Wr(address) ' direccion que se va a leer en ds1307
	MOVF       FARG_read_ds1307_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,47 :: 		I2C1_Repeated_Start()
	CALL       _I2C1_Repeated_Start+0
;RTC_LCD.mbas,48 :: 		I2C1_Wr(0xd1) ' Control de formato de byte + 1bit de lectura
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,49 :: 		v_dato=I2C1_Rd(0) ' devuelve el valor buscado en ds1307
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _v_dato+0
;RTC_LCD.mbas,50 :: 		I2C1_Stop() ' finalizamos la comunicacion i2c
	CALL       _I2C1_Stop+0
;RTC_LCD.mbas,51 :: 		result = v_dato
	MOVF       _v_dato+0, 0
	MOVWF      read_ds1307_local_result+0
	MOVF       read_ds1307_local_result+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_read_ds1307

RTC_LCD_BCD2_H:

;RTC_LCD.mbas,56 :: 		dim temp as byte       ' bcd = 0x17
;RTC_LCD.mbas,57 :: 		temp = bcd >> 4        ' temp = 0x01
	MOVF       FARG_BCD2_H_bcd+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
;RTC_LCD.mbas,58 :: 		result = temp or 0x30  ' result = 0x31
	MOVLW      48
	IORWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_BCD2_H

RTC_LCD_BCD2_L:

;RTC_LCD.mbas,63 :: 		dim temp as byte       ' bcd = 0x17
;RTC_LCD.mbas,64 :: 		temp = bcd and 0x0F    ' temp = 0x07
	MOVLW      15
	ANDWF      FARG_BCD2_L_bcd+0, 0
	MOVWF      R0+0
;RTC_LCD.mbas,65 :: 		result = temp or 0x30  ' result = 0x37
	MOVLW      48
	IORWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R0+0
	RETURN
; end of RTC_LCD_BCD2_L

RTC_LCD_DS1307_Write:

;RTC_LCD.mbas,70 :: 		sub procedure DS1307_Write(dim Addr, Dato as byte)
;RTC_LCD.mbas,71 :: 		I2C1_Start()  ' iniciamos la comunicacion i2c
	CALL       _I2C1_Start+0
;RTC_LCD.mbas,72 :: 		I2C1_Wr(0xd0) ' Control de formato de byte
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,73 :: 		I2C1_Wr(Addr) ' direccion que se va a leer
	MOVF       FARG_DS1307_Write_Addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,74 :: 		I2C1_Wr(Dato) ' dato que se va a escribir en el ds1307
	MOVF       FARG_DS1307_Write_Dato+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC_LCD.mbas,75 :: 		I2C1_Stop()   ' finalizamos la comunicacion i2c
	CALL       _I2C1_Stop+0
	RETURN
; end of RTC_LCD_DS1307_Write

RTC_LCD_set_rtc:

;RTC_LCD.mbas,79 :: 		sub procedure set_rtc()
;RTC_LCD.mbas,80 :: 		DS1307_Write(0, $00) ' asignamos los segundos
	CLRF       FARG_DS1307_Write_Addr+0
	CLRF       FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,81 :: 		DS1307_Write(1, $27) ' asignamos los minutos
	MOVLW      1
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      39
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,82 :: 		DS1307_Write(2, $23) ' asignamos los horas
	MOVLW      2
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      35
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,83 :: 		DS1307_Write(4, $09) ' asignamos los dia
	MOVLW      4
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      9
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,84 :: 		DS1307_Write(5, $09) ' asignamos los mes
	MOVLW      5
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      9
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,85 :: 		DS1307_Write(6, $15) ' asignamos los ano
	MOVLW      6
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      21
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
	RETURN
; end of RTC_LCD_set_rtc

_main:

;RTC_LCD.mbas,88 :: 		main:
;RTC_LCD.mbas,90 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;RTC_LCD.mbas,92 :: 		TRISB = 0X01 ' PORTB.0 entrada digital
	MOVLW      1
	MOVWF      TRISB+0
;RTC_LCD.mbas,93 :: 		PORTB = 0X00
	CLRF       PORTB+0
;RTC_LCD.mbas,95 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;RTC_LCD.mbas,96 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;RTC_LCD.mbas,98 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;RTC_LCD.mbas,100 :: 		I2C1_Init(100000) ' Fijamos la velocidad i2c a 100khz
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;RTC_LCD.mbas,102 :: 		Lcd_Init() ' inicializamos la pantalla lcd
	CALL       _Lcd_Init+0
;RTC_LCD.mbas,103 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,104 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC_LCD.mbas,105 :: 		Lcd_Out(1,6,"RELOJ") ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      74
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,107 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
	NOP
	NOP
;RTC_LCD.mbas,108 :: 		texto_fecha = "Fecha 00/00/00 " ' formato que se va a representar en la lcd
	MOVLW      _texto_fecha+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      47
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      47
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;RTC_LCD.mbas,109 :: 		texto_hora = "Hora  00:00:00 " ' formato que se va a representar en la lcd
	MOVLW      _texto_hora+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;RTC_LCD.mbas,111 :: 		DS1307_Write(0x07,0x90) ' SQW seteada a una frecuencia de 1hz
	MOVLW      7
	MOVWF      FARG_DS1307_Write_Addr+0
	MOVLW      144
	MOVWF      FARG_DS1307_Write_Dato+0
	CALL       RTC_LCD_DS1307_Write+0
;RTC_LCD.mbas,116 :: 		if EEPROM_Read(0xff) then
	MOVLW      255
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main9
;RTC_LCD.mbas,117 :: 		set_rtc() ' escribimos la hora a setear
	CALL       RTC_LCD_set_rtc+0
;RTC_LCD.mbas,118 :: 		EEPROM_Write(0xff,0x00) ' debido a se le cambia el valor de la memoria 0xff
	MOVLW      255
	MOVWF      FARG_EEPROM_Write_address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
L__main9:
;RTC_LCD.mbas,121 :: 		while true
L__main12:
;RTC_LCD.mbas,122 :: 		if portb.0 = 1 then
	BTFSS      PORTB+0, 0
	GOTO       L__main17
;RTC_LCD.mbas,123 :: 		Seg  = read_ds1307(0) ' leemos los segundos
	CLRF       FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Seg+0
;RTC_LCD.mbas,124 :: 		Min  = read_ds1307(1) ' leemos los minutos
	MOVLW      1
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Min+0
;RTC_LCD.mbas,125 :: 		Hora = read_ds1307(2) ' leemos los horas
	MOVLW      2
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Hora+0
;RTC_LCD.mbas,126 :: 		Dia  = read_ds1307(4) ' leemos los dias
	MOVLW      4
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Dia+0
;RTC_LCD.mbas,127 :: 		Mes  = read_ds1307(5) ' leemos los mes
	MOVLW      5
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Mes+0
;RTC_LCD.mbas,128 :: 		Year = read_ds1307(6) ' leemos los ano
	MOVLW      6
	MOVWF      FARG_read_ds1307_address+0
	CALL       RTC_LCD_read_ds1307+0
	MOVF       R0+0, 0
	MOVWF      _Year+0
L__main17:
;RTC_LCD.mbas,131 :: 		texto_fecha[6]  = BCD2_H(dia) ' tomamos la parte alta del valor dia
	MOVF       _Dia+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+6
;RTC_LCD.mbas,132 :: 		texto_fecha[7]  = BCD2_L(dia) ' tomamos la parte baja del valor dia
	MOVF       _Dia+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+7
;RTC_LCD.mbas,133 :: 		texto_fecha[8]  = "/"
	MOVLW      47
	MOVWF      _texto_fecha+8
;RTC_LCD.mbas,134 :: 		texto_fecha[9]  = BCD2_H(mes) ' tomamos la parte alta del valor mes
	MOVF       _Mes+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+9
;RTC_LCD.mbas,135 :: 		texto_fecha[10] = BCD2_L(mes) ' tomamos la parte baja del valor mes
	MOVF       _Mes+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+10
;RTC_LCD.mbas,136 :: 		texto_fecha[11] = "/"
	MOVLW      47
	MOVWF      _texto_fecha+11
;RTC_LCD.mbas,137 :: 		texto_fecha[12] = BCD2_H(year) ' tomamos la parte alta del valor ano
	MOVF       _Year+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+12
;RTC_LCD.mbas,138 :: 		texto_fecha[13] = BCD2_L(year) ' tomamos la parte baja del valor ano
	MOVF       _Year+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_fecha+13
;RTC_LCD.mbas,140 :: 		texto_hora[6] = BCD2_H(hora) ' tomamos la parte alta del valor hora
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+6
;RTC_LCD.mbas,141 :: 		texto_hora[7] = BCD2_L(hora) ' tomamos la parte baja del valor hora
	MOVF       _Hora+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+7
;RTC_LCD.mbas,142 :: 		texto_hora[8] = ":"
	MOVLW      58
	MOVWF      _texto_hora+8
;RTC_LCD.mbas,143 :: 		texto_hora[9] = BCD2_H(min) ' tomamos la parte alta del valor min
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+9
;RTC_LCD.mbas,144 :: 		texto_hora[10] = BCD2_L(min) ' tomamos la parte baja del valor min
	MOVF       _Min+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+10
;RTC_LCD.mbas,145 :: 		texto_hora[11] = ":"
	MOVLW      58
	MOVWF      _texto_hora+11
;RTC_LCD.mbas,146 :: 		texto_hora[12] = BCD2_H(seg) ' tomamos la parte alta del valor seg
	MOVF       _Seg+0, 0
	MOVWF      FARG_BCD2_H_bcd+0
	CALL       RTC_LCD_BCD2_H+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+12
;RTC_LCD.mbas,147 :: 		texto_hora[13] = BCD2_L(seg) ' tomamos la parte baja del valor seg
	MOVF       _Seg+0, 0
	MOVWF      FARG_BCD2_L_bcd+0
	CALL       RTC_LCD_BCD2_L+0
	MOVF       R0+0, 0
	MOVWF      _texto_hora+13
;RTC_LCD.mbas,149 :: 		Lcd_Out(1,1,texto_hora) ' Escribimos en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto_hora+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,150 :: 		Lcd_Out(2,1,texto_fecha) ' Escribimos en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto_fecha+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC_LCD.mbas,151 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
	NOP
;RTC_LCD.mbas,152 :: 		wend
	GOTO       L__main12
	GOTO       $+0
; end of _main
