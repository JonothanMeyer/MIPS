#Write a MIPS assembly program to solve the expression:  Y = (3*X) + (X+Z)
# Example output , if user enters 2 in X and 3 in Z , then output should be  Y=(3 * 2)+(2+3)= 11
#Jonothan Meyer 9/11/20
.data
	prompt:.asciiz "Enter Number"
	Solution:.asciiz "Y=(3*X)+(X+Z)="
	
.text
	#Enter First number > X
	li $v0,4
	la $a0,prompt
	syscall
	#Accepting X
	li $v0,5
	syscall
	move $t0,$v0 #First value in t0
	
	#Enter the 2nd number > Z
	li $v0,4
	la $a0,prompt
	syscall
	#Accepting Z
	li $v0,5
	syscall
	move $t1,$v0 #Move second value to t1
	
	#(X*3) = 10
	mul $t2,$t0,3
	#(X+Z)=6
	add $t3,$t1,$t0 #add
	# () + () = t6
	add $t5,$t3,$t2 #(t4) + (t0)
	
	#Put x in right first Spot of Solution Striung
	add $t0,$t0, 48
	li $t4,5
	sb $t0, Solution($t4)
	
	#Put X in right second Spot of solution String
	la $t4,Solution
	sb $t0,9($t4)
	
	#Put Z in right spot of solution String
	add $t1,$t1, 48
	la $t4,Solution
	sb $t1,11($t4)
	
	li $v0, 4 #System call parameter v0 to print string
	la $a0, Solution #loading address of string variable to print
	syscall
	li $v0, 1 #System call for int
	move $a0,$t5 #Load the int to print
	syscall
	
