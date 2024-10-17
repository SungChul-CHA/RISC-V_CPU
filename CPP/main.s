	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	mult
	.type	mult, @function
mult:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-24(s0)
	j	.L2
.L3:
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L3
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	mult, .-mult
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	sw	s1,100(sp)
	addi	s0,sp,112
	li	a5,1
	sw	a5,-20(s0)
	j	.L6
.L9:
	li	a5,1
	sw	a5,-24(s0)
	j	.L7
.L8:
	lw	a5,-20(s0)
	addi	s1,a5,-1
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	mult
	mv	a4,a0
	slli	a5,s1,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-88(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L7:
	lw	a4,-24(s0)
	li	a5,19
	ble	a4,a5,.L8
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L6:
	lw	a4,-20(s0)
	li	a5,19
	ble	a4,a5,.L9
	li	a5,0
	mv	a0,a5
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	addi	sp,sp,112
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e-dirty) 13.2.0"
