 TITLE SORT_NUMBERS
KODIKAS SEGMENT
    ASSUME CS:MAIN, DS:DATA
    MAIN PROC   
        MOV AX,DATA	
	    MOV DS,AX	  
	    
	    LEA DX,WELCOME
        MOV AH,9
        INT 21H 

        CALL METHOD
        
        MOV CL,BL
        
        CALL METHOD
        
        MOV CH,BL
        
        CALL METHOD
        
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        MOV DH,BL
        
        MOV BL,CL
        MOV BH,CH
        
        CALL FIND_MAX
        
        MOV BL,DH
        MOV BH,BH ;PERITO
        
        CALL FIND_MAX
        
        MOV DL,BH     ;TO MAX
        MOV AH,02
        INT 21H
        
        CMP CL,BH
        JE CL_MAX
        
        CMP CH,BH
        JE CH_MAX
        
        CMP DH,BH
        JE DH_MAX
        
        
        CL_MAX:
        MOV BL,CH
        MOV BH,DH
        
        CALL FIND_MAX
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H
        
        CMP CH,BH
        JE DH_LEFT
        MOV DL,CH    ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP NEXT
        
        DH_LEFT:
        MOV DL,DH     ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP NEXT
            
        CH_MAX:
        MOV BL,CL
        MOV BH,DH
        
        CALL FIND_MAX
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H
        
        CMP CL,BH
        JE DH_LEFT2
        MOV DL,CL
        MOV AH,02
        INT 21H
        JMP NEXT
        
        DH_LEFT2:
        MOV DL,DH    ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP NEXT
        
        DH_MAX:
        MOV BL,CL
        MOV BH,CH
        
        CALL FIND_MAX
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H 
        
        CMP CL,BH
        JE CH_LEFT
        MOV DL,CL
        MOV AH,02
        INT 21H
        JMP NEXT
        
        CH_LEFT:
        MOV DL,CH     ;TO 3O MAX
        MOV AH,02
        INT 21H
        
      
        
        NEXT:
        MOV DL,10
        MOV AH,02
        INT 21H
        
        MOV DL,13
        MOV AH,02
        INT 21H
        
        
        MOV BL,CL
        MOV BH,CH
        
        CALL FIND_MIN
        
        MOV BL,DH
        MOV BH,BH   ;PERITO
        
        CALL FIND_MIN
        
        MOV DL,BH     ;TO MAX
        MOV AH,02
        INT 21H
        
        CMP CL,BH
        JE CL_MIN
        
        CMP CH,BH
        JE CH_MIN
        
        CMP DH,BH
        JE DH_MIN
        
        
        CL_MIN:
        MOV BL,CH
        MOV BH,DH
        
        CALL FIND_MIN
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H
        
        CMP CH,BH
        JE DH_LEFT3
        MOV DL,CH    ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP END
        
        DH_LEFT3:
        MOV DL,DH     ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP END
            
        CH_MIN:
        MOV BL,CL
        MOV BH,DH
        
        CALL FIND_MIN
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H
        
        CMP CL,BH
        JE DH_LEFT4
        MOV DL,CL
        MOV AH,02
        INT 21H
        JMP END
        
        DH_LEFT4:
        MOV DL,DH    ;TO 3O MAX
        MOV AH,02
        INT 21H
        JMP END
        
        DH_MIN:
        MOV BL,CL
        MOV BH,CH
        
        CALL FIND_MIN
        
        MOV DL,BH    ;TO 2O MAX
        MOV AH,02
        INT 21H 
        
        CMP CL,BH
        JE CH_LEFT2
        MOV DL,CL
        MOV AH,02
        INT 21H
        JMP END
        
        CH_LEFT2:
        MOV DL,CH     ;TO 3O MAX
        MOV AH,02
        INT 21H
        
        END:
        MOV AH,4CH
        INT 21H
	
MAIN ENDP

FIND_MAX PROC
    ;VALTA STO BL,BH TOUS 2 ARITHMOUS
    ;EPISTREFI TON BH POU EXEI TON MEGALITERO 
    
    CMP BL,BH
    JA BL_MEGALITERO
    JMP TELOS_FIND_MAX
    
    BL_MEGALITERO:
    MOV BH,BL
    
    TELOS_FIND_MAX:
    RET
FIND_MAX ENDP  

FIND_MIN PROC
    ;VALTA STO BL,BH TOUS 2 ARITHMOUS
    ;EPISTREFI TON BH POU EXEI TON MIKROTERO 
    
    CMP BL,BH
    JA BH_MIKROTERO
    MOV BH,BL
    JMP TELOS_FIND_MIN
    
    BH_MIKROTERO:
    JMP TELOS_FIND_MIN
    
    TELOS_FIND_MIN:
    RET 
    
FIND_MIN ENDP


   
METHOD PROC     
   
        LEA DX,MESSAGE
        MOV AH,9
        INT 21H 
        
        EISAGOGI:
        MOV AH,08
        INT 21H
        
        CMP AL,'9'
        JA ERROR
        
        CMP AL,'0'
        JB ERROR
        JMP TELOS
        
        ERROR:
        LEA DX,ERRORMES
        MOV AH,09
        INT 21H
        
        MOV DL,07
        MOV AH,02
        INT 21H
        
        JMP EISAGOGI
        
        
        TELOS:
        MOV DL,AL
        MOV AH,02
        INT 21H
        
        MOV BL,AL
    RET
METHOD ENDP

DATA SEGMENT  
    WELCOME DB 10,13,"--==Welcome, please provide 3(three) decimal numbers==-- $"
    MESSAGE DB 10,13,"Please give a decimal number: $"
    NEWLINE DB 10,13,"$"
    ERRORMES DB 10,13,"Error occured,input is not valid$",10,13
    BUFFER DB 25 DUP(0)
DATA ENDS


    END MAIN 
