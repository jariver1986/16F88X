
sensor_velocidad_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;sensor_velocidad.mbas,21 :: 		sub procedure interrupt
;sensor_velocidad.mbas,25 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_sensor_velocidad_interrupt2
;sensor_velocidad.mbas,26 :: 		inc(tiempo)
	INCF       _tiempo+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tiempo+1, 1
;sensor_velocidad.mbas,27 :: 		inc(tiempo2)
	INCF       _tiempo2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tiempo2+1, 1
;sensor_velocidad.mbas,28 :: 		TMR0 = 247
	MOVLW      247
	MOVWF      TMR0+0
;sensor_velocidad.mbas,29 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_sensor_velocidad_interrupt2:
;sensor_velocidad.mbas,30 :: 		end if
L_sensor_velocidad_interrupt21:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of sensor_velocidad_interrupt

_main:

;sensor_velocidad.mbas,32 :: 		main:
;sensor_velocidad.mbas,33 :: 		OSCCON     =  0X75
	MOVLW      117
	MOVWF      OSCCON+0
;sensor_velocidad.mbas,34 :: 		OPTION_REG =  0x07
	MOVLW      7
	MOVWF      OPTION_REG+0
;sensor_velocidad.mbas,35 :: 		TRISA  = %00000011
	MOVLW      3
	MOVWF      TRISA+0
;sensor_velocidad.mbas,36 :: 		TRISB  = %00000000
	CLRF       TRISB+0
;sensor_velocidad.mbas,37 :: 		TRISC  = %00001001
	MOVLW      9
	MOVWF      TRISC+0
;sensor_velocidad.mbas,38 :: 		PORTA  = %00000011
	MOVLW      3
	MOVWF      PORTA+0
;sensor_velocidad.mbas,39 :: 		PORTB  = %00000000
	CLRF       PORTB+0
;sensor_velocidad.mbas,40 :: 		PORTC  = %00000000
	CLRF       PORTC+0
;sensor_velocidad.mbas,41 :: 		ANSEL  = %00000011
	MOVLW      3
	MOVWF      ANSEL+0
;sensor_velocidad.mbas,42 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;sensor_velocidad.mbas,43 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;sensor_velocidad.mbas,44 :: 		Lcd_Init()                        ' inicio de lcd
	CALL       _Lcd_Init+0
;sensor_velocidad.mbas,45 :: 		Lcd_Cmd(_LCD_CLEAR)               ' borrara lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sensor_velocidad.mbas,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sensor_velocidad.mbas,47 :: 		TMR0 = 247
	MOVLW      247
	MOVWF      TMR0+0
;sensor_velocidad.mbas,48 :: 		tiempo=0
	CLRF       _tiempo+0
	CLRF       _tiempo+1
;sensor_velocidad.mbas,49 :: 		tiempo2=0
	CLRF       _tiempo2+0
	CLRF       _tiempo2+1
;sensor_velocidad.mbas,50 :: 		INTCON = 0XA0
	MOVLW      160
	MOVWF      INTCON+0
;sensor_velocidad.mbas,51 :: 		inicio:
L__main_inicio:
;sensor_velocidad.mbas,52 :: 		Lcd_Out(1,1,"ESPOL")                 ' mensaje linea 1
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
;sensor_velocidad.mbas,53 :: 		Lcd_Out(2,1,"FIMCBOR")                 ' mensaje linea 2
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
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
;sensor_velocidad.mbas,54 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_velocidad.mbas,55 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_velocidad.mbas,56 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sensor_velocidad.mbas,57 :: 		CUENTA1=1
	MOVLW      1
	MOVWF      _CUENTA1+0
;sensor_velocidad.mbas,58 :: 		CUENTA2=1
	MOVLW      1
	MOVWF      _CUENTA2+0
;sensor_velocidad.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;sensor_velocidad.mbas,60 :: 		while 1
L__main7:
;sensor_velocidad.mbas,61 :: 		SENSOR1 = Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _SENSOR1+0
	MOVF       R0+1, 0
	MOVWF      _SENSOR1+1
;sensor_velocidad.mbas,62 :: 		SENSOR2 = Adc_Read(1)
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _SENSOR2+0
	MOVF       R0+1, 0
	MOVWF      _SENSOR2+1
;sensor_velocidad.mbas,64 :: 		if (SENSOR1>250) AND (CUENTA1=1) then
	MOVF       _SENSOR1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       _SENSOR1+0, 0
	SUBLW      250
L__main22:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CUENTA1+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main12
;sensor_velocidad.mbas,65 :: 		tiempo=0
	CLRF       _tiempo+0
	CLRF       _tiempo+1
;sensor_velocidad.mbas,66 :: 		cuenta1=0                       'EMPIEZA CONTEO
	CLRF       _CUENTA1+0
;sensor_velocidad.mbas,67 :: 		Lcd_Out(1,1,"S1")               'DETECTA SENSOR INICIO
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
;sensor_velocidad.mbas,68 :: 		cuenta=1                        'VER TIEMPO INCREMENTANDO
	MOVLW      1
	MOVWF      _cuenta+0
L__main12:
;sensor_velocidad.mbas,70 :: 		if (cuenta=1) then
	MOVF       _cuenta+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;sensor_velocidad.mbas,71 :: 		Lcd_Out(2,1,"T[s]: ")       'MUESTRA LA PALABRA TIEMPO EN PANTALLA
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
;sensor_velocidad.mbas,72 :: 		WordToStr(tiempo,texto)
	MOVF       _tiempo+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _tiempo+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;sensor_velocidad.mbas,73 :: 		Lcd_Out(2,10,texto)              'MUESTRA EL TIEMPO
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sensor_velocidad.mbas,74 :: 		mostrar=tiempo
	MOVF       _tiempo+0, 0
	MOVWF      _mostrar+0
	MOVF       _tiempo+1, 0
	MOVWF      _mostrar+1
L__main15:
;sensor_velocidad.mbas,76 :: 		if (SENSOR2>250) AND (CUENTA2=1)AND (CUENTA1=0) then
	MOVF       _SENSOR2+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       _SENSOR2+0, 0
	SUBLW      250
L__main23:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _CUENTA2+0, 0
	XORLW      1
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _CUENTA1+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main18
;sensor_velocidad.mbas,77 :: 		Lcd_Out(1,8,"S2")                'DETECTA SENSRO FINAL
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      83
	MOVWF      _main_Local_Text+0
	MOVLW      50
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sensor_velocidad.mbas,78 :: 		cuenta=0                        'PARAR CONTEO
	CLRF       _cuenta+0
;sensor_velocidad.mbas,79 :: 		WordToStr(mostrar,texto)        'MUESTRA EL TIEMPO FINAL
	MOVF       _mostrar+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _mostrar+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;sensor_velocidad.mbas,80 :: 		Lcd_Out(2,10,texto)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sensor_velocidad.mbas,81 :: 		UART1_Write_Text("TIEMPO=")
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
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor_velocidad.mbas,82 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;sensor_velocidad.mbas,83 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor_velocidad.mbas,84 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;sensor_velocidad.mbas,85 :: 		Delay_ms(10000)
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
;sensor_velocidad.mbas,86 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sensor_velocidad.mbas,87 :: 		goto inicio
	GOTO       L__main_inicio
L__main18:
;sensor_velocidad.mbas,89 :: 		wend
	GOTO       L__main7
	GOTO       $+0
; end of _main
