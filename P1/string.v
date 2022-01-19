`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:36 10/23/2021 
// Design Name: 
// Module Name:    string 
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
module string(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );
parameter s0 = 2'b00,
			 s1 = 2'b01,
			 s2 = 2'b10,
			 s3 = 2'b11;
reg [1:0] status;
reg [1:0] nxt_status;
initial begin
	status = 2'b00;
	nxt_status = 2'b00;
end
// debug:
	//assign sta = status;
	//assign nxt = nxt_status;
//	
	always @(*) begin
		case (status)
			s0: begin
				if(in >= "0" &&  in <= "9") begin
					nxt_status = s1;
				end
				else nxt_status = s3;
			end
			s1: begin
				if(in == "+" || in == "*") begin
					nxt_status = s2;
				end
				else nxt_status = s3;
			end
			s2: begin
				if(in >= "0" && in <= "9") begin
					nxt_status = s1;
				end
				else nxt_status = s3;
			end
			s3: begin
				nxt_status = s3;
			end
			default: begin
				nxt_status = s0;
			end
		endcase
	end
	
	always @(posedge clk, posedge clr) begin
		if(clr == 1) begin
			status <= s0;
		end
		else status <= nxt_status;
	end
	
	assign out =(status == 2'b01)? 1:0;
endmodule
