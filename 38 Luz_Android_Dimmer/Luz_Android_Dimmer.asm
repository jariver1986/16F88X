
Luz_Android_Dimmer_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Luz_Android_Dimmer.mbas,8 :: 		sub procedure interrupt()
;Luz_Android_Dimmer.mbas,10 :: 		if INTCON.TMR0IF=1 then
	BTFSS      INTCON+0, 2
	GOTO       L_Luz_Android_Dimmer_interrupt2
;Luz_Android_Dimmer.mbas,11 :: 		INTCON.TMR0IF=0
	BCF        INTCON+0, 2
;Luz_Android_Dimmer.mbas,12 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;Luz_Android_Dimmer.mbas,13 :: 		INTCON.TMR0IE = 0
	BCF        INTCON+0, 5
;Luz_Android_Dimmer.mbas,14 :: 		INTCON.INTE = 1
	BSF        INTCON+0, 4
L_Luz_Android_Dimmer_interrupt2:
;Luz_Android_Dimmer.mbas,16 :: 		if INTCON.INTF=1 then
	BTFSS      INTCON+0, 1
	GOTO       L_Luz_Android_Dimmer_interrupt5
;Luz_Android_Dimmer.mbas,17 :: 		INTCON.INTF=0
	BCF        INTCON+0, 1
;Luz_Android_Dimmer.mbas,18 :: 		TMR0 = LUZ
	MOVF       _LUZ+0, 0
	MOVWF      TMR0+0
;Luz_Android_Dimmer.mbas,19 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;Luz_Android_Dimmer.mbas,20 :: 		INTCON.TMR0IE = 1
	BSF        INTCON+0, 5
;Luz_Android_Dimmer.mbas,21 :: 		INTCON.INTE = 0
	BCF        INTCON+0, 4
L_Luz_Android_Dimmer_interrupt5:
;Luz_Android_Dimmer.mbas,22 :: 		end if
L_Luz_Android_Dimmer_interrupt54:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Luz_Android_Dimmer_interrupt

_main:

;Luz_Android_Dimmer.mbas,26 :: 		main:
;Luz_Android_Dimmer.mbas,27 :: 		ANSEL  = 0x00                          ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Luz_Android_Dimmer.mbas,28 :: 		ANSELH = 0
	CLRF       ANSELH+0
;Luz_Android_Dimmer.mbas,29 :: 		TRISA=0X00
	CLRF       TRISA+0
;Luz_Android_Dimmer.mbas,30 :: 		PORTA=0X00
	CLRF       PORTA+0
;Luz_Android_Dimmer.mbas,32 :: 		TRISB=0X01
	MOVLW      1
	MOVWF      TRISB+0
;Luz_Android_Dimmer.mbas,33 :: 		PORTB=0X00
	CLRF       PORTB+0
;Luz_Android_Dimmer.mbas,35 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;Luz_Android_Dimmer.mbas,36 :: 		PORTC=0X00
	CLRF       PORTC+0
;Luz_Android_Dimmer.mbas,38 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;Luz_Android_Dimmer.mbas,39 :: 		OPTION_REG=%1000100
	MOVLW      68
	MOVWF      OPTION_REG+0
;Luz_Android_Dimmer.mbas,40 :: 		INTCON=%11110000
	MOVLW      240
	MOVWF      INTCON+0
;Luz_Android_Dimmer.mbas,41 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Luz_Android_Dimmer.mbas,42 :: 		TMR0=0
	CLRF       TMR0+0
;Luz_Android_Dimmer.mbas,43 :: 		LUZ=0
	CLRF       _LUZ+0
	CLRF       _LUZ+1
;Luz_Android_Dimmer.mbas,44 :: 		viajero=0
	CLRF       _viajero+0
;Luz_Android_Dimmer.mbas,45 :: 		datos_set=0
	CLRF       _datos_set+0
;Luz_Android_Dimmer.mbas,46 :: 		contador=0
	CLRF       _contador+0
	CLRF       _contador+1
;Luz_Android_Dimmer.mbas,47 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Luz_Android_Dimmer.mbas,48 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Luz_Android_Dimmer.mbas,49 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Luz_Android_Dimmer.mbas,50 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Luz_Android_Dimmer.mbas,51 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Luz_Android_Dimmer.mbas,52 :: 		UART1_Write_Text("A")
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Luz_Android_Dimmer.mbas,56 :: 		WHILE(1)
L__main10:
;Luz_Android_Dimmer.mbas,58 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;Luz_Android_Dimmer.mbas,59 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
L__main15:
;Luz_Android_Dimmer.mbas,62 :: 		IF receive= "4" then
	MOVF       _receive+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;Luz_Android_Dimmer.mbas,63 :: 		viajero=0
	CLRF       _viajero+0
;Luz_Android_Dimmer.mbas,64 :: 		inc(contador)
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;Luz_Android_Dimmer.mbas,65 :: 		receive=0
	CLRF       _receive+0
;Luz_Android_Dimmer.mbas,66 :: 		LUZ= (contador*255)/80
	MOVF       _contador+0, 0
	MOVWF      R0+0
	MOVF       _contador+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      80
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _LUZ+0
	MOVF       R0+1, 0
	MOVWF      _LUZ+1
;Luz_Android_Dimmer.mbas,67 :: 		Delay_5ms
	CALL       _Delay_5ms+0
L__main18:
;Luz_Android_Dimmer.mbas,69 :: 		IF receive= "3" then
	MOVF       _receive+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;Luz_Android_Dimmer.mbas,70 :: 		viajero=0
	CLRF       _viajero+0
;Luz_Android_Dimmer.mbas,71 :: 		dec(contador)
	MOVLW      1
	SUBWF      _contador+0, 1
	BTFSS      STATUS+0, 0
	DECF       _contador+1, 1
;Luz_Android_Dimmer.mbas,72 :: 		receive=0
	CLRF       _receive+0
;Luz_Android_Dimmer.mbas,73 :: 		LUZ= (contador*255)/80
	MOVF       _contador+0, 0
	MOVWF      R0+0
	MOVF       _contador+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      80
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _LUZ+0
	MOVF       R0+1, 0
	MOVWF      _LUZ+1
;Luz_Android_Dimmer.mbas,74 :: 		Delay_5ms
	CALL       _Delay_5ms+0
L__main21:
;Luz_Android_Dimmer.mbas,76 :: 		if contador>=80 THEN
	MOVLW      0
	SUBWF      _contador+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      80
	SUBWF      _contador+0, 0
L__main55:
	BTFSS      STATUS+0, 0
	GOTO       L__main24
;Luz_Android_Dimmer.mbas,77 :: 		contador = 79
	MOVLW      79
	MOVWF      _contador+0
	CLRF       _contador+1
L__main24:
;Luz_Android_Dimmer.mbas,79 :: 		if contador <= 0 THEN
	MOVF       _contador+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _contador+0, 0
	SUBLW      0
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L__main27
;Luz_Android_Dimmer.mbas,80 :: 		contador = 1
	MOVLW      1
	MOVWF      _contador+0
	CLRF       _contador+1
L__main27:
;Luz_Android_Dimmer.mbas,82 :: 		if receive = "A" then
	MOVF       _receive+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;Luz_Android_Dimmer.mbas,83 :: 		PORTA.RA2=NOT(PORTA.RA2)
	MOVLW      4
	XORWF      PORTA+0, 1
L__main30:
;Luz_Android_Dimmer.mbas,85 :: 		if receive = "B" then
	MOVF       _receive+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;Luz_Android_Dimmer.mbas,86 :: 		PORTA.RA3=NOT(PORTA.RA3)
	MOVLW      8
	XORWF      PORTA+0, 1
L__main33:
;Luz_Android_Dimmer.mbas,88 :: 		if receive = "C" then
	MOVF       _receive+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;Luz_Android_Dimmer.mbas,89 :: 		PORTA.RA4=NOT(PORTA.RA4)
	MOVLW      16
	XORWF      PORTA+0, 1
L__main36:
;Luz_Android_Dimmer.mbas,91 :: 		if receive = "D" then
	MOVF       _receive+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;Luz_Android_Dimmer.mbas,92 :: 		PORTA.RA5=NOT(PORTA.RA5)
	MOVLW      32
	XORWF      PORTA+0, 1
L__main39:
;Luz_Android_Dimmer.mbas,94 :: 		if receive = "E" then
	MOVF       _receive+0, 0
	XORLW      69
	BTFSS      STATUS+0, 2
	GOTO       L__main42
;Luz_Android_Dimmer.mbas,95 :: 		PORTB.RB1=NOT(PORTB.RB1)
	MOVLW      2
	XORWF      PORTB+0, 1
L__main42:
;Luz_Android_Dimmer.mbas,97 :: 		if receive = "F" then
	MOVF       _receive+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L__main45
;Luz_Android_Dimmer.mbas,98 :: 		PORTB.RB2=NOT(PORTB.RB2)
	MOVLW      4
	XORWF      PORTB+0, 1
L__main45:
;Luz_Android_Dimmer.mbas,100 :: 		if receive = "G" then
	MOVF       _receive+0, 0
	XORLW      71
	BTFSS      STATUS+0, 2
	GOTO       L__main48
;Luz_Android_Dimmer.mbas,101 :: 		PORTC.RC1=NOT(PORTC.RC1)
	MOVLW      2
	XORWF      PORTC+0, 1
L__main48:
;Luz_Android_Dimmer.mbas,103 :: 		if receive = "H" then
	MOVF       _receive+0, 0
	XORLW      72
	BTFSS      STATUS+0, 2
	GOTO       L__main51
;Luz_Android_Dimmer.mbas,104 :: 		PORTA.RC2=NOT(PORTC.RC2)
	BTFSC      PORTC+0, 2
	GOTO       L__main57
	BSF        PORTA+0, 2
	GOTO       L__main58
L__main57:
	BCF        PORTA+0, 2
L__main58:
L__main51:
;Luz_Android_Dimmer.mbas,106 :: 		Delay_ms(50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L__main53:
	DECFSZ     R13+0, 1
	GOTO       L__main53
	DECFSZ     R12+0, 1
	GOTO       L__main53
	NOP
;Luz_Android_Dimmer.mbas,107 :: 		RECEIVE=0
	CLRF       _receive+0
;Luz_Android_Dimmer.mbas,109 :: 		WEND
	GOTO       L__main10
	GOTO       $+0
; end of _main
