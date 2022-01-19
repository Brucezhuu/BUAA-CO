`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:53 12/25/2021 
// Design Name: 
// Module Name:    CPU
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
module CPU(
    input clk,
    input reset,
    input [5:0] HWint,
    input [31:0] i_inst_rdata,
    input [31:0] m_data_rdata,
    output [31:0] i_inst_addr,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,
    output [31:0] m_inst_addr,
    output w_grf_we,
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr,
    output [31:0] macroscopic_pc,
    output tbReq
);

    assign macroscopic_pc = E_pc_wire;

    wire [31:0] npc_wire,instr_I_wire;
    wire [31:0] pc_I_pass_wire,pc_I_wire;
    wire D_stall_wire;
    wire E_Busy;
	wire M_RFWR_wire,E_DMWR_wire;
    wire [4:0] M_A3_wire;
    wire [31:0] E_data_wire,M_data_wire,E_pc_wire,E_instr_wire,E_RD2_wire;
    
    wire D_eret,req,npc_Br;
    wire [31:0] EPC;
    wire [3:0] D_excCode;
    wire D_bd;

    IF_ID if_id(.clk(clk),
                .reset(reset),
                .D_stall(D_stall_wire),

                .D_eret(D_eret),
                .EPC(EPC),
                .req(req),
                .npc_Br(npc_Br),


                .npc(npc_wire),
                .i_inst_rdata(i_inst_rdata),
                .i_inst_addr(i_inst_addr),
                .pc_I_pass(pc_I_pass_wire),
                .pc_I(pc_I_wire),
                .instr_I(instr_I_wire),

                .D_excCode(D_excCode),
                .D_bd(D_bd)
                );
    
    wire [31:0] pc_W_wire,D_RD1_wire,D_RD2_wire,D_pc_wire,D_instr_wire;
    wire [4:0] E_A3_wire,D_A1_wire,D_A2_wire,D_A3_wire;
    wire E_RFWR_wire,D_RFWR_wire;
    wire [2:0] E_tnew_wire,D_tnew_wire;
    wire [`Bitwidth] D_onehot_wire;

    wire M_mtc0;
    wire [4:0] M_rd_addr;
    wire [3:0] E_excCode;
    wire E_bd;

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
                .E_WD(E_data_wire),//////////////
                .E_A3(E_A3_wire),//////////////
                .E_tnew(E_tnew_wire),////////////////
                .E_Busy(E_Busy),


                .D_excCode(D_excCode),
                .req(req),
                .D_bdin(D_bd),
                .M_mtc0(M_mtc0),
                .M_rd_addr(M_rd_addr),
                .EPC(EPC),


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
                .D_instr(D_instr_wire),
                .w_grf_we(w_grf_we),
                .w_grf_wdata(w_grf_wdata),
                .w_grf_addr(w_grf_addr),
                .w_inst_addr(w_inst_addr),
                
                .E_excCode(E_excCode),
                .E_bd(E_bd),
                .D_eret(D_eret),
                .npc_Br(npc_Br));

    wire [4:0] E_loadType;
    wire [3:0] E_byteen;
    wire E_about_DM;
    wire [`Bitwidth] E_onehot_wire;

    wire [31:0] E_MFALUB;
    wire M_bd;
    wire [3:0] M_excCode;
    wire excOvDM;

    
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
                .M_A3(M_A3_wire),
                .M_data(M_data_wire),
                .E_pc(E_pc_wire),
                .E_instr(E_instr_wire),
                .E_onehot(E_onehot_wire),
                .E_RFWR(E_RFWR_wire),
                .E_A3(E_A3_wire),
                .E_Busy(E_Busy),
                .E_loadType(E_loadType),
                .E_byteen(E_byteen),
                .E_about_DM(E_about_DM),
                .E_tnew(E_tnew_wire),
                .E_RD2(E_RD2_wire),
                .E_DMWR(E_DMWR_wire),
                .E_data(E_data_wire),
                
                .E_bdin(E_bd),
                .E_excCode(E_excCode),
                .req(req),
                .E_MFALUB(E_MFALUB),
                .M_bd(M_bd),
                .M_excCode(M_excCode),
                .excOvDM(excOvDM),
                .M_mtc0(M_mtc0),
                .M_rd_addr(M_rd_addr)
                );
    
    MEM_WB mem_wb(.clk(clk),
                .reset(reset),
                .E_instr(E_instr_wire),
                .E_pc(E_pc_wire),
                .E_onehot(E_onehot_wire),
                .E_RD2(E_RD2_wire),
                .E_data(E_data_wire),
                .E_A3(E_A3_wire),
                .E_byteen(E_byteen),
                .E_loadType(E_loadType),
                .E_about_DM(E_about_DM),
                .E_RFWR(E_RFWR_wire),
                .E_DMWR(E_DMWR_wire),
                .RFWR_W(M_RFWR_wire),
                .A3_W(M_A3_wire),
                .WD_W(M_data_wire),
                .pc_W(pc_W_wire),
                .m_data_rdata(m_data_rdata),
                .m_data_addr(m_data_addr),
                .m_data_wdata(m_data_wdata),
                .m_data_byteen(m_data_byteen),
                .m_inst_addr(m_inst_addr),
                
                .E_MFALUB(E_MFALUB),
                .HWint(HWint),
                .M_Ov_DM(excOvDM),
                .M_bdin(M_bd),
                .M_excCode(M_excCode),
                .EPCout(EPC),
                .req(req),
                .tbReq(tbReq));
endmodule
