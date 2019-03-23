`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:30 03/20/2019 
// Design Name: 
// Module Name:    inv 
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
module inv(out, in);
	input in;
	output out;
	
	reg out;
	always @(in) begin
		#1 out = ~in;
	end

endmodule
