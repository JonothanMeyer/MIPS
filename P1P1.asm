.data
	N:.word 653438
	M:.word 01111111000
.text
	lw $t0,N
	lb $t0
	add $t0,$t0, 48				       #for how to do character swaps accurately without that discussion
	li $t4,2
	sb $t0, Solution($t4)
	
