`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   22:10:33 09/15/2019
// Design Name:   alu
// Module Name:   C:/Users/UECCI/Desktop/ejer01/ALU/alu/testbench.v
// Project Name:  alu
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [2:0] portA;
	reg [2:0] portB;
	reg [1:0] opcode;
	reg clk;
	reg rst;

	// Outputs
	wire [0:6] sseg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.portA(portA),
		.portB(portB),
		.opcode(opcode),
		.SSeg(sseg),
		.an(an),
		.clk(clk),
		.rst(rst)
	);


	initial begin

      // $dumpfile("dump.vcd"); $dumpvars;
		// Initialize Inputs
		opcode = 0;
		clk = 0;
		rst = 1;
		portA=6;
		portB=3;

		// Wait 100 ns for global reset to finish
		#10;

		rst = 0;
		// Add stimulus here

		opcode = 0;

		#100 opcode = 1;

		#100 opcode = 2;

		#100 opcode = 3;

      	#100

    $finish;
	end

	always #1 clk = ~clk;

endmodule
