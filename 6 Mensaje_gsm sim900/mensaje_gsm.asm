
mensaje_gsm_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;mensaje_gsm.mbas,10 :: 		sub procedure interrupt
;mensaje_gsm.mbas,14 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_mensaje_gsm_interrupt2
;mensaje_gsm.mbas,15 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;mensaje_gsm.mbas,17 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;mensaje_gsm.mbas,19 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt7
;mensaje_gsm.mbas,20 :: 		if (receive = 0x52) or (receive = 0x2B) then ' I
	MOVF       _receive+0, 0
	XORLW      82
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _receive+0, 0
	XORLW      43
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt9
;mensaje_gsm.mbas,21 :: 		viajero = 4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_mensaje_gsm_interrupt10
;mensaje_gsm.mbas,22 :: 		else
L_mensaje_gsm_interrupt9:
;mensaje_gsm.mbas,23 :: 		viajero = 0
	CLRF       _viajero+0
;mensaje_gsm.mbas,24 :: 		end if
L_mensaje_gsm_interrupt10:
	GOTO       L_mensaje_gsm_interrupt4
L_mensaje_gsm_interrupt7:
;mensaje_gsm.mbas,25 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt13
;mensaje_gsm.mbas,26 :: 		if (receive = 0x49) OR (receive = 0x43) then ' ide temp
	MOVF       _receive+0, 0
	XORLW      73
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _receive+0, 0
	XORLW      67
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt15
;mensaje_gsm.mbas,27 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_mensaje_gsm_interrupt16
;mensaje_gsm.mbas,28 :: 		else
L_mensaje_gsm_interrupt15:
;mensaje_gsm.mbas,29 :: 		viajero = 0
	CLRF       _viajero+0
;mensaje_gsm.mbas,30 :: 		end if
L_mensaje_gsm_interrupt16:
	GOTO       L_mensaje_gsm_interrupt4
L_mensaje_gsm_interrupt13:
;mensaje_gsm.mbas,31 :: 		case 2 ' display 1
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt19
;mensaje_gsm.mbas,32 :: 		if (receive = 0x4E) OR (receive = 0x4D)then ' ide temp
	MOVF       _receive+0, 0
	XORLW      78
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _receive+0, 0
	XORLW      77
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt21
;mensaje_gsm.mbas,33 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_mensaje_gsm_interrupt22
;mensaje_gsm.mbas,34 :: 		else
L_mensaje_gsm_interrupt21:
;mensaje_gsm.mbas,35 :: 		viajero = 0
	CLRF       _viajero+0
;mensaje_gsm.mbas,36 :: 		end if
L_mensaje_gsm_interrupt22:
	GOTO       L_mensaje_gsm_interrupt4
L_mensaje_gsm_interrupt19:
;mensaje_gsm.mbas,37 :: 		case 3 ' display 2
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt25
;mensaje_gsm.mbas,38 :: 		if (receive = 0x47) OR (receive = 0x54)then ' ide temp
	MOVF       _receive+0, 0
	XORLW      71
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _receive+0, 0
	XORLW      84
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_mensaje_gsm_interrupt27
;mensaje_gsm.mbas,39 :: 		viajero = 4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_mensaje_gsm_interrupt28
;mensaje_gsm.mbas,40 :: 		else
L_mensaje_gsm_interrupt27:
;mensaje_gsm.mbas,41 :: 		viajero = 0
	CLRF       _viajero+0
;mensaje_gsm.mbas,42 :: 		end if
L_mensaje_gsm_interrupt28:
	GOTO       L_mensaje_gsm_interrupt4
L_mensaje_gsm_interrupt25:
L_mensaje_gsm_interrupt4:
;mensaje_gsm.mbas,43 :: 		end select
L_mensaje_gsm_interrupt2:
;mensaje_gsm.mbas,45 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;mensaje_gsm.mbas,46 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;mensaje_gsm.mbas,47 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_mensaje_gsm_interrupt61:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of mensaje_gsm_interrupt

mensaje_gsm_led1:

;mensaje_gsm.mbas,51 :: 		sub procedure led1
;mensaje_gsm.mbas,52 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
	RETURN
; end of mensaje_gsm_led1

mensaje_gsm_noled1:

;mensaje_gsm.mbas,54 :: 		sub procedure noled1
;mensaje_gsm.mbas,55 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
	RETURN
; end of mensaje_gsm_noled1

mensaje_gsm_led2:

;mensaje_gsm.mbas,57 :: 		sub procedure led2
;mensaje_gsm.mbas,58 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
	RETURN
; end of mensaje_gsm_led2

mensaje_gsm_noled2:

;mensaje_gsm.mbas,60 :: 		sub procedure noled2
;mensaje_gsm.mbas,61 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
	RETURN
; end of mensaje_gsm_noled2

mensaje_gsm_led3:

;mensaje_gsm.mbas,63 :: 		sub procedure led3
;mensaje_gsm.mbas,64 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
	RETURN
; end of mensaje_gsm_led3

mensaje_gsm_noled3:

;mensaje_gsm.mbas,66 :: 		sub procedure noled3
;mensaje_gsm.mbas,67 :: 		PORTB.RB2=0
	BCF        PORTB+0, 2
	RETURN
; end of mensaje_gsm_noled3

mensaje_gsm_led4:

;mensaje_gsm.mbas,69 :: 		sub procedure led4
;mensaje_gsm.mbas,70 :: 		PORTB.RB3=1
	BSF        PORTB+0, 3
	RETURN
; end of mensaje_gsm_led4

mensaje_gsm_noled4:

;mensaje_gsm.mbas,72 :: 		sub procedure noled4
;mensaje_gsm.mbas,73 :: 		PORTB.RB3=0
	BCF        PORTB+0, 3
	RETURN
; end of mensaje_gsm_noled4

mensaje_gsm_pila_mensaje:

;mensaje_gsm.mbas,75 :: 		SUB PROCEDURE pila_mensaje()
;mensaje_gsm.mbas,76 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _pila_mensaje_Local_Text+0
	MOVLW      84
	MOVWF      _pila_mensaje_Local_Text+1
	CLRF       _pila_mensaje_Local_Text+2
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;mensaje_gsm.mbas,77 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,78 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,79 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,80 :: 		UART1_Write_Text("AT+CMGS")
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
;mensaje_gsm.mbas,81 :: 		UART1_Write(0X3D)
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,82 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,83 :: 		UART1_Write_Text("0992409136")
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
;mensaje_gsm.mbas,84 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,85 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,86 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,87 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of mensaje_gsm_pila_mensaje

mensaje_gsm_cola_mensaje:

;mensaje_gsm.mbas,90 :: 		sub procedure cola_mensaje
;mensaje_gsm.mbas,91 :: 		UART1_Write(0X1A)
	MOVLW      26
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,92 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,93 :: 		UART1_Write(0X41)
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,94 :: 		UART1_Write(0X54)
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,95 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,96 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,97 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,98 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,99 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,100 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of mensaje_gsm_cola_mensaje

mensaje_gsm_LLAMADA:

;mensaje_gsm.mbas,103 :: 		SUB PROCEDURE LLAMADA()
;mensaje_gsm.mbas,104 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,105 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,106 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,107 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,108 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,109 :: 		UART1_Write_Text("ATD0992409136")
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
;mensaje_gsm.mbas,110 :: 		UART1_Write(0X3B)
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,111 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,112 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,113 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,114 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,115 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,116 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,117 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,118 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,119 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,120 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,121 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,122 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,123 :: 		UART1_Write_Text("ATH")
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
;mensaje_gsm.mbas,124 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,125 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,126 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,127 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,128 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,129 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,130 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,131 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,132 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,133 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,134 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,135 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,136 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,137 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of mensaje_gsm_LLAMADA

_main:

;mensaje_gsm.mbas,140 :: 		main:
;mensaje_gsm.mbas,141 :: 		OPTION_REG=%10000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      134
	MOVWF      OPTION_REG+0
;mensaje_gsm.mbas,144 :: 		OSCCON = 0X75 ' Oscilador interno de 4mhz
	MOVLW      117
	MOVWF      OSCCON+0
;mensaje_gsm.mbas,146 :: 		INTCON = 0XE0 ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;mensaje_gsm.mbas,149 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;mensaje_gsm.mbas,150 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;mensaje_gsm.mbas,153 :: 		TRISA = 0X00 ' PORTB salidas
	CLRF       TRISA+0
;mensaje_gsm.mbas,154 :: 		PORTA = 0X00
	CLRF       PORTA+0
;mensaje_gsm.mbas,157 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;mensaje_gsm.mbas,158 :: 		PORTB = 0X00
	CLRF       PORTB+0
;mensaje_gsm.mbas,160 :: 		TRISC = 0X0F ' PORTC salidas
	MOVLW      15
	MOVWF      TRISC+0
;mensaje_gsm.mbas,161 :: 		PORTC = 0X00
	CLRF       PORTC+0
;mensaje_gsm.mbas,162 :: 		TRISD = 0X00 ' PORTC salidas
	CLRF       TRISD+0
;mensaje_gsm.mbas,163 :: 		PORTD = 0X00
	CLRF       PORTD+0
;mensaje_gsm.mbas,166 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;mensaje_gsm.mbas,167 :: 		PORTE = 0X00
	CLRF       PORTE+0
;mensaje_gsm.mbas,169 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;mensaje_gsm.mbas,170 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;mensaje_gsm.mbas,171 :: 		FLANCO=0
	CLRF       _FLANCO+0
;mensaje_gsm.mbas,172 :: 		viajero=0
	CLRF       _viajero+0
;mensaje_gsm.mbas,173 :: 		bandera=0
	BCF        _bandera+0, BitPos(_bandera+0)
;mensaje_gsm.mbas,174 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;mensaje_gsm.mbas,175 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main41:
	DECFSZ     R13+0, 1
	GOTO       L__main41
	DECFSZ     R12+0, 1
	GOTO       L__main41
	DECFSZ     R11+0, 1
	GOTO       L__main41
	NOP
;mensaje_gsm.mbas,176 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,177 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,178 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,179 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;mensaje_gsm.mbas,180 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main42:
	DECFSZ     R13+0, 1
	GOTO       L__main42
	DECFSZ     R12+0, 1
	GOTO       L__main42
	DECFSZ     R11+0, 1
	GOTO       L__main42
	NOP
;mensaje_gsm.mbas,182 :: 		WHILE(1)
L__main44:
;mensaje_gsm.mbas,183 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,184 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,185 :: 		if PORTC.RC0=1 then  'SI AUN HAY ENERGIA
	BTFSS      PORTC+0, 0
	GOTO       L__main49
;mensaje_gsm.mbas,186 :: 		led1()
	CALL       mensaje_gsm_led1+0
;mensaje_gsm.mbas,187 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;mensaje_gsm.mbas,188 :: 		IF PORTC.RC1=1 THEN
	BTFSS      PORTC+0, 1
	GOTO       L__main52
;mensaje_gsm.mbas,189 :: 		led2()
	CALL       mensaje_gsm_led2+0
;mensaje_gsm.mbas,190 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,191 :: 		pila_mensaje()
	CALL       mensaje_gsm_pila_mensaje+0
;mensaje_gsm.mbas,192 :: 		UART1_Write_Text("INGRESO NO AUTORIZADO POR LA PUERTA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;mensaje_gsm.mbas,193 :: 		cola_mensaje()
	CALL       mensaje_gsm_cola_mensaje+0
	GOTO       L__main53
;mensaje_gsm.mbas,194 :: 		else
L__main52:
;mensaje_gsm.mbas,195 :: 		noled2()
	CALL       mensaje_gsm_noled2+0
;mensaje_gsm.mbas,196 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;mensaje_gsm.mbas,197 :: 		END IF
L__main53:
;mensaje_gsm.mbas,199 :: 		IF PORTC.RC2=0 THEN
	BTFSC      PORTC+0, 2
	GOTO       L__main55
;mensaje_gsm.mbas,200 :: 		noled3()
	CALL       mensaje_gsm_noled3+0
;mensaje_gsm.mbas,201 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,202 :: 		pila_mensaje()
	CALL       mensaje_gsm_pila_mensaje+0
;mensaje_gsm.mbas,203 :: 		UART1_Write_Text("INGRESO NO AUTORIZADO POR LA VENTANA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
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
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
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
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      90
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      80
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;mensaje_gsm.mbas,204 :: 		cola_mensaje()
	CALL       mensaje_gsm_cola_mensaje+0
	GOTO       L__main56
;mensaje_gsm.mbas,205 :: 		ELSE
L__main55:
;mensaje_gsm.mbas,206 :: 		led3()
	CALL       mensaje_gsm_led3+0
;mensaje_gsm.mbas,207 :: 		END IF
L__main56:
;mensaje_gsm.mbas,209 :: 		IF PORTC.RC3=0 THEN
	BTFSC      PORTC+0, 3
	GOTO       L__main58
;mensaje_gsm.mbas,210 :: 		noled4()
	CALL       mensaje_gsm_noled4+0
;mensaje_gsm.mbas,211 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;mensaje_gsm.mbas,212 :: 		pila_mensaje()
	CALL       mensaje_gsm_pila_mensaje+0
;mensaje_gsm.mbas,213 :: 		UART1_Write_Text("INTRUSO DENTRO DE LA CASA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;mensaje_gsm.mbas,214 :: 		cola_mensaje()
	CALL       mensaje_gsm_cola_mensaje+0
	GOTO       L__main59
;mensaje_gsm.mbas,215 :: 		else
L__main58:
;mensaje_gsm.mbas,216 :: 		led4()
	CALL       mensaje_gsm_led4+0
;mensaje_gsm.mbas,217 :: 		END IF
L__main59:
	GOTO       L__main50
;mensaje_gsm.mbas,218 :: 		ELSE
L__main49:
;mensaje_gsm.mbas,219 :: 		noled1()             'SI NO HAY ENERGIA
	CALL       mensaje_gsm_noled1+0
;mensaje_gsm.mbas,220 :: 		LLAMADA()
	CALL       mensaje_gsm_LLAMADA+0
;mensaje_gsm.mbas,221 :: 		LLAMADA()
	CALL       mensaje_gsm_LLAMADA+0
;mensaje_gsm.mbas,222 :: 		LLAMADA()
	CALL       mensaje_gsm_LLAMADA+0
;mensaje_gsm.mbas,223 :: 		pila_mensaje()
	CALL       mensaje_gsm_pila_mensaje+0
;mensaje_gsm.mbas,224 :: 		UART1_Write_Text("CORTE DE ENERGIA DE LA CASA")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      82
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      71
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
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
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;mensaje_gsm.mbas,225 :: 		cola_mensaje()
	CALL       mensaje_gsm_cola_mensaje+0
;mensaje_gsm.mbas,226 :: 		END IF
L__main50:
;mensaje_gsm.mbas,228 :: 		Delay_ms(50)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main60:
	DECFSZ     R13+0, 1
	GOTO       L__main60
	DECFSZ     R12+0, 1
	GOTO       L__main60
	NOP
	NOP
;mensaje_gsm.mbas,230 :: 		WEND
	GOTO       L__main44
	GOTO       $+0
; end of _main
