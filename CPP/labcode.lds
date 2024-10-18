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

        . = ALIGN(2048);

        .data : {*(.data)}

        .bss : {*(.bss)}

}
