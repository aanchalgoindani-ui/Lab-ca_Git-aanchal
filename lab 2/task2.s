.text
.globl main
main:
    li x20, 1
    li x21, 1
    li x22, 5
    li x23, 6
    
    li x5 , 1
    beq x20 , x5, case1
    
    li x5 , 2
    beq x20, x5, case2

    li x5 , 3
    beq x20 , x5, case3

    li x5 , 4
    beq x20 , x5, case4

    li x21, 0 
    beq x0 , x0, exit

case1:
    add x21, x22, x23
    beq x0, x0, exit

case2:
    sub x21, x22, x23
    beq x0, x0, exit

case3:
    slli x21, x22, 1
    beq x0, x0, exit
case4:
    srai x21,x22, 1
    beq x0, x0, exit

exit:
end:
    j end 