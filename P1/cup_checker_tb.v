`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:50:34 10/25/2021
// Design Name:   cpu_checker
// Module Name:   D:/COverilog/myISEproject/P1/cup_checker_tb.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_checker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cup_checker_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] char;

	// Outputs
	wire format_type;

	// Instantiate the Unit Under Test (UUT)
	cpu_checker uut (
		.clk(clk), 
		.reset(reset), 
		.char(char), 
		.format_type(format_type)
	);

	reg [0:1023] str = "^1024@000030fc:$2<=89abcdef# ^64 ^3338@00003130: *0000f088 <= ffffb528#";
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		
	#5;
		// Add stimulus here
		while(!str[0:7]) str = str << 8;
		
		for(;str[0:7];str = str << 8) begin
			char = str[0:7];
			#10;
		end
	end
     always #5 clk = ~clk;
	  //always #685 reset = ~reset;
endmodule

