
pinza_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;pinza.mbas,5 :: 		sub procedure interrupt
;pinza.mbas,6 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_pinza_interrupt2
;pinza.mbas,7 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_pinza_interrupt5
;pinza.mbas,8 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;pinza.mbas,9 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;pinza.mbas,10 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;pinza.mbas,11 :: 		GOTO final
	GOTO       L_pinza_interrupt_final
L_pinza_interrupt5:
;pinza.mbas,13 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_pinza_interrupt9
;pinza.mbas,14 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;pinza.mbas,15 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;pinza.mbas,16 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;pinza.mbas,17 :: 		GOTO final
	GOTO       L_pinza_interrupt_final
L_pinza_interrupt9:
;pinza.mbas,18 :: 		end if
L_pinza_interrupt2:
;pinza.mbas,20 :: 		final:
L_pinza_interrupt_final:
;pinza.mbas,21 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;pinza.mbas,22 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_pinza_interrupt36:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of pinza_interrupt

pinza_ver:

;pinza.mbas,24 :: 		sub procedure ver(dim numero as byte)
;pinza.mbas,25 :: 		if numero = 2 then  'ABRIR
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_pinza_ver13
;pinza.mbas,26 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;pinza.mbas,27 :: 		giro2=242
	MOVLW      242
	MOVWF      _giro2+0
L_pinza_ver13:
;pinza.mbas,30 :: 		if numero = 3 then  'CERRAR
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_pinza_ver16
;pinza.mbas,31 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;pinza.mbas,32 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
L_pinza_ver16:
;pinza.mbas,33 :: 		END IF
	RETURN
; end of pinza_ver

_main:

;pinza.mbas,36 :: 		main:
;pinza.mbas,37 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;pinza.mbas,39 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;pinza.mbas,40 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pinza.mbas,42 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;pinza.mbas,43 :: 		PORTA = 0X00
	CLRF       PORTA+0
;pinza.mbas,45 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;pinza.mbas,46 :: 		PORTB = 0X00
	CLRF       PORTB+0
;pinza.mbas,48 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;pinza.mbas,49 :: 		PORTC = 0X00
	CLRF       PORTC+0
;pinza.mbas,51 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;pinza.mbas,52 :: 		PORTE = 0X00
	CLRF       PORTE+0
;pinza.mbas,54 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;pinza.mbas,55 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;pinza.mbas,56 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;pinza.mbas,57 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;pinza.mbas,58 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;pinza.mbas,61 :: 		dato=0
	CLRF       _dato+0
;pinza.mbas,62 :: 		centinela=0
	CLRF       _centinela+0
;pinza.mbas,63 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       pinza_ver+0
;pinza.mbas,64 :: 		while(1)
L__main20:
;pinza.mbas,68 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;pinza.mbas,69 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;pinza.mbas,70 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;pinza.mbas,71 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main25:
;pinza.mbas,75 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;pinza.mbas,76 :: 		centinela=0
	CLRF       _centinela+0
;pinza.mbas,77 :: 		if (dato="A") then   'ABRIR
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;pinza.mbas,78 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       pinza_ver+0
;pinza.mbas,79 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main31:
;pinza.mbas,81 :: 		if (dato="B") then   'CERRAR
	MOVF       _dato+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;pinza.mbas,82 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       pinza_ver+0
;pinza.mbas,83 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main34:
;pinza.mbas,84 :: 		end if
L__main28:
;pinza.mbas,91 :: 		wend
	GOTO       L__main20
	GOTO       $+0
; end of _main
