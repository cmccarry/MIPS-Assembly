#Connor McCarry
#CS 2640.04
#12 November 2023
#Program 2 Task 2- Write a program in Assembly that takes in two ints from a user. 
	# One int will be 'x' and the other will be 'y'. Make sure that user will know which value is 'x' and 'y'. 
	# Find the result of 'x' to the power of 'y'. Output the result to the user
#Inlcudes the following:
	#1) a main label, a looping label, an exit label
	#2) a loop counter

.macro printString(%str)	#macro to print a string, given an argument as %str
	li $v0, 4
	la $a0, %str
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

.data
programDetails: .asciiz "This program asks the user to input a value for \'x\' and \'y\'. \nThen, it finds the value of x to the power of y. \nFor example, 2 to the power of 3 is 8. \n\n"
promptX: .asciiz "Enter a number for \'x\': "
promptY: .asciiz "Enter a number for \'y\': "
outputMessage: .asciiz "\'x\' to the power \'y\' is: "
divisionSign: .asciiz "/"

.text
main:
	printString(programDetails)
	
	#prompt user for x and store in $t0
	printString(promptX)
	li $v0, 5
	syscall
	move $t0, $v0
	newLine
	
	#prompt user for y and store in $t1
	printString(promptY)
	li $v0, 5
	syscall
	move $t1, $v0
	newLine
	
	#initialize loop counter as $t3
	li $t3, 0
	
	#intialize result as $t4
	li $t4, 1
	
	#check if the exponent is negative or positive
	blt $t1, 0, negativeHandlingLoop
	bgt $t1, -1, loop
	
loop:
	#branch to printResult if loop counter($t3) == y($t1)
	beq $t1, $t3, printResult
	
	#multiply result by x($t0)
	mul $t4, $t4, $t0
	
	#increase loop counter by 1
	addi $t3, $t3, 1
	
	j loop
	
negativeHandlingLoop:
	#branch to printNegativeResult if loop counter($t3) == y($t1)
	beq $t1, $t3, printNegativeResult
	
	#multiply result by x($t0)
	mul $t4, $t4, $t0
	
	#decrease loop counter by 1
	subi $t3, $t3, 1
	
	j negativeHandlingLoop
	
printNegativeResult:
	#initialize $t5 as 1
	li $t5, 1
	
	#print output message and result(as 1/result)
	printString(outputMessage)
	printInt($t5)
	printString(divisionSign)
	printInt($t4)
	
	j exit

printResult:
	#print output message and result
	printString(outputMessage)
	printInt($t4)
	
	j exit
	
exit:
	li $v0, 10	#exit function
	syscall
