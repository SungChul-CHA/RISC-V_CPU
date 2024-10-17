`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 10:57:36 PM
// Design Name: 
// Module Name: tb_case
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

`define OP_LUI      7'b0110111
`define OP_AUIPC    7'b0110111
`define OP_JAL      7'b1101111
`define OP_JALR     7'b1100111
`define OP_BRANCH   7'b1100011
`define OP_LOAD     7'b0000011
`define OP_STORE    7'b0100011
`define OP_I        7'b0010011
`define OP_R        7'b0110011


module tb_fsm;
    // RAM
    reg clk;
    reg [11:0] pc;
    wire [31:0] inst;
    tdpram_4096x32 tdpram (
        .clka (clk), 
        .ena (1'b1), 
        .wea (1'b0), 
        .addra (pc),
        .dina ('d0), 
        .douta (inst), 
        .clkb (), 
        .enb (), 
        .web (),
        .addrb(), 
        .dinb (), 
        .doutb ()
    );
    
    // ir decoder test
    wire [31:0] imm;
    wire [ 6:0] funct7;
    wire [ 4:0] rs1, rs2;
    wire [ 2:0] funct3;
    wire [ 4:0] rd;
    wire [ 6:0] op_code;
    
    ir_decoder DUT0 (inst, op_code, rd, funct3, rs1, rs2, funct7, imm);
    
    // FSM Test
    reg async_reset_n;
    wire unknown_inst;
    wire [2:0] c_state;
    
    fsm DUT1 (clk, async_reset_n, op_code, unknown_inst, c_state);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin   // FSM reset
        clk = 1;
        async_reset_n = 1'b1;
        #3
        
        async_reset_n = 1'b0;
        #5
        async_reset_n = 1'b1;
        #2
        
        $display("fsm start");
    end
    
    integer i;
    initial begin
        for (i = 0; i < 40; i = i + 4) begin
            pc = i;
            wait (c_state != 3'b0);
            @((c_state == 3'b0));
        end
        
        $finish;
    end

    
    

    
    

    

endmodule
