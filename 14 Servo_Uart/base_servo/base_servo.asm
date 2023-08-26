
base_servo_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;base_servo.mbas,5 :: 		sub procedure interrupt
;base_servo.mbas,6 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_base_servo_interrupt2
;base_servo.mbas,7 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_base_servo_interrupt5
;base_servo.mbas,8 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;base_servo.mbas,9 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;base_servo.mbas,10 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;base_servo.mbas,11 :: 		GOTO final
	GOTO       L_base_servo_interrupt_final
L_base_servo_interrupt5:
;base_servo.mbas,13 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_base_servo_interrupt9
;base_servo.mbas,14 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;base_servo.mbas,15 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;base_servo.mbas,16 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;base_servo.mbas,17 :: 		GOTO final
	GOTO       L_base_servo_interrupt_final
L_base_servo_interrupt9:
;base_servo.mbas,18 :: 		end if
L_base_servo_interrupt2:
;base_servo.mbas,20 :: 		final:
L_base_servo_interrupt_final:
;base_servo.mbas,21 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;base_servo.mbas,22 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_base_servo_interrupt70:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of base_servo_interrupt

base_servo_ver:

;base_servo.mbas,24 :: 		sub procedure ver(dim numero as byte)
;base_servo.mbas,26 :: 		if (numero = 2) and (sentido=0) then     'frente INICIAL
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _sentido+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_base_servo_ver13
;base_servo.mbas,27 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;base_servo.mbas,28 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
L_base_servo_ver13:
;base_servo.mbas,31 :: 		if (numero = 2) and (sentido=3) then     'de izquierda al frente
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _sentido+0, 0
	XORLW      3
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_base_servo_ver16
;base_servo.mbas,32 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;base_servo.mbas,33 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
;base_servo.mbas,34 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,35 :: 		giro2=239
	MOVLW      239
	MOVWF      _giro2+0
;base_servo.mbas,36 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,37 :: 		giro2=240
	MOVLW      240
	MOVWF      _giro2+0
;base_servo.mbas,38 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,39 :: 		giro2=241
	MOVLW      241
	MOVWF      _giro2+0
;base_servo.mbas,40 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,41 :: 		giro2=242
	MOVLW      242
	MOVWF      _giro2+0
;base_servo.mbas,42 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,43 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
L_base_servo_ver16:
;base_servo.mbas,46 :: 		if (numero = 2) and (sentido=4) then     'de DERECHA al frente
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _sentido+0, 0
	XORLW      4
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_base_servo_ver19
;base_servo.mbas,47 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;base_servo.mbas,48 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;base_servo.mbas,49 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,50 :: 		giro2=250
	MOVLW      250
	MOVWF      _giro2+0
;base_servo.mbas,51 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,52 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
;base_servo.mbas,53 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,54 :: 		giro2=248
	MOVLW      248
	MOVWF      _giro2+0
;base_servo.mbas,55 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,56 :: 		giro2=247
	MOVLW      247
	MOVWF      _giro2+0
;base_servo.mbas,57 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,58 :: 		giro2=246
	MOVLW      246
	MOVWF      _giro2+0
;base_servo.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,60 :: 		giro2=245
	MOVLW      245
	MOVWF      _giro2+0
;base_servo.mbas,61 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,62 :: 		giro2=244
	MOVLW      244
	MOVWF      _giro2+0
;base_servo.mbas,63 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,64 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
L_base_servo_ver19:
;base_servo.mbas,68 :: 		if numero = 3 then  'izquierda
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_base_servo_ver22
;base_servo.mbas,69 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;base_servo.mbas,70 :: 		giro2=242
	MOVLW      242
	MOVWF      _giro2+0
;base_servo.mbas,71 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,72 :: 		giro2=241
	MOVLW      241
	MOVWF      _giro2+0
;base_servo.mbas,73 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,74 :: 		giro2=240
	MOVLW      240
	MOVWF      _giro2+0
;base_servo.mbas,75 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,76 :: 		giro2=239
	MOVLW      239
	MOVWF      _giro2+0
;base_servo.mbas,77 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,78 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
L_base_servo_ver22:
;base_servo.mbas,80 :: 		if numero = 4 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_base_servo_ver25
;base_servo.mbas,81 :: 		giro1=98         'derecha
	MOVLW      98
	MOVWF      _giro1+0
;base_servo.mbas,83 :: 		giro2=244
	MOVLW      244
	MOVWF      _giro2+0
;base_servo.mbas,84 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,85 :: 		giro2=245
	MOVLW      245
	MOVWF      _giro2+0
;base_servo.mbas,86 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,87 :: 		giro2=246
	MOVLW      246
	MOVWF      _giro2+0
;base_servo.mbas,88 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,89 :: 		giro2=247
	MOVLW      247
	MOVWF      _giro2+0
;base_servo.mbas,90 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,91 :: 		giro2=248
	MOVLW      248
	MOVWF      _giro2+0
;base_servo.mbas,92 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,93 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
;base_servo.mbas,94 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,95 :: 		giro2=250
	MOVLW      250
	MOVWF      _giro2+0
;base_servo.mbas,96 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,98 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
L_base_servo_ver25:
;base_servo.mbas,99 :: 		end if
	RETURN
; end of base_servo_ver

base_servo_PINZA_ABIERTA:

;base_servo.mbas,103 :: 		sub procedure PINZA_ABIERTA()
;base_servo.mbas,104 :: 		UART1_Write_Text("A") 'PINZA ABIERTA
	MOVLW      65
	MOVWF      _PINZA_ABIERTA_Local_Text+0
	CLRF       _PINZA_ABIERTA_Local_Text+1
	MOVLW      _PINZA_ABIERTA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;base_servo.mbas,105 :: 		UART1_Write_Text("A") 'PINZA ABIERTA
	MOVLW      65
	MOVWF      _PINZA_ABIERTA_Local_Text+0
	CLRF       _PINZA_ABIERTA_Local_Text+1
	MOVLW      _PINZA_ABIERTA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	RETURN
; end of base_servo_PINZA_ABIERTA

base_servo_PINZA_CERRADA:

;base_servo.mbas,107 :: 		sub procedure PINZA_CERRADA()
;base_servo.mbas,108 :: 		UART1_Write_Text("B") 'PINZA ABIERTA
	MOVLW      66
	MOVWF      _PINZA_CERRADA_Local_Text+0
	CLRF       _PINZA_CERRADA_Local_Text+1
	MOVLW      _PINZA_CERRADA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
	RETURN
; end of base_servo_PINZA_CERRADA

base_servo_BRAZO_ARRIBA:

;base_servo.mbas,110 :: 		sub procedure BRAZO_ARRIBA()
;base_servo.mbas,111 :: 		UART1_Write_Text("D")
	MOVLW      68
	MOVWF      _BRAZO_ARRIBA_Local_Text+0
	CLRF       _BRAZO_ARRIBA_Local_Text+1
	MOVLW      _BRAZO_ARRIBA_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;base_servo.mbas,112 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;base_servo.mbas,113 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
;base_servo.mbas,114 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;base_servo.mbas,115 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;base_servo.mbas,116 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
	RETURN
; end of base_servo_BRAZO_ARRIBA

base_servo_BRAZO_ABAJO:

;base_servo.mbas,118 :: 		sub procedure BRAZO_ABAJO()
;base_servo.mbas,119 :: 		UART1_Write_Text("C")
	MOVLW      67
	MOVWF      _BRAZO_ABAJO_Local_Text+0
	CLRF       _BRAZO_ABAJO_Local_Text+1
	MOVLW      _BRAZO_ABAJO_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;base_servo.mbas,120 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;base_servo.mbas,121 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;base_servo.mbas,122 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;base_servo.mbas,123 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;base_servo.mbas,124 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
	RETURN
; end of base_servo_BRAZO_ABAJO

base_servo_BASE_DERECHA:

;base_servo.mbas,126 :: 		sub procedure BASE_DERECHA()
;base_servo.mbas,127 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       base_servo_ver+0
;base_servo.mbas,128 :: 		sentido=4
	MOVLW      4
	MOVWF      _sentido+0
	RETURN
; end of base_servo_BASE_DERECHA

base_servo_BASE_FRENTE:

;base_servo.mbas,130 :: 		sub procedure BASE_FRENTE()
;base_servo.mbas,131 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       base_servo_ver+0
	RETURN
; end of base_servo_BASE_FRENTE

base_servo_BASE_IZQUIERDA:

;base_servo.mbas,133 :: 		sub procedure BASE_IZQUIERDA()
;base_servo.mbas,134 :: 		sentido=3
	MOVLW      3
	MOVWF      _sentido+0
;base_servo.mbas,135 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       base_servo_ver+0
	RETURN
; end of base_servo_BASE_IZQUIERDA

base_servo_tiempo:

;base_servo.mbas,138 :: 		sub procedure tiempo(dim segundos as byte)
;base_servo.mbas,139 :: 		contador=0
	CLRF       _contador+0
;base_servo.mbas,140 :: 		while(contador<>segundos)
L_base_servo_tiempo36:
	MOVF       _contador+0, 0
	XORWF      FARG_tiempo_segundos+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_base_servo_tiempo37
;base_servo.mbas,141 :: 		inc(contador)
	INCF       _contador+0, 1
;base_servo.mbas,142 :: 		Delay_1sec()
	CALL       _Delay_1sec+0
;base_servo.mbas,143 :: 		wend
	GOTO       L_base_servo_tiempo36
L_base_servo_tiempo37:
	RETURN
; end of base_servo_tiempo

_main:

;base_servo.mbas,148 :: 		main:
;base_servo.mbas,149 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;base_servo.mbas,151 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;base_servo.mbas,152 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;base_servo.mbas,154 :: 		TRISA = 0X01 ' PORTA.0 Entrada
	MOVLW      1
	MOVWF      TRISA+0
;base_servo.mbas,155 :: 		PORTA = 0X00
	CLRF       PORTA+0
;base_servo.mbas,157 :: 		TRISB = 0X20 ' PORTB
	MOVLW      32
	MOVWF      TRISB+0
;base_servo.mbas,158 :: 		PORTB = 0X00
	CLRF       PORTB+0
;base_servo.mbas,160 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;base_servo.mbas,161 :: 		PORTC = 0X00
	CLRF       PORTC+0
;base_servo.mbas,163 :: 		PORTD=0
	CLRF       PORTD+0
;base_servo.mbas,164 :: 		TRISD=0
	CLRF       TRISD+0
;base_servo.mbas,166 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;base_servo.mbas,167 :: 		PORTE = 0X00
	CLRF       PORTE+0
;base_servo.mbas,169 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;base_servo.mbas,170 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;base_servo.mbas,171 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;base_servo.mbas,172 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;base_servo.mbas,173 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;base_servo.mbas,174 :: 		sentido=0
	CLRF       _sentido+0
;base_servo.mbas,178 :: 		dato=0
	CLRF       _dato+0
;base_servo.mbas,179 :: 		centinela=0
	CLRF       _centinela+0
;base_servo.mbas,180 :: 		ver(2) 'base al frente
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       base_servo_ver+0
;base_servo.mbas,181 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,183 :: 		while(1)
L__main42:
;base_servo.mbas,184 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;base_servo.mbas,185 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;base_servo.mbas,189 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;base_servo.mbas,190 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main47:
;base_servo.mbas,192 :: 		if PORTB.RB5 =1 THEN
	BTFSS      PORTB+0, 5
	GOTO       L__main50
;base_servo.mbas,194 :: 		IF PORTA.RA0 = 1 THEN 'EN NEGRO
	BTFSS      PORTA+0, 0
	GOTO       L__main53
;base_servo.mbas,195 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;base_servo.mbas,196 :: 		PINZA_ABIERTA()   'A
	CALL       base_servo_PINZA_ABIERTA+0
;base_servo.mbas,197 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,198 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,199 :: 		BRAZO_ABAJO() 'C
	CALL       base_servo_BRAZO_ABAJO+0
;base_servo.mbas,200 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,201 :: 		PINZA_CERRADA()     'B
	CALL       base_servo_PINZA_CERRADA+0
;base_servo.mbas,202 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,203 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,204 :: 		BRAZO_ARRIBA()  'D
	CALL       base_servo_BRAZO_ARRIBA+0
;base_servo.mbas,205 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,206 :: 		BASE_DERECHA()    'BASE DERECHA
	CALL       base_servo_BASE_DERECHA+0
;base_servo.mbas,207 :: 		BRAZO_ABAJO()     'C
	CALL       base_servo_BRAZO_ABAJO+0
;base_servo.mbas,208 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,209 :: 		PINZA_ABIERTA()    'A
	CALL       base_servo_PINZA_ABIERTA+0
;base_servo.mbas,210 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,211 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,212 :: 		BRAZO_ARRIBA()       'D
	CALL       base_servo_BRAZO_ARRIBA+0
;base_servo.mbas,213 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,214 :: 		PINZA_CERRADA()     'B
	CALL       base_servo_PINZA_CERRADA+0
;base_servo.mbas,215 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,216 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,217 :: 		BASE_FRENTE() ' BASE FRENTE
	CALL       base_servo_BASE_FRENTE+0
;base_servo.mbas,218 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,219 :: 		PORTA.RA1 = 0
	BCF        PORTA+0, 1
L__main53:
;base_servo.mbas,222 :: 		if PORTA.RA0 = 0 then  ' ES BLANCO
	BTFSC      PORTA+0, 0
	GOTO       L__main56
;base_servo.mbas,223 :: 		PORTA.RA2 = 1
	BSF        PORTA+0, 2
;base_servo.mbas,224 :: 		PINZA_ABIERTA()
	CALL       base_servo_PINZA_ABIERTA+0
;base_servo.mbas,225 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,226 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,227 :: 		BRAZO_ABAJO()
	CALL       base_servo_BRAZO_ABAJO+0
;base_servo.mbas,228 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,229 :: 		PINZA_CERRADA()
	CALL       base_servo_PINZA_CERRADA+0
;base_servo.mbas,230 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,231 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,232 :: 		BRAZO_ARRIBA()
	CALL       base_servo_BRAZO_ARRIBA+0
;base_servo.mbas,233 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,234 :: 		BASE_IZQUIERDA()    'BASE IZQUIERDA
	CALL       base_servo_BASE_IZQUIERDA+0
;base_servo.mbas,235 :: 		BRAZO_ABAJO()
	CALL       base_servo_BRAZO_ABAJO+0
;base_servo.mbas,236 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,237 :: 		PINZA_ABIERTA()
	CALL       base_servo_PINZA_ABIERTA+0
;base_servo.mbas,238 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,239 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,240 :: 		BRAZO_ARRIBA()
	CALL       base_servo_BRAZO_ARRIBA+0
;base_servo.mbas,241 :: 		tiempo(8)
	MOVLW      8
	MOVWF      FARG_tiempo_segundos+0
	CALL       base_servo_tiempo+0
;base_servo.mbas,242 :: 		PINZA_CERRADA()
	CALL       base_servo_PINZA_CERRADA+0
;base_servo.mbas,243 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,244 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,245 :: 		BASE_FRENTE() ' BASE FRENTE
	CALL       base_servo_BASE_FRENTE+0
;base_servo.mbas,246 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;base_servo.mbas,247 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
L__main56:
;base_servo.mbas,248 :: 		end if
L__main50:
;base_servo.mbas,251 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main59
;base_servo.mbas,252 :: 		centinela=0
	CLRF       _centinela+0
;base_servo.mbas,253 :: 		if (dato=0x31) then 'FRENTE
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main62
;base_servo.mbas,254 :: 		BASE_FRENTE()
	CALL       base_servo_BASE_FRENTE+0
;base_servo.mbas,255 :: 		sentido=2
	MOVLW      2
	MOVWF      _sentido+0
;base_servo.mbas,257 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main62:
;base_servo.mbas,259 :: 		if (dato=0x32) then  'IZQUIERDA
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main65
;base_servo.mbas,260 :: 		BASE_IZQUIERDA()
	CALL       base_servo_BASE_IZQUIERDA+0
;base_servo.mbas,261 :: 		sentido=3
	MOVLW      3
	MOVWF      _sentido+0
;base_servo.mbas,263 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main65:
;base_servo.mbas,265 :: 		if (dato=0x33) then  'DERECHA
	MOVF       _dato+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main68
;base_servo.mbas,266 :: 		BASE_DERECHA()
	CALL       base_servo_BASE_DERECHA+0
;base_servo.mbas,267 :: 		sentido=4
	MOVLW      4
	MOVWF      _sentido+0
;base_servo.mbas,269 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main68:
;base_servo.mbas,270 :: 		end if
L__main59:
;base_servo.mbas,273 :: 		wend
	GOTO       L__main42
	GOTO       $+0
; end of _main
