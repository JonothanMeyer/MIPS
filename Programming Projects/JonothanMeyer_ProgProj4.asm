#Jonothan Meyer
#Time Taken: ~4 hours
#Most difficult part: Most of the parts I was able to figure out with little difficulty because I had done similar code previously. I would say the part I struggled most with was appending a '0' or '1' to the end of the 'Transmit'.
#I tested it quite a bit and seems to be functioning well, but I think there might be some disparities between comparing 'Transmit' and 'Recieve'. Also I think I could have done the same thing
#with less lines of code if I used loops better and planned things out. To overcome my difficultes I mostly just looked at old code I wrote earlier in the semester. Otherwise I just put displays 
#throughout the code (now deleted) that displayed whatever I was having trouble with so I could get a better idea what was going on.  
.data
	Transmit:.asciiz  "1010101010101010 "#0xaaaa #1010101010101010
	Reciever: .asciiz "10101010101010100" #0x15554 #10101010101010100
	new:.space 17
	prompt: .asciiz "\nWhich parity would you like to use?('1' for Odd, '2' for Even)"
	occurparity:.asciiz "\nParity Number:"
	rD:.asciiz "\nParity Value:"
	evenParityType:.asciiz "\nEven Parity Type\n"
	oddParityType:.asciiz "\nOdd Parity Type\n"
	noError:.asciiz "\nNo Error if they are the same"
	Error:.asciiz "\nError if not same"

	
.text

main:
	li $t0, 0
	jal countParity
	jal ParityCheck
	jal chooseParity
	jal displaynum
	li $t0,0
	li $t3,0
	jal countParityRecieve
	j Exit
	
	
#------------------------------------------------------------------------------------------------------------------------------------------------------------
chooseParity:
	#b)Display a menu to ask which parity (odd or even) the user needs to compute
	li $t1,0
	
	li $v0,4
	la $a0, prompt
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	beq $t1,1,oddParity
	beq $t1,2,evenParity
	
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------
countParity:
	#PECalc
	#e)
	bge $t0,17,DisplayNumParity
	lbu $t1,Transmit($t0)
	
	beq $t1,0x31,countone
	addi $t0,$t0,1
	j countParity	
countone:
	addi $t0,$t0,1
	addi $t3,$t3,1
	j countParity

#e)
DisplayNumParity:
	li $v0,4
	la $a0,occurparity
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	jr $ra	
#------------------------------------------------------------------------------------------------------------------------------------------------------------
ParityCheck:
	li $t5,2
	div $t3,$t5
	
	mfhi $a0
	move $t7, $a0

	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------
oddParity:
	li $v0,4
	la $a0,oddParityType
	syscall
	
		
	beq $t1,0x31,appendOne
	beq $t1,0x30,appendZero
	#d)
	appendOne:
	li $t0,0
	add $t0,$t0, 48
	li $t4,16
	sb $t0, Transmit($t4)
		
	appendZero:
	li $t0,1
	add $t0,$t0, 48
	li $t4,16
	sb $t0, Transmit($t4)	
			
	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------
evenParity:
	li $v0,4
	la $a0,evenParityType
	syscall
	li $v0,1
	mfhi $a0 #Display Remainder
	syscall

	beq $t1,0x30,appendOne
	beq $t1,0x31,appendZero

	jr $ra
#------------------------------------------------------------------------------------------------------------------------------------------------------------
displaynum:


	li $v0,4
	la $a0,Transmit #prints the User's last name
	syscall
#------------------------------------------------------------------------------------------------------------------------------------------------------------
#f)
countParityRecieve:
	#e)Count the occurances of letter 'a' in the sentence and display the count
	bge $t0,17,compareBoth
	lbu $t1,Reciever($t0)
	
	beq $t1,0x31,countoneRecieve
	addi $t0,$t0,1
	j countParityRecieve	
countoneRecieve:
	addi $t0,$t0,1
	addi $t3,$t3,1
	j countParityRecieve

compareBoth:
	li $t2,2
	div $t3,$t2
	mfhi $a0
	move $t6, $a0
	beq $t6,$t7,equal
	#f)
	equal:
		li $v0,4
		la $a0,noError
		syscall
		j Exit
	bne $t6,$t7,notEqual
	notEqual:
		li $v0,4
		la $a0,Error
		syscall
		j Exit
	jr $ra

#------------------------------------------------------------------------------------------------------------------------------------------------------------------
Exit:
	li $v0,10
	syscall
	