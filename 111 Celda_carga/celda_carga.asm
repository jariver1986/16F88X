
_main:

;celda_carga.mbas,22 :: 		main:
;celda_carga.mbas,23 :: 		OSCCON = %01110101               ' FRECUENCIA DE TRABAJO A 8 MHZ
	MOVLW      117
	MOVWF      OSCCON+0
;celda_carga.mbas,24 :: 		PORTA  = %00000000               ' ENCERA PUERTA A
	CLRF       PORTA+0
;celda_carga.mbas,25 :: 		PORTB  = %00000000               ' ENCERA PUERTA B
	CLRF       PORTB+0
;celda_carga.mbas,26 :: 		PORTC  = %00000000               ' ENCERA PUERTA C
	CLRF       PORTC+0
;celda_carga.mbas,27 :: 		TRISA  = %00000001               ' ENCERA PUERTA RA0 COMO ENTRADA
	MOVLW      1
	MOVWF      TRISA+0
;celda_carga.mbas,28 :: 		TRISB  = %00000000               ' ENCERA TRIS B COMO SALIDA
	CLRF       TRISB+0
;celda_carga.mbas,29 :: 		TRISC  = %00000000               ' ENCERA TRIS C COMO SALIDA RC6
	CLRF       TRISC+0
;celda_carga.mbas,30 :: 		ANSEL  = %00000001               ' ENCERA PUERTO COMO ENTRADA ANALOGICA RA0
	MOVLW      1
	MOVWF      ANSEL+0
;celda_carga.mbas,31 :: 		ANSELH = %00000000               ' ENCERA PUERTO B COMO E/S DIGITAL
	CLRF       ANSELH+0
;celda_carga.mbas,32 :: 		UART1_Init(9600)
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;celda_carga.mbas,33 :: 		centinela=0
	CLRF       _CENTINELA+0
;celda_carga.mbas,34 :: 		while (1)
L__main2:
;celda_carga.mbas,36 :: 		if UART1_Data_Ready = 1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
;celda_carga.mbas,37 :: 		UART1_Read_Text(MENSAJE , "*", 50)
	MOVLW      _MENSAJE+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      42
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      50
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;celda_carga.mbas,38 :: 		centinela = 1
	MOVLW      1
	MOVWF      _CENTINELA+0
L__main7:
;celda_carga.mbas,40 :: 		if centinela=1 then
	MOVF       _CENTINELA+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main10
;celda_carga.mbas,41 :: 		PESO = Adc_Read(0)             'LECTURA DE VALOR DE VOLTAJE ANALOGICO
	CLRF       FARG_Adc_Read_channel+0
	CALL       _Adc_Read+0
	MOVF       R0+0, 0
	MOVWF      _PESO+0
	MOVF       R0+1, 0
	MOVWF      _PESO+1
;celda_carga.mbas,42 :: 		WordToStr(PESO,DATO)           '
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _DATO+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;celda_carga.mbas,43 :: 		strcat(DATO,MENSAJE)
	MOVLW      _DATO+0
	MOVWF      FARG_strcat_s1+0
	MOVLW      _MENSAJE+0
	MOVWF      FARG_strcat_s2+0
	CALL       _strcat+0
;celda_carga.mbas,44 :: 		UART1_Write_Text(MENSAJE)  '
	MOVLW      _MENSAJE+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;celda_carga.mbas,45 :: 		CENTINELA=0
	CLRF       _CENTINELA+0
L__main10:
;celda_carga.mbas,47 :: 		Delay_10ms
	CALL       _Delay_10ms+0
;celda_carga.mbas,48 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
