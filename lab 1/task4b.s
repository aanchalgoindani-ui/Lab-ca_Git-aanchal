
main:
    li x5, 0x100
    li x6, 0x200
    li x7, 0x300

    # i = 0
    lb x10, 0(x5)
    lh x11, 0(x6)
    add x12, x10, x11
    sw x12, 0(x7)

    # i = 1
    lb x10, 1(x5)
    lh x11, 2(x6)
    add x12, x10, x11
    sw x12, 4(x7)

    # i = 2
    lb x10, 2(x5)
    lh x11, 4(x6)
    add x12, x10, x11
    sw x12, 8(x7)

    # i = 3
    lb x10, 3(x5)
    lh x11, 6(x6)
    add x12, x10, x11
    sw x12, 12(x7)
