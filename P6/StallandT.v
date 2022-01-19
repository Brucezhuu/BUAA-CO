`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:34 12/11/2021 
// Design Name: 
// Module Name:    StallandT 
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
module StallandT(
    input [31:0] instr,
    input [`Bitwidth] onehot,
    input [2:0] D_tnew,
    input [2:0] E_tnew,
    input [4:0] D_A3,
    input [4:0] E_A3,
    input D_RFWR,
    input E_RFWR,
	input XALU_Busy,///////
	input D_MDFamily,/////
    input [4:0] rs,
    input [4:0] rt,
    output stall,
    output [2:0] tnew
    );
    wire `insbus;
//  `define Bitwidth 17:0
//  `define insbus nop,addu, addi, subu, ori, lw, lh, lb, sw, sh, sb, beq, lui, j, jal, jalr, jr, sll
    wire read_rs;
    wire read_rt;
    assign read_rs = (addi||addiu||add||addu||sub||subu||lw||sw||lb||lbu||lh||lhu||sb||sh||jr||jalr||mult||multu||div||divu||mthi||mtlo||
				   sllv||srlv||srav||And||Or||Xor||Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||
				   beq||bne||blez||bgtz||bltz||bgez);
    assign read_rt = (add||addu||sub||subu||sw||sb||sh||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
				   And||Or||Xor||Nor||slt||sltu||beq||bne);
					
    assign {`insbus} = onehot;
    wire rs_Tuse;
    assign rs_Tuse = (beq||bne||blez||bgtz||bltz||bgez)	?	0:
				(addi||addiu||add||addu||sub||subu||lw||sw||lb||lbu||lh||lhu||sb||sh||mult||multu||div||mthi||mtlo||
				divu||sllv||srlv||srav||And||Or||Xor||Nor||ori||Andi||Xori||slt||sltu||slti||sltiu)		?	1 : 0;
    wire [1:0] rt_Tuse;
    assign rt_Tuse = (beq||bne)	?	0:
				(add||addu||sub||subu||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
				And||Or||Xor||Nor||slt||sltu)	?	1:
				(sw||sb||sh)	?	2 : 0;

    wire stall_rs;
    wire stall_rt;
	wire stall_xalu;
	
    wire HILOFamily = (mult|multu|div|divu|mfhi|mflo|mthi|mtlo);
	
	assign stall_xalu = ((XALU_Busy&HILOFamily)|(HILOFamily&D_MDFamily));
	
    assign stall = ( stall_rs | stall_rt | stall_xalu);
    assign stall_rs = (read_rs && rs != 5'b0) && ((D_tnew > rs_Tuse && D_RFWR && D_A3 == rs) || (E_tnew > rs_Tuse && E_RFWR && E_A3 == rs));
    assign stall_rt = (read_rt && rt != 5'b0) && ((D_tnew > rt_Tuse && D_RFWR && D_A3 == rt) || (E_tnew > rt_Tuse && E_RFWR && E_A3 == rt));
	
    assign tnew = (lw||lhu||lh||lbu||lb)	?	3:
				(addi||addiu||add||addu||sub||subu||lui||jal||jalr||mfhi||mflo||sll||srl||sra||sllv||srlv||srav||
				And||Or||Xor||Nor||ori||Andi||Xori||slt||sltu||slti||sltiu)		?	2 : 3; // 第二级流水线的tnew不可能为0

endmodule
