
control_carga_PULSO:

;control_carga.mbas,7 :: 		sub procedure PULSO
;control_carga.mbas,8 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;control_carga.mbas,9 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_control_carga_PULSO1:
	DECFSZ     R13+0, 1
	GOTO       L_control_carga_PULSO1
	DECFSZ     R12+0, 1
	GOTO       L_control_carga_PULSO1
	DECFSZ     R11+0, 1
	GOTO       L_control_carga_PULSO1
	NOP
	NOP
;control_carga.mbas,10 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;control_carga.mbas,11 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_control_carga_PULSO2:
	DECFSZ     R13+0, 1
	GOTO       L_control_carga_PULSO2
	DECFSZ     R12+0, 1
	GOTO       L_control_carga_PULSO2
	DECFSZ     R11+0, 1
	GOTO       L_control_carga_PULSO2
	NOP
	RETURN
; end of control_carga_PULSO

control_carga_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;control_carga.mbas,13 :: 		sub procedure interrupt()
;control_carga.mbas,15 :: 		if INTCON.TMR0IF=1 then
	BTFSS      INTCON+0, 2
	GOTO       L_control_carga_interrupt5
;control_carga.mbas,16 :: 		INTCON.TMR0IF=0
	BCF        INTCON+0, 2
;control_carga.mbas,17 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;control_carga.mbas,18 :: 		INTCON.TMR0IE = 0
	BCF        INTCON+0, 5
;control_carga.mbas,19 :: 		INTCON.INTE = 1
	BSF        INTCON+0, 4
L_control_carga_interrupt5:
;control_carga.mbas,21 :: 		if INTCON.INTF=1 then
	BTFSS      INTCON+0, 1
	GOTO       L_control_carga_interrupt8
;control_carga.mbas,22 :: 		INTCON.INTF=0
	BCF        INTCON+0, 1
;control_carga.mbas,23 :: 		TMR0 = LUZ
	MOVF       _LUZ+0, 0
	MOVWF      TMR0+0
;control_carga.mbas,24 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;control_carga.mbas,25 :: 		INTCON.TMR0IE = 1
	BSF        INTCON+0, 5
;control_carga.mbas,26 :: 		INTCON.INTE = 0
	BCF        INTCON+0, 4
L_control_carga_interrupt8:
;control_carga.mbas,27 :: 		end if
L_control_carga_interrupt80:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of control_carga_interrupt

_main:

;control_carga.mbas,30 :: 		main:
;control_carga.mbas,31 :: 		ANSEL  = 0x01                          ' Configure AN pins as digital I/O
	MOVLW      1
	MOVWF      ANSEL+0
;control_carga.mbas,32 :: 		ANSELH = 0
	CLRF       ANSELH+0
;control_carga.mbas,33 :: 		TRISA=0X01
	MOVLW      1
	MOVWF      TRISA+0
;control_carga.mbas,34 :: 		PORTA=0X00
	CLRF       PORTA+0
;control_carga.mbas,36 :: 		TRISB=0X01
	MOVLW      1
	MOVWF      TRISB+0
;control_carga.mbas,37 :: 		PORTB=0X00
	CLRF       PORTB+0
;control_carga.mbas,39 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;control_carga.mbas,40 :: 		PORTC=0X00
	CLRF       PORTC+0
;control_carga.mbas,42 :: 		TRISD=0X00
	CLRF       TRISD+0
;control_carga.mbas,43 :: 		PORTD=0X00
	CLRF       PORTD+0
;control_carga.mbas,45 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;control_carga.mbas,46 :: 		OPTION_REG=%1000100
	MOVLW      68
	MOVWF      OPTION_REG+0
;control_carga.mbas,47 :: 		INTCON=%11110000
	MOVLW      240
	MOVWF      INTCON+0
;control_carga.mbas,48 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_carga.mbas,49 :: 		TMR0=0
	CLRF       TMR0+0
;control_carga.mbas,50 :: 		TEMP=0
	CLRF       _TEMP+0
	CLRF       _TEMP+1
;control_carga.mbas,51 :: 		LUZ=0
	CLRF       _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,52 :: 		CONT=0
	CLRF       _CONT+0
;control_carga.mbas,53 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,54 :: 		datos_set=0X00
	CLRF       _datos_set+0
;control_carga.mbas,58 :: 		WHILE(1)
L__main13:
;control_carga.mbas,60 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main18
;control_carga.mbas,61 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
L__main18:
;control_carga.mbas,65 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
;control_carga.mbas,66 :: 		if receive=0X53 then 'S
	MOVF       _receive+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;control_carga.mbas,68 :: 		viajero=1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L__main26
;control_carga.mbas,69 :: 		else
L__main25:
;control_carga.mbas,70 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,71 :: 		end if
L__main26:
	GOTO       L__main20
L__main23:
;control_carga.mbas,72 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main29
;control_carga.mbas,73 :: 		if receive=0X31 then '1
	MOVF       _receive+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;control_carga.mbas,74 :: 		datos_set=1
	MOVLW      1
	MOVWF      _datos_set+0
L__main31:
;control_carga.mbas,77 :: 		if receive=0X32 then '2
	MOVF       _receive+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;control_carga.mbas,78 :: 		datos_set=2
	MOVLW      2
	MOVWF      _datos_set+0
L__main34:
;control_carga.mbas,80 :: 		if receive=0X33 then '3
	MOVF       _receive+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;control_carga.mbas,81 :: 		datos_set=3
	MOVLW      3
	MOVWF      _datos_set+0
L__main37:
;control_carga.mbas,83 :: 		if receive=0X34 then '4
	MOVF       _receive+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;control_carga.mbas,84 :: 		datos_set=4
	MOVLW      4
	MOVWF      _datos_set+0
L__main40:
;control_carga.mbas,86 :: 		if receive=0X35 then '5
	MOVF       _receive+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main43
;control_carga.mbas,87 :: 		datos_set=5
	MOVLW      5
	MOVWF      _datos_set+0
L__main43:
;control_carga.mbas,89 :: 		if receive=0X36 then '6
	MOVF       _receive+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main46
;control_carga.mbas,90 :: 		datos_set=6
	MOVLW      6
	MOVWF      _datos_set+0
L__main46:
;control_carga.mbas,92 :: 		if receive=0X37 then '7
	MOVF       _receive+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L__main49
;control_carga.mbas,93 :: 		datos_set=7
	MOVLW      7
	MOVWF      _datos_set+0
L__main49:
;control_carga.mbas,95 :: 		if receive=0X38 then '8
	MOVF       _receive+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L__main52
;control_carga.mbas,96 :: 		datos_set=8
	MOVLW      8
	MOVWF      _datos_set+0
L__main52:
;control_carga.mbas,97 :: 		end if
	GOTO       L__main20
L__main29:
L__main20:
;control_carga.mbas,104 :: 		CASE 1
	MOVF       _datos_set+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main58
;control_carga.mbas,105 :: 		LUZ=0
	CLRF       _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,106 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,107 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,108 :: 		PORTD=1
	MOVLW      1
	MOVWF      PORTD+0
;control_carga.mbas,109 :: 		UART1_Write_Text("NIVEL1")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      49
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main58:
;control_carga.mbas,110 :: 		CASE 2
	MOVF       _datos_set+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main61
;control_carga.mbas,111 :: 		LUZ=30
	MOVLW      30
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,112 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,113 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,114 :: 		PORTD=2
	MOVLW      2
	MOVWF      PORTD+0
;control_carga.mbas,115 :: 		UART1_Write_Text("NIVEL2")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      50
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main61:
;control_carga.mbas,116 :: 		CASE 3
	MOVF       _datos_set+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;control_carga.mbas,117 :: 		LUZ=50
	MOVLW      50
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,118 :: 		LUZ=60
	MOVLW      60
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,119 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,120 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,121 :: 		PORTD=4
	MOVLW      4
	MOVWF      PORTD+0
;control_carga.mbas,122 :: 		UART1_Write_Text("NIVEL3")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      51
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main64:
;control_carga.mbas,123 :: 		CASE 4
	MOVF       _datos_set+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;control_carga.mbas,124 :: 		LUZ=90
	MOVLW      90
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,125 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,126 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,127 :: 		PORTD=8
	MOVLW      8
	MOVWF      PORTD+0
;control_carga.mbas,128 :: 		UART1_Write_Text("NIVEL4")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      52
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main67:
;control_carga.mbas,129 :: 		CASE 5
	MOVF       _datos_set+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main70
;control_carga.mbas,130 :: 		LUZ=120
	MOVLW      120
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,131 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,132 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,133 :: 		PORTD=16
	MOVLW      16
	MOVWF      PORTD+0
;control_carga.mbas,134 :: 		UART1_Write_Text("NIVEL5")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      53
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main70:
;control_carga.mbas,135 :: 		CASE 6
	MOVF       _datos_set+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main73
;control_carga.mbas,136 :: 		LUZ=150
	MOVLW      150
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,137 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,138 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,139 :: 		PORTD=32
	MOVLW      32
	MOVWF      PORTD+0
;control_carga.mbas,140 :: 		UART1_Write_Text("NIVEL6")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      54
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main73:
;control_carga.mbas,141 :: 		CASE 7
	MOVF       _datos_set+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main76
;control_carga.mbas,142 :: 		LUZ=180
	MOVLW      180
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,143 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,144 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,145 :: 		PORTD=64
	MOVLW      64
	MOVWF      PORTD+0
;control_carga.mbas,146 :: 		UART1_Write_Text("NIVEL7")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      55
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main76:
;control_carga.mbas,147 :: 		CASE 8               'FOCO OFF
	MOVF       _datos_set+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main79
;control_carga.mbas,148 :: 		LUZ=210
	MOVLW      210
	MOVWF      _LUZ+0
	CLRF       _LUZ+1
;control_carga.mbas,149 :: 		datos_set=0
	CLRF       _datos_set+0
;control_carga.mbas,150 :: 		viajero=0
	CLRF       _viajero+0
;control_carga.mbas,151 :: 		PORTD=128
	MOVLW      128
	MOVWF      PORTD+0
;control_carga.mbas,152 :: 		UART1_Write_Text("NIVEL8")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
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
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      56
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	GOTO       L__main55
L__main79:
L__main55:
;control_carga.mbas,156 :: 		WEND
	GOTO       L__main13
	GOTO       $+0
; end of _main
