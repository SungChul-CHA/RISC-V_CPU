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

`define OP_LUI      7'b0110111
`define OP_AUIPC    7'b0110111
`define OP_JAL      7'b1101111
`define OP_JALR     7'b1100111
`define OP_BRANCH   7'b1100011
`define OP_LOAD     7'b0000011
`define OP_S_type   7'b0100011
`define OP_I_ARITH  7'b0010011
`define OP_R_type   7'b0110011

module rv32i_cpu(
    input wire clk,
    input wire async_reset_n,
    input wire [31:0] i_inst,
    output wire [31:0] o_pc

    );
    
    // FSM
    localparam IDLE = 4'b0000;
    localparam RUN = 4'b0001;
    localparam DONE = 4'b0010;

    // localparam S_LUI = 4'b1000;
    // localparam S_AUIPC = 4'b1001;
    // localparam S_JAL = 4'b1010;
    // localparam S_JALR = 4'b1011;
    // localparam S_BRANCH = 4'b1100;
    // localparam S_LOAD = 4'b1101;
    // localparam S_S_TYPE = 4'b1110;
    // localparam S_I_ARITH = 4'b1111; 

    reg [3:0] c_state, n_state;

    wire alu_done;
    wire refile_we;
    wire [4:0] rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rd_data, rs1_data, rs2_data;

    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) begin
            c_state <= 0;
        end else begin
            c_state <= n_state;
        end
    end

    always @* begin
        case (c_state)
            IDLE: n_state = RUN;
            RUN:
                if(alu_done) n_state = DONE;
                else n_state = RUN;
            DONE: n_state = IDLE;
            default: n_state = IDLE;
        endcase
    end

    alu     alu_inst     (alu_srcA, alu_srcB, alu_op, alu_out, N, Z, C, V);
    regfile regfile_inst (clk, refile_we, rs1_addr, rs2_addr, rd_addr, rd_data, rs1_data, rs2_data);

endmodule
