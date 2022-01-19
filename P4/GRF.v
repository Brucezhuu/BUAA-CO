`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:04 12/04/2021 
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
    input wire clk,
    input wire reset,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD,
    input wire [31:0] WPC,
    input wire WE,
    output wire [31:0] RD1,
    output wire [31:0] RD2
    );
    reg [31:0] rf[31:1];
    integer i;
    initial begin
        for(i = 1;i<32;i = i+1) begin
            rf[i] = 32'b0;
        end 
    end

    assign RD1 = (!A1) ? 32'b0: rf[A1];
    assign RD2 = (!A2) ? 32'b0: rf[A2];

    always @(posedge clk) begin
        if(reset) begin
            for(i = 1;i<32;i = i+1) begin
                rf[i] = 32'b0;
            end
        end else begin
            if(WE) begin
                rf[A3] <= WD;
					 if(A3 != 5'b0) begin
						$display("@%h: $%d <= %h", WPC, A3, WD);
					 end
            end
        end
    end

endmodule
