 TITLE CONVERTER
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DATA
    CODE:   
        MOV AX,DATA	
	    MOV DS,AX	   
	    
	    LEA DX,WELCOME
        MOV AH,9
        INT 21H

        LEA DX,MESSAGE
        MOV AH,9
        INT 21H
        
        
        MOV SI,0
        
        EISAGOGI:
        MOV AH,08
        INT 21H
        
        
        CMP AL,'0'
        JE STORE
        
        CMP AL,'1'
        JE STORE
        
        
        MOV DL,07
        MOV AH,02
        INT 21H  
        
        MOV DL,07
        MOV AH,02
        INT 21H  
        
        MOV DL,07
        MOV AH,02
        INT 21H
        JMP EISAGOGI
        
        STORE:
        MOV BUFFER[SI],AL
        INC SI
        MOV DL,AL
        MOV AH,02
        INT 21H
        
        CMP SI,8
        JB EISAGOGI
        
        
        
        EMFANISI:
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        
        MOV CX,SI
        
        JCXZ NOINPUT
        MOV BL,0    ;sum
        MOV DH,1    ;krataei tin dinami tis thesis
        MOV BH,2    ;polaplasiastis
        SUB SI,1    ;trexo ton pinaka (counter)
        FOR:
        
        CMP BUFFER[SI],'1' ;an einai 1 tote pros8ese
        JNE NEXT 
        
        ADD BL,DH  ;AUKSISE TO SUM
        
        
        NEXT:         ;alios au3ise tin dinami kata 2*progioumeno
        MOV AL,DH
        MUL BH
        MOV DH,AL
        
        DEC SI
        LOOP FOR
        
       
        CMP BL,99
        JBE DIPSIFIOS:
        
        MOV AH,0
        MOV AL,BL
        MOV CL,10
        DIV CL
        
        MOV BH,AH ;EXI TO TELEUTAIO PSIFIO
        MOV AH,0
        DIV CL
        MOV CL,AL ;1o PSIFIO
        MOV CH,AH ;2o PSIFIO
        
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
        
                  
                  
                  
        JMP TELOS          
        DIPSIFIOS:     
        CMP BL,9
        JBE MONOPSIFIOS:
       
        MOV AH,0
        MOV AL,BL
        MOV CL,10
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
        
        MONOPSIFIOS:
        MOV DL,BL
        ADD DL,48
        MOV AH,02
        INT 21H
        
        
      
      
        
      
        JMP END
        
        
        NOINPUT:
        LEA DX,NOINPUTMIN
        MOV AH,09
        INT 21H
        
        END:
        MOV AH,4CH
        INT 21H
	
KODIKAS ENDS

DATA SEGMENT  
    WELCOME DB "--== WELCOME ==--$",10,13   
    MESSAGE DB 10,13,"Please give an 8length binary input: $"
    NEWLINE DB 10,13,"$"
    NOINPUTMIN DB "NO INPUT!!!$"
    BUFFER DB 8 DUP(0)
DATA ENDS


    END CODE 
