`timescale 1ns / 1ps

//Comment out the line below while implementing your design with hard macro
//(*KEEP_HIERARCHY="TRUE"*)

module ringoscillator(enable, reset, dffout);
    input enable, reset;
    output dffout;
	 
   //Comment out the line below while implementing your design with hard macro
	//(* S = "TRUE" *)
	
	//Write the code for your ring oscillator
	//Comment it out after you create the hard macro
	/*
	genvar i;
	(*KEEP = "TRUE"*) wire [10:0] not_out;
	wire d_clk;
	wire d;
	reg dffout;
	
	
	assign d_clk = not_out[10];
	
	and and0(en_and, enable, not_out[10]);
	(*KEEP = "TRUE"*) not #1 n_dff(d, dffout);
	
	
	(*KEEP = "TRUE"*) not #1 n0(not_out[0], en_and);
	(*KEEP = "TRUE"*) not #1 n1(not_out[1], not_out[0]);
	(*KEEP = "TRUE"*) not #1 n2(not_out[2], not_out[1]);
	(*KEEP = "TRUE"*) not #1 n3(not_out[3], not_out[2]);
	(*KEEP = "TRUE"*) not #1 n4(not_out[4], not_out[3]);
	(*KEEP = "TRUE"*) not #1 n5(not_out[5], not_out[4]);
	(*KEEP = "TRUE"*) not #1 n6(not_out[6], not_out[5]);
	(*KEEP = "TRUE"*) not #1 n7(not_out[7], not_out[6]);
	(*KEEP = "TRUE"*) not #1 n8(not_out[8], not_out[7]);
	(*KEEP = "TRUE"*) not #1 n9(not_out[9], not_out[8]);
	(*KEEP = "TRUE"*) not #1 n10(not_out[10], not_out[9]);
	

	
	always @(posedge d_clk) begin
		if (reset) begin
			dffout = 1'b0;
		end
		else begin
			dffout = d;
		end
	end
	*/
	
	

	/////////////////////////////////////////
	
endmodule