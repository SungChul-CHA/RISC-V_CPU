`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 10:42:23 PM
// Design Name: 
// Module Name: fsm
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

module fsm(
    input wire clk, async_reset_n,
    input wire [6:0] i_op_code,
    output reg o_unknown_inst,
    output reg [3:0] o_c_state
    );

    // local parameters
    localparam S_FETCH  = 3'b000;
    localparam S_DECODE = 3'b001;
    localparam S_EXEI   = 3'b010;
    localparam S_EXER   = 3'b011;
    localparam S_BTYPE  = 3'b100;
    localparam S_MEM    = 3'b101;
    localparam S_WB     = 3'b110;
    localparam S_ERR    = 3'b111; 

    reg [3:0] n_state;

    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) begin
            o_c_state <= 0;
        end else begin
            o_c_state <= n_state;
        end
    end

    always @ (*) begin
        case (o_c_state)
            S_FETCH: begin
                o_unknown_inst = 1'b0;
                n_state = S_DECODE;
            end
            S_DECODE: begin
                o_unknown_inst = 1'b0;
                case(i_op_code)
                    `OP_LUI: begin
                        n_state = S_WB;
                    end
                    `OP_AUIPC: begin
                        n_state = S_EXEI;
                    end
                    `OP_JAL: begin
                        n_state = S_EXEI;
                    end
                    `OP_JALR: begin
                        n_state = S_EXEI;
                    end
                    `OP_BRANCH: begin
                        n_state = S_BTYPE;
                    end
                    `OP_LOAD: begin
                        n_state = S_EXEI;
                    end
                    `OP_STORE: begin
                        n_state = S_EXEI;
                    end
                    `OP_I: begin
                        n_state = S_EXEI;
                    end
                    `OP_R: begin
                        n_state = S_EXER;
                    end
                    default: begin
                        n_state = S_ERR;
                    end
                endcase
            end
            S_EXEI: begin
                o_unknown_inst = 1'b0;
                case (i_op_code)
                    `OP_LOAD: begin
                        n_state = S_MEM;
                    end
                    `OP_STORE: begin
                        n_state = S_MEM;
                    end 
                    default: n_state = S_WB;
                endcase
            end
            S_EXER: begin
                o_unknown_inst = 1'b0;
                n_state = S_WB;
            end
            S_BTYPE: begin
                o_unknown_inst = 1'b0;
                n_state = S_EXEI;
            end
            S_MEM: begin
                o_unknown_inst = 1'b0;
                if (i_op_code == `OP_LOAD) n_state = S_WB;
                else n_state = S_FETCH;
            end
            S_WB: begin
                o_unknown_inst = 1'b0;
                n_state = S_FETCH;
            end
            S_ERR: begin
                o_unknown_inst = 1'b1;
                n_state = S_FETCH;
            end
            default: begin
                o_unknown_inst = 1'b0;
                n_state = S_FETCH;
            end
        endcase
    end

endmodule
