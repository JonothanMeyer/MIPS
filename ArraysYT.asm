.data
	myArray: .space 20
.text
	addi $s0,$zero,4
	addi $s1,$zero,10
	addi $s2,$zero,12
	
	# Index = $t0
	addi $t0,$zero,0 #clears t0 to store something in it
	
	sw $s0, myArray($t0) #all these store previous values in the array
		addi $t0,$t0,4	#incriments the index
	sw $s1,myArray($t0)
		addi $t0,$t0,4
	sw $s2,myArray($t0)
	
	
	lw $t6, myArray($zero) # same as t6 = myArray[0]
	
	li $v0,1
	addi $a0,$t6,0
	syscall
	
	addi $t3,$t1,3