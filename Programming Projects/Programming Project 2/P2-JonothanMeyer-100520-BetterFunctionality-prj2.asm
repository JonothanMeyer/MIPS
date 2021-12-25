#P2 -  Programming Project 2 - Write a MIPS program that asks the user to enter their full name in lower case letters, then capitalize the appropriate letters and display the name
#C1: Jonothan Meyer - #900653438 - 10/05/20 - Time to Complete (after recieving hint): 1 Hour 15 mins
.data

promptLN:.asciiz "please input your name"
userInput:.space 40
space:.asciiz " "

.text




	#To Prompt for Name
	li $v0,4
	la $a0, promptLN
	syscall
	
	#To accept string from user
	li $v0,8
	la $a0, userInput
	li $a1, 40 #if you need user to enter 4 characters then you put 5 here. One is used for null space
	syscall
	
	li $t0,0
	lbu $t1, userInput($t0)

        sub $t1,$t1,32            #C2: I was able to solve this problem after I got a hint from you on Canvas which lead to me adding this function (Thank you!)
        sb $t1, userInput($t0)
        
Loop:                        #C2: Learned in class how to implement loops properly when you need to iterate through something like a string
	add $t0,$t0,1
	lbu $t1, userInput($t0) #C2: Class taught me that the 'lb' function @ 'userInput(address)' was the proper way to load data stored in a specific address
	lbu $t2, space          #C3: prior to storing a space " " I just used 'beqz' for line 34 because I thought if I compared a space to zero it would 
	beq  $t1,$t2,needsCap   #C3: behave the same was as my current code does, but it would end up never branching because " " != 0, but " " == " ".
	bge $t0,40,Display
	j Loop               #C2: Learned from class how to use jumps to repeat sections of code when neccisary.
	
needsCap:
	add $t0,$t0,1
	lbu $t1, userInput($t0)
	beq $t0,40, Display #C2: This is essentially a while condition that keeps looping until it reaches the end of the allocated space for the string. 
	sub $t1,$t1,32
	sb $t1, userInput($t0)
	j Loop
        
        
        
Display:        #To display the users name
	li $v0,4
	la $a0, userInput #C3: I got a lot of logic errors here where I got the wrong output. It would either capitalize the wrong letter, or engage in an endless loop.
	syscall
    
	
	
