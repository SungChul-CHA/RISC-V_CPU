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
    input clk_125mhz, btn,
    output unknown_inst
    );
    
    wire clk, async_reset_n;
    wire [31:0] inst, read_data_mem, write_data_mem;
    wire [31:0] pc, addr_mem;
    wire [3:0]  we_mem;
    
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

    clk_wiz_0 iPLL ( 
        .clk_out1(clk), 
        .reset(btn),        //active high 
        .locked(locked),    //'1' after clock becomes stable
        .clk_in1(clk_125mhz)
    );
    
    assign async_reset_n = ~btn & locked;
    
    tdpram_4096x32 iMEM (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc[13:2]),
        .dina (32'b0), 
        .douta (inst), 
        .clkb (clk), 
        .enb (1'b1), 
        .web (we_mem),
        .addrb(addr_mem[13:2]), 
        .dinb (write_data_mem), 
        .doutb (read_data_mem)
    );
    
endmodule
