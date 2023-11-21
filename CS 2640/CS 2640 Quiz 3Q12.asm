#Connor McCarry
#CS 2640.04
#27 October 2023
#A program that prints a string and integer

.data
message: .asciiz "hello"	#loads the string "hello" into message
newLine: .asciiz "\n"		#will print a new line

.text
	li $v0, 4	#tells assembler we want to print a string
	la $a0, message	#tells assembler to print string stored in message
	syscall		#invoke syscall
	li $v0, 4	#tells assembler we want to print a string
	la $a0, newLine	#tells assembler to print string stored in newLine
	syscall		#invoke syscall
	
	li $v0, 1	#tells assembler we want to print an integer
	la $a0, 598123	#tells assembler to print integer 598123
	syscall		#invoke syscall
	
	li $v0, 10	#tells assembler we want to exit the program
	syscall		#invoke syscall
