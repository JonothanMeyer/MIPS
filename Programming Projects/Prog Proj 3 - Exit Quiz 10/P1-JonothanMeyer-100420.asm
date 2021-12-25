#P1 -  Accept a string from a uswer and display the length of the String 
#C1: Jonothan Meyer - #900653438 - 10/04/20 - Time to complete: 1 hour

.data
promptString: .asciiz "Please Enter a String Less than 30 characters long"
solution:.asciiz "The amount of characters in the String is " 
userInput: .space 40 #amount of space for the user to input, in this case they get 20 bytes (buffer size)
count: .word 0



.text

	li $v0,4 #prompt for string from user
	la $a0, promptString
	syscall
	
	li $v0,8 #Store string from user. 
	la $a0, userInput
	li $a1, 40 #if you need user to enter 4 characters then you put 5 here. One is used for null space
	syscall
	

	
	move $t0,$a0
Loop:
        lb $t1 0($t0) #C3: Error: Got a out of range error. This was just because I forgot to put the 'move $t0,$a0' function listed above. 
        	      #C2: I learned in class how to properly grab the right byte using shift operators. 
	beq $t1,$zero,Exit    #C2: Learned from class how to properly declare the right type of loop. Think I still could have used 'bnz' in this situation, but this is more readable
	addi $t0,$t0,1 
	add $t4,$t4,1
	j Loop	
Exit:                 #C2: Learned from class how to properly declare jumps and how they work.

	li $v0,4
	la $a0,solution
	syscall
	
        subi $t4,$t4,1 #C3: Error: I'm a little unsure why I had to subtract 1 to get the right solution at this point, as I thought if anything I would have to add 1. But this is what is needed to
        		#display the right solution. 
	
	li $v0,1
	move $a0,$t4 #C3: Logic Error: Initially I used 'la $t4,count' above my loop to be sure 0 was the starting value for count. But doing this caused the wrong output
		     #    (even though the output incremented properly depending on the length of the string). After deleting that function I got the right output. 
	syscall
	
	li $v0, 10 #C3: Error. Called the wrong function initially for a few times and got an error.
	syscall
