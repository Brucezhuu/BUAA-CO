`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:06 12/04/2021 
// Design Name: 
// Module Name:    CTRL 
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
`define ADDU  6'b100001
`define SUBU  6'b100011
`define ORI   6'b001101
`define LW    6'b100011
`define SW    6'b101011
`define BEQ   6'b000100
`define JAL   6'b000011
`define JR    6'b001000
`define LUI   6'b001111
`define LB    6'b100000
`define SB    6'b101000
`define LH    6'b100001
`define SH    6'b101001
`define SLL   6'b000000
`define SLTU  6'b101011
`define RTYPE 6'b000000
`define ADDI  6'b001000
`define JALR  6'b001001
`define J     6'b000010

module CTRL(
    input wire [5:0] opcode,
    input wire [5:0] func,
    output wire RFWR,
    output wire DMWR,
    output wire [1:0] M1,
    output wire [1:0] M2,
    output wire M3,
    output wire [2:0] NPCOP,
    output wire [2:0] ALUOP,
    output wire [1:0] EXTOP,
    output wire [1:0] WBH
    );
    wire addu,subu,ori,lw,sw,beq,jal,jr,lui,lb,sb,lh,sh,sll,sltu,Rtype,addi,jalr,j;
    assign Rtype = (opcode == `RTYPE);
    assign addu = Rtype & (func == `ADDU);
    assign subu = Rtype & (func == `SUBU);
    assign ori = (opcode == `ORI);
    assign lw = (opcode == `LW);
    assign sw = (opcode == `SW);
    assign beq = (opcode == `BEQ);
    assign jal = (opcode == `JAL);
    assign jr = (func == `JR)&Rtype;
    assign lui = (opcode == `LUI);
    assign lb = (opcode == `LB);
    assign sb = (opcode == `SB);
    assign lh = (opcode == `LH);
    assign sh = (opcode == `SH);
    assign sll = Rtype & (func == `SLL);
    assign sltu = Rtype & (func == `SLTU);
    assign addi = (opcode == `ADDI);
    assign j = (opcode ==`J);
    assign RFWR = addu | subu | ori | lw | sltu | jal | lui | sll | lb | lh | addi;
    assign DMWR = sw | sb | sh;
    assign ALUOP[2] = sll;
    assign ALUOP[1] = ori | sltu;
    assign ALUOP[0] = subu | sltu;
    assign NPCOP[2] = 1'b0;
    assign NPCOP[1] = jal | jr | j;
    assign NPCOP[0] = beq | jr;
    assign EXTOP[1] = lui;
    assign EXTOP[0] = ori | addi;
    assign M1[1] = jal;
    assign M1[0] = addu | subu | sltu | sll;
    assign M2[1] = jal;
    assign M2[0] = lw | lb | lh;
    assign M3 = ori | lw | sw | lui | sb | sh | lb | lh | addi;
    assign WBH[1] = sh | lh;
    assign WBH[0] = sb | lb;
endmodule
