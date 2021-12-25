
# Program for accepting a number from user and displaying it - intro program for comp org II - 8/24/20

# Ths is the data section of the program
.data
	promptUser:.asciiz "Enter a number\n"
	myMessage:.asciiz "The number is\n"
	
# Code Section
.text
	#To prompt the user
	li $v0, 4 #System call parameter v0 to print string
	la $a0, promptUser #loading address of string variable to print
	syscall
	
	#Get value from the console
	li $v0, 5
	syscall
	
	#Store the value in temp registry
	move $t0,$v0 #moves the value from $v0 to $t0
	
	#To print the message
	li $v0, 4 #System call parameter v0 to print string
	la $a0, myMessage #loading address of string variable to print
	syscall
	
	#To print a number
	li $v0, 1 #System call for int
	move $a0,$t0 #Load the int to print
	syscall