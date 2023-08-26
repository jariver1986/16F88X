
Puente_lucia_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Puente_lucia.mbas,31 :: 		sub procedure interrupt
;Puente_lucia.mbas,32 :: 		if TestBit(INTCON,INTF) then ' hubo la interrupcion por portb.0
	CLRF       R0+0
	BTFSS      INTCON+0, 1
	GOTO       L_Puente_lucia_interrupt4
	MOVLW      1
	MOVWF      R0+0
L_Puente_lucia_interrupt4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Puente_lucia_interrupt2
;Puente_lucia.mbas,33 :: 		ClearBit(INTCON,INTF)
	BCF        INTCON+0, 1
;Puente_lucia.mbas,34 :: 		inc(revol) ' incrementamos las revoluciones
	INCF       _revol+0, 1
	BTFSC      STATUS+0, 2
	INCF       _revol+1, 1
L_Puente_lucia_interrupt2:
;Puente_lucia.mbas,35 :: 		end if
L_Puente_lucia_interrupt23:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Puente_lucia_interrupt

_main:

;Puente_lucia.mbas,38 :: 		main:
;Puente_lucia.mbas,40 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;Puente_lucia.mbas,42 :: 		OPTION_REG = 0X83 ' Pull up PORTB desactivado
	MOVLW      131
	MOVWF      OPTION_REG+0
;Puente_lucia.mbas,45 :: 		INTCON = 0XD0 ' Activado interrupciones globales
	MOVLW      208
	MOVWF      INTCON+0
;Puente_lucia.mbas,50 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Puente_lucia.mbas,51 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Puente_lucia.mbas,53 :: 		TRISB = 0X01 ' PORTB.0 Entrada
	MOVLW      1
	MOVWF      TRISB+0
;Puente_lucia.mbas,54 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Puente_lucia.mbas,56 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;Puente_lucia.mbas,57 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Puente_lucia.mbas,59 :: 		TRISD = 0X00 ' PORTC salidas
	CLRF       TRISD+0
;Puente_lucia.mbas,60 :: 		PORTD = 0X00
	CLRF       PORTD+0
;Puente_lucia.mbas,63 :: 		TRISE = 0X07 ' PORTE  como salidas digital
	MOVLW      7
	MOVWF      TRISE+0
;Puente_lucia.mbas,64 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Puente_lucia.mbas,66 :: 		ANSEL = 0X01 ' AN<7:0>
	MOVLW      1
	MOVWF      ANSEL+0
;Puente_lucia.mbas,67 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Puente_lucia.mbas,70 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Puente_lucia.mbas,71 :: 		PWM2_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Puente_lucia.mbas,72 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Puente_lucia.mbas,73 :: 		veloc = 0x00
	CLRF       _veloc+0
;Puente_lucia.mbas,75 :: 		txt1 = "RPS="
	MOVLW      _txt1+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
;Puente_lucia.mbas,76 :: 		txt2 = "RPS: ###"
	MOVLW      _txt2+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
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
	MOVLW      35
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      35
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      35
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Puente_lucia.mbas,77 :: 		txt3 = "PROYECTO"
	MOVLW      _txt3+0
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
;Puente_lucia.mbas,78 :: 		txt4 = "FISICA"
	MOVLW      _txt4+0
	MOVWF      FSR
	MOVLW      70
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
;Puente_lucia.mbas,79 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;Puente_lucia.mbas,80 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
;Puente_lucia.mbas,81 :: 		PORTB.RB3=1
	BSF        PORTB+0, 3
;Puente_lucia.mbas,82 :: 		PORTB.RB4=1
	BSF        PORTB+0, 4
;Puente_lucia.mbas,84 :: 		Lcd_Init()                        ' Initialize Lcd
	CALL       _Lcd_Init+0
;Puente_lucia.mbas,85 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Puente_lucia.mbas,86 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Puente_lucia.mbas,87 :: 		Lcd_Out(1,1,txt3)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Puente_lucia.mbas,88 :: 		Lcd_Out(2,1,txt4)                 ' Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Puente_lucia.mbas,89 :: 		Delay_ms(2000)
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
;Puente_lucia.mbas,95 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Puente_lucia.mbas,96 :: 		Lcd_Out(1,1,txt1)                 ' Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Puente_lucia.mbas,98 :: 		Delay_ms(1000)
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
;Puente_lucia.mbas,99 :: 		while 1
L__main9:
;Puente_lucia.mbas,106 :: 		if boton1=0 then
	BTFSC      PORTE+0, 0
	GOTO       L__main14
;Puente_lucia.mbas,107 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;Puente_lucia.mbas,108 :: 		PORTB.RB2=0
	BCF        PORTB+0, 2
;Puente_lucia.mbas,109 :: 		PORTB.RB3=1
	BSF        PORTB+0, 3
;Puente_lucia.mbas,110 :: 		PORTB.RB4=0
	BCF        PORTB+0, 4
L__main14:
;Puente_lucia.mbas,113 :: 		if boton2=0 then
	BTFSC      PORTE+0, 2
	GOTO       L__main17
;Puente_lucia.mbas,114 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;Puente_lucia.mbas,115 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
;Puente_lucia.mbas,116 :: 		PORTB.RB3=0
	BCF        PORTB+0, 3
;Puente_lucia.mbas,117 :: 		PORTB.RB4=1
	BSF        PORTB+0, 4
L__main17:
;Puente_lucia.mbas,119 :: 		if ((boton1=0) AND ((boton2=0)))=0 then
	BTFSC      PORTE+0, 0
	GOTO       L__main24
	BSF        114, 0
	GOTO       L__main25
L__main24:
	BCF        114, 0
L__main25:
	CLRF       R1+0
	BTFSC      PORTE+0, 2
	GOTO       L__main22
	MOVLW      255
	MOVWF      R1+0
L__main22:
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
;Puente_lucia.mbas,120 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;Puente_lucia.mbas,121 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
;Puente_lucia.mbas,122 :: 		PORTB.RB3=1
	BSF        PORTB+0, 3
;Puente_lucia.mbas,123 :: 		PORTB.RB4=1
	BSF        PORTB+0, 4
L__main20:
;Puente_lucia.mbas,125 :: 		wend
	GOTO       L__main9
	GOTO       $+0
; end of _main
