 TITLE COUNT_CHARS
CODE SEGMENT
    ASSUME CS:KODIKAS, DS:DATA
    MAIN:   
        MOV AX,DATA	
	    MOV DS,AX	   
	    
	    LEA DX,WELCOME
        MOV AH,9
        INT 21H
        
        LEA DX,INFOMESSAGE
        MOV AH,9
        INT 21H

        LEA DX,MESSAGE
        MOV AH,9
        INT 21H
            
        MOV SI,0
        
        EISAGOGI:
        MOV AH,08
        INT 21H
        
        CMP AL,'@'
        JE EMFANISI
                
        CMP AL,' '
        JE STORE        
        
        CMP AL,'A'
        JB EISAGOGI
        
        CMP AL,'Z'
        JBE STORE
        
        CMP AL,'a'
        JB EISAGOGI
        
        CMP AL,'z'
        JA EISAGOGI
        
        STORE:
        MOV BUFFER[SI],AL
        INC SI
        MOV DL,AL
        MOV AH,02
        INT 21H
        
        CMP SI,20
        JB EISAGOGI
     
        
        EMFANISI:
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        
        MOV CX,SI
        MOV SI,0
        MOV BL,0 ;COUNTER
        JCXZ NOINPUT
        
        
        FOR:
       
        CMP BUFFER[SI],' '
        JE NEW_LINE
        
        MOV DL,BUFFER[SI]
        MOV AH,02
        INT 21H
        INC BL
        JMP NEXT
        
        NEW_LINE:
        MOV DL,BL
        ADD DL,48
        MOV AH,02
        INT 21H
        
        MOV BL,0
        
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
       
        
        NEXT:
        INC SI
        LOOP FOR
        
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
	
CODE ENDS

DATA SEGMENT  
    WELCOME DB "--== Welcome ==-- $"   
    INFOMESSAGE DB 10,13,"By providing a sentence the program will ",10,13,"count the characters of each word, end your input with a '@' character $"
    MESSAGE DB 10,13,"Please write a sentence: $"
    NEWLINE DB 10,13,"$"
    NOINPUTMIN DB "NO INPUT!!!$"
    BUFFER DB 20 DUP(0)
DATA ENDS


    END MAIN 
