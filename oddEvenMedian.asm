# Write a program that prompt the user to input n numbers (0<n<11) and stores them in an
# array. Then it finds the median of the array, assuming the elements are in ascending order.

.data
######################################################################################
array:	.space	40
str:	.asciiz "Enter number \n"
promptMessage: .asciiz "Please enter the number of elements in your array [1-10]\n"
error: "Error. Out of range.\n"
counter: .word 0
median: .word 0
evenOrOddMessage: .asciiz "Now helping you calculate whether it's even or odd.\n"
isEven: .asciiz "Your number of elements is even\n"
isOdd: .asciiz "Your number of elements is odd\n"
######################################################################################
.text

main:
	li $v0, 4
	la $a0, promptMessage # Shows the message to the user
	syscall

	li $v0, 5
	syscall

	move $t0, $v0
	add $s6, $t0, 0
##############################################################

	li $t1, 0
	li $s3, 1 #Boolean comparison
	li $s4, 0 #Upper Limit
	li $s5, 10 # Lower Limit

	addi $t0, $v0, 0 # number of elements us stored $t0
	addi $s7, $t0, 0

	slt $s0, $s4, $t0 # If 0 is less than $t0, set $s0 equal to one
	bne $s3, $s0, errorMessage


	sgt $s1, $s5, $t0 # If s5 is greater than or equal to $t0, set $s1 equal to one
	bne $s3, $s1, errorMessage


#################################################################

	la $s0, array

loop:	beq $t1, $t0, restartArray

	li $v0, 4
	la $a0, str # Shows the message to the user
	syscall


	# addi $t1, $t1, 0

	li $v0, 5
	syscall

	sw $v0, 0($s0)
	addi $s0, $s0, 4
	addi $t1, $t1, 1

	j loop

errorMessage:

	li $v0, 4
	la $a0, error
	syscall

	j main

restartArray:
##################
	li $t2, 0
        beq $t1, $0, evenOrOdd
        addi $s0, $s0, -4

 	addi $t1, $t1, -1
        j restartArray
##################

evenOrOdd:

	li $v0, 4
	la $a0, evenOrOddMessage # Shows the message to the user
	syscall

	li $t7, 1
	div $t1, $t0, 2
	mfhi $t4


	bnez $t4, odd
	j even

even:
	li $t4, 2
	li $v0, 4
	la $a0, isEven # Shows the message to the user
	syscall

	################
	li $t6, 2
        li $v0, 4
       	li $t7, 4 #4 #multiplier

	div $s6, $t6
        mflo $t1

	mult $t1, $t7
	mflo $t1

	add $s0, $s0, $t1

	lw $t5, 0($s0)
	addi $s0, $s0, -4

	lw $t7, 0($s0)
	add $t5, $t5, $t7

	div $t5, $t4
	mflo $t5

	li $v0, 1
	move $a0, $t5
	syscall

	j exit

odd:

	li $t6, 2
        li $v0, 4
       	li $t7, 4 #4 #multiplier

	la $a0, isOdd # Shows the message to the user
	syscall

	div $s6, $t6
        mflo $t1

	mult $t1, $t7
	mflo $t1

	add $s0, $s0, $t1
	lw $t5, 0($s0)

	li $v0, 1
	move $a0, $t5
	syscall

	j exit

exit:

        li $v0, 10
        syscall
