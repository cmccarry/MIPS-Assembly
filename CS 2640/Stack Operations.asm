#CS 2640.04
#20 Novemeber 2023
#Mips Stack Operations Program
# 1)Write a program in Assembly that will print out '$sp' address, then 
# 2)push an integer onto the stack and 
# 3)print out the new '$sp address'

.data
stackPointer: .asciiz "\nThe current stack address is: "

.text
main:
	#print out the propt and current address
	li $v0, 4
	la $a0, stackPointer
	syscall
	
	#print out the $sp address
	li $v0, 1
	move $a0, $sp
	syscall
	
	#push an integer onto the stack
	li $s0, 3
	sw $s0, ($sp)
	sub $sp, $sp, 4
	
	#push an integer onto the stack
	li $s1, 4
	sw $s1, ($sp)
	sub $sp, $sp, 4
	
	#print out the new $sp address
	li $v0, 4
	la $a0, stackPointer
	syscall
	li $v0, 1
	move $a0, $sp
	syscall
	
	#pop $s1 = 4
	lw $t0, ($sp)
	add $sp, $sp, 4
	
	#print out the new $sp address
	li $v0, 4
	la $a0, stackPointer
	syscall
	li $v0, 1
	move $a0, $sp
	syscall
	
exit:
	li $v0, 10
	syscall
	