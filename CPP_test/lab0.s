.text
.align 4

        la sp, stack
        addi	a4, x0,121
	lui	a5, 0xffff2
	addi	a5, a5,12
	sw	a4, 0(a5)

.data
.align 4
stack:
        .space 1024
