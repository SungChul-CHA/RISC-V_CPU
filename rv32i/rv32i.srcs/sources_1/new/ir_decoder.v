`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 10:50:43 PM
// Design Name: 
// Module Name: ir_decoder
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

`define U_TYPE  3'b101
`define JAL     3'b011
`define JALR    3'b001
`define PC_TYPE 3'b000  // Store, Branch, Load
`define IR_TYPE 3'b100


module ir_decoder(
    input  wire [31:0] i_inst,
    
    output reg  [6:0]  o_op_code,
    output reg  [4:0]  o_rd,
    output reg  [2:0]  o_funct3,
    output reg  [4:0]  o_rs1, o_rs2,
    output reg  [6:0]  o_funct7,
    output reg  [31:0] o_imm
    );

    always @ (*) begin
        o_op_code = 'd0;
        o_rd = 'd0;
        o_funct3 = 'd0;
        o_rs1 = 'd0;
        o_rs2 = 'd0;
        o_funct7 = 'd0;
        o_imm = 'd0;
        case (i_inst[4:2])
            `U_TYPE: begin
                o_op_code    = i_inst[6:0];
                o_rd         = i_inst[11:7];
                o_imm[31:12] = i_inst[31:12];
//                o_imm[11:0]  = 12'b0;
            end
            `JAL: begin
                o_op_code    = i_inst[6:0];
                o_rd         = i_inst[11:7];
                o_imm[19:12] = i_inst[19:12];
                o_imm[11]    = i_inst[20];
                o_imm[10:1]  = i_inst[30:21];
                o_imm[20]    = i_inst[31];
//                o_imm[0]     = 1'b0;
//                o_imm[31:21] = {11{o_imm[20]}};
            end
            `JALR: begin
                o_op_code    = i_inst[6:0];
                o_rd         = i_inst[11:7];
                o_funct3     = i_inst[14:12];
                o_rs1        = i_inst[19:15];
                o_imm[11:0]  = i_inst[31:20];
//                o_imm[31:12] = {20{o_imm[11]}};
            end
            `PC_TYPE: begin
                case(i_inst[6:5])
                    2'b11: begin    // Branch
                        o_op_code    = i_inst[6:0];
                        o_imm[11]    = i_inst[7];
                        o_imm[4:1]   = i_inst[11:8];
                        o_funct3     = i_inst[14:12];
                        o_rs1        = i_inst[19:15];
                        o_rs2        = i_inst[24:20];
                        o_imm[10:5]  = i_inst[30:25];
                        o_imm[12]    = i_inst[31];
//                        o_imm[0]     = 1'b0;
//                        o_imm[31:13] = {19{o_imm[12]}};
                    end
                    2'b00: begin     // Load
                        o_op_code    = i_inst[6:0];
                        o_rd         = i_inst[11:7];
                        o_funct3     = i_inst[14:12];
                        o_rs1        = i_inst[19:15];
                        o_imm[11:0]  = i_inst[31:20];
//                        o_imm[31:12] = 20'b0;
                    end
                    2'b01: begin    // Store
                        o_op_code    = i_inst[6:0];
                        o_imm[4:0]   = i_inst[11:7];
                        o_funct3     = i_inst[14:12];
                        o_rs1        = i_inst[19:15];
                        o_rs2        = i_inst[24:20];
                        o_imm[11:5]  = i_inst[31:25];
//                        o_imm[31:12] = 20'b0;
                    end
                    default: begin
                        o_op_code    = i_inst[6:0];
                        o_imm[4:0]   = i_inst[11:7];
                        o_funct3     = i_inst[14:12];
                        o_rs1        = i_inst[19:15];
                        o_rs2        = i_inst[24:20];
                        o_imm[11:5]  = i_inst[31:25];
//                        o_imm[31:12] = 20'b0;
                    end
                endcase
            end
            `IR_TYPE: begin
                if (i_inst[5] == 1'b0) begin    // I-type
                    o_op_code    = i_inst[6:0];
                    o_rd         = i_inst[11:7];
                    o_funct3     = i_inst[14:12];
                    o_rs1        = i_inst[19:15];
                    o_imm[11:0]  = i_inst[31:20];
//                    o_imm[31:12] = {20{o_imm[11]}};           
                end
                else begin  // R-type
                    o_op_code = i_inst[6:0];
                    o_rd      = i_inst[11:7];
                    o_funct3  = i_inst[14:12];
                    o_rs1     = i_inst[19:15];
                    o_rs2     = i_inst[24:20];
                    o_funct7  = i_inst[31:25];
                end
            end
            default: begin
                o_op_code   = i_inst[6:0];
                o_rd        = i_inst[11:7];
                o_funct3    = i_inst[14:12];
                o_rs1       = i_inst[19:15];
                o_imm[11:0] = i_inst[31:20];
//                o_imm[31:12] = {20{o_imm[11]}};
            end
        endcase
    end

endmodule