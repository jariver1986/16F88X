
t_lcd_serial_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;t_lcd_serial.mbas,24 :: 		sub procedure interrupt
;t_lcd_serial.mbas,28 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_t_lcd_serial_interrupt2
;t_lcd_serial.mbas,29 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;t_lcd_serial.mbas,31 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;t_lcd_serial.mbas,33 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt7
;t_lcd_serial.mbas,34 :: 		if dato_recep = 0X54 then ' I
	MOVF       _dato_recep+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt9
;t_lcd_serial.mbas,35 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_t_lcd_serial_interrupt10
;t_lcd_serial.mbas,36 :: 		else
L_t_lcd_serial_interrupt9:
;t_lcd_serial.mbas,37 :: 		viajero = 0
	CLRF       _viajero+0
;t_lcd_serial.mbas,38 :: 		end if
L_t_lcd_serial_interrupt10:
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt7:
;t_lcd_serial.mbas,39 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt13
;t_lcd_serial.mbas,40 :: 		if dato_recep = 0X3D then ' ide temp
	MOVF       _dato_recep+0, 0
	XORLW      61
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt15
;t_lcd_serial.mbas,41 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_t_lcd_serial_interrupt16
;t_lcd_serial.mbas,42 :: 		else
L_t_lcd_serial_interrupt15:
;t_lcd_serial.mbas,43 :: 		viajero = 0
	CLRF       _viajero+0
;t_lcd_serial.mbas,44 :: 		end if
L_t_lcd_serial_interrupt16:
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt13:
;t_lcd_serial.mbas,45 :: 		case 2 ' display 1
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt19
;t_lcd_serial.mbas,46 :: 		temp1 = dato_recep
	MOVF       _dato_recep+0, 0
	MOVWF      _temp1+0
;t_lcd_serial.mbas,47 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt19:
;t_lcd_serial.mbas,48 :: 		case 3 ' display 2
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt22
;t_lcd_serial.mbas,49 :: 		temp2 = dato_recep
	MOVF       _dato_recep+0, 0
	MOVWF      _temp2+0
;t_lcd_serial.mbas,50 :: 		viajero = 4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt22:
;t_lcd_serial.mbas,51 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt25
;t_lcd_serial.mbas,52 :: 		temp3 = dato_recep
	MOVF       _dato_recep+0, 0
	MOVWF      _temp3+0
;t_lcd_serial.mbas,53 :: 		viajero = 5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt25:
;t_lcd_serial.mbas,54 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt28
;t_lcd_serial.mbas,55 :: 		if dato_recep = 0X46 then    'FARENHEIT
	MOVF       _dato_recep+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt30
;t_lcd_serial.mbas,56 :: 		viajero= 0
	CLRF       _viajero+0
;t_lcd_serial.mbas,57 :: 		datos_set= 0xFF
	MOVLW      255
	MOVWF      _datos_set+0
;t_lcd_serial.mbas,58 :: 		turno=1
	MOVLW      1
	MOVWF      _turno+0
	GOTO       L_t_lcd_serial_interrupt31
;t_lcd_serial.mbas,59 :: 		else
L_t_lcd_serial_interrupt30:
;t_lcd_serial.mbas,60 :: 		if dato_recep = 0X43 then  'CELCIUS
	MOVF       _dato_recep+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt33
;t_lcd_serial.mbas,61 :: 		viajero= 0
	CLRF       _viajero+0
;t_lcd_serial.mbas,62 :: 		datos_set= 0xFF
	MOVLW      255
	MOVWF      _datos_set+0
;t_lcd_serial.mbas,63 :: 		turno=2
	MOVLW      2
	MOVWF      _turno+0
	GOTO       L_t_lcd_serial_interrupt34
;t_lcd_serial.mbas,64 :: 		else
L_t_lcd_serial_interrupt33:
;t_lcd_serial.mbas,65 :: 		if dato_recep = 0X43 then  'KELVIN
	MOVF       _dato_recep+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_t_lcd_serial_interrupt36
;t_lcd_serial.mbas,66 :: 		viajero= 0
	CLRF       _viajero+0
;t_lcd_serial.mbas,67 :: 		datos_set= 0xFF
	MOVLW      255
	MOVWF      _datos_set+0
;t_lcd_serial.mbas,68 :: 		turno=3
	MOVLW      3
	MOVWF      _turno+0
	GOTO       L_t_lcd_serial_interrupt37
;t_lcd_serial.mbas,69 :: 		else
L_t_lcd_serial_interrupt36:
;t_lcd_serial.mbas,70 :: 		viajero=0
	CLRF       _viajero+0
;t_lcd_serial.mbas,71 :: 		end if
L_t_lcd_serial_interrupt37:
;t_lcd_serial.mbas,73 :: 		end if
L_t_lcd_serial_interrupt34:
;t_lcd_serial.mbas,75 :: 		end if
L_t_lcd_serial_interrupt31:
	GOTO       L_t_lcd_serial_interrupt4
L_t_lcd_serial_interrupt28:
L_t_lcd_serial_interrupt4:
;t_lcd_serial.mbas,76 :: 		end select
L_t_lcd_serial_interrupt2:
;t_lcd_serial.mbas,78 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;t_lcd_serial.mbas,79 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;t_lcd_serial.mbas,80 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_t_lcd_serial_interrupt90:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of t_lcd_serial_interrupt

t_lcd_serial_numeritos:

;t_lcd_serial.mbas,82 :: 		sub procedure numeritos()
;t_lcd_serial.mbas,83 :: 		temporal1=0x0F
	MOVLW      15
	MOVWF      _temporal1+0
;t_lcd_serial.mbas,84 :: 		temporal2=temporal1 and temp1
	MOVLW      15
	ANDWF      _temp1+0, 0
	MOVWF      R4+0
	MOVF       R4+0, 0
	MOVWF      _temporal2+0
;t_lcd_serial.mbas,85 :: 		temperatura1=temporal2
	MOVF       R4+0, 0
	MOVWF      _temperatura1+0
;t_lcd_serial.mbas,86 :: 		temporal2=temporal1 and temp2
	MOVLW      15
	ANDWF      _temp2+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _temporal2+0
;t_lcd_serial.mbas,87 :: 		temperatura2=temporal2
	MOVF       R0+0, 0
	MOVWF      _temperatura2+0
;t_lcd_serial.mbas,88 :: 		temporal2=temporal1 and temp3
	MOVLW      15
	ANDWF      _temp3+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _temporal2+0
;t_lcd_serial.mbas,89 :: 		temperatura3=temporal2
	MOVF       R0+0, 0
	MOVWF      _temperatura3+0
;t_lcd_serial.mbas,90 :: 		temperatura=(temperatura1*100)+(temperatura2*10)+temperatura3 'variables luminosidad y temperatura son convertidas a decimal por igual
	MOVLW      100
	MOVWF      R0+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC_t_lcd_serial_numeritos+0
	MOVF       _temperatura2+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	ADDWF      FLOC_t_lcd_serial_numeritos+0, 0
	MOVWF      _temperatura+0
	MOVF       _temperatura3+0, 0
	ADDWF      _temperatura+0, 1
	RETURN
; end of t_lcd_serial_numeritos

t_lcd_serial_IMPRIME:

;t_lcd_serial.mbas,92 :: 		sub procedure IMPRIME()
;t_lcd_serial.mbas,94 :: 		WordToStrWithZeros(TempC, text)
	MOVF       _TempC+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _TempC+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;t_lcd_serial.mbas,96 :: 		Lcd_Chr(2, 4, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,97 :: 		Lcd_Chr(2, 5, text[3])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+3, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,98 :: 		Lcd_Chr(2, 6, text[4])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+4, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,99 :: 		Lcd_Chr(2, 7, ".")
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,101 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,102 :: 		UART1_Write(text[3])
	MOVF       _text+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,103 :: 		UART1_Write(text[4])
	MOVF       _text+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,104 :: 		UART1_Write(".")
	MOVLW      46
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,107 :: 		WordToStrWithZeros(comma, text)
	MOVF       _comma+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       _comma+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _text+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;t_lcd_serial.mbas,109 :: 		Lcd_Chr(2, 8, text[1])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,110 :: 		Lcd_Chr(2, 9, text[2])
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVF       _text+2, 0
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,112 :: 		UART1_Write(text[1])
	MOVF       _text+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,113 :: 		UART1_Write(text[2])
	MOVF       _text+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,114 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,115 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,117 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_t_lcd_serial_IMPRIME40:
	DECFSZ     R13+0, 1
	GOTO       L_t_lcd_serial_IMPRIME40
	DECFSZ     R12+0, 1
	GOTO       L_t_lcd_serial_IMPRIME40
	DECFSZ     R11+0, 1
	GOTO       L_t_lcd_serial_IMPRIME40
	NOP
	NOP
;t_lcd_serial.mbas,118 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	RETURN
; end of t_lcd_serial_IMPRIME

_main:

;t_lcd_serial.mbas,123 :: 		main:
;t_lcd_serial.mbas,124 :: 		OPTION_REG = 0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;t_lcd_serial.mbas,126 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;t_lcd_serial.mbas,128 :: 		INTCON = 0XE0 ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;t_lcd_serial.mbas,131 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;t_lcd_serial.mbas,132 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;t_lcd_serial.mbas,134 :: 		TRISA = 0X00 ' porta.5 como entrada digital
	CLRF       TRISA+0
;t_lcd_serial.mbas,135 :: 		PORTA = 0X00
	CLRF       PORTA+0
;t_lcd_serial.mbas,137 :: 		TRISC = 0X00 ' porta.5 como entrada digital
	CLRF       TRISC+0
;t_lcd_serial.mbas,138 :: 		PORTC = 0X00
	CLRF       PORTC+0
;t_lcd_serial.mbas,140 :: 		TRISB = 0X00 ' porta.5 como entrada digital
	CLRF       TRISB+0
;t_lcd_serial.mbas,141 :: 		PORTB = 0X00
	CLRF       PORTB+0
;t_lcd_serial.mbas,146 :: 		TRISE = 0X08 ' porta.5 como entrada digital
	MOVLW      8
	MOVWF      TRISE+0
;t_lcd_serial.mbas,147 :: 		PORTE = 0X00
	CLRF       PORTE+0
;t_lcd_serial.mbas,150 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;t_lcd_serial.mbas,152 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;t_lcd_serial.mbas,153 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;t_lcd_serial.mbas,154 :: 		text = "000.0000" ' formato del texto a mostrar
	MOVLW      _text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;t_lcd_serial.mbas,155 :: 		delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main42:
	DECFSZ     R13+0, 1
	GOTO       L__main42
	DECFSZ     R12+0, 1
	GOTO       L__main42
	DECFSZ     R11+0, 1
	GOTO       L__main42
	NOP
	NOP
;t_lcd_serial.mbas,156 :: 		Lcd_Init() ' inicializamos la lcd
	CALL       _Lcd_Init+0
;t_lcd_serial.mbas,157 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,158 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,159 :: 		Lcd_Out(1, 1, " Espol        ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,160 :: 		Lcd_Out(2, 1, " DS18B20      ") ' lo que se va a mostrar en la linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,161 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main43:
	DECFSZ     R13+0, 1
	GOTO       L__main43
	DECFSZ     R12+0, 1
	GOTO       L__main43
	DECFSZ     R11+0, 1
	GOTO       L__main43
	NOP
	NOP
;t_lcd_serial.mbas,162 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,163 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,164 :: 		Lcd_Out(1, 1, " Sensor de    ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
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
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,165 :: 		Lcd_Out(2, 1, " Temperatura: ") ' lo que se va a mostrar en la linea 1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      117
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      58
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
;t_lcd_serial.mbas,166 :: 		delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	DECFSZ     R11+0, 1
	GOTO       L__main44
	NOP
	NOP
;t_lcd_serial.mbas,167 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,169 :: 		datos_set  =0
	CLRF       _datos_set+0
;t_lcd_serial.mbas,170 :: 		dato_recep =0
	CLRF       _dato_recep+0
;t_lcd_serial.mbas,171 :: 		viajero    =0
	CLRF       _viajero+0
;t_lcd_serial.mbas,172 :: 		TURNO=2
	MOVLW      2
	MOVWF      _turno+0
;t_lcd_serial.mbas,174 :: 		while (TRUE)
L__main46:
;t_lcd_serial.mbas,178 :: 		if(centinela>temperatura)then
	MOVF       _centinela+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVF       _centinela+0, 0
	SUBWF      _temperatura+0, 0
L__main91:
	BTFSC      STATUS+0, 0
	GOTO       L__main51
;t_lcd_serial.mbas,179 :: 		Lcd_Out(1, 1, "Ventilador      ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,180 :: 		Lcd_Out(2, 1, "Encendido       ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,181 :: 		UART1_Write_Text("Ventilador encendido")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;t_lcd_serial.mbas,182 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,183 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,184 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;t_lcd_serial.mbas,185 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main53:
	DECFSZ     R13+0, 1
	GOTO       L__main53
	DECFSZ     R12+0, 1
	GOTO       L__main53
	DECFSZ     R11+0, 1
	GOTO       L__main53
	NOP
	NOP
;t_lcd_serial.mbas,186 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L__main52
;t_lcd_serial.mbas,188 :: 		else
L__main51:
;t_lcd_serial.mbas,189 :: 		Lcd_Out(1, 1, "Ventilador      ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,190 :: 		Lcd_Out(2, 1, "Apagado         ")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,191 :: 		UART1_Write_Text("Ventilador apagado")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      112
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;t_lcd_serial.mbas,192 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,193 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,194 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;t_lcd_serial.mbas,195 :: 		Delay_ms(1000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main54:
	DECFSZ     R13+0, 1
	GOTO       L__main54
	DECFSZ     R12+0, 1
	GOTO       L__main54
	DECFSZ     R11+0, 1
	GOTO       L__main54
	NOP
	NOP
;t_lcd_serial.mbas,196 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,198 :: 		end if
L__main52:
;t_lcd_serial.mbas,200 :: 		if(datos_set=0xFF)then
	MOVF       _datos_set+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__main56
;t_lcd_serial.mbas,201 :: 		numeritos()
	CALL       t_lcd_serial_numeritos+0
;t_lcd_serial.mbas,203 :: 		UART1_Write(0x54) ' I
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,204 :: 		UART1_Write(0x3D) ' IDE  T
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,205 :: 		UART1_Write(temp1) ' centenas
	MOVF       _temp1+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,206 :: 		UART1_Write(temp2) ' decenas
	MOVF       _temp2+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,207 :: 		UART1_Write(temp3) 'unidades
	MOVF       _temp3+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,208 :: 		UART1_Write(0x46) ' FIN DE CADENA
	MOVLW      70
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,209 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,210 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;t_lcd_serial.mbas,211 :: 		Delay_ms(50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main58:
	DECFSZ     R13+0, 1
	GOTO       L__main58
	DECFSZ     R12+0, 1
	GOTO       L__main58
	NOP
	NOP
;t_lcd_serial.mbas,212 :: 		datos_set=0x00
	CLRF       _datos_set+0
L__main56:
;t_lcd_serial.mbas,215 :: 		if ow_reset(PORTC, 0) = 0 then ' senal de reset onewire
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      0
	XORWF      R0+0, 0
L__main92:
	BTFSS      STATUS+0, 2
	GOTO       L__main60
;t_lcd_serial.mbas,217 :: 		ow_write(PORTC, 0, 0xCC) ' pase rom
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;t_lcd_serial.mbas,218 :: 		ow_write(PORTC, 0, 0x44) ' convertir a t
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      68
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;t_lcd_serial.mbas,219 :: 		delay_us(100)
	MOVLW      66
	MOVWF      R13+0
L__main62:
	DECFSZ     R13+0, 1
	GOTO       L__main62
	NOP
;t_lcd_serial.mbas,220 :: 		ow_reset(PORTC, 0) ' 0 = presente, 1= no presente
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;t_lcd_serial.mbas,221 :: 		ow_write(PORTC, 0, 0xCC) ' pase rom
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      204
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;t_lcd_serial.mbas,222 :: 		ow_write(PORTC, 0, 0xBE) ' leer a SCRATCHPAD
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Write_port+0
	CLRF       FARG_Ow_Write_pin+0
	MOVLW      190
	MOVWF      FARG_Ow_Write_data_+0
	CALL       _Ow_Write+0
;t_lcd_serial.mbas,223 :: 		j1 = ow_Read(PORTC, 0) ' leer parte baja
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j1+0
;t_lcd_serial.mbas,224 :: 		j2 = ow_Read(PORTC, 0) ' leer parte alta
	MOVLW      PORTC+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      _j2+0
;t_lcd_serial.mbas,225 :: 		minus = j2
	MOVF       R0+0, 0
	MOVWF      _minus+0
;t_lcd_serial.mbas,226 :: 		minus = minus >> 3
	MOVF       R0+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	MOVWF      _minus+0
;t_lcd_serial.mbas,227 :: 		if minus = 0x1F then ' chequeamos la temperatura (+ o -)
	MOVF       R1+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;t_lcd_serial.mbas,228 :: 		j2 = not j2
	COMF       _j2+0, 1
;t_lcd_serial.mbas,229 :: 		j1 = not j1
	COMF       _j1+0, 1
;t_lcd_serial.mbas,230 :: 		j1 = j1 + 1
	INCF       _j1+0, 1
L__main64:
;t_lcd_serial.mbas,232 :: 		Raw_temp = (j2 << 8) or j1 ' obteniendo la data raw
	MOVF       _j2+0, 0
	MOVWF      _Raw_temp+1
	CLRF       _Raw_temp+0
	MOVF       _j1+0, 0
	IORWF      _Raw_temp+0, 1
	MOVLW      0
	IORWF      _Raw_temp+1, 1
;t_lcd_serial.mbas,233 :: 		if minus = $1F then
	MOVF       _minus+0, 0
	XORLW      31
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;t_lcd_serial.mbas,234 :: 		Lcd_Chr(2, 3, "-") ' escribimos "-"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
	GOTO       L__main68
;t_lcd_serial.mbas,235 :: 		else
L__main67:
;t_lcd_serial.mbas,236 :: 		Lcd_Chr(2, 3, "+") ' escribimos "+"
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_Row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_Column+0
	MOVLW      43
	MOVWF      FARG_Lcd_Chr_Out_Char+0
	CALL       _Lcd_Chr+0
;t_lcd_serial.mbas,237 :: 		end if
L__main68:
;t_lcd_serial.mbas,240 :: 		if turno=2 then
	MOVF       _turno+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main70
;t_lcd_serial.mbas,242 :: 		TempC = (Raw_temp and $0FF0) >> 4
	MOVLW      240
	ANDWF      _Raw_temp+0, 0
	MOVWF      R3+0
	MOVF       _Raw_temp+1, 0
	ANDLW      15
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _TempC+0
	MOVF       R0+1, 0
	MOVWF      _TempC+1
;t_lcd_serial.mbas,243 :: 		centinela=TempC
	MOVF       R0+0, 0
	MOVWF      _centinela+0
	MOVF       R0+1, 0
	MOVWF      _centinela+1
;t_lcd_serial.mbas,244 :: 		comma = (j1 and $0F) * 625
	MOVF       _j1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _comma+0
	MOVF       R0+1, 0
	MOVWF      _comma+1
;t_lcd_serial.mbas,246 :: 		Lcd_Out(1, 1, " CELCIUS        ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,247 :: 		UART1_Write_Text("CELCIUS=")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;t_lcd_serial.mbas,249 :: 		IMPRIME()
	CALL       t_lcd_serial_IMPRIME+0
L__main70:
;t_lcd_serial.mbas,253 :: 		if turno=3 then
	MOVF       _turno+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main73
;t_lcd_serial.mbas,255 :: 		TempC = ((Raw_temp and $0FF0) >> 4)+273
	MOVLW      240
	ANDWF      _Raw_temp+0, 0
	MOVWF      _TempC+0
	MOVF       _Raw_temp+1, 0
	ANDLW      15
	MOVWF      _TempC+1
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	RRF        _TempC+1, 1
	RRF        _TempC+0, 1
	BCF        _TempC+1, 7
	MOVLW      17
	ADDWF      _TempC+0, 1
	MOVLW      1
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _TempC+1, 1
;t_lcd_serial.mbas,256 :: 		comma = (j1 and $0F) * 625
	MOVF       _j1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _comma+0
	MOVF       R0+1, 0
	MOVWF      _comma+1
;t_lcd_serial.mbas,258 :: 		Lcd_Out(1, 1, " KELVIN         ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      75
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,259 :: 		UART1_Write_Text("KELVIN=")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      75
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;t_lcd_serial.mbas,260 :: 		IMPRIME()
	CALL       t_lcd_serial_IMPRIME+0
L__main73:
;t_lcd_serial.mbas,265 :: 		if turno=1 then
	MOVF       _turno+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main76
;t_lcd_serial.mbas,266 :: 		TempC = ((Raw_temp and $0FF0) >> 4)*9/5 +32
	MOVLW      240
	ANDWF      _Raw_temp+0, 0
	MOVWF      R3+0
	MOVF       _Raw_temp+1, 0
	ANDLW      15
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      9
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      5
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVLW      32
	ADDWF      R0+0, 0
	MOVWF      _TempC+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _TempC+1
;t_lcd_serial.mbas,267 :: 		comma = (j1 and $0F) * 625
	MOVF       _j1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVLW      113
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _comma+0
	MOVF       R0+1, 0
	MOVWF      _comma+1
;t_lcd_serial.mbas,269 :: 		Lcd_Out(1, 1, " FARENHEIT      ") ' lo que se va a mostrar en la linea 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;t_lcd_serial.mbas,270 :: 		UART1_Write_Text("FARENHEIT=")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      61
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;t_lcd_serial.mbas,271 :: 		IMPRIME()
	CALL       t_lcd_serial_IMPRIME+0
L__main76:
;t_lcd_serial.mbas,273 :: 		end if
	GOTO       L__main61
;t_lcd_serial.mbas,275 :: 		else
L__main60:
;t_lcd_serial.mbas,276 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,277 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,278 :: 		Lcd_Out(1, 1, " NO SIGNAL ")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;t_lcd_serial.mbas,279 :: 		Delay_ms(120)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      56
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main78:
	DECFSZ     R13+0, 1
	GOTO       L__main78
	DECFSZ     R12+0, 1
	GOTO       L__main78
	DECFSZ     R11+0, 1
	GOTO       L__main78
;t_lcd_serial.mbas,280 :: 		end if
L__main61:
;t_lcd_serial.mbas,282 :: 		IF PORTE.RE3=0 THEN
	BTFSC      PORTE+0, 3
	GOTO       L__main80
;t_lcd_serial.mbas,283 :: 		INC(TURNO)
	INCF       _turno+0, 1
;t_lcd_serial.mbas,284 :: 		WHILE PORTE.RE3=0
L__main83:
	BTFSC      PORTE+0, 3
	GOTO       L__main84
;t_lcd_serial.mbas,285 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;t_lcd_serial.mbas,286 :: 		WEND
	GOTO       L__main83
L__main84:
;t_lcd_serial.mbas,287 :: 		IF TURNO=4 THEN
	MOVF       _turno+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main88
;t_lcd_serial.mbas,288 :: 		TURNO=1
	MOVLW      1
	MOVWF      _turno+0
L__main88:
;t_lcd_serial.mbas,289 :: 		END IF
L__main80:
;t_lcd_serial.mbas,292 :: 		wend
	GOTO       L__main46
	GOTO       $+0
; end of _main
