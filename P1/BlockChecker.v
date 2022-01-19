`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:06 10/24/2021 
// Design Name: 
// Module Name:    BlockChecker 
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
module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );
	 
	reg [255:0] cnt;
	reg [255:0] buffer;
	reg flag;
	initial begin
		cnt = 256'b0;
		buffer = 256'b0;
		flag = 1'b1; //flag 为 1 说明成功匹配
	end

	always @(posedge clk,posedge reset) begin
		if(reset == 1) begin
			cnt <= 256'b0;
			buffer <= 256'b0;
			flag <= 1'b1;
		end else begin
			buffer = (buffer << 8) | in | 8'h20; // 或 8'd32 使输入字字母全按照小写计算
			
			if(flag == 1'b1) begin
				if(buffer[47:0] == " begin") cnt <= cnt + 1;
				else if(buffer[55:8] == " begin" && buffer[7:0] != " ") cnt <= cnt - 1;
				else if(buffer[31:0] == " end") cnt <= cnt -1;
				else if(buffer[39:8] == " end" && buffer[7:0] != " ") cnt <= cnt + 1;
				else if(buffer[39:8] == " end" && buffer[7:0] == " " && cnt[255] == 1) flag = 1'b0;
			end
		end
	end
	assign result = ((cnt == 255'b0 )&& (flag == 1'b1)) ? 1:0;
endmodule
