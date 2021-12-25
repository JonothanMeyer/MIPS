 #Jonothan Meyer #90065348
 #Computer Organization II - Final Project
 #Time to Complete: 4 Hours 30 Mins

 .data
	A: .space 11
	B: .word 1, 2, 4, 8, 16, 32, 64, 128, 40, 58, 21
	EvenMess:.asciiz"\nThe smallest number is even"
	OddMess:.asciiz"\nThe smallest number is odd"
	smallestElm: .asciiz "\nThe smallest number number in the array is "
	greatBreak:.asciiz "\nThanks Professor! Have a great break!"
.text
	# Index = $t0
	addi $t0,$zero,0 #C2: Learned from class how to clear a register to start from zero.
	li $t4,99
	li $s3,0
	jal FillA
	jal setIndex
	#jal FillB
	#jal setIndex
	jal Swap
	jal setIndex
	jal Low
	jal EvenOdd
	jal Exit
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FillA: #fills array A with numbers 1-11
	addi $s3,$s3,1

	sw $s3, A($s0) #store value in array myArray[s0]=s3
	


	addi $s0,$s0,4	#incriments the index
	addi $t1,$t1,1 #increments count

	ble $t1,10,FillA
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FillB:
	addi $s3,$s3,2

	sw $s3, B($s0) #store value in array B[s0]=s3
	
	lw $s4, B($s0)


	addi $s0,$s0,4	#incriments the index
	addi $t1,$t1,1 #increments count

	ble $t1,11,FillB
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
setIndex:
	move $s0,$zero
	#addi $s0,$zero,44
	move $s1,$zero
	move $s3,$zero        #It was getting difficult to keep track what register was what. So this just clears them out to be convienent
	move $s4,$zero
	move $t1,$zero
	move $t2,$zero
	move $t3,$zero
	move $t6,$zero
	move $t7,$zero
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Swap:
	addi $t1,$t1,1
	lw $t2, A($s0)
	lw $t3, B($s0)
	sw $t3, A($s0)
	sw $t2, B($s0)
	addi $s0,$s0,4
	addi $s1,$s1,4
	ble $t1,11,Swap
	jr $ra 
	
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Low:
	addi $t1,$t1,1
	lw $t2, A($s0)
	li $v0,1
	move $a0,$t2
	syscall

	addi $s0,$s0,4 #incriments index
	lw  $t3, A($s0) #t3=myArray[s0]


	ble $t2,$t3,IF
		IF:
		ble $t2,$t4,Next
			Next:
			move $t4,$t2
	ble $t3,$t2,IFtwo
		IFtwo:
		ble $t3,$t4,Nexttwo
			Nexttwo:
			move $t4,$t3

	ble $t1,11,Low
	li $v0,4
	la $a0,smallestElm
	syscall
	li $v0,1
	move $a0,$t4
	syscall
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EvenOdd:
	li $t5,2
	div $t4,$t5
	mfhi $a0

	move $t6, $a0
	
	bge $t6,0,Odd
		Odd:
		li $v0,4
		la $a0,OddMess
		syscall
		j Exit

	beq $t6,0,Even
		Even:
		li $v0,4
		la $a0,EvenMess
		syscall
		j Exit
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Exit:		
 		li $v0,4
 		la $a0,greatBreak
 		syscall
		li $v0,10
		syscall

