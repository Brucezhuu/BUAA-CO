`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:22 12/11/2021 
// Design Name: 
// Module Name:    DecodeUnit 
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
`define RTYPE 6'b000000
`define ADDI  6'b001000
`define JALR  6'b001001
`define J     6'b000010
`define ADDI  6'b001000
`define SLL   6'b000000
module DecodeUnit(
    input [31:0] instr,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [4:0] shamt,
    output [15:0] imm16,
    output [25:0] imm26,
    output [4:0] D_A3,
    output RFWR,
    output [`Bitwidth] onehot
    );
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign imm16 = instr[15:0];
    assign imm26 = instr[25:0];
    wire `insbus;
    wire [5:0] opcode;
    wire [5:0] func;
    assign opcode = instr[31:26];
    assign func = instr[5:0];
//  insbus addu, addi, subu, ori, lw, lh, lb, sw, sh, sb, beq, lui, j, jal, jalr, jr, sll
    wire rType = (opcode == `RTYPE);
    assign addu = (func == `ADDU && rType);
    assign addi = (opcode == `ADDI);
    assign subu = (rType && func == `SUBU);
    assign ori = (opcode == `ORI);
    assign lw = (opcode == `LW);
    assign lh = (opcode == `LH);
    assign lb = (opcode == `LB);
    assign sw = (opcode == `SW);
    assign sh = (opcode == `SH);
    assign sb = (opcode == `SB);
    assign beq = (opcode == `BEQ);
    assign lui = (opcode == `LUI);
    assign j = (opcode == `J);
    assign jal = (opcode == `JAL);
    assign jalr = (func == `JALR && rType);
    assign jr = (rType && func == `JR);
    assign sll = (rType && func == `SLL);
    assign nop = (instr == 32'b0);
    assign RFWR = (addu | addi | subu | ori | lw | lh | lb | jal | jalr | jr | sll |lui) && ~nop;
    assign D_A3 = (addu | subu | jalr | sll) ? rd : 
					(lw | lh | lb | ori | lui | addi) ? rt:
					(jal)? 5'd31:
									rd;
            
    assign onehot = {`insbus};
endmodule
