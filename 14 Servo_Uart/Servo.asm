
Servo_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Servo.mbas,6 :: 		sub procedure interrupt
;Servo.mbas,7 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_Servo_interrupt2
;Servo.mbas,8 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_interrupt5
;Servo.mbas,9 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;Servo.mbas,10 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Servo.mbas,11 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;Servo.mbas,12 :: 		GOTO final
	GOTO       L_Servo_interrupt_final
L_Servo_interrupt5:
;Servo.mbas,14 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_interrupt9
;Servo.mbas,15 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;Servo.mbas,16 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;Servo.mbas,17 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;Servo.mbas,18 :: 		GOTO final
	GOTO       L_Servo_interrupt_final
L_Servo_interrupt9:
;Servo.mbas,19 :: 		end if
L_Servo_interrupt2:
;Servo.mbas,21 :: 		final:
L_Servo_interrupt_final:
;Servo.mbas,22 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;Servo.mbas,23 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_Servo_interrupt42:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Servo_interrupt

Servo_ver:

;Servo.mbas,25 :: 		sub procedure ver(dim numero as byte)
;Servo.mbas,26 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_ver13
;Servo.mbas,27 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;Servo.mbas,28 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_Servo_ver14
;Servo.mbas,29 :: 		else
L_Servo_ver13:
;Servo.mbas,30 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_ver16
;Servo.mbas,31 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;Servo.mbas,32 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_Servo_ver17
;Servo.mbas,33 :: 		else
L_Servo_ver16:
;Servo.mbas,34 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Servo_ver19
;Servo.mbas,35 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;Servo.mbas,36 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_Servo_ver20
;Servo.mbas,37 :: 		else
L_Servo_ver19:
;Servo.mbas,38 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;Servo.mbas,39 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;Servo.mbas,40 :: 		end if
L_Servo_ver20:
;Servo.mbas,41 :: 		end if
L_Servo_ver17:
;Servo.mbas,42 :: 		end if
L_Servo_ver14:
	RETURN
; end of Servo_ver

_main:

;Servo.mbas,44 :: 		main:
;Servo.mbas,45 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;Servo.mbas,47 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;Servo.mbas,48 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Servo.mbas,50 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Servo.mbas,51 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Servo.mbas,53 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;Servo.mbas,54 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Servo.mbas,56 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;Servo.mbas,57 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Servo.mbas,59 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;Servo.mbas,60 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Servo.mbas,62 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Servo.mbas,63 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Servo.mbas,64 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;Servo.mbas,65 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;Servo.mbas,66 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;Servo.mbas,67 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;Servo.mbas,68 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;Servo.mbas,69 :: 		dato=0
	CLRF       _dato+0
;Servo.mbas,70 :: 		centinela=0
	CLRF       _centinela+0
;Servo.mbas,71 :: 		while(1)
L__main23:
;Servo.mbas,72 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Servo.mbas,73 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;Servo.mbas,74 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;Servo.mbas,75 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;Servo.mbas,76 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;Servo.mbas,77 :: 		PORTB=0X00
	CLRF       PORTB+0
;Servo.mbas,78 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main28:
;Servo.mbas,81 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;Servo.mbas,82 :: 		centinela=0
	CLRF       _centinela+0
;Servo.mbas,83 :: 		if (dato=0x31) then
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Servo.mbas,84 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       Servo_ver+0
;Servo.mbas,85 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main34:
;Servo.mbas,87 :: 		if (dato=0x32) then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;Servo.mbas,88 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       Servo_ver+0
;Servo.mbas,89 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main37:
;Servo.mbas,91 :: 		if (dato=0x33) then
	MOVF       _dato+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;Servo.mbas,92 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       Servo_ver+0
;Servo.mbas,93 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main40:
;Servo.mbas,94 :: 		end if
L__main31:
;Servo.mbas,97 :: 		wend
	GOTO       L__main23
	GOTO       $+0
; end of _main
