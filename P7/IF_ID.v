`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:39 12/11/2021 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(
    input clk,
    input reset,
    input D_stall,

    input D_eret,
    input [31:0] EPC,
    input req,
    input npc_Br,

    input [31:0] npc,
    input [31:0] i_inst_rdata,
    output [31:0] i_inst_addr,
    output [31:0] pc_I_pass,
    output reg [31:0] pc_I,
    output reg [31:0] instr_I,

    
    output reg [3:0] D_excCode,
    output reg D_bd
    );
    wire [31:0] pc_wire;
    assign i_inst_addr = D_eret ? EPC : pc_wire;
    initial begin
        pc_I <= 32'h0;
        instr_I <= 32'h0;
        D_excCode <= 32'h0;
        D_bd <= 0;
    end

    IFU ifu(.clk(clk),
            .reset(reset),
            .stall(D_stall),
            .npc(npc),
            .pc(pc_wire),
            .req(req)
            );
    
    wire excAdel_F;
    assign excAdel_F = ((|pc_wire[1:0]) | (pc_wire < 32'h3000) | (pc_wire > 32'h6ffc)) && !D_eret;



    assign pc_I_pass = pc_wire;
    always @(posedge clk) begin
        if(reset | req) begin
            pc_I <= (req) ? 32'h4180 : 32'h0;
            instr_I <= 32'h0;
            D_excCode <= 0;
            D_bd <= 0;
        end
        else if(D_stall) begin
            pc_I <= pc_I;
            instr_I <= instr_I;
            D_excCode <= D_excCode;
            D_bd <= D_bd;
        end
        else begin
            pc_I <= D_eret ? EPC : pc_wire;
            instr_I <= (excAdel_F) ? 0 : i_inst_rdata;
            D_excCode <= (excAdel_F) ? 4 : 0;
            D_bd <= (npc_Br);
        end
    end

endmodule
