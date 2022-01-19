`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:08 10/24/2021
// Design Name:   BlockChecker
// Module Name:   D:/COverilog/myISEproject/P1/BlockChecke_tb.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BlockChecker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BlockChecke_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] in;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	BlockChecker uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.result(result)
	);
	reg [0:1023] str = "a begin begin end End";
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
      $monitor("str = %s",str);
		// Add stimulus here
		while (!str[0:7]) str = str << 8;
		
		for(;str[0:7];str = str << 8) begin
			in = str[0:7];
			#10;
		end
	end
	always #5 clk = ~clk;
endmodule

