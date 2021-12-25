 #P2 - Write a MIPS program using MARS IDE that will accept elements for an integer array of size 10 and find the highest element of that array
 #C1: Jonothan Meyer - #900653438 - 10/04/20 - Time to complete: 3.5 hours
 .data
	myArray: .space 40
	prompt: .asciiz "Finds the highest integer in an array of 10 integers. Enter the integers:"
	another: .asciiz "Enter another"
	highest: .asciiz "The highest number in the array is "
.text
	# Index = $t0
	addi $t0,$zero,0 #C2: Learned from class how to clear a register to start from zero.
	
	li $v0,4
	la $a0,prompt
	syscall
	
tenLoop:

	beq $t1,9,findGreatest #C2: Learned from class appropriate way to do a for loop of 9, as long as the 'j tenLoop' function is at the end of this
	
	li $v0,5
	syscall
	sw $v0, myArray($s0) #C2: Learned from class the appropriate way to store values within an array. 
	addi $s0,$s0,4	#incriments the index
	
	li $v0,4
	la $a0,another
	syscall
	
	addi $t1,$t1,1 #increments count
	
	j tenLoop


setIndex:
	move $s0,$zero
	move $t1,$zero
	j findGreatest
findGreatest:
	beq $s0,40,Display
	lw $t6, myArray($s0) #C2: learned from class that this is the same as 't6 = myArray[0]'

	addi $s0,$s0,4 #C2: Learned from class to incriment by 4 in array to go to the next byte over.
	lw  $t7, myArray($s0)

	blt $t6,$t7,ELSE #C2: Checks myArray[n] < myArray[n+1]
	move $t5,$t6
	addi $t1,$t1,1 #C3:Error fetch address not aligned on word boundary.
	addi $s0,$s0,4
	j findGreatest
ELSE:
	move $t5,$t6
	addi $t1,$t1,1
	addi $s0,$s0,4
	j findGreatest
	
	
Display:
	li $v0,4
	la $a0,highest
	syscall
	li $v0,1
	move $a0,$t5 #C3: Logic Error: I've traced this several times, but I'm not sure why it is not displaying the correct value sometimes. I suspect that numbers are either being stored
		     #or pulled to check from the wrong location. 
	syscall
