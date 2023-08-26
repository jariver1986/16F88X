
HTTP_Demo_Spi_Ethernet_UserTCP:

;HTTP_Demo.mbas,159 :: 		txt         as string[11]
;HTTP_Demo.mbas,160 :: 		result = 0
	CLRF        Spi_Ethernet_UserTCP_local_result+0 
	CLRF        Spi_Ethernet_UserTCP_local_result+1 
;HTTP_Demo.mbas,167 :: 		if(localPort <> 80) then          ' I listen only to web request on port 80
	MOVLW       0
	XORWF       FARG_Spi_Ethernet_UserTCP_localPort+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP41
	MOVLW       80
	XORWF       FARG_Spi_Ethernet_UserTCP_localPort+0, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP41:
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP2
;HTTP_Demo.mbas,168 :: 		result = 0
	CLRF        Spi_Ethernet_UserTCP_local_result+0 
	CLRF        Spi_Ethernet_UserTCP_local_result+1 
;HTTP_Demo.mbas,169 :: 		exit
	GOTO        L_end_HTTP_Demo_Spi_Ethernet_UserTCP
L_HTTP_Demo_Spi_Ethernet_UserTCP2:
;HTTP_Demo.mbas,173 :: 		for i = 0 to 10
	CLRF        Spi_Ethernet_UserTCP_i+0 
	CLRF        Spi_Ethernet_UserTCP_i+1 
L_HTTP_Demo_Spi_Ethernet_UserTCP5:
;HTTP_Demo.mbas,174 :: 		getRequest[i] = Spi_Ethernet_getByte()
	MOVLW       _getRequest+0
	MOVWF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1 
	MOVF        Spi_Ethernet_UserTCP_i+0, 0 
	ADDWF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 1 
	CALL        _SPI_Ethernet_getByte+0, 0
	MOVFF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, FSR1
	MOVFF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.mbas,175 :: 		next i
	MOVLW       0
	XORWF       Spi_Ethernet_UserTCP_i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP42
	MOVLW       10
	XORWF       Spi_Ethernet_UserTCP_i+0, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP42:
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP8
	INFSNZ      Spi_Ethernet_UserTCP_i+0, 1 
	INCF        Spi_Ethernet_UserTCP_i+1, 1 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP5
L_HTTP_Demo_Spi_Ethernet_UserTCP8:
;HTTP_Demo.mbas,177 :: 		getRequest[i] = 0
	MOVLW       _getRequest+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FSR1H 
	MOVF        Spi_Ethernet_UserTCP_i+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,180 :: 		for i = 0 to 4
	CLRF        Spi_Ethernet_UserTCP_i+0 
	CLRF        Spi_Ethernet_UserTCP_i+1 
L_HTTP_Demo_Spi_Ethernet_UserTCP10:
;HTTP_Demo.mbas,181 :: 		txt[i] = httpMethod[i]
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       R0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       R1 
	MOVF        Spi_Ethernet_UserTCP_i+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       _httpMethod+0
	ADDWF       Spi_Ethernet_UserTCP_i+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_httpMethod+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_httpMethod+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.mbas,182 :: 		next i
	MOVLW       0
	XORWF       Spi_Ethernet_UserTCP_i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP43
	MOVLW       4
	XORWF       Spi_Ethernet_UserTCP_i+0, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP43:
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP13
	INFSNZ      Spi_Ethernet_UserTCP_i+0, 1 
	INCF        Spi_Ethernet_UserTCP_i+1, 1 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP10
L_HTTP_Demo_Spi_Ethernet_UserTCP13:
;HTTP_Demo.mbas,184 :: 		if(memcmp(@getRequest, @txt, 5) <> 0) then  ' only GET method is supported here
	MOVLW       _getRequest+0
	MOVWF       FARG_memcmp_p1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_memcmp_p1+1 
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_memcmp_p2+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_memcmp_p2+1 
	MOVLW       5
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP44
	MOVLW       0
	XORWF       R0, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP44:
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP15
;HTTP_Demo.mbas,185 :: 		result = 0
	CLRF        Spi_Ethernet_UserTCP_local_result+0 
	CLRF        Spi_Ethernet_UserTCP_local_result+1 
;HTTP_Demo.mbas,186 :: 		exit
	GOTO        L_end_HTTP_Demo_Spi_Ethernet_UserTCP
L_HTTP_Demo_Spi_Ethernet_UserTCP15:
;HTTP_Demo.mbas,189 :: 		Inc(httpCounter)                           ' one more request done
	INFSNZ      _httpCounter+0, 1 
	INCF        _httpCounter+1, 1 
;HTTP_Demo.mbas,191 :: 		if(getRequest[5] = "s") then               ' if request path name starts with s, store dynamic data in transmit buffer
	MOVF        _getRequest+5, 0 
	XORLW       115
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP18
;HTTP_Demo.mbas,195 :: 		result = SPI_Ethernet_putConstString(@httpHeader)                    ' HTTP header
	MOVLW       _httpHeader+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	MOVWF       Spi_Ethernet_UserTCP_local_result+0 
	MOVF        R1, 0 
	MOVWF       Spi_Ethernet_UserTCP_local_result+1 
;HTTP_Demo.mbas,196 :: 		result = result + SPI_Ethernet_putConstString(@httpMimeTypeScript)   ' with text MIME type
	MOVLW       _httpMimeTypeScript+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpMimeTypeScript+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpMimeTypeScript+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,199 :: 		WordToStr(ADC_Read(2), dyna)
	MOVLW       2
	MOVWF       FARG_Adc_Read_channel+0 
	CALL        _Adc_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,200 :: 		txt  = "var AN2="
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FSR1H 
	MOVLW       118
	MOVWF       POSTINC1+0 
	MOVLW       97
	MOVWF       POSTINC1+0 
	MOVLW       114
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       78
	MOVWF       POSTINC1+0 
	MOVLW       50
	MOVWF       POSTINC1+0 
	MOVLW       61
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,201 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,202 :: 		result = result + Spi_Ethernet_putString(@dyna)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,203 :: 		txt  = ";"
	MOVLW       59
	MOVWF       Spi_Ethernet_UserTCP_txt+0 
	CLRF        Spi_Ethernet_UserTCP_txt+1 
;HTTP_Demo.mbas,204 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,207 :: 		WordToStr(ADC_Read(3), dyna)
	MOVLW       3
	MOVWF       FARG_Adc_Read_channel+0 
	CALL        _Adc_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,208 :: 		txt  = "var AN3="
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FSR1H 
	MOVLW       118
	MOVWF       POSTINC1+0 
	MOVLW       97
	MOVWF       POSTINC1+0 
	MOVLW       114
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       65
	MOVWF       POSTINC1+0 
	MOVLW       78
	MOVWF       POSTINC1+0 
	MOVLW       51
	MOVWF       POSTINC1+0 
	MOVLW       61
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,209 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,210 :: 		result = result + Spi_Ethernet_putString(@dyna)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,211 :: 		txt  = ";"
	MOVLW       59
	MOVWF       Spi_Ethernet_UserTCP_txt+0 
	CLRF        Spi_Ethernet_UserTCP_txt+1 
;HTTP_Demo.mbas,212 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,215 :: 		txt  = "var PORTB="
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FSR1H 
	MOVLW       118
	MOVWF       POSTINC1+0 
	MOVLW       97
	MOVWF       POSTINC1+0 
	MOVLW       114
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       80
	MOVWF       POSTINC1+0 
	MOVLW       79
	MOVWF       POSTINC1+0 
	MOVLW       82
	MOVWF       POSTINC1+0 
	MOVLW       84
	MOVWF       POSTINC1+0 
	MOVLW       66
	MOVWF       POSTINC1+0 
	MOVLW       61
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,216 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,217 :: 		WordToStr(PORTB, dyna)
	MOVF        PORTB+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,218 :: 		result = result + Spi_Ethernet_putString(@dyna)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,219 :: 		txt  = ";"
	MOVLW       59
	MOVWF       Spi_Ethernet_UserTCP_txt+0 
	CLRF        Spi_Ethernet_UserTCP_txt+1 
;HTTP_Demo.mbas,220 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,223 :: 		txt  = "var PORTD="
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FSR1H 
	MOVLW       118
	MOVWF       POSTINC1+0 
	MOVLW       97
	MOVWF       POSTINC1+0 
	MOVLW       114
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       80
	MOVWF       POSTINC1+0 
	MOVLW       79
	MOVWF       POSTINC1+0 
	MOVLW       82
	MOVWF       POSTINC1+0 
	MOVLW       84
	MOVWF       POSTINC1+0 
	MOVLW       68
	MOVWF       POSTINC1+0 
	MOVLW       61
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,224 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,225 :: 		WordToStr(PORTD, dyna)
	MOVF        PORTD+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,226 :: 		result = result + Spi_Ethernet_putString(@dyna)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,227 :: 		txt  = ";"
	MOVLW       59
	MOVWF       Spi_Ethernet_UserTCP_txt+0 
	CLRF        Spi_Ethernet_UserTCP_txt+1 
;HTTP_Demo.mbas,228 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,231 :: 		WordToStr(httpCounter, dyna)
	MOVF        _httpCounter+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _httpCounter+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,232 :: 		txt  = "var REQ="
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FSR1 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FSR1H 
	MOVLW       118
	MOVWF       POSTINC1+0 
	MOVLW       97
	MOVWF       POSTINC1+0 
	MOVLW       114
	MOVWF       POSTINC1+0 
	MOVLW       32
	MOVWF       POSTINC1+0 
	MOVLW       82
	MOVWF       POSTINC1+0 
	MOVLW       69
	MOVWF       POSTINC1+0 
	MOVLW       81
	MOVWF       POSTINC1+0 
	MOVLW       61
	MOVWF       POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.mbas,233 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+0, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVF        FLOC_HTTP_Demo_Spi_Ethernet_UserTCP+1, 0 
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,234 :: 		result = result + Spi_Ethernet_putString(@dyna)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,235 :: 		txt  = ";"
	MOVLW       59
	MOVWF       Spi_Ethernet_UserTCP_txt+0 
	CLRF        Spi_Ethernet_UserTCP_txt+1 
;HTTP_Demo.mbas,236 :: 		result = result + Spi_Ethernet_putString(@txt)
	MOVLW       Spi_Ethernet_UserTCP_txt+0
	MOVWF       FARG_SPI_Ethernet_putString_ptr+0 
	MOVLW       hi_addr(Spi_Ethernet_UserTCP_txt+0)
	MOVWF       FARG_SPI_Ethernet_putString_ptr+1 
	CALL        _SPI_Ethernet_putString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP19
;HTTP_Demo.mbas,237 :: 		else
L_HTTP_Demo_Spi_Ethernet_UserTCP18:
;HTTP_Demo.mbas,238 :: 		if(getRequest[5] = "t") then                         ' if request path name starts with t, toggle PORTD (LED) bit number that comes after
	MOVF        _getRequest+5, 0 
	XORLW       116
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP21
;HTTP_Demo.mbas,240 :: 		if(isdigit(getRequest[6]) <> 0) then               ' if 0 <= bit number <= 9, bits 8 & 9 does not exist but does not matter
	MOVF        _getRequest+6, 0 
	MOVWF       FARG_isdigit_character+0 
	CALL        _isdigit+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP24
;HTTP_Demo.mbas,241 :: 		bitMask = getRequest[6] - "0"                    ' convert ASCII to integer
	MOVLW       48
	SUBWF       _getRequest+6, 0 
	MOVWF       R0 
;HTTP_Demo.mbas,242 :: 		bitMask = 1 << bitMask                           ' create bit mask
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP45:
	BZ          L_HTTP_Demo_Spi_Ethernet_UserTCP46
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP45
L_HTTP_Demo_Spi_Ethernet_UserTCP46:
;HTTP_Demo.mbas,243 :: 		PORTD   = PORTD xor bitMask                      ' toggle PORTD with xor operator
	MOVF        R0, 0 
	XORWF       PORTD+0, 1 
L_HTTP_Demo_Spi_Ethernet_UserTCP24:
;HTTP_Demo.mbas,244 :: 		end if
L_HTTP_Demo_Spi_Ethernet_UserTCP21:
;HTTP_Demo.mbas,246 :: 		end if
L_HTTP_Demo_Spi_Ethernet_UserTCP19:
;HTTP_Demo.mbas,248 :: 		if(result = 0) then ' what do to by default
	MOVLW       0
	XORWF       Spi_Ethernet_UserTCP_local_result+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP47
	MOVLW       0
	XORWF       Spi_Ethernet_UserTCP_local_result+0, 0 
L_HTTP_Demo_Spi_Ethernet_UserTCP47:
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserTCP27
;HTTP_Demo.mbas,249 :: 		result = SPI_Ethernet_putConstString(@httpHeader)                  ' HTTP header
	MOVLW       _httpHeader+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpHeader+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	MOVWF       Spi_Ethernet_UserTCP_local_result+0 
	MOVF        R1, 0 
	MOVWF       Spi_Ethernet_UserTCP_local_result+1 
;HTTP_Demo.mbas,250 :: 		result = result + SPI_Ethernet_putConstString(@httpMimeTypeHTML)   ' with HTML MIME type
	MOVLW       _httpMimeTypeHTML+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_httpMimeTypeHTML+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_httpMimeTypeHTML+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,251 :: 		result = result + SPI_Ethernet_putConstString(@indexPage)          ' HTML page first part
	MOVLW       _indexPage+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_indexPage+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_indexPage+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
;HTTP_Demo.mbas,252 :: 		result = result + SPI_Ethernet_putConstString(@indexPage2)         ' HTML page second part
	MOVLW       _indexPage2+0
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+0 
	MOVLW       hi_addr(_indexPage2+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+1 
	MOVLW       higher_addr(_indexPage2+0)
	MOVWF       FARG_SPI_Ethernet_putConstString_ptr+2 
	CALL        _SPI_Ethernet_putConstString+0, 0
	MOVF        R0, 0 
	ADDWF       Spi_Ethernet_UserTCP_local_result+0, 1 
	MOVF        R1, 0 
	ADDWFC      Spi_Ethernet_UserTCP_local_result+1, 1 
L_HTTP_Demo_Spi_Ethernet_UserTCP27:
;HTTP_Demo.mbas,253 :: 		end if
L_end_HTTP_Demo_Spi_Ethernet_UserTCP:
	MOVF        Spi_Ethernet_UserTCP_local_result+0, 0 
	MOVWF       R0 
	MOVF        Spi_Ethernet_UserTCP_local_result+1, 0 
	MOVWF       R1 
	RETURN      0
; end of HTTP_Demo_Spi_Ethernet_UserTCP

HTTP_Demo_Spi_Ethernet_UserUDP:

;HTTP_Demo.mbas,270 :: 		dim txt as string[5]
;HTTP_Demo.mbas,271 :: 		result = 0
	CLRF        Spi_Ethernet_UserUDP_local_result+0 
	CLRF        Spi_Ethernet_UserUDP_local_result+1 
;HTTP_Demo.mbas,273 :: 		byteToStr(remoteHost[0], dyna)            ' first IP address byte
	MOVFF       FARG_Spi_Ethernet_UserUDP_remoteHost+0, FSR0
	MOVFF       FARG_Spi_Ethernet_UserUDP_remoteHost+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.mbas,274 :: 		dyna[3] = "."
	MOVLW       46
	MOVWF       _dyna+3 
;HTTP_Demo.mbas,275 :: 		byteToStr(remoteHost[1], txt)             ' second
	MOVLW       1
	ADDWF       FARG_Spi_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Spi_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       Spi_Ethernet_UserUDP_txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(Spi_Ethernet_UserUDP_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.mbas,276 :: 		dyna[4] = txt[0]
	MOVF        Spi_Ethernet_UserUDP_txt+0, 0 
	MOVWF       _dyna+4 
;HTTP_Demo.mbas,277 :: 		dyna[5] = txt[1]
	MOVF        Spi_Ethernet_UserUDP_txt+1, 0 
	MOVWF       _dyna+5 
;HTTP_Demo.mbas,278 :: 		dyna[6] = txt[2]
	MOVF        Spi_Ethernet_UserUDP_txt+2, 0 
	MOVWF       _dyna+6 
;HTTP_Demo.mbas,279 :: 		dyna[7] = "."
	MOVLW       46
	MOVWF       _dyna+7 
;HTTP_Demo.mbas,280 :: 		byteToStr(remoteHost[2], txt)             ' second
	MOVLW       2
	ADDWF       FARG_Spi_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Spi_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       Spi_Ethernet_UserUDP_txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(Spi_Ethernet_UserUDP_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.mbas,281 :: 		dyna[8]  = txt[0]
	MOVF        Spi_Ethernet_UserUDP_txt+0, 0 
	MOVWF       _dyna+8 
;HTTP_Demo.mbas,282 :: 		dyna[9]  = txt[1]
	MOVF        Spi_Ethernet_UserUDP_txt+1, 0 
	MOVWF       _dyna+9 
;HTTP_Demo.mbas,283 :: 		dyna[10] = txt[2]
	MOVF        Spi_Ethernet_UserUDP_txt+2, 0 
	MOVWF       _dyna+10 
;HTTP_Demo.mbas,285 :: 		dyna[11] = "."
	MOVLW       46
	MOVWF       _dyna+11 
;HTTP_Demo.mbas,286 :: 		byteToStr(remoteHost[3], txt)             ' second
	MOVLW       3
	ADDWF       FARG_Spi_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Spi_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       Spi_Ethernet_UserUDP_txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(Spi_Ethernet_UserUDP_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.mbas,287 :: 		dyna[12] = txt[0]
	MOVF        Spi_Ethernet_UserUDP_txt+0, 0 
	MOVWF       _dyna+12 
;HTTP_Demo.mbas,288 :: 		dyna[13] = txt[1]
	MOVF        Spi_Ethernet_UserUDP_txt+1, 0 
	MOVWF       _dyna+13 
;HTTP_Demo.mbas,289 :: 		dyna[14] = txt[2]
	MOVF        Spi_Ethernet_UserUDP_txt+2, 0 
	MOVWF       _dyna+14 
;HTTP_Demo.mbas,291 :: 		dyna[15] = ":"                            ' add separator
	MOVLW       58
	MOVWF       _dyna+15 
;HTTP_Demo.mbas,294 :: 		WordToStr(remotePort, txt)
	MOVF        FARG_Spi_Ethernet_UserUDP_remotePort+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        FARG_Spi_Ethernet_UserUDP_remotePort+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Spi_Ethernet_UserUDP_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Spi_Ethernet_UserUDP_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,295 :: 		dyna[16] = txt[0]
	MOVF        Spi_Ethernet_UserUDP_txt+0, 0 
	MOVWF       _dyna+16 
;HTTP_Demo.mbas,296 :: 		dyna[17] = txt[1]
	MOVF        Spi_Ethernet_UserUDP_txt+1, 0 
	MOVWF       _dyna+17 
;HTTP_Demo.mbas,297 :: 		dyna[18] = txt[2]
	MOVF        Spi_Ethernet_UserUDP_txt+2, 0 
	MOVWF       _dyna+18 
;HTTP_Demo.mbas,298 :: 		dyna[19] = txt[3]
	MOVF        Spi_Ethernet_UserUDP_txt+3, 0 
	MOVWF       _dyna+19 
;HTTP_Demo.mbas,299 :: 		dyna[20] = txt[4]
	MOVF        Spi_Ethernet_UserUDP_txt+4, 0 
	MOVWF       _dyna+20 
;HTTP_Demo.mbas,300 :: 		dyna[21] = "["
	MOVLW       91
	MOVWF       _dyna+21 
;HTTP_Demo.mbas,301 :: 		WordToStr(destPort, txt)
	MOVF        FARG_Spi_Ethernet_UserUDP_destPort+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        FARG_Spi_Ethernet_UserUDP_destPort+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       Spi_Ethernet_UserUDP_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(Spi_Ethernet_UserUDP_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.mbas,302 :: 		dyna[22] = txt[0]
	MOVF        Spi_Ethernet_UserUDP_txt+0, 0 
	MOVWF       _dyna+22 
;HTTP_Demo.mbas,303 :: 		dyna[23] = txt[1]
	MOVF        Spi_Ethernet_UserUDP_txt+1, 0 
	MOVWF       _dyna+23 
;HTTP_Demo.mbas,304 :: 		dyna[24] = txt[2]
	MOVF        Spi_Ethernet_UserUDP_txt+2, 0 
	MOVWF       _dyna+24 
;HTTP_Demo.mbas,305 :: 		dyna[25] = txt[3]
	MOVF        Spi_Ethernet_UserUDP_txt+3, 0 
	MOVWF       _dyna+25 
;HTTP_Demo.mbas,306 :: 		dyna[26] = txt[4]
	MOVF        Spi_Ethernet_UserUDP_txt+4, 0 
	MOVWF       _dyna+26 
;HTTP_Demo.mbas,307 :: 		dyna[27] = "]"
	MOVLW       93
	MOVWF       _dyna+27 
;HTTP_Demo.mbas,308 :: 		dyna[28] = 0
	CLRF        _dyna+28 
;HTTP_Demo.mbas,311 :: 		result = 28 + reqLength
	MOVLW       28
	ADDWF       FARG_Spi_Ethernet_UserUDP_reqLength+0, 0 
	MOVWF       Spi_Ethernet_UserUDP_local_result+0 
	MOVLW       0
	ADDWFC      FARG_Spi_Ethernet_UserUDP_reqLength+1, 0 
	MOVWF       Spi_Ethernet_UserUDP_local_result+1 
;HTTP_Demo.mbas,314 :: 		Spi_Ethernet_putBytes(@dyna, 28)
	MOVLW       _dyna+0
	MOVWF       FARG_SPI_Ethernet_putBytes_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_SPI_Ethernet_putBytes_ptr+1 
	MOVLW       28
	MOVWF       FARG_SPI_Ethernet_putBytes_n+0 
	MOVLW       0
	MOVWF       FARG_SPI_Ethernet_putBytes_n+1 
	CALL        _SPI_Ethernet_putBytes+0, 0
;HTTP_Demo.mbas,317 :: 		while(reqLength <> 0)
L_HTTP_Demo_Spi_Ethernet_UserUDP31:
	MOVLW       0
	XORWF       FARG_Spi_Ethernet_UserUDP_reqLength+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserUDP48
	MOVLW       0
	XORWF       FARG_Spi_Ethernet_UserUDP_reqLength+0, 0 
L_HTTP_Demo_Spi_Ethernet_UserUDP48:
	BTFSC       STATUS+0, 2 
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserUDP32
;HTTP_Demo.mbas,318 :: 		Spi_Ethernet_putByte(Spi_Ethernet_getByte())
	CALL        _SPI_Ethernet_getByte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_SPI_Ethernet_putByte_v+0 
	CALL        _SPI_Ethernet_putByte+0, 0
;HTTP_Demo.mbas,319 :: 		reqLength = reqLength - 1
	MOVLW       1
	SUBWF       FARG_Spi_Ethernet_UserUDP_reqLength+0, 1 
	MOVLW       0
	SUBWFB      FARG_Spi_Ethernet_UserUDP_reqLength+1, 1 
;HTTP_Demo.mbas,320 :: 		wend
	GOTO        L_HTTP_Demo_Spi_Ethernet_UserUDP31
L_HTTP_Demo_Spi_Ethernet_UserUDP32:
	MOVF        Spi_Ethernet_UserUDP_local_result+0, 0 
	MOVWF       R0 
	MOVF        Spi_Ethernet_UserUDP_local_result+1, 0 
	MOVWF       R1 
	RETURN      0
; end of HTTP_Demo_Spi_Ethernet_UserUDP

_main:

;HTTP_Demo.mbas,325 :: 		main:
;HTTP_Demo.mbas,326 :: 		ADCON1 = 0x0B           ' ADC convertors will be used with AN2 and AN3
	MOVLW       11
	MOVWF       ADCON1+0 
;HTTP_Demo.mbas,327 :: 		CMCON  = 0x07           ' turn off comparators
	MOVLW       7
	MOVWF       CMCON+0 
;HTTP_Demo.mbas,329 :: 		PORTA  = 0
	CLRF        PORTA+0 
;HTTP_Demo.mbas,330 :: 		TRISA  = 0xFF           ' set PORTA as input for ADC
	MOVLW       255
	MOVWF       TRISA+0 
;HTTP_Demo.mbas,332 :: 		PORTB  = 0
	CLRF        PORTB+0 
;HTTP_Demo.mbas,333 :: 		TRISB  = 0xFF           ' set PORTB as input for buttons
	MOVLW       255
	MOVWF       TRISB+0 
;HTTP_Demo.mbas,335 :: 		PORTD  = 0
	CLRF        PORTD+0 
;HTTP_Demo.mbas,336 :: 		TRISD  = 0              ' set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.mbas,338 :: 		httpCounter = 0
	CLRF        _httpCounter+0 
	CLRF        _httpCounter+1 
;HTTP_Demo.mbas,341 :: 		myMacAddr[0] = 0x00
	CLRF        _myMacAddr+0 
;HTTP_Demo.mbas,342 :: 		myMacAddr[1] = 0x14
	MOVLW       20
	MOVWF       _myMacAddr+1 
;HTTP_Demo.mbas,343 :: 		myMacAddr[2] = 0xA5
	MOVLW       165
	MOVWF       _myMacAddr+2 
;HTTP_Demo.mbas,344 :: 		myMacAddr[3] = 0x76
	MOVLW       118
	MOVWF       _myMacAddr+3 
;HTTP_Demo.mbas,345 :: 		myMacAddr[4] = 0x19
	MOVLW       25
	MOVWF       _myMacAddr+4 
;HTTP_Demo.mbas,346 :: 		myMacAddr[5] = 0x3F
	MOVLW       63
	MOVWF       _myMacAddr+5 
;HTTP_Demo.mbas,349 :: 		myIpAddr[0] = 192
	MOVLW       192
	MOVWF       _myIpAddr+0 
;HTTP_Demo.mbas,350 :: 		myIpAddr[1] = 168
	MOVLW       168
	MOVWF       _myIpAddr+1 
;HTTP_Demo.mbas,351 :: 		myIpAddr[2] = 20
	MOVLW       20
	MOVWF       _myIpAddr+2 
;HTTP_Demo.mbas,352 :: 		myIpAddr[3] = 60
	MOVLW       60
	MOVWF       _myIpAddr+3 
;HTTP_Demo.mbas,355 :: 		gwIpAddr[0]  = 192
	MOVLW       192
	MOVWF       _gwIpAddr+0 
;HTTP_Demo.mbas,356 :: 		gwIpAddr[1]  = 168
	MOVLW       168
	MOVWF       _gwIpAddr+1 
;HTTP_Demo.mbas,357 :: 		gwIpAddr[2]  = 20
	MOVLW       20
	MOVWF       _gwIpAddr+2 
;HTTP_Demo.mbas,358 :: 		gwIpAddr[3]  = 6
	MOVLW       6
	MOVWF       _gwIpAddr+3 
;HTTP_Demo.mbas,361 :: 		dnsIpAddr[0] = 192
	MOVLW       192
	MOVWF       _dnsIpAddr+0 
;HTTP_Demo.mbas,362 :: 		dnsIpAddr[1] = 168
	MOVLW       168
	MOVWF       _dnsIpAddr+1 
;HTTP_Demo.mbas,363 :: 		dnsIpAddr[2] = 20
	MOVLW       20
	MOVWF       _dnsIpAddr+2 
;HTTP_Demo.mbas,364 :: 		dnsIpAddr[3] = 1
	MOVLW       1
	MOVWF       _dnsIpAddr+3 
;HTTP_Demo.mbas,367 :: 		ipMask[0]    = 255
	MOVLW       255
	MOVWF       _ipMask+0 
;HTTP_Demo.mbas,368 :: 		ipMask[1]    = 255
	MOVLW       255
	MOVWF       _ipMask+1 
;HTTP_Demo.mbas,369 :: 		ipMask[2]    = 255
	MOVLW       255
	MOVWF       _ipMask+2 
;HTTP_Demo.mbas,370 :: 		ipMask[3]    = 0
	CLRF        _ipMask+3 
;HTTP_Demo.mbas,380 :: 		SPI1_Init()  ' init spi module
	CALL        _SPI1_Init+0, 0
;HTTP_Demo.mbas,381 :: 		SPI_Ethernet_Init(myMacAddr, myIpAddr, _SPI_Ethernet_FULLDUPLEX)           ' init ethernet module
	MOVLW       _myMacAddr+0
	MOVWF       FARG_SPI_Ethernet_Init_mac+0 
	MOVLW       hi_addr(_myMacAddr+0)
	MOVWF       FARG_SPI_Ethernet_Init_mac+1 
	MOVLW       _myIpAddr+0
	MOVWF       FARG_SPI_Ethernet_Init_ip+0 
	MOVLW       hi_addr(_myIpAddr+0)
	MOVWF       FARG_SPI_Ethernet_Init_ip+1 
	MOVLW       1
	MOVWF       FARG_SPI_Ethernet_Init_fullDuplex+0 
	CALL        _SPI_Ethernet_Init+0, 0
;HTTP_Demo.mbas,382 :: 		SPI_Ethernet_setUserHandlers(@SPI_Ethernet_UserTCP, @SPI_Ethernet_UserUDP) ' set user handlers
	MOVLW       HTTP_Demo_Spi_Ethernet_UserTCP+0
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_TCPHandler+0 
	MOVLW       hi_addr(HTTP_Demo_Spi_Ethernet_UserTCP+0)
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_TCPHandler+1 
	MOVLW       FARG_Spi_Ethernet_UserTCP_remoteHost+0
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_TCPHandler+2 
	MOVLW       hi_addr(FARG_Spi_Ethernet_UserTCP_remoteHost+0)
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_TCPHandler+3 
	MOVLW       HTTP_Demo_Spi_Ethernet_UserUDP+0
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_UDPHandler+0 
	MOVLW       hi_addr(HTTP_Demo_Spi_Ethernet_UserUDP+0)
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_UDPHandler+1 
	MOVLW       FARG_Spi_Ethernet_UserUDP_remoteHost+0
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_UDPHandler+2 
	MOVLW       hi_addr(FARG_Spi_Ethernet_UserUDP_remoteHost+0)
	MOVWF       FARG_SPI_Ethernet_setUserHandlers_UDPHandler+3 
	CALL        _SPI_Ethernet_setUserHandlers+0, 0
;HTTP_Demo.mbas,385 :: 		SPI_Ethernet_confNetwork(ipMask, gwIpAddr, dnsIpAddr)
	MOVLW       _ipMask+0
	MOVWF       FARG_SPI_Ethernet_confNetwork_ipMask+0 
	MOVLW       hi_addr(_ipMask+0)
	MOVWF       FARG_SPI_Ethernet_confNetwork_ipMask+1 
	MOVLW       _gwIpAddr+0
	MOVWF       FARG_SPI_Ethernet_confNetwork_gwIpAddr+0 
	MOVLW       hi_addr(_gwIpAddr+0)
	MOVWF       FARG_SPI_Ethernet_confNetwork_gwIpAddr+1 
	MOVLW       _dnsIpAddr+0
	MOVWF       FARG_SPI_Ethernet_confNetwork_dnsIpAddr+0 
	MOVLW       hi_addr(_dnsIpAddr+0)
	MOVWF       FARG_SPI_Ethernet_confNetwork_dnsIpAddr+1 
	CALL        _SPI_Ethernet_confNetwork+0, 0
;HTTP_Demo.mbas,387 :: 		while TRUE                      ' do forever
L__main37:
;HTTP_Demo.mbas,388 :: 		SPI_Ethernet_doPacket()       ' process incoming Ethernet packets
	CALL        _SPI_Ethernet_doPacket+0, 0
;HTTP_Demo.mbas,395 :: 		wend
	GOTO        L__main37
	GOTO        $+0
; end of _main
