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
    li $v0, 4
    li $t2, 1


    lb $t1, input($t0)

    blt $t1, 'a', case

    sub $t1, $t1, 32
    sb $t1, input($t2)
    beq $t1, ' ', space
    
space:
    addi $t0, $t0, 1
    addi $t2, $t2, 1
    lb $t1, input($t2)

    blt $t2, 'a', case
    beq $t1, ' ', space
    sub $t1, $t1, 32
    sb $t1, input($t2)
    j space

    
 
case: 
    addi $t0, $t0, 1
    addi $t2, $t2, 1
    j space
    



    li $v0, 4
    la $a0, input
    syscall

    li $v0, 10
    syscall
