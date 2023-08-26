
smartcity_buzzer:

;smartcity.mbas,23 :: 		sub procedure buzzer()
;smartcity.mbas,24 :: 		PORTD.RD2 = 1
	BSF        PORTD+0, 2
;smartcity.mbas,25 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartcity_buzzer1:
	DECFSZ     R13+0, 1
	GOTO       L_smartcity_buzzer1
	DECFSZ     R12+0, 1
	GOTO       L_smartcity_buzzer1
	DECFSZ     R11+0, 1
	GOTO       L_smartcity_buzzer1
;smartcity.mbas,26 :: 		PORTD.RD2 = 0
	BCF        PORTD+0, 2
;smartcity.mbas,27 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartcity_buzzer2:
	DECFSZ     R13+0, 1
	GOTO       L_smartcity_buzzer2
	DECFSZ     R12+0, 1
	GOTO       L_smartcity_buzzer2
	DECFSZ     R11+0, 1
	GOTO       L_smartcity_buzzer2
	RETURN
; end of smartcity_buzzer

smartcity_led:

;smartcity.mbas,29 :: 		sub procedure led()
;smartcity.mbas,30 :: 		PORTD.RD3 = 0
	BCF        PORTD+0, 3
;smartcity.mbas,31 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartcity_led4:
	DECFSZ     R13+0, 1
	GOTO       L_smartcity_led4
	DECFSZ     R12+0, 1
	GOTO       L_smartcity_led4
	DECFSZ     R11+0, 1
	GOTO       L_smartcity_led4
;smartcity.mbas,32 :: 		PORTD.RD3 = 1
	BSF        PORTD+0, 3
;smartcity.mbas,33 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_smartcity_led5:
	DECFSZ     R13+0, 1
	GOTO       L_smartcity_led5
	DECFSZ     R12+0, 1
	GOTO       L_smartcity_led5
	DECFSZ     R11+0, 1
	GOTO       L_smartcity_led5
	RETURN
; end of smartcity_led

_main:

;smartcity.mbas,38 :: 		main:
;smartcity.mbas,39 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;smartcity.mbas,40 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;smartcity.mbas,41 :: 		PORTA = %00000000
	CLRF       PORTA+0
;smartcity.mbas,42 :: 		TRISA = %11111111
	MOVLW      255
	MOVWF      TRISA+0
;smartcity.mbas,43 :: 		PORTB = %00000000
	CLRF       PORTB+0
;smartcity.mbas,44 :: 		TRISB = %11111111
	MOVLW      255
	MOVWF      TRISB+0
;smartcity.mbas,45 :: 		PORTC = %00000000
	CLRF       PORTC+0
;smartcity.mbas,46 :: 		TRISC = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;smartcity.mbas,47 :: 		PORTD = %00000000
	CLRF       PORTD+0
;smartcity.mbas,48 :: 		TRISD = %00000000
	CLRF       TRISD+0
;smartcity.mbas,49 :: 		PORTE = %00000001
	MOVLW      1
	MOVWF      PORTE+0
;smartcity.mbas,50 :: 		TRISE = %00000000
	CLRF       TRISE+0
;smartcity.mbas,51 :: 		ANSEL = %00011111
	MOVLW      31
	MOVWF      ANSEL+0
;smartcity.mbas,52 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;smartcity.mbas,54 :: 		Lcd_Init()
	CALL       _Lcd_Init+0
;smartcity.mbas,55 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;smartcity.mbas,56 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;smartcity.mbas,57 :: 		Lcd_Out(1,1,"UNIVERSIDAD")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
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
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;smartcity.mbas,58 :: 		Lcd_Out(2,1,"AGRARIA")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      73
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
;smartcity.mbas,59 :: 		Delay_ms(4000)
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L__main7:
	DECFSZ     R13+0, 1
	GOTO       L__main7
	DECFSZ     R12+0, 1
	GOTO       L__main7
	DECFSZ     R11+0, 1
	GOTO       L__main7
;smartcity.mbas,60 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;smartcity.mbas,62 :: 		Lcd_Out(1,1," SMART CITY ")
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
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      89
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
;smartcity.mbas,63 :: 		Lcd_Out(2,1," 2017")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;smartcity.mbas,64 :: 		Delay_ms(4000)
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
;smartcity.mbas,65 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;smartcity.mbas,67 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;smartcity.mbas,68 :: 		buzzer
	CALL       smartcity_buzzer+0
;smartcity.mbas,69 :: 		led
	CALL       smartcity_led+0
;smartcity.mbas,70 :: 		led
	CALL       smartcity_led+0
;smartcity.mbas,71 :: 		while 1
L__main10:
;smartcity.mbas,72 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main15
;smartcity.mbas,73 :: 		DATO=UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main15:
;smartcity.mbas,75 :: 		if dato= "1" then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;smartcity.mbas,76 :: 		UART1_Write_Text("OCUPADOS: ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      83
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
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;smartcity.mbas,77 :: 		UART1_Write_Text(TEXTO2)
	MOVLW      _texto2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;smartcity.mbas,78 :: 		UART1_Write_Text("  LIBRES")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;smartcity.mbas,79 :: 		UART1_Write_Text(TEXTO1)
	MOVLW      _texto1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;smartcity.mbas,80 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;smartcity.mbas,81 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;smartcity.mbas,82 :: 		dato=0
	CLRF       _dato+0
L__main18:
;smartcity.mbas,86 :: 		if dato= "V" then
	MOVF       _dato+0, 0
	XORLW      86
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;smartcity.mbas,87 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;smartcity.mbas,88 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;smartcity.mbas,89 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;smartcity.mbas,90 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;smartcity.mbas,91 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;smartcity.mbas,92 :: 		PORTD.RD1=1
	BSF        PORTD+0, 1
;smartcity.mbas,93 :: 		DATO=0
	CLRF       _dato+0
L__main21:
;smartcity.mbas,95 :: 		if dato= "A" then
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main24
;smartcity.mbas,96 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;smartcity.mbas,97 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;smartcity.mbas,98 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;smartcity.mbas,99 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;smartcity.mbas,100 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;smartcity.mbas,101 :: 		PORTD.RD1=1
	BSF        PORTD+0, 1
;smartcity.mbas,102 :: 		DATO=0
	CLRF       _dato+0
L__main24:
;smartcity.mbas,104 :: 		if dato= "R" then
	MOVF       _dato+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;smartcity.mbas,105 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;smartcity.mbas,106 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;smartcity.mbas,107 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
;smartcity.mbas,108 :: 		PORTC.RC3=1
	BSF        PORTC+0, 3
;smartcity.mbas,109 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;smartcity.mbas,110 :: 		PORTD.RD1=0
	BCF        PORTD+0, 1
;smartcity.mbas,111 :: 		DATO=0
	CLRF       _dato+0
L__main27:
;smartcity.mbas,115 :: 		tacho =Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _tacho+0
	MOVF       R0+1, 0
	MOVWF      _tacho+1
;smartcity.mbas,116 :: 		if tacho>800 then 'tacho lleno
	MOVF       R0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       R0+0, 0
	SUBLW      32
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L__main30
;smartcity.mbas,117 :: 		buzzer()
	CALL       smartcity_buzzer+0
;smartcity.mbas,118 :: 		buzzer()
	CALL       smartcity_buzzer+0
;smartcity.mbas,119 :: 		Delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main32:
	DECFSZ     R13+0, 1
	GOTO       L__main32
	DECFSZ     R12+0, 1
	GOTO       L__main32
	DECFSZ     R11+0, 1
	GOTO       L__main32
	NOP
	NOP
L__main30:
;smartcity.mbas,122 :: 		luminaria =Adc_Read(4)
	MOVLW      4
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _luminaria+0
	MOVF       R0+1, 0
	MOVWF      _luminaria+1
;smartcity.mbas,123 :: 		if luminaria>800 then 'tacho lleno
	MOVF       R0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       R0+0, 0
	SUBLW      32
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L__main34
;smartcity.mbas,124 :: 		PORTE.RE0=0
	BCF        PORTE+0, 0
	GOTO       L__main35
;smartcity.mbas,125 :: 		else
L__main34:
;smartcity.mbas,126 :: 		PORTE.RE0=1
	BSF        PORTE+0, 0
;smartcity.mbas,127 :: 		end if
L__main35:
;smartcity.mbas,131 :: 		if dato= "2" then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;smartcity.mbas,132 :: 		dato=0
	CLRF       _dato+0
;smartcity.mbas,133 :: 		PORTE.RE0=1
	BSF        PORTE+0, 0
L__main37:
;smartcity.mbas,136 :: 		CAR1 =Adc_Read(1)
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _CAR1+0
	MOVF       R0+1, 0
	MOVWF      _CAR1+1
;smartcity.mbas,137 :: 		if car1>750 then 'tacho lleno
	MOVF       R0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       R0+0, 0
	SUBLW      238
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L__main40
;smartcity.mbas,138 :: 		contador1=1
	MOVLW      1
	MOVWF      _CONTADOR1+0
	CLRF       _CONTADOR1+1
	GOTO       L__main41
;smartcity.mbas,139 :: 		else
L__main40:
;smartcity.mbas,140 :: 		contador1=0
	CLRF       _CONTADOR1+0
	CLRF       _CONTADOR1+1
;smartcity.mbas,141 :: 		end if
L__main41:
;smartcity.mbas,144 :: 		CAR2 =Adc_Read(2)
	MOVLW      2
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _CAR2+0
	MOVF       R0+1, 0
	MOVWF      _CAR2+1
;smartcity.mbas,145 :: 		if car2>750 then 'tacho lleno
	MOVF       R0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       R0+0, 0
	SUBLW      238
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L__main43
;smartcity.mbas,146 :: 		contador2=1
	MOVLW      1
	MOVWF      _CONTADOR2+0
	CLRF       _CONTADOR2+1
	GOTO       L__main44
;smartcity.mbas,147 :: 		else
L__main43:
;smartcity.mbas,148 :: 		contador2=0
	CLRF       _CONTADOR2+0
	CLRF       _CONTADOR2+1
;smartcity.mbas,149 :: 		end if
L__main44:
;smartcity.mbas,150 :: 		CAR3 =Adc_Read(3)
	MOVLW      3
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _CAR3+0
	MOVF       R0+1, 0
	MOVWF      _CAR3+1
;smartcity.mbas,151 :: 		if car3>750 then 'tacho lleno
	MOVF       R0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       R0+0, 0
	SUBLW      238
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L__main46
;smartcity.mbas,152 :: 		contador3=1
	MOVLW      1
	MOVWF      _CONTADOR3+0
	CLRF       _CONTADOR3+1
	GOTO       L__main47
;smartcity.mbas,153 :: 		else
L__main46:
;smartcity.mbas,154 :: 		contador3=0
	CLRF       _CONTADOR3+0
	CLRF       _CONTADOR3+1
;smartcity.mbas,155 :: 		end if
L__main47:
;smartcity.mbas,157 :: 		OCUPADO= contador1+contador2+contador3
	MOVF       _CONTADOR2+0, 0
	ADDWF      _CONTADOR1+0, 0
	MOVWF      R0+0
	MOVF       _CONTADOR1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _CONTADOR2+1, 0
	MOVWF      R0+1
	MOVF       _CONTADOR3+0, 0
	ADDWF      R0+0, 1
	MOVF       _CONTADOR3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _OCUPADO+0
	MOVF       R0+1, 0
	MOVWF      _OCUPADO+1
;smartcity.mbas,158 :: 		LIBRE=3-OCUPADO
	MOVF       R0+0, 0
	SUBLW      3
	MOVWF      _LIBRE+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _LIBRE+1
	SUBWF      _LIBRE+1, 1
;smartcity.mbas,159 :: 		WordToStr(OCUPADO,texto1)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto1+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;smartcity.mbas,160 :: 		WordToStr(LIBRE,textO2)
	MOVF       _LIBRE+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _LIBRE+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto2+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;smartcity.mbas,162 :: 		Lcd_Cmd(_LCD_CLEAR)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;smartcity.mbas,164 :: 		Lcd_Out(1,1,"OCUPADOS:")
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
;smartcity.mbas,165 :: 		Lcd_Out(1,10,TEXTO2)
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;smartcity.mbas,166 :: 		Lcd_Out(2,1,"LIBRES:")
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
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
;smartcity.mbas,167 :: 		Lcd_Out(2,10,TEXTO1)
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;smartcity.mbas,169 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, 1
	GOTO       L__main48
	DECFSZ     R12+0, 1
	GOTO       L__main48
	DECFSZ     R11+0, 1
	GOTO       L__main48
	NOP
;smartcity.mbas,171 :: 		wend
	GOTO       L__main10
	GOTO       $+0
; end of _main
