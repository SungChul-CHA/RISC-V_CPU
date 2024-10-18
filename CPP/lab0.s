.text
.align 4

        la sp, stack
        j       main


.data
.align 4
stack:
        .space 2048
