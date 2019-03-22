`timescale 1ns / 1ps
module counter_12 (
output reg  [11:0] out      ,  // Output of the counter
input  wire		   enable   ,  // Enable count
input  wire       clk      ,  // clock input
input  wire       reset       // reset input
);

always @(posedge clk or posedge reset)
if (reset) begin // active high reset
  out <= 12'b0;
end else if (enable) begin
  out <= out + 1;
end else begin
  out <= out;
end

endmodule 
