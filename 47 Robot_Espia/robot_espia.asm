
robot_espia_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;robot_espia.mbas,6 :: 		sub procedure interrupt
;robot_espia.mbas,7 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_robot_espia_interrupt2
;robot_espia.mbas,8 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt5
;robot_espia.mbas,9 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt8
;robot_espia.mbas,10 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,11 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_espia.mbas,12 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_espia.mbas,13 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;robot_espia.mbas,14 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt8:
;robot_espia.mbas,16 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt12
;robot_espia.mbas,17 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,18 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_espia.mbas,19 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_espia.mbas,20 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;robot_espia.mbas,21 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt12:
;robot_espia.mbas,22 :: 		end if
L_robot_espia_interrupt5:
;robot_espia.mbas,24 :: 		if centinela=2 then
	MOVF       _centinela+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt15
;robot_espia.mbas,25 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt18
;robot_espia.mbas,26 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,27 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_espia.mbas,28 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_espia.mbas,29 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt18:
;robot_espia.mbas,31 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt21
;robot_espia.mbas,32 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,33 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_espia.mbas,34 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_espia.mbas,35 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt21:
;robot_espia.mbas,36 :: 		end if
L_robot_espia_interrupt15:
;robot_espia.mbas,38 :: 		if centinela=3 then
	MOVF       _centinela+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt24
;robot_espia.mbas,39 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt27
;robot_espia.mbas,40 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,41 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_espia.mbas,42 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;robot_espia.mbas,43 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt27:
;robot_espia.mbas,45 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_interrupt30
;robot_espia.mbas,46 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_espia.mbas,47 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_espia.mbas,48 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;robot_espia.mbas,49 :: 		GOTO final
	GOTO       L_robot_espia_interrupt_final
L_robot_espia_interrupt30:
;robot_espia.mbas,50 :: 		end if
L_robot_espia_interrupt24:
;robot_espia.mbas,51 :: 		end if
L_robot_espia_interrupt2:
;robot_espia.mbas,53 :: 		final:
L_robot_espia_interrupt_final:
;robot_espia.mbas,54 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;robot_espia.mbas,55 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_robot_espia_interrupt71:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of robot_espia_interrupt

robot_espia_ver:

;robot_espia.mbas,57 :: 		sub procedure ver(dim numero as byte)
;robot_espia.mbas,58 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_ver34
;robot_espia.mbas,59 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;robot_espia.mbas,60 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_robot_espia_ver35
;robot_espia.mbas,61 :: 		else
L_robot_espia_ver34:
;robot_espia.mbas,62 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_ver37
;robot_espia.mbas,63 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;robot_espia.mbas,64 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_robot_espia_ver38
;robot_espia.mbas,65 :: 		else
L_robot_espia_ver37:
;robot_espia.mbas,66 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_espia_ver40
;robot_espia.mbas,67 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;robot_espia.mbas,68 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_robot_espia_ver41
;robot_espia.mbas,69 :: 		else
L_robot_espia_ver40:
;robot_espia.mbas,70 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;robot_espia.mbas,71 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;robot_espia.mbas,72 :: 		end if
L_robot_espia_ver41:
;robot_espia.mbas,73 :: 		end if
L_robot_espia_ver38:
;robot_espia.mbas,74 :: 		end if
L_robot_espia_ver35:
	RETURN
; end of robot_espia_ver

robot_espia_adelante:

;robot_espia.mbas,76 :: 		sub procedure adelante()
;robot_espia.mbas,77 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;robot_espia.mbas,78 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       robot_espia_ver+0
	RETURN
; end of robot_espia_adelante

robot_espia_atras:

;robot_espia.mbas,80 :: 		sub procedure atras()
;robot_espia.mbas,81 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;robot_espia.mbas,82 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_espia_ver+0
	RETURN
; end of robot_espia_atras

robot_espia_izquierda:

;robot_espia.mbas,84 :: 		sub procedure izquierda()
;robot_espia.mbas,85 :: 		centinela=2
	MOVLW      2
	MOVWF      _centinela+0
;robot_espia.mbas,86 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_espia_ver+0
	RETURN
; end of robot_espia_izquierda

robot_espia_derecha:

;robot_espia.mbas,88 :: 		sub procedure derecha()
;robot_espia.mbas,89 :: 		centinela=3
	MOVLW      3
	MOVWF      _centinela+0
;robot_espia.mbas,90 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_espia_ver+0
	RETURN
; end of robot_espia_derecha

robot_espia_parar:

;robot_espia.mbas,92 :: 		sub procedure parar()
;robot_espia.mbas,93 :: 		centinela=4
	MOVLW      4
	MOVWF      _centinela+0
	RETURN
; end of robot_espia_parar

_main:

;robot_espia.mbas,96 :: 		main:
;robot_espia.mbas,97 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;robot_espia.mbas,99 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;robot_espia.mbas,101 :: 		TRISA = 0X0F ' PORTA.0 Entrada
	MOVLW      15
	MOVWF      TRISA+0
;robot_espia.mbas,102 :: 		PORTA = 0X00
	CLRF       PORTA+0
;robot_espia.mbas,104 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;robot_espia.mbas,105 :: 		PORTB = 0X00
	CLRF       PORTB+0
;robot_espia.mbas,107 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;robot_espia.mbas,108 :: 		PORTC = 0X00
	CLRF       PORTC+0
;robot_espia.mbas,110 :: 		TRISE = 0X08 ' PORTE  como salidas digital
	MOVLW      8
	MOVWF      TRISE+0
;robot_espia.mbas,111 :: 		PORTE = 0X00
	CLRF       PORTE+0
;robot_espia.mbas,113 :: 		ANSEL = 0X0F ' AN<7:0>
	MOVLW      15
	MOVWF      ANSEL+0
;robot_espia.mbas,114 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;robot_espia.mbas,115 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_espia.mbas,117 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;robot_espia.mbas,118 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;robot_espia.mbas,120 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_espia.mbas,122 :: 		while(1)
L__main49:
;robot_espia.mbas,123 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main54
;robot_espia.mbas,124 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;robot_espia.mbas,125 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;robot_espia.mbas,126 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;robot_espia.mbas,127 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;robot_espia.mbas,128 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_espia.mbas,129 :: 		Delay_100ms
	CALL       _Delay_100ms+0
L__main54:
;robot_espia.mbas,132 :: 		if (dato=0x38) then
	MOVF       _dato+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L__main57
;robot_espia.mbas,133 :: 		ATRAS()
	CALL       robot_espia_atras+0
L__main57:
;robot_espia.mbas,135 :: 		if (dato=0x35) then
	MOVF       _dato+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__main60
;robot_espia.mbas,136 :: 		PARAR()
	CALL       robot_espia_parar+0
L__main60:
;robot_espia.mbas,138 :: 		if (dato=0x32) then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main63
;robot_espia.mbas,139 :: 		ADELANTE()
	CALL       robot_espia_adelante+0
L__main63:
;robot_espia.mbas,141 :: 		if (dato=0x34) then
	MOVF       _dato+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main66
;robot_espia.mbas,142 :: 		IZQUIERDA()
	CALL       robot_espia_izquierda+0
L__main66:
;robot_espia.mbas,144 :: 		if (dato=0x36) then
	MOVF       _dato+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__main69
;robot_espia.mbas,145 :: 		DERECHA()
	CALL       robot_espia_derecha+0
L__main69:
;robot_espia.mbas,149 :: 		wend
	GOTO       L__main49
	GOTO       $+0
; end of _main
