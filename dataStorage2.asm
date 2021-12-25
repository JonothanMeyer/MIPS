#Demo 2 for memory

#c1 = a1+b1

.data
	a1:.word 10
	b1:.word 20
	c1:.word 0
	d:.word 30
	
.text
	lw $s0,a1
	lw $s1,b1
	add $t0,$s0,$s1
	
	sw $t0,c1