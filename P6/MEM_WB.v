`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:38 12/11/2021 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(
    input clk,
    input reset,
    input [31:0] E_instr,
    input [31:0] E_pc,
    input [`Bitwidth] E_onehot,
    input [31:0] E_RD2,
    input [31:0] E_data,
    input [4:0] E_A3,
    input [3:0] E_byteen,
    input [4:0] E_loadType,
    input E_about_DM,
    input E_RFWR,
    input E_DMWR,
    input [31:0] m_data_rdata,
    output reg RFWR_W,
    output reg [4:0] A3_W,
    output [31:0] WD_W,
    output reg [31:0] pc_W,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3:0] m_data_byteen,
    output [31:0] m_inst_addr
    );
    assign m_data_addr = E_data ;
    assign m_data_wdata = MF_DM;
    assign m_data_byteen = E_byteen;
    assign m_inst_addr = E_pc;       

    wire `insbus;
    //wire [31:0] dmout_wire;
    assign {`insbus} = E_onehot;
    //wire loadToreg = (lw | lb | lh);
    reg [1:0] M_offset;
    reg [4:0] M_loadType;
    reg [31:0] M_RawData;
	reg		M_about_DM;

    initial begin
        RFWR_W = 0;
        A3_W = 5'b0;
        //WD_W = 32'b0;
        pc_W = 32'b0;
        M_offset = 2'b00;
        M_loadType = 0;
        M_RawData = 0;
        M_about_DM = 0;
    end

    wire [31:0] MF_DM;
    wire [1:0] offset = E_data[1:0];
    wire [31:0] res = E_about_DM ? m_data_rdata : E_data;
    assign MF_DM = (RFWR_W && A3_W != 5'b0 && A3_W == E_instr[20:16]) ? (WD_W<<({E_data[1:0],3'b0})) : E_RD2;
    /*DM dm(.clk(clk),
        .reset(reset),
        .onehot(E_onehot),
        .addr(E_data),
        .pc(E_pc),
        .wd(MF_DM),
        .DMWR(E_DMWR),
        .RD(dmout_wire));*/
    
    always @(posedge clk) begin
        if(reset) begin
            RFWR_W <= 0;
            A3_W <= 5'b0;
            //WD_W <= 32'b0;
            pc_W <= 32'b0;
            M_offset <= 2'b00;
            M_loadType <= 0;
            M_RawData <= 0;
            M_about_DM <= 0;
        end
        else begin
            pc_W <= E_pc;
            A3_W <= E_A3;
            RFWR_W <= E_RFWR;
            M_offset <= offset;
            M_loadType <= E_loadType;
            M_RawData <= res;
            M_about_DM <= E_about_DM;
           // WD_W <= (loadToreg) ? dmout_wire : E_data;
        end
    end

//  ##############################        W ï¿                  //####################
    wire [31:0] Ext_wire;
    MemExtUnit mem_ext(.RawMemData(M_RawData),
                .offset(M_offset),
                .loadType(M_loadType),
                .ExtMemData(Ext_wire));
    assign WD_W = M_about_DM ? Ext_wire : M_RawData;
endmodule
