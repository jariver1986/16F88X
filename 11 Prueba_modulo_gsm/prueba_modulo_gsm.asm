
prueba_modulo_gsm_pila_mensaje:

;prueba_modulo_gsm.mbas,12 :: 		SUB PROCEDURE pila_mensaje()
;prueba_modulo_gsm.mbas,13 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _pila_mensaje_Local_Text+0
	MOVLW      84
	MOVWF      _pila_mensaje_Local_Text+1
	CLRF       _pila_mensaje_Local_Text+2
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,14 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,15 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,16 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,17 :: 		UART1_Write_Text("AT+CMGS")
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      43
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,18 :: 		UART1_Write(0X3D)
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,19 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,20 :: 		UART1_Write_Text("0992409136")
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,21 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,22 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,23 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,24 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of prueba_modulo_gsm_pila_mensaje

prueba_modulo_gsm_cola_mensaje:

;prueba_modulo_gsm.mbas,27 :: 		sub procedure cola_mensaje
;prueba_modulo_gsm.mbas,28 :: 		UART1_Write(0X1A)
	MOVLW      26
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,29 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,30 :: 		UART1_Write(0X41)
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,31 :: 		UART1_Write(0X54)
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,32 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,33 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,34 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,35 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,36 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,37 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of prueba_modulo_gsm_cola_mensaje

prueba_modulo_gsm_LLAMADA:

;prueba_modulo_gsm.mbas,40 :: 		SUB PROCEDURE LLAMADA()
;prueba_modulo_gsm.mbas,41 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,42 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,43 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,44 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,45 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,46 :: 		UART1_Write_Text("ATD0992409136")
	MOVLW      _LLAMADA_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _LLAMADA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,47 :: 		UART1_Write(0X3B)
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,48 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,49 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,50 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,51 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,52 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,53 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,54 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,55 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,56 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,57 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,58 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,60 :: 		UART1_Write_Text("ATH")
	MOVLW      65
	MOVWF      _LLAMADA_Local_Text+0
	MOVLW      84
	MOVWF      _LLAMADA_Local_Text+1
	MOVLW      72
	MOVWF      _LLAMADA_Local_Text+2
	CLRF       _LLAMADA_Local_Text+3
	MOVLW      _LLAMADA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,61 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,62 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,63 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,64 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,66 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,67 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,68 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,69 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,70 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,71 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,72 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,73 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_modulo_gsm.mbas,74 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of prueba_modulo_gsm_LLAMADA

_main:

;prueba_modulo_gsm.mbas,77 :: 		main:
;prueba_modulo_gsm.mbas,78 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;prueba_modulo_gsm.mbas,80 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;prueba_modulo_gsm.mbas,81 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;prueba_modulo_gsm.mbas,83 :: 		TRISA =0X00
	CLRF       TRISA+0
;prueba_modulo_gsm.mbas,84 :: 		TRISB= 0X00
	CLRF       TRISB+0
;prueba_modulo_gsm.mbas,86 :: 		PORTB= 0X00
	CLRF       PORTB+0
;prueba_modulo_gsm.mbas,87 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;prueba_modulo_gsm.mbas,88 :: 		PORTC = 0x00
	CLRF       PORTC+0
;prueba_modulo_gsm.mbas,90 :: 		PORTE = 0x08
	MOVLW      8
	MOVWF      PORTE+0
;prueba_modulo_gsm.mbas,92 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;prueba_modulo_gsm.mbas,93 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;prueba_modulo_gsm.mbas,95 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;prueba_modulo_gsm.mbas,97 :: 		viajero=0
	CLRF       _viajero+0
;prueba_modulo_gsm.mbas,98 :: 		grabar = 0x00
	CLRF       _grabar+0
;prueba_modulo_gsm.mbas,99 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;prueba_modulo_gsm.mbas,101 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,102 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,103 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,104 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,105 :: 		Delay_ms(100)
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
;prueba_modulo_gsm.mbas,108 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _main_Local_Text+0
	MOVLW      84
	MOVWF      _main_Local_Text+1
	CLRF       _main_Local_Text+2
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,109 :: 		UART1_Write(0x0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,110 :: 		UART1_Write(0x0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;prueba_modulo_gsm.mbas,112 :: 		while(1)
L__main6:
;prueba_modulo_gsm.mbas,113 :: 		if PORTE.RE3=0 THEN
	BTFSC      PORTE+0, 3
	GOTO       L__main11
;prueba_modulo_gsm.mbas,114 :: 		LLAMADA()
	CALL       prueba_modulo_gsm_LLAMADA+0
;prueba_modulo_gsm.mbas,115 :: 		pila_mensaje()
	CALL       prueba_modulo_gsm_pila_mensaje+0
;prueba_modulo_gsm.mbas,116 :: 		UART1_Write_Text("MODULO GSM OK")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      75
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;prueba_modulo_gsm.mbas,117 :: 		cola_mensaje()
	CALL       prueba_modulo_gsm_cola_mensaje+0
L__main11:
;prueba_modulo_gsm.mbas,120 :: 		wend
	GOTO       L__main6
	GOTO       $+0
; end of _main
