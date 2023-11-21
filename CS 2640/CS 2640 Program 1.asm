#Connor McCarry
#CS 2640.04
#29 October 2023
#Program 1: Getting Familiar with Assembly
#Goal: To familiarize yourself with different MIPS instructions, syscall services, the MARS environment, and overall practice with Assembly programming


.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
newLine: .asciiz "\n"			#prints a new line
outputs: .asciiz "Integers entered: "
addprompt: .asciiz "Addition of the two values: "
subprompt: .asciiz "Subtraction of the two values: "
mulprompt: .asciiz "Multiplication of the two values: "
divprompt: .asciiz "Division of the two values: "
remainder: .asciiz " Remainder"
equalPrompt: .asciiz "User inputs are the same"
notEqualPrompt: .asciiz "User inputs are different"


.text
main:

#Task 1: User Input and Output
#get two integer values from the user
#stores them in $s0 and $s1 respectively
#outputs the user inputs back to the user

	#display the prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, prompt1		#tells assembler to print string stored in prompt1
	syscall			#assembler runs the above commands
	#get the first integer
	li $v0, 5		#tells assembler to read in the user integer
	syscall			#assembler runs the above command
	move $s0, $v0		#moves result from user integer($v0) into $s0
	#display the prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, prompt2		#tells assembler to print string stored in prompt2
	syscall			#assembler runs the above commands
	#get the second integer
	li $v0, 5		#tells assembler to read in the user integer
	syscall			#assembler runs the above command
	move $s1, $v0		#moves result from user integer($v0) into $s1
		
	#display the outputs prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, outputs		#tells assembler to print string stored in outputs
	syscall			#assembler runs the above commands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	#display the first integer
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($s0)		#tells assembler to print integer stored in $s0
	syscall			#tells the assembler to run the above commands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	#display the second integer
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($s1)		#tells assembler to print integer stored in $s1
	syscall			#tells the assembler to run the above commands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	
	
#Task 2: Arithmetic Operation Practice
#performs arithmetic operations on the 2 user integers (addition,subtraction,multiplication,division)
#outputs the arithmetic results back to the user

addition:
	#display the addition prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, addprompt	#tells assembler to print string stored in addprompt
	syscall			#assembler runs the above commands
	#do arithmetic on $s0 and $s1 and display output
	add $t2, $s0, $s1	#add the ints $s0 and $s1
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($t2)		#tells assembler we want to print integer stored in $t2
	syscall			#tells assembler to run the above commands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	
subtraction:
	#display the subtraction prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, subprompt	#tells assembler to print string stored in subprompt
	syscall			#assembler runs the above commands
	#do arithmetic on $s0 and $s1 and display output
	sub $t2, $s0, $s1	#subtracts the ints $s0 and $s1
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($t2)		#tells assembler we want to print integer stored in $t2
	syscall			#tells assembler to run the above oommands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	
multiplication:
	#display the multiplication prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, mulprompt	#tells assembler to print string stored in mulprompt
	syscall			#assembler runs the above commands
	#do arithmetic on $s0 and $s1 and display output
	mul $t2, $s0, $s1	#multiplies the ints $s0 and $s1
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($t2)		#tells assembler we want to print integer stored in $t2
	syscall			#tells assembler to run the above oommands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands

division:
	#display the divison prompt
	li $v0, 4		#tells assembler we want to print a string
	la $a0, divprompt	#tells assembler to print string stored in divprompt
	syscall			#assembler runs the above commands
	#do arithmetic on $s0 and $s1 and display output
	div $s0,$s1		#divides the ints $s0 and $s1
	mflo $t0		#sets $t0 to the quotient
	mfhi $t1		#sets $t1 to the remainder
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($t0)		#tells assembler we want to print integer stored in $t0
	syscall			#tells assembler to run the above oommands
	li $v0, 4		#tells assembler we want to print a string
	la $a0, remainder	#tells assembler to print string stored in remainder
	syscall			#assembler runs the above commands
	li $v0, 1		#tells assembler we want to print an integer
	la $a0, ($t1)		#tells assembler we want to print integer stored in $t1
	syscall			#tells assembler to run the above oommands
	#print newline
	li $v0, 4		#tells assembler we want to print a string
	la $a0, newLine		#tells assembler to print string stored in newLine
	syscall			#assembler runs the above commands
	
	
#Task 3: Conditions
#If the two user inputs from Task 1 are equal to each other, outputs "User inputs are the same"
#If the two user inputs from Task 1 are not equal to each other, outputs "User inputs are different"

	beq $s0, $s1, equal	#branch to equal function if $s0 and $s1 are equal
	bne $s0, $s1, notEqual	#branch to notEqual function if $s0 and $s1 are not equal
	
equal:
	li $v0, 4		#tells assembler we want to print a string
	la $a0, equalPrompt	#tells assembler to print string stored in equalPrompt
	syscall			#assembler runs the above commands
	j exit			#jumps to the exit function

notEqual:
	li $v0, 4		#tells assembler we want to print a string
	la $a0, notEqualPrompt	#tells assembler to print string stored in notEqualPrompt
	syscall			#assembler runs the above commands
	j exit			#jumps to the exit function
	
	
exit:
	li $v0, 10		#tells assembler we want to exit the program
	syscall			#assembler runs the above command