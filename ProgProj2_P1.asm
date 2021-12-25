.data
input: .space 20
newline: .asciiz "\n"

.text
main:
    li $v0, 8
    li $a1, 30
    la $a0, input
    syscall

    li $v0, 4
    li $t0, 0

loop:
    lb $t1, input($t0)
    beq $t1, 0, exit
    blt $t1, ' ', space
    blt $t1, 'a', case

    sub $t1, $t1, 32
    sb $t1, input($t0)
    
    
 

case: 
    addi $t0, $t0, 1
    j loop
    
space:
	addi $t0, $t0, 1
	j loop

exit:
    li $v0, 4
    la $a0, input
    syscall

    li $v0, 10
    syscall
