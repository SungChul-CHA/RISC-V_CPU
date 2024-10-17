`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 10:53:45 PM
// Design Name: 
// Module Name: controller
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
`include "instruction.vh"

module controller(
    input [2:0] i_c_state,
    input [6:0] i_op_code,
    input [2:0] i_funct3,
    input [6:0] i_funct7,
    input i_btaken,

    output o_pc,
    output reg [3:0] o_alu_op,
    output reg o_alu_a, o_alu_b,
    output reg [1:0] o_rd_source
    );

    `include "state.vh"
    `include "alu_op.vh"
    
    wire [2:0] c_state = c_state;
    wire [6:0] op_code = i_op_code;
    // PC
    assign o_pc = (op_code == `OP_JAL | op_code == `OP_JALR | ((op_code == `OP_BRANCH) && i_btaken)) ? 1 : 0;

    // ALU source
    always @ (*) begin
        case (c_state)
            S_EXEI: begin   
                if (op_code == `OP_AUIPC | op_code == `OP_JAL | op_code == `OP_BRANCH)
                    o_alu_a = 1'b1; // 1 : AUIPC, JAL, BRANCH
                else
                    o_alu_a = 1'b0; // 0 : JALR, LOAD, STORE, I-TYPE

                o_alu_b = 1'b1;
            end
            S_EXER: begin
                o_alu_a = 1'b0;
                o_alu_b = 1'b0;
            end
            S_BTYPE: begin
                o_alu_a = 1'b0;
                o_alu_b = 1'b0;
            end
            default: begin 
                o_alu_a = 1'b0;
                o_alu_b = 1'b1;
            end
        endcase
    end

    // ALU operation
    always @ (*) begin
        case (c_state)
            S_EXEI: begin
                case (i_funct3)
                    3'b000: o_alu_op = ADD;
                    3'b010: o_alu_op = SLT;
                    3'b011: o_alu_op = SLTU;
                    3'b100: o_alu_op = XOR;
                    3'b110: o_alu_op = OR;
                    3'b111: o_alu_op = AND;
                    3'b001: o_alu_op = SLL;
                    3'b101: begin
                        if (i_funct7[5])o_alu_op = SRA;
                        else o_alu_op = SRL;
                    end
                    default: o_alu_op = ADD;
                endcase
            end
            S_EXER: begin
                case (i_funct3)
                    3'b000: begin
                        if (i_funct7[5]) o_alu_op = SUB;
                        else o_alu_op = ADD;
                    end
                    3'b001: o_alu_op = SLL;
                    3'b010: o_alu_op = SLT;
                    3'b011: o_alu_op = SLTU;
                    3'b100: o_alu_op = XOR;
                    3'b101: begin
                        if (i_funct7[5]) o_alu_op = SRA;
                        else o_alu_op = SRL;
                    end
                    3'b110: o_alu_op = OR;
                    3'b111: o_alu_op = AND;
                    default: o_alu_op = ADD;
                endcase
            end
            S_BTYPE: o_alu_op = SUB;
            default: o_alu_op = ADD;
        endcase
    end
    
    // rd source
    always @ (*) begin
        case (op_code)
            `OP_LUI:  o_rd_source = 2'b11;
            `OP_JAL:  o_rd_source = 2'b10;
            `OP_JALR: o_rd_source = 2'b10;
            `OP_LOAD: o_rd_source = 2'b01;
            default:  o_rd_source = 2'b00;
        endcase
    end


endmodule
