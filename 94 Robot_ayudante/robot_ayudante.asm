
robot_ayudante_tiempo:

;robot_ayudante.mbas,24 :: 		SUB PROCEDURE tiempo ()
;robot_ayudante.mbas,25 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_robot_ayudante_tiempo1:
	DECFSZ     R13+0, 1
	GOTO       L_robot_ayudante_tiempo1
	DECFSZ     R12+0, 1
	GOTO       L_robot_ayudante_tiempo1
	NOP
	NOP
	RETURN
; end of robot_ayudante_tiempo

robot_ayudante_adelante:

;robot_ayudante.mbas,27 :: 		sub procedure adelante()
;robot_ayudante.mbas,28 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;robot_ayudante.mbas,29 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;robot_ayudante.mbas,31 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;robot_ayudante.mbas,32 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;robot_ayudante.mbas,34 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_ayudante.mbas,35 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_ayudante_adelante

robot_ayudante_parar:

;robot_ayudante.mbas,37 :: 		sub procedure parar()
;robot_ayudante.mbas,38 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;robot_ayudante.mbas,39 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;robot_ayudante.mbas,41 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;robot_ayudante.mbas,42 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of robot_ayudante_parar

robot_ayudante_izquierda:

;robot_ayudante.mbas,44 :: 		sub procedure izquierda()
;robot_ayudante.mbas,45 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;robot_ayudante.mbas,46 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;robot_ayudante.mbas,48 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;robot_ayudante.mbas,49 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;robot_ayudante.mbas,50 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_ayudante.mbas,51 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_ayudante_izquierda

robot_ayudante_derecha:

;robot_ayudante.mbas,54 :: 		sub procedure derecha()
;robot_ayudante.mbas,55 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;robot_ayudante.mbas,56 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;robot_ayudante.mbas,58 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;robot_ayudante.mbas,59 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;robot_ayudante.mbas,60 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_ayudante.mbas,61 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_ayudante_derecha

robot_ayudante_atras:

;robot_ayudante.mbas,63 :: 		sub procedure atras()
;robot_ayudante.mbas,64 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;robot_ayudante.mbas,65 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;robot_ayudante.mbas,67 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;robot_ayudante.mbas,68 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;robot_ayudante.mbas,70 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_ayudante.mbas,71 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of robot_ayudante_atras

robot_ayudante_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;robot_ayudante.mbas,74 :: 		sub procedure interrupt
;robot_ayudante.mbas,78 :: 		if (PIR1.RCIF=1) then
	BTFSS      PIR1+0, 5
	GOTO       L_robot_ayudante_interrupt9
;robot_ayudante.mbas,80 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;robot_ayudante.mbas,81 :: 		dato_recep = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato_recep+0
;robot_ayudante.mbas,83 :: 		case 0
	MOVF       _viajero+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt14
;robot_ayudante.mbas,84 :: 		if dato_recep = 0X02 then
	MOVF       _dato_recep+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt16
;robot_ayudante.mbas,85 :: 		viajero = 1
	MOVLW      1
	MOVWF      _viajero+0
	GOTO       L_robot_ayudante_interrupt17
;robot_ayudante.mbas,86 :: 		else
L_robot_ayudante_interrupt16:
;robot_ayudante.mbas,87 :: 		viajero = 0
	CLRF       _viajero+0
;robot_ayudante.mbas,88 :: 		end if
L_robot_ayudante_interrupt17:
	GOTO       L_robot_ayudante_interrupt11
L_robot_ayudante_interrupt14:
;robot_ayudante.mbas,89 :: 		case 1,2,3,4,5,6,7,8,9,10,11,12
	MOVF       _viajero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt20
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt20:
	MOVF       _viajero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt21
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt21:
	MOVF       _viajero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt22
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt22:
	MOVF       _viajero+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt23
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt23:
	MOVF       _viajero+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt24
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt24:
	MOVF       _viajero+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt25
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt25:
	MOVF       _viajero+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt26
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt26:
	MOVF       _viajero+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt27
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt27:
	MOVF       _viajero+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt28
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt28:
	MOVF       _viajero+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt29
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt29:
	MOVF       _viajero+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt30
	GOTO       L_robot_ayudante_interrupt18
L_robot_ayudante_interrupt30:
	MOVF       _viajero+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt31
L_robot_ayudante_interrupt18:
;robot_ayudante.mbas,90 :: 		dato_rd[viajero] = dato_recep
	MOVF       _viajero+0, 0
	ADDLW      _dato_rd+0
	MOVWF      FSR
	MOVF       _dato_recep+0, 0
	MOVWF      INDF+0
;robot_ayudante.mbas,91 :: 		inc(viajero)
	INCF       _viajero+0, 1
	GOTO       L_robot_ayudante_interrupt11
L_robot_ayudante_interrupt31:
;robot_ayudante.mbas,92 :: 		case 13
	MOVF       _viajero+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt34
;robot_ayudante.mbas,93 :: 		if dato_recep = 0X0D then
	MOVF       _dato_recep+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt36
;robot_ayudante.mbas,94 :: 		viajero = 14
	MOVLW      14
	MOVWF      _viajero+0
	GOTO       L_robot_ayudante_interrupt37
;robot_ayudante.mbas,95 :: 		else
L_robot_ayudante_interrupt36:
;robot_ayudante.mbas,96 :: 		viajero = 0
	CLRF       _viajero+0
;robot_ayudante.mbas,97 :: 		end if
L_robot_ayudante_interrupt37:
	GOTO       L_robot_ayudante_interrupt11
L_robot_ayudante_interrupt34:
;robot_ayudante.mbas,98 :: 		case 14
	MOVF       _viajero+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt40
;robot_ayudante.mbas,99 :: 		if dato_recep = 0X0A then
	MOVF       _dato_recep+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt42
;robot_ayudante.mbas,100 :: 		viajero = 15
	MOVLW      15
	MOVWF      _viajero+0
	GOTO       L_robot_ayudante_interrupt43
;robot_ayudante.mbas,101 :: 		else
L_robot_ayudante_interrupt42:
;robot_ayudante.mbas,102 :: 		viajero = 0
	CLRF       _viajero+0
;robot_ayudante.mbas,103 :: 		end if
L_robot_ayudante_interrupt43:
	GOTO       L_robot_ayudante_interrupt11
L_robot_ayudante_interrupt40:
;robot_ayudante.mbas,104 :: 		case 15
	MOVF       _viajero+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt46
;robot_ayudante.mbas,105 :: 		if dato_recep = 0X03 then
	MOVF       _dato_recep+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_interrupt48
;robot_ayudante.mbas,106 :: 		dato_listo = 0xFF
	MOVLW      255
	MOVWF      _dato_listo+0
L_robot_ayudante_interrupt48:
;robot_ayudante.mbas,108 :: 		viajero = 0
	CLRF       _viajero+0
	GOTO       L_robot_ayudante_interrupt11
L_robot_ayudante_interrupt46:
L_robot_ayudante_interrupt11:
;robot_ayudante.mbas,109 :: 		end select
L_robot_ayudante_interrupt9:
;robot_ayudante.mbas,111 :: 		INTCON = INTCON or 0xC0
	MOVLW      192
	IORWF      INTCON+0, 1
L_robot_ayudante_interrupt326:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of robot_ayudante_interrupt

robot_ayudante_abrir_pinza:

;robot_ayudante.mbas,116 :: 		dim i as longword
;robot_ayudante.mbas,117 :: 		i=0
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
;robot_ayudante.mbas,118 :: 		while (i<10000)
L_robot_ayudante_abrir_pinza52:
	MOVLW      0
	SUBWF      R4+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_abrir_pinza327
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_abrir_pinza327
	MOVLW      39
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_abrir_pinza327
	MOVLW      16
	SUBWF      R4+0, 0
L_robot_ayudante_abrir_pinza327:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_ayudante_abrir_pinza53
;robot_ayudante.mbas,119 :: 		inc(i)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;robot_ayudante.mbas,120 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_robot_ayudante_abrir_pinza57
;robot_ayudante.mbas,121 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_abrir_pinza60
;robot_ayudante.mbas,122 :: 		giro=109
	MOVLW      109
	MOVWF      _giro+0
;robot_ayudante.mbas,123 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_ayudante.mbas,124 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;robot_ayudante.mbas,125 :: 		GOTO final
	GOTO       L_robot_ayudante_abrir_pinza_final
L_robot_ayudante_abrir_pinza60:
;robot_ayudante.mbas,127 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_abrir_pinza64
;robot_ayudante.mbas,128 :: 		giro=243
	MOVLW      243
	MOVWF      _giro+0
;robot_ayudante.mbas,129 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_ayudante.mbas,130 :: 		PORTD.RD0=1
	BSF        PORTD+0, 0
;robot_ayudante.mbas,131 :: 		GOTO final
	GOTO       L_robot_ayudante_abrir_pinza_final
L_robot_ayudante_abrir_pinza64:
;robot_ayudante.mbas,133 :: 		final:
L_robot_ayudante_abrir_pinza_final:
;robot_ayudante.mbas,134 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;robot_ayudante.mbas,135 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_robot_ayudante_abrir_pinza57:
;robot_ayudante.mbas,137 :: 		wend
	GOTO       L_robot_ayudante_abrir_pinza52
L_robot_ayudante_abrir_pinza53:
	RETURN
; end of robot_ayudante_abrir_pinza

robot_ayudante_cerrar_pinza:

;robot_ayudante.mbas,141 :: 		dim i as longword
;robot_ayudante.mbas,142 :: 		i=0
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
;robot_ayudante.mbas,143 :: 		while (i<10000)
L_robot_ayudante_cerrar_pinza68:
	MOVLW      0
	SUBWF      R4+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza328
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza328
	MOVLW      39
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza328
	MOVLW      16
	SUBWF      R4+0, 0
L_robot_ayudante_cerrar_pinza328:
	BTFSC      STATUS+0, 0
	GOTO       L_robot_ayudante_cerrar_pinza69
;robot_ayudante.mbas,144 :: 		inc(i)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;robot_ayudante.mbas,145 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza73
;robot_ayudante.mbas,146 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza76
;robot_ayudante.mbas,147 :: 		giro=114
	MOVLW      114
	MOVWF      _giro+0
;robot_ayudante.mbas,148 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_ayudante.mbas,149 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
;robot_ayudante.mbas,150 :: 		GOTO final
	GOTO       L_robot_ayudante_cerrar_pinza_final
L_robot_ayudante_cerrar_pinza76:
;robot_ayudante.mbas,152 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_cerrar_pinza80
;robot_ayudante.mbas,153 :: 		giro=238
	MOVLW      238
	MOVWF      _giro+0
;robot_ayudante.mbas,154 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_ayudante.mbas,155 :: 		PORTD.RD0=1
	BSF        PORTD+0, 0
;robot_ayudante.mbas,156 :: 		GOTO final
	GOTO       L_robot_ayudante_cerrar_pinza_final
L_robot_ayudante_cerrar_pinza80:
;robot_ayudante.mbas,158 :: 		final:
L_robot_ayudante_cerrar_pinza_final:
;robot_ayudante.mbas,159 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;robot_ayudante.mbas,160 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_robot_ayudante_cerrar_pinza73:
;robot_ayudante.mbas,162 :: 		wend
	GOTO       L_robot_ayudante_cerrar_pinza68
L_robot_ayudante_cerrar_pinza69:
	RETURN
; end of robot_ayudante_cerrar_pinza

robot_ayudante_avanza:

;robot_ayudante.mbas,165 :: 		sub procedure avanza()
;robot_ayudante.mbas,167 :: 		sensores=(S2*2)+(S1*1)
	CLRF       R2+0
	BTFSC      PORTD+0, 4
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	CLRF       R0+0
	BTFSC      PORTD+0, 3
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;robot_ayudante.mbas,169 :: 		case 0' S2 S1 = 0 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza86
;robot_ayudante.mbas,170 :: 		ADELANTE()
	CALL       robot_ayudante_adelante+0
	GOTO       L_robot_ayudante_avanza83
L_robot_ayudante_avanza86:
;robot_ayudante.mbas,171 :: 		case 1' S2 S1 = 0 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza89
;robot_ayudante.mbas,172 :: 		DERECHA()
	CALL       robot_ayudante_derecha+0
	GOTO       L_robot_ayudante_avanza83
L_robot_ayudante_avanza89:
;robot_ayudante.mbas,173 :: 		case 2' S2 S1 = 1 0
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza92
;robot_ayudante.mbas,174 :: 		IZQUIERDA
	CALL       robot_ayudante_izquierda+0
	GOTO       L_robot_ayudante_avanza83
L_robot_ayudante_avanza92:
;robot_ayudante.mbas,175 :: 		case 3' S2 S1 = 1 1
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza95
;robot_ayudante.mbas,176 :: 		ADELANTE()
	CALL       robot_ayudante_adelante+0
	GOTO       L_robot_ayudante_avanza83
L_robot_ayudante_avanza95:
L_robot_ayudante_avanza83:
;robot_ayudante.mbas,177 :: 		end select
	RETURN
; end of robot_ayudante_avanza

robot_ayudante_avanza2:

;robot_ayudante.mbas,179 :: 		sub procedure avanza2()
;robot_ayudante.mbas,181 :: 		sensores=(S3*2)+(S4*1)
	CLRF       R2+0
	BTFSC      PORTA+0, 1
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	CLRF       R0+0
	BTFSC      PORTD+0, 5
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;robot_ayudante.mbas,183 :: 		case 0' S2 S1 = 0 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza2100
;robot_ayudante.mbas,184 :: 		ADELANTE()
	CALL       robot_ayudante_adelante+0
	GOTO       L_robot_ayudante_avanza297
L_robot_ayudante_avanza2100:
;robot_ayudante.mbas,185 :: 		case 1' S2 S1 = 0 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza2103
;robot_ayudante.mbas,186 :: 		DERECHA()
	CALL       robot_ayudante_derecha+0
	GOTO       L_robot_ayudante_avanza297
L_robot_ayudante_avanza2103:
;robot_ayudante.mbas,187 :: 		case 2' S2 S1 = 1 0
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza2106
;robot_ayudante.mbas,188 :: 		IZQUIERDA
	CALL       robot_ayudante_izquierda+0
	GOTO       L_robot_ayudante_avanza297
L_robot_ayudante_avanza2106:
;robot_ayudante.mbas,189 :: 		case 3' S2 S1 = 1 1
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_ayudante_avanza2109
;robot_ayudante.mbas,190 :: 		ADELANTE()
	CALL       robot_ayudante_adelante+0
	GOTO       L_robot_ayudante_avanza297
L_robot_ayudante_avanza2109:
L_robot_ayudante_avanza297:
;robot_ayudante.mbas,191 :: 		end select
	RETURN
; end of robot_ayudante_avanza2

_main:

;robot_ayudante.mbas,194 :: 		main:
;robot_ayudante.mbas,195 :: 		OSCCON=0X65
	MOVLW      101
	MOVWF      OSCCON+0
;robot_ayudante.mbas,196 :: 		OPTION_REG=0X06
	MOVLW      6
	MOVWF      OPTION_REG+0
;robot_ayudante.mbas,198 :: 		INTCON = 0XC0 ' Activado interrupciones globales
	MOVLW      192
	MOVWF      INTCON+0
;robot_ayudante.mbas,200 :: 		PIR1.RCIF=0
	BCF        PIR1+0, 5
;robot_ayudante.mbas,201 :: 		PIE1.RCIE=1
	BSF        PIE1+0, 5
;robot_ayudante.mbas,203 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;robot_ayudante.mbas,204 :: 		viajero=0
	CLRF       _viajero+0
;robot_ayudante.mbas,205 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;robot_ayudante.mbas,207 :: 		brazo=0
	CLRF       _brazo+0
	CLRF       _brazo+1
	CLRF       _brazo+2
	CLRF       _brazo+3
;robot_ayudante.mbas,209 :: 		TRISA=%00000011
	MOVLW      3
	MOVWF      TRISA+0
;robot_ayudante.mbas,210 :: 		TRISB=%00000000  '
	CLRF       TRISB+0
;robot_ayudante.mbas,211 :: 		TRISC=%10111000  'RC3,RC4 ENTRADAS   (C1 Y C2 PWM)
	MOVLW      184
	MOVWF      TRISC+0
;robot_ayudante.mbas,212 :: 		TRISD = %00111000
	MOVLW      56
	MOVWF      TRISD+0
;robot_ayudante.mbas,213 :: 		PORTD=0
	CLRF       PORTD+0
;robot_ayudante.mbas,214 :: 		ANSEL=0X01
	MOVLW      1
	MOVWF      ANSEL+0
;robot_ayudante.mbas,215 :: 		ANSELH=0
	CLRF       ANSELH+0
;robot_ayudante.mbas,216 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;robot_ayudante.mbas,217 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;robot_ayudante.mbas,218 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;robot_ayudante.mbas,220 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;robot_ayudante.mbas,221 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;robot_ayudante.mbas,222 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;robot_ayudante.mbas,224 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_ayudante.mbas,225 :: 		TMR0=100
	MOVLW      100
	MOVWF      TMR0+0
;robot_ayudante.mbas,228 :: 		vel = 100
	MOVLW      100
	MOVWF      _vel+0
;robot_ayudante.mbas,229 :: 		portb=vel
	MOVLW      100
	MOVWF      PORTB+0
;robot_ayudante.mbas,230 :: 		delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main111:
	DECFSZ     R13+0, 1
	GOTO       L__main111
	DECFSZ     R12+0, 1
	GOTO       L__main111
	DECFSZ     R11+0, 1
	GOTO       L__main111
	NOP
	NOP
;robot_ayudante.mbas,231 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;robot_ayudante.mbas,232 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main112:
	DECFSZ     R13+0, 1
	GOTO       L__main112
	DECFSZ     R12+0, 1
	GOTO       L__main112
	DECFSZ     R11+0, 1
	GOTO       L__main112
	NOP
;robot_ayudante.mbas,233 :: 		portb=0
	CLRF       PORTB+0
;robot_ayudante.mbas,234 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main113:
	DECFSZ     R13+0, 1
	GOTO       L__main113
	DECFSZ     R12+0, 1
	GOTO       L__main113
	DECFSZ     R11+0, 1
	GOTO       L__main113
	NOP
;robot_ayudante.mbas,235 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;robot_ayudante.mbas,236 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main114:
	DECFSZ     R13+0, 1
	GOTO       L__main114
	DECFSZ     R12+0, 1
	GOTO       L__main114
	DECFSZ     R11+0, 1
	GOTO       L__main114
	NOP
;robot_ayudante.mbas,237 :: 		portb=0
	CLRF       PORTB+0
;robot_ayudante.mbas,239 :: 		dato1[12] = 0x44
	MOVLW      68
	MOVWF      _dato1+12
;robot_ayudante.mbas,240 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main115:
	DECFSZ     R13+0, 1
	GOTO       L__main115
	DECFSZ     R12+0, 1
	GOTO       L__main115
	NOP
	NOP
;robot_ayudante.mbas,241 :: 		dato1[11] = 0x33
	MOVLW      51
	MOVWF      _dato1+11
;robot_ayudante.mbas,242 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main116:
	DECFSZ     R13+0, 1
	GOTO       L__main116
	DECFSZ     R12+0, 1
	GOTO       L__main116
	NOP
	NOP
;robot_ayudante.mbas,243 :: 		dato1[10] =0x42
	MOVLW      66
	MOVWF      _dato1+10
;robot_ayudante.mbas,244 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main117:
	DECFSZ     R13+0, 1
	GOTO       L__main117
	DECFSZ     R12+0, 1
	GOTO       L__main117
	NOP
	NOP
;robot_ayudante.mbas,245 :: 		dato1[9] = 0x46
	MOVLW      70
	MOVWF      _dato1+9
;robot_ayudante.mbas,246 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main118:
	DECFSZ     R13+0, 1
	GOTO       L__main118
	DECFSZ     R12+0, 1
	GOTO       L__main118
	NOP
	NOP
;robot_ayudante.mbas,247 :: 		dato1[8] = 0x41
	MOVLW      65
	MOVWF      _dato1+8
;robot_ayudante.mbas,248 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main119:
	DECFSZ     R13+0, 1
	GOTO       L__main119
	DECFSZ     R12+0, 1
	GOTO       L__main119
	NOP
	NOP
;robot_ayudante.mbas,249 :: 		dato1[7] = 0x38
	MOVLW      56
	MOVWF      _dato1+7
;robot_ayudante.mbas,250 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main120:
	DECFSZ     R13+0, 1
	GOTO       L__main120
	DECFSZ     R12+0, 1
	GOTO       L__main120
	NOP
	NOP
;robot_ayudante.mbas,251 :: 		dato1[6] = 0x42
	MOVLW      66
	MOVWF      _dato1+6
;robot_ayudante.mbas,252 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main121:
	DECFSZ     R13+0, 1
	GOTO       L__main121
	DECFSZ     R12+0, 1
	GOTO       L__main121
	NOP
	NOP
;robot_ayudante.mbas,253 :: 		dato1[5] = 0x34
	MOVLW      52
	MOVWF      _dato1+5
;robot_ayudante.mbas,254 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main122:
	DECFSZ     R13+0, 1
	GOTO       L__main122
	DECFSZ     R12+0, 1
	GOTO       L__main122
	NOP
	NOP
;robot_ayudante.mbas,255 :: 		dato1[4] = 0x30
	MOVLW      48
	MOVWF      _dato1+4
;robot_ayudante.mbas,256 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main123:
	DECFSZ     R13+0, 1
	GOTO       L__main123
	DECFSZ     R12+0, 1
	GOTO       L__main123
	NOP
	NOP
;robot_ayudante.mbas,257 :: 		dato1[3] = 0x30
	MOVLW      48
	MOVWF      _dato1+3
;robot_ayudante.mbas,258 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main124:
	DECFSZ     R13+0, 1
	GOTO       L__main124
	DECFSZ     R12+0, 1
	GOTO       L__main124
	NOP
	NOP
;robot_ayudante.mbas,259 :: 		dato1[2] = 0x37
	MOVLW      55
	MOVWF      _dato1+2
;robot_ayudante.mbas,260 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main125:
	DECFSZ     R13+0, 1
	GOTO       L__main125
	DECFSZ     R12+0, 1
	GOTO       L__main125
	NOP
	NOP
;robot_ayudante.mbas,261 :: 		dato1[1] = 0x30
	MOVLW      48
	MOVWF      _dato1+1
;robot_ayudante.mbas,262 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main126:
	DECFSZ     R13+0, 1
	GOTO       L__main126
	DECFSZ     R12+0, 1
	GOTO       L__main126
	NOP
	NOP
;robot_ayudante.mbas,264 :: 		dato2[12] = 0x32
	MOVLW      50
	MOVWF      _dato2+12
;robot_ayudante.mbas,265 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main127:
	DECFSZ     R13+0, 1
	GOTO       L__main127
	DECFSZ     R12+0, 1
	GOTO       L__main127
	NOP
	NOP
;robot_ayudante.mbas,266 :: 		dato2[11] = 0x45
	MOVLW      69
	MOVWF      _dato2+11
;robot_ayudante.mbas,267 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main128:
	DECFSZ     R13+0, 1
	GOTO       L__main128
	DECFSZ     R12+0, 1
	GOTO       L__main128
	NOP
	NOP
;robot_ayudante.mbas,268 :: 		dato2[10] = 0x38
	MOVLW      56
	MOVWF      _dato2+10
;robot_ayudante.mbas,269 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main129:
	DECFSZ     R13+0, 1
	GOTO       L__main129
	DECFSZ     R12+0, 1
	GOTO       L__main129
	NOP
	NOP
;robot_ayudante.mbas,270 :: 		dato2[9] = 0x46
	MOVLW      70
	MOVWF      _dato2+9
;robot_ayudante.mbas,271 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main130:
	DECFSZ     R13+0, 1
	GOTO       L__main130
	DECFSZ     R12+0, 1
	GOTO       L__main130
	NOP
	NOP
;robot_ayudante.mbas,272 :: 		dato2[8] = 0x31
	MOVLW      49
	MOVWF      _dato2+8
;robot_ayudante.mbas,273 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main131:
	DECFSZ     R13+0, 1
	GOTO       L__main131
	DECFSZ     R12+0, 1
	GOTO       L__main131
	NOP
	NOP
;robot_ayudante.mbas,274 :: 		dato2[7] = 0x37
	MOVLW      55
	MOVWF      _dato2+7
;robot_ayudante.mbas,275 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main132:
	DECFSZ     R13+0, 1
	GOTO       L__main132
	DECFSZ     R12+0, 1
	GOTO       L__main132
	NOP
	NOP
;robot_ayudante.mbas,276 :: 		dato2[6] = 0x43
	MOVLW      67
	MOVWF      _dato2+6
;robot_ayudante.mbas,277 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main133:
	DECFSZ     R13+0, 1
	GOTO       L__main133
	DECFSZ     R12+0, 1
	GOTO       L__main133
	NOP
	NOP
;robot_ayudante.mbas,278 :: 		dato2[5] = 0x36
	MOVLW      54
	MOVWF      _dato2+5
;robot_ayudante.mbas,279 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main134:
	DECFSZ     R13+0, 1
	GOTO       L__main134
	DECFSZ     R12+0, 1
	GOTO       L__main134
	NOP
	NOP
;robot_ayudante.mbas,280 :: 		dato2[4] = 0x30
	MOVLW      48
	MOVWF      _dato2+4
;robot_ayudante.mbas,281 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main135:
	DECFSZ     R13+0, 1
	GOTO       L__main135
	DECFSZ     R12+0, 1
	GOTO       L__main135
	NOP
	NOP
;robot_ayudante.mbas,282 :: 		dato2[3] = 0x30
	MOVLW      48
	MOVWF      _dato2+3
;robot_ayudante.mbas,283 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main136:
	DECFSZ     R13+0, 1
	GOTO       L__main136
	DECFSZ     R12+0, 1
	GOTO       L__main136
	NOP
	NOP
;robot_ayudante.mbas,284 :: 		dato2[2] = 0x37
	MOVLW      55
	MOVWF      _dato2+2
;robot_ayudante.mbas,285 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main137:
	DECFSZ     R13+0, 1
	GOTO       L__main137
	DECFSZ     R12+0, 1
	GOTO       L__main137
	NOP
	NOP
;robot_ayudante.mbas,286 :: 		dato2[1] = 0x30
	MOVLW      48
	MOVWF      _dato2+1
;robot_ayudante.mbas,287 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main138:
	DECFSZ     R13+0, 1
	GOTO       L__main138
	DECFSZ     R12+0, 1
	GOTO       L__main138
	NOP
	NOP
;robot_ayudante.mbas,289 :: 		dato3[12] = 0x35
	MOVLW      53
	MOVWF      _dato3+12
;robot_ayudante.mbas,290 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main139:
	DECFSZ     R13+0, 1
	GOTO       L__main139
	DECFSZ     R12+0, 1
	GOTO       L__main139
	NOP
	NOP
;robot_ayudante.mbas,291 :: 		dato3[11] = 0x41
	MOVLW      65
	MOVWF      _dato3+11
;robot_ayudante.mbas,292 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main140:
	DECFSZ     R13+0, 1
	GOTO       L__main140
	DECFSZ     R12+0, 1
	GOTO       L__main140
	NOP
	NOP
;robot_ayudante.mbas,293 :: 		dato3[10] = 0x32
	MOVLW      50
	MOVWF      _dato3+10
;robot_ayudante.mbas,294 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main141:
	DECFSZ     R13+0, 1
	GOTO       L__main141
	DECFSZ     R12+0, 1
	GOTO       L__main141
	NOP
	NOP
;robot_ayudante.mbas,295 :: 		dato3[9] = 0x41
	MOVLW      65
	MOVWF      _dato3+9
;robot_ayudante.mbas,296 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main142:
	DECFSZ     R13+0, 1
	GOTO       L__main142
	DECFSZ     R12+0, 1
	GOTO       L__main142
	NOP
	NOP
;robot_ayudante.mbas,297 :: 		dato3[8] = 0x38
	MOVLW      56
	MOVWF      _dato3+8
;robot_ayudante.mbas,298 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main143:
	DECFSZ     R13+0, 1
	GOTO       L__main143
	DECFSZ     R12+0, 1
	GOTO       L__main143
	NOP
	NOP
;robot_ayudante.mbas,299 :: 		dato3[7] = 0x34
	MOVLW      52
	MOVWF      _dato3+7
;robot_ayudante.mbas,300 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main144:
	DECFSZ     R13+0, 1
	GOTO       L__main144
	DECFSZ     R12+0, 1
	GOTO       L__main144
	NOP
	NOP
;robot_ayudante.mbas,301 :: 		dato3[6] = 0x38
	MOVLW      56
	MOVWF      _dato3+6
;robot_ayudante.mbas,302 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main145:
	DECFSZ     R13+0, 1
	GOTO       L__main145
	DECFSZ     R12+0, 1
	GOTO       L__main145
	NOP
	NOP
;robot_ayudante.mbas,303 :: 		dato3[5] = 0x34
	MOVLW      52
	MOVWF      _dato3+5
;robot_ayudante.mbas,304 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main146:
	DECFSZ     R13+0, 1
	GOTO       L__main146
	DECFSZ     R12+0, 1
	GOTO       L__main146
	NOP
	NOP
;robot_ayudante.mbas,305 :: 		dato3[4] = 0x30
	MOVLW      48
	MOVWF      _dato3+4
;robot_ayudante.mbas,306 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main147:
	DECFSZ     R13+0, 1
	GOTO       L__main147
	DECFSZ     R12+0, 1
	GOTO       L__main147
	NOP
	NOP
;robot_ayudante.mbas,307 :: 		dato3[3] = 0x30
	MOVLW      48
	MOVWF      _dato3+3
;robot_ayudante.mbas,308 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main148:
	DECFSZ     R13+0, 1
	GOTO       L__main148
	DECFSZ     R12+0, 1
	GOTO       L__main148
	NOP
	NOP
;robot_ayudante.mbas,309 :: 		dato3[2] = 0x37
	MOVLW      55
	MOVWF      _dato3+2
;robot_ayudante.mbas,310 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main149:
	DECFSZ     R13+0, 1
	GOTO       L__main149
	DECFSZ     R12+0, 1
	GOTO       L__main149
	NOP
	NOP
;robot_ayudante.mbas,311 :: 		dato3[1] = 0x30
	MOVLW      48
	MOVWF      _dato3+1
;robot_ayudante.mbas,312 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main150:
	DECFSZ     R13+0, 1
	GOTO       L__main150
	DECFSZ     R12+0, 1
	GOTO       L__main150
	NOP
	NOP
;robot_ayudante.mbas,314 :: 		dato4[12] = 0x37
	MOVLW      55
	MOVWF      _dato4+12
;robot_ayudante.mbas,315 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main151:
	DECFSZ     R13+0, 1
	GOTO       L__main151
	DECFSZ     R12+0, 1
	GOTO       L__main151
	NOP
	NOP
;robot_ayudante.mbas,316 :: 		dato4[11] = 0x42
	MOVLW      66
	MOVWF      _dato4+11
;robot_ayudante.mbas,317 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main152:
	DECFSZ     R13+0, 1
	GOTO       L__main152
	DECFSZ     R12+0, 1
	GOTO       L__main152
	NOP
	NOP
;robot_ayudante.mbas,318 :: 		dato4[10] = 0x30
	MOVLW      48
	MOVWF      _dato4+10
;robot_ayudante.mbas,319 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main153:
	DECFSZ     R13+0, 1
	GOTO       L__main153
	DECFSZ     R12+0, 1
	GOTO       L__main153
	NOP
	NOP
;robot_ayudante.mbas,320 :: 		dato4[9] = 0x39
	MOVLW      57
	MOVWF      _dato4+9
;robot_ayudante.mbas,321 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main154:
	DECFSZ     R13+0, 1
	GOTO       L__main154
	DECFSZ     R12+0, 1
	GOTO       L__main154
	NOP
	NOP
;robot_ayudante.mbas,322 :: 		dato4[8] = 0x33
	MOVLW      51
	MOVWF      _dato4+8
;robot_ayudante.mbas,323 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main155:
	DECFSZ     R13+0, 1
	GOTO       L__main155
	DECFSZ     R12+0, 1
	GOTO       L__main155
	NOP
	NOP
;robot_ayudante.mbas,324 :: 		dato4[7] = 0x42
	MOVLW      66
	MOVWF      _dato4+7
;robot_ayudante.mbas,325 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main156:
	DECFSZ     R13+0, 1
	GOTO       L__main156
	DECFSZ     R12+0, 1
	GOTO       L__main156
	NOP
	NOP
;robot_ayudante.mbas,326 :: 		dato4[6] = 0x32
	MOVLW      50
	MOVWF      _dato4+6
;robot_ayudante.mbas,327 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main157:
	DECFSZ     R13+0, 1
	GOTO       L__main157
	DECFSZ     R12+0, 1
	GOTO       L__main157
	NOP
	NOP
;robot_ayudante.mbas,328 :: 		dato4[5] = 0x39
	MOVLW      57
	MOVWF      _dato4+5
;robot_ayudante.mbas,329 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main158:
	DECFSZ     R13+0, 1
	GOTO       L__main158
	DECFSZ     R12+0, 1
	GOTO       L__main158
	NOP
	NOP
;robot_ayudante.mbas,330 :: 		dato4[4] = 0x30
	MOVLW      48
	MOVWF      _dato4+4
;robot_ayudante.mbas,331 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main159:
	DECFSZ     R13+0, 1
	GOTO       L__main159
	DECFSZ     R12+0, 1
	GOTO       L__main159
	NOP
	NOP
;robot_ayudante.mbas,332 :: 		dato4[3] = 0x30
	MOVLW      48
	MOVWF      _dato4+3
;robot_ayudante.mbas,333 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main160:
	DECFSZ     R13+0, 1
	GOTO       L__main160
	DECFSZ     R12+0, 1
	GOTO       L__main160
	NOP
	NOP
;robot_ayudante.mbas,334 :: 		dato4[2] = 0x36
	MOVLW      54
	MOVWF      _dato4+2
;robot_ayudante.mbas,335 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main161:
	DECFSZ     R13+0, 1
	GOTO       L__main161
	DECFSZ     R12+0, 1
	GOTO       L__main161
	NOP
	NOP
;robot_ayudante.mbas,336 :: 		dato4[1] = 0x30
	MOVLW      48
	MOVWF      _dato4+1
;robot_ayudante.mbas,337 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main162:
	DECFSZ     R13+0, 1
	GOTO       L__main162
	DECFSZ     R12+0, 1
	GOTO       L__main162
	NOP
	NOP
;robot_ayudante.mbas,339 :: 		dato5[12] = 0x37
	MOVLW      55
	MOVWF      _dato5+12
;robot_ayudante.mbas,340 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main163:
	DECFSZ     R13+0, 1
	GOTO       L__main163
	DECFSZ     R12+0, 1
	GOTO       L__main163
	NOP
	NOP
;robot_ayudante.mbas,341 :: 		dato5[11] = 0x34
	MOVLW      52
	MOVWF      _dato5+11
;robot_ayudante.mbas,342 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main164:
	DECFSZ     R13+0, 1
	GOTO       L__main164
	DECFSZ     R12+0, 1
	GOTO       L__main164
	NOP
	NOP
;robot_ayudante.mbas,343 :: 		dato5[10] = 0x35
	MOVLW      53
	MOVWF      _dato5+10
;robot_ayudante.mbas,344 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main165:
	DECFSZ     R13+0, 1
	GOTO       L__main165
	DECFSZ     R12+0, 1
	GOTO       L__main165
	NOP
	NOP
;robot_ayudante.mbas,345 :: 		dato5[9] = 0x38
	MOVLW      56
	MOVWF      _dato5+9
;robot_ayudante.mbas,346 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main166:
	DECFSZ     R13+0, 1
	GOTO       L__main166
	DECFSZ     R12+0, 1
	GOTO       L__main166
	NOP
	NOP
;robot_ayudante.mbas,347 :: 		dato5[8] = 0x31
	MOVLW      49
	MOVWF      _dato5+8
;robot_ayudante.mbas,348 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main167:
	DECFSZ     R13+0, 1
	GOTO       L__main167
	DECFSZ     R12+0, 1
	GOTO       L__main167
	NOP
	NOP
;robot_ayudante.mbas,349 :: 		dato5[7] = 0x35
	MOVLW      53
	MOVWF      _dato5+7
;robot_ayudante.mbas,350 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main168:
	DECFSZ     R13+0, 1
	GOTO       L__main168
	DECFSZ     R12+0, 1
	GOTO       L__main168
	NOP
	NOP
;robot_ayudante.mbas,351 :: 		dato5[6] = 0x44
	MOVLW      68
	MOVWF      _dato5+6
;robot_ayudante.mbas,352 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main169:
	DECFSZ     R13+0, 1
	GOTO       L__main169
	DECFSZ     R12+0, 1
	GOTO       L__main169
	NOP
	NOP
;robot_ayudante.mbas,353 :: 		dato5[5] = 0x44
	MOVLW      68
	MOVWF      _dato5+5
;robot_ayudante.mbas,354 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main170:
	DECFSZ     R13+0, 1
	GOTO       L__main170
	DECFSZ     R12+0, 1
	GOTO       L__main170
	NOP
	NOP
;robot_ayudante.mbas,355 :: 		dato5[4] = 0x30
	MOVLW      48
	MOVWF      _dato5+4
;robot_ayudante.mbas,356 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main171:
	DECFSZ     R13+0, 1
	GOTO       L__main171
	DECFSZ     R12+0, 1
	GOTO       L__main171
	NOP
	NOP
;robot_ayudante.mbas,357 :: 		dato5[3] = 0x30
	MOVLW      48
	MOVWF      _dato5+3
;robot_ayudante.mbas,358 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main172:
	DECFSZ     R13+0, 1
	GOTO       L__main172
	DECFSZ     R12+0, 1
	GOTO       L__main172
	NOP
	NOP
;robot_ayudante.mbas,359 :: 		dato5[2] = 0x45
	MOVLW      69
	MOVWF      _dato5+2
;robot_ayudante.mbas,360 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main173:
	DECFSZ     R13+0, 1
	GOTO       L__main173
	DECFSZ     R12+0, 1
	GOTO       L__main173
	NOP
	NOP
;robot_ayudante.mbas,361 :: 		dato5[1] = 0x34
	MOVLW      52
	MOVWF      _dato5+1
;robot_ayudante.mbas,362 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main174:
	DECFSZ     R13+0, 1
	GOTO       L__main174
	DECFSZ     R12+0, 1
	GOTO       L__main174
	NOP
	NOP
;robot_ayudante.mbas,364 :: 		dato6[12] = 0x36
	MOVLW      54
	MOVWF      _dato6+12
;robot_ayudante.mbas,365 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main175:
	DECFSZ     R13+0, 1
	GOTO       L__main175
	DECFSZ     R12+0, 1
	GOTO       L__main175
	NOP
	NOP
;robot_ayudante.mbas,366 :: 		dato6[11] = 0x37
	MOVLW      55
	MOVWF      _dato6+11
;robot_ayudante.mbas,367 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main176:
	DECFSZ     R13+0, 1
	GOTO       L__main176
	DECFSZ     R12+0, 1
	GOTO       L__main176
	NOP
	NOP
;robot_ayudante.mbas,368 :: 		dato6[10] = 0x45
	MOVLW      69
	MOVWF      _dato6+10
;robot_ayudante.mbas,369 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main177:
	DECFSZ     R13+0, 1
	GOTO       L__main177
	DECFSZ     R12+0, 1
	GOTO       L__main177
	NOP
	NOP
;robot_ayudante.mbas,370 :: 		dato6[9] = 0x34
	MOVLW      52
	MOVWF      _dato6+9
;robot_ayudante.mbas,371 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main178:
	DECFSZ     R13+0, 1
	GOTO       L__main178
	DECFSZ     R12+0, 1
	GOTO       L__main178
	NOP
	NOP
;robot_ayudante.mbas,372 :: 		dato6[8] = 0x42
	MOVLW      66
	MOVWF      _dato6+8
;robot_ayudante.mbas,373 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main179:
	DECFSZ     R13+0, 1
	GOTO       L__main179
	DECFSZ     R12+0, 1
	GOTO       L__main179
	NOP
	NOP
;robot_ayudante.mbas,374 :: 		dato6[7] = 0x41
	MOVLW      65
	MOVWF      _dato6+7
;robot_ayudante.mbas,375 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main180:
	DECFSZ     R13+0, 1
	GOTO       L__main180
	DECFSZ     R12+0, 1
	GOTO       L__main180
	NOP
	NOP
;robot_ayudante.mbas,376 :: 		dato6[6] = 0x44
	MOVLW      68
	MOVWF      _dato6+6
;robot_ayudante.mbas,377 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main181:
	DECFSZ     R13+0, 1
	GOTO       L__main181
	DECFSZ     R12+0, 1
	GOTO       L__main181
	NOP
	NOP
;robot_ayudante.mbas,378 :: 		dato6[5] = 0x44
	MOVLW      68
	MOVWF      _dato6+5
;robot_ayudante.mbas,379 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main182:
	DECFSZ     R13+0, 1
	GOTO       L__main182
	DECFSZ     R12+0, 1
	GOTO       L__main182
	NOP
	NOP
;robot_ayudante.mbas,380 :: 		dato6[4] = 0x30
	MOVLW      48
	MOVWF      _dato6+4
;robot_ayudante.mbas,381 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main183:
	DECFSZ     R13+0, 1
	GOTO       L__main183
	DECFSZ     R12+0, 1
	GOTO       L__main183
	NOP
	NOP
;robot_ayudante.mbas,382 :: 		dato6[3] = 0x30
	MOVLW      48
	MOVWF      _dato6+3
;robot_ayudante.mbas,383 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main184:
	DECFSZ     R13+0, 1
	GOTO       L__main184
	DECFSZ     R12+0, 1
	GOTO       L__main184
	NOP
	NOP
;robot_ayudante.mbas,384 :: 		dato6[2] = 0x45
	MOVLW      69
	MOVWF      _dato6+2
;robot_ayudante.mbas,385 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main185:
	DECFSZ     R13+0, 1
	GOTO       L__main185
	DECFSZ     R12+0, 1
	GOTO       L__main185
	NOP
	NOP
;robot_ayudante.mbas,386 :: 		dato6[1] = 0x34
	MOVLW      52
	MOVWF      _dato6+1
;robot_ayudante.mbas,387 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main186:
	DECFSZ     R13+0, 1
	GOTO       L__main186
	DECFSZ     R12+0, 1
	GOTO       L__main186
	NOP
	NOP
;robot_ayudante.mbas,389 :: 		tag=0
	CLRF       _tag+0
;robot_ayudante.mbas,390 :: 		salto=0
	CLRF       _salto+0
;robot_ayudante.mbas,391 :: 		producto=0
	CLRF       _producto+0
;robot_ayudante.mbas,396 :: 		while (1)
L__main188:
;robot_ayudante.mbas,397 :: 		avanza
	CALL       robot_ayudante_avanza+0
;robot_ayudante.mbas,398 :: 		wend
	GOTO       L__main188
;robot_ayudante.mbas,428 :: 		Delay_ms(1000)
L__main217:
	DECFSZ     R13+0, 1
	GOTO       L__main217
	DECFSZ     R12+0, 1
	GOTO       L__main217
	DECFSZ     R11+0, 1
	GOTO       L__main217
	NOP
	NOP
;robot_ayudante.mbas,429 :: 		dato_listo = 0x00
	CLRF       _dato_listo+0
;robot_ayudante.mbas,430 :: 		veces1 = 0
	CLRF       _veces1+0
;robot_ayudante.mbas,431 :: 		for i=1 to 12
	MOVLW      1
	MOVWF      _i+0
;robot_ayudante.mbas,438 :: 		Delay_ms(100)
L__main229:
	DECFSZ     R13+0, 1
	GOTO       L__main229
	DECFSZ     R12+0, 1
	GOTO       L__main229
	NOP
	NOP
;robot_ayudante.mbas,439 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,440 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main228
;robot_ayudante.mbas,455 :: 		Delay_ms(100)
L__main241:
	DECFSZ     R13+0, 1
	GOTO       L__main241
	DECFSZ     R12+0, 1
	GOTO       L__main241
	NOP
	NOP
;robot_ayudante.mbas,456 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,457 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main240
;robot_ayudante.mbas,472 :: 		Delay_ms(100)
L__main253:
	DECFSZ     R13+0, 1
	GOTO       L__main253
	DECFSZ     R12+0, 1
	GOTO       L__main253
	NOP
	NOP
;robot_ayudante.mbas,473 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,474 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main252
;robot_ayudante.mbas,489 :: 		Delay_ms(100)
L__main265:
	DECFSZ     R13+0, 1
	GOTO       L__main265
	DECFSZ     R12+0, 1
	GOTO       L__main265
	NOP
	NOP
;robot_ayudante.mbas,490 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,491 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main264
;robot_ayudante.mbas,506 :: 		Delay_ms(100)
L__main277:
	DECFSZ     R13+0, 1
	GOTO       L__main277
	DECFSZ     R12+0, 1
	GOTO       L__main277
	NOP
	NOP
;robot_ayudante.mbas,507 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,508 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main276
;robot_ayudante.mbas,523 :: 		Delay_ms(100)
L__main289:
	DECFSZ     R13+0, 1
	GOTO       L__main289
	DECFSZ     R12+0, 1
	GOTO       L__main289
	NOP
	NOP
;robot_ayudante.mbas,524 :: 		PORTB=0X00
	CLRF       PORTB+0
;robot_ayudante.mbas,525 :: 		SALTO=2
	MOVLW      2
	MOVWF      _salto+0
	GOTO       L__main288
;robot_ayudante.mbas,536 :: 		Delay_ms(1000)
L__main293:
	DECFSZ     R13+0, 1
	GOTO       L__main293
	DECFSZ     R12+0, 1
	GOTO       L__main293
	DECFSZ     R11+0, 1
	GOTO       L__main293
	NOP
	NOP
;robot_ayudante.mbas,537 :: 		abrir_pinza()
	CALL       robot_ayudante_abrir_pinza+0
;robot_ayudante.mbas,550 :: 		Delay_ms(1000)
L__main310:
	DECFSZ     R13+0, 1
	GOTO       L__main310
	DECFSZ     R12+0, 1
	GOTO       L__main310
	DECFSZ     R11+0, 1
	GOTO       L__main310
	NOP
	NOP
;robot_ayudante.mbas,551 :: 		brazo=0
	CLRF       _brazo+0
	CLRF       _brazo+1
	CLRF       _brazo+2
	CLRF       _brazo+3
;robot_ayudante.mbas,552 :: 		salto=4
	MOVLW      4
	MOVWF      _salto+0
;robot_ayudante.mbas,553 :: 		WEND
	GOTO       L__main306
;robot_ayudante.mbas,562 :: 		Delay_ms(200)
L__main324:
	DECFSZ     R13+0, 1
	GOTO       L__main324
	DECFSZ     R12+0, 1
	GOTO       L__main324
	DECFSZ     R11+0, 1
	GOTO       L__main324
	NOP
;robot_ayudante.mbas,563 :: 		portb=0
	CLRF       PORTB+0
;robot_ayudante.mbas,564 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main325:
	DECFSZ     R13+0, 1
	GOTO       L__main325
	DECFSZ     R12+0, 1
	GOTO       L__main325
	DECFSZ     R11+0, 1
	GOTO       L__main325
	NOP
;robot_ayudante.mbas,565 :: 		wend
	GOTO       L__main320
;robot_ayudante.mbas,570 :: 		WEND
	GOTO       $+0
; end of _main
