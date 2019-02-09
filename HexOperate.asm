 TITLE HEX_OPERATE
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    MAIN PROC   
        MOV AX,DATA	
	    MOV DS,AX	
           
        LEA DX,WELCOME
        MOV AH,9
        INT 21H    
  
        INOPUT1:        
        LEA DX,MESSAGE
        MOV AH,9
        INT 21H
        
        MOV AH,08
        INT 21H
  
        CMP AL,'0' 
        JB INOPUT1
        
        CMP AL,'9'
        JBE STORE1
        
        CMP AL,'A'
        JB INOPUT1
        
        CMP AL,'F'
        JA INOPUT1
        
        STORE1:
        MOV BL,AL   ;EMFANISE TON PROTO ARITHMO
        MOV DL,BL
        MOV AH,02
        INT 21H
        
        CMP BL,'9'   ;KANTON ARITHMO
        JBE NUMBER
        SUB BL,48
        SUB BL,7
        JMP NEXT1   ;PANE STO DEUTERO DIAVASMA
        
        NUMBER:
        SUB BL,48
        
        NEXT1: 
        
        INPUT2:       
        LEA DX,MESSAGE   ;ZITA DEUTERO ARITHMO
        MOV AH,9
        INT 21H
        
        MOV AH,08
        INT 21H
  
        CMP AL,'0'
        JB INPUT2
        
        CMP AL,'9'
        JBE STORE2
        
        CMP AL,'A'
        JB INPUT2
        
        CMP AL,'F'
        JA INPUT2
        
        STORE2:         
        MOV BH,AL  ;EMFANISE TON DEUTERO ARITHMO
        MOV DL,BH
        MOV AH,02
        INT 21H
        
        CMP BH,'9'     ;KANTON ARITHMO
        JBE NUMBER2
        SUB BH,48
        SUB BH,7
        JMP NEXT2
        
        NUMBER2:
        SUB BH,48
        
        NEXT2:      ;DIAVASE TON OPERATOR
        
        INPUT_OPERATOR:
        LEA DX,OPERATOR
        MOV AH,9
        INT 21H     
         
        MOV AH,08
        INT 21H
  
        CMP AL,'+'
        JE STORE3
        
        CMP AL,'*'
        JE STORE3
        
        JMP INPUT_OPERATOR
        
        STORE3:
        MOV CH,AL  ;EMFANISE TON OPERATOR
        MOV DL,CH
        MOV AH,02
        INT 21H
        
        PRINT:
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        CMP CH,'+'
        JE ADD_OPERATOR 
        MOV AH,0
        MOV AL,BL
        MUL BH
        MOV BL,AL
        JMP NEXT3
        
        ADD_OPERATOR:
        MOV AL,BL
        ADD AL,BH
        MOV BL,AL
        
        
        NEXT3:                 ;O BL EXEI TON PROTO,O BH EXEI TON DEUTERO,O CH EXEI TO OPERATOR
        CALL DISPLAY_DEC       ;O BL EXEI TO APOTELESMA
        
         
        MOV AH,4CH
        INT 21H
	
MAIN ENDP
DISPLAY_DEC PROC
    CMP BL,99       ;O BL EXEI TON ARITHMO
    JA TRIPSIFIOS
    
    CMP BL,9
    JA DIPSIFIOS
    
    MOV DL,BL ;MONOPSIFIOS
    ADD DL,48 
    MOV AH,02
    INT 21H     
    JMP TELOS
    
    DIPSIFIOS:
    MOV CL,10
    MOV AH,0
    MOV AL,BL
    DIV CL
    
    MOV BL,AL
    MOV BH,AH
    
    MOV DL,BL
    ADD DL,48
    MOV AH,02
    INT 21H
    
    MOV DL,BH
    ADD DL,48
    MOV AH,02
    INT 21H    
    JMP TELOS
    
    TRIPSIFIOS:
    MOV CL,10
    MOV AL,BL
    DIV CL
    
    MOV BH,AH  ;TO 3O PSIFIO
    
    MOV AH,0   ;ARXIKOPOIHSE
    DIV CL
    MOV CH,AH  ;TO 2O PSIFIO
    MOV CL,AL  ;TO 1O PSIFIO
    
    MOV DL,CL
    ADD DL,48
    MOV AH,02
    INT 21H
    
    MOV DL,CH
    ADD DL,48
    MOV AH,02
    INT 21H
    
    MOV DL,BH
    ADD DL,48
    MOV AH,02
    INT 21H
 
    TELOS:
    
    RET
DISPLAY_DEC ENDP    
DATA SEGMENT  
    WELCOME DB 10,13,"   --== WELCOME ==--$"
    MESSAGE DB 10,13,"Please give a hexadecimal (0-9 A-F): $"
    NEWLINE DB 10,13,"$" 
    OPERATOR DB 10,13,"Please type the operation between those two hex ( + OR * ) : $"
    NOINPUTMIN DB "NO INPUT!!!$"
DATA ENDS


    END CODE 
