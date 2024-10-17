# RISC-V CPU

## RV32I

- [Post Project](https://github.com/SungChul-CHA/RISCV-SoC)

|  <b>RV32I Instruction Set</b>   |
| :-----------------------------: |
| ![rv32i_is](./src/rv32i_is.png) |

---

**수행해야 할 동작으로 구분한 Instruction TYPE**

|  Inst  | Task                                           |     State     | note                                        |
| :----: | :--------------------------------------------- | :-----------: | :------------------------------------------ |
|  LUI   | rd = {imm20, 12'b0}                            |      WB       | U-TYPE                                      |
| AUIPC  | rd = PC + {imm20, 12'b0}                       |   EXEI, WB    | U-TYPE                                      |
|  JAL   | PC = PC + {imm20, 1'b0}<br>rd = PC + 4         |   EXEI, WB    | J-TYPE                                      |
|  JALR  | PC = (rs1 + imm12) & {31'b1, 0}<br>rd = PC + 4 |   EXEI, WB    | J-TYPE                                      |
| Branch | alu : rs1 - rs2<br>PC = PC + {imm12, 1'b0}     |  BTYPE, EXEI  | alu 2번 써야함.<br> PC 값 update mux에 추가 |
|  LOAD  | alu : rs1 + imm12<br>rd = \*alu_out            | EXEI, MEM, WB | Memory Read Timing 주의                     |
| STORE  | alu : rs1 + imm12<br>\*alu_out = rs2           |   EXEI, MEM   | S-TYPE                                      |
| I-TYPE | rd = rs1 + imm12                               |   EXEI, WB    | I-TYPE                                      |
| R-TYPE | rd = rs1 + rs2                                 |   EXER, WB    | R-TYPE                                      |

> State : FETCH, DECODE, EXEI, EXER, BTYPE, MEM, WB &rarr; 7개<br>
> 9개 : MEM &rarr; MEM_R, MEM_W + J_TYPE<br>
> 11개 : WB &rarr; MEM_WB, ALU_WB + EXE_MEM_ADDR

<br>

**instruction 구조로 구분한 instruction type**

|  opcode   | inst type |                             instruction                              |                        alu operate                         |         alu source          |
| :-------: | :-------: | :------------------------------------------------------------------: | :--------------------------------------------------------: | :-------------------------: |
| 01_101_11 |  U-type   |                                 LUI                                  |                          NO OPER                           |          NO SOURCE          |
| 00_101_11 |  U-type   |                                AUIPC                                 |                             +                              |          PC, imm20          |
| 11_011_11 |  J-type   |                                 JAL                                  |                             +                              |          PC, imm20          |
| 11_001_11 |  I-type   |                                 JALR                                 |                             +                              |         rs1, imm12          |
| 11_000_11 |  B-type   |               BEQ<br>BNE<br>BLT<br>BGE<br>BLTU<br>BGEU               |                             -                              | 1. rs1, rs2<br>2. PC, imm12 |
| 00_000_11 |  I-type   |                     LB<br>LH<br>LW<br>LBU<br>LHU                     |                             +                              |         rs1, imm12          |
| 01_000_11 |  S-type   |                            SB<br>SH<br>SW                            |                             +                              |         rs1, imm12          |
| 00_100_11 |  I-type   | ADDI<br>SLTI<br>SLTIU<br>XORI<br>ORI<br>ANDI<br>SLLI<br>SRLI<br>SRAI |  +<br>-<br>-<br>^<br> \| <br> & <br> << <br> >> <br> >>>   |         rs1, imm12          |
| 01_100_11 |  R-type   |  ADD<br>SUB<br>SLL<br>SLT<br>SLTU<br>XOR<br>SRL<br>SRA<br>OR<br>AND  | +<br>-<br> << <br>-<br>-<br>^<br> >> <br> >>> <br>\| <br>& |          rs1, rs2           |

> alu_op : +, -, <<, ^, >>, >>>, |, & &rarr; 8개 = 3bit

---

![simple_diagram](./src/diagram.png)

> MUX, DEMUX 빠진 그림

<br>

|        <b>FSM 구조</b>        |
| :---------------------------: |
| ![fsm_diagram](./src/fsm.png) |

> FETCH : PC Update, Instruction Read<br>
> DECODE : Datapath Configure(imm, alu src, alu out, rd, rs1, rs2, pc_next, ...)<br>
> BTYPE : branch condition check, Calculate Next PC / Go to Fetch<br>
> EXEI : Calculate, Write Back / Use the result as Memory Addr<br>
> EXER : Calculate<br>
> MEM : R/W from/to Mem (DECODE State choose)<br>
> WB : Store to Register Files

<br>

![cpu_waveform](./src/waveform.png)

> 자세한 타이밍은 맞지 않을 수 있음.

---

|           <b>FSM Waveform</b>           |
| :-------------------------------------: |
| ![fsm waveform](./src/fsm_waveform.png) |

> 0 : Fetch<br>
> 1 : Decode<br>
> 2 : EXE I-type<br>
> 3 : EXE R-type<br>
> 4 : B-type<br>
> 5 : Memory Access<br>
> 6 : Write Back<br>
> 7 : Error<br>

|    <b>Program Counter Waveform</b>     |
| :------------------------------------: |
| ![fsm waveform](./src/pc_waveform.png) |

> pc_next : pc + 4 <br>
> pc : current pc

|       <b>Controller Waveform</b>       |
| :------------------------------------: |
| ![fsm waveform](./src/pc_waveform.png) |

> State
>
> 0 : Fetch<br>
>> 1 : Decode<br>
>> 2 : EXE I-type<br>
>> 3 : EXE R-type<br>
>> 4 : B-type<br>
>> 5 : Memory Access<br>
>> 6 : Write Back<br>
>> 7 : Error<br>
> <br>
> alu_op
>> 0000 : ADD<br>
>> 0001 : SUB<br>
>> 0010 : SLT<br>
>> 0011 : SLTU<br>
>> 0100 : XOR<br>
>> 0101 : OR<br>
>> 0110 : AND<br>
>> 0111 : SLL<br>
>> 1000 : SRL<br>
>> 1001 : SRA<br>
> <br>
> rd_source
>> 11 : OP_LUI<br>
>> 10 : OP_JAL, OP_JALR<br>
>> 01 : OP_LOAD<br>
>> 00 : default
