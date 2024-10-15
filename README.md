# RISC-V CPU

## RV32I

- [Last Project](https://github.com/SungChul-CHA/RISCV-SoC)

|  <b>RV32I Instruction Set</b>   |
| :-----------------------------: |
| ![rv32i_is](./src/rv32i_is.png) |

| opcode  |  type  |                             instruction                              |                        alu operate                         |
| :-----: | :----: | :------------------------------------------------------------------: | :--------------------------------------------------------: |
| 0110111 |   -    |                                 LUI                                  |                          NO OPER                           |
| 0010111 |   -    |                                AUIPC                                 |                             +                              |
| 1101111 | J-type |                                 JAL                                  |                             +                              |
| 1100111 | I-type |                                 JALR                                 |                             +                              |
| 1100011 | B-type |               BEQ<br>BNE<br>BLT<br>BGE<br>BLTU<br>BGEU               |                             -                              |
| 0000011 | I-type |                     LB<br>LH<br>LW<br>LBU<br>LHU                     |                             +                              |
| 0100011 | S-type |                            SB<br>SH<br>SW                            |                             +                              |
| 0010011 | I-type | ADDI<br>SLTI<br>SLTIU<br>XORI<br>ORI<br>ANDI<br>SLLI<br>SRLI<br>SRAI |  +<br>-<br>-<br>^<br> \| <br> & <br> << <br> >> <br> >>>   |
| 0110011 | R-type |  ADD<br>SUB<br>SLL<br>SLT<br>SLTU<br>XOR<br>SRL<br>SRA<br>OR<br>AND  | +<br>-<br> << <br>-<br>-<br>^<br> >> <br> >>> <br>\| <br>& |

> alu_op : +, -, <<, ^, >>, >>>, |, & &rarr; 8개 = 3bit
