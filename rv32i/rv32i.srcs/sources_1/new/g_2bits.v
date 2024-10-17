`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 09:09:05 PM
// Design Name: 
// Module Name: g_2bits
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


module g_2bits(
    input [1:0] g2,
    input p2,
    output g2o
    );
    
    assign g2o = g2[1] | (g2[0] & p2);
    
endmodule