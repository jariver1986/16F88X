
PRACTICA2_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;PRACTICA2.mbas,5 :: 		sub procedure interrupt
;PRACTICA2.mbas,9 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_PRACTICA2_interrupt2
;PRACTICA2.mbas,10 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;PRACTICA2.mbas,11 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;PRACTICA2.mbas,13 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt7
;PRACTICA2.mbas,14 :: 		if dato_recep = 0X41 then
	MOVF       _dato_recep+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt9
;PRACTICA2.mbas,15 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_PRACTICA2_interrupt10
;PRACTICA2.mbas,16 :: 		else
L_PRACTICA2_interrupt9:
;PRACTICA2.mbas,17 :: 		viajero = 0
	CLRF       _viajero+0
;PRACTICA2.mbas,18 :: 		end if
L_PRACTICA2_interrupt10:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt7:
;PRACTICA2.mbas,19 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt13
;PRACTICA2.mbas,20 :: 		if dato_recep = 0X42 then
	MOVF       _dato_recep+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_PRACTICA2_interrupt15
;PRACTICA2.mbas,21 :: 		DATO = NOT(DATO)
	MOVLW
	XORWF      _DATO+0, 1
	GOTO       L_PRACTICA2_interrupt16
;PRACTICA2.mbas,22 :: 		else
L_PRACTICA2_interrupt15:
;PRACTICA2.mbas,23 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,24 :: 		end if
L_PRACTICA2_interrupt16:
	GOTO       L_PRACTICA2_interrupt4
L_PRACTICA2_interrupt13:
L_PRACTICA2_interrupt4:
;PRACTICA2.mbas,25 :: 		end select
L_PRACTICA2_interrupt2:
;PRACTICA2.mbas,27 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;PRACTICA2.mbas,28 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;PRACTICA2.mbas,29 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_PRACTICA2_interrupt46:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of PRACTICA2_interrupt

_main:

;PRACTICA2.mbas,32 :: 		main:
;PRACTICA2.mbas,33 :: 		ANSEL  = 0
	CLRF       ANSEL+0
;PRACTICA2.mbas,34 :: 		ANSELH = 0
	CLRF       ANSELH+0
;PRACTICA2.mbas,35 :: 		TRISA=0X00
	CLRF       TRISA+0
;PRACTICA2.mbas,36 :: 		PORTA=0X00
	CLRF       PORTA+0
;PRACTICA2.mbas,37 :: 		TRISB=0X00
	CLRF       TRISB+0
;PRACTICA2.mbas,38 :: 		PORTB=0X00
	CLRF       PORTB+0
;PRACTICA2.mbas,39 :: 		TRISC=0X8F
	MOVLW      143
	MOVWF      TRISC+0
;PRACTICA2.mbas,40 :: 		PORTC=0X00
	CLRF       PORTC+0
;PRACTICA2.mbas,41 :: 		control1=0
	CLRF       _control1+0
;PRACTICA2.mbas,42 :: 		control2=0
	CLRF       _control2+0
;PRACTICA2.mbas,43 :: 		control3=0
	CLRF       _control3+0
;PRACTICA2.mbas,44 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;PRACTICA2.mbas,45 :: 		OPTION_REG=%1000100
	MOVLW      68
	MOVWF      OPTION_REG+0
;PRACTICA2.mbas,46 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PRACTICA2.mbas,47 :: 		INTCON=%11100000
	MOVLW      224
	MOVWF      INTCON+0
;PRACTICA2.mbas,48 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;PRACTICA2.mbas,49 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;PRACTICA2.mbas,50 :: 		viajero=0
	CLRF       _viajero+0
;PRACTICA2.mbas,51 :: 		DATO=0
	BCF        _DATO+0, BitPos(_DATO+0)
;PRACTICA2.mbas,53 :: 		WHILE(1)
L__main20:
;PRACTICA2.mbas,54 :: 		WHILE (DATO=1)
L__main25:
	BTFSS      _DATO+0, BitPos(_DATO+0)
	GOTO       L__main26
;PRACTICA2.mbas,55 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;PRACTICA2.mbas,56 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	DECFSZ     R11+0, 1
	GOTO       L__main29
	NOP
	NOP
;PRACTICA2.mbas,57 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;PRACTICA2.mbas,58 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main30:
	DECFSZ     R13+0, 1
	GOTO       L__main30
	DECFSZ     R12+0, 1
	GOTO       L__main30
	DECFSZ     R11+0, 1
	GOTO       L__main30
	NOP
	NOP
;PRACTICA2.mbas,59 :: 		WEND
	GOTO       L__main25
L__main26:
;PRACTICA2.mbas,60 :: 		WHILE (DATO=0)
L__main32:
	BTFSC      _DATO+0, BitPos(_DATO+0)
	GOTO       L__main33
;PRACTICA2.mbas,61 :: 		if (PORTC.RC0=1) and (control1=0) then
	BTFSC      PORTC+0, 0
	GOTO       L__main47
	BCF        114, 0
	GOTO       L__main48
L__main47:
	BSF        114, 0
L__main48:
	MOVF       _control1+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main37
;PRACTICA2.mbas,62 :: 		control1=1
	MOVLW      1
	MOVWF      _control1+0
;PRACTICA2.mbas,63 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;PRACTICA2.mbas,64 :: 		UART1_Write(0X31)
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRACTICA2.mbas,65 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,66 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
L__main37:
;PRACTICA2.mbas,68 :: 		if (PORTC.RC1=1)and (control2=0) then
	BTFSC      PORTC+0, 1
	GOTO       L__main49
	BCF        114, 0
	GOTO       L__main50
L__main49:
	BSF        114, 0
L__main50:
	MOVF       _control2+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main40
;PRACTICA2.mbas,69 :: 		PORTB.RB2=1
	BSF        PORTB+0, 2
;PRACTICA2.mbas,70 :: 		UART1_Write(0X32)
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRACTICA2.mbas,71 :: 		control2=1
	MOVLW      1
	MOVWF      _control2+0
;PRACTICA2.mbas,72 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,73 :: 		PORTB.RB2=0
	BCF        PORTB+0, 2
L__main40:
;PRACTICA2.mbas,75 :: 		if (PORTC.RC2=1)and (control3=0) then
	BTFSC      PORTC+0, 2
	GOTO       L__main51
	BCF        114, 0
	GOTO       L__main52
L__main51:
	BSF        114, 0
L__main52:
	MOVF       _control3+0, 0
	XORLW      0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main43
;PRACTICA2.mbas,76 :: 		PORTB.RB3=1
	BSF        PORTB+0, 3
;PRACTICA2.mbas,77 :: 		control3=1
	MOVLW      1
	MOVWF      _control3+0
;PRACTICA2.mbas,78 :: 		UART1_Write(0X33)
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRACTICA2.mbas,79 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;PRACTICA2.mbas,80 :: 		PORTB.RB3=0
	BCF        PORTB+0, 3
L__main43:
;PRACTICA2.mbas,82 :: 		Delay_ms(500)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	DECFSZ     R11+0, 1
	GOTO       L__main45
	NOP
	NOP
;PRACTICA2.mbas,83 :: 		WEND
	GOTO       L__main32
L__main33:
;PRACTICA2.mbas,85 :: 		WEND
	GOTO       L__main20
	GOTO       $+0
; end of _main
