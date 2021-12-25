.data

m1:.asciiz "Inside mainfunction\n"
m2:.asciiz "Inside fun1\n"
m3:.asciiz "Inside fun2\n"

.text

 main:
	li $v0,4
	la $a0,m1
	syscall

	#s0
	jal Fun1
	la $a0,m1
	syscall
	j Exit
 Fun1:
	li $v0,4
	la $a0,m2
	syscall
	#s0
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)

	jal Fun2
	lw $ra,0($sp)
	addi $sp,$sp,8
	jr $ra

 Fun2:
	li $v0,4
	la $a0,m3
	syscall
	jr $ra
 Exit:
	li $v0,10
	syscall