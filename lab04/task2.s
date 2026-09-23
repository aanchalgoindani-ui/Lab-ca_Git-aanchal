.text 
.globl main 

main: 
    addi x10, x0, 5          # put 5 in x10
    jal x1, ntri             # call ntri
 
    addi x11, x10, 0         # copy result to x11
    addi x10, x0, 1          # set ecall to print integer
    ecall                    # print result
     
ntri: 
    addi sp, sp, -8          # make space on stack
    sw x1, 4(sp)             # save return address
    sw x10, 0(sp)            # save current number
 
    addi x5, x10, -1         # x5 = n - 1
    bge x0, x5, base         # if n <= 1, go to base
 
    addi x10, x10, -1        # decrease n by 1
    jal x1, ntri             # call ntri again
 
    addi x6, x10, 0          # save returned result
 
    lw x10, 0(sp)            # get original n
    lw x1, 4(sp)             # get return address
    addi sp, sp, 8           # restore stack
 
    add x10, x10, x6         # add n + result
    jalr x0, 0(x1)           # return
 
base: 
    addi x10, x0, 1          # return 1
 
    lw x1, 4(sp)             # get return address
    addi sp, sp, 8           # restore stack
 
    jalr x0, 0(x1)           # return
 
end: 
    j end                    # keep program running