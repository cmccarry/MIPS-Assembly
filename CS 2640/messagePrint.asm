#CS 2640.04
#9 October 2023
#A simple program in the style of "Hello World"

.data
message: .asciiz "programming in assembly,yay!"

.text
main:
#print the string
li $v0, 4	#instant load the constant value of 4 into register v0 / tells the assembler we want to print a string
la $a0, message	#get the location of 'message' and store it into a0
syscall 	#has the assembler print the string

#exit program
li $v0, 10 	#tell the assembler that we want to exit the program after running
syscall 	#has the assembler exit program