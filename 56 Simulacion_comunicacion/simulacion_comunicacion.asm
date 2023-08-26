
_main:

;simulacion_comunicacion.mbas,5 :: 		main:
;simulacion_comunicacion.mbas,6 :: 		OSCCON=0X75
	MOVLW      117
	MOVWF      OSCCON+0
;simulacion_comunicacion.mbas,7 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;simulacion_comunicacion.mbas,8 :: 		TRISC = 0X80
	MOVLW      128
	MOVWF      TRISC+0
;simulacion_comunicacion.mbas,9 :: 		PORTC = 0X00
	CLRF       PORTC+0
;simulacion_comunicacion.mbas,10 :: 		dato=0
	CLRF       _dato+0
;simulacion_comunicacion.mbas,11 :: 		while(1)
L__main2:
;simulacion_comunicacion.mbas,13 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;simulacion_comunicacion.mbas,14 :: 		dato= UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
L__main7:
;simulacion_comunicacion.mbas,17 :: 		if (dato="A") then
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;simulacion_comunicacion.mbas,18 :: 		UART1_Write_Text("HOLA TECSU")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      72
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;simulacion_comunicacion.mbas,19 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;simulacion_comunicacion.mbas,20 :: 		dato=0
	CLRF       _dato+0
L__main10:
;simulacion_comunicacion.mbas,23 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
