// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Fri Oct 18 23:36:32 2024
// Host        : tony running 64-bit Red Hat Enterprise Linux release 8.10 (Ootpa)
// Command     : write_verilog -force -mode synth_stub ./rv32i_cpu.v
// Design      : rv32i_cpu
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module rv32i_cpu(clk, async_reset_n, i_inst, i_mem_read_data, 
  o_unknown_inst, o_pc, o_address, o_mem_write_data, o_mem_we)
/* synthesis syn_black_box black_box_pad_pin="clk,async_reset_n,i_inst[31:0],i_mem_read_data[31:0],o_unknown_inst,o_pc[11:0],o_address[11:0],o_mem_write_data[31:0],o_mem_we[3:0]" */;
  input clk;
  input async_reset_n;
  input [31:0]i_inst;
  input [31:0]i_mem_read_data;
  output o_unknown_inst;
  output [11:0]o_pc;
  output [11:0]o_address;
  output [31:0]o_mem_write_data;
  output [3:0]o_mem_we;
endmodule
