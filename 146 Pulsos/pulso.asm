
pulso_sonido:

;pulso.mbas,4 :: 		sub procedure sonido
;pulso.mbas,5 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;pulso.mbas,6 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_pulso_sonido1:
	DECFSZ     R13+0, 1
	GOTO       L_pulso_sonido1
	DECFSZ     R12+0, 1
	GOTO       L_pulso_sonido1
	NOP
	NOP
;pulso.mbas,7 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
	RETURN
; end of pulso_sonido

pulso_INICIO:

;pulso.mbas,9 :: 		sub procedure INICIO
;pulso.mbas,10 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,11 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,12 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,13 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,14 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,15 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,16 :: 		UART1_Write(0X00)'LOW
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,17 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,18 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,19 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_INICIO

pulso_FIN:

;pulso.mbas,21 :: 		sub procedure FIN
;pulso.mbas,22 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,23 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,24 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,25 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,26 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,27 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,28 :: 		UART1_Write(0X00)'LOW
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,29 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,30 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,31 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_FIN

pulso_SESENTA:

;pulso.mbas,33 :: 		sub procedure SESENTA '0070
;pulso.mbas,34 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,35 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,36 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,37 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,38 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,39 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,40 :: 		UART1_Write(0X3C)'LOW
	MOVLW      60
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,41 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,42 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,43 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_SESENTA

pulso_SETENTA:

;pulso.mbas,45 :: 		sub procedure SETENTA
;pulso.mbas,46 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,47 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,48 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,49 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,50 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,51 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,52 :: 		UART1_Write(0X46)'LOW
	MOVLW      70
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,53 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,54 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,55 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_SETENTA

pulso_OCHENTA:

;pulso.mbas,57 :: 		sub procedure OCHENTA
;pulso.mbas,58 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,59 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,60 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,61 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,62 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,63 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,64 :: 		UART1_Write(0X50)'LOW
	MOVLW      80
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,65 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,66 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,67 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_OCHENTA

pulso_NOVENTA:

;pulso.mbas,69 :: 		sub procedure NOVENTA
;pulso.mbas,70 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,71 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,72 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,73 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,74 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,75 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,76 :: 		UART1_Write(0X5A)'LOW
	MOVLW      90
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,77 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,78 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,79 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_NOVENTA

pulso_UNO:

;pulso.mbas,81 :: 		sub procedure UNO
;pulso.mbas,82 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,83 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,84 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,85 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,86 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,87 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,88 :: 		UART1_Write(0X01)'LOW
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,89 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,90 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,91 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_UNO

pulso_DOS:

;pulso.mbas,93 :: 		sub procedure DOS
;pulso.mbas,94 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,95 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,96 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,97 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,98 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,99 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,100 :: 		UART1_Write(0X02)'LOW
	MOVLW      2
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,101 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,102 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,103 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_DOS

pulso_TRES:

;pulso.mbas,105 :: 		sub procedure TRES
;pulso.mbas,106 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,107 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,108 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,109 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,110 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,111 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,112 :: 		UART1_Write(0X03)'LOW
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,113 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,114 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,115 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_TRES

pulso_CUATRO:

;pulso.mbas,117 :: 		sub procedure CUATRO
;pulso.mbas,118 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,119 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,120 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,121 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,122 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,123 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,124 :: 		UART1_Write(0X04)'LOW
	MOVLW      4
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,125 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,126 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,127 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_CUATRO

pulso_CINCO:

;pulso.mbas,129 :: 		sub procedure CINCO
;pulso.mbas,130 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,131 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,132 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,133 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,134 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,135 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,136 :: 		UART1_Write(0X05)'LOW
	MOVLW      5
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,137 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,138 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,139 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_CINCO

pulso_SEIS:

;pulso.mbas,141 :: 		sub procedure SEIS
;pulso.mbas,142 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,143 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,144 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,145 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,146 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,147 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,148 :: 		UART1_Write(0X06)'LOW
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,149 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,150 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,151 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_SEIS

pulso_SIETE:

;pulso.mbas,153 :: 		sub procedure SIETE
;pulso.mbas,154 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,155 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,156 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,157 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,158 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,159 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,160 :: 		UART1_Write(0X07)'LOW
	MOVLW      7
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,161 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,162 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,163 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_SIETE

pulso_OCHO:

;pulso.mbas,165 :: 		sub procedure OCHO
;pulso.mbas,166 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,167 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,168 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,169 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,170 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,171 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,172 :: 		UART1_Write(0X08)'LOW
	MOVLW      8
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,173 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,174 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,175 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_OCHO

pulso_NUEVE:

;pulso.mbas,177 :: 		sub procedure NUEVE
;pulso.mbas,178 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,179 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,180 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,181 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,182 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,183 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,184 :: 		UART1_Write(0X09)'LOW
	MOVLW      9
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,185 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,186 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,187 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	RETURN
; end of pulso_NUEVE

_main:

;pulso.mbas,190 :: 		main:
;pulso.mbas,191 :: 		OSCCON     =  0X65  'FRECUENCIA DE TRABAJO A 4 MHz
	MOVLW      101
	MOVWF      OSCCON+0
;pulso.mbas,192 :: 		UART1_Init(9600)                'COMUNICACION SERIAL INICIADA
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pulso.mbas,193 :: 		TRISA      =  %00000001         'INICIO DE MODO INTERNO O EXTERNO
	MOVLW      1
	MOVWF      TRISA+0
;pulso.mbas,194 :: 		TRISB      =  0
	CLRF       TRISB+0
;pulso.mbas,195 :: 		TRISC      =  %10000000         'PARA REECEPCION DE DATOS DESDE EL RFID
	MOVLW      128
	MOVWF      TRISC+0
;pulso.mbas,196 :: 		PORTA      =  %00000000         'PARA EL VIBRADOR
	CLRF       PORTA+0
;pulso.mbas,197 :: 		PORTB      =  0
	CLRF       PORTB+0
;pulso.mbas,198 :: 		PORTC      =  0
	CLRF       PORTC+0
;pulso.mbas,199 :: 		ANSEL      =  %00000001         'INICIO DE MODO INTERNO O EXTERNO
	MOVLW      1
	MOVWF      ANSEL+0
;pulso.mbas,200 :: 		ANSELH     =  0
	CLRF       ANSELH+0
;pulso.mbas,201 :: 		Delay_ms(2000)
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L__main18:
	DECFSZ     R13+0, 1
	GOTO       L__main18
	DECFSZ     R12+0, 1
	GOTO       L__main18
	DECFSZ     R11+0, 1
	GOTO       L__main18
	NOP
	NOP
;pulso.mbas,202 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,203 :: 		UART1_Write(0X07)
	MOVLW      7
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,204 :: 		UART1_Write(0XA4)
	MOVLW      164
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,205 :: 		UART1_Write(0X19)
	MOVLW      25
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,206 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,207 :: 		CONT=0
	CLRF       _CONT+0
;pulso.mbas,208 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;pulso.mbas,209 :: 		WHILE(1)
L__main20:
;pulso.mbas,210 :: 		ADC = Adc_Read(0)
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _ADC+0
	MOVF       R0+1, 0
	MOVWF      _ADC+1
;pulso.mbas,211 :: 		if ADC>950 then
	MOVF       R0+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVF       R0+0, 0
	SUBLW      182
L__main76:
	BTFSC      STATUS+0, 0
	GOTO       L__main25
;pulso.mbas,212 :: 		CONT=CONT+1
	INCF       _CONT+0, 1
L__main25:
;pulso.mbas,215 :: 		Delay_ms(100)
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L__main27:
	DECFSZ     R13+0, 1
	GOTO       L__main27
	DECFSZ     R12+0, 1
	GOTO       L__main27
	NOP
	NOP
;pulso.mbas,216 :: 		CENTINELA=CENTINELA+1
	INCF       _CENTINELA+0, 1
;pulso.mbas,217 :: 		if CENTINELA=600 then
	MOVLW      0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      88
	XORWF      _CENTINELA+0, 0
L__main77:
	BTFSS      STATUS+0, 2
	GOTO       L__main29
;pulso.mbas,218 :: 		X=CONT
	MOVF       _CONT+0, 0
	MOVWF      _X+0
;pulso.mbas,219 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
;pulso.mbas,220 :: 		CONT=0
	CLRF       _CONT+0
;pulso.mbas,221 :: 		sonido
	CALL       pulso_sonido+0
;pulso.mbas,222 :: 		decena = X/10
	MOVLW      10
	MOVWF      R4+0
	MOVF       _X+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _DECENA+0
;pulso.mbas,223 :: 		unidad = X MOD 10
	MOVLW      10
	MOVWF      R4+0
	MOVF       _X+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _UNIDAD+0
;pulso.mbas,225 :: 		INICIO           'SONIDO INICIO
	CALL       pulso_INICIO+0
;pulso.mbas,226 :: 		IF DECENA= 6 THEN
	MOVF       _DECENA+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main32
;pulso.mbas,227 :: 		SESENTA
	CALL       pulso_SESENTA+0
L__main32:
;pulso.mbas,229 :: 		IF DECENA= 7 THEN
	MOVF       _DECENA+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main35
;pulso.mbas,230 :: 		SETENTA
	CALL       pulso_SETENTA+0
L__main35:
;pulso.mbas,232 :: 		IF DECENA= 8 THEN
	MOVF       _DECENA+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main38
;pulso.mbas,233 :: 		OCHENTA
	CALL       pulso_OCHENTA+0
L__main38:
;pulso.mbas,235 :: 		IF DECENA= 9 THEN
	MOVF       _DECENA+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L__main41
;pulso.mbas,236 :: 		NOVENTA
	CALL       pulso_NOVENTA+0
L__main41:
;pulso.mbas,239 :: 		IF UNIDAD= 1 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main44
;pulso.mbas,240 :: 		UNO
	CALL       pulso_UNO+0
L__main44:
;pulso.mbas,242 :: 		IF UNIDAD= 2 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main47
;pulso.mbas,243 :: 		DOS
	CALL       pulso_DOS+0
L__main47:
;pulso.mbas,245 :: 		IF UNIDAD= 3 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__main50
;pulso.mbas,246 :: 		TRES
	CALL       pulso_TRES+0
L__main50:
;pulso.mbas,248 :: 		IF UNIDAD= 4 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main53
;pulso.mbas,249 :: 		CUATRO
	CALL       pulso_CUATRO+0
L__main53:
;pulso.mbas,251 :: 		IF UNIDAD= 5 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__main56
;pulso.mbas,252 :: 		CINCO
	CALL       pulso_CINCO+0
L__main56:
;pulso.mbas,254 :: 		IF UNIDAD= 6 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__main59
;pulso.mbas,255 :: 		SEIS
	CALL       pulso_SEIS+0
L__main59:
;pulso.mbas,257 :: 		IF UNIDAD= 7 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__main62
;pulso.mbas,258 :: 		SIETE
	CALL       pulso_SIETE+0
L__main62:
;pulso.mbas,260 :: 		IF UNIDAD= 8 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L__main65
;pulso.mbas,261 :: 		OCHO
	CALL       pulso_OCHO+0
L__main65:
;pulso.mbas,263 :: 		IF UNIDAD= 9 THEN
	MOVF       _UNIDAD+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L__main68
;pulso.mbas,264 :: 		NUEVE
	CALL       pulso_NUEVE+0
L__main68:
;pulso.mbas,266 :: 		FIN
	CALL       pulso_FIN+0
L__main29:
;pulso.mbas,269 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main71
;pulso.mbas,270 :: 		DATO = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DATO+0
L__main71:
;pulso.mbas,274 :: 		if DATO = "1" then
	MOVF       _DATO+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main74
;pulso.mbas,276 :: 		UART1_Write(0X7E)
	MOVLW      126
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,277 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,278 :: 		UART1_Write(0X06)
	MOVLW      6
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,279 :: 		UART1_Write(0X03)
	MOVLW      3
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,280 :: 		UART1_Write(0X00)
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,281 :: 		UART1_Write(0X00)'HIGH
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,282 :: 		UART1_Write(0X01)'LOW
	MOVLW      1
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,283 :: 		UART1_Write(0XFF)
	MOVLW      255
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,284 :: 		UART1_Write(0XE6)
	MOVLW      230
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,285 :: 		UART1_Write(0XEF)
	MOVLW      239
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;pulso.mbas,286 :: 		DATO=0
	CLRF       _DATO+0
L__main74:
;pulso.mbas,290 :: 		WEND
	GOTO       L__main20
	GOTO       $+0
; end of _main
