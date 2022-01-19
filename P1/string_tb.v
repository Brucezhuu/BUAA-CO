`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:26 10/23/2021
// Design Name:   string
// Module Name:   D:/COverilog/myISEproject/P1/string_tb.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: string
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module string_tb;

	// Inputs
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	string uut (
		.clk(clk), 
		.clr(clr), 
		.in(in), 
		.out(out)
	);
	reg [0:1023]str = "1+2+3++4";
	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		// Wait 100 ns for global reset to finish
		
      in = "1";  
		// Add stimulus here
		while (!str[0:7]) str = str << 8;
		str = str << 8;
		#10;
		
		for(;str[0:7];str=str<<8) begin
			in = str[0:7];
			#10;
		end
	end
   always #5 clk = ~clk;
endmodule

