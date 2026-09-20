.text
.globl

strcpy:  // start of func

    addi sp, sp, -16    // saves 16 bytes of stack space
    sw x19, 0(sp)     // save the original x19 on the stack

    addi x19, x0, 0    // set x19 to 0
                      // x19 = i
loop:

    add x5, x10, x19    // calculates address of x[i]  x10 = base address of x x5 = address of x[i]
    add x6, x11, x19    // calculates the address of y[i] x11 = base address of y  x6 = address of y[i]

    lbu x7, 0(x6)      // loads one byte from y[i] lbu is load one byte
    sb x7, 0(x5)       // stores that byte into x[i]

    beq x7, x0, done    // branch if equal (is x7 equal to 0?) if yes we reached the end of the string now stop copying

    addi x19, x19, 1    // increase i by 1

    j loop         // jump back to the loop label

done:           // label we go to when string has reached "\0"

    lw x19, 0(sp)  //Restore the original x19 from the stack
    addi sp, sp, 16 // Release the stack space

    jalr x0, 0(x1)    // eturn to the place where strcpy was called.