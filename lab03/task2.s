.text
.globl
leaf_example:

    addi sp, sp, -16  // we are making 16 byte space

    sw x18, 0(sp) // x18 and x19 = temp register || save the old value of x18 onto the stack.
    sw x19, 8(sp)    //Save x19
    sw x20, 16(sp)    //Save x20

    add x18, x10, x11  // x18 = x10 + x11 == g+h
    add x19, x12, x13  // x19 = x12 + x13 basically i + j

    sub x20, x18, x19  // x20 = x18-x19  == (g+h)-(i+j)

    addi x10, x20, 0  // puts ans into x10

    lw x18, 0(sp)      //Get the original x18 back from the stack
    lw x19, 8(sp)      //Get the original x19 back
    lw x20, 16(sp)     // Get the original x20 back

    addi sp, sp, 16    //This releases the stack space we undo the above -24 command 

    jalr x0, 0(x1)   //Return to the place where the function was called
end:
    j end 