`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:43 12/11/2021 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input clk,
    input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input RFWR,
    input [31:0] pc,
    output [31:0] RD1,
    output [31:0] RD2
    );
    reg [31:0] rf[31:0];
    integer i;
    initial begin
        for(i=0;i<32;i=i+1) rf[i] = 32'b0;
    end
    assign RD1 = (A1 == 5'b0) ? 0 :
                (A1 == A3 && RFWR) ? WD :
                                        rf[A1];
    assign RD2 = (A2 == 5'b0) ? 0 : 
                (A2 == A3 && RFWR) ? WD :
                                        rf[A2];
    always @(posedge clk) begin
        if(reset) begin
            for(i=0;i<32;i=i+1) rf[i] <= 32'b0;
        end else begin
            if(RFWR) begin
                if(A3 != 5'b0) begin
                    rf[A3] <= WD;
                    //$display ("%d@%h: $%d <= %h", $time, pc, A3, WD);
					$display ("@%h: $%d <= %h", pc, A3, WD);
                end
            end
        end
    end

endmodule
