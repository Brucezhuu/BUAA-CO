`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:09 12/03/2021 
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
    input wire clk,
    input wire reset,
    input wire [31:0] npc,
    output wire [31:0] pc,
    output wire [31:0] instru
    );
	reg [31:0] im [0:1023];
    reg [31:0] PC;
    assign instru = im[PC[11:2]];
    assign pc = PC;

    integer i;
    initial begin
        PC = 32'h0000_3000;
        for(i=0;i<1024;i=i+1) begin
            im[i] = 32'h0000_0000;
        end
        $readmemh("code.txt",im);
    end
	
	
    always @(posedge clk) begin
        if(reset) begin
            PC <= 32'h0000_3000;
        end else begin
            PC <= npc;
        end
    end
endmodule
