`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:23 11/03/2021 
// Design Name: 
// Module Name:    count01 
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
module count01(
    input [7:0] in,
    output [1:0] result
    ); 
reg [6:0] cnt0;
reg [6:0] cnt1;
integer i;

initial begin
	cnt0 = 0;
	cnt1 = 0;
end


always @(*) begin
	for(i=0;i<=31;i=i+1) begin
	   cnt0 = 0;
		cnt1 = 0;
		if(in[i] == 1'b1) cnt1 = cnt1 + 1;
		else if(!in[i]) cnt0 = cnt0 + 1;
	end
end

assign result = (cnt1<cnt0) ? 2'b00 :(
						cnt1>cnt0 ? 2'b01 : 2'b10);
endmodule
