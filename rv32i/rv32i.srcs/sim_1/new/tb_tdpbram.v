`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 10:58:38 PM
// Design Name: 
// Module Name: tb_tdpbram
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


module tb_tdpbram;
    parameter BIT_WIDTH = 32;

    reg clk, reset_n, cs_mem;
    reg [3:0] data_we;
    reg [11:0] pc, addrb;
    reg [BIT_WIDTH-1:0] write_data;
    wire [BIT_WIDTH-1:0] read_data_mem, read_data_mem_r, inst;
    
    integer i;
    
    always begin    // clk gen
    #5 clk = ~clk;
    end
    
    initial begin
    clk = 1'b0;
    cs_mem = 1'b1;
    data_we = 4'b0;
    pc = 12'd0;
    addrb = 12'd0;
    write_data = 'h0;
    reset_n = 1'b1;
    #13
    
    reset_n = 1'b0;
    data_we = 4'b1;
    #5
    reset_n = 1'b1;
    
    for (i = 0; i < 1000; i = i + 4) begin  // data write
        @(posedge clk)
        addrb <= i;
        write_data <= 20 * i;
    end
    
    #5
    data_we = 4'b0;
    for (i = 0; i < 500; i = i + 4) begin   // data read
        @(posedge clk)
        pc <= i;
    end
    
    #5
    for (i = 500; i < 1000; i = i + 4) begin    // data read
        @(posedge clk)
        addrb <= i;
    end
    
    #10 $finish;
    end
    
    tdpram_4096x32 DUT (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc),
        .dina ('d0), 
        .douta (inst), 
        .clkb (clk), 
        .enb (cs_mem), 
        .web (data_we),
        .addrb(addrb), 
        .dinb (write_data), 
        .doutb (read_data_mem)
    ); 
    
    // test delay signals
    dff #(BIT_WIDTH) ff1 (clk, reset_n, read_data_mem, read_data_mem_r);
    
    // regfile test
    wire [BIT_WIDTH-1:0] rs1_data, rs2_data;
    regfile rf (clk, 1'b1, 'd0, 'd0, 'd1, read_data_mem_r, rs1_data, rs2_data);

endmodule

module dff #(
    parameter BIT_WIDTH = 8
    )
    (
    input                      clk, reset_n,
    input      [BIT_WIDTH-1:0] d,
    output reg [BIT_WIDTH-1:0] q
    );
    
    always @ (posedge clk, negedge reset_n) begin
        if (!reset_n) q <= 0;
        else q <= d;
    end
    
endmodule
