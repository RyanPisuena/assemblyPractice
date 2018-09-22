.data

programDescription: .asciiz "Program Description: This .acm file replicates a basic four function calculator\n\n\t"

author: .asciiz "Author: Ryan Pisuena\n\n\t"

creationDueDate: .asciiz "Due Date: 9/10/2018\n\n\t"

num: .asciiz "Welcome
to basic calculator! Please input two numbers for us to perform addition, subtraction, division and multiplication: \n "

sum: .asciiz "\nYour sum comes out to be: "

diff: .asciiz "\nYour difference comes out to be: "

product: .asciiz "\nYour product comes out to be: "

quot: .asciiz "\nYour quotient comes out to be: "

remainder: .asciiz "\nYour remainder comes out to be: "

.text

main:
#Printing out the header for our program

li $v0, 4
la $a0, programDescription
syscall

li $v0, 4
la $a0, author
syscall

li $v0, 4
la $a0, creationDueDate
syscall

#t0-to hold first integer

#t1-to hold second integer

# Code section for the first number

li $v0, 4 #syscall to print string
la $a0, num #address of string to print

syscall

li $v0, 5 #syscall to read the first integer input into

syscall

move $t0, $v0 #move the number to read into $t0



li $v0,5 # this line retrieves the second integer

syscall

move $t1,$v0

#print sum

li $v0, 4

la $a0, sum

syscall





Sum:

add $t2, $t0,$t1

move $a0, $t2

li $v0, 1

syscall







#print diff

li $v0, 4

la $a0, diff

syscall





Difference:

sub $t2, $t0,$t1

move $a0, $t2

li $v0, 1

syscall





#print out multiply

li $v0, 4

la $a0, product

syscall





#multiply

Multiply:

mul $t2, $t0,$t1

move $a0, $t2



li $v0, 1

syscall



#print out quotient

li $v0, 4

la $a0, quot

syscall



#division

Division:

div $t0,$t1

mflo $a0



li $v0, 1

syscall



#print out remainder

li $v0, 4

la $a0, remainder

syscall



mfhi $a0

li $v0, 1

syscall



li $v0, 10

syscall
