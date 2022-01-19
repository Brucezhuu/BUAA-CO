`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:21 10/23/2021 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output Overflow
    );
	reg [2:0] cnt = 3'b000; //¼ÆÊýÆ÷
	reg flag = 0;
	
	assign Output = cnt ;
	assign Overflow = (flag == 1)? 1:0;
	always @(posedge Clk) begin
			if(Reset == 1) begin
				cnt <= 3'b000;
				flag <= 0;
			end
			else begin
				if(En == 1) begin
					case (cnt)
						3'b000: begin
							cnt <= 3'b001;
						end
						3'b001: begin
							cnt <= 3'b011;
						end
						3'b011: begin
							cnt <= 3'b010;
						end
						3'b010: begin
							cnt <=3'b110;
						end
						3'b110: begin
							cnt <= 3'b111;
						end
						3'b111: begin
							cnt <= 3'b101;
						end
						3'b101: begin
							cnt <= 3'b100;
						end
						3'b100: begin
							cnt <= 3'b000;
							flag <= 1;
						end
						default: begin
							cnt <= 3'b000;
							flag <= 0;
						end
					endcase
				end
			end
	end

endmodule
