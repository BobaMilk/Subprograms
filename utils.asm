.text

# NOR subprogram - take two input parameters, and return the NOR operation on those two parameter.
NOR:
nor $a0, $a0, $a1
jr $ra

# NAND- take two input parameters, and return the NAND operation on those two parameter.
NAND:
and $a0, $a0, $a1
not $a0, $a0
jr $ra

# NOT- take one input parameters, and return the NOT operation on that parameter.
NOT:
not $a0, $a0
jr $ra

# Mult4 - take an input parameter, and return that parameter multiplied by 4 using only shift and add operations.
Mult4:
sll $a0, $a0, 2
jr $ra

# Mult10 - take an input parameter, and return that parameter multiplied by 10
# using only shift and add operations.
Mult10:
sll $a1, $a0, 3
add $a1, $a0, $a1
add $a1, $a0, $a1
jr $ra

# Swap- take two input parameters, swap them using only the XOR operation.
# a0 = num1 a1 = num2
Swap:
xor $a3, $a0, $a1
xor $a1, $a3, $a1
xor $a3, $a3, $a0
jr $ra

# RightCircularShift - take an input parameter, and return two values. The first
# is the value that has been shifted 1 bit using a right circular shift, and the second is
# the value of the bit which has been shifted.
RightCircShift:
andi $a0, $a1, 1
ror $a2, $a1, 1
jr $ra

# LeftCircularShift - take an input parameter, and return two values. The first
# is the value that has been shifted 1 bit using a left circular shift, and the second is
# the value of the bit which has been shifted
LeftCircShift:
rol $a0, $a1, 1
andi $a2, $a1, 1
jr $ra

# ToUpper - take a 32 bit input which is 3 characters and a null, or a 3 character
# string. Convert the 3 characters to upper case if they are lower case, or do nothing
# if they are already upper case.
Upper:
lb $t1, 0($a0)
blt $t1, 97, USkip1
subi $t1, $t1, 32
sb $t1, 0($a0)
USkip1:
lb $t1, 1($a0)
blt $t1, 97, USkip2
subi $t1, $t1, 32
sb $t1, 1($a0)
USkip2:
lb $t1, 2($a0)
blt $t1, 97, UEnd
subi $t1, $t1, 32
sb $t1, 2($a0)

UEnd:
jr $ra

# ToLower - take a 32 bit input which is 3 characters and a null, or a 3 character
# string. Convert the 3 characters to lower case if they are upper case, or do nothing
# if they are already lower case.
Lower:
lb $t1, 0($a0)
bgt $t1, 90, LSkip1
addi $t1, $t1, 32
sb $t1, 0($a0)
LSkip1:
lb $t1, 1($a0)
bgt $t1, 90, LSkip2
addi $t1, $t1, 32
sb $t1, 1($a0)
LSkip2:
lb $t1, 2($a0)
bgt $t1, 90, LEnd
addi $t1, $t1, 32
sb $t1, 2($a0)

LEnd:
jr $ra


intInput:
# Print "Please enter a number: "
li $v0, 4 
la $a0, intPrompt
syscall

li $v0, 5
syscall
jr $ra


newLine:
li $v0, 4
la $a0, NewLine
syscall
jr $ra


Exit:
li $v0, 10
syscall

.data
intPrompt: .asciiz "Please enter a number: "
NewLine: .asciiz "\n"
