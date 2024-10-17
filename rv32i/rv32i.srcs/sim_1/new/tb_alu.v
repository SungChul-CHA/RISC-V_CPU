`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 09:21:36 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;
    reg [31:0] src_1, src_2;
    reg [3:0] alu_op;
    
    wire [31:0] result;
    wire N, Z, C, V;
    
    alu DUT (src_1, src_2, alu_op, result, N, Z, C, V);

    integer i;
    initial begin
        alu_op = 0;
        src_1 = 0;
        src_2 = 0;
        #5
        
        $display("TB Start!\n");
    end
    
    initial begin
        #5
        src_1 = 2100000000;
        src_2 = 2100000000;
        
        #5
        src_2 = $random;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = $random;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = $random;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end


        #5
        src_2 = $random;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end
        
        #5
        src_2 = 1;
        for (i = 0; i < 10; ) begin
            src_1 = src_1 + 1;
            #2 i = i + 1;
        end
        
        alu_op = alu_op + 1;
        #5
        src_1 = 1;
        for (i = 0; i < 10; ) begin
            src_2 = src_2 + 1;
            #2 i = i + 1;
        end        
        
        $finish;
    end    
    

endmodule
