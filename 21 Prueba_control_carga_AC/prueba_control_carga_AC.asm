
prueba_control_carga_AC_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;prueba_control_carga_AC.mbas,5 :: 		sub procedure interrupt()
;prueba_control_carga_AC.mbas,7 :: 		if INTCON.TMR0IF=1 then
	BTFSS      INTCON+0, 2
	GOTO       L_prueba_control_carga_AC_interrupt2
;prueba_control_carga_AC.mbas,8 :: 		INTCON.TMR0IF=0
	BCF        INTCON+0, 2
;prueba_control_carga_AC.mbas,9 :: 		PORTC.RC0 = 1
	BSF        PORTC+0, 0
;prueba_control_carga_AC.mbas,10 :: 		INTCON.TMR0IE = 0
	BCF        INTCON+0, 5
;prueba_control_carga_AC.mbas,11 :: 		INTCON.INTE = 1
	BSF        INTCON+0, 4
L_prueba_control_carga_AC_interrupt2:
;prueba_control_carga_AC.mbas,13 :: 		if INTCON.INTF=1 then
	BTFSS      INTCON+0, 1
	GOTO       L_prueba_control_carga_AC_interrupt5
;prueba_control_carga_AC.mbas,14 :: 		INTCON.INTF=0
	BCF        INTCON+0, 1
;prueba_control_carga_AC.mbas,15 :: 		TMR0 = LUZ
	MOVF       _LUZ+0, 0
	MOVWF      TMR0+0
;prueba_control_carga_AC.mbas,16 :: 		PORTC.RC0 = 0
	BCF        PORTC+0, 0
;prueba_control_carga_AC.mbas,17 :: 		INTCON.TMR0IE = 1
	BSF        INTCON+0, 5
;prueba_control_carga_AC.mbas,18 :: 		INTCON.INTE = 0
	BCF        INTCON+0, 4
L_prueba_control_carga_AC_interrupt5:
;prueba_control_carga_AC.mbas,19 :: 		end if
L_prueba_control_carga_AC_interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of prueba_control_carga_AC_interrupt

_main:

;prueba_control_carga_AC.mbas,23 :: 		main:
;prueba_control_carga_AC.mbas,24 :: 		ANSEL  = 0x01                          ' Configure AN pins as digital I/O
	MOVLW      1
	MOVWF      ANSEL+0
;prueba_control_carga_AC.mbas,25 :: 		ANSELH = 0X00
	CLRF       ANSELH+0
;prueba_control_carga_AC.mbas,26 :: 		TRISA=0X01
	MOVLW      1
	MOVWF      TRISA+0
;prueba_control_carga_AC.mbas,27 :: 		PORTA=0X00
	CLRF       PORTA+0
;prueba_control_carga_AC.mbas,29 :: 		TRISB=0X01
	MOVLW      1
	MOVWF      TRISB+0
;prueba_control_carga_AC.mbas,30 :: 		PORTB=0X00
	CLRF       PORTB+0
;prueba_control_carga_AC.mbas,32 :: 		TRISC=0X80
	MOVLW      128
	MOVWF      TRISC+0
;prueba_control_carga_AC.mbas,33 :: 		PORTC=0X00
	CLRF       PORTC+0
;prueba_control_carga_AC.mbas,35 :: 		OSCCON = 0X65
	MOVLW      101
	MOVWF      OSCCON+0
;prueba_control_carga_AC.mbas,36 :: 		OPTION_REG=%1000100
	MOVLW      68
	MOVWF      OPTION_REG+0
;prueba_control_carga_AC.mbas,37 :: 		INTCON=%11110000
	MOVLW      240
	MOVWF      INTCON+0
;prueba_control_carga_AC.mbas,39 :: 		TMR0=0
	CLRF       TMR0+0
;prueba_control_carga_AC.mbas,40 :: 		TEMP=0
	CLRF       _TEMP+0
	CLRF       _TEMP+1
;prueba_control_carga_AC.mbas,41 :: 		LUZ=0
	CLRF       _LUZ+0
	CLRF       _LUZ+1
;prueba_control_carga_AC.mbas,44 :: 		WHILE(1)
L__main10:
;prueba_control_carga_AC.mbas,45 :: 		LUZ = Adc_Read(0)>>2
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _LUZ+0
	MOVF       R0+1, 0
	MOVWF      _LUZ+1
	RRF        _LUZ+1, 1
	RRF        _LUZ+0, 1
	BCF        _LUZ+1, 7
	RRF        _LUZ+1, 1
	RRF        _LUZ+0, 1
	BCF        _LUZ+1, 7
;prueba_control_carga_AC.mbas,46 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main14:
	DECFSZ     R13+0, 1
	GOTO       L__main14
	DECFSZ     R12+0, 1
	GOTO       L__main14
	NOP
	NOP
;prueba_control_carga_AC.mbas,47 :: 		WEND
	GOTO       L__main10
	GOTO       $+0
; end of _main
