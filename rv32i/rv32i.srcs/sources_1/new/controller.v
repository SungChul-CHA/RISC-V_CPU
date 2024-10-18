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
    input clk, async_reset_n,
    input [2:0] i_c_state,
    input [6:0] i_op_code,
    input [2:0] i_funct3,
    input [6:0] i_funct7,
    input       i_btaken,

    output reg       o_pc,
    output reg [3:0] o_alu_op,
    output reg       o_alu_a, o_alu_b,
    output           o_regfile_we,
    output reg [1:0] o_rd_source,
    output     [1:0] o_is_mem
    );

    `include "state.vh"
    `include "alu_op.vh"
    
    wire [2:0] c_state = i_c_state;
    wire [6:0] op_code = i_op_code;

    // PC
    always @ (*) begin
        if (c_state == S_EXEI) begin
            if ((op_code == `OP_JAL) || (op_code == `OP_JALR) || (op_code == `OP_BRANCH))
                o_pc = 1'b1;
            else
                o_pc = 1'b0;
        end
        else o_pc = 1'b0;
        
    end

    // ALU source
    always @ (*) begin
        case (c_state)
            S_FETCH: begin  // reset
                o_alu_a = 1'b1;
                o_alu_b = 1'b0;
            end
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
                o_alu_a = o_alu_a;
                o_alu_b = o_alu_b;
            end
        endcase
    end

    // ALU operation
    always @ (*) begin
        case (c_state)
            S_EXEI: begin
                if (op_code != `OP_I) o_alu_op = ADD;
                else begin
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
    
    // regfile we
    assign o_regfile_we = (c_state == S_WB) ? 1'b1 : 1'b0;
    
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

    assign o_is_mem = (c_state == S_MEM) ? {op_code[5], 1'b1} : 2'b00;  // 3: Store, 2: Load, 0: Not Memory Access

endmodule
