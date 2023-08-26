
prueba_Sabertooth_2x60_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;prueba_Sabertooth_2x60.mbas,8 :: 		sub procedure interrupt
;prueba_Sabertooth_2x60.mbas,12 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_prueba_Sabertooth_2x60_interrupt2
;prueba_Sabertooth_2x60.mbas,13 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;prueba_Sabertooth_2x60.mbas,20 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;prueba_Sabertooth_2x60.mbas,23 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt7
;prueba_Sabertooth_2x60.mbas,24 :: 		if dato_recep = "I" then ' I
	MOVF       _dato_recep+0, 0
	XORLW      73
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt9
;prueba_Sabertooth_2x60.mbas,25 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt10
;prueba_Sabertooth_2x60.mbas,26 :: 		else
L_prueba_Sabertooth_2x60_interrupt9:
;prueba_Sabertooth_2x60.mbas,27 :: 		viajero = 0
	CLRF       _viajero+0
;prueba_Sabertooth_2x60.mbas,28 :: 		end if
L_prueba_Sabertooth_2x60_interrupt10:
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt7:
;prueba_Sabertooth_2x60.mbas,29 :: 		case 1
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt13
;prueba_Sabertooth_2x60.mbas,30 :: 		if dato_recep = "&" then
	MOVF       _dato_recep+0, 0
	XORLW      38
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt15
;prueba_Sabertooth_2x60.mbas,31 :: 		viajero = 2
	MOVLW      2
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt16
;prueba_Sabertooth_2x60.mbas,32 :: 		else
L_prueba_Sabertooth_2x60_interrupt15:
;prueba_Sabertooth_2x60.mbas,33 :: 		viajero=0
	CLRF       _viajero+0
;prueba_Sabertooth_2x60.mbas,34 :: 		end if
L_prueba_Sabertooth_2x60_interrupt16:
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt13:
;prueba_Sabertooth_2x60.mbas,35 :: 		case 2
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt19
;prueba_Sabertooth_2x60.mbas,36 :: 		if dato_recep = "T" then
	MOVF       _dato_recep+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt21
;prueba_Sabertooth_2x60.mbas,37 :: 		viajero = 3
	MOVLW      3
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt22
;prueba_Sabertooth_2x60.mbas,38 :: 		else
L_prueba_Sabertooth_2x60_interrupt21:
;prueba_Sabertooth_2x60.mbas,39 :: 		viajero=0
	CLRF       _viajero+0
;prueba_Sabertooth_2x60.mbas,40 :: 		end if
L_prueba_Sabertooth_2x60_interrupt22:
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt19:
;prueba_Sabertooth_2x60.mbas,42 :: 		case 3
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt25
;prueba_Sabertooth_2x60.mbas,43 :: 		comando[1] = dato_recep    'ADELANTE
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+1
;prueba_Sabertooth_2x60.mbas,44 :: 		viajero=4
	MOVLW      4
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt25:
;prueba_Sabertooth_2x60.mbas,45 :: 		case 4
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt28
;prueba_Sabertooth_2x60.mbas,46 :: 		comando[2] = dato_recep    'ATRAS
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+2
;prueba_Sabertooth_2x60.mbas,47 :: 		viajero=5
	MOVLW      5
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt28:
;prueba_Sabertooth_2x60.mbas,48 :: 		case 5
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt31
;prueba_Sabertooth_2x60.mbas,49 :: 		comando[3] = dato_recep    'IZQUIERDA
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+3
;prueba_Sabertooth_2x60.mbas,50 :: 		viajero=6
	MOVLW      6
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt31:
;prueba_Sabertooth_2x60.mbas,51 :: 		case 6
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt34
;prueba_Sabertooth_2x60.mbas,52 :: 		comando[4] = dato_recep    'DERECHA
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+4
;prueba_Sabertooth_2x60.mbas,53 :: 		viajero=7
	MOVLW      7
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt34:
;prueba_Sabertooth_2x60.mbas,54 :: 		case 7
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt37
;prueba_Sabertooth_2x60.mbas,55 :: 		comando[5] = dato_recep    'ATRAS
	MOVF       _dato_recep+0, 0
	MOVWF      _comando+5
;prueba_Sabertooth_2x60.mbas,56 :: 		viajero = 8
	MOVLW      8
	MOVWF      _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt37:
;prueba_Sabertooth_2x60.mbas,57 :: 		case 8
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_prueba_Sabertooth_2x60_interrupt40
;prueba_Sabertooth_2x60.mbas,58 :: 		viajero=0
	CLRF       _viajero+0
	GOTO       L_prueba_Sabertooth_2x60_interrupt4
L_prueba_Sabertooth_2x60_interrupt40:
L_prueba_Sabertooth_2x60_interrupt4:
;prueba_Sabertooth_2x60.mbas,60 :: 		end select
L_prueba_Sabertooth_2x60_interrupt2:
;prueba_Sabertooth_2x60.mbas,62 :: 		INTCON=0XE0
	MOVLW      224
	MOVWF      INTCON+0
;prueba_Sabertooth_2x60.mbas,63 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;prueba_Sabertooth_2x60.mbas,64 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
L_prueba_Sabertooth_2x60_interrupt85:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of prueba_Sabertooth_2x60_interrupt

prueba_Sabertooth_2x60_adelante_m1:

;prueba_Sabertooth_2x60.mbas,66 :: 		sub procedure adelante_m1()
;prueba_Sabertooth_2x60.mbas,67 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,68 :: 		Delay_us(1000)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_adelante_m142:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m142
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m142
;prueba_Sabertooth_2x60.mbas,69 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,70 :: 		Delay_us(4000)
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_adelante_m143:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m143
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m143
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_adelante_m1

prueba_Sabertooth_2x60_adelante_m2:

;prueba_Sabertooth_2x60.mbas,72 :: 		sub procedure adelante_m2()
;prueba_Sabertooth_2x60.mbas,73 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,74 :: 		Delay_us(1000)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_adelante_m245:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m245
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m245
;prueba_Sabertooth_2x60.mbas,75 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,76 :: 		Delay_us(4000)
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_adelante_m246:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m246
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_adelante_m246
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_adelante_m2

prueba_Sabertooth_2x60_parar:

;prueba_Sabertooth_2x60.mbas,78 :: 		sub procedure parar()
;prueba_Sabertooth_2x60.mbas,79 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,80 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,81 :: 		Delay_us(1500)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar48:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar48
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar48
	NOP
	NOP
;prueba_Sabertooth_2x60.mbas,82 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,83 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,84 :: 		Delay_us(3500)
	MOVLW      5
	MOVWF      R12+0
	MOVLW      138
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar49:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar49
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar49
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_parar

prueba_Sabertooth_2x60_parar_m1:

;prueba_Sabertooth_2x60.mbas,87 :: 		sub procedure parar_m1()
;prueba_Sabertooth_2x60.mbas,88 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,89 :: 		Delay_us(1500)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar_m151:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m151
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m151
	NOP
	NOP
;prueba_Sabertooth_2x60.mbas,90 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,91 :: 		Delay_us(3500)
	MOVLW      5
	MOVWF      R12+0
	MOVLW      138
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar_m152:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m152
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m152
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_parar_m1

prueba_Sabertooth_2x60_parar_m2:

;prueba_Sabertooth_2x60.mbas,93 :: 		sub procedure parar_m2()
;prueba_Sabertooth_2x60.mbas,94 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,95 :: 		Delay_us(1500)
	MOVLW      2
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar_m254:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m254
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m254
	NOP
	NOP
;prueba_Sabertooth_2x60.mbas,96 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,97 :: 		Delay_us(3500)
	MOVLW      5
	MOVWF      R12+0
	MOVLW      138
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_parar_m255:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m255
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_parar_m255
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_parar_m2

prueba_Sabertooth_2x60_atras_m1:

;prueba_Sabertooth_2x60.mbas,99 :: 		sub procedure atras_m1()
;prueba_Sabertooth_2x60.mbas,100 :: 		PORTB.RB0=1
	BSF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,101 :: 		Delay_us(2000)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_atras_m157:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m157
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m157
	NOP
	NOP
;prueba_Sabertooth_2x60.mbas,102 :: 		PORTB.RB0=0
	BCF        PORTB+0, 0
;prueba_Sabertooth_2x60.mbas,103 :: 		Delay_us(3000)
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_atras_m158:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m158
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m158
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_atras_m1

prueba_Sabertooth_2x60_atras_m2:

;prueba_Sabertooth_2x60.mbas,106 :: 		sub procedure atras_m2()
;prueba_Sabertooth_2x60.mbas,107 :: 		PORTB.RB1=1
	BSF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,108 :: 		Delay_us(2000)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_atras_m260:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m260
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m260
	NOP
	NOP
;prueba_Sabertooth_2x60.mbas,109 :: 		PORTB.RB1=0
	BCF        PORTB+0, 1
;prueba_Sabertooth_2x60.mbas,110 :: 		Delay_us(3000)
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_prueba_Sabertooth_2x60_atras_m261:
	DECFSZ     R13+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m261
	DECFSZ     R12+0, 1
	GOTO       L_prueba_Sabertooth_2x60_atras_m261
	NOP
	RETURN
; end of prueba_Sabertooth_2x60_atras_m2

prueba_Sabertooth_2x60_izquierda:

;prueba_Sabertooth_2x60.mbas,112 :: 		sub procedure izquierda()
;prueba_Sabertooth_2x60.mbas,113 :: 		adelante_m1()
	CALL       prueba_Sabertooth_2x60_adelante_m1+0
;prueba_Sabertooth_2x60.mbas,114 :: 		atras_m2()
	CALL       prueba_Sabertooth_2x60_atras_m2+0
	RETURN
; end of prueba_Sabertooth_2x60_izquierda

prueba_Sabertooth_2x60_derecha:

;prueba_Sabertooth_2x60.mbas,116 :: 		sub procedure derecha()
;prueba_Sabertooth_2x60.mbas,117 :: 		adelante_m2()
	CALL       prueba_Sabertooth_2x60_adelante_m2+0
;prueba_Sabertooth_2x60.mbas,118 :: 		atras_m1()
	CALL       prueba_Sabertooth_2x60_atras_m1+0
	RETURN
; end of prueba_Sabertooth_2x60_derecha

_main:

;prueba_Sabertooth_2x60.mbas,120 :: 		main:
;prueba_Sabertooth_2x60.mbas,122 :: 		OSCCON = 0X65 ' Oscilador interno de 8mhz
	MOVLW      101
	MOVWF      OSCCON+0
;prueba_Sabertooth_2x60.mbas,123 :: 		OPTION_REG = 0x86
	MOVLW      134
	MOVWF      OPTION_REG+0
;prueba_Sabertooth_2x60.mbas,124 :: 		INTCON = 0XE0      ' Activado interrupciones globales
	MOVLW      224
	MOVWF      INTCON+0
;prueba_Sabertooth_2x60.mbas,127 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;prueba_Sabertooth_2x60.mbas,128 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;prueba_Sabertooth_2x60.mbas,129 :: 		TRISA =0X00
	CLRF       TRISA+0
;prueba_Sabertooth_2x60.mbas,130 :: 		TRISB= 0X00
	CLRF       TRISB+0
;prueba_Sabertooth_2x60.mbas,131 :: 		PORTB= 0X00
	CLRF       PORTB+0
;prueba_Sabertooth_2x60.mbas,133 :: 		TRISC = 0x80
	MOVLW      128
	MOVWF      TRISC+0
;prueba_Sabertooth_2x60.mbas,134 :: 		PORTC = 0x00
	CLRF       PORTC+0
;prueba_Sabertooth_2x60.mbas,135 :: 		ANSEL = 0X00
	CLRF       ANSEL+0
;prueba_Sabertooth_2x60.mbas,136 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;prueba_Sabertooth_2x60.mbas,138 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;prueba_Sabertooth_2x60.mbas,139 :: 		datos_set=0x00
	CLRF       _datos_set+0
;prueba_Sabertooth_2x60.mbas,140 :: 		viajero=0
	CLRF       _viajero+0
;prueba_Sabertooth_2x60.mbas,142 :: 		while(1)
L__main66:
;prueba_Sabertooth_2x60.mbas,143 :: 		if comando[1]=0x31 then    'ADELANTE
	MOVF       _comando+1, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main71
;prueba_Sabertooth_2x60.mbas,144 :: 		adelante_m1()
	CALL       prueba_Sabertooth_2x60_adelante_m1+0
;prueba_Sabertooth_2x60.mbas,145 :: 		adelante_m2()
	CALL       prueba_Sabertooth_2x60_adelante_m2+0
	GOTO       L__main72
;prueba_Sabertooth_2x60.mbas,146 :: 		else
L__main71:
;prueba_Sabertooth_2x60.mbas,147 :: 		if comando[2]=0x31 then     'ATRAS
	MOVF       _comando+2, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main74
;prueba_Sabertooth_2x60.mbas,148 :: 		atras_m1()
	CALL       prueba_Sabertooth_2x60_atras_m1+0
;prueba_Sabertooth_2x60.mbas,149 :: 		atras_m2()
	CALL       prueba_Sabertooth_2x60_atras_m2+0
	GOTO       L__main75
;prueba_Sabertooth_2x60.mbas,150 :: 		else
L__main74:
;prueba_Sabertooth_2x60.mbas,151 :: 		if comando[3]=0x31 then     'IZQUIERDA
	MOVF       _comando+3, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main77
;prueba_Sabertooth_2x60.mbas,152 :: 		izquierda()
	CALL       prueba_Sabertooth_2x60_izquierda+0
	GOTO       L__main78
;prueba_Sabertooth_2x60.mbas,153 :: 		else
L__main77:
;prueba_Sabertooth_2x60.mbas,154 :: 		if comando[4]=0x31 then     'DERECHA
	MOVF       _comando+4, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main80
;prueba_Sabertooth_2x60.mbas,155 :: 		derecha()
	CALL       prueba_Sabertooth_2x60_derecha+0
	GOTO       L__main81
;prueba_Sabertooth_2x60.mbas,156 :: 		else
L__main80:
;prueba_Sabertooth_2x60.mbas,157 :: 		if comando[5]=0x31 then     'PARAR
	MOVF       _comando+5, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main83
;prueba_Sabertooth_2x60.mbas,158 :: 		parar()
	CALL       prueba_Sabertooth_2x60_parar+0
	GOTO       L__main84
;prueba_Sabertooth_2x60.mbas,159 :: 		else
L__main83:
;prueba_Sabertooth_2x60.mbas,160 :: 		parar()
	CALL       prueba_Sabertooth_2x60_parar+0
;prueba_Sabertooth_2x60.mbas,161 :: 		end if
L__main84:
;prueba_Sabertooth_2x60.mbas,162 :: 		end if
L__main81:
;prueba_Sabertooth_2x60.mbas,163 :: 		end if
L__main78:
;prueba_Sabertooth_2x60.mbas,164 :: 		end if
L__main75:
;prueba_Sabertooth_2x60.mbas,165 :: 		end if
L__main72:
;prueba_Sabertooth_2x60.mbas,166 :: 		wend
	GOTO       L__main66
	GOTO       $+0
; end of _main
