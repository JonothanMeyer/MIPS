#P1 - Write a MIPS program using MARS IDE that will accept 3 integers from the user and find the sum of the 3 numbers and display the sum. 
#C1: No Errors with this Program
#C3: #Jonothan Meyer - 9/13/20 - Time To Complete: 20 Minutes

.data
	prompt:.asciiz "Enter a number\n"
	myMessage:.asciiz "The summation of values entered is "
	
# Code Section
.text
	#To prompt the user for the first number   
	li $v0, 4 
	la $a0, prompt 
	syscall
	
	#Get value from the console 	(C2: Class helped me understand how to request and get input from a user and store it properly based off its type of data)
	li $v0, 5
	syscall
	
	#Store the value in temp registry
	move $t0,$v0 
	
	#To prompt the user for the second number
	li $v0, 4 
	la $a0, prompt 
	syscall
	
	#Get value from the console
	li $v0, 5
	syscall
	
	#Store the value in temp registry
	move $t1,$v0 
	
	#To prompt the user for the third number
	li $v0, 4 
	la $a0, prompt 
	syscall
	
	#Get value from the console
	li $v0, 5
	syscall
	
	#Store the value in temp registry
	move $t2,$v0 #moves the value from $v0 to $t2
	
	#Summation of all the numbers, stored in $t3
	add $t3,$t0,$t1
	add $t3,$t3,$t2
	
	#To print the message
	li $v0, 4 
	la $a0, myMessage 
	syscall
	
	#To print a number
	li $v0, 1
	move $a0,$t3 
	syscall
