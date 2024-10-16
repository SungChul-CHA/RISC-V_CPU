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


module tb_case;
    // ir decoder test
    reg [31:0] inst;
    
    wire [31:0] imm;
    wire [ 6:0] funct7;
    wire [ 4:0] rs1, rs2;
    wire [ 2:0] funct3;
    wire [ 4:0] rd;
    wire [ 6:0] op_code;
    
    // FSM Test
    reg clk, async_reset_n;
    wire unknown_inst;
    wire [2:0] c_state;
    
    integer SEED = 13;
    initial begin
        $display("Seeting sim seed to : %d", SEED);
        $srandom(SEED);
        

        inst = $urandom();
        inst[6:0] = `OP_LUI;
        #16
        @(posedge clk)
        @(posedge clk)
        wait(c_state == 3'b000)

        
        inst = $urandom();
        inst[6:0] = 'd0;    // ERROR
        wait(c_state == 3'b000)
        @(posedge clk)
        @(posedge clk)

        inst = $urandom();
        inst[6:0] = `OP_BRANCH;
        @(posedge clk)
        wait(c_state == 3'b000)

        inst = $urandom();
        inst[6:0] = `OP_STORE;
        @(posedge clk)
        wait(c_state == 3'b000)

        inst = $urandom();
        inst[6:0] = `OP_LOAD;
        @(posedge clk)
        wait(c_state == 3'b000)

        inst = $urandom();
        inst[6:0] = `OP_AUIPC;
        @(posedge clk)
        wait(c_state == 3'b000)

        inst = $urandom();
        inst[6:0] = `OP_R;
        wait(c_state == 3'b000)
        @(posedge clk)

        inst = $urandom();
        inst[6:0] = `OP_JAL;
        wait(c_state == 3'b000)
        @(posedge clk)

        inst = $urandom();
        inst[6:0] = `OP_JALR;
        wait(c_state == 3'b000)
        @(posedge clk)

        inst = $urandom();
        inst[6:0] = `OP_I;
        wait(c_state == 3'b000)
        @(posedge clk)    
        $finish;
    end

    ir_decoder DUT (inst, op_code, rd, funct3, rs1, rs2, funct7, imm);
    

    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 1;
        async_reset_n = 1'b1;
        #5
        
        async_reset_n = 1'b0;
        #5
        async_reset_n = 1'b1;
        
        #5
        
        $display("fsm start");
    
    end

    fsm fsm_u0 (clk, async_reset_n, op_code, unknown_inst, c_state);

endmodule
