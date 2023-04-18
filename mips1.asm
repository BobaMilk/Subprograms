.text
main:
# Get user input
jal intInput
move $t0, $v0
jal intInput
move $t1, $v0

# Stores the two numbers into $t0 and $t1
move $a0, $t0
move $a1, $t1

# NOR subprogram
jal NOR
move $t2, $a0
 
# Print out NOR
li $v0, 4
la $a0, norResult
syscall

li $v0, 1
move $a0, $t2
syscall
jal newLine

# NAND subprogram
move $a0, $t0
move $a1, $t1
jal NAND
move $t2, $a0

# Print out NAND
li $v0, 4
la $a0, nandResult
syscall

li $v0, 1
move $a0, $t2
syscall
jal newLine

# NOT subprogram
jal intInput
move $t3, $v0
move $a0, $t3

jal NOT
move $t4, $a0

# Print out NOT
li $v0, 4
la $a0, notResult
syscall

li $v0, 1
move $a0, $t4
syscall
jal newLine

# Mult4 subprogram
move $a0, $t3
jal Mult4
move $t5, $a0

# Print out Mult4
li $v0, 4
la $a0, mult4Result
syscall

li $v0, 1
move $a0, $t5
syscall
jal newLine

# Mult10 subprogram
move $a0, $t3
jal Mult10
move $t5, $a1

# Print out Mult10
li $v0, 4
la $a0, mult10Result
syscall

li $v0, 1
move $a0, $t5
syscall
jal newLine

# Get user input
jal intInput
move $t0, $v0
jal intInput
move $t1, $v0

# Print before swap
li $v0, 4
la $a0, beforeSwap
syscall

li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, comma
syscall

li $v0, 1
move $a0, $t1
syscall
jal newLine

# Stores the two numbers into $a0 and $a1
move $a0, $t0
move $a1, $t1

# Swap subprogram
jal Swap

# Print after swap
li $v0, 4
la $a0, afterSwap
syscall

li $v0, 1
move $a0, $a3
syscall

li $v0, 4
la $a0, comma
syscall

li $v0, 1
move $a0, $a1
syscall
jal newLine

# RightCircularShift subprogram
jal intInput
move $t1, $v0
li $v0, 4
la $a0, rightResult
syscall
move $a1, $t1
jal RightCircShift

li $v0, 1
syscall

li $v0, 4
la $a0, comma
syscall

li $v0, 1
move $a0, $a2
syscall

jal newLine

# LeftCircularShift subprogram
li $v0, 4
la $a0, leftResult
syscall
move $a1, $t1
jal LeftCircShift

li $v0, 1
syscall

li $v0, 4
la $a0, comma
syscall

li $v0, 1
move $a0, $a2
syscall

jal newLine

# Get string
li $v0, 4
la $a0, promptString
syscall

li $v0, 8
addi $a1, $zero, 4
la $a0, input
syscall

# ToUpper subprogram
jal Upper
jal newLine
li $v0, 4
la $a0, upperCase
syscall
li $v0, 4
la $a0, input
syscall

# ToLower subprogram
jal Lower
jal newLine
li $v0, 4
la $a0, lowerCase
syscall
li $v0, 4
la $a0, input
syscall

# End program
jal Exit

.data
input: .space 32
norResult: .asciiz "NOR result: "
nandResult: .asciiz "NAND result: "
notResult: .asciiz "NOT result: "
mult4Result: .asciiz "Mult4 result: "
mult10Result: .asciiz "Mult10 result: "
beforeSwap: .asciiz "Before swap: "
afterSwap: .asciiz "After swap: "
comma: .asciiz ","
promptString: .asciiz "Please enter 3 characters: "
rightResult: .asciiz "Right circular shift result: "
leftResult: .asciiz "Left circular shift result: "
upperCase: .asciiz "Uppercase: "
lowerCase: .asciiz "Lowercase: "
.include "utils.asm"

