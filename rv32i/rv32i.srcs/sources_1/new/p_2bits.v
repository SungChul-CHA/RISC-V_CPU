`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 09:09:05 PM
// Design Name: 
// Module Name: p_2bits
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


module p_2bits(
    input [1:0] p2,
    output p2o
    );
    
    assign p2o = p2[1] & p2[0];
    
endmodule
