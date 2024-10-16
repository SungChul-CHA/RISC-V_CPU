`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 09:50:59 AM
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


module tb_top;
    reg clk, cs_mem;
    reg [3:0] data_we;
    reg [11:0] pc, addrb;
    reg [31:0] write_data;
    wire [31:0] read_data_mem, inst;
    
    integer i;
    
    always begin
    #5 clk = ~clk;
    end
    
    initial begin
    clk = 1'b0;
    cs_mem = 1'b1;
    data_we = 4'b0;
    pc = 12'd0;
    addrb = 12'd0;
    write_data = 32'h0;
    #13
    
    data_we = 4'b1;
    #5
    
    for (i = 0; i < 1000; i = i + 4) begin
        @(posedge clk)
        addrb <= i;
        write_data <= 20 * i;
    end
    
    #5
    data_we = 4'b0;
    for (i = 0; i < 500; i = i + 4) begin
        @(posedge clk)
        pc <= i;
    end
    
    #5
    for (i = 500; i < 1000; i = i + 4) begin
        @(posedge clk)
        addrb <= i;
    end
    
    #10 $finish;
    end
    
    wire PC, PC_next;
    reg alu_out, reset_n;
    
    wire alu_out_r;
    assign PC = alu_out_r;
    
    initial begin
    alu_out = 1'b0;
    reset_n = 1'b1;
    #13
    reset_n = 1'b0;
    #3 reset_n = 1'b1;
    
    #16 alu_out = 1'b1;
    #17 alu_out = 1'b0;
    #22 alu_out = 1'b1;
    end
    
    dff dut1 (clk, reset_n, alu_out, alu_out_r);
    dff dut2 (clk, reset_n, PC, PC_next);
    
    top dut (clk, pc, addrb, cs_mem, data_we, write_data, read_data_mem, inst);
    

endmodule

module dff (
    input clk, reset_n, d,
    output reg q
    );
    
    always @ (posedge clk, negedge reset_n) begin
        if (!reset_n) q <= 0;
        else q <= d;
    end
    
endmodule