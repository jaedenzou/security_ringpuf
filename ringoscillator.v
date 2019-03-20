`timescale 1ns / 1ps

//Comment out the line below while implementing your design with hard macro
(*KEEP_HIERARCHY="TRUE"*)

module ringoscillator(enable, reset, dffout);
    input enable, reset;
    output dffout;
	 
   //Comment out the line below while implementing your design with hard macro
	(* S = "TRUE" *)
	
	//Write the code for your ring oscillator
	//Comment it out after you create the hard macro
	
	genvar i;
	wire [10:0] not_out;
	wire d_clk;
	wire d;
	reg dffout;
	
	
	assign d_clk = not_out[10];
	
	and and0(en_and, enable, not_out[10]);
	not n_dff(d, dffout);
	
	generate
		for (i=0; i<11; i = i+1) begin : loop
			if (i == 0) begin
				not n(not_out[i], en_and); 
			end
			else begin
				not n(not_out[i], not_out[i-1]);
			end
		end
	endgenerate
	
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