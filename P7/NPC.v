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

    input D_eret,
    input [31:0] EPC,
    input req,

    output [31:0] npc,

    output Br
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

    wire    BJ_Type =   (beq|bne|blez)|(bgtz|bltz|bgez);
    wire    BJ_OK   =   beq ?   RD1_rs==RD2_rt:
                        bne ?   RD1_rs!=RD2_rt:
                        blez    ?   ((RD1_rs[31] == 1'b1 )|| (RD1_rs == 0)):
                        bgtz    ?   ((RD1_rs[31] == 1'b0 )&& (RD1_rs != 0)):
                        bltz    ?   (RD1_rs[31] == 1'b1):
                        bgez    ?   (RD1_rs[31]==0 ): 0;
    assign npc = (req) ? 32'h4180 :
                (D_eret) ? EPC + 4:
                (j|jal) ? jalj : 
                (jr|jalr) ? jrj :
                (BJ_Type && BJ_OK) ? beqj : 
                pc4;

    assign Br = (BJ_Type) || (j|jal) || (jr |jalr);
    /*assign npc = (beq && RD1_rs == RD2_rt) ? beqj :
                    (jal | j) ? jalj :
                        (jr|jalr) ? jrj : pc4;*/
endmodule