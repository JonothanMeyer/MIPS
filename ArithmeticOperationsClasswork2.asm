#Write a MIPS assembly program to solve the expression:  Z=(A*2)/(B+4)
.data
	prompt:.asciiz "Enter Number"
	rD:.asciiz "\Remainder:"
	qD:.asciiz "\nQuotient:"
	
.text
	li $v0,4
	la $a0,prompt
	syscall
	#Accepting A
	li $v0,5
	syscall
	move $t1,$v0 #First value in t1
	
	#Enter the 2nd number
	li $v0,4
	la $a0,prompt
	syscall
	#Accepting B
	li $v0,5
	syscall
	move $t2,$v0 #Move second value to t2
	
	#(A*2) = 10
	mul $t4,$t1,2
	#(B+4)=6
	addi $t0,$t2,4 #add
	
	div $t4,$t0 #10/6 - 1Q -4 rem
	
	li $v0,4
	la $a0,qD
	syscall
	li $v0,1
	mflo $a0 #Display Quotient
	syscall
	
	li $v0,4
	la $a0,rD
	syscall
	li $v0,1
	mfhi $a0 #Display Remainder
	syscall
	
