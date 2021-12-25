#Jonothan Meyer - Exit Quiz 11
#The code contains an error that causes an arithmetic overflow disruption when attempting to run. Correct this error so that s0 displays, before Fun1, in Fun1, and after Fun1
#10/07/20
.text

main:

       addi $s0,$zero,2 
       jal Disp
       jal Fun1
       jal Disp
       j Exit

Fun1:

       addi $sp,$sp,-4
       sw $s0,0($sp)
       addi $s0,$s0,15
       li $v0,1        #previous to lines 19,20,21 there was just a 'jal Display' function. This is what caused the error, coding this way allows it to run
       move $a0,$s0
       syscall     
       lw $s0,0($sp)   
       addi $sp,$sp,4
       jr $ra

Disp:

      li $v0,1
      move $a0,$s0
      syscall
      jr $ra

Exit:

      li $v0,10
      syscall