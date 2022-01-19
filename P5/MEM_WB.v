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
    input [31:0] E_ALUC,
    input [4:0] E_A3,
    input E_RFWR,
    input E_DMWR,
    output reg RFWR_W,
    output reg [4:0] A3_W,
    output reg [31:0] WD_W,
    output reg [31:0] pc_W
    );
    wire `insbus;
    wire [31:0] dmout_wire;
    assign {`insbus} = E_onehot;
    wire loadToreg = (lw | lb | lh);
    initial begin
        RFWR_W = 0;
        A3_W = 5'b0;
        WD_W = 32'b0;
        pc_W = 32'b0;
    end
    wire [31:0] MF_DM;
    assign MF_DM = (RFWR_W && A3_W != 5'b0 && A3_W == E_instr[20:16]) ? WD_W : E_RD2;
    DM dm(.clk(clk),
        .reset(reset),
        .onehot(E_onehot),
        .addr(E_ALUC),
        .pc(E_pc),
        .wd(MF_DM),
        .DMWR(E_DMWR),
        .RD(dmout_wire));
    always @(posedge clk) begin
        if(reset) begin
            RFWR_W <= 0;
            A3_W <= 5'b0;
            WD_W <= 32'b0;
            pc_W <= 32'b0;
        end
        else begin
            pc_W <= E_pc;
            A3_W <= E_A3;
            RFWR_W <= E_RFWR;
            WD_W <= (loadToreg) ? dmout_wire : E_ALUC;
        end
    end
    

endmodule
