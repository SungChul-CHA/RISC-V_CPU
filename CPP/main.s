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
	addi	sp,sp,-352
	sw	ra,348(sp)
	sw	s0,344(sp)
	sw	s1,340(sp)
	sw	s2,336(sp)
	addi	s0,sp,352
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
	lw	a5,-24(s0)
	addi	s2,a5,-1
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	mult
	mv	a4,a0
	mv	a5,s1
	slli	a5,a5,3
	add	a5,a5,s1
	add	a5,a5,s2
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-332(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L7:
	lw	a4,-24(s0)
	li	a5,9
	ble	a4,a5,.L8
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L6:
	lw	a4,-20(s0)
	li	a5,9
	ble	a4,a5,.L9
	lw	a4,-228(s0)
	li	a5,9
	bne	a4,a5,.L10
	li	a5,0
	j	.L12
.L10:
	li	a5,-1
.L12:
	mv	a0,a5
	lw	ra,348(sp)
	lw	s0,344(sp)
	lw	s1,340(sp)
	lw	s2,336(sp)
	addi	sp,sp,352
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e-dirty) 13.2.0"
