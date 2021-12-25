.data
	A:.space 11 #900653438 > 653438 > 3+8=11
	B:.space 11 
	pow2: .word 1, 2, 4, 8, 16, 32, 64, 128

.text
	addi $t0,$zero,0
	li $s0,0
	jal Fill
	add $t0,$zero,0
	jal Disp
	
Fill:
	bge $t0,12,Disp
	addi $s0,$s0,1
	sw $s0, A($t0) #store the value in the array
	addi $t0,$t0,4 #incriments the index
	jr $ra
	


Disp:
	lw $t6, A($t0) #t6 = A[0]
	li $v0,1
	move $a0,$t6
	syscall
	addi $t0,$t0,4
	bge $t0,12,Disp
	jr $ra
	
 Exit:
		li $v0,10
		syscall
