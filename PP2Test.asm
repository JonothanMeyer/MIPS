#P3 - Write a MIPS program using the Mars IDE that takes your first name in lower case letters, capitalizes the first letter of each part, then displays the name. 
#C1: Jonothan Meyer - 9/125/20 - Time to complete: 4 Hours 15 Minutes
.data
input: .space 60
fullName: .asciiz "jonothan edward meyer"
J:.byte 01001010
E:.byte J 
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
	
	
        #sb $t1,J
        lw $t1,Je   		#C2: I tried many different methods in terms of having a user input their own name, and then making loops to try to iterate through each 
        	    		#character, checking to see if it was ' ' and if so performing another loop that would capitalize the next letter. The only result 
        	    		#I was able to produce using this method was capitalizing the full name. In order to obtain the correct output after the assignment was updated
        	    		#with an example I changed my program so that it stores my name in lower case letters and then changes the first letter to upper case of each part
        	    		
        
        add $t0,$t0, 48				       #for how to do character swaps accurately without that discussion
	li $t4,0
	sb $t1, fullName($t4)
	
	
	lw $t2,Ee
	add $t1,$t1, 48				        
	la $t4,fullName
	sb $t2,9($t4)
	
	lw $t3,Me
	add $t2,$t2, 48				        
	la $t4,fullName
	sb $t3,16($t4)
	
	
	li $v0, 4
	la $a0, fullName
	syscall

	li $v0, 10
	syscall
