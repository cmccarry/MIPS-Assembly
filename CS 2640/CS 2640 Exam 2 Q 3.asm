#Connor McCarry
#CS 2640.04
#18 November 2023
#Exam2 Part2 Q3

.data
days: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
daysArrayAre: .asciiz "Days array elements are: "
buffer1: .space 50
buffer2: .space 50
comma: .asciiz " , "
aSpace: .asciiz " "
getStringPrompt: .asciiz "Please enter a string (max 50 chars): "
addressStringPrompt1: .asciiz "\nThe address,contents of the first string is: "
addressStringPrompt2: .asciiz "The address,contents of the second string is: "
exitPrompt: .asciiz "The program will now exit"

.text

.macro getUserString(%buffer)	#macro to read a string from the user
	la $a0, %buffer
	la $a1, 50
	li $v0, 8
	syscall
.end_macro

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

.macro exit			#macro to exit the program
	li  $v0, 10
	syscall
.end_macro

main:
	#gets first user string and stores it in $t8
	printString(getStringPrompt)
	getUserString(buffer1)
	la $t8, buffer1
	
	#gets second user string and stores it in $t9
	printString(getStringPrompt)
	getUserString(buffer2)
	la $t9, buffer2
	
	#load base address
	la $s0, days
	
	#initialize loop counter
	li $t1, 0
	
	printString(daysArrayAre)
	
	j daysLoop

daysLoop:
	beq $t1, 12, findAddresses
	
	#load current element in array into $t0, print out element in array and a space
	lw  $t0, 0($s0)
	printInt($t0)
	printString(aSpace)
	
	#move base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter by 1
	addi $t1, $t1, 1
	
	j daysLoop
	
findAddresses:
	#prints the prompt, address and contents of the first string
	printString(addressStringPrompt1)
	printInt($t8)
	printString(comma)
	printStringParam($t8)
	
	#prints the prompt, address and contents of the second string
	printString(addressStringPrompt2)
	printInt($t9)
	printString(comma)
	printStringParam($t9)
	printString(exitPrompt)
	
	exit
