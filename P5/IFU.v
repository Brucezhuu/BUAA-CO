`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:04 12/11/2021 
// Design Name: 
// Module Name:    IFU 
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
module IFU(
    input clk,
    input reset,
    input stall,
    input [31:0] npc,
    output reg [31:0] pc,
    output [31:0] instr
    );
    reg [31:0] im[0:4095];
    integer i;
    initial begin
        for(i=0;i<4096;i=i+1) begin
            im[i] = 32'b0;
        end
        pc = 32'h0000_3000;
        $readmemh("code.txt",im);
    end
    always @(posedge clk)begin
        if(reset) begin
            pc <= 32'h0000_3000;
        end
        else if(stall) begin
            pc<=pc;
        end
        else begin
            pc <= npc;
        end
    end
    wire [31:0] rank = pc - 32'h0000_3000;

    assign instr = im[rank[13:2]];
    
endmodule
