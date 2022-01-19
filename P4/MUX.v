`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:29 12/04/2021 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input wire [1:0] wrsel,
    input wire [1:0] wdsel,
    input wire bsel,
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire [31:0] aluC,
    input wire [31:0] dmout,
    input wire [31:0] pc4,
    input wire [31:0] rd2,
    input wire [31:0] imm32,
    output wire [4:0] a2,
    output wire [31:0] wd,
    output wire [31:0] b
    );
    assign a2 = (wrsel == 2'b00) ? rt :
                (wrsel == 2'b01) ? rd :
                (wrsel == 2'b10) ? 32'h0000_001f : 32'b0;
    assign wd = (wdsel == 2'b00) ? aluC : 
                (wdsel == 2'b01) ? dmout :
                (wdsel == 2'b10) ? pc4 : 32'b0;
    assign b = (bsel == 1'b0) ? rd2 : imm32;

endmodule
