
Boton_Servo_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Boton_Servo.mbas,5 :: 		sub procedure interrupt
;Boton_Servo.mbas,6 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_Boton_Servo_interrupt2
;Boton_Servo.mbas,7 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Boton_Servo_interrupt5
;Boton_Servo.mbas,8 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;Boton_Servo.mbas,9 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Boton_Servo.mbas,10 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;Boton_Servo.mbas,11 :: 		GOTO final
	GOTO       L_Boton_Servo_interrupt_final
L_Boton_Servo_interrupt5:
;Boton_Servo.mbas,13 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Boton_Servo_interrupt9
;Boton_Servo.mbas,14 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;Boton_Servo.mbas,15 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;Boton_Servo.mbas,16 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;Boton_Servo.mbas,17 :: 		GOTO final
	GOTO       L_Boton_Servo_interrupt_final
L_Boton_Servo_interrupt9:
;Boton_Servo.mbas,18 :: 		end if
L_Boton_Servo_interrupt2:
;Boton_Servo.mbas,20 :: 		final:
L_Boton_Servo_interrupt_final:
;Boton_Servo.mbas,21 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;Boton_Servo.mbas,22 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_Boton_Servo_interrupt42:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Boton_Servo_interrupt

Boton_Servo_ver:

;Boton_Servo.mbas,24 :: 		sub procedure ver(dim numero as byte)
;Boton_Servo.mbas,25 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Boton_Servo_ver13
;Boton_Servo.mbas,26 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;Boton_Servo.mbas,27 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_Boton_Servo_ver14
;Boton_Servo.mbas,28 :: 		else
L_Boton_Servo_ver13:
;Boton_Servo.mbas,29 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Boton_Servo_ver16
;Boton_Servo.mbas,30 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;Boton_Servo.mbas,31 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_Boton_Servo_ver17
;Boton_Servo.mbas,32 :: 		else
L_Boton_Servo_ver16:
;Boton_Servo.mbas,33 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Boton_Servo_ver19
;Boton_Servo.mbas,34 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;Boton_Servo.mbas,35 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_Boton_Servo_ver20
;Boton_Servo.mbas,36 :: 		else
L_Boton_Servo_ver19:
;Boton_Servo.mbas,37 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;Boton_Servo.mbas,38 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;Boton_Servo.mbas,39 :: 		end if
L_Boton_Servo_ver20:
;Boton_Servo.mbas,40 :: 		end if
L_Boton_Servo_ver17:
;Boton_Servo.mbas,41 :: 		end if
L_Boton_Servo_ver14:
	RETURN
; end of Boton_Servo_ver

_main:

;Boton_Servo.mbas,43 :: 		main:
;Boton_Servo.mbas,44 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;Boton_Servo.mbas,46 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Boton_Servo.mbas,47 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Boton_Servo.mbas,49 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Boton_Servo.mbas,50 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Boton_Servo.mbas,52 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;Boton_Servo.mbas,53 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Boton_Servo.mbas,55 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;Boton_Servo.mbas,56 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Boton_Servo.mbas,58 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;Boton_Servo.mbas,59 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Boton_Servo.mbas,61 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Boton_Servo.mbas,62 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Boton_Servo.mbas,63 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;Boton_Servo.mbas,64 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;Boton_Servo.mbas,65 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Boton_Servo.mbas,66 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;Boton_Servo.mbas,67 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;Boton_Servo.mbas,68 :: 		dato=0
	CLRF       _dato+0
;Boton_Servo.mbas,69 :: 		centinela=0
	CLRF       _centinela+0
;Boton_Servo.mbas,70 :: 		while(1)
L__main23:
;Boton_Servo.mbas,71 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Boton_Servo.mbas,72 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;Boton_Servo.mbas,73 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;Boton_Servo.mbas,74 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;Boton_Servo.mbas,75 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;Boton_Servo.mbas,76 :: 		PORTB=0X00
	CLRF       PORTB+0
;Boton_Servo.mbas,77 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main28:
;Boton_Servo.mbas,80 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;Boton_Servo.mbas,81 :: 		centinela=0
	CLRF       _centinela+0
;Boton_Servo.mbas,82 :: 		if (dato=0x31) then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Boton_Servo.mbas,83 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       Boton_Servo_ver+0
;Boton_Servo.mbas,84 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main34:
;Boton_Servo.mbas,86 :: 		if (dato=0x32) then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;Boton_Servo.mbas,87 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       Boton_Servo_ver+0
;Boton_Servo.mbas,88 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main37:
;Boton_Servo.mbas,90 :: 		if (dato=0x33) then
	MOVF       _dato+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;Boton_Servo.mbas,91 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       Boton_Servo_ver+0
;Boton_Servo.mbas,92 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main40:
;Boton_Servo.mbas,93 :: 		end if
L__main31:
;Boton_Servo.mbas,96 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       Boton_Servo_ver+0
;Boton_Servo.mbas,97 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,98 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,99 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,104 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       Boton_Servo_ver+0
;Boton_Servo.mbas,105 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,106 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,107 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Boton_Servo.mbas,111 :: 		wend
	GOTO       L__main23
	GOTO       $+0
; end of _main
