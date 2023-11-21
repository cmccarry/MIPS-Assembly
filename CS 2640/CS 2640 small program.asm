#CS 2640.04
#20 October 2023
#Write a program in Assembly that takes two numbers from
#a user and outputs the greater number

#1) prompt user for an input
#2) assign numbers to registers
#3) compare the numbers
#4) output the greater number

.data
prompt1: .asciiz "Enter the first integer: "
prompt2: .asciiz "Enter the second integer: "
equalNums: .asciiz "The user inputs are equal."
firstNum: .asciiz "The first user input is greater."
secondNum: .asciiz "The second user input is greater."

.text
main:
	#prompt the user for the first integer
	li $v0, 4
	la $a0, prompt1
	syscall
	#get users first integer
	li $v0, 5
	syscall
	move $t0, $v0
	
	#prompt the user for the second integer
	li $v0, 4
	la $a0, prompt2
	syscall
	#get users second integer
	li $v0, 5
	syscall
	move $t1, $v0
	
	#compare the numbers
	beq $t0, $t1, else		#if $t0 == $t1
	bgt $t0, $t1, firstGreater	#if $t0 > $t1
	bgt $t1, $t0, secondGreater	#if $t0 < $t1
	
else: # $t0 and $t1 are equal/same numbers
	li $v0, 4
	la $a0, equalNums
	syscall
	j exit
	
firstGreater: #if $t0 > $t1
	li $v0, 4
	la $a0, firstNum
	syscall
	j exit
	
secondGreater: #if $t0 < $t1
	li $v0, 4
	la $a0, secondNum
	syscall
	j exit
	
exit: #exit syscall
	li $v0, 10
	syscall