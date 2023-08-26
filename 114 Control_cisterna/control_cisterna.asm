
control_cisterna_ultrasonico1:

;control_cisterna.mbas,11 :: 		dim distan,tiempo as word
;control_cisterna.mbas,12 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;control_cisterna.mbas,14 :: 		PORTB.RB0 = 1
	BSF        PORTB+0, 0
;control_cisterna.mbas,15 :: 		Delay_us(150)
	MOVLW      49
	MOVWF      R13+0
L_control_cisterna_ultrasonico11:
	DECFSZ     R13+0, 1
	GOTO       L_control_cisterna_ultrasonico11
	NOP
	NOP
;control_cisterna.mbas,16 :: 		PORTB.RB0 = 0
	BCF        PORTB+0, 0
;control_cisterna.mbas,18 :: 		DO
L_control_cisterna_ultrasonico12:
;control_cisterna.mbas,19 :: 		IF( PORTB.RB1 = 1 )THEN
	BTFSS      PORTB+0, 1
	GOTO       L_control_cisterna_ultrasonico18
;control_cisterna.mbas,20 :: 		TMR0 = 0
	CLRF       TMR0+0
;control_cisterna.mbas,21 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_control_cisterna_ultrasonico18:
;control_cisterna.mbas,23 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_control_cisterna_ultrasonico15
	GOTO       L_control_cisterna_ultrasonico12
L_control_cisterna_ultrasonico15:
;control_cisterna.mbas,25 :: 		DO
L_control_cisterna_ultrasonico110:
;control_cisterna.mbas,26 :: 		IF( PORTB.RB1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_control_cisterna_ultrasonico116
;control_cisterna.mbas,27 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;control_cisterna.mbas,28 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_control_cisterna_ultrasonico116:
;control_cisterna.mbas,33 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_control_cisterna_ultrasonico113
	GOTO       L_control_cisterna_ultrasonico110
L_control_cisterna_ultrasonico113:
;control_cisterna.mbas,35 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_control_cisterna_ultrasonico151:
	BTFSC      STATUS+0, 2
	GOTO       L_control_cisterna_ultrasonico152
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_control_cisterna_ultrasonico151
L_control_cisterna_ultrasonico152:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;control_cisterna.mbas,36 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_control_cisterna_ultrasonico118:
	DECFSZ     R13+0, 1
	GOTO       L_control_cisterna_ultrasonico118
	DECFSZ     R12+0, 1
	GOTO       L_control_cisterna_ultrasonico118
	NOP
;control_cisterna.mbas,37 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of control_cisterna_ultrasonico1

_main:

;control_cisterna.mbas,41 :: 		main:
;control_cisterna.mbas,42 :: 		OPTION_REG = %00000110
	MOVLW      6
	MOVWF      OPTION_REG+0
;control_cisterna.mbas,43 :: 		OSCCON = 0x65
	MOVLW      101
	MOVWF      OSCCON+0
;control_cisterna.mbas,44 :: 		PORTA  =  0
	CLRF       PORTA+0
;control_cisterna.mbas,45 :: 		TRISA  =  %00000001
	MOVLW      1
	MOVWF      TRISA+0
;control_cisterna.mbas,46 :: 		PORTB  =  0
	CLRF       PORTB+0
;control_cisterna.mbas,47 :: 		TRISB  =  %00101010
	MOVLW      42
	MOVWF      TRISB+0
;control_cisterna.mbas,48 :: 		PORTC  =  0
	CLRF       PORTC+0
;control_cisterna.mbas,49 :: 		TRISC  =  %10000000
	MOVLW      128
	MOVWF      TRISC+0
;control_cisterna.mbas,50 :: 		PORTD  =  %00000000
	CLRF       PORTD+0
;control_cisterna.mbas,51 :: 		TRISD  =  0
	CLRF       TRISD+0
;control_cisterna.mbas,52 :: 		ANSEL =1
	MOVLW      1
	MOVWF      ANSEL+0
;control_cisterna.mbas,53 :: 		ANSELH = 0
	CLRF       ANSELH+0
;control_cisterna.mbas,54 :: 		UART1_Init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;control_cisterna.mbas,55 :: 		TURNO=0
	CLRF       _TURNO+0
;control_cisterna.mbas,56 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main20:
	DECFSZ     R13+0, 1
	GOTO       L__main20
	DECFSZ     R12+0, 1
	GOTO       L__main20
	DECFSZ     R11+0, 1
	GOTO       L__main20
	NOP
	NOP
;control_cisterna.mbas,57 :: 		UART1_Write_Text("SALUDOS")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      68
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_cisterna.mbas,58 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;control_cisterna.mbas,59 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
;control_cisterna.mbas,60 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	DECFSZ     R11+0, 1
	GOTO       L__main21
	NOP
;control_cisterna.mbas,61 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;control_cisterna.mbas,62 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;control_cisterna.mbas,63 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main22:
	DECFSZ     R13+0, 1
	GOTO       L__main22
	DECFSZ     R12+0, 1
	GOTO       L__main22
	DECFSZ     R11+0, 1
	GOTO       L__main22
	NOP
;control_cisterna.mbas,64 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;control_cisterna.mbas,65 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
;control_cisterna.mbas,66 :: 		Delay_ms(200)
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L__main23:
	DECFSZ     R13+0, 1
	GOTO       L__main23
	DECFSZ     R12+0, 1
	GOTO       L__main23
	DECFSZ     R11+0, 1
	GOTO       L__main23
	NOP
;control_cisterna.mbas,67 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;control_cisterna.mbas,68 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;control_cisterna.mbas,72 :: 		WHILE (1)
L__main25:
;control_cisterna.mbas,73 :: 		if UART1_Data_Ready then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main30
;control_cisterna.mbas,74 :: 		datorx = UART1_Read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _datorx+0
L__main30:
;control_cisterna.mbas,76 :: 		if datorx= "1" then
	MOVF       _datorx+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__main33
;control_cisterna.mbas,77 :: 		PORTD.RD0=1
	BSF        PORTD+0, 0
L__main33:
;control_cisterna.mbas,79 :: 		if datorx= "2" then
	MOVF       _datorx+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__main36
;control_cisterna.mbas,80 :: 		PORTD.RD0=0
	BCF        PORTD+0, 0
L__main36:
;control_cisterna.mbas,82 :: 		if datorx= "3" then
	MOVF       _datorx+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__main39
;control_cisterna.mbas,83 :: 		PORTD.RD1=1
	BSF        PORTD+0, 1
L__main39:
;control_cisterna.mbas,85 :: 		if datorx= "4" then
	MOVF       _datorx+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__main42
;control_cisterna.mbas,86 :: 		PORTD.RD1=0
	BCF        PORTD+0, 1
L__main42:
;control_cisterna.mbas,88 :: 		datorx=0
	CLRF       _datorx+0
;control_cisterna.mbas,90 :: 		distancia1 = ultrasonico1()
	CALL       control_cisterna_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _DISTANCIA1+0
	MOVF       R0+1, 0
	MOVWF      _DISTANCIA1+1
;control_cisterna.mbas,91 :: 		if distancia1 > 20 then
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       R0+0, 0
	SUBLW      20
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L__main45
;control_cisterna.mbas,92 :: 		UART1_Write_Text(" TANQUE VACIO ")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      86
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      67
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_cisterna.mbas,93 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,94 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,95 :: 		PORTD.RD2=1
	BSF        PORTD+0, 2
;control_cisterna.mbas,96 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
	GOTO       L__main46
;control_cisterna.mbas,97 :: 		else
L__main45:
;control_cisterna.mbas,98 :: 		if distancia1 < 7 then
	MOVLW      0
	SUBWF      _DISTANCIA1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      7
	SUBWF      _DISTANCIA1+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L__main48
;control_cisterna.mbas,99 :: 		UART1_Write_Text(" TANQUE LLENO")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      81
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      85
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      78
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      79
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_cisterna.mbas,100 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,101 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,102 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;control_cisterna.mbas,103 :: 		PORTD.RD3=1
	BSF        PORTD+0, 3
	GOTO       L__main49
;control_cisterna.mbas,104 :: 		ELSE
L__main48:
;control_cisterna.mbas,105 :: 		UART1_Write_Text(" SISTEMA ESTABLE")
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      73
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      77
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      32
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      83
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      84
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      65
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      66
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      76
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      69
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;control_cisterna.mbas,106 :: 		UART1_Write(0X0D)
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,107 :: 		UART1_Write(0X0A)
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;control_cisterna.mbas,108 :: 		PORTD.RD2=0
	BCF        PORTD+0, 2
;control_cisterna.mbas,109 :: 		PORTD.RD3=0
	BCF        PORTD+0, 3
;control_cisterna.mbas,110 :: 		end if
L__main49:
;control_cisterna.mbas,111 :: 		end if
L__main46:
;control_cisterna.mbas,112 :: 		Delay_ms(1000)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main50:
	DECFSZ     R13+0, 1
	GOTO       L__main50
	DECFSZ     R12+0, 1
	GOTO       L__main50
	DECFSZ     R11+0, 1
	GOTO       L__main50
	NOP
	NOP
;control_cisterna.mbas,113 :: 		WEND
	GOTO       L__main25
	GOTO       $+0
; end of _main
