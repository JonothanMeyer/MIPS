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
       li $v0,1
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