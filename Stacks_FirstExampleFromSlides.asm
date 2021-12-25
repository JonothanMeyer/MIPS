.text
 main:
	addi $s0,$zero,2
	jal Display

	jal fun1
	
	li $v0,1
	move $a0,$s0
	syscall

	j Exit

fun1:
	addi $sp,$sp,-4 #Moves stack to the next point down to the next position
	sw $s0,0($sp)
	addi $s0,$s0,10

	jal Display
	lw $s0,0($sp) #retrieves the origional value of s0 before going back to main function
	addi $sp,$sp,4 #adding 4 goes back to original point in stack
	jr $ra
	
Display:
	li $v0,1
	move $a0,$s0
	syscall
	jr $ra

 Exit:
		li $v0,10
		syscall
