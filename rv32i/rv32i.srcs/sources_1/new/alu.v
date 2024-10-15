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
    input [31:0] src_1, src_2,
    input [ 3:0] alu_op,

    output reg [31:0] result,
    output            N, Z, C, V
    );

    localparam ADD = 4'b0000;

    always @(*) begin
        case(alu_op)
            ADD: result = src_1 + src_2;
            default: result = 32'b0;
        endcase
    end    
    
endmodule
