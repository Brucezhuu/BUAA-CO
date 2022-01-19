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
    input reset,
    
    input interrupt,                 // 外部中断信号
    output [31:0] macroscopic_pc,    // 宏观 PC
    
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
    output [31:0] w_inst_addr
);
    wire IRQ2,IRQ1;
    wire [5:0] HWint = {3'b000,interrupt,IRQ2,IRQ1}; 
	wire [31:0] DM_IN;
    wire [31:0] m_data_addr_CPU;
    wire [3:0] m_data_byteen_CPU;
    wire tbReq;
    CPU cpu(.clk(clk),
            .reset(reset),
            .i_inst_rdata(i_inst_rdata),
            .HWint(HWint),
            .m_data_addr(m_data_addr_CPU),
            .i_inst_addr(i_inst_addr),
            .m_data_rdata(DM_IN),
            .m_data_wdata(m_data_wdata),
            .m_data_byteen(m_data_byteen_CPU),
            .m_inst_addr(m_inst_addr),
            .w_grf_we(w_grf_we),
            .w_grf_addr(w_grf_addr),
            .w_grf_wdata(w_grf_wdata),
            .w_inst_addr(w_inst_addr),
            .macroscopic_pc(macroscopic_pc),
            .tbReq(tbReq)
            );
    assign m_data_addr = (tbReq) ? 32'h7f20 : m_data_addr_CPU;
    assign m_data_byteen = (tbReq) ? 4'b1111 : m_data_byteen_CPU;

    wire HitTC1 = (m_data_addr >= 32'h7f00 && m_data_addr <= 32'h7f0b);
    wire HitTC2 = (m_data_addr >= 32'h7f10 && m_data_addr <= 32'h7f1b);
    wire we1 = (HitTC1) && (m_data_byteen != 4'h0);
    wire we2 = (HitTC2) && (m_data_byteen != 4'h0);
    wire [31:0] tc1_Dout,tc2_Dout;
    

    TC tc1(.clk(clk),
            .reset(reset),
            .Addr(m_data_addr[31:2]),
            .WE(we1),
            .Din(m_data_wdata),
            .Dout(tc1_Dout),
            .IRQ(IRQ1));

    TC tc2(.clk(clk),
            .reset(reset),
            .Addr(m_data_addr[31:2]),
            .WE(we2),
            .Din(m_data_wdata),
            .Dout(tc2_Dout),
            .IRQ(IRQ2));

    assign DM_IN = (HitTC1) ? tc1_Dout :
                            (HitTC2) ? tc2_Dout :
                            m_data_rdata;
/*    wire [31:0] npc_wire,instr_I_wire;
    wire [31:0] pc_I_pass_wire,pc_I_wire;
    wire D_stall_wire;
    wire E_Busy;
	wire M_RFWR_wire,E_DMWR_wire;
    wire [4:0] M_A3_wire;
    wire [31:0] E_data_wire,M_data_wire,E_pc_wire,E_instr_wire,E_RD2_wire;
    IF_ID if_id(.clk(clk),
                .reset(reset),
                .D_stall(D_stall_wire),
                .npc(npc_wire),
                .i_inst_rdata(i_inst_rdata),
                .i_inst_addr(i_inst_addr),
                .pc_I_pass(pc_I_pass_wire),
                .pc_I(pc_I_wire),
                .instr_I(instr_I_wire));
    
    wire [31:0] pc_W_wire,D_RD1_wire,D_RD2_wire,D_pc_wire,D_instr_wire;
    wire [4:0] E_A3_wire,D_A1_wire,D_A2_wire,D_A3_wire;
    wire E_RFWR_wire,D_RFWR_wire;
    wire [2:0] E_tnew_wire,D_tnew_wire;
    wire [`Bitwidth] D_onehot_wire;

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
                .w_inst_addr(w_inst_addr));

    wire [4:0] E_loadType;
    wire [3:0] E_byteen;
    wire E_about_DM;
    wire [`Bitwidth] E_onehot_wire;
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
                .E_data(E_data_wire));
    
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
                .m_inst_addr(m_inst_addr));
                */
endmodule
