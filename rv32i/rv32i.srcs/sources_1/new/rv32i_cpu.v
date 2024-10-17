`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 12:52:00 PM
// Design Name: 
// Module Name: rv32i_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rv32i_cpu(
    input wire clk,
    input wire async_reset_n,
    input wire [31:0] i_inst, i_mem_read_data,
    output wire [31:0] o_address, o_mem_write_data,
    output [11:0] o_pc,
    output reg o_unknown_inst
    );
    
    // PC
    wire [11:0] pc, pc_4;

    // parsing instruction
    wire [6:0] op_code;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1, rs2;
    wire [6:0] funct7;
    wire [31:0] imm;

    // Controller
    wire is_branch;
    wire alu_a_is_pc, alu_b_is_imm, pc_is_alu;
    wire [1:0] rd_source;   // 00 : default, 01 : read_data, 10 : pc + 4, 11 : lui


    // FSM
    wire [2:0] c_state;

    // ALU
    wire [31:0] alu_srcA, alu_srcB, alu_out;
    wire [3:0] alu_op;
    wire N, Z, C, V;


    // PC
    assign o_pc = pc;

    PC pc_inst (clk, async_reset_n, pc_is_alu, c_state, alu_out, pc, pc_4);

    // Instruction Decoder
    ir_decoder ir_decoder_inst (i_inst, op_code, rd, funct3, rs1, rs2, funct7, imm);

    // Controller
    assign alu_srcA = (alu_a_is_pc) ? pc : rs1_data;
    assign alu_srcB = (alu_b_is_imm) ? imm : rs2_data;

    controller ctrl_inst(c_state, op_code, funct3, funct7, is_branch, pc_is_alu, alu_op, alu_a_is_pc, alu_b_is_imm, rd_source);

    
    fsm fsm_inst (clk, async_reset_n, is_branch, op_code, o_unknown_inst, c_state);

    alu alu_inst (alu_srcA, alu_srcB, alu_op, alu_out, N, Z, C, V);
    
    regfile regfile_inst (clk, refile_we, rs1_addr, rs2_addr, rd_addr, rd_data, rs1_data, rs2_data);

endmodule
