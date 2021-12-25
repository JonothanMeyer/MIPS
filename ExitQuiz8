.data
	prompt:.asciiz "Enter Number"
	rD:.asciiz"Remainder after dividing number by 2: "
	zero:.word 0
	one:.word 1
	even:.asciiz"\nThis number is EVEN"
	odd:.asciiz"\nThis number is ODD"

.text
	li $v0,4
	la $a0,prompt
	syscall
	

	li $v0,5
	syscall
	move $t1,$v0 #Move first value to t1
	
	div $t2,$t1,2 #dividing user input number by 2 to figure out if remainder is 1 or 0, 0=even number, 1=odd number
	
		
	li $v0,4
	la $a0,rD
	syscall
	li $v0,1
	mfhi $a0  #shows the remainder value
	syscall
	move $t2,$a0
	
	lw $t3,zero
	lw $t4,one
	
	
	beq $t2,$t3,ifZero #compares user input/2 to see if equal to zero

	beq $t2,$t4,ifOne #compares user input/2 to see if equal to 1

	
	ifZero: 
		li $v0,4
		la $a0,even
		syscall
		li $v0,10
		syscall

	ifOne:
		li $v0,4
		la $a0,odd
		syscall
		li $v0,10
		syscall
