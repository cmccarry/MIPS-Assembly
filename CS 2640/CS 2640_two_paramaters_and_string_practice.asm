#Connor McCarry
#CS 2640.04
#15 November 2023
#Task 1- Define a macro that:
    # Takes in two parameters
    # An int and a string
    # Doubles the int
    # Calls another macro to print the string
    # Define the int and string in the program
#Task 2- Write a MIPS program that: 
    # Passes the programmer's defined string to the macro
    # Uses a loop to print the string 3 times (each on a new line)
    # Exits the program

.data
myInteger: .word 12
aString: .asciiz "Goodbye World"
task1Prompt1: .asciiz "~~~~~Task1~~~~~ \nDoubled Integer: "
task1Prompt2: .asciiz "aString: "
task2Prompt: .asciiz "\n~~~~~Task2~~~~~ \n\'aString\' printed 3 times: \n"


.text

.macro printString(%str)	#macro to print a string, given a label argument
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

.macro printStringParam(%str)	#macro to print a string, given a register argument
	li $v0, 4
	la $a0, (%str)
	syscall
.end_macro

.macro printInt(%int)		#macro to print an integer, given an argument as %int
	li $v0, 1
	move $a0, %int
	syscall
.end_macro

.macro newLine			#macro for a new line character
	li $v0, 11
	la $a0, '\n'
	syscall
.end_macro


.macro aMacro (%intParameter, %stringParameter)	#macro for task 1
	#multiplies intParameter by 2 and calls macro to print integer
	printString(task1Prompt1)
	mul $t0, %intParameter, 2
	printInt($t0)
	newLine
	
	#calls macro to print string
	printString(task1Prompt2)
	printStringParam(%stringParameter)
	newLine
.end_macro

main:
	#initializes the int and string and calls aMacro
	lw $a1, myInteger
	la $a2, aString
	aMacro($a1,$a2)
	
	#prints task2's prompt, initializes loop counter and jumps to loop
	printString(task2Prompt)
	li $t1, 0
	j loop
	
loop:							#loop for task 2
	#prints aString and a newline character 3 times
	beq $t1, 3, exit
	printStringParam($a2)
	newLine
	
	#adds 1 to loop counter and recursively calls itself
	addi $t1, $t1, 1
	j loop
	
exit:		#exit function
	li $v0, 10
	syscall
