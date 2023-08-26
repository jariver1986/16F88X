
brazo_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;brazo.mbas,5 :: 		sub procedure interrupt
;brazo.mbas,6 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_brazo_interrupt2
;brazo.mbas,7 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_interrupt5
;brazo.mbas,8 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;brazo.mbas,9 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;brazo.mbas,10 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;brazo.mbas,11 :: 		GOTO final
	GOTO       L_brazo_interrupt_final
L_brazo_interrupt5:
;brazo.mbas,13 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_interrupt9
;brazo.mbas,14 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;brazo.mbas,15 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;brazo.mbas,16 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;brazo.mbas,17 :: 		GOTO final
	GOTO       L_brazo_interrupt_final
L_brazo_interrupt9:
;brazo.mbas,18 :: 		end if
L_brazo_interrupt2:
;brazo.mbas,20 :: 		final:
L_brazo_interrupt_final:
;brazo.mbas,21 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;brazo.mbas,22 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_brazo_interrupt51:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of brazo_interrupt

brazo_ver:

;brazo.mbas,24 :: 		sub procedure ver(dim numero as byte)
;brazo.mbas,26 :: 		if (numero = 2)then    'ABAJO
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_ver13
;brazo.mbas,27 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;brazo.mbas,28 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;brazo.mbas,29 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,30 :: 		giro2=250
	MOVLW      250
	MOVWF      _giro2+0
;brazo.mbas,31 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,32 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
;brazo.mbas,33 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,34 :: 		giro2=248
	MOVLW      248
	MOVWF      _giro2+0
;brazo.mbas,35 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,36 :: 		giro2=247
	MOVLW      247
	MOVWF      _giro2+0
;brazo.mbas,37 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,38 :: 		giro2=246
	MOVLW      246
	MOVWF      _giro2+0
;brazo.mbas,39 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,40 :: 		giro2=245
	MOVLW      245
	MOVWF      _giro2+0
;brazo.mbas,41 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,42 :: 		giro2=244
	MOVLW      244
	MOVWF      _giro2+0
L_brazo_ver13:
;brazo.mbas,46 :: 		if (numero=4)  then     'ARRIBA
	MOVF       FARG_ver_numero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_ver16
;brazo.mbas,47 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;brazo.mbas,50 :: 		giro2=244
	MOVLW      244
	MOVWF      _giro2+0
;brazo.mbas,51 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,52 :: 		giro2=245
	MOVLW      245
	MOVWF      _giro2+0
;brazo.mbas,53 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,54 :: 		giro2=246
	MOVLW      246
	MOVWF      _giro2+0
;brazo.mbas,55 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,56 :: 		giro2=247
	MOVLW      247
	MOVWF      _giro2+0
;brazo.mbas,57 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,58 :: 		giro2=248
	MOVLW      248
	MOVWF      _giro2+0
;brazo.mbas,59 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,60 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
;brazo.mbas,61 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,62 :: 		giro2=250
	MOVLW      250
	MOVWF      _giro2+0
;brazo.mbas,63 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,64 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
L_brazo_ver16:
;brazo.mbas,66 :: 		if (numero=5)  then     'ARRIBA
	MOVF       FARG_ver_numero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_ver19
;brazo.mbas,67 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;brazo.mbas,70 :: 		giro2=244
	MOVLW      244
	MOVWF      _giro2+0
;brazo.mbas,71 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,72 :: 		giro2=245
	MOVLW      245
	MOVWF      _giro2+0
;brazo.mbas,73 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,74 :: 		giro2=246
	MOVLW      246
	MOVWF      _giro2+0
;brazo.mbas,75 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,76 :: 		giro2=247
	MOVLW      247
	MOVWF      _giro2+0
;brazo.mbas,77 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,78 :: 		giro2=248
	MOVLW      248
	MOVWF      _giro2+0
;brazo.mbas,79 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,80 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
;brazo.mbas,81 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,82 :: 		giro2=250
	MOVLW      250
	MOVWF      _giro2+0
;brazo.mbas,83 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;brazo.mbas,84 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
L_brazo_ver19:
;brazo.mbas,86 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_ver22
;brazo.mbas,87 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;brazo.mbas,88 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
L_brazo_ver22:
;brazo.mbas,90 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_brazo_ver25
;brazo.mbas,91 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;brazo.mbas,92 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
L_brazo_ver25:
;brazo.mbas,93 :: 		end if
	RETURN
; end of brazo_ver

_main:

;brazo.mbas,97 :: 		main:
;brazo.mbas,98 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;brazo.mbas,100 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;brazo.mbas,101 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;brazo.mbas,103 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;brazo.mbas,104 :: 		PORTA = 0X00
	CLRF       PORTA+0
;brazo.mbas,106 :: 		TRISB = 0Xf0 ' PORTB
	MOVLW      240
	MOVWF      TRISB+0
;brazo.mbas,107 :: 		PORTB = 0X00
	CLRF       PORTB+0
;brazo.mbas,109 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;brazo.mbas,110 :: 		PORTC = 0X00
	CLRF       PORTC+0
;brazo.mbas,112 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;brazo.mbas,113 :: 		PORTE = 0X00
	CLRF       PORTE+0
;brazo.mbas,115 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;brazo.mbas,116 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;brazo.mbas,117 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;brazo.mbas,118 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;brazo.mbas,119 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;brazo.mbas,122 :: 		dato=0
	CLRF       _dato+0
;brazo.mbas,123 :: 		centinela=0
	CLRF       _centinela+0
;brazo.mbas,124 :: 		sentido=0
	CLRF       _sentido+0
;brazo.mbas,125 :: 		ver(5)
	MOVLW      5
	MOVWF      FARG_ver_numero+0
	CALL       brazo_ver+0
;brazo.mbas,126 :: 		while(1)
L__main29:
;brazo.mbas,128 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;brazo.mbas,129 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;brazo.mbas,130 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;brazo.mbas,131 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main34:
;brazo.mbas,134 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;brazo.mbas,135 :: 		centinela=0
	CLRF       _centinela+0
;brazo.mbas,136 :: 		if (dato="C") then   'ABAJO
	MOVF       _dato+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;brazo.mbas,137 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       brazo_ver+0
;brazo.mbas,138 :: 		sentido=2
	MOVLW      2
	MOVWF      _sentido+0
;brazo.mbas,139 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main40:
;brazo.mbas,145 :: 		if (dato="D") then  'ARRIBA
	MOVF       _dato+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main43
;brazo.mbas,146 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       brazo_ver+0
;brazo.mbas,147 :: 		sentido=4
	MOVLW      4
	MOVWF      _sentido+0
;brazo.mbas,148 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main43:
;brazo.mbas,149 :: 		end if
L__main37:
;brazo.mbas,151 :: 		if PORTB.RB7=1 then  'ARRIBA
	BTFSS      PORTB+0, 7
	GOTO       L__main46
;brazo.mbas,152 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       brazo_ver+0
;brazo.mbas,153 :: 		sentido=4
	MOVLW      4
	MOVWF      _sentido+0
L__main46:
;brazo.mbas,155 :: 		if PORTB.RB6=1 then  'ABAJO
	BTFSS      PORTB+0, 6
	GOTO       L__main49
;brazo.mbas,156 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       brazo_ver+0
;brazo.mbas,157 :: 		sentido=2
	MOVLW      2
	MOVWF      _sentido+0
L__main49:
;brazo.mbas,160 :: 		wend
	GOTO       L__main29
	GOTO       $+0
; end of _main
