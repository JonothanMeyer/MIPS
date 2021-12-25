#P1 - Take last 6 digits of SNN #900653438 convert to hex and store in N. Mask bits 2-12 and store in M, shift right and store in P. Take Q=(N-P)*2 without muliplication and Q=(N+P)*2
#C1 - Jonothan Meyer 10/07/20 - Time to complete 1 Hour 30 minutes (After revisiting this I was able to get quite a bit more work done and know I am close to the final solution, but I dont think this is quite it yet
.data
	N:.word 0x9f87e  #C3:Error took me a minute to figure out the right way to store N as a hex number, whether you used .asciiz or .word but as digits. I found this proper way after looking at notes and other resources online
	M:.space 11
	P:.space 13
	Q:.space 15
	two:.word 2
	one:.word 1 #C2: used for multiplying by 2 using sll operator
	enter:.asciiz "\n"
	
.text
	lw $s0,N
	li $t0, 0x50e	#C2: Learned from class how to properly pull the correct bits, and convert them to hex
	and $s1,$t0,$s0

	sw $s1,M
	lw $t1,two
	swr $s1,P($t1)  #C2: Learned from class this opperation to shift the wore to the right properly
	
	#Compute  Q=(N-P)*2

	la $t3,P 	#C3:Error: using 'lw $t3,P' it fetch address was not properly aligned

	sub $t4,$s0,$t3
	mul $t4,$t4,2
	lw $t1,one
	swl $t4,Q($t1) #C2: know that shifting left is equvalent to multiplying by 2^n, so to multiply by 2 you just shift left by 1
	
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,enter
	syscall
	
	#Compute Q=(N+P)*2
	
	add $t4,$s0,$t3
	mul $t4,$t4,2
	swl $t4,Q($t1)       #C3:Error: Could not fetch address
	
	li $v0,1
	move $a0,$t1
	syscall
	

	
	
	
	
	
	
