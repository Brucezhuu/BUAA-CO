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
    wire	[5:0] 	OpCode	=	instr[31:26],
					Funct	=	instr[5:0];
	wire	lb=		(OpCode==6'h20),
			lbu=	(OpCode==6'h24),
			lh=		(OpCode==6'h21),
			lhu=	(OpCode==6'h25),
			lw=		(OpCode==6'h23),
			sb=		(OpCode==6'h28),
			sh=		(OpCode==6'h29),
			sw=		(OpCode==6'h2b);
	
	wire	addi=	(OpCode==6'h8),
			addiu=	(OpCode==6'h9),
			add=	(OpCode==6'h0 && Funct==6'h20),
			addu=	(OpCode==6'h0 && Funct==6'h21),
			sub=	(OpCode==6'h0 && Funct==6'h22),
			subu=	(OpCode==6'h0 && Funct==6'h23),
			lui=	(OpCode==6'hf);
	
	wire	ori=	(OpCode==6'hd),
			And=	(OpCode==6'h0 && Funct==6'h24),
			Or=		(OpCode==6'h0 && Funct==6'h25),
			Xor=	(OpCode==6'h0 && Funct==6'h26),
			Nor=	(OpCode==6'h0 && Funct==6'h27),
			Andi=	(OpCode==6'hc),
			Xori=	(OpCode==6'he);
	wire	beq=	(OpCode==6'h4),
			bne=	(OpCode==6'h5),
			blez=	(OpCode==6'h6),
			bgtz=	(OpCode==6'h7),
			bltz=	(instr[31:26]==6'h1 && instr[20:16]==6'h0),
			bgez=	(instr[31:26]==6'h1 && instr[20:16]==6'h1),
			j=		(OpCode==6'h2),
			jal=	(OpCode==6'h3),
			jr=		(OpCode==6'h0 && Funct==6'h8),
			jalr=	(OpCode==6'h0 && Funct==6'h9),
			nop=	(instr==32'b0);
	
	wire	mult=	(OpCode==6'h0 && Funct==6'h18),
			multu=	(OpCode==6'h0 && Funct==6'h19),
			div=	(OpCode==6'h0 && Funct==6'h1a),
			divu=	(OpCode==6'h0 && Funct==6'h1b),
			mfhi=	(OpCode==6'h0 && Funct==6'h10),
			mthi=	(OpCode==6'h0 && Funct==6'h11),
			mflo=	(OpCode==6'h0 && Funct==6'h12),
			mtlo=	(OpCode==6'h0 && Funct==6'h13);
	
	wire	sll=	(OpCode==6'h0 && Funct==6'h0),
			srl=	(OpCode==6'h0 && Funct==6'h2),
			sra=	(OpCode==6'h0 && Funct==6'h3),
			sllv=	(OpCode==6'h0 && Funct==6'h4),
			srlv=	(OpCode==6'h0 && Funct==6'h6),
			srav=	(OpCode==6'h0 && Funct==6'h7);
			
	wire	slt=	(OpCode==6'h0 && Funct==6'h2a),
			slti=	(OpCode==6'ha),
			sltu=	(OpCode==6'h0 && Funct==6'h2b),
			sltiu=	(OpCode==6'hb);
    /*wire [5:0] opcode;
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
    assign nop = (instr == 32'b0);*/

    assign RFWR = ~nop&&(	addi||addiu||add||addu||sub||subu||
							ori||lui||Or||And||Xor||Nor||Andi||Xori||
							lw||lh||lhu||lb||lbu||
							jal||jalr||
							mfhi||mflo||
							sll||srl||sra||sllv||srlv||srav||
							slt||slti||sltu||sltiu);
    assign D_A3 = (add||addu||sub||subu||mfhi||mflo||sll||srl||sra||sllv||srlv||srav||slt||sltu||
							And||Or||Xor||Nor||jalr) ? rd : 
					(addi||addiu||ori||Xori||Andi||lui||lw||lhu||lh||lbu||lb||slti||sltiu) ? rt:
					(jal)? 5'd31 :    rd;
            
    assign onehot = {`insbus};
endmodule
