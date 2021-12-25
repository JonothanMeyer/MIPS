#Jonothan Meyer - #900653438
#Take Home Mid-Term Exam
#Computer Organization II - 10/09/20
.data
prompt:.asciiz "Enter a String (word, phrase, or short sentance) that you would like to recieve some general data about:\n"
userInput:.space 128
stringLenPrompt:.asciiz "\nLength of string is = "
numofWordsPrompt:.asciiz "\nNumber of words in the sentence is = "
compSent:.asciiz "\nYes, a complete sentence.\n"
notComp:.asciiz "\nNot a complete sentence\n"
numCapLets:.asciiz "Number of capital letters = "
occura:.asciiz "\nOccurence of letter 'a' = "
test:.asciiz "\ntest"
.text

main:
	#1)Write a MIPS program using MARS IDE to accept a string from the user.
	jal getUserString
	move $t0,$a0
	jal stringLength
	move $t1,$a0
	jal numWords
	jal compSentence
	li $t3,0
	li $t0,0
	move $t1,$a0
	jal numCapLetters
	jal numA
	j Exit
#------------------------------------------------------------------------------------------------------------------------------------------------------------
getUserString:
        #1) Write a MIPS program using MARS IDE to accept a String from the user.
	li $v0,4
	la $a0, prompt
	syscall
	
	li $v0,8
	la $a0, userInput
	li $a1, 128
	syscall
	jr $ra
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
stringLength:
	#a)Find the String length and display the string length
	lb $t1 0($t0)        
	beq $t1,$zero,DisplayLeng   
	addi $t0,$t0,1 
	add $t4,$t4,1
	j stringLength	
DisplayLeng:
	li $v0,4
	la $a0,stringLenPrompt
	syscall
        subi $t4,$t4,1 
	li $v0,1
	move $a0,$t4 	      
	syscall
	li $t3,1
	li $t0,0
	jr $ra
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
numWords:
	#b)Using the given ascii value chart find the number of words in the string
	lbu $t1, userInput($t0)
        add $t0,$t0,1
	lbu $t1, userInput($t0)           
	beq  $t1,0x20,countWord   
	bge $t0,128,DisplayNumLeng
	j numWords   
countWord:
	addi $t3,$t3,1
	bge $t0,128,DisplayNumLeng
	j numWords
DisplayNumLeng:
	li $v0,4
	la $a0,numofWordsPrompt
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
compSentence:
	#c)Using the ascii value chart find if the string ends with a full stop. If it ends with a full stop display the message "Yes, complete sentence."
	subi $t4,$t4,1
	lbu $t1, userInput($t4)
	beq $t1,0x2e,DispCompSent
	beq $t1,0x21,DispCompSent
	beq $t1,0x3f,DispCompSent
	j DispNotComp
DispCompSent:
	li $v0,4
	la $a0,compSent
	syscall
	jr $ra
DispNotComp:
	li $v0,4
	la $a0,notComp
	syscall
	
	jr $ra
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------
numCapLetters:
	#d)Count the number of capital letters in the sentence and display the count
	bge $t0,128,DisplayNumCaps
	lbu $t1,userInput($t0)
	blt $t1,0x41,notLet
	blt $t1,0x61,capLet
	addi $t0,$t0,1
	j numCapLetters	
notLet:
	addi $t0,$t0,1
	j numCapLetters
capLet:
	addi $t0,$t0,1
	addi $t3,$t3,1
	j numCapLetters
DisplayNumCaps:
	li $v0,4
	la $a0,numCapLets
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	li $t3,0
	li $t0,0
	jr $ra
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------
numA:
	#e)Count the occurances of letter 'a' in the sentence and display the count
	bge $t0,128,DisplayNumA
	lbu $t1,userInput($t0)
	beq $t1,0x61,counta
	addi $t0,$t0,1
	j numA	

counta:
	addi $t0,$t0,1
	addi $t3,$t3,1
	j numA
DisplayNumA:
	li $v0,4
	la $a0,occura
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	jr $ra	
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
Exit:
	li $v0,10
	syscall
	
