`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 11:04:12 PM
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu;
    // Inputs
    reg clk, reset_n;
    
    // RAM
    wire [3:0] mem_we;
    wire [11:0] pc, mem_addr;
    wire [31:0] inst, mem_r_data, mem_w_data;
    tdpram_4096x32 tdpram (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc),
        .dina ('d0), 
        .douta (inst), 
        .clkb (clk), 
        .enb (1'b1), 
        .web (mem_we),
        .addrb(mem_addr), 
        .dinb (mem_w_data), 
        .doutb (mem_r_data)
    );
    
    // DUT
    wire unknown_inst;
    rv32i_cpu DUT (
        .clk(clk),
        .async_reset_n(reset_n),
        .i_inst(inst),
        .i_mem_read_data(mem_r_data),
        .o_unknown_inst(unknown_inst),
        .o_pc(pc),
        .o_address(mem_addr),
        .o_mem_write_data(mem_w_data),
        .o_mem_we(mem_we)
    );
    
    always begin
        #5
        clk = ~clk;
    end
    
    integer i;
    initial begin
        clk = 1;
        reset_n = 1;
        #3
        reset_n = 0;
        #5
        reset_n = 1;

        for (i = 0; i < 1000; i = i + 1) begin
            @(posedge clk);
        end

        $finish;
    end
    
endmodule
