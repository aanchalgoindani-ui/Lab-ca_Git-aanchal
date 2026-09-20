.text
.globl

// one long = 4 bytes v = x10 and k = x11 so k x 8 gives us location of v[k]

swap:

    slli x11, x11, 2  // shifts x11 by 3 bits

    add x5, x10, x11   // x5 = base address + offset == address of v[k]

    lw x6, 0(x5)   //Load the value at the address stored in x5 and x6 temporarily stores the first value.

    lw x7, 4(x5)   // load the next long since one long is 8 bytes x7 = v[k+1]

    sw x7, 0(x5)    // Store x7 into the location of v[k].

    sw x6, 4(x5)    //Store x6 into the next location.

    jalr x0, 0(x1)  //Return from the function

end:
    j end 