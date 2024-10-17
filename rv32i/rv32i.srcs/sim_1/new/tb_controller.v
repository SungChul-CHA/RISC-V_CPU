`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 05:01:12 PM
// Design Name: 
// Module Name: tb_controller
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


module tb_controller;
    // Inputs
    reg clk, reset_n;
    reg is_branch, pc_ctrl;
    
    // PC    
    reg [31:0] alu_out;
    wire [11:0] pc, pc_4;
    wire [2:0] c_state;
    
    PC pc_inst (clk, reset_n, pc_ctrl, c_state, alu_out, pc, pc_4);
    
    // RAM
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
    
    // ir decoder
    wire [31:0] imm;
    wire [ 6:0] funct7;
    wire [ 4:0] rs1, rs2;
    wire [ 2:0] funct3;
    wire [ 4:0] rd;
    wire [ 6:0] op_code;
    ir_decoder decoder (inst, op_code, rd, funct3, rs1, rs2, funct7, imm);
    
    // FSM
    wire unknown_inst;
    fsm fsm (clk, reset_n, is_branch, op_code, unknown_inst, c_state);
    
    // DUT
    wire pc_is_alu, alu_a_is_pc, alu_b_is_imm, regfile_we;
    wire [1:0] rd_source, is_mem;
    wire [3:0] alu_op;
    controller DUT (c_state, op_code, funct3, funct7, is_branch, pc_is_alu, alu_op, alu_a_is_pc, alu_b_is_imm, regfile_we, rd_source, is_mem);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 1;
        reset_n = 1'b1;
        alu_out = 'd0;
        pc_ctrl = 1'b0; // pc = pc + 4
        is_branch = 1'b0;
        #3
        
        reset_n = 1'b0;
        #5
        reset_n = 1'b1;
        #2
        
        $display("fsm start");
    end
    
    integer i;
    initial begin
        for (i = 0; i < 42; i = i + 1) begin
            wait(c_state == 3'b0);
            @(posedge clk);
        end
        
        $finish;
    end
    
endmodule
