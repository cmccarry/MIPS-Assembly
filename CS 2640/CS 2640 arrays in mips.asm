#Connor McCarry
#CS 2640.04
#30 October 2023
#Given an array = [3,4,5]
#add 3+4, 3+5, 4+5, 3+4+5 and display to the user

.data
myArray: .word 3,4,5


.text
main:
	#put array elements into registers
	la $t0, myArray
	lw $t1, 0($t0)
	lw $t1, 4($t0)
	la $t2, 8($t0)
	
	#add the combinations
	addi $t4, $t1, $t2	#3 + 4
	addi $t5, $t1, $t3	#3 + 5
	addi $t6, $t2, $t3	#4 + 5
	addi $t7, $t4, $t3	#3 + 4 + 5
	
	li $v0, 1
	la $a0, ($t4)
	syscall
