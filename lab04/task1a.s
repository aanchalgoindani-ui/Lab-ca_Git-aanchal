.text
.globl main

main:
    li x10, 5              # put 5 into x10 as the input number
    jal x1, fact            # call the recursive factorial function

    add x11, x10, x0        # copy the factorial result from x10 to x11
    li x10, 1               # ecall 1 = print integer
    ecall                   # display the result

end:
    j end                   # keep the program running




fact:
    addi sp, sp, -8         # make 8 bytes of space on the stack

    sw x1, 4(sp)            # save the return address on the stack
    sw x10, 0(sp)           # save the current value of n on the stack

    addi x5, x10, -1        # x5 = n - 1
    bge x5, x0, L1          # if n - 1 >= 0, continue recursion

    # Base case: if n < 1, return 1
    addi x10, x0, 1         # put 1 into x10 as the factorial result

    addi sp, sp, 8          # restore the stack pointer
    jalr x0, 0(x1)          # return to the calling function



L1:
    addi x10, x10, -1       # x10 = n - 1
    jal x1, fact             # recursively call fact(n - 1)

    addi x6, x10, 0          # save the returned factorial result in x6

    lw x10, 0(sp)            # restore the original n from the stack
    lw x1, 4(sp)             # restore the return address from the stack
    addi sp, sp, 8           # restore the stack pointer

    mul x10, x10, x6         # x10 = n * fact(n - 1)
    jalr x0, 0(x1)           # return the result to the caller