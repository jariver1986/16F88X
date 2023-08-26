
_main:

;Robot_RadioControlado.mbas,12 :: 		main:
;Robot_RadioControlado.mbas,13 :: 		OSCCON=0x75
	MOVLW      117
	MOVWF      OSCCON+0
;Robot_RadioControlado.mbas,14 :: 		TRISA=0
	CLRF       TRISA+0
;Robot_RadioControlado.mbas,15 :: 		TRISB=0
	CLRF       TRISB+0
;Robot_RadioControlado.mbas,16 :: 		TRISC=%10000000
	MOVLW      128
	MOVWF      TRISC+0
;Robot_RadioControlado.mbas,17 :: 		TRISD=0
	CLRF       TRISD+0
;Robot_RadioControlado.mbas,18 :: 		ANSEL=0
	CLRF       ANSEL+0
;Robot_RadioControlado.mbas,19 :: 		ANSELH=0
	CLRF       ANSELH+0
;Robot_RadioControlado.mbas,20 :: 		PORTA=0
	CLRF       PORTA+0
;Robot_RadioControlado.mbas,21 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot_RadioControlado.mbas,22 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,23 :: 		DATO_COMPLETO=0
	CLRF       _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
;Robot_RadioControlado.mbas,25 :: 		WHILE(1)
L__main2:
;Robot_RadioControlado.mbas,26 :: 		DELAY_MS(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main6:
	DECFSZ     R13+0, 1
	GOTO       L__main6
	DECFSZ     R12+0, 1
	GOTO       L__main6
	DECFSZ     R11+0, 1
	GOTO       L__main6
	NOP
;Robot_RadioControlado.mbas,27 :: 		IF(UART1_Data_Ready =1)THEN
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main8
;Robot_RadioControlado.mbas,28 :: 		RECIBIDO = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _RECIBIDO+0
	CLRF       _RECIBIDO+1
;Robot_RadioControlado.mbas,30 :: 		CASE 0
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      0
	XORWF      _INDICE+0, 0
L__main47:
	BTFSS      STATUS+0, 2
	GOTO       L__main13
;Robot_RadioControlado.mbas,31 :: 		IF(RECIBIDO=0x24)THEN 'INICIO
	MOVLW      0
	XORWF      _RECIBIDO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      36
	XORWF      _RECIBIDO+0, 0
L__main48:
	BTFSS      STATUS+0, 2
	GOTO       L__main15
;Robot_RadioControlado.mbas,32 :: 		INDICE=1
	MOVLW      1
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main16
;Robot_RadioControlado.mbas,33 :: 		ELSE
L__main15:
;Robot_RadioControlado.mbas,34 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,35 :: 		END IF
L__main16:
	GOTO       L__main10
L__main13:
;Robot_RadioControlado.mbas,36 :: 		CASE 1
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      1
	XORWF      _INDICE+0, 0
L__main49:
	BTFSS      STATUS+0, 2
	GOTO       L__main19
;Robot_RadioControlado.mbas,37 :: 		IF(RECIBIDO=7)THEN  'IDENTIFICADOR
	MOVLW      0
	XORWF      _RECIBIDO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      7
	XORWF      _RECIBIDO+0, 0
L__main50:
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;Robot_RadioControlado.mbas,38 :: 		INDICE=2
	MOVLW      2
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main22
;Robot_RadioControlado.mbas,39 :: 		ELSE
L__main21:
;Robot_RadioControlado.mbas,40 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,41 :: 		END IF
L__main22:
	GOTO       L__main10
L__main19:
;Robot_RadioControlado.mbas,42 :: 		CASE 2
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      2
	XORWF      _INDICE+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;Robot_RadioControlado.mbas,43 :: 		direc1=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _direc1+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _direc1+1
;Robot_RadioControlado.mbas,44 :: 		INDICE=3
	MOVLW      3
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main10
L__main25:
;Robot_RadioControlado.mbas,45 :: 		CASE 3
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      3
	XORWF      _INDICE+0, 0
L__main52:
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Robot_RadioControlado.mbas,46 :: 		VEL1=RECIBIDO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _VEL1+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _VEL1+1
;Robot_RadioControlado.mbas,47 :: 		INDICE=4
	MOVLW      4
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main10
L__main28:
;Robot_RadioControlado.mbas,48 :: 		CASE 4
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      4
	XORWF      _INDICE+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;Robot_RadioControlado.mbas,49 :: 		Direc2=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _direc2+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _direc2+1
;Robot_RadioControlado.mbas,50 :: 		INDICE=5
	MOVLW      5
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main10
L__main31:
;Robot_RadioControlado.mbas,51 :: 		CASE 5
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      5
	XORWF      _INDICE+0, 0
L__main54:
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Robot_RadioControlado.mbas,52 :: 		VEL2=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _VEL2+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _VEL2+1
;Robot_RadioControlado.mbas,53 :: 		INDICE=6
	MOVLW      6
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,54 :: 		DATO_COMPLETO=1
	MOVLW      1
	MOVWF      _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
	GOTO       L__main10
L__main34:
L__main10:
;Robot_RadioControlado.mbas,55 :: 		END SELECT
L__main8:
;Robot_RadioControlado.mbas,57 :: 		IF(DATO_COMPLETO=1)THEN
	MOVLW      0
	XORWF      _DATO_COMPLETO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      1
	XORWF      _DATO_COMPLETO+0, 0
L__main55:
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;Robot_RadioControlado.mbas,58 :: 		if((direc1=1) and (direc2=1))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      1
	XORWF      _direc1+0, 0
L__main56:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      1
	XORWF      _direc2+0, 0
L__main57:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main39
;Robot_RadioControlado.mbas,59 :: 		UART1_Write(0x31)
	MOVLW      49
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot_RadioControlado.mbas,60 :: 		Delay_100ms
	CALL       _Delay_100ms+0
	GOTO       L__main40
;Robot_RadioControlado.mbas,61 :: 		else
L__main39:
;Robot_RadioControlado.mbas,62 :: 		if((direc1=1) and (direc2=0))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      1
	XORWF      _direc1+0, 0
L__main58:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      0
	XORWF      _direc2+0, 0
L__main59:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main42
;Robot_RadioControlado.mbas,63 :: 		UART1_Write(0x32)
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot_RadioControlado.mbas,64 :: 		Delay_100ms
	CALL       _Delay_100ms+0
	GOTO       L__main43
;Robot_RadioControlado.mbas,65 :: 		else
L__main42:
;Robot_RadioControlado.mbas,66 :: 		if((direc1=0) and (direc2=1))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      0
	XORWF      _direc1+0, 0
L__main60:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      1
	XORWF      _direc2+0, 0
L__main61:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main45
;Robot_RadioControlado.mbas,67 :: 		UART1_Write(0x33)
	MOVLW      51
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot_RadioControlado.mbas,68 :: 		Delay_100ms
	CALL       _Delay_100ms+0
L__main45:
;Robot_RadioControlado.mbas,70 :: 		end if
L__main43:
;Robot_RadioControlado.mbas,71 :: 		end if
L__main40:
;Robot_RadioControlado.mbas,73 :: 		DATO_COMPLETO=0
	CLRF       _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
;Robot_RadioControlado.mbas,74 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
L__main36:
;Robot_RadioControlado.mbas,76 :: 		WEND
	GOTO       L__main2
	GOTO       $+0
; end of _main
