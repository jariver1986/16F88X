
Led_Android_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Led_Android.mbas,6 :: 		sub procedure interrupt
;Led_Android.mbas,10 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_Led_Android_interrupt2
;Led_Android.mbas,11 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Led_Android.mbas,12 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
L_Led_Android_interrupt2:
;Led_Android.mbas,14 :: 		INTCON=0XF0
	MOVLW      240
	MOVWF      INTCON+0
;Led_Android.mbas,15 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Led_Android.mbas,16 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_Led_Android_interrupt113:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of Led_Android_interrupt

Led_Android_letra_e:

;Led_Android.mbas,19 :: 		sub procedure letra_e ()
;Led_Android.mbas,20 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,21 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_e5:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_e5
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_e5
	NOP
	NOP
;Led_Android.mbas,22 :: 		PORTD= %10011001
	MOVLW      153
	MOVWF      PORTD+0
;Led_Android.mbas,23 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_e6:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_e6
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_e6
	NOP
	NOP
;Led_Android.mbas,24 :: 		PORTD= %10000001
	MOVLW      129
	MOVWF      PORTD+0
;Led_Android.mbas,25 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_e7:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_e7
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_e7
	NOP
	NOP
	RETURN
; end of Led_Android_letra_e

Led_Android_letra_m:

;Led_Android.mbas,27 :: 		sub procedure letra_m ()
;Led_Android.mbas,28 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,29 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_m9:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_m9
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_m9
	NOP
	NOP
;Led_Android.mbas,30 :: 		PORTD= %01100000
	MOVLW      96
	MOVWF      PORTD+0
;Led_Android.mbas,31 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_m10:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_m10
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_m10
	NOP
	NOP
;Led_Android.mbas,32 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,33 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_m11:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_m11
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_m11
	NOP
	NOP
	RETURN
; end of Led_Android_letra_m

Led_Android_letra_l:

;Led_Android.mbas,35 :: 		sub procedure letra_l ()
;Led_Android.mbas,36 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,37 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_l13:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_l13
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_l13
	NOP
	NOP
;Led_Android.mbas,38 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,39 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_l14:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_l14
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_l14
	NOP
	NOP
;Led_Android.mbas,40 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,41 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_l15:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_l15
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_l15
	NOP
	NOP
	RETURN
; end of Led_Android_letra_l

Led_Android_letra_c:

;Led_Android.mbas,43 :: 		sub procedure letra_c ()
;Led_Android.mbas,44 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,45 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_c17:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_c17
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_c17
	NOP
	NOP
;Led_Android.mbas,46 :: 		PORTD= %11000011
	MOVLW      195
	MOVWF      PORTD+0
;Led_Android.mbas,47 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_c18:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_c18
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_c18
	NOP
	NOP
;Led_Android.mbas,48 :: 		PORTD= %11000011
	MOVLW      195
	MOVWF      PORTD+0
;Led_Android.mbas,49 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led_Android_letra_c19:
	DECFSZ     R13+0, 1
	GOTO       L_Led_Android_letra_c19
	DECFSZ     R12+0, 1
	GOTO       L_Led_Android_letra_c19
	NOP
	NOP
	RETURN
; end of Led_Android_letra_c

_main:

;Led_Android.mbas,51 :: 		main:
;Led_Android.mbas,52 :: 		OSCCON = 0X75
	MOVLW      117
	MOVWF      OSCCON+0
;Led_Android.mbas,53 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Led_Android.mbas,54 :: 		OPTION_REG = %10000110
	MOVLW      134
	MOVWF      OPTION_REG+0
;Led_Android.mbas,56 :: 		TRISA = 0x00
	CLRF       TRISA+0
;Led_Android.mbas,57 :: 		PORTA = 0x00
	CLRF       PORTA+0
;Led_Android.mbas,58 :: 		INTCON=0XF0
	MOVLW      240
	MOVWF      INTCON+0
;Led_Android.mbas,59 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;Led_Android.mbas,60 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;Led_Android.mbas,63 :: 		TRISB = 0xFF  'PIN RB1,RB2  ENTRADAS PARA SENSAR CORRIENTE DE MOTORES
	MOVLW      255
	MOVWF      TRISB+0
;Led_Android.mbas,64 :: 		PORTB = 0x00
	CLRF       PORTB+0
;Led_Android.mbas,67 :: 		TRISC = %10000000
	MOVLW      128
	MOVWF      TRISC+0
;Led_Android.mbas,68 :: 		PORTC = %00000000
	CLRF       PORTC+0
;Led_Android.mbas,70 :: 		TRISD=0
	CLRF       TRISD+0
;Led_Android.mbas,71 :: 		PORTD=0
	CLRF       PORTD+0
;Led_Android.mbas,74 :: 		ANSEL =  %00000000 ' RE1-RE2 ANALOGICO, RESTO DIGITALES
	CLRF       ANSEL+0
;Led_Android.mbas,75 :: 		ANSELH = %00000000
	CLRF       ANSELH+0
;Led_Android.mbas,79 :: 		WHILE(1)
L__main22:
;Led_Android.mbas,80 :: 		if dato_recep="A" then    'ADELANTE
	MOVF       _dato_recep+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__main27
;Led_Android.mbas,81 :: 		IF PORTB.RB1=1 THEN
	BTFSS      PORTB+0, 1
	GOTO       L__main30
;Led_Android.mbas,82 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,83 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main32:
	DECFSZ     R13+0, 1
	GOTO       L__main32
	DECFSZ     R12+0, 1
	GOTO       L__main32
	NOP
	NOP
;Led_Android.mbas,84 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,85 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main33:
	DECFSZ     R13+0, 1
	GOTO       L__main33
	DECFSZ     R12+0, 1
	GOTO       L__main33
	NOP
	NOP
;Led_Android.mbas,86 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,87 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main34:
	DECFSZ     R13+0, 1
	GOTO       L__main34
	DECFSZ     R12+0, 1
	GOTO       L__main34
	NOP
	NOP
;Led_Android.mbas,89 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,90 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main35:
	DECFSZ     R13+0, 1
	GOTO       L__main35
	DECFSZ     R12+0, 1
	GOTO       L__main35
	NOP
	NOP
;Led_Android.mbas,92 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,93 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main36:
	DECFSZ     R13+0, 1
	GOTO       L__main36
	DECFSZ     R12+0, 1
	GOTO       L__main36
	NOP
	NOP
;Led_Android.mbas,94 :: 		PORTD= %10011000
	MOVLW      152
	MOVWF      PORTD+0
;Led_Android.mbas,95 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main37:
	DECFSZ     R13+0, 1
	GOTO       L__main37
	DECFSZ     R12+0, 1
	GOTO       L__main37
	NOP
	NOP
;Led_Android.mbas,96 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,97 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main38:
	DECFSZ     R13+0, 1
	GOTO       L__main38
	DECFSZ     R12+0, 1
	GOTO       L__main38
	NOP
	NOP
;Led_Android.mbas,99 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,100 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main39:
	DECFSZ     R13+0, 1
	GOTO       L__main39
	DECFSZ     R12+0, 1
	GOTO       L__main39
	NOP
	NOP
;Led_Android.mbas,102 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,103 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main40:
	DECFSZ     R13+0, 1
	GOTO       L__main40
	DECFSZ     R12+0, 1
	GOTO       L__main40
	NOP
	NOP
;Led_Android.mbas,104 :: 		PORTD= %10011001
	MOVLW      153
	MOVWF      PORTD+0
;Led_Android.mbas,105 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main41:
	DECFSZ     R13+0, 1
	GOTO       L__main41
	DECFSZ     R12+0, 1
	GOTO       L__main41
	NOP
	NOP
;Led_Android.mbas,106 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,107 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main42:
	DECFSZ     R13+0, 1
	GOTO       L__main42
	DECFSZ     R12+0, 1
	GOTO       L__main42
	NOP
	NOP
;Led_Android.mbas,109 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,110 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main43:
	DECFSZ     R13+0, 1
	GOTO       L__main43
	DECFSZ     R12+0, 1
	GOTO       L__main43
	NOP
	NOP
;Led_Android.mbas,112 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,113 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main44:
	DECFSZ     R13+0, 1
	GOTO       L__main44
	DECFSZ     R12+0, 1
	GOTO       L__main44
	NOP
	NOP
;Led_Android.mbas,114 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,115 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main45:
	DECFSZ     R13+0, 1
	GOTO       L__main45
	DECFSZ     R12+0, 1
	GOTO       L__main45
	NOP
	NOP
;Led_Android.mbas,116 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,117 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main46:
	DECFSZ     R13+0, 1
	GOTO       L__main46
	DECFSZ     R12+0, 1
	GOTO       L__main46
	NOP
	NOP
;Led_Android.mbas,119 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,120 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main47:
	DECFSZ     R13+0, 1
	GOTO       L__main47
	DECFSZ     R12+0, 1
	GOTO       L__main47
	NOP
	NOP
;Led_Android.mbas,122 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,123 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main48:
	DECFSZ     R13+0, 1
	GOTO       L__main48
	DECFSZ     R12+0, 1
	GOTO       L__main48
	NOP
	NOP
;Led_Android.mbas,124 :: 		PORTD= %10011000
	MOVLW      152
	MOVWF      PORTD+0
;Led_Android.mbas,125 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main49:
	DECFSZ     R13+0, 1
	GOTO       L__main49
	DECFSZ     R12+0, 1
	GOTO       L__main49
	NOP
	NOP
;Led_Android.mbas,126 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,127 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	NOP
	NOP
;Led_Android.mbas,129 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,130 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main51:
	DECFSZ     R13+0, 1
	GOTO       L__main51
	DECFSZ     R12+0, 1
	GOTO       L__main51
	NOP
	NOP
L__main30:
;Led_Android.mbas,133 :: 		END IF
L__main27:
;Led_Android.mbas,136 :: 		if dato_recep="B" then    'ADELANTE
	MOVF       _dato_recep+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;Led_Android.mbas,137 :: 		IF PORTB.RB1=1 THEN
	BTFSS      PORTB+0, 1
	GOTO       L__main56
;Led_Android.mbas,138 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,139 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main58:
	DECFSZ     R13+0, 1
	GOTO       L__main58
	DECFSZ     R12+0, 1
	GOTO       L__main58
	NOP
	NOP
;Led_Android.mbas,140 :: 		PORTD= %00011000
	MOVLW      24
	MOVWF      PORTD+0
;Led_Android.mbas,141 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main59:
	DECFSZ     R13+0, 1
	GOTO       L__main59
	DECFSZ     R12+0, 1
	GOTO       L__main59
	NOP
	NOP
;Led_Android.mbas,142 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,143 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main60:
	DECFSZ     R13+0, 1
	GOTO       L__main60
	DECFSZ     R12+0, 1
	GOTO       L__main60
	NOP
	NOP
;Led_Android.mbas,145 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,146 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main61:
	DECFSZ     R13+0, 1
	GOTO       L__main61
	DECFSZ     R12+0, 1
	GOTO       L__main61
	NOP
	NOP
;Led_Android.mbas,148 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,149 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main62:
	DECFSZ     R13+0, 1
	GOTO       L__main62
	DECFSZ     R12+0, 1
	GOTO       L__main62
	NOP
	NOP
;Led_Android.mbas,150 :: 		PORTD= %10000001
	MOVLW      129
	MOVWF      PORTD+0
;Led_Android.mbas,151 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main63:
	DECFSZ     R13+0, 1
	GOTO       L__main63
	DECFSZ     R12+0, 1
	GOTO       L__main63
	NOP
	NOP
;Led_Android.mbas,152 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,153 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main64:
	DECFSZ     R13+0, 1
	GOTO       L__main64
	DECFSZ     R12+0, 1
	GOTO       L__main64
	NOP
	NOP
;Led_Android.mbas,155 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,156 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main65:
	DECFSZ     R13+0, 1
	GOTO       L__main65
	DECFSZ     R12+0, 1
	GOTO       L__main65
	NOP
	NOP
;Led_Android.mbas,158 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,159 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main66:
	DECFSZ     R13+0, 1
	GOTO       L__main66
	DECFSZ     R12+0, 1
	GOTO       L__main66
	NOP
	NOP
;Led_Android.mbas,160 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,161 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main67:
	DECFSZ     R13+0, 1
	GOTO       L__main67
	DECFSZ     R12+0, 1
	GOTO       L__main67
	NOP
	NOP
;Led_Android.mbas,162 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,163 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main68:
	DECFSZ     R13+0, 1
	GOTO       L__main68
	DECFSZ     R12+0, 1
	GOTO       L__main68
	NOP
	NOP
;Led_Android.mbas,165 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,166 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main69:
	DECFSZ     R13+0, 1
	GOTO       L__main69
	DECFSZ     R12+0, 1
	GOTO       L__main69
	NOP
	NOP
;Led_Android.mbas,168 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,169 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main70:
	DECFSZ     R13+0, 1
	GOTO       L__main70
	DECFSZ     R12+0, 1
	GOTO       L__main70
	NOP
	NOP
;Led_Android.mbas,170 :: 		PORTD= %11001100
	MOVLW      204
	MOVWF      PORTD+0
;Led_Android.mbas,171 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main71:
	DECFSZ     R13+0, 1
	GOTO       L__main71
	DECFSZ     R12+0, 1
	GOTO       L__main71
	NOP
	NOP
;Led_Android.mbas,172 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,173 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main72:
	DECFSZ     R13+0, 1
	GOTO       L__main72
	DECFSZ     R12+0, 1
	GOTO       L__main72
	NOP
	NOP
;Led_Android.mbas,175 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,176 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main73:
	DECFSZ     R13+0, 1
	GOTO       L__main73
	DECFSZ     R12+0, 1
	GOTO       L__main73
	NOP
	NOP
;Led_Android.mbas,177 :: 		PORTD=0
	CLRF       PORTD+0
L__main56:
;Led_Android.mbas,178 :: 		END IF
L__main53:
;Led_Android.mbas,180 :: 		if dato_recep="C" then    'ADELANTE
	MOVF       _dato_recep+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__main75
;Led_Android.mbas,181 :: 		IF PORTB.RB1=1 THEN
	BTFSS      PORTB+0, 1
	GOTO       L__main78
;Led_Android.mbas,182 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,183 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main80:
	DECFSZ     R13+0, 1
	GOTO       L__main80
	DECFSZ     R12+0, 1
	GOTO       L__main80
	NOP
	NOP
;Led_Android.mbas,184 :: 		PORTD= %10011001
	MOVLW      153
	MOVWF      PORTD+0
;Led_Android.mbas,185 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main81:
	DECFSZ     R13+0, 1
	GOTO       L__main81
	DECFSZ     R12+0, 1
	GOTO       L__main81
	NOP
	NOP
;Led_Android.mbas,186 :: 		PORTD= %10000001
	MOVLW      129
	MOVWF      PORTD+0
;Led_Android.mbas,187 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main82:
	DECFSZ     R13+0, 1
	GOTO       L__main82
	DECFSZ     R12+0, 1
	GOTO       L__main82
	NOP
	NOP
;Led_Android.mbas,189 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,190 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main83:
	DECFSZ     R13+0, 1
	GOTO       L__main83
	DECFSZ     R12+0, 1
	GOTO       L__main83
	NOP
	NOP
;Led_Android.mbas,192 :: 		PORTD= %11111001
	MOVLW      249
	MOVWF      PORTD+0
;Led_Android.mbas,193 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main84:
	DECFSZ     R13+0, 1
	GOTO       L__main84
	DECFSZ     R12+0, 1
	GOTO       L__main84
	NOP
	NOP
;Led_Android.mbas,194 :: 		PORTD= %10011001
	MOVLW      153
	MOVWF      PORTD+0
;Led_Android.mbas,195 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main85:
	DECFSZ     R13+0, 1
	GOTO       L__main85
	DECFSZ     R12+0, 1
	GOTO       L__main85
	NOP
	NOP
;Led_Android.mbas,196 :: 		PORTD= %10011111
	MOVLW      159
	MOVWF      PORTD+0
;Led_Android.mbas,197 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main86:
	DECFSZ     R13+0, 1
	GOTO       L__main86
	DECFSZ     R12+0, 1
	GOTO       L__main86
	NOP
	NOP
;Led_Android.mbas,199 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,200 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main87:
	DECFSZ     R13+0, 1
	GOTO       L__main87
	DECFSZ     R12+0, 1
	GOTO       L__main87
	NOP
	NOP
;Led_Android.mbas,202 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,203 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main88:
	DECFSZ     R13+0, 1
	GOTO       L__main88
	DECFSZ     R12+0, 1
	GOTO       L__main88
	NOP
	NOP
;Led_Android.mbas,204 :: 		PORTD= %10011000
	MOVLW      152
	MOVWF      PORTD+0
;Led_Android.mbas,205 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main89:
	DECFSZ     R13+0, 1
	GOTO       L__main89
	DECFSZ     R12+0, 1
	GOTO       L__main89
	NOP
	NOP
;Led_Android.mbas,206 :: 		PORTD= %11111000
	MOVLW      248
	MOVWF      PORTD+0
;Led_Android.mbas,207 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main90:
	DECFSZ     R13+0, 1
	GOTO       L__main90
	DECFSZ     R12+0, 1
	GOTO       L__main90
	NOP
	NOP
;Led_Android.mbas,209 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,210 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main91:
	DECFSZ     R13+0, 1
	GOTO       L__main91
	DECFSZ     R12+0, 1
	GOTO       L__main91
	NOP
	NOP
;Led_Android.mbas,212 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,213 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main92:
	DECFSZ     R13+0, 1
	GOTO       L__main92
	DECFSZ     R12+0, 1
	GOTO       L__main92
	NOP
	NOP
;Led_Android.mbas,214 :: 		PORTD= %11000011
	MOVLW      195
	MOVWF      PORTD+0
;Led_Android.mbas,215 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main93:
	DECFSZ     R13+0, 1
	GOTO       L__main93
	DECFSZ     R12+0, 1
	GOTO       L__main93
	NOP
	NOP
;Led_Android.mbas,216 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,217 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main94:
	DECFSZ     R13+0, 1
	GOTO       L__main94
	DECFSZ     R12+0, 1
	GOTO       L__main94
	NOP
	NOP
;Led_Android.mbas,219 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,220 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main95:
	DECFSZ     R13+0, 1
	GOTO       L__main95
	DECFSZ     R12+0, 1
	GOTO       L__main95
	NOP
	NOP
;Led_Android.mbas,222 :: 		PORTD= %11111111
	MOVLW      255
	MOVWF      PORTD+0
;Led_Android.mbas,223 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main96:
	DECFSZ     R13+0, 1
	GOTO       L__main96
	DECFSZ     R12+0, 1
	GOTO       L__main96
	NOP
	NOP
;Led_Android.mbas,224 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,225 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main97:
	DECFSZ     R13+0, 1
	GOTO       L__main97
	DECFSZ     R12+0, 1
	GOTO       L__main97
	NOP
	NOP
;Led_Android.mbas,226 :: 		PORTD= %00000011
	MOVLW      3
	MOVWF      PORTD+0
;Led_Android.mbas,227 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main98:
	DECFSZ     R13+0, 1
	GOTO       L__main98
	DECFSZ     R12+0, 1
	GOTO       L__main98
	NOP
	NOP
;Led_Android.mbas,230 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,231 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main99:
	DECFSZ     R13+0, 1
	GOTO       L__main99
	DECFSZ     R12+0, 1
	GOTO       L__main99
	NOP
	NOP
;Led_Android.mbas,232 :: 		PORTD=0
	CLRF       PORTD+0
L__main78:
;Led_Android.mbas,233 :: 		END IF
L__main75:
;Led_Android.mbas,235 :: 		if dato_recep="D" then    'ADELANTE
	MOVF       _dato_recep+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__main101
;Led_Android.mbas,236 :: 		IF PORTB.RB1=1 THEN
	BTFSS      PORTB+0, 1
	GOTO       L__main104
;Led_Android.mbas,237 :: 		letra_e
	CALL       Led_Android_letra_e+0
;Led_Android.mbas,238 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,239 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main106:
	DECFSZ     R13+0, 1
	GOTO       L__main106
	DECFSZ     R12+0, 1
	GOTO       L__main106
	NOP
	NOP
;Led_Android.mbas,241 :: 		letra_m()
	CALL       Led_Android_letra_m+0
;Led_Android.mbas,242 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,243 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main107:
	DECFSZ     R13+0, 1
	GOTO       L__main107
	DECFSZ     R12+0, 1
	GOTO       L__main107
	NOP
	NOP
;Led_Android.mbas,245 :: 		letra_e
	CALL       Led_Android_letra_e+0
;Led_Android.mbas,246 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,247 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main108:
	DECFSZ     R13+0, 1
	GOTO       L__main108
	DECFSZ     R12+0, 1
	GOTO       L__main108
	NOP
	NOP
;Led_Android.mbas,249 :: 		letra_l
	CALL       Led_Android_letra_l+0
;Led_Android.mbas,250 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,251 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main109:
	DECFSZ     R13+0, 1
	GOTO       L__main109
	DECFSZ     R12+0, 1
	GOTO       L__main109
	NOP
	NOP
;Led_Android.mbas,253 :: 		letra_e
	CALL       Led_Android_letra_e+0
;Led_Android.mbas,254 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,255 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main110:
	DECFSZ     R13+0, 1
	GOTO       L__main110
	DECFSZ     R12+0, 1
	GOTO       L__main110
	NOP
	NOP
;Led_Android.mbas,257 :: 		letra_c
	CALL       Led_Android_letra_c+0
;Led_Android.mbas,258 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,259 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main111:
	DECFSZ     R13+0, 1
	GOTO       L__main111
	DECFSZ     R12+0, 1
	GOTO       L__main111
	NOP
	NOP
;Led_Android.mbas,261 :: 		PORTD= %00000000
	CLRF       PORTD+0
;Led_Android.mbas,262 :: 		Delay_ms(1)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L__main112:
	DECFSZ     R13+0, 1
	GOTO       L__main112
	DECFSZ     R12+0, 1
	GOTO       L__main112
	NOP
	NOP
L__main104:
;Led_Android.mbas,263 :: 		END IF
L__main101:
;Led_Android.mbas,266 :: 		WEND
	GOTO       L__main22
	GOTO       $+0
; end of _main
