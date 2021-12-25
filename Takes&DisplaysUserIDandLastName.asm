#Exit Quiz 2 - Take Users Last name and last digit of their Student ID and display ex. "Dom 8"
#Jonothan Meyer
#8/24/20


#Data Section
.data
	promptLN: .asciiz "Enter your first and last name)"
	promptSID: .asciiz "Enter The Last Digit of your Student ID\n"
	userInput: .space 40 #amount of space for the user to input, in this case they get 20 bytes (buffer size)
	

#Code Section
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
	
	
	#To display the users name
	li $v0,4
	la $a0, userInput #prints the User's last name
	syscall
	
