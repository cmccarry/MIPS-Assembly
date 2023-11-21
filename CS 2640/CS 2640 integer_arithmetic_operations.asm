#CS 2640.04
#23 October 2023
#write a program that takes two numbers from the user
	# 1) create and display prompt to prompt user for two numbers
	# 2) assign inputs to registers $t0 and $t1
#have the user select from an output menu of 4 arithmetic operations
	# 3) create and display prompt to prompt user for the arithmetic operation
	# 4) get the result of the operation using the 2 numbers
	# 5) store the result in $t2
#display the result in the output to the user
	# 6) display the result in $t2 to the user

.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Arithmetic Operations Options: \n1) Add \n2) Subtract \n3) Multiply \n4) Divide \nPlease enter the corresponing integer option: "
prompt4: .asciiz "Invalid user arithmetic operation option integer"

.text
main:
	#display the prompt
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt1	#tells assembler to print string stored in prompt1
	syscall		#tells the assembler to run the above commands
	#get the first integer
	li $v0, 5	#tells assembler to read in the user integer
	syscall		#assembler runs the above command
	move $t0, $v0	#moves result from user integer($v0) into $t0

	#display the prompt
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt2	#tells assembler to print string stored in prompt2
	syscall		#tells assembler to run the above commands
	#get the second integer
	li $v0, 5	#tells assembler to read in the user integer
	syscall		#assembler runs the above command
	move $t1, $v0	#moves result from user integer($v0) into $t1

	#prompt user the choose an operator using an integer input
	li $v0, 4	#tells assembler we want to print a string
	la $a0, prompt3	#tells assembler to print string stored in prompt3
	syscall		#assembler runs the above commands
	#get the user input (desired operation)
	li $v0, 5	#tells assembler to read in the user input
	syscall		#assembler runs the above command
	move $t4, $v0	#moves result from user input($v0) into $t4
	
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
	add $t2, $t0, $t1	#add the ints $t0 and $t1
	li $v0, 1	#tells assembler we want to print an integer
	la $a0, ($t2)	#tells assembler we want to print integer stored in $t2
	syscall		#tells assembler to run the above commands
	j exit		#jumps to the exit program function
	
subtraction:
	sub $t2, $t0, $t1	#subtracts the ints $t0 and $t1
	li $v0, 1	#tells assembler we want to print an integer
	la $a0, ($t2)	#tells assembler we want to print integer stored in $t2
	syscall		#tells assembler to run the above oommands
	j exit		#jumps to the exit program function
	
multiplication:
	mul $t2, $t0, $t1	#multiplies the ints $t0 and $t1
	li $v0, 1	#tells assembler we want to print an integer
	la $a0, ($t2)	#tells assembler we want to print integer stored in $t2
	syscall		#tells assembler to run the above oommands
	j exit		#jumps to the exit program function

division:
	div $t2, $t0, $t1	#divides the ints $t0 and $t1
	li $v0, 1	#tells assembler we want to print an integer
	la $a0, ($t2)	#tells assembler we want to print integer stored in $t2
	syscall		#tells assembler to run the above oommands
	j exit		#jumps to the exit program function
	

	
exit:
	li $v0, 10	#tells assembler we want to exit the program
	syscall		#assembler runs the above command
	
	
	
	
	
	
