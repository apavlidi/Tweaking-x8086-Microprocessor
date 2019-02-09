 TITLE FIND_CHAR
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    MAIN PROC   
        MOV AX,DATA	
	    MOV DS,AX	
         
        LEA DX,WELCOME
        MOV AH,9
        INT 21H 
         
        LEA DX,MESSAGE
        MOV AH,9
        INT 21H
         
        
        MOV SI,0
        
        INPUT:
        MOV AH,01
        INT 21H
        
        
        CMP AL,'!'
        JE PRINT
        
        
        STORE:
        MOV BUFFER[SI],AL
        INC SI

        
        CMP SI,60
        JB INPUT
        
        
        
        PRINT:
        LEA DX,CHAR
        MOV AH,09
        INT 21H
        
        MOV AH,01
        INT 21H
       
        MOV CL,AL         ;perna me timi 
        
        CALL FIND_CHAR
        
        LEA DX,EXISTS
        MOV AH,09
        INT 21H
        
        MOV DL,BL         ;poses fores iparxei
        ADD DL,48
        MOV AH,02
        INT 21H
        
        LEA DX,NEWLINE
        MOV AH,09
        INT 21H
        
        MOV CX,DI          ;o deuteros pinakas
        MOV SI,0
        FOR2:
        
        MOV DL,BUFFERPOS[SI]
        
        CMP DL,','           ;an einai koma tote emfaniseto opos ine
        JNE NUMBER
        JMP SEPERATOR
        
        NUMBER:           ;alios kanton arithmo
        ADD DL,48
        
        SEPERATOR:
        MOV AH,02
        INT 21H
        INC SI
        
        LOOP FOR2:
        
        
        JMP FINISH
        
        
        NOINPUT:
        LEA DX,NOINPUTMIN
        MOV AH,09
        INT 21H
        
        FINISH:
        MOV AH,4CH
        INT 21H
	
MAIN ENDP  
    
FIND_CHAR PROC               
    
        MOV BH,CL  ;O CHAR POU 4AXNO
        MOV CX,SI
        MOV SI,0 
        MOV BL,0 ;PLITHOS
        MOV DI,0 ;COUNTER GIA TON PINAKA BUFFERPOS
        JCXZ NOINPUT
        
        
        FOR:
       
        CMP BUFFER[SI],BH  ;elekse an einai auto pou psaxnoume
        JNE NEXT
        
        
        INC BL            ;auksise tis fores pou to vrikame
        MOV AX,SI         ;vres thesi apo ton si
        MOV DH,10
        DIV DH
        
        MOV BUFFERPOS[DI],AL  ;vale dekada
        INC DI
        MOV BUFFERPOS[DI],AH  ;vale monada
        INC DI
        MOV BUFFERPOS[DI],',' ;vale komma
        INC DI
        
        
        NEXT:
        INC SI
        LOOP FOR
        
    
    RET
    
FIND_CHAR ENDP

DATA SEGMENT  
    WELCOME DB "        --== WELCOME ==--$" 
    MESSAGE DB 10,13,"Please type a setnence (to finish type '!'): $"
    NEWLINE DB 10,13,"$" 
    CHAR DB 10,13,"Give the char you want to find out: $"
    EXISTS DB 10,13,"EXISTS $"
    POSITION DB 10,13,"STIS THESEIS $" 
    NOINPUTMIN DB "NO INPUT!!!$"
    BUFFERPOS DB 180 DUP(0)
    BUFFER DB 60 DUP(0)
DATA ENDS


    END CODE 
