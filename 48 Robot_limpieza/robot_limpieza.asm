
robot_limpieza_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;robot_limpieza.mbas,11 :: 		sub procedure interrupt
;robot_limpieza.mbas,12 :: 		if INTCON.TMR0IF=1 THEN
	BTFSS      INTCON+0, 2
	GOTO       L_robot_limpieza_interrupt2
;robot_limpieza.mbas,13 :: 		if centinela=1 then
	MOVF       _centinela+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt5
;robot_limpieza.mbas,14 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt8
;robot_limpieza.mbas,15 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,16 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_limpieza.mbas,18 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;robot_limpieza.mbas,19 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt8:
;robot_limpieza.mbas,21 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt12
;robot_limpieza.mbas,22 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,23 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_limpieza.mbas,25 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;robot_limpieza.mbas,26 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt12:
;robot_limpieza.mbas,27 :: 		end if
L_robot_limpieza_interrupt5:
;robot_limpieza.mbas,29 :: 		if centinela=2 then
	MOVF       _centinela+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt15
;robot_limpieza.mbas,30 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt18
;robot_limpieza.mbas,31 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,32 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_limpieza.mbas,33 :: 		PORTC.RC0=0
	BCF        PORTC+0, 0
;robot_limpieza.mbas,34 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt18:
;robot_limpieza.mbas,36 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt21
;robot_limpieza.mbas,37 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,38 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_limpieza.mbas,39 :: 		PORTC.RC0=1
	BSF        PORTC+0, 0
;robot_limpieza.mbas,40 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt21:
;robot_limpieza.mbas,41 :: 		end if
L_robot_limpieza_interrupt15:
;robot_limpieza.mbas,43 :: 		if centinela=3 then
	MOVF       _centinela+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt24
;robot_limpieza.mbas,44 :: 		if por=1 then
	MOVF       _por+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt27
;robot_limpieza.mbas,45 :: 		giro=giro1 '109
	MOVF       _giro1+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,46 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_limpieza.mbas,47 :: 		PORTC.RC1=0
	BCF        PORTC+0, 1
;robot_limpieza.mbas,48 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt27:
;robot_limpieza.mbas,50 :: 		if por=2 then
	MOVF       _por+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_interrupt30
;robot_limpieza.mbas,51 :: 		giro=giro2 '243
	MOVF       _giro2+0, 0
	MOVWF      _giro+0
;robot_limpieza.mbas,52 :: 		por=1
	MOVLW      1
	MOVWF      _por+0
;robot_limpieza.mbas,53 :: 		PORTC.RC1=1
	BSF        PORTC+0, 1
;robot_limpieza.mbas,54 :: 		GOTO final
	GOTO       L_robot_limpieza_interrupt_final
L_robot_limpieza_interrupt30:
;robot_limpieza.mbas,55 :: 		end if
L_robot_limpieza_interrupt24:
;robot_limpieza.mbas,56 :: 		end if
L_robot_limpieza_interrupt2:
;robot_limpieza.mbas,58 :: 		final:
L_robot_limpieza_interrupt_final:
;robot_limpieza.mbas,59 :: 		TMR0 = giro
	MOVF       _giro+0, 0
	MOVWF      TMR0+0
;robot_limpieza.mbas,60 :: 		INTCON = 0x20
	MOVLW      32
	MOVWF      INTCON+0
L_robot_limpieza_interrupt82:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of robot_limpieza_interrupt

robot_limpieza_ver:

;robot_limpieza.mbas,62 :: 		sub procedure ver(dim numero as byte)
;robot_limpieza.mbas,63 :: 		if numero = 1 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_ver34
;robot_limpieza.mbas,64 :: 		giro1=103
	MOVLW      103
	MOVWF      _giro1+0
;robot_limpieza.mbas,65 :: 		giro2=249
	MOVLW      249
	MOVWF      _giro2+0
	GOTO       L_robot_limpieza_ver35
;robot_limpieza.mbas,66 :: 		else
L_robot_limpieza_ver34:
;robot_limpieza.mbas,67 :: 		if numero = 2 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_ver37
;robot_limpieza.mbas,68 :: 		giro1=109
	MOVLW      109
	MOVWF      _giro1+0
;robot_limpieza.mbas,69 :: 		giro2=243
	MOVLW      243
	MOVWF      _giro2+0
	GOTO       L_robot_limpieza_ver38
;robot_limpieza.mbas,70 :: 		else
L_robot_limpieza_ver37:
;robot_limpieza.mbas,71 :: 		if numero = 3 then
	MOVF       FARG_ver_numero+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_robot_limpieza_ver40
;robot_limpieza.mbas,72 :: 		giro1=114
	MOVLW      114
	MOVWF      _giro1+0
;robot_limpieza.mbas,73 :: 		giro2=238
	MOVLW      238
	MOVWF      _giro2+0
	GOTO       L_robot_limpieza_ver41
;robot_limpieza.mbas,74 :: 		else
L_robot_limpieza_ver40:
;robot_limpieza.mbas,75 :: 		giro1=98
	MOVLW      98
	MOVWF      _giro1+0
;robot_limpieza.mbas,76 :: 		giro2=251
	MOVLW      251
	MOVWF      _giro2+0
;robot_limpieza.mbas,77 :: 		end if
L_robot_limpieza_ver41:
;robot_limpieza.mbas,78 :: 		end if
L_robot_limpieza_ver38:
;robot_limpieza.mbas,79 :: 		end if
L_robot_limpieza_ver35:
	RETURN
; end of robot_limpieza_ver

robot_limpieza_adelante:

;robot_limpieza.mbas,81 :: 		sub procedure adelante()
;robot_limpieza.mbas,82 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;robot_limpieza.mbas,83 :: 		ver(2)
	MOVLW      2
	MOVWF      FARG_ver_numero+0
	CALL       robot_limpieza_ver+0
	RETURN
; end of robot_limpieza_adelante

robot_limpieza_atras:

;robot_limpieza.mbas,85 :: 		sub procedure atras()
;robot_limpieza.mbas,86 :: 		centinela=1
	MOVLW      1
	MOVWF      _centinela+0
;robot_limpieza.mbas,87 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_limpieza_ver+0
	RETURN
; end of robot_limpieza_atras

robot_limpieza_izquierda:

;robot_limpieza.mbas,89 :: 		sub procedure izquierda()
;robot_limpieza.mbas,90 :: 		centinela=2
	MOVLW      2
	MOVWF      _centinela+0
;robot_limpieza.mbas,91 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_limpieza_ver+0
	RETURN
; end of robot_limpieza_izquierda

robot_limpieza_derecha:

;robot_limpieza.mbas,93 :: 		sub procedure derecha()
;robot_limpieza.mbas,94 :: 		centinela=3
	MOVLW      3
	MOVWF      _centinela+0
;robot_limpieza.mbas,95 :: 		ver(1)
	MOVLW      1
	MOVWF      FARG_ver_numero+0
	CALL       robot_limpieza_ver+0
	RETURN
; end of robot_limpieza_derecha

robot_limpieza_parar:

;robot_limpieza.mbas,97 :: 		sub procedure parar()
;robot_limpieza.mbas,98 :: 		centinela=4
	MOVLW      4
	MOVWF      _centinela+0
	RETURN
; end of robot_limpieza_parar

robot_limpieza_ultrasonico1:

;robot_limpieza.mbas,102 :: 		dim distan,tiempo as word
;robot_limpieza.mbas,103 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
;robot_limpieza.mbas,105 :: 		disparo1 = 1
	BSF        PORTB+0, 0
;robot_limpieza.mbas,106 :: 		Delay_us(50)
	MOVLW      16
	MOVWF      R13+0
L_robot_limpieza_ultrasonico148:
	DECFSZ     R13+0, 1
	GOTO       L_robot_limpieza_ultrasonico148
	NOP
;robot_limpieza.mbas,107 :: 		disparo1 = 0
	BCF        PORTB+0, 0
;robot_limpieza.mbas,109 :: 		DO
L_robot_limpieza_ultrasonico149:
;robot_limpieza.mbas,110 :: 		IF( eco1 = 1 )THEN
	BTFSS      PORTB+0, 1
	GOTO       L_robot_limpieza_ultrasonico155
;robot_limpieza.mbas,111 :: 		TMR0 = 0
	CLRF       TMR0+0
;robot_limpieza.mbas,112 :: 		flanco = 1
	MOVLW      1
	MOVWF      ultrasonico1_flanco+0
L_robot_limpieza_ultrasonico155:
;robot_limpieza.mbas,114 :: 		LOOP UNTIL( flanco = 1 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_robot_limpieza_ultrasonico152
	GOTO       L_robot_limpieza_ultrasonico149
L_robot_limpieza_ultrasonico152:
;robot_limpieza.mbas,116 :: 		DO
L_robot_limpieza_ultrasonico157:
;robot_limpieza.mbas,117 :: 		IF( eco1 = 0 )THEN
	BTFSC      PORTB+0, 1
	GOTO       L_robot_limpieza_ultrasonico163
;robot_limpieza.mbas,118 :: 		tiempo = TMR0
	MOVF       TMR0+0, 0
	MOVWF      ultrasonico1_tiempo+0
	CLRF       ultrasonico1_tiempo+1
;robot_limpieza.mbas,119 :: 		flanco = 0
	CLRF       ultrasonico1_flanco+0
L_robot_limpieza_ultrasonico163:
;robot_limpieza.mbas,121 :: 		if(TMR0>254)THEN
	MOVF       TMR0+0, 0
	SUBLW      254
	BTFSC      STATUS+0, 0
	GOTO       L_robot_limpieza_ultrasonico166
;robot_limpieza.mbas,122 :: 		FLANCO=0
	CLRF       ultrasonico1_flanco+0
L_robot_limpieza_ultrasonico166:
;robot_limpieza.mbas,124 :: 		LOOP UNTIL( FLANCO = 0 )
	MOVF       ultrasonico1_flanco+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_robot_limpieza_ultrasonico160
	GOTO       L_robot_limpieza_ultrasonico157
L_robot_limpieza_ultrasonico160:
;robot_limpieza.mbas,126 :: 		distan = (tiempo*128)/58
	MOVLW      7
	MOVWF      R2+0
	MOVF       ultrasonico1_tiempo+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_tiempo+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L_robot_limpieza_ultrasonico183:
	BTFSC      STATUS+0, 2
	GOTO       L_robot_limpieza_ultrasonico184
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_robot_limpieza_ultrasonico183
L_robot_limpieza_ultrasonico184:
	MOVLW      58
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      ultrasonico1_distan+0
	MOVF       R0+1, 0
	MOVWF      ultrasonico1_distan+1
;robot_limpieza.mbas,127 :: 		Delay_ms (50)
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_robot_limpieza_ultrasonico168:
	DECFSZ     R13+0, 1
	GOTO       L_robot_limpieza_ultrasonico168
	DECFSZ     R12+0, 1
	GOTO       L_robot_limpieza_ultrasonico168
	NOP
;robot_limpieza.mbas,128 :: 		result = distan
	MOVF       ultrasonico1_distan+0, 0
	MOVWF      ultrasonico1_local_result+0
	MOVF       ultrasonico1_distan+1, 0
	MOVWF      ultrasonico1_local_result+1
	MOVF       ultrasonico1_local_result+0, 0
	MOVWF      R0+0
	MOVF       ultrasonico1_local_result+1, 0
	MOVWF      R0+1
	RETURN
; end of robot_limpieza_ultrasonico1

robot_limpieza_avanza:

;robot_limpieza.mbas,130 :: 		sub procedure avanza()
;robot_limpieza.mbas,131 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
;robot_limpieza.mbas,132 :: 		PORTC.RC3=1
	BSF        PORTC+0, 3
;robot_limpieza.mbas,133 :: 		PORTC.RC4=1
	BSF        PORTC+0, 4
;robot_limpieza.mbas,134 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,135 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,136 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;robot_limpieza.mbas,137 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,138 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,139 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;robot_limpieza.mbas,140 :: 		PORTC.RC4=0
	BCF        PORTC+0, 4
;robot_limpieza.mbas,141 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,142 :: 		Delay_500us
	CALL       _Delay_500us+0
	RETURN
; end of robot_limpieza_avanza

robot_limpieza_retrocede:

;robot_limpieza.mbas,144 :: 		sub procedure retrocede()
;robot_limpieza.mbas,145 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
;robot_limpieza.mbas,146 :: 		PORTC.RC3=1
	BSF        PORTC+0, 3
;robot_limpieza.mbas,147 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,148 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,149 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;robot_limpieza.mbas,150 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,151 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,152 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;robot_limpieza.mbas,153 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,154 :: 		Delay_500us
	CALL       _Delay_500us+0
	RETURN
; end of robot_limpieza_retrocede

robot_limpieza_giro_derecha:

;robot_limpieza.mbas,156 :: 		sub procedure giro_derecha()
;robot_limpieza.mbas,157 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
;robot_limpieza.mbas,158 :: 		PORTC.RC3=1
	BSF        PORTC+0, 3
;robot_limpieza.mbas,159 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,160 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,161 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;robot_limpieza.mbas,162 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;robot_limpieza.mbas,163 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,164 :: 		Delay_500us
	CALL       _Delay_500us+0
	RETURN
; end of robot_limpieza_giro_derecha

robot_limpieza_giro_izquierda:

;robot_limpieza.mbas,167 :: 		sub procedure giro_izquierda()
;robot_limpieza.mbas,168 :: 		PORTC.RC2=1
	BSF        PORTC+0, 2
;robot_limpieza.mbas,169 :: 		PORTC.RC3=1
	BSF        PORTC+0, 3
;robot_limpieza.mbas,170 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,171 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,172 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,173 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,174 :: 		PORTC.RC2=0
	BCF        PORTC+0, 2
;robot_limpieza.mbas,175 :: 		PORTC.RC3=0
	BCF        PORTC+0, 3
;robot_limpieza.mbas,176 :: 		Delay_500us
	CALL       _Delay_500us+0
;robot_limpieza.mbas,177 :: 		Delay_500us
	CALL       _Delay_500us+0
	RETURN
; end of robot_limpieza_giro_izquierda

_main:

;robot_limpieza.mbas,181 :: 		main:
;robot_limpieza.mbas,182 :: 		OSCCON=0X65   'oscilador interno de 4 MHZ
	MOVLW      101
	MOVWF      OSCCON+0
;robot_limpieza.mbas,184 :: 		OPTION_REG = 0x06
	MOVLW      6
	MOVWF      OPTION_REG+0
;robot_limpieza.mbas,186 :: 		TRISA = 0X0F ' PORTA.0 Entrada
	MOVLW      15
	MOVWF      TRISA+0
;robot_limpieza.mbas,187 :: 		PORTA = 0X00
	CLRF       PORTA+0
;robot_limpieza.mbas,189 :: 		TRISB = 0X02 ' PORTB
	MOVLW      2
	MOVWF      TRISB+0
;robot_limpieza.mbas,190 :: 		PORTB = 0X00
	CLRF       PORTB+0
;robot_limpieza.mbas,192 :: 		TRISC = 0X80 ' PORTC salidas
	MOVLW      128
	MOVWF      TRISC+0
;robot_limpieza.mbas,193 :: 		PORTC = 0X00
	CLRF       PORTC+0
;robot_limpieza.mbas,195 :: 		TRISE = 0X00 ' PORTE  como salidas digital
	CLRF       TRISE+0
;robot_limpieza.mbas,196 :: 		PORTE = 0X00
	CLRF       PORTE+0
;robot_limpieza.mbas,198 :: 		ANSEL = 0X0F ' AN<7:0>
	MOVLW      15
	MOVWF      ANSEL+0
;robot_limpieza.mbas,199 :: 		ANSELH = 0X00 ' AN<13:8>
	CLRF       ANSELH+0
;robot_limpieza.mbas,201 :: 		INTCON = 0xA0            '// Enable interrupt TMR0
	MOVLW      160
	MOVWF      INTCON+0
;robot_limpieza.mbas,202 :: 		TMR0= 100
	MOVLW      100
	MOVWF      TMR0+0
;robot_limpieza.mbas,204 :: 		por=2
	MOVLW      2
	MOVWF      _por+0
;robot_limpieza.mbas,206 :: 		while(1)
L__main75:
;robot_limpieza.mbas,207 :: 		distancia1=ultrasonico1()
	CALL       robot_limpieza_ultrasonico1+0
	MOVF       R0+0, 0
	MOVWF      _distancia1+0
	MOVF       R0+1, 0
	MOVWF      _distancia1+1
;robot_limpieza.mbas,208 :: 		if distancia1>40 then
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVF       R0+0, 0
	SUBLW      40
L__main85:
	BTFSC      STATUS+0, 0
	GOTO       L__main80
;robot_limpieza.mbas,209 :: 		avanza()
	CALL       robot_limpieza_avanza+0
	GOTO       L__main81
;robot_limpieza.mbas,210 :: 		else
L__main80:
;robot_limpieza.mbas,211 :: 		giro_izquierda()
	CALL       robot_limpieza_giro_izquierda+0
;robot_limpieza.mbas,212 :: 		end if
L__main81:
;robot_limpieza.mbas,213 :: 		wend
	GOTO       L__main75
	GOTO       $+0
; end of _main
