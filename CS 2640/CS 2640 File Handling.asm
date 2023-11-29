#Connor McCarry
#CS 2640.04
#3 December 2023
#Program- File Handling

#Objectives
	#1) open 'gradedItems.txt'
	#2) read 'gradedItems.txt' and print contents to user
	#3) write contents to new file
	#4) close files

.data
inputFileName: .asciiz "gradedItems.txt"
outputFileName: .asciiz "cs2640items.txt"
buffer: .space 175

.text
main:
	#open gradedItems.txt
	li $v0, 13
	la $a0, inputFileName
	li $a1, 0	#read from file
	li $a2, 0 	#ignored
	syscall
	move $s0, $v0
	
	#read gradedItems.txt
	li $v0, 14
	move $a0, $s0
	la $a1, buffer
	li $a2, 173
	syscall
	
	#print out file contents
	li $v0, 4
	la $a0, buffer
	syscall
	
	#write buffer contents to new file
	#new file name: cs2640items.txt
	li $v0, 13
	la $a0, outputFileName
	li $a1, 1
	li $a2, 0
	syscall
	move $s1, $v0
	
	#write to file
	li $v0, 15
	move $a0, $s1
	la $a1, buffer
	la $a2, 174
	syscall
	
	#close inputfile
	li $v0, 16
	move $a0, $s0
	syscall
	
	#close output file
	li $v0, 16
	move $a0, $s1
	syscall
	
	#exit program
	li $v0, 10
	syscall
	
