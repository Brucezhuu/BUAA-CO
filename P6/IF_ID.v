`timescale 1ns / 1ps
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
    input [31:0] npc,
    input [31:0] i_inst_rdata,
    output [31:0] i_inst_addr,
    output [31:0] pc_I_pass,
    output reg [31:0] pc_I,
    output reg [31:0] instr_I
    );
    wire [31:0] pc_wire;
    assign i_inst_addr = pc_wire;
    initial begin
        pc_I <= 32'h0;
        instr_I <= 32'h0;
    end

    IFU ifu(.clk(clk),
            .reset(reset),
            .stall(D_stall),
            .npc(npc),
            .pc(pc_wire)
            );
    assign pc_I_pass = pc_wire;
    always @(posedge clk) begin
        if(reset) begin
            pc_I <= 32'h0;
            instr_I <= 32'h0;
        end
        else if(D_stall) begin
            pc_I <= pc_I;
            instr_I <= instr_I;
        end
        else begin
            pc_I <= pc_wire;
            instr_I <= i_inst_rdata;
        end
    end

endmodule
