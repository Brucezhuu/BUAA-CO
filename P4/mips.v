`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:17:31 12/03/2021 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input wire clk,
    input wire reset
    );
    wire RFWR;
    wire DMWR;
    wire [2:0] ALUOP;
    wire [2:0] NPCOP;
    wire [1:0] EXTOP;
    wire [1:0] WRSEL;
    wire [1:0] WDSEL;
    wire BSEL;
    wire [5:0] opcode;
    wire [5:0] func;
    wire [1:0] WBH;

    datapath dp(.clk(clk),
                .reset(reset),
                .RFWR(RFWR),
                .DMWR(DMWR),
                .ALUOP(ALUOP),
                .NPCOP(NPCOP),
                .EXTOP(EXTOP),
                .WRSEL(WRSEL),
                .WDSEL(WDSEL),
                .BSEL(BSEL),
                .opcode(opcode),
                .func(func),
                .WBH(WBH));

    CTRL ctrl(.opcode(opcode),
            .func(func),
            .RFWR(RFWR),
            .DMWR(DMWR),
            .M1(WRSEL),
            .M2(WDSEL),
            .M3(BSEL),
            .NPCOP(NPCOP),
            .ALUOP(ALUOP),
            .EXTOP(EXTOP),
            .WBH(WBH));
            
endmodule
