	#This program asks the user to input 2 numbers and then finds the Sum, Difference, Product, and Remainder/Quotient of those numbers
.data
	prompt:.asciiz "Enter Number"
	sumD:.asciiz "\nSum:"
	diffD:.asciiz "\nDifference:"
	prodD:.asciiz "\nProduct:"
	rD:.asciiz "\nRemainder:"
	qD:.asciiz "\nQuotient:"
	
.text
	li $v0,4
	la $a0,prompt
	syscall
	
	#Accepting A
	li $v0,5
	syscall
	move $t1,$v0 #Move first value to t1
	
#Enter 2nd number
	li $v0,4
	la $a0,prompt
	syscall
	
	#Accepting B
	li $v0,5
	syscall
	move $t2,$v0 #Move second value to t2
	li $v0,4
	la $a0,sumD
	syscall
	
	#Addition
	add $t0,$t1,$t2
	li $v0,1
	move $a0,$t0
	syscall
	
	#Subtraction
	sub $t3,$t1,$t2 #t1-t2
	#Multiplication
	mul $t4,$t1,$t2
	#Division
	div $t1,$t2
	
	li $v0,4
	la $a0,diffD
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,prodD
	syscall
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,qD
	syscall
	li $v0,1
	mflo $a0
	syscall
	
	li $v0,4
	la $a0,rD
	syscall
	li $v0,1
	mfhi $a0
	syscall
	
	
	
