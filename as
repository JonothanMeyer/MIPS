#Write a MIPS assembly program to solve the expression:  Y = (3*X) + (X+Z)
# Example output , if user enters 2 in X and 3 in Z , then output should be  Y=(3 * 2)+(2+3)= 11

.data

	
	
.text
	sub $t0,$s1,$s2
	
	and $t0,$s2,$t1
	lb $t3, 15($s2)
	mfhi $s4
	mflo $s5
	or $t4,$s1,$t0
	sra $t3,$s2,2
	sw $t3, 0x0008($s2)