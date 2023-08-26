
_main:

;prueba_banco_relee.mbas,22 :: 		main:
;prueba_banco_relee.mbas,24 :: 		OPTION_REG = 0X86
	MOVLW      134
	MOVWF      OPTION_REG+0
;prueba_banco_relee.mbas,25 :: 		TRISA = 0
	CLRF       TRISA+0
;prueba_banco_relee.mbas,26 :: 		PORTA = 0
	CLRF       PORTA+0
;prueba_banco_relee.mbas,28 :: 		TRISB = 0
	CLRF       TRISB+0
;prueba_banco_relee.mbas,29 :: 		PORTB = 0
	CLRF       PORTB+0
;prueba_banco_relee.mbas,31 :: 		TRISC = 0
	CLRF       TRISC+0
;prueba_banco_relee.mbas,32 :: 		PORTC = 0
	CLRF       PORTC+0
;prueba_banco_relee.mbas,34 :: 		rele1 = 0
	BCF        RB1_bit+0, 1
;prueba_banco_relee.mbas,35 :: 		rele2 = 0
	BCF        RA3_bit+0, 3
;prueba_banco_relee.mbas,36 :: 		rele3 = 0
	BCF        RC2_bit+0, 2
;prueba_banco_relee.mbas,37 :: 		rele4 = 0
	BCF        RA4_bit+0, 4
;prueba_banco_relee.mbas,38 :: 		rele5 = 0
	BCF        RC1_bit+0, 1
;prueba_banco_relee.mbas,39 :: 		rele6 = 0
	BCF        RA2_bit+0, 2
;prueba_banco_relee.mbas,40 :: 		rele7 = 0
	BCF        RA5_bit+0, 5
;prueba_banco_relee.mbas,41 :: 		rele8 = 0
	BCF        RB2_bit+0, 2
;prueba_banco_relee.mbas,44 :: 		ANSEL  = 0
	CLRF       ANSEL+0
;prueba_banco_relee.mbas,45 :: 		ANSELH = 0
	CLRF       ANSELH+0
;prueba_banco_relee.mbas,48 :: 		while TRUE
L__main2:
;prueba_banco_relee.mbas,49 :: 		rele1 = not rele1
	MOVLW      2
	XORWF      RB1_bit+0, 1
;prueba_banco_relee.mbas,50 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,51 :: 		rele2 = not rele2
	MOVLW      8
	XORWF      RA3_bit+0, 1
;prueba_banco_relee.mbas,52 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,53 :: 		rele3 = not rele3
	MOVLW      4
	XORWF      RC2_bit+0, 1
;prueba_banco_relee.mbas,54 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,55 :: 		rele4 = not rele4
	MOVLW      16
	XORWF      RA4_bit+0, 1
;prueba_banco_relee.mbas,56 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,57 :: 		rele5 = not rele5
	MOVLW      2
	XORWF      RC1_bit+0, 1
;prueba_banco_relee.mbas,58 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,59 :: 		rele6 = not rele6
	MOVLW      4
	XORWF      RA2_bit+0, 1
;prueba_banco_relee.mbas,60 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,61 :: 		rele7 = not rele7
	MOVLW      32
	XORWF      RA5_bit+0, 1
;prueba_banco_relee.mbas,62 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,63 :: 		rele8 = not rele8
	MOVLW      4
	XORWF      RB2_bit+0, 1
;prueba_banco_relee.mbas,64 :: 		Delay_1sec
	CALL       _Delay_1sec+0
;prueba_banco_relee.mbas,65 :: 		wend
	GOTO       L__main2
	GOTO       $+0
; end of _main
