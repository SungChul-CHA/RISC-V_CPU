# RISC-V CPU

## RV32I

- [Post Project](https://github.com/SungChul-CHA/RISCV-SoC)

|  <b>RV32I Instruction Set</b>   |
| :-----------------------------: |
| ![rv32i_is](./src/rv32i_is.png) |

---

**CPU 관점에서 구분한 Instruction TYPE**

|  Inst  | Task                                           |     State     | note                                                        |
| :----: | :--------------------------------------------- | :-----------: | :---------------------------------------------------------- |
|  LUI   | rd = {imm20, 12'b0}                            |      WB       | U-TYPE                                                      |
| AUIPC  | rd = PC + {imm20, 12'b0}                       |   EXEI, WB    | U-TYPE                                                      |
|  JAL   | PC = PC + {imm20, 1'b0}<br>rd = PC + 4         |     JTYPE     | PC + 4 로직이 이미 있으므로,<br>U-TYPE과는 다르게 동작 가능 |
|  JALR  | PC = (rs1 + imm12) & {31'b1, 0}<br>rd = PC + 4 |     JTYPE     | PC + 4 로직이 이미 있으므로,<br>U-TYPE과는 다르게 동작 가능 |
| Branch | alu : rs1 - rs2<br>PC = PC + {imm12, 1'b0}     |     BTYPE     | alu 2번 써야함.<br> PC 값 update mux에 추가                 |
|  LOAD  | alu : rs1 + imm12<br>rd = \*alu_out            | EXEI, MEM, WB | Memory Read Timing 주의                                     |
| STORE  | alu : rs1 + imm12<br>\*alu_out = rs2           |   EXEI, MEM   | S-TYPE                                                      |
| I-TYPE | rd = rs1 + imm12                               |   EXEI, WB    | I-TYPE                                                      |
| R-TYPE | rd = rs1 + rs2                                 |   EXER, WB    | R-TYPE                                                      |

<br>

**ALU 관점에서 구분한 instruction type**

| opcode  | inst type |                             instruction                              |                        alu operate                         | alu source |
| :-----: | :-------: | :------------------------------------------------------------------: | :--------------------------------------------------------: | :--------: |
| 0110111 |     -     |                                 LUI                                  |                          NO OPER                           | NO SOURCE  |
| 0010111 |     -     |                                AUIPC                                 |                             +                              | PC, imm20  |
| 1101111 |  J-type   |                                 JAL                                  |                             +                              | PC, imm20  |
| 1100111 |  I-type   |                                 JALR                                 |                             +                              | rs1, imm12 |
| 1100011 |  B-type   |               BEQ<br>BNE<br>BLT<br>BGE<br>BLTU<br>BGEU               |                             -                              |  rs1, rs2  |
| 0000011 |  I-type   |                     LB<br>LH<br>LW<br>LBU<br>LHU                     |                             +                              | rs1, imm12 |
| 0100011 |  S-type   |                            SB<br>SH<br>SW                            |                             +                              | rs1, imm12 |
| 0010011 |  I-type   | ADDI<br>SLTI<br>SLTIU<br>XORI<br>ORI<br>ANDI<br>SLLI<br>SRLI<br>SRAI |  +<br>-<br>-<br>^<br> \| <br> & <br> << <br> >> <br> >>>   | rs1, imm12 |
| 0110011 |  R-type   |  ADD<br>SUB<br>SLL<br>SLT<br>SLTU<br>XOR<br>SRL<br>SRA<br>OR<br>AND  | +<br>-<br> << <br>-<br>-<br>^<br> >> <br> >>> <br>\| <br>& |  rs1, rs2  |

> alu_op : +, -, <<, ^, >>, >>>, |, & &rarr; 8개 = 3bit
