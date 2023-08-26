
seguidor_luz_servo_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;seguidor_luz_servo.mbas,6 :: 		sub procedure interrupt
;seguidor_luz_servo.mbas,7 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_seguidor_luz_servo_interrupt2
;seguidor_luz_servo.mbas,8 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt5
;seguidor_luz_servo.mbas,9 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt8
;seguidor_luz_servo.mbas,10 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,11 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;seguidor_luz_servo.mbas,12 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;seguidor_luz_servo.mbas,13 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;seguidor_luz_servo.mbas,14 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt8:
;seguidor_luz_servo.mbas,16 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt12
;seguidor_luz_servo.mbas,17 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,18 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;seguidor_luz_servo.mbas,19 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;seguidor_luz_servo.mbas,20 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;seguidor_luz_servo.mbas,21 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt12:
;seguidor_luz_servo.mbas,22 :: 		end if
L_seguidor_luz_servo_interrupt5:
;seguidor_luz_servo.mbas,24 :: 		if centinela=2 then
	MOVF       _centinela+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt15
;seguidor_luz_servo.mbas,25 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt18
;seguidor_luz_servo.mbas,26 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,27 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;seguidor_luz_servo.mbas,28 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;seguidor_luz_servo.mbas,29 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt18:
;seguidor_luz_servo.mbas,31 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt21
;seguidor_luz_servo.mbas,32 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,33 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;seguidor_luz_servo.mbas,34 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;seguidor_luz_servo.mbas,35 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt21:
;seguidor_luz_servo.mbas,36 :: 		end if
L_seguidor_luz_servo_interrupt15:
;seguidor_luz_servo.mbas,38 :: 		if centinela=3 then
	MOVF       _centinela+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt24
;seguidor_luz_servo.mbas,39 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt27
;seguidor_luz_servo.mbas,40 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,41 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;seguidor_luz_servo.mbas,42 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;seguidor_luz_servo.mbas,43 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt27:
;seguidor_luz_servo.mbas,45 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_interrupt30
;seguidor_luz_servo.mbas,46 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;seguidor_luz_servo.mbas,47 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;seguidor_luz_servo.mbas,48 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;seguidor_luz_servo.mbas,49 :: 		GOTO final
	GOTO       L_seguidor_luz_servo_interrupt_final
L_seguidor_luz_servo_interrupt30:
;seguidor_luz_servo.mbas,50 :: 		end if
L_seguidor_luz_servo_interrupt24:
;seguidor_luz_servo.mbas,51 :: 		end if
L_seguidor_luz_servo_interrupt2:
;seguidor_luz_servo.mbas,53 :: 		final:
L_seguidor_luz_servo_interrupt_final:
;seguidor_luz_servo.mbas,54 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;seguidor_luz_servo.mbas,55 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_seguidor_luz_servo_interrupt67:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of seguidor_luz_servo_interrupt

seguidor_luz_servo_ver:

;seguidor_luz_servo.mbas,57 :: 		sub procedure ver(dim numero as byte)
;seguidor_luz_servo.mbas,58 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_ver34
;seguidor_luz_servo.mbas,59 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;seguidor_luz_servo.mbas,60 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_seguidor_luz_servo_ver35
;seguidor_luz_servo.mbas,61 :: 		else
L_seguidor_luz_servo_ver34:
;seguidor_luz_servo.mbas,62 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_ver37
;seguidor_luz_servo.mbas,63 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;seguidor_luz_servo.mbas,64 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_seguidor_luz_servo_ver38
;seguidor_luz_servo.mbas,65 :: 		else
L_seguidor_luz_servo_ver37:
;seguidor_luz_servo.mbas,66 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_seguidor_luz_servo_ver40
;seguidor_luz_servo.mbas,67 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;seguidor_luz_servo.mbas,68 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_seguidor_luz_servo_ver41
;seguidor_luz_servo.mbas,69 :: 		else
L_seguidor_luz_servo_ver40:
;seguidor_luz_servo.mbas,70 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;seguidor_luz_servo.mbas,71 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;seguidor_luz_servo.mbas,72 :: 		end if
L_seguidor_luz_servo_ver41:
;seguidor_luz_servo.mbas,73 :: 		end if
L_seguidor_luz_servo_ver38:
;seguidor_luz_servo.mbas,74 :: 		end if
L_seguidor_luz_servo_ver35:
	RETURN
; end of seguidor_luz_servo_ver

seguidor_luz_servo_adelante:

;seguidor_luz_servo.mbas,76 :: 		sub procedure adelante()
;seguidor_luz_servo.mbas,77 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;seguidor_luz_servo.mbas,78 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       seguidor_luz_servo_ver+0
	RETURN
; end of seguidor_luz_servo_adelante

seguidor_luz_servo_atras:

;seguidor_luz_servo.mbas,80 :: 		sub procedure atras()
;seguidor_luz_servo.mbas,81 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;seguidor_luz_servo.mbas,82 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       seguidor_luz_servo_ver+0
	RETURN
; end of seguidor_luz_servo_atras

seguidor_luz_servo_izquierda:

;seguidor_luz_servo.mbas,84 :: 		sub procedure izquierda()
;seguidor_luz_servo.mbas,85 :: 		centinela=2
	MOVLW      2
	MOVWF      _centinela+0
;seguidor_luz_servo.mbas,86 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       seguidor_luz_servo_ver+0
	RETURN
; end of seguidor_luz_servo_izquierda

seguidor_luz_servo_derecha:

;seguidor_luz_servo.mbas,88 :: 		sub procedure derecha()
;seguidor_luz_servo.mbas,89 :: 		centinela=3
	MOVLW      3
	MOVWF      _centinela+0
;seguidor_luz_servo.mbas,90 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       seguidor_luz_servo_ver+0
	RETURN
; end of seguidor_luz_servo_derecha

seguidor_luz_servo_parar:

;seguidor_luz_servo.mbas,92 :: 		sub procedure parar()
;seguidor_luz_servo.mbas,93 :: 		centinela=4
	MOVLW      4
	MOVWF      _centinela+0
	RETURN
; end of seguidor_luz_servo_parar

_main:

;seguidor_luz_servo.mbas,96 :: 		main:
;seguidor_luz_servo.mbas,97 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;seguidor_luz_servo.mbas,99 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;seguidor_luz_servo.mbas,101 :: 		TRISA = 0X0F ' PORTA.0 Entrada
	MOVLW      15
	MOVWF      TRISA+0
;seguidor_luz_servo.mbas,102 :: 		PORTA = 0X00
	CLRF       PORTA+0
;seguidor_luz_servo.mbas,104 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;seguidor_luz_servo.mbas,105 :: 		PORTB = 0X00
	CLRF       PORTB+0
;seguidor_luz_servo.mbas,107 :: 		TRISC = 0X00 ' PORTC salidas
	CLRF       TRISC+0
;seguidor_luz_servo.mbas,108 :: 		PORTC = 0X00
	CLRF       PORTC+0
;seguidor_luz_servo.mbas,110 :: 		TRISE = 0X08 ' PORTE  como salidas digital
	MOVLW      8
	MOVWF      TRISE+0
;seguidor_luz_servo.mbas,111 :: 		PORTE = 0X00
	CLRF       PORTE+0
;seguidor_luz_servo.mbas,113 :: 		ANSEL = 0X0F ' AN<7:0>
	MOVLW      15
	MOVWF      ANSEL+0
;seguidor_luz_servo.mbas,114 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;seguidor_luz_servo.mbas,115 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;seguidor_luz_servo.mbas,116 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;seguidor_luz_servo.mbas,118 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;seguidor_luz_servo.mbas,120 :: 		while(1)
L__main49:
;seguidor_luz_servo.mbas,121 :: 		limite=Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _limite+0
	MOVF       R0+1, 0
	MOVWF      _limite+1
	RRF        _limite+1, 1
	RRF        _limite+0, 1
	BCF        _limite+1, 7
	RRF        _limite+1, 1
	RRF        _limite+0, 1
	BCF        _limite+1, 7
;seguidor_luz_servo.mbas,122 :: 		S1=Adc_Read(1)>>2
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _S1+0
	MOVF       R0+1, 0
	MOVWF      _S1+1
	RRF        _S1+1, 1
	RRF        _S1+0, 1
	BCF        _S1+1, 7
	RRF        _S1+1, 1
	RRF        _S1+0, 1
	BCF        _S1+1, 7
;seguidor_luz_servo.mbas,123 :: 		S2=Adc_Read(2)>>2
	MOVLW      2
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _S2+0
	MOVF       R0+1, 0
	MOVWF      _S2+1
	RRF        _S2+1, 1
	RRF        _S2+0, 1
	BCF        _S2+1, 7
	RRF        _S2+1, 1
	RRF        _S2+0, 1
	BCF        _S2+1, 7
;seguidor_luz_servo.mbas,124 :: 		S3=Adc_Read(3)>>2
	MOVLW      3
	MOVWF      FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _S3+0
	MOVF       R0+1, 0
	MOVWF      _S3+1
	RRF        _S3+1, 1
	RRF        _S3+0, 1
	BCF        _S3+1, 7
	RRF        _S3+1, 1
	RRF        _S3+0, 1
	BCF        _S3+1, 7
;seguidor_luz_servo.mbas,125 :: 		PORTB=S1
	MOVF       _S1+0, 0
	MOVWF      PORTB+0
;seguidor_luz_servo.mbas,126 :: 		if S1<limite then
	MOVF       _limite+1, 0
	SUBWF      _S1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       _limite+0, 0
	SUBWF      _S1+0, 0
L__main68:
	BTFSC      STATUS+0, 0
	GOTO       L__main54
;seguidor_luz_servo.mbas,127 :: 		ADELANTE()
	CALL       seguidor_luz_servo_adelante+0
	GOTO       L__main55
;seguidor_luz_servo.mbas,128 :: 		else
L__main54:
;seguidor_luz_servo.mbas,129 :: 		if S2<limite then
	MOVF       _limite+1, 0
	SUBWF      _S2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       _limite+0, 0
	SUBWF      _S2+0, 0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L__main57
;seguidor_luz_servo.mbas,130 :: 		IZQUIERDA()
	CALL       seguidor_luz_servo_izquierda+0
	GOTO       L__main58
;seguidor_luz_servo.mbas,131 :: 		else
L__main57:
;seguidor_luz_servo.mbas,132 :: 		if S3<limite then
	MOVF       _limite+1, 0
	SUBWF      _S3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVF       _limite+0, 0
	SUBWF      _S3+0, 0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L__main60
;seguidor_luz_servo.mbas,133 :: 		DERECHA()
	CALL       seguidor_luz_servo_derecha+0
	GOTO       L__main61
;seguidor_luz_servo.mbas,134 :: 		else
L__main60:
;seguidor_luz_servo.mbas,135 :: 		PARAR()
	CALL       seguidor_luz_servo_parar+0
;seguidor_luz_servo.mbas,136 :: 		end if
L__main61:
;seguidor_luz_servo.mbas,137 :: 		end if
L__main58:
;seguidor_luz_servo.mbas,139 :: 		end if
L__main55:
;seguidor_luz_servo.mbas,140 :: 		while (PORTE.RE3=0)
L__main63:
	BTFSC      PORTE+0, 3
	GOTO       L__main64
;seguidor_luz_servo.mbas,141 :: 		limite=Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _limite+0
	MOVF       R2+1, 0
	MOVWF      _limite+1
;seguidor_luz_servo.mbas,142 :: 		PORTB=limite
	MOVF       R2+0, 0
	MOVWF      PORTB+0
;seguidor_luz_servo.mbas,143 :: 		wend
	GOTO       L__main63
L__main64:
;seguidor_luz_servo.mbas,146 :: 		wend
	GOTO       L__main49
	GOTO       $+0
; end of _main
