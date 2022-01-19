`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:46:18 11/03/2021
// Design Name:   count01
// Module Name:   D:/COverilog/myISEproject/P1/p1_0_tb.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count01
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module p1_0_tb;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [1:0] result;

	// Instantiate the Unit Under Test (UUT)
	count01 uut (
		.in(in), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

