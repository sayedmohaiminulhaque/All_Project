; Sayed Mohaiminul Haque from Dept. of CSE, Sheikh Hasina University
;This is a simple cgpa calculator.

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

 SUM DB ?
 CRD DB ?
 
 N DB ?

.CODE 

MAIN PROC
   
    MOV AX,@DATA
    MOV DS,AX
    
    PRINTN
    PRINTN "*******WELCOME TO OUR CGPA CALCULATOR*******"
    PRINTN 
    PRINT "ENTER HOW MANY SUBJECT YOU HAVE: " 
    
    MOV AH,1
    INT 21H
    SUB AL,48 
    
    PRINTN
    PRINTN 
    
    MOV CL,AL
    MOV SUM,AL
    MOV BL,10
    MOV CRD,BL 
    MOV BX,0
    
    FOR: 
    SUB CL,1
    PRINTN
    PRINTN "ENTER THE GRADE: "
    MOV AH,1
    INT 21H
    CMP AL,41H
    JE A
    CMP AL,42H
    JE B
    CMP AL,43H
    JE C 
    CMP AL,44H
    JE D
    CMP AL,46H
    JE F 
    
    A: 
    MOV AH,1
    INT 21H
    
    CMP AL,2BH
    JE A1
    CMP AL,0DH
    JE A2
    CMP AL,2DH
    JE A3
    
    
    
    
    A1:
    ADD BX,40

    CMP CL,0
    JNE FOR
    JE RESULT 
    
    A2:
    ADD BX,37
    
    CMP CL,0
    JNE FOR
    JE RESULT
    
    A3:
    ADD BX,35
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    
    B: 
    MOV AH,1
    INT 21H
    
    CMP AL,2BH
    JE B1
    CMP AL,0DH
    JE B2
    CMP AL,2DH
    JE B3
    
    
    B1:
    ADD BX,32
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    B2:
    ADD BX,30
    
    CMP CL,0
    JNE FOR
    JE RESULT
    
    B3:
    ADD BX,27
    
    CMP CL,0
    JNE FOR
    JE RESULT  
    
    
    
    C: 
    MOV AH,1
    INT 21H
    
    CMP AL,2BH
    JE C1
    CMP AL,0DH
    JE C2
    
    
    C1:
    ADD BH,25
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    C2:
    ADD BX,22
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    D:
    ADD BX,20
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    F:
    ADD BX,0
    
    CMP CL,0
    JNE FOR
    JE RESULT 
    
    
    RESULT: 
    
     MOV AH,0
     MOV AX,BX
     DIV SUM
     MOV AH,0
     DIV CRD
     MOV N,AH
     
     MOV DX,AX
     ADD DX,48 
     PRINTN
     PRINT "YOUR CGPA IS: "
     MOV AH,2
     INT 21H
     PRINT "." 
     
   
     
     MOV DL,N
     ADD DX,48
     MOV AH,2
     INT 21H
    
    
             
    EXIT:
    MOV AH,4CH
    INT 21H         
             
             
             
    MAIN ENDP
END MAIN
