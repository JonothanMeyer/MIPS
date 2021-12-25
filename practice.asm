.data

promptLN:.asciiz "please input your name"
userInput:.space 40
space:.asciiz " "

.text




	#To Prompt for Name
	li $v0,4
	la $a0, promptLN
	syscall
	
	#To accept string from user
	li $v0,8
	la $a0, userInput
	li $a1, 40 #if you need user to enter 4 characters then you put 5 here. One is used for null space
	syscall
	
	li $t0,0
	
	lbu $t1, userInput($t0)

        sub $t1,$t1,32
        sb $t1, userInput($t0)
        
Loop:
	add $t0,$t0,1
	lbu $t1, userInput($t0)
	lbu $t2, space
	beq  $t1,$t2,needsCap
	bge $t0,40,Display
	j Loop
	
needsCap:
	add $t0,$t0,1
	lbu $t1, userInput($t0)
	beq $t0,40, Display
	sub $t1,$t1,32
	sb $t1, userInput($t0)
	j Loop
        
        
        
Display:        #To display the users name
	li $v0,4
	la $a0, userInput #prints the User's last name
	syscall
    
	
	
