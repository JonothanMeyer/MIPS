#P3 - Write a MIPS program using MARS IDE to solve the expression and display the value in X, where A, B, and C are variables assigned in the data section of the program X = A*C+(B/D) => (X=4*2+(3/1)=11)
#C1: Jonothan Meyer - 9/13/20 - Time to complete: 2 Hours 10 Minutes

.data
	A:.word 4  #C3: Error: when using .ascii got "BLANK is not a valid character string"
	B:.word 3
	C:.word 2
	D:.word 1
	Solution:.asciiz "X=A*C+(B/D)="

	
	
.text
	
	lw $t0,A	#C2: understanding how to do the operations properly and store them properly from class helped a lot as well, and the slides were
	lw $t2,C	#referanced frequently to do this part of the code. I also used the MIPS referance guild to understand proper syntax for this portion
	#(A*C) = 8
	mul $t4,$t0,$t2
	
	lw $t1,B	#C3: Error:Operand is of incorrect type (when trying to load immediate, before I realized I needed to change to load word)
	lw $t3,D
	#(B/D) = 3
	div $t5,$t1,$t3 #C3: Error:Break instruction executed; no code given (Not sure what solved this error actually, just did some testing and debugging and it went away)

	#()+() = 11
	add $t6,$t5,$t4

        #Put A in right first Spot of Solution String| (C2: For the bottom portions of code what we did in class helped quite a bit. I would have ben very lost with the syntax
        add $t0,$t0, 48				       #for how to do character swaps accurately without that discussion
	li $t4,2
	sb $t0, Solution($t4)
	
	#Put B in right second Spot of solution String| (C2: I knew to add $t1 and all subsequent variables (C,D) by 48 because of help in class, knowing that since they
	add $t1,$t1, 48				        #are different variables they need to be moved accordingly
	la $t4,Solution
	sb $t1,7($t4)
	
	#Put C in right spot of solution String
	add $t2,$t2, 48
	la $t4,Solution
	sb $t2,4($t4)
	
	#Put D in the right spot of solution String
	add $t3,$t3, 48
	la $t4,Solution
	sb $t3,9($t4)
	
	li $v0, 4 
	la $a0, Solution 
	syscall
	li $v0, 1 
	move $a0,$t6 #Load the int to print solution at end
	syscall
	

