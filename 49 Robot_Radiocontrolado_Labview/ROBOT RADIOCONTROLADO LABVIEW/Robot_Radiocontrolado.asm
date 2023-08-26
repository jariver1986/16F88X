
Robot_RadioControlado_set_motors:

;Robot_RadioControlado.mbas,11 :: 		sub procedure set_motors(dim motor1, motor2 as integer)
;Robot_RadioControlado.mbas,13 :: 		if motor1 < 0 then
	MOVLW      128
	XORWF      FARG_set_motors_motor1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_RadioControlado_set_motors60
	MOVLW      0
	SUBWF      FARG_set_motors_motor1+0, 0
L_Robot_RadioControlado_set_motors60:
	BTFSC      STATUS+0, 0
	GOTO       L_Robot_RadioControlado_set_motors2
;Robot_RadioControlado.mbas,14 :: 		motor1 = -motor1
	MOVF       FARG_set_motors_motor1+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor1+0
	MOVF       FARG_set_motors_motor1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor1+1
	SUBWF      FARG_set_motors_motor1+1, 1
;Robot_RadioControlado.mbas,15 :: 		DIR1 = 0
	BCF        PORTA+0, 2
;Robot_RadioControlado.mbas,16 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
	GOTO       L_Robot_RadioControlado_set_motors3
;Robot_RadioControlado.mbas,17 :: 		else
L_Robot_RadioControlado_set_motors2:
;Robot_RadioControlado.mbas,18 :: 		DIR1 = 1
	BSF        PORTA+0, 2
;Robot_RadioControlado.mbas,19 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Robot_RadioControlado.mbas,20 :: 		end if
L_Robot_RadioControlado_set_motors3:
;Robot_RadioControlado.mbas,22 :: 		if motor2 < 0 then
	MOVLW      128
	XORWF      FARG_set_motors_motor2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_RadioControlado_set_motors61
	MOVLW      0
	SUBWF      FARG_set_motors_motor2+0, 0
L_Robot_RadioControlado_set_motors61:
	BTFSC      STATUS+0, 0
	GOTO       L_Robot_RadioControlado_set_motors5
;Robot_RadioControlado.mbas,23 :: 		motor2= -motor2
	MOVF       FARG_set_motors_motor2+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor2+0
	MOVF       FARG_set_motors_motor2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor2+1
	SUBWF      FARG_set_motors_motor2+1, 1
;Robot_RadioControlado.mbas,24 :: 		DIR2 = 0
	BCF        PORTA+0, 3
;Robot_RadioControlado.mbas,25 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
	GOTO       L_Robot_RadioControlado_set_motors6
;Robot_RadioControlado.mbas,26 :: 		else
L_Robot_RadioControlado_set_motors5:
;Robot_RadioControlado.mbas,27 :: 		DIR2 = 1
	BSF        PORTA+0, 3
;Robot_RadioControlado.mbas,28 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;Robot_RadioControlado.mbas,29 :: 		end if
L_Robot_RadioControlado_set_motors6:
;Robot_RadioControlado.mbas,31 :: 		if motor1 > 0xFF then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_set_motors_motor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_RadioControlado_set_motors62
	MOVF       FARG_set_motors_motor1+0, 0
	SUBLW      255
L_Robot_RadioControlado_set_motors62:
	BTFSC      STATUS+0, 0
	GOTO       L_Robot_RadioControlado_set_motors8
;Robot_RadioControlado.mbas,32 :: 		motor1 = 0xFF
	MOVLW      255
	MOVWF      FARG_set_motors_motor1+0
	CLRF       FARG_set_motors_motor1+1
L_Robot_RadioControlado_set_motors8:
;Robot_RadioControlado.mbas,35 :: 		if motor2 > 0xFF then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_set_motors_motor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Robot_RadioControlado_set_motors63
	MOVF       FARG_set_motors_motor2+0, 0
	SUBLW      255
L_Robot_RadioControlado_set_motors63:
	BTFSC      STATUS+0, 0
	GOTO       L_Robot_RadioControlado_set_motors11
;Robot_RadioControlado.mbas,36 :: 		motor2 = 0xFF
	MOVLW      255
	MOVWF      FARG_set_motors_motor2+0
	CLRF       FARG_set_motors_motor2+1
L_Robot_RadioControlado_set_motors11:
;Robot_RadioControlado.mbas,39 :: 		PWM1_Set_Duty(motor1)
	MOVF       FARG_set_motors_motor1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_RadioControlado.mbas,40 :: 		PWM2_Set_Duty(motor2)
	MOVF       FARG_set_motors_motor2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	RETURN
; end of Robot_RadioControlado_set_motors

_main:

;Robot_RadioControlado.mbas,44 :: 		main:
;Robot_RadioControlado.mbas,45 :: 		OSCCON=0x75
	MOVLW      117
	MOVWF      OSCCON+0
;Robot_RadioControlado.mbas,46 :: 		TRISA=0
	CLRF       TRISA+0
;Robot_RadioControlado.mbas,47 :: 		TRISB=0
	CLRF       TRISB+0
;Robot_RadioControlado.mbas,48 :: 		TRISC=%10000000
	MOVLW      128
	MOVWF      TRISC+0
;Robot_RadioControlado.mbas,49 :: 		ANSEL=0
	CLRF       ANSEL+0
;Robot_RadioControlado.mbas,50 :: 		ANSELH=0
	CLRF       ANSELH+0
;Robot_RadioControlado.mbas,51 :: 		PORTA=0
	CLRF       PORTA+0
;Robot_RadioControlado.mbas,52 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot_RadioControlado.mbas,53 :: 		PWM1_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Robot_RadioControlado.mbas,54 :: 		PWM2_Init(1000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Robot_RadioControlado.mbas,55 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Robot_RadioControlado.mbas,56 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Robot_RadioControlado.mbas,57 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Robot_RadioControlado.mbas,58 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Robot_RadioControlado.mbas,59 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,60 :: 		DATO_COMPLETO=0
	CLRF       _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
;Robot_RadioControlado.mbas,62 :: 		WHILE(1)
L__main15:
;Robot_RadioControlado.mbas,63 :: 		DELAY_MS(100)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main19:
	DECFSZ     R13+0, 1
	GOTO       L__main19
	DECFSZ     R12+0, 1
	GOTO       L__main19
	DECFSZ     R11+0, 1
	GOTO       L__main19
	NOP
;Robot_RadioControlado.mbas,64 :: 		PORTB=0XFF
	MOVLW      255
	MOVWF      PORTB+0
;Robot_RadioControlado.mbas,65 :: 		IF(UART1_Data_Ready =1)THEN
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;Robot_RadioControlado.mbas,66 :: 		RECIBIDO = UART1_Read()
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _RECIBIDO+0
	CLRF       _RECIBIDO+1
;Robot_RadioControlado.mbas,68 :: 		CASE 0
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      0
	XORWF      _INDICE+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L__main26
;Robot_RadioControlado.mbas,69 :: 		IF(RECIBIDO=0x24)THEN 'INICIO
	MOVLW      0
	XORWF      _RECIBIDO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      36
	XORWF      _RECIBIDO+0, 0
L__main65:
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Robot_RadioControlado.mbas,70 :: 		INDICE=1
	MOVLW      1
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main29
;Robot_RadioControlado.mbas,71 :: 		ELSE
L__main28:
;Robot_RadioControlado.mbas,72 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,73 :: 		END IF
L__main29:
	GOTO       L__main23
L__main26:
;Robot_RadioControlado.mbas,74 :: 		CASE 1
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      1
	XORWF      _INDICE+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L__main32
;Robot_RadioControlado.mbas,75 :: 		IF(RECIBIDO=7)THEN  'IDENTIFICADOR
	MOVLW      0
	XORWF      _RECIBIDO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      7
	XORWF      _RECIBIDO+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Robot_RadioControlado.mbas,76 :: 		INDICE=2
	MOVLW      2
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main35
;Robot_RadioControlado.mbas,77 :: 		ELSE
L__main34:
;Robot_RadioControlado.mbas,78 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,79 :: 		END IF
L__main35:
	GOTO       L__main23
L__main32:
;Robot_RadioControlado.mbas,80 :: 		CASE 2
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      2
	XORWF      _INDICE+0, 0
L__main68:
	BTFSS      STATUS+0, 2
	GOTO       L__main38
;Robot_RadioControlado.mbas,81 :: 		direc1=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _direc1+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _direc1+1
;Robot_RadioControlado.mbas,82 :: 		INDICE=3
	MOVLW      3
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main23
L__main38:
;Robot_RadioControlado.mbas,83 :: 		CASE 3
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      3
	XORWF      _INDICE+0, 0
L__main69:
	BTFSS      STATUS+0, 2
	GOTO       L__main41
;Robot_RadioControlado.mbas,84 :: 		VEL1=RECIBIDO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _VEL1+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _VEL1+1
;Robot_RadioControlado.mbas,85 :: 		INDICE=4
	MOVLW      4
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main23
L__main41:
;Robot_RadioControlado.mbas,86 :: 		CASE 4
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      4
	XORWF      _INDICE+0, 0
L__main70:
	BTFSS      STATUS+0, 2
	GOTO       L__main44
;Robot_RadioControlado.mbas,87 :: 		Direc2=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _direc2+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _direc2+1
;Robot_RadioControlado.mbas,88 :: 		INDICE=5
	MOVLW      5
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
	GOTO       L__main23
L__main44:
;Robot_RadioControlado.mbas,89 :: 		CASE 5
	MOVLW      0
	XORWF      _INDICE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      5
	XORWF      _INDICE+0, 0
L__main71:
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;Robot_RadioControlado.mbas,90 :: 		VEL2=RECIBIDO      'DATO
	MOVF       _RECIBIDO+0, 0
	MOVWF      _VEL2+0
	MOVF       _RECIBIDO+1, 0
	MOVWF      _VEL2+1
;Robot_RadioControlado.mbas,91 :: 		INDICE=6
	MOVLW      6
	MOVWF      _INDICE+0
	CLRF       _INDICE+1
;Robot_RadioControlado.mbas,92 :: 		DATO_COMPLETO=1
	MOVLW      1
	MOVWF      _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
	GOTO       L__main23
L__main47:
L__main23:
;Robot_RadioControlado.mbas,93 :: 		END SELECT
L__main21:
;Robot_RadioControlado.mbas,95 :: 		IF(DATO_COMPLETO=1)THEN
	MOVLW      0
	XORWF      _DATO_COMPLETO+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      1
	XORWF      _DATO_COMPLETO+0, 0
L__main72:
	BTFSS      STATUS+0, 2
	GOTO       L__main49
;Robot_RadioControlado.mbas,96 :: 		if((direc1=1) and (direc2=1))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      1
	XORWF      _direc1+0, 0
L__main73:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      1
	XORWF      _direc2+0, 0
L__main74:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main52
;Robot_RadioControlado.mbas,97 :: 		set_motors(vel1,vel2)
	MOVF       _VEL1+0, 0
	MOVWF      FARG_set_motors_motor1+0
	MOVF       _VEL1+1, 0
	MOVWF      FARG_set_motors_motor1+1
	MOVF       _VEL2+0, 0
	MOVWF      FARG_set_motors_motor2+0
	MOVF       _VEL2+1, 0
	MOVWF      FARG_set_motors_motor2+1
	CALL       Robot_RadioControlado_set_motors+0
	GOTO       L__main53
;Robot_RadioControlado.mbas,98 :: 		else
L__main52:
;Robot_RadioControlado.mbas,99 :: 		if((direc1=1) and (direc2=0))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      1
	XORWF      _direc1+0, 0
L__main75:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      0
	XORWF      _direc2+0, 0
L__main76:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main55
;Robot_RadioControlado.mbas,100 :: 		set_motors(vel1,-vel2)
	MOVF       _VEL1+0, 0
	MOVWF      FARG_set_motors_motor1+0
	MOVF       _VEL1+1, 0
	MOVWF      FARG_set_motors_motor1+1
	MOVF       _VEL2+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor2+0
	MOVF       _VEL2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor2+1
	SUBWF      FARG_set_motors_motor2+1, 1
	CALL       Robot_RadioControlado_set_motors+0
	GOTO       L__main56
;Robot_RadioControlado.mbas,101 :: 		else
L__main55:
;Robot_RadioControlado.mbas,102 :: 		if((direc1=0) and (direc2=1))then
	MOVLW      0
	XORWF      _direc1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      0
	XORWF      _direc1+0, 0
L__main77:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVLW      0
	XORWF      _direc2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVLW      1
	XORWF      _direc2+0, 0
L__main78:
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main58
;Robot_RadioControlado.mbas,103 :: 		set_motors(-vel1,vel2)
	MOVF       _VEL1+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor1+0
	MOVF       _VEL1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor1+1
	SUBWF      FARG_set_motors_motor1+1, 1
	MOVF       _VEL2+0, 0
	MOVWF      FARG_set_motors_motor2+0
	MOVF       _VEL2+1, 0
	MOVWF      FARG_set_motors_motor2+1
	CALL       Robot_RadioControlado_set_motors+0
	GOTO       L__main59
;Robot_RadioControlado.mbas,104 :: 		else
L__main58:
;Robot_RadioControlado.mbas,105 :: 		set_motors(-vel1,-vel2)
	MOVF       _VEL1+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor1+0
	MOVF       _VEL1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor1+1
	SUBWF      FARG_set_motors_motor1+1, 1
	MOVF       _VEL2+0, 0
	SUBLW      0
	MOVWF      FARG_set_motors_motor2+0
	MOVF       _VEL2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_set_motors_motor2+1
	SUBWF      FARG_set_motors_motor2+1, 1
	CALL       Robot_RadioControlado_set_motors+0
;Robot_RadioControlado.mbas,106 :: 		end if
L__main59:
;Robot_RadioControlado.mbas,107 :: 		end if
L__main56:
;Robot_RadioControlado.mbas,108 :: 		end if
L__main53:
;Robot_RadioControlado.mbas,110 :: 		DATO_COMPLETO=0
	CLRF       _DATO_COMPLETO+0
	CLRF       _DATO_COMPLETO+1
;Robot_RadioControlado.mbas,111 :: 		INDICE=0
	CLRF       _INDICE+0
	CLRF       _INDICE+1
L__main49:
;Robot_RadioControlado.mbas,113 :: 		WEND
	GOTO       L__main15
	GOTO       $+0
; end of _main
