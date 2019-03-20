`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:49 03/20/2019 
// Design Name: 
// Module Name:    Mux16 
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
module Mux16(sel, in, out);
	input [15:0] in;
	input [3:0] sel;
	output out;
		
	assign out = in[sel];

endmodule
