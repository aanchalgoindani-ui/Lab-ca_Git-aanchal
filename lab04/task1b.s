
.text
.globl main

main:
    addi x10, x0, 5          # put 5 into x10 as the input number
    jal x1, fact             # call the factorial function

    addi x11, x10, 0         # copy the factorial result from x10 to x11
    addi x10, x0, 1          # ecall 1 is used to print an integer
    ecall                    # display the result in the terminal




fact:
    addi x5, x0, 1           # initialize x5 to 1
                              # x5 will store the running factorial result

loop:
    bge x0, x10, done        # if 0 >= n, the loop is finished

    mul x5, x5, x10          # multiply current result by n
                              # x5 = x5 * x10

    addi x10, x10, -1        # decrease n by 1

    jal x0, loop             # jump back to the beginning of the loop

done:
    addi x10, x5, 0          # copy the final factorial result into x10
    jalr x0, 0(x1)           # return to the main program

end:
    j end                    # keep the program running

