`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 02:18:19 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input clk, async_reset_n, i_is_alu,
    input  [2:0]  c_state,
    input  [31:0] i_pc_in,
    
    output [31:0] o_pc, o_pc4
    );

    reg [31:0] pc_next, pc_next_reg;

    always @ (*) begin
        if (i_is_alu) pc_next = i_pc_in;
        else pc_next = o_pc + 31'd4;
    end

    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) pc_next_reg <= 0;
        else if (c_state != 3'b000) pc_next_reg <= pc_next;
    end

    assign o_pc = (c_state == 3'b000) ? pc_next_reg : o_pc;
    assign o_pc4 = pc_next;

endmodule
