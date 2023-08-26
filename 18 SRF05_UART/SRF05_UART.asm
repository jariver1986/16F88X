
SRF05_UART_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;SRF05_UART.mbas,27 :: 		sub procedure interrupt
;SRF05_UART.mbas,28 :: 		if TestBit(INTCON,INTF) then ' bandera de la interrupcion externa activada
	CLRF       R0+0
	BTFSS      INTCON+0, 1
	GOTO       L_SRF05_UART_interrupt4
	MOVLW      1
	MOVWF      R0+0
L_SRF05_UART_interrupt4:
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_SRF05_UART_interrupt2
;SRF05_UART.mbas,29 :: 		ClearBit(INTCON,INTF) ' bandera de la interrupcion externa borrada
	BCF        INTCON+0, 1
;SRF05_UART.mbas,30 :: 		if flanco = 0 then ' cuando el flanco va de vajo a alto
	MOVF       _flanco+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_SRF05_UART_interrupt6
;SRF05_UART.mbas,31 :: 		ClearBit(OPTION_REG,INTEDG) ' interrupcion cuando paso al rizado bajo
	BCF        OPTION_REG+0, 6
;SRF05_UART.mbas,32 :: 		flanco = 1 ' cambiamos el flanco bajo
	MOVLW      1
	MOVWF      _flanco+0
;SRF05_UART.mbas,33 :: 		TMR0 = 0 ' enceramos el timer
	CLRF       TMR0+0
	GOTO       L_SRF05_UART_interrupt7
;SRF05_UART.mbas,34 :: 		else ' cuando el flanco va de alto bajo
L_SRF05_UART_interrupt6:
;SRF05_UART.mbas,35 :: 		pulso = TMR0 ' tomamos el valor del timer
	MOVF       TMR0+0, 0
	MOVWF      _pulso+0
;SRF05_UART.mbas,36 :: 		SetBit(OPTION_REG,INTEDG) ' interrupcion cuando paso al rizado alto
	BSF        OPTION_REG+0, 6
;SRF05_UART.mbas,37 :: 		flanco = 0 ' cambiamos de flanco alto
	CLRF       _flanco+0
;SRF05_UART.mbas,38 :: 		end if
L_SRF05_UART_interrupt7:
L_SRF05_UART_interrupt2:
;SRF05_UART.mbas,40 :: 		ClearBit(INTCON,T0IF)
	BCF        INTCON+0, 2
L_SRF05_UART_interrupt22:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of SRF05_UART_interrupt

SRF05_UART_srf05_leer:

;SRF05_UART.mbas,45 :: 		dim tiempo as word
;SRF05_UART.mbas,46 :: 		PORTC.0 = 1 ' habilitamos el disparo
	BSF        PORTC+0, 0
;SRF05_UART.mbas,47 :: 		delay_us(10) ' con un tiempo minimo de 10us
	MOVLW      6
	MOVWF      R13+0
L_SRF05_UART_srf05_leer9:
	DECFSZ     R13+0, 1
	GOTO       L_SRF05_UART_srf05_leer9
	NOP
;SRF05_UART.mbas,48 :: 		PORTC.0 = 0 ' apagamos el disparo
	BCF        PORTC+0, 0
;SRF05_UART.mbas,49 :: 		delay_ms(20) ' hay un tiempo de espera del eco
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_SRF05_UART_srf05_leer10:
	DECFSZ     R13+0, 1
	GOTO       L_SRF05_UART_srf05_leer10
	DECFSZ     R12+0, 1
	GOTO       L_SRF05_UART_srf05_leer10
	NOP
	NOP
;SRF05_UART.mbas,50 :: 		tiempo = pulso*255 ' ya para este paso debio haber aparecido la interrupccion externa
	MOVF       _pulso+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16x16_U+0
;SRF05_UART.mbas,51 :: 		tiempo = tiempo/58 ' convertimos de pulgadas a centimetros
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
;SRF05_UART.mbas,52 :: 		tiempo = tiempo/2 ' ya que el eco viene y va, solo necesito saber la mitad del recorrido
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
;SRF05_UART.mbas,53 :: 		result = tiempo ' resultado de la distancia
	MOVF       R2+0, 0
	MOVWF      srf05_leer_local_result+0
	MOVF       R2+1, 0
	MOVWF      srf05_leer_local_result+1
	MOVF       srf05_leer_local_result+0, 0
	MOVWF      R0+0
	MOVF       srf05_leer_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of SRF05_UART_srf05_leer

_main:

;SRF05_UART.mbas,56 :: 		main:
;SRF05_UART.mbas,58 :: 		OSCCON = 0X75 ' Oscilador interno de 8mhz
	MOVLW      117
	MOVWF      OSCCON+0
;SRF05_UART.mbas,60 :: 		OPTION_REG = 0XC7 ' desactiva el pull up de portb
	MOVLW      199
	MOVWF      OPTION_REG+0
;SRF05_UART.mbas,64 :: 		INTCON = 0XD0 ' Activado interrupciones globales
	MOVLW      208
	MOVWF      INTCON+0
;SRF05_UART.mbas,68 :: 		TRISA = 0X00 ' todas los pines comom salidas
	CLRF       TRISA+0
;SRF05_UART.mbas,69 :: 		PORTA = 0X00
	CLRF       PORTA+0
;SRF05_UART.mbas,71 :: 		TRISB = 0X01 ' portb.0 como entrada digital, las demas salidas
	MOVLW      1
	MOVWF      TRISB+0
;SRF05_UART.mbas,72 :: 		PORTB = 0X00
	CLRF       PORTB+0
;SRF05_UART.mbas,74 :: 		TRISC = 0X80 ' portc.7 entrada RX, las demas salidas
	MOVLW      128
	MOVWF      TRISC+0
;SRF05_UART.mbas,75 :: 		PORTC = 0X00
	CLRF       PORTC+0
;SRF05_UART.mbas,77 :: 		ANSEL = 0X00 ' AN<7:0>
	CLRF       ANSEL+0
;SRF05_UART.mbas,78 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;SRF05_UART.mbas,80 :: 		flanco = 0 ' primer flanco bajo
	CLRF       _flanco+0
;SRF05_UART.mbas,81 :: 		valor = 0
	CLRF       _valor+0
	CLRF       _valor+1
;SRF05_UART.mbas,83 :: 		UART1_Init(9600) ' inicializamos la comunicacion serial a una velocidad 9600bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SRF05_UART.mbas,84 :: 		Delay_ms(250)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L__main12:
	DECFSZ     R13+0, 1
	GOTO       L__main12
	DECFSZ     R12+0, 1
	GOTO       L__main12
	DECFSZ     R11+0, 1
	GOTO       L__main12
	NOP
	NOP
;SRF05_UART.mbas,85 :: 		UART1_Write_Text("ideastechnology.com") ' escribimos el texo serialmente
	MOVLW      _main_Local_Text+0
	MOVWF      FSR
	MOVLW      105
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      100
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      97
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      115
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      116
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      101
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      104
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      110
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      108
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      103
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      121
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      46
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      99
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      111
	MOVWF      INDF+0
	INCF       FSR, 1
	MOVLW      109
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       FSR, 1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SRF05_UART.mbas,86 :: 		UART1_Write(0x0a) ' escribimos el ascci de fin de cadena
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SRF05_UART.mbas,87 :: 		UART1_Write(0x0d) ' escribimos el ascci de enter
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SRF05_UART.mbas,89 :: 		while true
L__main14:
;SRF05_UART.mbas,90 :: 		valor = srf05_leer() ' leemos el valor del sensor y lo depositamos en valor
	CALL       SRF05_UART_srf05_leer+0
	MOVF       R0+0, 0
	MOVWF      _valor+0
	MOVF       R0+1, 0
	MOVWF      _valor+1
;SRF05_UART.mbas,96 :: 		if (valor<130) then
	MOVLW      0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      130
	SUBWF      R0+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L__main19
;SRF05_UART.mbas,97 :: 		UART1_Write_Text("A")
	MOVLW      65
	MOVWF      _main_Local_Text+0
	CLRF       _main_Local_Text+1
	MOVLW      _main_Local_Text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SRF05_UART.mbas,98 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;SRF05_UART.mbas,99 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;SRF05_UART.mbas,100 :: 		Delay_1sec
	CALL       _Delay_1sec+0
L__main19:
;SRF05_UART.mbas,102 :: 		delay_ms(500)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L__main21:
	DECFSZ     R13+0, 1
	GOTO       L__main21
	DECFSZ     R12+0, 1
	GOTO       L__main21
	DECFSZ     R11+0, 1
	GOTO       L__main21
	NOP
	NOP
;SRF05_UART.mbas,103 :: 		wend
	GOTO       L__main14
	GOTO       $+0
; end of _main
