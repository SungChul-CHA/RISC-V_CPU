`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 12:52:00 PM
// Design Name: 
// Module Name: rv32i_cpu
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


module rv32i_cpu(
    input clk,
    input async_reset_n,
    input [31:0] i_inst, i_mem_read_data,
    
    output            o_unknown_inst,
    output     [11:0] o_pc, o_address,
    output     [31:0] o_mem_write_data,
    output reg [ 3:0] o_mem_we
    );
    
    // PC
    wire [11:0] pc, pc_4;

    // parsing instruction
    wire [6:0] op_code;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1, rs2;
    wire [6:0] funct7;
    wire [31:0] imm;

    // Controller
    wire alu_a_is_pc, alu_b_is_imm, pc_is_alu;
    wire [1:0] rd_source;   // 00 : default, 01 : read_data, 10 : pc + 4, 11 : lui
    wire [1:0] is_MEM;      // load : 01, store : 11, none : 00 
    reg pc_is_alu_reg;
    
    // Branch resolution
    wire is_branch;
    
    // FSM
    wire [2:0] c_state;

    // ALU
    wire [31:0] alu_srcA, alu_srcB, alu_out;
    wire [3:0] alu_op;
    wire N, Z, C, V;
    reg [31:0] alu_out_reg;
    reg N_reg, Z_reg, C_reg, V_reg;
    
    // MEM
    reg [31:0] read_data, write_data;
    
    // Regfile
    wire refile_we;
    wire [4:0] rs1_addr, rs2_addr, rd_addr;
    reg [31:0] rd_data;
    wire [31:0] rs1_data, rs2_data;
    

    // PC
    assign o_pc = pc;

    PC pc_inst (clk, async_reset_n, pc_is_alu_reg, c_state, alu_out_reg, pc, pc_4);

    // Instruction Decoder
    ir_decoder ir_decoder_inst (i_inst, op_code, rd, funct3, rs1, rs2, funct7, imm);

    // Controller
    controller ctrl_inst(clk, async_reset_n, c_state, op_code, funct3, funct7, is_branch, pc_is_alu, alu_op, alu_a_is_pc, alu_b_is_imm, refile_we, rd_source, is_MEM);
    
    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) pc_is_alu_reg <= 1'b0;
        else pc_is_alu_reg <= pc_is_alu;
    end
    
    // branch resolution
    branch_resolution btake_inst (funct3, N, Z, C, V, is_branch);
    
    // FSM
    fsm fsm_inst (clk, async_reset_n, is_branch, op_code, o_unknown_inst, c_state);

    // ALU
    assign alu_srcA = (alu_a_is_pc) ? pc : rs1_data;
    assign alu_srcB = (alu_b_is_imm) ? imm : rs2_data;
    
    alu alu_inst (alu_srcA, alu_srcB, alu_op, alu_out, N, Z, C, V);
    
    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) begin
            alu_out_reg <= 0;
            N_reg <= 0;
            Z_reg <= 0;
            C_reg <= 0;
            V_reg <= 0;
        end
        else begin
            alu_out_reg <= alu_out;
            N_reg <= N;
            Z_reg <= Z;
            C_reg <= C;
            V_reg <= V;
        end
    end
    
    
    
    // Memory R/W
    assign o_address = (is_MEM[0]) ? alu_out_reg : 'd0;
    assign o_mem_write_data = write_data;
    
    always @ (*) begin
        if (is_MEM[1]) begin
            case(funct3)
                3'b000: write_data = {{24{rs2_data[7]}}, rs2_data}; // Byte 
                3'b001: write_data = {{16{rs2_data[15]}}, rs2_data}; // Half Word
                3'b010: write_data = rs2_data; // Word
                default: write_data = 'd0;            
            endcase
        end
        else write_data = 'd0;
    end
    
    always @ (*) begin
        if (is_MEM[1]) begin
            case(funct3)
                3'b000: o_mem_we = 4'b0001; // Byte 
                3'b001: o_mem_we = 4'b0001; // Half Word
                3'b010: o_mem_we = 4'b0001; // Word
                3'b100: o_mem_we = 4'b0001; // Unsigned Byte
                3'b101: o_mem_we = 4'b0001; // Unsigned Half Word
                default: o_mem_we = 'd0;
            endcase
        end
        else o_mem_we = 'd0;
    end
    
    always @ (*) begin
        if (is_MEM[0]) begin
            case(funct3)
                3'b000: read_data = {{24{i_mem_read_data[7]}}, i_mem_read_data}; // Byte 
                3'b001: read_data = {{16{i_mem_read_data[15]}}, i_mem_read_data}; // Half Word
                3'b010: read_data = i_mem_read_data; // Word
                3'b100: read_data = {{24{1'b0}}, i_mem_read_data}; // Unsigned Byte
                3'b101: read_data = {{16{1'b0}}, i_mem_read_data}; // Unsigned Half Word
                default: read_data = 'd0;
            endcase
        end
        else read_data = i_mem_read_data;
    end
    
    
    // Reg file
    assign rs1_addr = rs1;
    assign rs2_addr = rs2;
    assign rd_addr = rd;
    
    always @ (*) begin
        case (rd_source)
            2'b11: rd_data = {imm[31:12], 12'b0};
            2'b10: rd_data =  pc_4;
            2'b01: rd_data = read_data;
            default: rd_data = alu_out_reg;
        endcase
    end
    
    regfile regfile_inst (clk, refile_we, rs1_addr, rs2_addr, rd_addr, rd_data, rs1_data, rs2_data);

endmodule
