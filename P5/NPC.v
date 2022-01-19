`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:38 12/11/2021 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] pc,
    input [15:0] imm16,
    input [25:0] imm26,
    input [`Bitwidth] onehot,
    input [31:0] RD1_rs,
    input [31:0] RD2_rt,
    output [31:0] npc
    );
//  `define Bitwidth 17:0
//  `define insbus nop,addu, addi, subu, ori, lw, lh, lb, sw, sh, sb, beq, lui, j, jal, jalr, jr, sll
    wire `insbus;
    wire [31:0] pc4;
    assign {`insbus} = onehot;
    wire [31:0] beqj,jalj,jrj,jj;
    assign beqj = {{14{imm16[15]}},imm16,2'b00}+pc;
    assign jalj = {pc[31:28],imm26,2'b00};
    assign jrj = RD1_rs;
    assign pc4 = pc+4;
    assign npc = (beq && RD1_rs == RD2_rt) ? beqj :
                    (jal | j) ? jalj :
                        (jr|jalr) ? jrj : pc4;
endmodule
