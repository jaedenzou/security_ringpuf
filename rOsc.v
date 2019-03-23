`timescale 1ns / 1ps

//Comment out the line below while implementing your design with hard macro
(*KEEP_HIERARCHY="TRUE"*)

module rOsc(enable, reset, dffout);
    input enable, reset;
    output dffout;
	 
   //Comment out the line below while implementing your design with hard macro
	(* S = "TRUE" *)
	
	//Write the code for your ring oscillator
	//Comment it out after you create the hard macro
	
	genvar i;
	wire [2:0] not_out;
	wire d_clk;
	wire d;
	reg dffout;
	
	
	assign d_clk = not_out[2];
	
	and and0(en_and, enable, not_out[2]);
	not n_dff(d, dffout);
	

	(*KEEP = "TRUE"*) not #1 n0(not_out[0], en_and);
	(*KEEP = "TRUE"*) not #1 n1(not_out[1], not_out[0]);
	(*KEEP = "TRUE"*) not #1 n2(not_out[2], not_out[1]);
	
	always @(posedge d_clk) begin
		if (reset) begin
			dffout = 1'b0;
		end
		else begin
			dffout = d;
		end
	end
	
	

	/////////////////////////////////////////
	
endmodule