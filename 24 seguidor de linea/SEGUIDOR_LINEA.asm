
SEGUIDOR_LINEA_SET_MOTOR:

;SEGUIDOR_LINEA.mbas,50 :: 		SUB PROCEDURE SET_MOTOR(DIM MOTOR2,MOTOR1 AS INTEGER)
;SEGUIDOR_LINEA.mbas,52 :: 		IF(MOTOR1<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR75
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR1+0, 0
L_SEGUIDOR_LINEA_SET_MOTOR75:
	BTFSC      STATUS+0, 0
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR2
;SEGUIDOR_LINEA.mbas,53 :: 		MOTOR1=-MOTOR1
	MOVF       FARG_SET_MOTOR_MOTOR1+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       FARG_SET_MOTOR_MOTOR1+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
;SEGUIDOR_LINEA.mbas,54 :: 		UART1_Write(0XAA)
	MOVLW      170
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,55 :: 		UART1_Write(0XCC)
	MOVLW      204
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,56 :: 		UART1_Write(0X01)  'MOTOR 1
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,57 :: 		UART1_Write(0XFF)  'ADELANTE
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,58 :: 		UART1_Write(0XDD)
	MOVLW      221
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR3
;SEGUIDOR_LINEA.mbas,61 :: 		ELSE
L_SEGUIDOR_LINEA_SET_MOTOR2:
;SEGUIDOR_LINEA.mbas,64 :: 		UART1_Write(0XAA)
	MOVLW      170
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,65 :: 		UART1_Write(0XCC)
	MOVLW      204
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,66 :: 		UART1_Write(0X01)  'MOTOR 1
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,67 :: 		UART1_Write(0X30)  'ATRAS
	MOVLW      48
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,68 :: 		UART1_Write(0XDD)
	MOVLW      221
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,69 :: 		END IF
L_SEGUIDOR_LINEA_SET_MOTOR3:
;SEGUIDOR_LINEA.mbas,71 :: 		IF(MOTOR2<0)THEN
	MOVLW      128
	XORWF      FARG_SET_MOTOR_MOTOR2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR76
	MOVLW      0
	SUBWF      FARG_SET_MOTOR_MOTOR2+0, 0
L_SEGUIDOR_LINEA_SET_MOTOR76:
	BTFSC      STATUS+0, 0
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR5
;SEGUIDOR_LINEA.mbas,72 :: 		MOTOR2=-MOTOR2
	MOVF       FARG_SET_MOTOR_MOTOR2+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       FARG_SET_MOTOR_MOTOR2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
;SEGUIDOR_LINEA.mbas,75 :: 		UART1_Write(0XAA)
	MOVLW      170
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,76 :: 		UART1_Write(0XCC)
	MOVLW      204
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,77 :: 		UART1_Write(0X02)  'MOTOR 2
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,78 :: 		UART1_Write(0XFF)  'ADELANTE
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,79 :: 		UART1_Write(0XDD)
	MOVLW      221
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	GOTO       L_SEGUIDOR_LINEA_SET_MOTOR6
;SEGUIDOR_LINEA.mbas,80 :: 		ELSE
L_SEGUIDOR_LINEA_SET_MOTOR5:
;SEGUIDOR_LINEA.mbas,81 :: 		UART1_Write(0XAA)
	MOVLW      170
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,82 :: 		UART1_Write(0XCC)
	MOVLW      204
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,83 :: 		UART1_Write(0X02)  'MOTOR 2
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,84 :: 		UART1_Write(0X30)  'ATRAS
	MOVLW      48
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,85 :: 		UART1_Write(0XDD)
	MOVLW      221
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SEGUIDOR_LINEA.mbas,88 :: 		END IF
L_SEGUIDOR_LINEA_SET_MOTOR6:
	RETURN
; end of SEGUIDOR_LINEA_SET_MOTOR

SEGUIDOR_LINEA_TIEMPO:

;SEGUIDOR_LINEA.mbas,93 :: 		SUB PROCEDURE TIEMPO ()
;SEGUIDOR_LINEA.mbas,94 :: 		delay_ms(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_SEGUIDOR_LINEA_TIEMPO8:
	DECFSZ     R13+0, 1
	GOTO       L_SEGUIDOR_LINEA_TIEMPO8
	DECFSZ     R12+0, 1
	GOTO       L_SEGUIDOR_LINEA_TIEMPO8
	NOP
	NOP
	RETURN
; end of SEGUIDOR_LINEA_TIEMPO

_main:

;SEGUIDOR_LINEA.mbas,97 :: 		main:
;SEGUIDOR_LINEA.mbas,99 :: 		TRISA=%00000001  ' tris configura entreda o salida
	MOVLW      1
	MOVWF      TRISA+0
;SEGUIDOR_LINEA.mbas,100 :: 		TRISB=%00000000  '
	CLRF       TRISB+0
;SEGUIDOR_LINEA.mbas,101 :: 		TRISC=%01111000  'RC3,RC4,RC5,RC6 ENTRADAS   (C1 Y C2 PWM)
	MOVLW      120
	MOVWF      TRISC+0
;SEGUIDOR_LINEA.mbas,102 :: 		ANSEL=1 '00000001 'analogicos o digitales AN0=RA0, AN1=RA1, AN2=RA2, AN3=RA3, AN4=RA5,
	MOVLW      1
	MOVWF      ANSEL+0
;SEGUIDOR_LINEA.mbas,103 :: 		ANSELH=0 'AN8=RB2, AN9=RB3, AN10=RB1, AN11=RB4, AN12=RB0, AN13=RB5
	CLRF       ANSELH+0
;SEGUIDOR_LINEA.mbas,104 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SEGUIDOR_LINEA.mbas,105 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SEGUIDOR_LINEA.mbas,106 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SEGUIDOR_LINEA.mbas,108 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;SEGUIDOR_LINEA.mbas,109 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SEGUIDOR_LINEA.mbas,110 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SEGUIDOR_LINEA.mbas,112 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SEGUIDOR_LINEA.mbas,114 :: 		portb=%00001111
	MOVLW      15
	MOVWF      PORTB+0
;SEGUIDOR_LINEA.mbas,115 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
	NOP
;SEGUIDOR_LINEA.mbas,116 :: 		portb=%11110000
	MOVLW      240
	MOVWF      PORTB+0
;SEGUIDOR_LINEA.mbas,117 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main11:
	DECFSZ     R13+0, 1
	GOTO       L__main11
	DECFSZ     R12+0, 1
	GOTO       L__main11
	DECFSZ     R11+0, 1
	GOTO       L__main11
	NOP
;SEGUIDOR_LINEA.mbas,118 :: 		portb=%00001111
	MOVLW      15
	MOVWF      PORTB+0
;SEGUIDOR_LINEA.mbas,119 :: 		delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
	NOP
;SEGUIDOR_LINEA.mbas,120 :: 		portb=%00000000
	CLRF       PORTB+0
;SEGUIDOR_LINEA.mbas,127 :: 		BAND = 0
	CLRF       _BAND+0
	CLRF       _BAND+1
;SEGUIDOR_LINEA.mbas,129 :: 		WHILE(1)
L__main14:
;SEGUIDOR_LINEA.mbas,131 :: 		sensores=(s4*8)+(S3*4)+(S2*2)+(S1*1)
	CLRF       R0+0
	BTFSC      PORTC+0, 6
	INCF       R0+0, 1
	MOVF       R0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVLW      3
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      R5+0
	MOVF       R1+1, 0
	MOVWF      R5+1
	MOVF       R0+0, 0
L__main77:
	BTFSC      STATUS+0, 2
	GOTO       L__main78
	RLF        R5+0, 1
	RLF        R5+1, 1
	BCF        R5+0, 0
	ADDLW      255
	GOTO       L__main77
L__main78:
	CLRF       R0+0
	BTFSC      PORTC+0, 5
	INCF       R0+0, 1
	MOVF       R0+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R5+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R5+1, 1
	CLRF       R0+0
	BTFSC      PORTC+0, 4
	INCF       R0+0, 1
	MOVF       R0+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R5+0, 0
	MOVWF      R2+0
	MOVF       R5+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      R2+1
	CLRF       R0+0
	BTFSC      PORTC+0, 3
	INCF       R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDWF      R2+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 1
	MOVF       R2+0, 0
	MOVWF      _sensores+0
	MOVF       R2+1, 0
	MOVWF      _sensores+1
;SEGUIDOR_LINEA.mbas,132 :: 		PORTB=SENSORES
	MOVF       R2+0, 0
	MOVWF      PORTB+0
;SEGUIDOR_LINEA.mbas,135 :: 		case 0' S4 S3 S2 S1 = 0 0 0 0
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      0
	XORWF      R2+0, 0
L__main79:
	BTFSS      STATUS+0, 2
	GOTO       L__main21
;SEGUIDOR_LINEA.mbas,136 :: 		BAND=BAND+1
	INCF       _BAND+0, 1
	BTFSC      STATUS+0, 2
	INCF       _BAND+1, 1
;SEGUIDOR_LINEA.mbas,137 :: 		IF BAND<4 THEN
	MOVLW      128
	XORWF      _BAND+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      4
	SUBWF      _BAND+0, 0
L__main80:
	BTFSC      STATUS+0, 0
	GOTO       L__main23
;SEGUIDOR_LINEA.mbas,138 :: 		SET_MOTOR(vel,vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,139 :: 		DELAY_MS(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main25:
	DECFSZ     R13+0, 1
	GOTO       L__main25
	DECFSZ     R12+0, 1
	GOTO       L__main25
	NOP
	NOP
	GOTO       L__main24
;SEGUIDOR_LINEA.mbas,140 :: 		ELSE
L__main23:
;SEGUIDOR_LINEA.mbas,141 :: 		IF (BAND>4) AND (BAND <24) THEN
	MOVLW      128
	MOVWF      R1+0
	MOVLW      128
	XORWF      _BAND+1, 0
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVF       _BAND+0, 0
	SUBLW      4
L__main81:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _BAND+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      24
	SUBWF      _BAND+0, 0
L__main82:
	MOVLW      255
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main27
;SEGUIDOR_LINEA.mbas,142 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,143 :: 		DELAY_MS(10)
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L__main29:
	DECFSZ     R13+0, 1
	GOTO       L__main29
	DECFSZ     R12+0, 1
	GOTO       L__main29
	NOP
	NOP
	GOTO       L__main28
;SEGUIDOR_LINEA.mbas,144 :: 		ELSE
L__main27:
;SEGUIDOR_LINEA.mbas,145 :: 		SET_MOTOR(vel/2,-(vel/2))
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,146 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,147 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,148 :: 		END IF
L__main28:
;SEGUIDOR_LINEA.mbas,149 :: 		END IF
L__main24:
	GOTO       L__main18
L__main21:
;SEGUIDOR_LINEA.mbas,151 :: 		case 1' S4 S3 S2 S1 = 0 0 0 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      1
	XORWF      _sensores+0, 0
L__main83:
	BTFSS      STATUS+0, 2
	GOTO       L__main32
;SEGUIDOR_LINEA.mbas,152 :: 		SET_MOTOR(vel/2,-(vel/2))
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,153 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,154 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main32:
;SEGUIDOR_LINEA.mbas,155 :: 		case 2' S4 S3 S2 S1 = 0 0 1 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      2
	XORWF      _sensores+0, 0
L__main84:
	BTFSS      STATUS+0, 2
	GOTO       L__main35
;SEGUIDOR_LINEA.mbas,156 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,157 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,158 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main35:
;SEGUIDOR_LINEA.mbas,159 :: 		case 3' S4 S3 S2 S1 = 0 0 1 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      3
	XORWF      _sensores+0, 0
L__main85:
	BTFSS      STATUS+0, 2
	GOTO       L__main38
;SEGUIDOR_LINEA.mbas,160 :: 		SET_MOTOR(VEL,VEL)
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,161 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,162 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,163 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main38:
;SEGUIDOR_LINEA.mbas,164 :: 		case 4' S4 S3 S2 S1 = 0 1 0 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVLW      4
	XORWF      _sensores+0, 0
L__main86:
	BTFSS      STATUS+0, 2
	GOTO       L__main41
;SEGUIDOR_LINEA.mbas,165 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,166 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,167 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main41:
;SEGUIDOR_LINEA.mbas,168 :: 		case 5' S4 S3 S2 S1 = 0 1 0 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      5
	XORWF      _sensores+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L__main44
;SEGUIDOR_LINEA.mbas,169 :: 		SET_MOTOR(vel/2,-(vel/2))
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,170 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,171 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main44:
;SEGUIDOR_LINEA.mbas,172 :: 		case 6' S4 S3 S2 S1 = 0 1 1 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      6
	XORWF      _sensores+0, 0
L__main88:
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;SEGUIDOR_LINEA.mbas,173 :: 		SET_MOTOR(-(VEL/2),VEL/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,174 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,175 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main47:
;SEGUIDOR_LINEA.mbas,176 :: 		case 7' S4 S3 S2 S1 = 0 1 1 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      7
	XORWF      _sensores+0, 0
L__main89:
	BTFSS      STATUS+0, 2
	GOTO       L__main50
;SEGUIDOR_LINEA.mbas,177 :: 		SET_MOTOR(-(VEL/2),VEL/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,178 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,179 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main50:
;SEGUIDOR_LINEA.mbas,180 :: 		case 8' S4 S3 S2 S1 = 1 0 0 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVLW      8
	XORWF      _sensores+0, 0
L__main90:
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;SEGUIDOR_LINEA.mbas,181 :: 		SET_MOTOR(vel,vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,182 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,183 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,184 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main53:
;SEGUIDOR_LINEA.mbas,185 :: 		case 9' S4 S3 S2 S1 = 1 0 0 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      9
	XORWF      _sensores+0, 0
L__main91:
	BTFSS      STATUS+0, 2
	GOTO       L__main56
;SEGUIDOR_LINEA.mbas,186 :: 		SET_MOTOR(vel/2,-(vel/2))
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,187 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,188 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main56:
;SEGUIDOR_LINEA.mbas,189 :: 		case 10'S4 S3 S2 S1 = 1 0 1 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      10
	XORWF      _sensores+0, 0
L__main92:
	BTFSS      STATUS+0, 2
	GOTO       L__main59
;SEGUIDOR_LINEA.mbas,190 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,191 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,192 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main59:
;SEGUIDOR_LINEA.mbas,193 :: 		case 11'S4 S3 S2 S1 = 1 0 1 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVLW      11
	XORWF      _sensores+0, 0
L__main93:
	BTFSS      STATUS+0, 2
	GOTO       L__main62
;SEGUIDOR_LINEA.mbas,194 :: 		SET_MOTOR(vel,vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       _vel+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       _vel+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,195 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,196 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main62:
;SEGUIDOR_LINEA.mbas,197 :: 		case 12'S4 S3 S2 S1 = 1 1 0 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      12
	XORWF      _sensores+0, 0
L__main94:
	BTFSS      STATUS+0, 2
	GOTO       L__main65
;SEGUIDOR_LINEA.mbas,198 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,199 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,200 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main65:
;SEGUIDOR_LINEA.mbas,201 :: 		case 13'S4 S3 S2 S1 = 1 1 0 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVLW      13
	XORWF      _sensores+0, 0
L__main95:
	BTFSS      STATUS+0, 2
	GOTO       L__main68
;SEGUIDOR_LINEA.mbas,202 :: 		SET_MOTOR(vel/2,-(vel/2))
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR2+1
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR1+1
	SUBWF      FARG_SET_MOTOR_MOTOR1+1, 1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,203 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,204 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main68:
;SEGUIDOR_LINEA.mbas,205 :: 		case 14'S4 S3 S2 S1 = 1 1 1 0
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVLW      14
	XORWF      _sensores+0, 0
L__main96:
	BTFSS      STATUS+0, 2
	GOTO       L__main71
;SEGUIDOR_LINEA.mbas,206 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,207 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,208 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main71:
;SEGUIDOR_LINEA.mbas,209 :: 		case 15'S4 S3 S2 S1 = 1 1 1 1
	MOVLW      0
	XORWF      _sensores+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main97
	MOVLW      15
	XORWF      _sensores+0, 0
L__main97:
	BTFSS      STATUS+0, 2
	GOTO       L__main74
;SEGUIDOR_LINEA.mbas,210 :: 		SET_MOTOR(-(vel/2),vel/2)
	MOVF       _vel+0, 0
	MOVWF      R0+0
	MOVF       _vel+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	SUBLW      0
	MOVWF      FARG_SET_MOTOR_MOTOR2+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_SET_MOTOR_MOTOR2+1
	SUBWF      FARG_SET_MOTOR_MOTOR2+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+0
	MOVF       R0+1, 0
	MOVWF      FARG_SET_MOTOR_MOTOR1+1
	CALL       SEGUIDOR_LINEA_SET_MOTOR+0
;SEGUIDOR_LINEA.mbas,211 :: 		TIEMPO
	CALL       SEGUIDOR_LINEA_TIEMPO+0
;SEGUIDOR_LINEA.mbas,212 :: 		BAND=0
	CLRF       _BAND+0
	CLRF       _BAND+1
	GOTO       L__main18
L__main74:
L__main18:
;SEGUIDOR_LINEA.mbas,215 :: 		WEND
	GOTO       L__main14
	GOTO       $+0
; end of _main
