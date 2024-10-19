`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 03:56:37 PM
// Design Name: 
// Module Name: tb_top
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
`define MAX_TIME 700


module tb_top;
    // Inputs
    reg clk_125, reset;
    wire unknown;
    
    top DUT (clk_125, reset, unknown);
    
    always begin
        #4;
        clk_125 = ~clk_125;
    end
    
    integer i;
    initial begin
        clk_125 = 1;
        reset = 0;
        
        
        for (i = 0; i < `MAX_TIME; i = i + 1) begin
            #1;
        end

        $finish;
    end

endmodule
