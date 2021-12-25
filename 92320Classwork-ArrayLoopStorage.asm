.data
	myAr: .space 20 #ammount of characters to store in array
.text

main:

	li $t1,0 #NCounter
	li $t2,4 #NLimit
	li $t3,0 #MemoryCounter


loop1:
	jal AcceptNum
	addi $t1,$t1,1 #incrimenting counter
	sw $v1,myAr($t3) #storing the user value into the array
	addi $t3,$t3,4 #incrementing the memory offset
	bne $t1,$t2,loop1 #bne=branch;not equal to.

	jal DispArray

	jal Exit #after the loop has finished from the bne condition this will have the prog
		 #program jump to the Exit portion below

DispArray:
	li $t1,3 #Counter, starting from the end of the array
	#li $t3,0 MemoryCounter

	loop2:
		lw $a1,myAr($t3) #taking the value in myArr (offset by $t3) and copying it in $a1
		j Disp
		sub $t1,$t1,1 #move backward an index in the array
		addi $t3,$t3,4 #incrementing offset by 4
		bgez $t1,loop2 #branch greater than or equal to zero

		jr $ra #allows to go back to the calling function

Disp:
	li $v0,1
	move $a0,$a1 #load value from $a1 and moving it to $a0
	syscall
	jr $ra

AcceptNum:
	li $v0,5
	syscall
	move $v1,$v0 #returning the accepted value to main function
	jr $ra #jr instruction goes back to the main code above

Exit:
	li $v0,10
	syscall
