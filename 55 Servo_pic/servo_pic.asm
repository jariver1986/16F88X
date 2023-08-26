
servo_pic_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;servo_pic.mbas,5 :: 		sub procedure interrupt
;servo_pic.mbas,6 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_servo_pic_interrupt2
;servo_pic.mbas,7 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_servo_pic_interrupt5
;servo_pic.mbas,8 :: 		giro=giro1
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;servo_pic.mbas,9 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;servo_pic.mbas,10 :: 		PORTA.RA0=0
	BCF        PORTA+0, 0
;servo_pic.mbas,11 :: 		GOTO final
	GOTO       L_servo_pic_interrupt_final
L_servo_pic_interrupt5:
;servo_pic.mbas,13 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_servo_pic_interrupt9
;servo_pic.mbas,14 :: 		giro=giro2
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;servo_pic.mbas,15 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;servo_pic.mbas,16 :: 		PORTA.RA0=1
	BSF        PORTA+0, 0
;servo_pic.mbas,17 :: 		GOTO final
	GOTO       L_servo_pic_interrupt_final
L_servo_pic_interrupt9:
;servo_pic.mbas,18 :: 		end if
L_servo_pic_interrupt2:
;servo_pic.mbas,20 :: 		final:
L_servo_pic_interrupt_final:
;servo_pic.mbas,21 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;servo_pic.mbas,22 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_servo_pic_interrupt30:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of servo_pic_interrupt

servo_pic_ver:

;servo_pic.mbas,24 :: 		sub procedure ver(dim numero as byte)
;servo_pic.mbas,25 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_servo_pic_ver13
;servo_pic.mbas,26 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;servo_pic.mbas,27 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_servo_pic_ver14
;servo_pic.mbas,28 :: 		else
L_servo_pic_ver13:
;servo_pic.mbas,29 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_servo_pic_ver16
;servo_pic.mbas,30 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;servo_pic.mbas,31 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_servo_pic_ver17
;servo_pic.mbas,32 :: 		else
L_servo_pic_ver16:
;servo_pic.mbas,33 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_servo_pic_ver19
;servo_pic.mbas,34 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;servo_pic.mbas,35 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_servo_pic_ver20
;servo_pic.mbas,36 :: 		else
L_servo_pic_ver19:
;servo_pic.mbas,37 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;servo_pic.mbas,38 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;servo_pic.mbas,39 :: 		end if
L_servo_pic_ver20:
;servo_pic.mbas,40 :: 		end if
L_servo_pic_ver17:
;servo_pic.mbas,41 :: 		end if
L_servo_pic_ver14:
	RETURN
; end of servo_pic_ver

_main:

;servo_pic.mbas,43 :: 		main:
;servo_pic.mbas,44 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;servo_pic.mbas,46 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;servo_pic.mbas,47 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;servo_pic.mbas,49 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;servo_pic.mbas,50 :: 		PORTA = 0X00
	CLRF       PORTA+0
;servo_pic.mbas,52 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;servo_pic.mbas,53 :: 		PORTB = 0X00
	CLRF       PORTB+0
;servo_pic.mbas,55 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;servo_pic.mbas,56 :: 		PORTC = 0X00
	CLRF       PORTC+0
;servo_pic.mbas,58 :: 		TRISD = 0X04 ' PORTC salidas
	MOVLW      4
	MOVWF      TRISD+0
;servo_pic.mbas,59 :: 		PORTD = 0X00
	CLRF       PORTD+0
;servo_pic.mbas,62 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;servo_pic.mbas,63 :: 		PORTE = 0X00
	CLRF       PORTE+0
;servo_pic.mbas,65 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;servo_pic.mbas,66 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;servo_pic.mbas,67 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;servo_pic.mbas,68 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;servo_pic.mbas,69 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;servo_pic.mbas,70 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;servo_pic.mbas,71 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;servo_pic.mbas,72 :: 		dato=0
	CLRF       _dato+0
;servo_pic.mbas,73 :: 		centinela=0
	CLRF       _centinela+0
;servo_pic.mbas,74 :: 		while(1)
L__main23:
;servo_pic.mbas,84 :: 		if PORTD.RD2=1 then
	BTFSS      PORTD+0, 2
	GOTO       L__main28
;servo_pic.mbas,85 :: 		ver(3)
	MOVLW      3
	MOVWF      FARG_ver_numero+0
	CALL       servo_pic_ver+0
;servo_pic.mbas,86 :: 		PORTD.RD0=1
	BSF        PORTD+0, 0
	GOTO       L__main29
;servo_pic.mbas,87 :: 		else
L__main28:
;servo_pic.mbas,88 :: 		ver(4)
	MOVLW      4
	MOVWF      FARG_ver_numero+0
	CALL       servo_pic_ver+0
;servo_pic.mbas,89 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;servo_pic.mbas,90 :: 		end if
L__main29:
;servo_pic.mbas,107 :: 		wend
	GOTO       L__main23
	GOTO       $+0
; end of _main
