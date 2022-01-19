`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:55 12/11/2021 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
    input reset,
    input [`Bitwidth] onehot,
    input [31:0] addr,
    input [31:0] wd,
    input [31:0] pc,
    input DMWR,
    output [31:0] RD
    );
    reg [31:0] dm[0:3071];
    integer  i;
    initial begin
        for(i=0;i<3072;i=i+1) dm[i] = 32'b0;
    end
    wire [31:0] dmWord = dm[addr[13:2]];
    wire `insbus;
    assign {`insbus} = onehot;
    assign RD = (lw) ? dmWord: 
				(lb && addr[1:0] == 2'b00) ? {{24{dmWord[7]}},dmWord[7:0]}:
				(lb && addr[1:0] == 2'b01) ? {{24{dmWord[15]}},dmWord[15:8]}:
				(lb && addr[1:0] == 2'b10) ? {{24{dmWord[23]}},dmWord[23:16]}:
				(lb && addr[1:0] == 2'b11) ? {{24{dmWord[31]}},dmWord[31:24]}:
				(lh && addr[1:0] == 2'b00) ? {{16{dmWord[15]}},dmWord[15:0]}:
				(lh && addr[1:0] == 2'b10) ? {{16{dmWord[31]}},dmWord[31:16]}:32'b0;
    always @(posedge clk) begin
	if(reset) begin
		for(i = 0; i < 1024; i = i+1) begin
			dm[i] <= 32'b0;
		end
	end 
	else begin
		if(sw) begin
			dm[addr[13:2]] <= wd;
			//$display ("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2], 2'b0}, wd);
			$display ("@%h: *0000%h <= %h", pc, {addr[13:2], 2'b0}, wd);
		end
		else if(sb) begin
			case(addr[1:0])
					2'b00:begin
						dm[addr[13:2]] <= {dmWord[31:8],wd[7:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {dmWord[31:8],wd[7:0]});
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {dmWord[31:8],wd[7:0]});
					end
					2'b01:begin
						dm[addr[13:2]] <= {dmWord[31:16],wd[7:0],dmWord[7:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {dmWord[31:16],wd[7:0],dmWord[7:0]});
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {dmWord[31:16],wd[7:0],dmWord[7:0]});
					end	
					2'b10:begin
						dm[addr[13:2]] <= {dmWord[31:24],wd[7:0],dmWord[15:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {dmWord[31:24],wd[7:0],dmWord[15:0]});
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {dmWord[31:24],wd[7:0],dmWord[15:0]});
					end
					default:begin
						dm[addr[13:2]] <= {wd[7:0],dmWord[23:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {wd[7:0],dmWord[23:0]});
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {wd[7:0],dmWord[23:0]});
					end	
				endcase
		end
		else if(sh) begin
			case(addr[1])
					1'b0:begin
						dm[addr[13:2]] <= {dmWord[31:16],wd[15:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {dmWord[31:16],wd[15:0]});	
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {dmWord[31:16],wd[15:0]});	
					end
					default:begin
						dm[addr[13:2]] <= {wd[15:0],dmWord[15:0]};
						//$display("%d@%h: *0000%h <= %h", $time, pc, {addr[13:2],2'b00}, {wd[15:0],dmWord[15:0]});
						$display("@%h: *0000%h <= %h", pc, {addr[13:2],2'b00}, {wd[15:0],dmWord[15:0]});
					end		
			endcase
		end
	end
end
endmodule
