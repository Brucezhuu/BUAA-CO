`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:06 12/04/2021 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input wire clk,
    input wire reset,
    input wire RFWR,
    input wire DMWR,
    input wire [2:0] ALUOP,
    input wire [2:0] NPCOP,
    input wire [1:0] EXTOP,
    input wire [1:0] WRSEL,
    input wire [1:0] WDSEL,
    input wire BSEL,
    output wire [5:0] opcode,
    output wire [5:0] func,
    input wire [1:0] WBH
    );
    wire [31:0] instru;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire zero;
    wire [31:0] npc;
    wire [31:0] pc4;
    wire [31:0] pc;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [15:0] imm16;
    wire [31:0] aluC;
    wire [31:0] dmout;
    wire [31:0] imm32;
    wire [4:0] a2;
    wire [31:0] B;
    wire [31:0] wd;

    assign opcode = instru[31:26];
    assign rs = instru[25:21];
    assign rt = instru[20:16];
    assign rd = instru[15:11];
    assign shamt = instru[10:6];
    assign func = instru[5:0];
    assign imm16 = instru[15:0];
    IFU ifu(.clk(clk),
            .reset(reset),
            .npc(npc),
            .pc(pc),
            .instru(instru));

    NPC npcins(.pc(pc),
            .imm(instru[25:0]),
            .RA(RD1),
            .npcOp(NPCOP),
            .zero(zero),
            .npc(npc),
            .pc4(pc4));

    MUX mux(.wrsel(WRSEL),
            .wdsel(WDSEL),
            .bsel(BSEL),
            .rt(rt),
            .rd(rd),
            .aluC(aluC),
            .dmout(dmout),
            .pc4(pc4),
            .rd2(RD2),
            .imm32(imm32),
            .a2(a2),
            .wd(wd),
            .b(B));

    GRF grf(.clk(clk),
            .reset(reset),
            .A1(rs),
            .A2(rt),
				.A3(a2),
            .WD(wd),
            .WPC(pc),
            .WE(RFWR),
            .RD1(RD1),
            .RD2(RD2));

    EXT extins(.imm16(imm16),
            .F(EXTOP),
            .ext(imm32));

    ALU alu(.A(RD1),
            .B(B),
            .C(aluC),
            .shamt(shamt),
            .ALUOP(ALUOP),
            .zero(zero));
    
    DM dm(.clk(clk),
        .reset(reset),
        .addr(aluC),
        .wd(RD2),
        .PC(pc),
        .we(DMWR),
        .wbh(WBH),
        .RD(dmout));
    
endmodule
