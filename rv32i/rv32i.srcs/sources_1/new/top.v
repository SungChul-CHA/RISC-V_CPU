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
    input clk, async_reset_n,
    output unknown_inst
    );
    
    rv32i_cpu iCPU (
    .clk(clk),
    .async_reset_n(async_reset_n),
    .i_inst(inst),
    .i_mem_read_data(read_data_mem),
    
    .o_unknown_inst(unknown_inst),
    .o_pc(pc),
    .o_address(addr_mem),
    .o_mem_write_data(write_data_mem),
    .o_mem_we(we_mem)
    );
    
    tdpram_4096x32 iMEM (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc),
        .dina (32'b0), 
        .douta (inst), 
        .clkb (clk), 
        .enb (1'b1), 
        .web (addr_mem),
        .addrb(addrb), 
        .dinb (write_data_mem), 
        .doutb (read_data_mem)
    );
    
endmodule
