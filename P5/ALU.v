`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:01 12/11/2021 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [31:0] instr,
    input [`Bitwidth] onehot,
    input [31:0] pc,
    output [31:0] C
    );
    wire [4:0] shamt;
    assign shamt = instr[10:6];
    wire [15:0] imm16;
    assign imm16 = instr[15:0];
    wire [31:0] imm;
    wire `insbus;
    assign {`insbus} = onehot;
    assign imm = (ori) ? {{16{1'b0}},imm16} : 
                    (lw | lb | lh | addi | sw | sb | sh ) ? {{16{imm[15]}},imm16}:
                    (lui) ? {imm16,{16{1'b0}}} : {{16{imm[15]}},imm16};
    assign C = (addu) ? A + B :
                (subu) ? A - B :
                (ori) ? A | imm:
                (lw | lb | lh | addi | sw | sb | sh ) ? A + imm :
                (lui) ? imm :
                (jal | jalr) ? pc + 8:
                (sll) ? (B << shamt) : 32'hffff_ffff;

endmodule
