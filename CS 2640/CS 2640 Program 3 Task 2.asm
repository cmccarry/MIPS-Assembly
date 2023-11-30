#Connor McCarry
#CS 2640.04
#3 December 2023
#Program 3 Task 2:
#Write a program in Assembly that takes in a programmer-defined filename and outputs the file contents

.data
inputFileName: .asciiz "practiceFile.txt"
buffer: .space 250

.text
main:
	#open file
	li $v0, 13
	la $a0, inputFileName
	li $a1, 0
	li $a2, 0
	syscall
	move $s0, $v0
	
	#read file
	li $v0, 14
	move $a0, $s0
	la $a1, buffer
	li $a2, 250
	syscall
	
	#print out file contents
	li $v0, 4
	la $a0, buffer
	syscall

	#close file
	li $v0, 16
	move $a0, $s0
	syscall
	
	#exit program
	li $v0, 10
	syscall