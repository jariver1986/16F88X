
gsm_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;gsm.mbas,9 :: 		sub procedure interrupt
;gsm.mbas,13 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_gsm_interrupt2
;gsm.mbas,14 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;gsm.mbas,16 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;gsm.mbas,18 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt7
;gsm.mbas,19 :: 		if (receive = "L") then '
	MOVF       _receive+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt9
;gsm.mbas,20 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt10
;gsm.mbas,21 :: 		else
L_gsm_interrupt9:
;gsm.mbas,22 :: 		viajero = 0
	CLRF       _viajero+0
;gsm.mbas,23 :: 		end if
L_gsm_interrupt10:
	GOTO       L_gsm_interrupt4
L_gsm_interrupt7:
;gsm.mbas,24 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt13
;gsm.mbas,25 :: 		if (receive = "U") then '
	MOVF       _receive+0, 0
	XORLW      85
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt15
;gsm.mbas,26 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt16
;gsm.mbas,27 :: 		else
L_gsm_interrupt15:
;gsm.mbas,28 :: 		viajero = 0
	CLRF       _viajero+0
;gsm.mbas,29 :: 		end if
L_gsm_interrupt16:
	GOTO       L_gsm_interrupt4
L_gsm_interrupt13:
;gsm.mbas,30 :: 		case 2
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt19
;gsm.mbas,31 :: 		if (receive = "Z")then '
	MOVF       _receive+0, 0
	XORLW      90
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt21
;gsm.mbas,32 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt22
;gsm.mbas,33 :: 		else
L_gsm_interrupt21:
;gsm.mbas,34 :: 		viajero = 0
	CLRF       _viajero+0
;gsm.mbas,35 :: 		end if
L_gsm_interrupt22:
	GOTO       L_gsm_interrupt4
L_gsm_interrupt19:
;gsm.mbas,36 :: 		case 3 '
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt25
;gsm.mbas,37 :: 		temp1=receive
	MOVF       _receive+0, 0
	MOVWF      _temp1+0
;gsm.mbas,38 :: 		viajero=4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt4
L_gsm_interrupt25:
;gsm.mbas,39 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt28
;gsm.mbas,40 :: 		temp2=receive
	MOVF       _receive+0, 0
	MOVWF      _temp2+0
;gsm.mbas,41 :: 		viajero=5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt4
L_gsm_interrupt28:
;gsm.mbas,42 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt31
;gsm.mbas,43 :: 		temp3=receive
	MOVF       _receive+0, 0
	MOVWF      _temp3+0
;gsm.mbas,44 :: 		viajero=6
	MOVLW      6
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt4
L_gsm_interrupt31:
;gsm.mbas,45 :: 		case 6
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt34
;gsm.mbas,46 :: 		temp4=receive
	MOVF       _receive+0, 0
	MOVWF      _temp4+0
;gsm.mbas,47 :: 		viajero=7
	MOVLW      7
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt4
L_gsm_interrupt34:
;gsm.mbas,48 :: 		case 7
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt37
;gsm.mbas,49 :: 		if (receive = "F")then ' ide temp
	MOVF       _receive+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_gsm_interrupt39
;gsm.mbas,50 :: 		viajero = 8
	MOVLW      8
	MOVWF      _viajero+0
	GOTO       L_gsm_interrupt40
;gsm.mbas,51 :: 		else
L_gsm_interrupt39:
;gsm.mbas,52 :: 		viajero = 0
	CLRF       _viajero+0
;gsm.mbas,53 :: 		end if
L_gsm_interrupt40:
	GOTO       L_gsm_interrupt4
L_gsm_interrupt37:
L_gsm_interrupt4:
;gsm.mbas,54 :: 		end select
L_gsm_interrupt2:
;gsm.mbas,56 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;gsm.mbas,57 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;gsm.mbas,58 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_gsm_interrupt58:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of gsm_interrupt

gsm_pila_mensaje:

;gsm.mbas,63 :: 		SUB PROCEDURE pila_mensaje()
;gsm.mbas,64 :: 		UART1_Write_Text("AT")
	MOVLW      65
	MOVWF      _pila_mensaje_Local_Text+0
	MOVLW      84
	MOVWF      _pila_mensaje_Local_Text+1
	CLRF       _pila_mensaje_Local_Text+2
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;gsm.mbas,65 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,66 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,67 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,68 :: 		UART1_Write_Text("AT+CMGS")
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
;gsm.mbas,69 :: 		UART1_Write(0X3D)
	MOVLW      61
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,70 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,71 :: 		UART1_Write_Text("0989267779")
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _pila_mensaje_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;gsm.mbas,72 :: 		UART1_Write(0X22)
	MOVLW      34
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,73 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,74 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,75 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of gsm_pila_mensaje

gsm_cola_mensaje:

;gsm.mbas,78 :: 		sub procedure cola_mensaje
;gsm.mbas,79 :: 		UART1_Write(0X1A)
	MOVLW      26
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,80 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,81 :: 		UART1_Write(0X41)
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,82 :: 		UART1_Write(0X54)
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,83 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,84 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,85 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,86 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,87 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,88 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,89 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,90 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of gsm_cola_mensaje

gsm_LLAMADA:

;gsm.mbas,93 :: 		SUB PROCEDURE LLAMADA()
;gsm.mbas,94 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,95 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,96 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,97 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,98 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,99 :: 		UART1_Write_Text("ATD0989267779")
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
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      57
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _LLAMADA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;gsm.mbas,100 :: 		UART1_Write(0X3B)
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,101 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,102 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,103 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,104 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,105 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,106 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,107 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,108 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,109 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,110 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,111 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,112 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,113 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,114 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,115 :: 		UART1_Write_Text("ATH")
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
;gsm.mbas,116 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,117 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,118 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,119 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,120 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,121 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,122 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,123 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,124 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,125 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,126 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,127 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,128 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;gsm.mbas,129 :: 		Delay_1sec
	CALL       _Delay_1sec+0
	RETURN
; end of gsm_LLAMADA

_main:

;gsm.mbas,132 :: 		main:
;gsm.mbas,133 :: 		OPTION_REG=%10000110' PULL-UP DISABLED ,PRESC=128
	MOVLW      134
	MOVWF      OPTION_REG+0
;gsm.mbas,136 :: 		OSCCON = 0X75 ' Oscilador interno de 4mhz
	MOVLW      117
	MOVWF      OSCCON+0
;gsm.mbas,138 :: 		INTCON = 0XE0 ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;gsm.mbas,141 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;gsm.mbas,142 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;gsm.mbas,145 :: 		TRISA = 0X00 ' PORTB salidas
	CLRF       TRISA+0
;gsm.mbas,146 :: 		PORTA = 0X00
	CLRF       PORTA+0
;gsm.mbas,149 :: 		TRISB = 0X00 ' PORTB salidas
	CLRF       TRISB+0
;gsm.mbas,150 :: 		PORTB = 0X00
	CLRF       PORTB+0
;gsm.mbas,152 :: 		TRISC = 0X0F ' PORTC salidas
	MOVLW      15
	MOVWF      TRISC+0
;gsm.mbas,153 :: 		PORTC = 0X00
	CLRF       PORTC+0
;gsm.mbas,156 :: 		TRISE = 0X00 ' PORTE salidas
	CLRF       TRISE+0
;gsm.mbas,157 :: 		PORTE = 0X00
	CLRF       PORTE+0
;gsm.mbas,159 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;gsm.mbas,160 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;gsm.mbas,161 :: 		FLANCO=0
	CLRF       _FLANCO+0
;gsm.mbas,162 :: 		viajero=0
	CLRF       _viajero+0
;gsm.mbas,163 :: 		bandera=0
	BCF        _bandera+0, BitPos(_bandera+0)
;gsm.mbas,164 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;gsm.mbas,165 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	DECFSZ     R11+0, 1
	GOTO       L__main45
	NOP
;gsm.mbas,166 :: 		UART1_Write(0X41)   'A
	MOVLW      65
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,167 :: 		UART1_Write(0X54)   'T
	MOVLW      84
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,168 :: 		UART1_Write(0X0D)    'enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,169 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,170 :: 		Delay_ms(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	DECFSZ     R11+0, 1
	GOTO       L__main46
	NOP
;gsm.mbas,172 :: 		WHILE(1)
L__main48:
;gsm.mbas,174 :: 		if viajero=8 then
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;gsm.mbas,175 :: 		viajero=0
	CLRF       _viajero+0
;gsm.mbas,176 :: 		if temp4 = 0x34 then
	MOVF       _temp4+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main56
;gsm.mbas,177 :: 		pila_mensaje()
	CALL       gsm_pila_mensaje+0
;gsm.mbas,178 :: 		UART1_Write_Text("ATENCION LUMINARIA LED ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
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
;gsm.mbas,179 :: 		UART1_Write(temp1)
	MOVF       _temp1+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,180 :: 		UART1_Write(temp2)
	MOVF       _temp2+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,181 :: 		UART1_Write(temp3)
	MOVF       _temp3+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;gsm.mbas,182 :: 		UART1_Write_Text(" MAL ESTADO CASA DON BOSCO. ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
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
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
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
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
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
;gsm.mbas,183 :: 		cola_mensaje()
	CALL       gsm_cola_mensaje+0
;gsm.mbas,184 :: 		LLAMADA()
	CALL       gsm_LLAMADA+0
;gsm.mbas,185 :: 		LLAMADA()
	CALL       gsm_LLAMADA+0
L__main56:
;gsm.mbas,186 :: 		end if
L__main53:
;gsm.mbas,189 :: 		WEND
	GOTO       L__main48
	GOTO       $+0
; end of _main
