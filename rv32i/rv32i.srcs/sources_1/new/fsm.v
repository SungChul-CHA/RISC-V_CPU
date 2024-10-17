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
`include "instruction.vh"

module fsm(
    input wire clk, async_reset_n, i_btaken,
    input wire [6:0] i_op_code,
    output reg o_unknown_inst,
    output reg [2:0] o_c_state
    );

    `include "state.vh" 

    reg [2:0] n_state;

    always @ (posedge clk or negedge async_reset_n) begin
        if (!async_reset_n) begin
            o_c_state <= 0;
        end else begin
            o_c_state <= n_state;
        end
    end

    always @ (*) begin
        o_unknown_inst = 1'b0;
        case (o_c_state)
            S_FETCH: begin
                n_state = S_DECODE;
            end
            S_DECODE: begin
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
                n_state = S_WB;
            end
            S_BTYPE: begin
                if (i_btaken) n_state = S_EXEI;
                else n_state = S_FETCH;
            end
            S_MEM: begin
                if (i_op_code == `OP_LOAD) n_state = S_WB;
                else n_state = S_FETCH;
            end
            S_WB: begin
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
