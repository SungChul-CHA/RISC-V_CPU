/* OUTPUT_ARCH(riscv) */
/* ENTRY(begin) */
SECTIONS
{
        . = 0x00000000;
        .text :
        {
                *(.text) 
                *(.rodata)
        }

        . = ALIGN(4096);

        .data : {*(.data)}

        .bss : {*(.bss)}

}
