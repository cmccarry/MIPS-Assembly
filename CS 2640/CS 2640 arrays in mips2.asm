#Connor McCarry
#CS 2640.04
#1) display message
#2) main, loop, exit labels
#3) $s0 for base address
#4) $t0 for current value
#5) loop counter

.data
myArray: .word 1,2,3,4,5
display1: .asciiz "Array elements are: "


.text
main:
	#load base address
	la $s0, myArray
	
	#initialize loop counter ($t1)
	li $t1, 0
	#below do the same thing but are not common practice
	#move $t1, $zero
	#addi $t1, $t1, 0
	#add $t1, $t1, $zero
	
	#display the message
	li $v0, 4
	la $a0, display1
	syscall
	
loop:
	#condition to exit the loop
	beq $t1, 5, exit	#if $t1 == 5, jump to exit
	
	#load current element in array into $t0
	lw $t0, 0($s0)
	
	#print out element in array and a space
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 11
	la $a0, ' '
	syscall
	
	#move base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter by 1
	addi $t1, $t1, 1
	
	#makes the loop function loop
	j loop
	
exit:
	#exit function
	li $v0, 10
	syscall
	
	
	
	
	