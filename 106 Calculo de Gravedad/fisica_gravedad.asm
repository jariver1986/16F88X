
fisica_gravedad_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;fisica_gravedad.mbas,8 :: 		sub procedure interrupt
;fisica_gravedad.mbas,12 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_fisica_gravedad_interrupt2
;fisica_gravedad.mbas,13 :: 		inc(tiempo2)
	INCF       _tiempo2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tiempo2+1, 1
;fisica_gravedad.mbas,14 :: 		TMR0 = 251
	MOVLW      251
	MOVWF      TMR0+0
;fisica_gravedad.mbas,15 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_fisica_gravedad_interrupt2:
;fisica_gravedad.mbas,16 :: 		end if
L_fisica_gravedad_interrupt57:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of fisica_gravedad_interrupt

fisica_gravedad_ultrasonico1:

;fisica_gravedad.mbas,20 :: 		dim distan,tiempo as word
;fisica_gravedad.mbas,21 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;fisica_gravedad.mbas,23 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;fisica_gravedad.mbas,24 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_fisica_gravedad_ultrasonico15:
	DECFSZ     R13+0, 1
	GOTO       L_fisica_gravedad_ultrasonico15
	NOP
	NOP
;fisica_gravedad.mbas,25 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;fisica_gravedad.mbas,27 :: 		DO
L_fisica_gravedad_ultrasonico16:
;fisica_gravedad.mbas,28 :: 		IF( PORTC.RC1 = 1 )THEN
	BTFSS      PORTC+0, 1
	GOTO       L_fisica_gravedad_ultrasonico112
;fisica_gravedad.mbas,29 :: 		TMR0 = 0
	CLRF       TMR0+0
;fisica_gravedad.mbas,30 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_fisica_gravedad_ultrasonico112:
;fisica_gravedad.mbas,32 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_fisica_gravedad_ultrasonico19
	GOTO       L_fisica_gravedad_ultrasonico16
L_fisica_gravedad_ultrasonico19:
;fisica_gravedad.mbas,34 :: 		DO
L_fisica_gravedad_ultrasonico114:
;fisica_gravedad.mbas,35 :: 		IF( PORTC.RC1 = 0 )THEN
	BTFSC      PORTC+0, 1
	GOTO       L_fisica_gravedad_ultrasonico120
;fisica_gravedad.mbas,36 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;fisica_gravedad.mbas,37 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_fisica_gravedad_ultrasonico120:
;fisica_gravedad.mbas,42 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_fisica_gravedad_ultrasonico117
	GOTO       L_fisica_gravedad_ultrasonico114
L_fisica_gravedad_ultrasonico117:
;fisica_gravedad.mbas,44 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_fisica_gravedad_ultrasonico158:
	BTFSC      STATUS+0, 2
	GOTO       L_fisica_gravedad_ultrasonico159
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_fisica_gravedad_ultrasonico158
L_fisica_gravedad_ultrasonico159:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;fisica_gravedad.mbas,45 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_fisica_gravedad_ultrasonico122:
	DECFSZ     R13+0, 1
	GOTO       L_fisica_gravedad_ultrasonico122
	DECFSZ     R12+0, 1
	GOTO       L_fisica_gravedad_ultrasonico122
	NOP
;fisica_gravedad.mbas,46 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of fisica_gravedad_ultrasonico1

_main:

;fisica_gravedad.mbas,101 :: 		main:
;fisica_gravedad.mbas,102 :: 		OSCCON     =  0X65
	MOVLW      101
	MOVWF      OSCCON+0
;fisica_gravedad.mbas,103 :: 		OPTION_REG =  0x07
	MOVLW      7
	MOVWF      OPTION_REG+0
;fisica_gravedad.mbas,104 :: 		TRISA  = %00000000
	CLRF       TRISA+0
;fisica_gravedad.mbas,105 :: 		TRISB  = %00000000
	CLRF       TRISB+0
;fisica_gravedad.mbas,106 :: 		TRISC  = %00001110
	MOVLW      14
	MOVWF      TRISC+0
;fisica_gravedad.mbas,107 :: 		PORTA  = %00000000
	CLRF       PORTA+0
;fisica_gravedad.mbas,108 :: 		PORTB  = %00000000
	CLRF       PORTB+0
;fisica_gravedad.mbas,109 :: 		PORTC  = %00010000
	MOVLW      16
	MOVWF      PORTC+0
;fisica_gravedad.mbas,110 :: 		ANSEL  = %00000000
	CLRF       ANSEL+0
;fisica_gravedad.mbas,111 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;fisica_gravedad.mbas,112 :: 		TMR0 = 251
	MOVLW      251
	MOVWF      TMR0+0
;fisica_gravedad.mbas,113 :: 		tiempo=0
	CLRF       _tiempo+0
	CLRF       _tiempo+1
;fisica_gravedad.mbas,114 :: 		centinela=0
	CLRF       _centinela+0
;fisica_gravedad.mbas,115 :: 		INTCON = 0XA0
	MOVLW      160
	MOVWF      INTCON+0
;fisica_gravedad.mbas,116 :: 		turno=1
	MOVLW      1
	MOVWF      _turno+0
;fisica_gravedad.mbas,117 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;fisica_gravedad.mbas,119 :: 		while 1
L__main25:
;fisica_gravedad.mbas,120 :: 		if UART1_Data_Ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main30
;fisica_gravedad.mbas,121 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main30:
;fisica_gravedad.mbas,124 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;fisica_gravedad.mbas,126 :: 		DISTANCIA = ULTRASONICO1
	CALL       fisica_gravedad_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA+1
;fisica_gravedad.mbas,127 :: 		WordToStr(DISTANCIA,TEXTO)
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;fisica_gravedad.mbas,128 :: 		UART1_Write_Text("D")
	MOVLW      68
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;fisica_gravedad.mbas,129 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;fisica_gravedad.mbas,130 :: 		DATO =0
	CLRF       _DATO+0
;fisica_gravedad.mbas,131 :: 		TURNO = 2
	MOVLW      2
	MOVWF      _turno+0
L__main33:
;fisica_gravedad.mbas,136 :: 		if DATO = "2" then
	MOVF       _DATO+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;fisica_gravedad.mbas,137 :: 		PORTC.RC4=0
	BCF        PORTC+0, 4
;fisica_gravedad.mbas,138 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main38:
	DECFSZ     R13+0, 1
	GOTO       L__main38
	DECFSZ     R12+0, 1
	GOTO       L__main38
	DECFSZ     R11+0, 1
	GOTO       L__main38
	NOP
	NOP
;fisica_gravedad.mbas,139 :: 		PORTC.RC4=1
	BSF        PORTC+0, 4
;fisica_gravedad.mbas,140 :: 		PORTB = 255
	MOVLW      255
	MOVWF      PORTB+0
;fisica_gravedad.mbas,141 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;fisica_gravedad.mbas,142 :: 		DATO=0
	CLRF       _DATO+0
L__main36:
;fisica_gravedad.mbas,149 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;fisica_gravedad.mbas,150 :: 		if PORTC.RC2=1 then  ' LDR ARRIBA
	BTFSS      PORTC+0, 2
	GOTO       L__main43
;fisica_gravedad.mbas,151 :: 		tiempo2=0
	CLRF       _tiempo2+0
	CLRF       _tiempo2+1
;fisica_gravedad.mbas,152 :: 		UART1_Write_Text("ldr1")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
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
;fisica_gravedad.mbas,153 :: 		centinela=2
	MOVLW      2
	MOVWF      _centinela+0
L__main43:
;fisica_gravedad.mbas,154 :: 		end if
L__main40:
;fisica_gravedad.mbas,156 :: 		if centinela = 2 then
	MOVF       _centinela+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main46
;fisica_gravedad.mbas,157 :: 		if PORTC.RC3=1 then  'LDR ABAJO
	BTFSS      PORTC+0, 3
	GOTO       L__main49
;fisica_gravedad.mbas,158 :: 		variable = tiempo2
	MOVF       _tiempo2+0, 0
	MOVWF      _VARIABLE+0
	MOVF       _tiempo2+1, 0
	MOVWF      _VARIABLE+1
;fisica_gravedad.mbas,159 :: 		UART1_Write_Text("ldr2")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      114
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
;fisica_gravedad.mbas,160 :: 		centinela=3
	MOVLW      3
	MOVWF      _centinela+0
L__main49:
;fisica_gravedad.mbas,161 :: 		end if
L__main46:
;fisica_gravedad.mbas,164 :: 		if centinela=3 then
	MOVF       _centinela+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main52
;fisica_gravedad.mbas,165 :: 		WordToStr(variable,texto)
	MOVF       _VARIABLE+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _VARIABLE+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _texto+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;fisica_gravedad.mbas,166 :: 		UART1_Write_Text("T")
	MOVLW      84
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;fisica_gravedad.mbas,167 :: 		UART1_Write_Text(TEXTO)
	MOVLW      _texto+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;fisica_gravedad.mbas,168 :: 		centinela=0
	CLRF       _centinela+0
L__main52:
;fisica_gravedad.mbas,170 :: 		if DATO = "R" then
	MOVF       _DATO+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L__main55
;fisica_gravedad.mbas,171 :: 		GOTO MAIN
	GOTO       _main+0
;fisica_gravedad.mbas,172 :: 		DATO=0
	CLRF       _DATO+0
L__main55:
;fisica_gravedad.mbas,175 :: 		wend
	GOTO       L__main25
	GOTO       $+0
; end of _main
