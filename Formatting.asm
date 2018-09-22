.data
title: .asciiz "Here is the Report of Top 5 Employees in Erickson Company\n"
border: .asciiz "---------------------------------------------------------\n"
legend:   .asciiz "    Last Name    First Name    Position    Salary\n"
Smith:    .asciiz "    Smith        Adam          Director    99010 \n"
Hadden:   .asciiz "    Hadden       Mary          Director    95220 \n"
Simpson:  .asciiz "    Simpson      Mike          Manager     80000 \n"
Williams: .asciiz "    Williams     Andrea        Designer    70000 \n"
Amer:     .asciiz "    Smith        Adam          Director    55000 \n"

.text
.globl main
main:

li $v0, 4
la $a0, title
syscall

li $v0, 4
la $a0, border
syscall

li $v0, 4
la $a0, legend
syscall

li $v0, 4
la $a0, Smith
syscall

li $v0, 4
la $a0, Hadden
syscall

li $v0, 4
la $a0, Simpson
syscall

li $v0, 4
la $a0, Williams
syscall

li $v0, 4
la $a0, Amer
syscall

li $v0, 4
la $a0, border
syscall