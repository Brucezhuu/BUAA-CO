`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:18 12/04/2021 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input wire [15:0] imm16,
    input wire [1:0] F,
    output wire [31:0] ext
    );
	assign ext = (F == 2'b00) ? {{16{imm16[15]}},imm16}:
                    (F == 2'b01) ? {{16{1'b0}},imm16}:
                    (F == 2'b10) ? {imm16,{16{1'b0}}} : {{16{1'b0}},imm16};
    

endmodule
