`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 06:32:29 PM
// Design Name: 
// Module Name: branch_find
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


module branch_resolution(
    input [2:0] funct3,
    input N, Z, C, V,
    
    output reg is_btrue
    );
        
    always @ (*) begin
        case (funct3)
            3'b000: is_btrue = Z;             // BEQ
            3'b001: is_btrue = ~Z;            // BNE
            3'b100: is_btrue = (N != V);      // BLT
            3'b101: is_btrue = (N != V || Z); // BGE
            3'b110: is_btrue = ~C;            // BLTU
            3'b111: is_btrue = (C || Z);      // BGEU
            default: is_btrue = 1'b0;
        endcase
    end
    
endmodule
