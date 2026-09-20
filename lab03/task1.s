.text
.globl
main:
addi x10, x0, 12 // x10 = 12
addi x11, x0, 12  // x11= 12

jal x1, sum   // go to sum but remember original memory address

addi x11, x10, 0  
li x10, 1  
ecall

j exit

sum: // inside sum
    add x10, x11, x10   // x11+x10 x10 = 12+12 = 24
    jalr x0, 0(x1)  // return back to original address then we print 24

exit: