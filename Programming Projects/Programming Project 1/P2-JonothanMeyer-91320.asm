#P2 - Write a MIPS program using MARS IDE that will ask the user for their favorite place on earth and to display it.
#C1: No Errors with this Program
#C3: Jonothan Meyer - 9/13/20 - Time To Complete: 20 Minutes

#Data Section
.data
	promptLN: .asciiz "Enter Your Favorite Place On Earth\n"
	storedAnswer:.asciiz "Your Favorite Place is "
	userInput: .space 20 #amount of space for the user to input, in this case they get 20 bytes (buffer size)
	

#Code Section
.text
	#To Prompt for Last name
	li $v0,4
	la $a0, promptLN
	syscall
	
	#To accept string from user  (C2: The work we did in class helped me to understand the syntax for this)
	li $v0,8
	la $a0, userInput
	li $a1, 19 #if you need user to enter 4 characters then you put 5 here. One is used for null space   (C2: Without class I would have neverr known to allocate the amount
	syscall												     #of characters/memory for the program to reserve for user imput
	
	li $v0,4
	la $a0, storedAnswer
	syscall
	
	#displaying favorite place
	li $v0,4
	la $a0, userInput #prints the answer given by user
	syscall
