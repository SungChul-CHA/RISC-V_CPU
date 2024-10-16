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
    input wire [31:0] i_inst, mem_read_data,
    output wire [31:0] o_address, o_mem_write_data,
    output reg o_unknown_inst
    );
    


    // parsing instruction
    wire [6:0] op_code;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1, rs2;
    wire [6:0] funct7;
    wire [31:0] imm;

    ir_decoder ir_decoder_inst (i_inst, op_code, rd, funct3, rs1, rs2, funct7, imm);

    // FSM
    wire [3:0] c_state;
    fsm fsm_inst (clk, async_reset_n, op_code, o_unknown_inst, c_state);

    
    


    alu alu_inst (alu_srcA, alu_srcB, alu_op, alu_out, N, Z, C, V);
    regfile regfile_inst (clk, refile_we, rs1_addr, rs2_addr, rd_addr, rd_data, rs1_data, rs2_data);

endmodule
