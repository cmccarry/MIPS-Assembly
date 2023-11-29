#Connor McCarry
#CS 2640.04
#3 December 2023
#Program 3 Task 1:
#Write an Assembly program that will return a letter grade for each element in an array (e.g. test scores in an array of scores). Uses the following array:
	#int scores = [32, 56, 78, 66, 88, 90, 93, 100, 101, 82]
#Includes the following in your program:
	#1) a main label, a looping label, and an exit label
	#2) a loop counter
	#3) a separate case for grades above 100 (i.e. prints out "A with Extra Credit")
	#4) your name printed out after all the grades are read (and before the program exits)

.macro printStringParam(%str)	#macro to print a string, given a label argument
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

.macro printString(%string)	#macro to print a string
	li $v0, 4
	.data
	userString: .asciiz %string
	.text
	la $a0, userString
	syscall
.end_macro

.macro newLine			#macro for a new line character
	li $v0, 11
	la $a0, '\n'
	syscall
.end_macro


.data
gradeArray: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82
A_Grade: .asciiz "A \n"
Aplus_Grade: .asciiz "A with extra credit \n"
B_Grade: .asciiz "B \n"
C_Grade: .asciiz "C \n"
D_Grade: .asciiz "D \n"
F_Grade: .asciiz "F \n"


.text
main:
	#load base address
	la $s0, gradeArray
	
	#initialize loop counter ($t1)
	li $t1, 0
	
loop:
	#condition to exit the loop
	beq $t1, 10, exit
	
	#load current element in array into $t0
	lw $t0, 0($s0)

	#print prompt and current element
	printString("The grade for ")
	li $v0, 1
	move $a0, $t0
	syscall
	printString(" is: ")

	#move base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter by 1
	addi $t1, $t1, 1
	
	#branch to approopriate output
	bgt $t0, 100, gradeAPlus
	bgt $t0, 89, gradeA
	bgt $t0, 79, gradeB
	bgt $t0, 69, gradeC
	bgt $t0, 59, gradeD
	blt $t0, 60, gradeF
	
gradeAPlus:
	printStringParam(Aplus_Grade)
	j loop
	
gradeA:
	printStringParam(A_Grade)
	j loop
	
gradeB:
	printStringParam(B_Grade)
	j loop
	
gradeC:
	printStringParam(C_Grade)
	j loop
	
gradeD:
	printStringParam(D_Grade)
	j loop
	
gradeF:
	printStringParam(F_Grade)
	j loop
	
exit:
	printString("-Connor McCarry \n")
	printString("This program will now exit")
	li $v0, 10
	syscall
	
	
	
