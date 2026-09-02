
main:
    li   x1, 5          
    li   x2, 0          

    addi x1, x2, 32     

    add  x3, x1, x2     
    addi x3, x3, -5     

    sub  x4, x1, x3     
    sub  x5, x2, x1     
    add  x4, x4, x5     
    add  x4, x4, x3     

    add  x4, x1, x4     
    add  x4, x2, x4     
    add  x4, x3, x4     
end:
    j end 
