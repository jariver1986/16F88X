
control_robot_sonido:

;control_robot.mbas,26 :: 		sub procedure sonido()
;control_robot.mbas,27 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;control_robot.mbas,28 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_control_robot_sonido1:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_sonido1
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_sonido1
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_sonido1
	NOP
;control_robot.mbas,29 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;control_robot.mbas,30 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_control_robot_sonido2:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_sonido2
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_sonido2
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_sonido2
	NOP
	RETURN
; end of control_robot_sonido

control_robot_led:

;control_robot.mbas,32 :: 		sub procedure led()
;control_robot.mbas,33 :: 		PORTD.RD3 = 0
	BCF        PORTD+0, 3
;control_robot.mbas,34 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_control_robot_led4:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_led4
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_led4
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_led4
	NOP
;control_robot.mbas,35 :: 		PORTD.RD3 = 1
	BSF        PORTD+0, 3
;control_robot.mbas,36 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_control_robot_led5:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_led5
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_led5
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_led5
	NOP
	RETURN
; end of control_robot_led

control_robot_PARAR:

;control_robot.mbas,38 :: 		sub procedure PARAR()
;control_robot.mbas,39 :: 		MA1 = 0
	BCF        PORTC+0, 2
;control_robot.mbas,40 :: 		MA2 = 1
	BSF        PORTC+0, 3
;control_robot.mbas,41 :: 		MB1 = 1
	BSF        PORTD+0, 0
;control_robot.mbas,42 :: 		MB2 = 1
	BSF        PORTD+0, 1
;control_robot.mbas,43 :: 		Delay_ms(400)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_robot_PARAR7:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_PARAR7
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_PARAR7
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_PARAR7
	RETURN
; end of control_robot_PARAR

control_robot_ADELANTE:

;control_robot.mbas,45 :: 		sub procedure ADELANTE()
;control_robot.mbas,46 :: 		MA1 = 1
	BSF        PORTC+0, 2
;control_robot.mbas,47 :: 		MA2 = 1
	BSF        PORTC+0, 3
;control_robot.mbas,48 :: 		MB1 = 0
	BCF        PORTD+0, 0
;control_robot.mbas,49 :: 		MB2 = 1
	BSF        PORTD+0, 1
	RETURN
; end of control_robot_ADELANTE

control_robot_ATRAS:

;control_robot.mbas,51 :: 		sub procedure ATRAS()
;control_robot.mbas,52 :: 		MA1 = 0
	BCF        PORTC+0, 2
;control_robot.mbas,53 :: 		MA2 = 0
	BCF        PORTC+0, 3
;control_robot.mbas,54 :: 		MB1 = 1
	BSF        PORTD+0, 0
;control_robot.mbas,55 :: 		MB2 = 0
	BCF        PORTD+0, 1
	RETURN
; end of control_robot_ATRAS

control_robot_DERECHA:

;control_robot.mbas,57 :: 		sub procedure DERECHA()
;control_robot.mbas,58 :: 		PARAR()
	CALL       control_robot_PARAR+0
;control_robot.mbas,59 :: 		Delay_ms(400)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_robot_DERECHA11:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_DERECHA11
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_DERECHA11
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_DERECHA11
;control_robot.mbas,60 :: 		MA1 = 1
	BSF        PORTC+0, 2
;control_robot.mbas,61 :: 		MA2 = 1
	BSF        PORTC+0, 3
;control_robot.mbas,62 :: 		MB1 = 1
	BSF        PORTD+0, 0
;control_robot.mbas,63 :: 		MB2 = 0
	BCF        PORTD+0, 1
;control_robot.mbas,64 :: 		Delay_ms(300)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_control_robot_DERECHA12:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_DERECHA12
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_DERECHA12
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_DERECHA12
;control_robot.mbas,65 :: 		PARAR
	CALL       control_robot_PARAR+0
	RETURN
; end of control_robot_DERECHA

control_robot_IZQUIERDA:

;control_robot.mbas,67 :: 		sub procedure IZQUIERDA()
;control_robot.mbas,68 :: 		PARAR()
	CALL       control_robot_PARAR+0
;control_robot.mbas,69 :: 		Delay_ms(400)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_control_robot_IZQUIERDA14:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_IZQUIERDA14
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_IZQUIERDA14
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_IZQUIERDA14
;control_robot.mbas,70 :: 		MA1 = 0
	BCF        PORTC+0, 2
;control_robot.mbas,71 :: 		MA2 = 0
	BCF        PORTC+0, 3
;control_robot.mbas,72 :: 		MB1 = 0
	BCF        PORTD+0, 0
;control_robot.mbas,73 :: 		MB2 = 1
	BSF        PORTD+0, 1
;control_robot.mbas,74 :: 		Delay_ms(300)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_control_robot_IZQUIERDA15:
	DECFSZ     R13+0, 1
	GOTO       L_control_robot_IZQUIERDA15
	DECFSZ     R12+0, 1
	GOTO       L_control_robot_IZQUIERDA15
	DECFSZ     R11+0, 1
	GOTO       L_control_robot_IZQUIERDA15
;control_robot.mbas,75 :: 		PARAR
	CALL       control_robot_PARAR+0
	RETURN
; end of control_robot_IZQUIERDA

_main:

;control_robot.mbas,77 :: 		main:
;control_robot.mbas,78 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;control_robot.mbas,79 :: 		OSCCON  = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;control_robot.mbas,80 :: 		PORTA   = %00000000
	CLRF       PORTA+0
;control_robot.mbas,81 :: 		TRISA   = %00000000
	CLRF       TRISA+0
;control_robot.mbas,82 :: 		PORTB   = %00000000
	CLRF       PORTB+0
;control_robot.mbas,83 :: 		TRISB   = %00111111
	MOVLW      63
	MOVWF      TRISB+0
;control_robot.mbas,84 :: 		PORTC   = %00001000
	MOVLW      8
	MOVWF      PORTC+0
;control_robot.mbas,85 :: 		TRISC   = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;control_robot.mbas,86 :: 		PORTD   = %00000011
	MOVLW      3
	MOVWF      PORTD+0
;control_robot.mbas,87 :: 		TRISD   = %00000000
	CLRF       TRISD+0
;control_robot.mbas,88 :: 		ANSEL   = %00000000
	CLRF       ANSEL+0
;control_robot.mbas,89 :: 		ANSELH  = %00100000
	MOVLW      32
	MOVWF      ANSELH+0
;control_robot.mbas,90 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_robot.mbas,92 :: 		Lcd_Init()                        ' Inicializacion Lcd
	CALL       _Lcd_Init+0
;control_robot.mbas,93 :: 		Lcd_Cmd(_LCD_CLEAR)               ' encera display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_robot.mbas,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_robot.mbas,95 :: 		LED
	CALL       control_robot_led+0
;control_robot.mbas,96 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,97 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_robot.mbas,98 :: 		Lcd_Out(1,1,"LOADING")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,99 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main17:
	DECFSZ     R13+0, 1
	GOTO       L__main17
	DECFSZ     R12+0, 1
	GOTO       L__main17
	DECFSZ     R11+0, 1
	GOTO       L__main17
	NOP
	NOP
;control_robot.mbas,100 :: 		Lcd_Out(1,1,"LOADING.")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,101 :: 		Delay_ms(700)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      142
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
	NOP
;control_robot.mbas,102 :: 		Lcd_Out(1,1,"LOADING..")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,103 :: 		Delay_ms(800)
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
;control_robot.mbas,104 :: 		Lcd_Out(1,1,"LOADING...")                 ' escribe la cadena en la primera fila
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,105 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
	NOP
;control_robot.mbas,106 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;control_robot.mbas,107 :: 		TEXTO=""
	CLRF       _TEXTO+0
;control_robot.mbas,108 :: 		while 1
L__main22:
;control_robot.mbas,109 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main27
;control_robot.mbas,110 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
	CLRF       _DATO+1
;control_robot.mbas,111 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L__main27:
;control_robot.mbas,114 :: 		if dato="D" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      68
	XORWF      _DATO+0, 0
L__main52:
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;control_robot.mbas,115 :: 		valor = Adc_Read(13)*0.488
	MOVLW      13
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	CALL       _Word2Double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
	MOVF       R0+2, 0
	MOVWF      _valor+2
	MOVF       R0+3, 0
	MOVWF      _valor+3
;control_robot.mbas,116 :: 		FloatToStr(VALOR,TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_input+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_input+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_input+3
	MOVLW      _TEXTO+0
	MOVWF      FARG_FloatToStr_output+0
	CALL       _FloatToStr+0
;control_robot.mbas,117 :: 		Lcd_Out(1,1,"TEMPERATURA[°C]:")      'ra0
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      91
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      176
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      93
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
;control_robot.mbas,118 :: 		Lcd_Out(2,10,TEXTO)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TEXTO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,119 :: 		UART1_Write(TEXTO[0])
	MOVF       _TEXTO+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_robot.mbas,120 :: 		UART1_Write(TEXTO[1])
	MOVF       _TEXTO+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_robot.mbas,121 :: 		UART1_Write(TEXTO[2])
	MOVF       _TEXTO+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_robot.mbas,122 :: 		UART1_Write(TEXTO[3])
	MOVF       _TEXTO+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_robot.mbas,123 :: 		recep=0
	CLRF       _RECEP+0
;control_robot.mbas,124 :: 		if valor>=39 then
	MOVLW      39
	MOVWF      R0+0
	CALL       _Byte2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       _valor+0, 0
	MOVWF      R0+0
	MOVF       _valor+1, 0
	MOVWF      R0+1
	MOVF       _valor+2, 0
	MOVWF      R0+2
	MOVF       _valor+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      255
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main33
;control_robot.mbas,125 :: 		sonido
	CALL       control_robot_sonido+0
;control_robot.mbas,126 :: 		UART1_Write_Text("_")
	MOVLW      95
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
L__main33:
;control_robot.mbas,128 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main30:
;control_robot.mbas,131 :: 		if DATO = "1" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      49
	XORWF      _DATO+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;control_robot.mbas,132 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,133 :: 		ADELANTE
	CALL       control_robot_ADELANTE+0
;control_robot.mbas,134 :: 		Lcd_Out(1,1,"ADELANTE")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
;control_robot.mbas,135 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main36:
;control_robot.mbas,137 :: 		if DATO = "5" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      53
	XORWF      _DATO+0, 0
L__main54:
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;control_robot.mbas,138 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,139 :: 		PARAR
	CALL       control_robot_PARAR+0
;control_robot.mbas,140 :: 		Lcd_Out(1,1,"PARAR")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
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
;control_robot.mbas,141 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main39:
;control_robot.mbas,143 :: 		if DATO = "2" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      50
	XORWF      _DATO+0, 0
L__main55:
	BTFSS      STATUS+0, 2
	GOTO       L__main42
;control_robot.mbas,144 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,145 :: 		ATRAS
	CALL       control_robot_ATRAS+0
;control_robot.mbas,146 :: 		Lcd_Out(1,1,"ATRAS")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
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
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;control_robot.mbas,147 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main42:
;control_robot.mbas,149 :: 		if DATO = "3" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      51
	XORWF      _DATO+0, 0
L__main56:
	BTFSS      STATUS+0, 2
	GOTO       L__main45
;control_robot.mbas,150 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,151 :: 		IZQUIERDA
	CALL       control_robot_IZQUIERDA+0
;control_robot.mbas,152 :: 		Lcd_Out(1,1,"IZQUIERDA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
;control_robot.mbas,153 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	DECFSZ     R11+0, 1
	GOTO       L__main47
	NOP
	NOP
;control_robot.mbas,154 :: 		PARAR
	CALL       control_robot_PARAR+0
;control_robot.mbas,155 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main45:
;control_robot.mbas,157 :: 		if DATO = "4" then
	MOVLW      0
	XORWF      _DATO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      52
	XORWF      _DATO+0, 0
L__main57:
	BTFSS      STATUS+0, 2
	GOTO       L__main49
;control_robot.mbas,158 :: 		SONIDO
	CALL       control_robot_sonido+0
;control_robot.mbas,159 :: 		DERECHA
	CALL       control_robot_DERECHA+0
;control_robot.mbas,160 :: 		Lcd_Out(1,1,"DERECHA")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      72
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
;control_robot.mbas,161 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	DECFSZ     R11+0, 1
	GOTO       L__main51
	NOP
	NOP
;control_robot.mbas,162 :: 		PARAR
	CALL       control_robot_PARAR+0
;control_robot.mbas,163 :: 		DATO=0
	CLRF       _DATO+0
	CLRF       _DATO+1
L__main49:
;control_robot.mbas,167 :: 		wend
	GOTO       L__main22
	GOTO       $+0
; end of _main
