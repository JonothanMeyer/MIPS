.data
lw $t2, 60($t1)
lw $t1, 40($t2)
slt $t1, $t1, $t2
sw $t1, 20($t2)