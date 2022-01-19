`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:53 12/12/2021 
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
    input clk,
    input reset
    );
    wire [31:0] npc_wire,instr_I_wire;
    wire [31:0] pc_I_pass_wire,pc_I_wire;
    wire D_stall_wire;
    IF_ID if_id(.clk(clk),
                .reset(reset),
                .D_stall(D_stall_wire),
                .npc(npc_wire),
                .pc_I_pass(pc_I_pass_wire),
                .pc_I(pc_I_wire),
                .instr_I(instr_I_wire));
    
    wire [31:0] pc_W_wire,D_RD1_wire,D_RD2_wire,D_pc_wire,D_instr_wire;
    wire [4:0] E_A3_wire,D_A1_wire,D_A2_wire,D_A3_wire;
    wire E_RFWR_wire,D_RFWR_wire;
    wire [2:0] E_tnew_wire,D_tnew_wire;
    wire [`Bitwidth] D_onehot_wire;
	
	wire M_RFWR_wire,E_DMWR_wire;
    wire [4:0] M_A3_wire;
    wire [31:0] E_ALUC_wire,M_data_wire,E_pc_wire,E_instr_wire,E_RD2_wire;
    wire [`Bitwidth] E_onehot_wire;

    ID_EX id_exe(.clk(clk),
                .reset(reset),
                .I_pc(pc_I_wire),
                .I_pc_pass(pc_I_pass_wire),
                .I_instr(instr_I_wire),
                .pc_W(pc_W_wire),//////////
                .A3_W(M_A3_wire),///////////////
                .WD_W(M_data_wire),/////////////
                .RFWR_W(M_RFWR_wire),/////////////
                .E_RFWR(E_RFWR_wire),//////////////
                .E_WD(E_ALUC_wire),//////////////
                .E_A3(E_A3_wire),//////////////
                .E_tnew(E_tnew_wire),////////////////
                .npc_pass(npc_wire),
                .D_onehot(D_onehot_wire),
                .D_RD1(D_RD1_wire),
                .D_RD2(D_RD2_wire),
                .D_A1(D_A1_wire),///////////
                .D_A2(D_A2_wire),///////////
                .D_RFWR(D_RFWR_wire),
                .D_pc(D_pc_wire),
                .D_A3(D_A3_wire),
                .D_stall(D_stall_wire),
                .D_tnew(D_tnew_wire),
                .D_instr(D_instr_wire));


    EXE_MEM exe_mem(.clk(clk),
                .reset(reset),
                .D_pc(D_pc_wire),
                .D_instr(D_instr_wire),
                .D_onehot(D_onehot_wire),
                .D_RD1(D_RD1_wire),
                .D_RD2(D_RD2_wire),
                .D_A3(D_A3_wire),
                .D_RFWR(D_RFWR_wire),
                .D_tnew(D_tnew_wire),
                .M_RFWR(M_RFWR_wire),
                .M_A3(M_A3_wire),///////////
                .M_data(M_data_wire),////////////
                .E_pc(E_pc_wire),
                .E_instr(E_instr_wire),
                .E_onehot(E_onehot_wire),
                .E_RFWR(E_RFWR_wire),///////////
                .E_A3(E_A3_wire),
                .E_tnew(E_tnew_wire),
                .E_RD2(E_RD2_wire),
                .E_DMWR(E_DMWR_wire),
                .E_ALUC(E_ALUC_wire));
    
    MEM_WB mem_wb(.clk(clk),
                .reset(reset),
                .E_instr(E_instr_wire),
                .E_pc(E_pc_wire),
                .E_onehot(E_onehot_wire),
                .E_RD2(E_RD2_wire),
                .E_ALUC(E_ALUC_wire),
                .E_A3(E_A3_wire),
                .E_RFWR(E_RFWR_wire),
                .E_DMWR(E_DMWR_wire),
                .RFWR_W(M_RFWR_wire),
                .A3_W(M_A3_wire),
                .WD_W(M_data_wire),
                .pc_W(pc_W_wire));
endmodule
