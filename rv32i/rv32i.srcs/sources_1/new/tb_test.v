`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 06:20:37 PM
// Design Name: 
// Module Name: tb_test
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


module tb_test;

reg clk, reset;
reg [3:0] input_data_a, input_data_b;

wire [4:0] output_data;

reg [4:0] output_data_reg;

assign output_data = input_data_a + input_data_b;

always @ (posedge clk, posedge reset) begin
    if (reset) output_data_reg <= 0;
    else output_data_reg <= output_data;
end

always begin
    #10
    clk = ~clk;
end

integer i;
initial begin
    clk = 1;
    reset = 0;
    input_data_a = 0;
    input_data_b = 0;
    #3
    
    reset = 1; #5
    
    reset = 0;
    input_data_b = 2;
    for (i = 0; i < 8; i = i + 1) begin
        input_data_a = i;
        @(posedge clk);
    end
    
    input_data_a = 1;
    for (i = 0; i < 8; ) begin
        input_data_b = i;
        #3 i = i + 1;
    end
    
    $finish;
end


endmodule
