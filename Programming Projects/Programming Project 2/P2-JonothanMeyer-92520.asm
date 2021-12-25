#P2 - Write a MIPS program using the Mars IDE that takes your first name in lower case letters, capitalizes the first letter of each part, then displays the name. 
#C1: Jonothan Meyer - #900653438 - 9/125/20 - Time to complete: 4 Hours 15 Minutes
.data
input: .space 60
fullName: .asciiz "jonothan edward meyer"
J:.byte 01001010
E:.byte 01000101 #Error: "E" is not a valid integer constant or label
M:.byte 01001101
Je:.word 'J'    
Ee:.word 'E'
Me:.word 'M'

newline: .asciiz "\n"
lowerName:.asciiz "My full name entered in lower clase letters\n"



.text
	#To Prompt for Name
	li $v0,4
	la $a0, lowerName
	syscall
	
	
        
        lw $t1,Je   		#C2: I tried many different methods in terms of having a user input their own name, and then making loops to try to iterate through each 
        	    		#character, checking to see if it was ' ' and if so performing another loop that would capitalize the next letter. The only result 
        	    		#I was able to produce using this method was capitalizing the full name. In order to obtain the correct output after the assignment was updated
        	    		#with an example I changed my program so that it stores my name in lower case letters and then changes the first letter to upper case of each part
        	    		
        
        add $t0,$t0, 48		#C2: For this portion I attempted for a long time to use the byte code for certain letters in order to capitalize each part of the name
	li $t4,0		#But after many attempts of trying to do so, and being unsuccessful I decided to save the letter in the .data section as a .word in order to display the proper output
	sb $t1, fullName($t4)
	
	
	lw $t2,Ee
	add $t1,$t1, 48				        
	la $t4,fullName
	sb $t2,9($t4)		#C2: I think I just need to do more independent research about how strings work within MIPS. My current knowledge was insufficient in order to 
				#write an algorithm in MIPS that could take any input of name from a user, find the right letters to capitalize, and execute. I would spend
				#more time on this portion, but my frustration is leading to no where, and this simplistic method was concluded so I could spend my time on the other
				#portion of this assignment. 
	
	lw $t3,Me
	add $t2,$t2, 48				        
	la $t4,fullName
	sb $t3,16($t4)
	
	
	li $v0, 4
	la $a0, fullName
	syscall

	li $v0, 10
	syscall
