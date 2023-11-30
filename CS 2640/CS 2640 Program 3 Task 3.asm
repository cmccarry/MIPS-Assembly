#Connor McCarry
#CS 2640.04
#3 December 2023
#Program 3 Task 3:
#Write a program in Assembly that takes practiceFile.txt file and appends to it.
#Answer the following prompt with your file append: "What have you enjoyed most about the class so far?"

.data
inputFileName: .asciiz "practiceFile.txt"
answerAppend: .asciiz "\nPrompt Answer: I've enjoyed playing jeopardy in class."

.text
main:
	#open file
	li $v0, 13
	la $a0, inputFileName
	li $a1, 9
	li $a2, 0
	syscall
	move $s0, $v0

	#write to file
	li $v0, 15
	move $a0, $s0
	la $a1, answerAppend
	la $a2, 64
	syscall
	
	#close file
	li $v0, 16
	move $a0, $s0
	syscall
	
	#exit program
	li $v0, 10
	syscall