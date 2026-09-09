.text
.globl main
main:
    li x22, 0
    li x23, 0
    li x24, 0x200

loop1:
    li x25, 10 
    bge x22, x25 , loop2

    slli  x26, x22 , 2
    add  x27, x24 , x26
    sw x22 , 0(x27)
    addi x22, x22, 1 
    beq x0, x0 , loop1
loop2:
    li x22, 0 

sumloop:
    li x25, 10 
    bge x22, x25, exit

    slli x26, x22 , 2
    add  x27, x24 , x26
    lw x28 , 0(x27)
    add x23, x23, x28
    addi x22 , x22, 1
    beq x0, x0 , sumloop
exit:
end:
    j end 