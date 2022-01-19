`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:54 12/11/2021 
// Design Name: 
// Module Name:    EXE_MEM 
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
module EXE_MEM(
    input clk,
    input reset,
    input [31:0] D_pc,
    input [31:0] D_instr,
    input [`Bitwidth] D_onehot,
    input [31:0] D_RD1,
    input [31:0] D_RD2,
    input [4:0] D_A3,
    input D_RFWR,
    input [2:0] D_tnew,
    input M_RFWR,
    input [4:0] M_A3,
    input [31:0] M_data,
    output reg [31:0] E_pc,
    output reg [31:0] E_instr,
    output reg [`Bitwidth] E_onehot,
    output reg E_RFWR,
    output reg [4:0] E_A3,
    output E_Busy,
    //output reg [31:0] E_WD,
    output reg [2:0] E_tnew,
    output reg [31:0] E_RD2,
    output reg E_DMWR,
    output reg [31:0] E_data,
    output reg [4:0] E_loadType,
    output reg [3:0] E_byteen,
    output reg E_about_DM
    );
    wire `insbus;
    assign {`insbus} = D_onehot;
    wire [4:0] D_rs,D_rt;
    assign D_rs = D_instr[25:21];
    assign D_rt = D_instr[20:16];
    wire [31:0] MF_ALUA,MF_ALUB;
    assign MF_ALUA = (E_RFWR && E_A3 == D_rs && E_A3 != 5'b0 && !E_tnew) ? E_data : 
                        (M_RFWR && M_A3 == D_rs && M_A3 != 5'b0 ) ? M_data :
                                                                        D_RD1;
    assign MF_ALUB = (E_RFWR && E_A3 == D_rt && E_A3 != 5'b0 && !E_tnew) ? E_data :
                        (M_RFWR && M_A3 == D_rt && M_A3 != 5'b0 ) ? M_data:
                                                                            D_RD2;
    wire [31:0] ALUres;
    wire [31:0] data_wire,XALU_LO_wire,XALU_HI_wire;
    assign data_wire = mfhi	?	XALU_HI_wire:
						mflo	?	XALU_LO_wire : ALUres;
    ALU alu(.A(MF_ALUA),
            .B(MF_ALUB),
            .instr(D_instr),
            .onehot(D_onehot),
            .pc(D_pc),
            .C(ALUres));

    XALU xalu(.clk(clk),
            .reset(reset),
            .onehot(D_onehot),
            .XALU_A(MF_ALUA),
            .XALU_B(MF_ALUB),
            .XALU_HI(XALU_HI_wire),
            .XALU_LO(XALU_LO_wire),
            .XALU_Busy(E_Busy));

    wire [4:0] loadType_wire;
    wire [3:0] byteen_wire;
    wire about_DM_wire;

    MemCtrlUnit memctrl(.onehot(D_onehot),
                    .offset(ALUres[1:0]),
                    .loadType(loadType_wire),
                    .byteen(byteen_wire),
                    .aboutDM(about_DM_wire));

    initial begin
        E_pc = 32'b0;
        E_instr = 32'b0;
        E_onehot = 0;
        E_RFWR = 0;
        E_A3 = 5'b0;
        E_DMWR = 0;
        E_RD2 = 32'b0;
        //E_WD = 32'b0;
        E_tnew = 3'b000;
        E_data = 32'b0;
        E_loadType = 32'b0;
        E_byteen = 0;
        E_about_DM = 0;
    end
    always @(posedge clk) begin
        if(reset) begin
            E_pc <= 32'b0;
            E_instr <= 32'b0;
            E_onehot <= 0;
            E_RFWR <= 0;
            E_A3 <= 5'b0;
            E_DMWR <= 0;
            E_RD2 <= 32'b0;
            //E_WD <= 32'b0;
            E_tnew <= 3'b000;
            E_data <= 32'b0;
            E_loadType <= 32'b0;
            E_byteen <= 0;
            E_about_DM <= 0;
        end else  begin
            E_pc <= D_pc;
            E_instr <= D_instr;
            E_data <= data_wire;
            E_A3 <= D_A3;
            //E_WD <= MF_ALUB;
            E_onehot <= D_onehot;
            E_RD2 <= (MF_ALUB<<({ALUres[1:0],3'b0}));
            E_RFWR <= D_RFWR;
            E_tnew <= !D_tnew ? D_tnew : (D_tnew - 3'b001);
            E_loadType <= loadType_wire;
            E_byteen <= byteen_wire;
            E_about_DM <= about_DM_wire;
        end
    end
endmodule
