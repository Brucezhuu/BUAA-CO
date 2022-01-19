`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:56:20 11/10/2021
// Design Name:   test
// Module Name:   D:/COverilog/myISEproject/P1/hdltbits_tb.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hdltbits_tb;

	// Inputs
	reg clk;
	reg reset;
	reg in;

	// Outputs
	wire disc;
	wire flag;
	wire err;

	// Instantiate the Unit Under Test (UUT)
	test uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.disc(disc), 
		.flag(flag), 
		.err(err)
	);
	reg [0:1023] str = "011111111110";
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here
		#5 in = 0;
		#10 in = 1;
		#10 in = 1;	
		#10 in = 1;
		#10 in = 1;
		#10 in = 1;
		#10 reset = 1;
		in = 0;
		#10 in = 1;
		reset = 0;
		#50 in = 0;
			
	end
      always #5 clk = ~clk;
endmodule

