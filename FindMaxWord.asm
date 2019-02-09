 TITLE FIND_MAX_WORD
C0DE SEGMENT
    ASSUME CS:C0DE, DS:DATA
    BEGIN:   
        MOV AX,DATA	
	    MOV DS,AX	

        LEA DX,MESSAGE
        MOV AH,9
        INT 21H
         
        
        
        MOV SI,0
        
        INPUT:
        MOV AH,08
        INT 21H
        
        
        CMP AL,'&'
        JE PRINT
        
        CMP AL,' '
        JE STORE
        
        CMP AL,'a'
        JB INPUT
        
        CMP AL,'z'
        JBE STORE
        
        CMP AL,'A'
        JB INPUT
        
        CMP AL,'Z'
        JA INPUT
        
        STORE:
        MOV BUFFER[SI],AL
        INC SI
        MOV DL,AL
        MOV AH,02
        INT 21H
        
        CMP SI,30
        JB INPUT 
        
        PRINT:
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        
        MOV CX,SI
        MOV DI,SI
        MOV SI,0
        MOV BL,0 ;COUNTER WORD
        MOV BH,0 ;MAX COUNTER WORD
        MOV BP,0 ;MAX POSITION HOLDER
        MOV SP,0 ;STARTER WORD
        JCXZ NOINPUT
        
        
        LEA DX,MESSAGE_OUTPUT
        MOV AH,9
        INT 21H
        
        FOR:
        
        CMP BUFFER[SI],' '
        JE NEW_WORD
        INC BL
        JMP NEXT
        
        NEW_WORD:    
        CMP BL,BH
        JA NEW_MAX_WORD
        MOV SP,SI
        INC SP  ;TO TAKE THE START OF THE CHAR NOT THE SPACE
        MOV BL,0
        JMP NEXT
        
        NEW_MAX_WORD:
        MOV BP,SP
        MOV BH,BL
        MOV BL,0
        
        
        NEXT:
        INC SI
        LOOP FOR
        
        
        MOV CX,DI
        MOV SI,BP ;START FROM HERE  
        
        FOR2:

        CMP BUFFER[SI],' '
        JE TELOS
        MOV DL,BUFFER[SI]
        MOV AH,02
        INT 21H
        
        NEXT2:
        INC SI
        LOOP FOR2
        
        
  
        JMP FINISH
        
        
        NOINPUT:
        LEA DX,NOINPUTMIN
        MOV AH,09
        INT 21H
        
        FINISH:
        MOV AH,4CH
        INT 21H
	
C0DE ENDS

DATA SEGMENT  
   
    MESSAGE DB "Please give a text (end the input with '&'): $"  
    MESSAGE_OUTPUT DB 10,13,"The longest word in the text is the following: $" 
    NEWLINE DB 10,13,"$"
    NOINPUTMIN DB "NO INPUT!!!$"
    BUFFER DB 30 DUP(0)
DATA ENDS


    END BEGIN 
