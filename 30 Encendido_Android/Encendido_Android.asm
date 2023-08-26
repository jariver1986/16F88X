
_main:

;Encendido_Android.mbas,23 :: 		main:
;Encendido_Android.mbas,24 :: 		OSCCON=0X75   'oscilador interno de 4 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;Encendido_Android.mbas,26 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;Encendido_Android.mbas,27 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Encendido_Android.mbas,29 :: 		TRISA = 0X00 ' PORTA.0 Entrada
	CLRF       TRISA+0
;Encendido_Android.mbas,30 :: 		PORTA = 0X00
	CLRF       PORTA+0
;Encendido_Android.mbas,32 :: 		TRISB = 0X00 ' PORTB
	CLRF       TRISB+0
;Encendido_Android.mbas,33 :: 		PORTB = 0X00
	CLRF       PORTB+0
;Encendido_Android.mbas,35 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;Encendido_Android.mbas,36 :: 		PORTC = 0X00
	CLRF       PORTC+0
;Encendido_Android.mbas,38 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;Encendido_Android.mbas,39 :: 		PORTE = 0X00
	CLRF       PORTE+0
;Encendido_Android.mbas,41 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;Encendido_Android.mbas,42 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;Encendido_Android.mbas,44 :: 		rele1 = 0
	BCF        RB1_bit+0, 1
;Encendido_Android.mbas,45 :: 		rele2 = 0
	BCF        RA3_bit+0, 3
;Encendido_Android.mbas,46 :: 		rele3 = 0
	BCF        RC2_bit+0, 2
;Encendido_Android.mbas,47 :: 		rele4 = 0
	BCF        RA4_bit+0, 4
;Encendido_Android.mbas,48 :: 		rele5 = 0
	BCF        RC1_bit+0, 1
;Encendido_Android.mbas,49 :: 		rele6 = 0
	BCF        RA2_bit+0, 2
;Encendido_Android.mbas,50 :: 		rele7 = 0
	BCF        RA5_bit+0, 5
;Encendido_Android.mbas,51 :: 		rele8 = 0
	BCF        RB2_bit+0, 2
;Encendido_Android.mbas,53 :: 		modo=0x00
	CLRF       _modo+0
;Encendido_Android.mbas,54 :: 		while(1)
L__main2:
;Encendido_Android.mbas,55 :: 		if (UART1_Data_Ready() = 1) then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;Encendido_Android.mbas,56 :: 		receive = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _receive+0
;Encendido_Android.mbas,57 :: 		dato=receive
	MOVF       R0+0, 0
	MOVWF      _dato+0
;Encendido_Android.mbas,58 :: 		PORTB.RB4=1
	BSF        PORTB+0, 4
;Encendido_Android.mbas,59 :: 		PORTB.RB5=1
	BSF        PORTB+0, 5
;Encendido_Android.mbas,60 :: 		PORTB.RB6=1
	BSF        PORTB+0, 6
;Encendido_Android.mbas,61 :: 		PORTB.RB7=1
	BSF        PORTB+0, 7
;Encendido_Android.mbas,62 :: 		Delay_100ms
	CALL       _Delay_100ms+0
;Encendido_Android.mbas,63 :: 		PORTB.RB4=0
	BCF        PORTB+0, 4
;Encendido_Android.mbas,64 :: 		PORTB.RB5=0
	BCF        PORTB+0, 5
;Encendido_Android.mbas,65 :: 		PORTB.RB6=0
	BCF        PORTB+0, 6
;Encendido_Android.mbas,66 :: 		PORTB.RB7=0
	BCF        PORTB+0, 7
;Encendido_Android.mbas,67 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
L__main7:
;Encendido_Android.mbas,70 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;Encendido_Android.mbas,71 :: 		centinela=0
	CLRF       _centinela+0
;Encendido_Android.mbas,72 :: 		if (dato="3") then
	MOVF       _dato+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;Encendido_Android.mbas,73 :: 		rele1= not rele1
	MOVLW      2
	XORWF      RB1_bit+0, 1
L__main13:
;Encendido_Android.mbas,80 :: 		if (dato="2") then
	MOVF       _dato+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main16
;Encendido_Android.mbas,81 :: 		rele8 = not rele8
	MOVLW      4
	XORWF      RB2_bit+0, 1
L__main16:
;Encendido_Android.mbas,83 :: 		if (dato="Q") then
	MOVF       _dato+0, 0
	XORLW      81
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Encendido_Android.mbas,84 :: 		rele3=1
	BSF        RC2_bit+0, 2
;Encendido_Android.mbas,85 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,86 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,87 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,88 :: 		rele3=0
	BCF        RC2_bit+0, 2
L__main19:
;Encendido_Android.mbas,90 :: 		if (dato="W") then
	MOVF       _dato+0, 0
	XORLW      87
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;Encendido_Android.mbas,91 :: 		rele4=1
	BSF        RA4_bit+0, 4
;Encendido_Android.mbas,92 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,93 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,94 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;Encendido_Android.mbas,95 :: 		rele4=0
	BCF        RA4_bit+0, 4
L__main22:
;Encendido_Android.mbas,97 :: 		if (dato="A") then
	MOVF       _dato+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;Encendido_Android.mbas,98 :: 		rele5=1
	BSF        RC1_bit+0, 1
;Encendido_Android.mbas,99 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main27:
	DECFSZ     R13+0, 1
	GOTO       L__main27
	DECFSZ     R12+0, 1
	GOTO       L__main27
	DECFSZ     R11+0, 1
	GOTO       L__main27
;Encendido_Android.mbas,100 :: 		rele5=0
	BCF        RC1_bit+0, 1
L__main25:
;Encendido_Android.mbas,102 :: 		if (dato="S") then
	MOVF       _dato+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__main29
;Encendido_Android.mbas,103 :: 		rele6=1
	BSF        RA2_bit+0, 2
;Encendido_Android.mbas,104 :: 		Delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main31:
	DECFSZ     R13+0, 1
	GOTO       L__main31
	DECFSZ     R12+0, 1
	GOTO       L__main31
	DECFSZ     R11+0, 1
	GOTO       L__main31
;Encendido_Android.mbas,105 :: 		rele6=0
	BCF        RA2_bit+0, 2
L__main29:
;Encendido_Android.mbas,108 :: 		if (dato="1") then  'Z
	MOVF       _dato+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;Encendido_Android.mbas,109 :: 		rele7=1
	BSF        RA5_bit+0, 5
;Encendido_Android.mbas,110 :: 		Delay_ms(550)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      149
	MOVWF      R12+0
	MOVLW      140
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	DECFSZ     R11+0, 1
	GOTO       L__main35
	NOP
;Encendido_Android.mbas,111 :: 		rele7=0
	BCF        RA5_bit+0, 5
L__main33:
;Encendido_Android.mbas,120 :: 		end if
L__main10:
;Encendido_Android.mbas,124 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
