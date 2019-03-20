`timescale 1ns / 1ps
module 12_counter (
output reg  [11:0] out      ,  // Output of the counter
input  wire       clk      ,  // clock input
input  wire       reset       // reset input
);

always_ff @(posedge clk)
if (reset) begin // active high reset
  out <= 8'b0;
end else if (enable) begin
  out ++;
end else begin
  out <= out;
end

endmodule 
