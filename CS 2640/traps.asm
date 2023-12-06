#Connor McCarry
#CS 2640.04
#6 December 2023
#Program to demonstrate exception handling in MIPS

.data
enterOne: .asciiz "Please enter the numer '1': "
correct: .asciiz "That was a VALID input. Goodbye."


.text
main:
	# print out the prompt
	li $v0, 4
	la $a0, enterOne
	syscall
	
	# get user integer input
	li $v0, 5
	syscall
	move $s0, $v0
	
	# trap if input is not equal to 1
	tnei $s0, 1
	
	# print out correct prompt
	li $v0, 4
	la $a0, correct
	syscall
	
	# exit programs
	li $v0, 10
	syscall

.kdata	
incorrect: .asciiz "That was an INVALID input. Goodbye."

.ktext 0x80000180
	move $k0,$v0   # Save $v0 value
   	move $k1,$a0   # Save $a0 value
   	la   $a0, incorrect  # address of string to print
	li   $v0, 4    # Print String service
  	syscall
   	move $v0,$k0   # Restore $v0
   	move $a0,$k1   # Restore $a0
   	mfc0 $k0,$14   # Coprocessor 0 register $14 has address of trapping instruction
   	addi $k0,$k0,20 # Add 4 to point to next instruction
   	mtc0 $k0,$14   # Store new address back into $14
   	eret           # Error return; set PC to value in $14
