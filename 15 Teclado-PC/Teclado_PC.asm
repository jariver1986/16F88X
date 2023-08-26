
_main:

;Teclado_PC.mbas,12 :: 		main:
;Teclado_PC.mbas,13 :: 		ANSEL  = 0              ' Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Teclado_PC.mbas,14 :: 		ANSELH = 0
	CLRF       ANSELH+0
;Teclado_PC.mbas,15 :: 		PORTC=0
	CLRF       PORTC+0
;Teclado_PC.mbas,16 :: 		OSCCON= 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;Teclado_PC.mbas,18 :: 		UART1_Init(19200)             ' Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Teclado_PC.mbas,19 :: 		Ps2_Config()                  ' Init PS/2 Keyboard
	CALL       _Ps2_Config+0
;Teclado_PC.mbas,20 :: 		Delay_ms(100)                 ' Wait for keyboard to finish
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main1:
	DECFSZ     R13+0, 1
	GOTO       L__main1
	DECFSZ     R12+0, 1
	GOTO       L__main1
	DECFSZ     R11+0, 1
	GOTO       L__main1
	NOP
;Teclado_PC.mbas,21 :: 		UART1_Write_Text("Ready")     ' Ready
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      121
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Teclado_PC.mbas,23 :: 		while TRUE                                          ' Endless loop
L__main3:
;Teclado_PC.mbas,24 :: 		if Ps2_Key_Read(keydata, special, down) then      ' If data was read from PS/2
	MOVLW      _keydata+0
	MOVWF      FARG_Ps2_Key_Read_value+0
	MOVLW      _special+0
	MOVWF      FARG_Ps2_Key_Read_special+0
	MOVLW      _down+0
	MOVWF      FARG_Ps2_Key_Read_pressed+0
	CALL       _Ps2_Key_Read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main8
;Teclado_PC.mbas,25 :: 		if (down <> 0) and (keydata = 16) then          ' Backspace read
	MOVF       _down+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _keydata+0, 0
	XORLW      16
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main11
;Teclado_PC.mbas,26 :: 		UART1_Write(0x08)                             ' Send Backspace to usart terminal
	MOVLW      8
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main12
;Teclado_PC.mbas,27 :: 		else
L__main11:
;Teclado_PC.mbas,28 :: 		if (down <> 0) and (keydata = 13) then        ' Enter read
	MOVF       _down+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _keydata+0, 0
	XORLW      13
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main14
;Teclado_PC.mbas,29 :: 		UART1_Write(10)                             ' Send carriage return to usart terminal
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Teclado_PC.mbas,30 :: 		UART1_Write(13)                             ' Uncomment this line if usart terminal also expects line feed
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L__main15
;Teclado_PC.mbas,32 :: 		else
L__main14:
;Teclado_PC.mbas,33 :: 		if (down <> 0) and (special = 0) and (keydata <> 0) then   ' Common key read
	MOVF       _down+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _special+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _keydata+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main17
;Teclado_PC.mbas,34 :: 		UART1_Write(keydata)                      ' Send key to usart terminal
	MOVF       _keydata+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
L__main17:
;Teclado_PC.mbas,36 :: 		end if
L__main15:
;Teclado_PC.mbas,37 :: 		end if
L__main12:
L__main8:
;Teclado_PC.mbas,39 :: 		Delay_ms(10)                                      ' Debounce period
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	NOP
;Teclado_PC.mbas,40 :: 		wend
	GOTO       L__main3
	GOTO       $+0
; end of _main
