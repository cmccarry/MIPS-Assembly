#Connor McCarry
#CS 2640.04
#6 December 2023
#Program that uses a stack and stack pointer to reverse and print a given array


.data
myArray:  .word 5, 4, 3, 2, 1
prompt: .asciiz "Array elements are: "
result: .asciiz "\nNew array is: "


.text
main:
    	# initialize registers
    	la $s0,myArray	# array
    	li $t0, 0	# loop counter
    	li $t1, 5	# array length

    	# display array prompt
   	li $v0, 4
    	la $a0, prompt
	syscall
	
	# jump
	j printLoop
	
# prints original array
printLoop:
	# load current element
        lw $t2, 0($s0)
        
        # print current element
        li $v0, 1
        move $a0, $t2
        syscall
        
        # print space
        li $v0, 11
        la $a0, ' '
        syscall
	
	# move base address to next element
        addi $s0, $s0, 4
        # increment loop counter by 1
        addi $t0, $t0, 1
        
        # loop for length of array
        blt $t0, $t1, printLoop
        
        # jump
        j reset

# reinitalize
reset:
	# reinitialize array and loop counter into registers, jump
    	la $s0, myArray
    	li $t0, 0
    	j pushLoop
    	
# push elements of array onto stack
pushLoop:
	# load current element and push onto stack
        lw $t2, 0($s0)
        sw $t2, 0($sp)
        
        # move stack pointer to next element
        subi $sp, $sp, 4
        # move base address to next element
        addi $s0, $s0, 4
        # increment loop counter by 1
        addi $t0, $t0, 1
        
        # loop for length of array
        blt $t0, $t1, pushLoop
	
	# jump
	j displayNew

# display promp and reset
displayNew:
    	# display result prompt
    	li $v0, 4
    	la $a0, result
    	syscall
    	
    	# reset loop conter, jump
	li $t0, 0
	j popLoop
	
# pop and print elements in stack
popLoop:
	# load int from stack pointer and print
        lw $a0, 4($sp)
        li $v0, 1
        syscall
        
        # print space
        li $v0, 11
        la $a0, ' '
        syscall
	
	# move stack pointer to next element
        addi $sp, $sp, 4
        # increment loop counter by 1
        addi $t0, $t0, 1
        
        # loop for length of stack
        blt $t0, $t1, popLoop  # Continue popping until the end of the array
	
	# jump
	j exit
	
# exit program
exit:
    	li $v0, 10
    	syscall
