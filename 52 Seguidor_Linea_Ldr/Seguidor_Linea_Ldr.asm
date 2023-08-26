
Seguidor_Linea_Ldr_tiempo:

;Seguidor_Linea_Ldr.mbas,53 :: 		SUB PROCEDURE tiempo ()
;Seguidor_Linea_Ldr.mbas,54 :: 		delay_ms(10)
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Seguidor_Linea_Ldr_tiempo1:
	DECFSZ     R13+0, 1
	GOTO       L_Seguidor_Linea_Ldr_tiempo1
	DECFSZ     R12+0, 1
	GOTO       L_Seguidor_Linea_Ldr_tiempo1
	NOP
	RETURN
; end of Seguidor_Linea_Ldr_tiempo

Seguidor_Linea_Ldr_adelante:

;Seguidor_Linea_Ldr.mbas,56 :: 		sub procedure adelante()
;Seguidor_Linea_Ldr.mbas,57 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Seguidor_Linea_Ldr.mbas,58 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Seguidor_Linea_Ldr.mbas,60 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;Seguidor_Linea_Ldr.mbas,61 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;Seguidor_Linea_Ldr.mbas,63 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,64 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,65 :: 		PORTB=1
	MOVLW      1
	MOVWF      PORTB+0
	RETURN
; end of Seguidor_Linea_Ldr_adelante

Seguidor_Linea_Ldr_parar:

;Seguidor_Linea_Ldr.mbas,67 :: 		sub procedure parar()
;Seguidor_Linea_Ldr.mbas,68 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Seguidor_Linea_Ldr.mbas,69 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Seguidor_Linea_Ldr.mbas,71 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Seguidor_Linea_Ldr.mbas,72 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
	RETURN
; end of Seguidor_Linea_Ldr_parar

Seguidor_Linea_Ldr_izquierda:

;Seguidor_Linea_Ldr.mbas,74 :: 		sub procedure izquierda()
;Seguidor_Linea_Ldr.mbas,75 :: 		DIR1  = 1
	BSF        PORTA+0, 2
;Seguidor_Linea_Ldr.mbas,76 :: 		NDIR1 = 0
	BCF        PORTA+0, 4
;Seguidor_Linea_Ldr.mbas,78 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Seguidor_Linea_Ldr.mbas,79 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;Seguidor_Linea_Ldr.mbas,81 :: 		PORTB=4
	MOVLW      4
	MOVWF      PORTB+0
	RETURN
; end of Seguidor_Linea_Ldr_izquierda

Seguidor_Linea_Ldr_derecha:

;Seguidor_Linea_Ldr.mbas,83 :: 		sub procedure derecha()
;Seguidor_Linea_Ldr.mbas,84 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Seguidor_Linea_Ldr.mbas,85 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;Seguidor_Linea_Ldr.mbas,87 :: 		DIR2  = 1
	BSF        PORTA+0, 3
;Seguidor_Linea_Ldr.mbas,88 :: 		NDIR2 = 0
	BCF        PORTA+0, 5
;Seguidor_Linea_Ldr.mbas,90 :: 		PORTB=8
	MOVLW      8
	MOVWF      PORTB+0
	RETURN
; end of Seguidor_Linea_Ldr_derecha

Seguidor_Linea_Ldr_atras:

;Seguidor_Linea_Ldr.mbas,92 :: 		sub procedure atras()
;Seguidor_Linea_Ldr.mbas,93 :: 		DIR1  = 0
	BCF        PORTA+0, 2
;Seguidor_Linea_Ldr.mbas,94 :: 		NDIR1 = 1
	BSF        PORTA+0, 4
;Seguidor_Linea_Ldr.mbas,96 :: 		DIR2  = 0
	BCF        PORTA+0, 3
;Seguidor_Linea_Ldr.mbas,97 :: 		NDIR2 = 1
	BSF        PORTA+0, 5
;Seguidor_Linea_Ldr.mbas,99 :: 		PWM1_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,100 :: 		PWM2_Set_Duty(vel)
	MOVF       _vel+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,101 :: 		PORTB=2
	MOVLW      2
	MOVWF      PORTB+0
	RETURN
; end of Seguidor_Linea_Ldr_atras

_main:

;Seguidor_Linea_Ldr.mbas,103 :: 		main:
;Seguidor_Linea_Ldr.mbas,105 :: 		OPTION_REG=%10000000
	MOVLW      128
	MOVWF      OPTION_REG+0
;Seguidor_Linea_Ldr.mbas,106 :: 		TRISA=%00000011
	MOVLW      3
	MOVWF      TRISA+0
;Seguidor_Linea_Ldr.mbas,107 :: 		TRISB=%00000000  '
	CLRF       TRISB+0
;Seguidor_Linea_Ldr.mbas,108 :: 		TRISC=%01111000
	MOVLW      120
	MOVWF      TRISC+0
;Seguidor_Linea_Ldr.mbas,109 :: 		TRISE=8
	MOVLW      8
	MOVWF      TRISE+0
;Seguidor_Linea_Ldr.mbas,110 :: 		ANSEL=%00000011
	MOVLW      3
	MOVWF      ANSEL+0
;Seguidor_Linea_Ldr.mbas,111 :: 		ANSELH=0
	CLRF       ANSELH+0
;Seguidor_Linea_Ldr.mbas,112 :: 		PWM1_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Seguidor_Linea_Ldr.mbas,113 :: 		PWM2_Init(1000)'FRECUENCIA (HZ)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Seguidor_Linea_Ldr.mbas,114 :: 		PWM1_Set_Duty(0)' VEL0CIDAD 255-> 100%  MAXIMA
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,116 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,117 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;Seguidor_Linea_Ldr.mbas,118 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;Seguidor_Linea_Ldr.mbas,120 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,121 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main8:
	DECFSZ     R13+0, 1
	GOTO       L__main8
	DECFSZ     R12+0, 1
	GOTO       L__main8
	DECFSZ     R11+0, 1
	GOTO       L__main8
;Seguidor_Linea_Ldr.mbas,122 :: 		portb=0
	CLRF       PORTB+0
;Seguidor_Linea_Ldr.mbas,123 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main9:
	DECFSZ     R13+0, 1
	GOTO       L__main9
	DECFSZ     R12+0, 1
	GOTO       L__main9
	DECFSZ     R11+0, 1
	GOTO       L__main9
;Seguidor_Linea_Ldr.mbas,124 :: 		portb=255
	MOVLW      255
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,125 :: 		delay_ms(200)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L__main10:
	DECFSZ     R13+0, 1
	GOTO       L__main10
	DECFSZ     R12+0, 1
	GOTO       L__main10
	DECFSZ     R11+0, 1
	GOTO       L__main10
;Seguidor_Linea_Ldr.mbas,126 :: 		portb=0
	CLRF       PORTB+0
;Seguidor_Linea_Ldr.mbas,128 :: 		WHILE(1)
L__main12:
;Seguidor_Linea_Ldr.mbas,129 :: 		sensor=Adc_Read(1)>>2
	MOVLW      1
	MOVWF      FARG_Adc_Read_channel+0
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
	MOVWF      _sensor+0
;Seguidor_Linea_Ldr.mbas,130 :: 		if sensor<220 then
	MOVLW      220
	SUBWF      R2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main17
;Seguidor_Linea_Ldr.mbas,131 :: 		vel=Adc_Read(0)>>2
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
	MOVWF      _vel+0
;Seguidor_Linea_Ldr.mbas,132 :: 		sensores=(s4*8)+(S3*4)+(S2*2)+(S1*1)
	CLRF       R1+0
	BTFSC      PORTC+0, 6
	INCF       R1+0, 1
	MOVF       R1+0, 0
	MOVWF      R3+0
	RLF        R3+0, 1
	BCF        R3+0, 0
	RLF        R3+0, 1
	BCF        R3+0, 0
	RLF        R3+0, 1
	BCF        R3+0, 0
	CLRF       R2+0
	BTFSC      PORTC+0, 5
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R3+0, 1
	CLRF       R2+0
	BTFSC      PORTC+0, 4
	INCF       R2+0, 1
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      R3+0, 0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      PORTC+0, 3
	INCF       R0+0, 1
	MOVF       R0+0, 0
	ADDWF      R1+0, 1
	MOVF       R1+0, 0
	MOVWF      _sensores+0
;Seguidor_Linea_Ldr.mbas,135 :: 		case 0' S4 S3 S2 S1 = 0 0 0 0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
;Seguidor_Linea_Ldr.mbas,136 :: 		izquierda()
	CALL       Seguidor_Linea_Ldr_izquierda+0
;Seguidor_Linea_Ldr.mbas,137 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,138 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,139 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,140 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
	GOTO       L__main19
L__main22:
;Seguidor_Linea_Ldr.mbas,141 :: 		case 1' S4 S3 S2 S1 = 0 0 0 1
	MOVF       _sensores+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main25
;Seguidor_Linea_Ldr.mbas,142 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,143 :: 		izquierda()
	CALL       Seguidor_Linea_Ldr_izquierda+0
;Seguidor_Linea_Ldr.mbas,144 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,145 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,146 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main25:
;Seguidor_Linea_Ldr.mbas,147 :: 		case 2' S4 S3 S2 S1 = 0 0 1 0
	MOVF       _sensores+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main28
;Seguidor_Linea_Ldr.mbas,148 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,149 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,150 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,151 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,152 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main28:
;Seguidor_Linea_Ldr.mbas,153 :: 		case 3' S4 S3 S2 S1 = 0 0 1 1
	MOVF       _sensores+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main31
;Seguidor_Linea_Ldr.mbas,154 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,155 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,156 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main31:
;Seguidor_Linea_Ldr.mbas,157 :: 		case 4' S4 S3 S2 S1 = 0 1 0 0
	MOVF       _sensores+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main34
;Seguidor_Linea_Ldr.mbas,158 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,159 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,160 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,161 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,162 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main34:
;Seguidor_Linea_Ldr.mbas,163 :: 		case 5' S4 S3 S2 S1 = 0 1 0 1
	MOVF       _sensores+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;Seguidor_Linea_Ldr.mbas,164 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,165 :: 		izquierda()
	CALL       Seguidor_Linea_Ldr_izquierda+0
;Seguidor_Linea_Ldr.mbas,166 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,167 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,168 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main37:
;Seguidor_Linea_Ldr.mbas,169 :: 		case 6' S4 S3 S2 S1 = 0 1 1 0
	MOVF       _sensores+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main40
;Seguidor_Linea_Ldr.mbas,170 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,171 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,172 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,173 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,174 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main40:
;Seguidor_Linea_Ldr.mbas,175 :: 		case 7' S4 S3 S2 S1 = 0 1 1 1
	MOVF       _sensores+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main43
;Seguidor_Linea_Ldr.mbas,176 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,177 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,178 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,179 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,180 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main43:
;Seguidor_Linea_Ldr.mbas,181 :: 		case 8' S4 S3 S2 S1 = 1 0 0 0
	MOVF       _sensores+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main46
;Seguidor_Linea_Ldr.mbas,182 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,183 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,184 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main46:
;Seguidor_Linea_Ldr.mbas,185 :: 		case 9' S4 S3 S2 S1 = 1 0 0 1
	MOVF       _sensores+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L__main49
;Seguidor_Linea_Ldr.mbas,186 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,187 :: 		izquierda()
	CALL       Seguidor_Linea_Ldr_izquierda+0
;Seguidor_Linea_Ldr.mbas,188 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,189 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,190 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main49:
;Seguidor_Linea_Ldr.mbas,191 :: 		case 10'S4 S3 S2 S1 = 1 0 1 0
	MOVF       _sensores+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L__main52
;Seguidor_Linea_Ldr.mbas,192 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,193 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,194 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,195 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,196 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main52:
;Seguidor_Linea_Ldr.mbas,197 :: 		case 11'S4 S3 S2 S1 = 1 0 1 1
	MOVF       _sensores+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L__main55
;Seguidor_Linea_Ldr.mbas,198 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,199 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,200 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main55:
;Seguidor_Linea_Ldr.mbas,201 :: 		case 12'S4 S3 S2 S1 = 1 1 0 0
	MOVF       _sensores+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L__main58
;Seguidor_Linea_Ldr.mbas,202 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,203 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,204 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,205 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,206 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main58:
;Seguidor_Linea_Ldr.mbas,207 :: 		case 13'S4 S3 S2 S1 = 1 1 0 1
	MOVF       _sensores+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L__main61
;Seguidor_Linea_Ldr.mbas,208 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,209 :: 		izquierda()
	CALL       Seguidor_Linea_Ldr_izquierda+0
;Seguidor_Linea_Ldr.mbas,210 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,211 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,212 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main61:
;Seguidor_Linea_Ldr.mbas,213 :: 		case 14'S4 S3 S2 S1 = 1 1 1 0
	MOVF       _sensores+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L__main64
;Seguidor_Linea_Ldr.mbas,214 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,215 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,216 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,217 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,218 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main64:
;Seguidor_Linea_Ldr.mbas,219 :: 		case 15'S4 S3 S2 S1 = 1 1 1 1
	MOVF       _sensores+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L__main67
;Seguidor_Linea_Ldr.mbas,220 :: 		PORTB=sensores
	MOVF       _sensores+0, 0
	MOVWF      PORTB+0
;Seguidor_Linea_Ldr.mbas,221 :: 		derecha()
	CALL       Seguidor_Linea_Ldr_derecha+0
;Seguidor_Linea_Ldr.mbas,222 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
;Seguidor_Linea_Ldr.mbas,223 :: 		adelante()
	CALL       Seguidor_Linea_Ldr_adelante+0
;Seguidor_Linea_Ldr.mbas,224 :: 		tiempo
	CALL       Seguidor_Linea_Ldr_tiempo+0
	GOTO       L__main19
L__main67:
L__main19:
;Seguidor_Linea_Ldr.mbas,225 :: 		end select
	GOTO       L__main18
;Seguidor_Linea_Ldr.mbas,226 :: 		else
L__main17:
;Seguidor_Linea_Ldr.mbas,227 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,228 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Seguidor_Linea_Ldr.mbas,230 :: 		end if
L__main18:
;Seguidor_Linea_Ldr.mbas,232 :: 		WEND
	GOTO       L__main12
	GOTO       $+0
; end of _main
