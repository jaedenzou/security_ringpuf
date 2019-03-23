`timescale 1ns / 1ps

module counter_12 (
	out      ,  // Output of the counter
	enable   ,  // Enable count
	clk      ,  // clock input
	reset       // reset input
);
	input enable, clk, reset;
	output [11:0] out;
	
	reg [11:0] out;
	

	always @(posedge clk) begin
		if (reset) begin // active high reset
			out <= 12'b0;
		end
		else if (enable) begin
			out <= out + 1;
		end
		else begin
			out <= out;
		end
	end

endmodule