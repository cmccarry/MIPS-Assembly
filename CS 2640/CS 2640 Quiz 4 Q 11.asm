#Connor McCarry
#CS 2640.04
#1 December 2023
#Quiz 4 Question 11
#Define three macros: 
    #one that takes in user input
    #one that adds two different integers
    #one that prints an integer
    
.macro getString		# macro that takes in user input
	li $v0, 8
	la $a0, buffer
	li $a1, 21
	syscall
	move $s0, $a0
.end_macro

.macro addTwoIntegers (%destination, %int1, %int2)	# macro that adds two integers stored in registers
	add $s0, %int1, $zero
	add $s1, %int2, $zero
	add $s0, $s0, $s1
	syscall
	move %destination, $s0
.end_macro

.macro printInt(%int)		# macro that prints an integer
	li $v0, 1
	move $a0, %int
	syscall
.end_macro


.data
buffer: .space 20

.text
main:
	getString
	li $v0, 4
	la $a0, ($s0)
	syscall
	
	li $t0, 1
	li $t1, 2
	addTwoIntegers ($t3,$t0,$t1)
	printInt($t3)