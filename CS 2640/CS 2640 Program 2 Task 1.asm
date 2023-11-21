#Connor McCarry
#CS 2640.04
#12 November 2023
#Program 2 Task 1- Write an Assembly program that will return a letter grade given a Decimal int from the user that includes:
	#1) a user menu
	#2) a main label, a looping label, and an exit label
	#3) a way for the user to continue getting letter grades or choose to exit
	#4) invalid input handling


.macro printString(%str)	#macro to print a string, given an argument as %str
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

.macro newLine			#macro for a new line character
	li $v0, 11
	la $a0, '\n'
	syscall
.end_macro

.data
prompt: .asciiz "Enter \'1\' or \'2\' for your selection: "
continuePrompt: .asciiz "\nWould you like to enter a new score? \n(Y)Yes     (N)No \n\nEnter \'Y\' or \'N\' for your selection: "
userMenu: .asciiz "\n~~~~~~~~~~~~~~~MAIN MENU~~~~~~~~~~~~~~~ \n(1)Get Letter Grade \n(2)Exit Program \n\n"
separator: .asciiz "\n----------------------------------------"
gradePrompt: .asciiz "\nPlease enter a score as an integer value: "
invalidInputGrade: .asciiz "Invalid input. Please only enter an integer value from 1 to 100"
invalidInputMain: .asciiz "Invalid input. Please only enter a \'1\' or \'2\' \n"
invalidInputContinue: .asciiz "\nInvalid input. Please only enter a \'Y\' for \'yes\' or \'N\' for \'no\' \n"
gradeResult: .asciiz "The grade is: "
A_Grade: .asciiz "A \n"
B_Grade: .asciiz "B \n"
C_Grade: .asciiz "C \n"
D_Grade: .asciiz "D \n"
F_Grade: .asciiz "F \n"

.text
menu:
	#print menu
	newLine
	printString(userMenu)
	
main:
	#print user prompt, get user choice and store in $a1
	printString(prompt)
	li $v0, 5
	syscall
	move $a1, $v0	
	
	#check if valid answer or exit answer
	blt $a1, 1, invalidM
	bgt $a1, 2, invalidM
	beq $a1, 2, exit
	
	#formatting
	printString(separator)

getGrade:
	#get user value of grade integer and store in $a1
	newLine
	printString(gradePrompt)
	li $v0, 5
	syscall
	move $a1, $v0
	
	#check if valid answers
	blt $a1, 0, invalidG
	bgt $a1, 100, invalidG
	
	#branch to appropriate grade function to print
	printString(gradeResult)
	bgt $a1, 89, gradeA
	bgt $a1, 79, gradeB
	bgt $a1, 69, gradeC
	bgt $a1, 59, gradeD
	blt $a1, 60, gradeF
	
gradeA:
	printString(A_Grade)
	j loop
	
gradeB:
	printString(B_Grade)
	j loop
	
gradeC:
	printString(C_Grade)
	j loop
	
gradeD:
	printString(D_Grade)
	j loop
	
gradeF:
	printString(F_Grade)
	j loop
	
loop:
	#ask if user wants to continue
	printString(separator)
	printString(continuePrompt)
	
	#read in user character response
	li $v0, 12
	syscall
	move $a0, $v0
	
	#branch to appropriate response or invalid input function
	beq $a0, 'Y', getGrade
	beq $a0, 'N', menu
	j invalidC
	
invalidG:
	printString(invalidInputGrade)
	j getGrade

invalidM:
	printString(invalidInputMain)
	j main
	
invalidC:
	printString(invalidInputContinue)
	j loop
	
exit:
	li $v0, 10	#exit function
	syscall
