.text
.globl main

main:
    li x7, 0          # i = 0
    li x5, 5          # a = 5
    li x6, 5          # b = 5

loop1:
    bge x7, x5, exit  # if i >= a, exit

    li x29, 0         # j = 0

loop2:
    bge x29, x6, next_i   # if j >= b, go to next i

    slli x11, x29, 4     # 4*j × 4 bytes = 16*j
    add x11, x10, x11    # address of D[4*j]

    add x30, x7, x29     # i + j
    sw x30, 0(x11)       # D[4*j] = i + j

    addi x29, x29, 1     # j++
    beq x0, x0, loop2

next_i:
    addi x7, x7, 1       # i++
    beq x0, x0, loop1

exit: