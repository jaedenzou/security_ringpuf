`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:48 03/23/2019 
// Design Name: 
// Module Name:    clk_counter 
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
module clk_counter(
    output reg [11:0] out,
    input enable,
    input clk,
    input reset
    );
	 
	always @(posedge clk) begin
		if (reset) begin // active high reset
			out <= 12'b0;
		end
		else if (out==12'b111111111111) begin
		out <= out;
		end
		else if (enable) begin
			out <= out + 1;
		end
		else begin
			out <= out;
		end
	end

endmodule
