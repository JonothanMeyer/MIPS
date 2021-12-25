#Write a MIPS assembly program to solve the expression:  Z=A+(B/C)-2 >> Z=(A-2)+(B/C)
.data
	prompt:.asciiz "Enter Number"
	solution:.asciiz "\nSolution:"

	
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
	
	#Enter the 3rd number
	li $v0,4
	la $a0,prompt
	syscall
	#Accepting C
	li $v0,5
	syscall
	move $t3,$v0 #Move third value to t3
	
	#(A-2) = 10
	sub $t4,$t1,2
	#(B/C)=6
	div $t0,$t2,$t3 #add
	
	add $t5,$t0,$t4 #(A-2)+(B/C)
	
	li $v0,4
	la $a0,solution
	syscall
	li $v0,1
	move $a0,$t5 #Display Quotient
	syscall
	