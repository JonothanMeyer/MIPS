#Demo for memory

.data
	x:.word 20
	y:.word 0x66778822
	.space 8
	str1:.asciiz "CS2400"
	z:.word 4
	
	
.text
	li $t0, 0x10010000
	lw $t5,0($t0)
	# for the above (lw $t5,0($10) we could also put it in a different address rather than adding, by offseting by 4, so it would be: lw $t5,4($t0)
	add $t0,$t0,4 #Will make it so the above address is incrimented by 4.  So 0x10010000 => 0x10010004
	lw $t6,0($t0)