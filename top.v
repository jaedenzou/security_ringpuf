`timescale 1ns / 1ps

module ro(clock, puf_out);
	 //For simulation, you can add select1, select2, enable, and reset to the inputs.
	 //Do not forget to make them wires before implementation
	 
	 input clock;
	 output reg puf_out;

	 //The input signals from VIO
	 wire [3:0] select1, select2;
	 wire enable, reset;
	 
	 //Mux signals
    wire out1, out2, out3, out4, out5, out6, out7, out8, 
	 out9, out10, out11, out12, out13, out14, out15, out16, mux1_out, mux2_out;
	 
	 //Counter outputs
	 wire [11:0] counter1_out, counter2_out, clockcounter_out;
	 
	 
//Instantiate your ring oscillators. Do not forget to add (* KEEP = "TRUE" *) before each instantiation
//Example: (* KEEP = "TRUE" *)   ro_hardmacro ro1(enable, reset, out1);



//Instantiate your muxes and counters


//Write the code for generating your PUF output



	//////////////////////////////////////////////////////////////
	//ICON, VIO, and ILA instantiations. No need to edit this part
	 wire [9:0] vio_op;
	 assign select2=vio_op[9:6];
	 assign select1=vio_op[5:2];
	 assign reset=vio_op[1];	 
	 assign enable=vio_op[0];
	 
	 wire [24:0] vio_ip;
	 assign vio_ip[24:13]=counter2_out;
	 assign vio_ip[12:1]=counter1_out;
	 assign vio_ip[0]=puf_out;
	 
	 wire [37:0] ila_data;
	 assign ila_data[37:26]=clockcounter_out;
	 assign ila_data[25]=mux1_out;
	 assign ila_data[24:13]=counter2_out;
	 assign ila_data[12:1]=counter1_out;
	 assign ila_data[0]=puf_out;
	 
	wire [35:0] cntbus, ilacntbus;
	ICON ICON0 (
    .CONTROL0(cntbus),
	 .CONTROL1(ilacntbus));	
	VIO VIO0 (
		 .CONTROL(cntbus),
		 .ASYNC_OUT(vio_op),
		 .ASYNC_IN(vio_ip));	 
	ILA ILA0 (
    .CONTROL(ilacntbus),
    .CLK(clock),
    .DATA(ila_data),
	 .TRIG0(counter1_out),
    .TRIG1(counter2_out));
	 ////////////////////////////////////////////////////////////
endmodule