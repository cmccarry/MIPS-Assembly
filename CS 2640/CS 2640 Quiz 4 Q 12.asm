#Connor McCarry
#CS 2640.04
#1 December 2023
#Quiz 4 Question 12

.macro getString		# macro that takes in user input
	li $v0, 8
	la $a0, buffer
	li $a1, 21
	syscall
	move $s0, $a0
.end_macro

.macro getInt (%destination)
	li $v0, 5
	syscall
	move %destination, $v0
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
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Please select an ooperation to complete: \n1) Add \n2) Subtract \n3) Multiply \n4) Divide \nPlease enter a number 1-4: "
prompt4: .asciiz "Invalid user arithmetic operation option integer"
prompt5: .asciiz "The result is: "

.text
main:
	#display the prompt
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt1	#tells assembler to print string stored in prompt1
	syscall		#tells the assembler to run the above commands
	#get the first integer
	getInt($t0)
	#li $v0 5	#tells assembler to read in the user integer
	#syscall		#assembler runs the above command
	#move $t0, $v0	#moves result from user integer($v0) into $t0

	#display the prompt
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt2	#tells assembler to print string stored in prompt2
	syscall		#tells assembler to run the above commands
	#get the second integer
	getInt($t1)
	#li $v0, 5	#tells assembler to read in the user integer
	#syscall		#assembler runs the above command
	#move $t1, $v0	#moves result from user integer($v0) into $t1

	#prompt user the choose an operator using an integer input
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt3	#tells assembler to print string stored in prompt3
	syscall		#assembler runs the above commands
	#get the user input (desired operation)
	li $v0, 5	#tells assembler to read in the user input
	syscall		#assembler runs the above command
	move $t4, $v0	#moves result from user input($v0) into $t4
	#display the result prompt
	li $v0, 4
	la $a0, prompt5
	syscall
	
	#checkt the condition of $t4
	#if $t4 is 1 -> add
	beq $t4, 1, addition
	#if $t4 is 2 -> sub
	beq $t4, 2, subtraction
	#if $t4 is 3 -> mul
	beq $t4, 3, multiplication
	#if $t4 is 4 -> div
	beq $t4, 4, division
	#if $t4 < 1 or $t4 > 4
	blt $t4, 1, exit
	bgt $t4, 4, exit
	
	
addition:
	addTwoIntegers($t2, $t0, $t1)	#add the ints $t0 and $t1
	j result		#jumps to the exit program function
	
subtraction:
	sub $t2, $t0, $t1	#subtracts the ints $t0 and $t1
	j result		#jumps to the exit program function
	
multiplication:
	mul $t2, $t0, $t1	#multiplies the ints $t0 and $t1
	j result		#jumps to the exit program function

division:
	div $t2, $t0, $t1	#divides the ints $t0 and $t1
	j result		#jumps to the exit program function
	
result:
	printInt($t2)
	j exit
	
exit:
	li $v0, 10	#tells assembler we want to exit the program
	syscall		#assembler runs the above command
	
	
	
	
	
	
