.text
.globl main

main:
    addi x10, x0, 0x100       # array address
    addi x11, x0, 5           # array length

    jal x1, bubble            # call bubble

    jal x0, end               # go to end


bubble:
    beq x10, x0, done         # if array is null, return
    beq x11, x0, done         # if length is 0, return

    addi x5, x0, 0            # i = 0

outer:
    bge x5, x11, done         # if i >= len, finish

    addi x6, x5, 0            # j = i

inner:
    bge x6, x11, next_i       # if j >= len, go to next i

    slli x7, x5, 2            # get offset for a[i]
    add x7, x10, x7           # get address of a[i]
    lw x8, 0(x7)              # get a[i]

    slli x9, x6, 2            # get offset for a[j]
    add x9, x10, x9           # get address of a[j]
    lw x12, 0(x9)              # get a[j]

    bge x8, x12, no_swap      # if a[i] >= a[j], no swap

    sw x12, 0(x7)             # put a[j] into a[i]
    sw x8, 0(x9)               # put a[i] into a[j]

no_swap:
    addi x6, x6, 1            # j = j + 1
    jal x0, inner              # repeat inner loop

next_i:
    addi x5, x5, 1            # i = i + 1
    jal x0, outer              # repeat outer loop

done:
    jalr x0, 0(x1)             # return

end:
    jal x0, end                # keep program running