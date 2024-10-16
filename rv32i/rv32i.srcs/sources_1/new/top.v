`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:09:11 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input [11:0] pc, addrb,
    input cs_mem,
    input [3:0] data_we,
    input [31:0] write_data,
    output [31:0] read_data_mem, inst
    );
    
//    rv32i_cpu iCPU ();
    
    tdpram_4096x32 iMEM (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc),
        .dina (32'b0), 
        .douta (inst), 
        .clkb (clk), 
        .enb (cs_mem), 
        .web (data_we),
        .addrb(addrb), 
        .dinb (write_data), 
        .doutb (read_data_mem)
    );
    
endmodule
