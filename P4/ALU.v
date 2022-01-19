`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:12 12/04/2021 
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
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0] ALUOP,
    input wire [4:0] shamt,
    output wire [31:0] C,
    output wire zero
    );
    wire sltu;
    assign sltu = (A<B);
    assign C = (ALUOP == 3'b000) ? A+B :
                (ALUOP == 3'b001) ? A-B :
                (ALUOP == 3'b010) ? A|B :
                (ALUOP == 3'b011) ? {{31{1'b0}},sltu}:
                (ALUOP == 3'b100) ? B << shamt : 32'b0 ;
    assign zero = (A == B);
endmodule
