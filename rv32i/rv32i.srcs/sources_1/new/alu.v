`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 02:28:44 PM
// Design Name: 
// Module Name: alu
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

module alu(
    input [31:0] i_src_1, i_src_2,
    input [ 3:0] i_alu_op,

    output reg [31:0] o_result,
    output            o_N, o_Z, o_C, o_V
    );
    `include "alu_op.vh"

    wire substrate, cout;
    wire [31:0] src_2_ext, src_2, alu_sum;
    wire [31:0] carry;
    
    assign substrate = (i_alu_op == SUB || i_alu_op == SLT || i_alu_op == SLTU) ? 1'b1 : 1'b0;
    assign src_2_ext = (i_alu_op == SLTU) ? {{20{i_src_2[11]}}, i_src_2} : i_src_2;
    assign src_2 = (substrate) ? ~i_src_2 : i_src_2;
    
    brent_kung_add_32bits inst0 (.a(i_src_1), .b(src_2), .cin(substrate), .sum(alu_sum), .cout(cout), .c(carry));

    always @(*) begin
        case(i_alu_op)
            ADD:  o_result = alu_sum;
            SUB:  o_result = alu_sum;
            SLT:  o_result = (o_N != o_V);
            SLTU: o_result = ~o_C;
            AND:  o_result = i_src_1 & i_src_2;
            OR:   o_result = i_src_1 | i_src_2;
            XOR:  o_result = i_src_1 ^ i_src_2;
            SLL:  o_result = i_src_1 << i_src_2[4:0];
            SRL:  o_result = i_src_1 >> i_src_2[4:0];
            SRA:  o_result = i_src_1 >>> i_src_2[4:0];
            default: o_result = 32'b0;
        endcase
    end

    assign o_N = alu_sum[31];
    assign o_Z = (alu_sum == 32'b0);
    assign o_C = cout;
    assign o_V = carry[31] ^ cout;
        
endmodule
