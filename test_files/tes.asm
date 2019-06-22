# C- Compilation to SPIM Code
# Source File: ./test_files/tes.asm
.align 2
.globl main

f:
# set frame pointer
move $fp,$sp
# push the return address
addiu $sp,$sp,-4
sw $ra,0($sp)

addiu $sp,$sp,-4 # allocate locals

addiu $sp,$sp,4 # free locals


# restore return address
lw $ra,-4($fp)
# copy the fp to the sp
move $sp,$fp
# load the control link into the fp
lw $fp,0($fp)
# jump to the return address
j $ra

func:
# set frame pointer
move $fp,$sp
# push the return address
addiu $sp,$sp,-4
sw $ra,0($sp)

addiu $sp,$sp,-8 # allocate locals

li $t0, 0
sw $t0, -48($fp)
$_L0: # loop
# evaluate the loop condition
li $t1, 0
# exit if the condition is false
beq $t0,$0,$_L1

# loop body
addiu $sp,$sp,-4 # allocate locals

sw $t0, 8($fp)
li $t1, 1
sw $t0, 4($fp)
li $t1, 1
sw $t0, -48($fp)
# evaluate the condition
sw $t0, 4($fp)
# branch to else if the condition is false
beq $t0,$0,$_L2

# if block
# evaluate the condition
li $t1, 1
# branch to else if the condition is false
beq $t0,$0,$_L4

# if block
li $t0, 0
sw $t0, -48($fp)
# jump to end
j $_L5

# else
$_L4:
li $t0, 1
sw $t0, -48($fp)
# end of if statement
$_L5:

# jump to end
j $_L3

# else
$_L2:
# end of if statement
$_L3:

addiu $sp,$sp,4 # free locals

j $_L0 # loop
$_L1: # loop exit
# evaluate the condition
li $t0, 1
# branch to else if the condition is false
beq $t0,$0,$_L6

# if block
addiu $sp,$sp,-8 # allocate locals

addiu $sp,$sp,8 # free locals

# jump to end
j $_L7

# else
$_L6:
# end of if statement
$_L7:

# evaluate the condition
li $t0, 0
# branch to else if the condition is false
beq $t0,$0,$_L8

# if block
addiu $sp,$sp,-8 # allocate locals

addiu $sp,$sp,8 # free locals

# jump to end
j $_L9

# else
$_L8:
# end of if statement
$_L9:

move $v0, $t0 # set return value
addiu $sp,$sp,8 # free locals


# restore return address
lw $ra,-4($fp)
# copy the fp to the sp
move $sp,$fp
# load the control link into the fp
lw $fp,0($fp)
# jump to the return address
j $ra

main:
# set frame pointer
move $fp,$sp
# push the return address
addiu $sp,$sp,-4
sw $ra,0($sp)

addiu $sp,$sp,-4 # allocate locals

$_L10: # loop
# evaluate the loop condition
li $t0, 1
sw $t0, -8($fp)
# exit if the condition is false
beq $t0,$0,$_L11

# loop body
addiu $sp,$sp,-4 # allocate locals

sw $t0, -12($fp)
# evaluate the condition
# branch to else if the condition is false
beq $t0,$0,$_L12

# if block
sw $t0, -8($fp)
# jump to end
j $_L13

# else
$_L12:
addiu $sp,$sp,-8 # allocate locals

sw $t0, -16($fp)
$_L14: # loop
# evaluate the loop condition
# exit if the condition is false
beq $t0,$0,$_L15

# loop body
addiu $sp,$sp,-4 # allocate locals

# evaluate the condition
li $t0, 1
# branch to else if the condition is false
beq $t0,$0,$_L16

# if block
addiu $sp,$sp,-4 # allocate locals

sw $t0, -28($fp)
addiu $sp,$sp,4 # free locals

# jump to end
j $_L17

# else
$_L16:
# end of if statement
$_L17:

addiu $sp,$sp,4 # free locals

j $_L14 # loop
$_L15: # loop exit
sw $t0, -20($fp)
addiu $sp,$sp,8 # free locals

# end of if statement
$_L13:

addiu $sp,$sp,4 # free locals

j $_L10 # loop
$_L11: # loop exit
sw $t0, -8($fp)
addiu $sp,$sp,4 # free locals


# restore return address
lw $ra,-4($fp)
# copy the fp to the sp
move $sp,$fp
# load the control link into the fp
lw $fp,0($fp)
# jump to the return address
j $ra

.data
arr: .word 10
brr: .word 20
crr: .word 30
# End of code.