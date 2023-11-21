#Connor McCarry
#CS 2640.04
#6 November 2023
#Write a program in MIPS that prints a string to the user 5 times, then exits the program
#Write a program in MIPS that prints an integer passed to a macro
#Write a prgram that has two ways to print a string using macros
#Write a program to get the next element of an array, store the value into a register, then save it in memory

.macro printing			#prints string stored in message
	li $v0, 4
	la $a0, message
	syscall
.end_macro

.macro ints(%x)			#prints the integer from argument %x
	li $v0, 1
	la $a0, %x
	syscall
.end_macro

.macro aString(%strings)	#print the string from argument %strings, gets defined in the macro
	li $v0, 4
	.data
	userString: .asciiz %strings
	.text
	la $a0, userString
	syscall
.end_macro

.macro printString(%str)	#print the string from argument $str, already defined in .data
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

.macro macArray(%array)
	la $s0, %array
	lw $t0, 8($s0)
	add $t1, $t0, 1
	sw $t1, 12($s0)
.end_macro

.macro newLine			#prints a new line
	li $v0, 11
	la $a0, '\n'
	syscall
.end_macro

.macro exit			#exits the program
	li $v0, 10
	syscall
.end_macro

.data
message: .asciiz "this program uses printing and exit macros\n"
prompt: .asciiz "wow so cool"
arr1: .word 1,2,3

.text
main:
	#basic way to print string 5 times
	#printing
	#printing
	#printing
	#printing
	#printing
	
	#print the integer in the argument and a new line
	ints(5)
	newLine
	
	#print the string in the argument and a new line
	aString("goodbye world")
	newLine
	
	#print the string in the argument and a new line
	printString(prompt)
	newLine

	#initialize loop counter
	move $t0, $zero
	
loop:
	#call printing macro 5 times then exit
	beq $t0, 5, end		#branch to end if counter ($t0) is 5
	printing		#call printing macro
	addi $t0, $t0, 1	#increment loop counter by 1
	j loop			#recursive call loop function
	
end:
	#exit program
	exit