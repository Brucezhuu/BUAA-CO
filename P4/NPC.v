`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:04 12/03/2021 
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
    input wire [31:0] pc,
    input wire [25:0] imm,
    input wire [31:0] RA,
    input wire [2:0] npcOp,
    input wire zero,
    output wire [31:0] npc,
    output wire [31:0] pc4
    );
    wire [31:0] nimm;
    wire [31:0] beqj;
    wire [31:0] beq;
    wire [31:0] jal;
    assign pc4 = pc + 32'h0000_0004;
    assign nimm = {{14{imm[15]}},imm[15:0],2'b00};
    assign beqj = nimm + pc4;
    assign jal =  {pc[31:28],imm,2'b00};
    assign beq = zero ? beqj : pc4;
    assign npc = (npcOp == 3'b000) ? pc4 :(
                (npcOp == 3'b001) ? beq : (
                (npcOp == 3'b010) ? jal :(
                (npcOp == 3'b011) ? RA : 32'h0000_3000
                )
            )
        );

endmodule
