.data

programDescription: .asciiz "Program Description: This .acm file asks for user input then adds even numbers together\n\n\t"

author: .asciiz "Author: Ryan Pisuena\n\n\t"

creationDueDate: .asciiz "Due Date: 9/10/2018\n\n\t"

str1: .asciiz "Welcome! How many numbers would you like to add? \n\n\t"

str2: .asciiz "The sum of the even numbers is "

.text

main:

#header call
################
li $v0, 4
la $a0, programDescription
syscall

li $v0, 4
la $a0, author
syscall

li $v0, 4
la $a0, creationDueDate
syscall
################

#Prompt user input for number of integers to input
#################
li $v0, 4
la $a0, str1
syscall
#################

#Get the user input
#################
li $v0, 5
syscall
################

#store the user input
#################
add $s0, $v0, $0
#################

#For loop for integers
########################
loop:
beq $t0, $s0, end
addi $t0, $t0, 1
#######################

#input
#######################
li $v0, 5
syscall
#######################

add $s1, $v0, $0
#division
######################
div $s1, $t6
mfhi $t2  #the remainder to determine if it is odd or even
######################

######################
evenLoop:
beq $t2, $0, Addition
j loop
#####################

#####################
Addition:
add $t1, $t1, $s1
j loop
#####################

#####################
end:

li $v0, 4
la $a0, str2
syscall

li $v0, 1
add $a0, $t1, $0
syscall
#####################
