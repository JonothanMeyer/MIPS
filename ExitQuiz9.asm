.data

t3:.asciiz "t3: "
.text
main:
	li $t4,1 #counter
	li $t0,2 #This is f
	li $t1,2 #this is t1
	li $t2,4 #this is t2
	bgt $t4,$t0,fact
	move $t0,$t2
	bgt $t4,$t0,fact2
	add $t6,$t1,$t2
	
	li $v0,4
	la $a0,t3
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	
	
	jal Display
	jal Exit


fact: 
	mul $t1,$t1,$t4
	sub $t0,$t0,1
	jr $ra
	
fact2:
	mul $t2,$t2,$t4
	sub $t0,$t0,1
	jr $ra
	
Display:
	li $v0,1
	move $a0,$t6 
	syscall
	jr $ra
	
Exit:
	li $v0,10
	syscall
	
	