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

    );
    
    rv32i_cpu iCPU ();
    
    tdpram_4096x32 iMEM (
        .clka (clk90), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (),
        .dina (32'b0), 
        .douta (inst), 
        .clkb (clk180), 
        .enb (cs_mem), 
        .web ({4{data_we}}),
        .addrb(), 
        .dinb (write_data), 
        .doutb (read_data_mem)
    );
    
endmodule
