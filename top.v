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
	 wire counter_enable;
	 
//Instantiate your ring oscillators. Do not forget to add (* KEEP = "TRUE" *) before each instantiation
//Example: (* KEEP = "TRUE" *)   ro_hardmacro ro1(enable, reset, out1);
// (*KEEP_HIERARCHY="TRUE"*) 
(* KEEP = "TRUE" *) ringoscillator ro1(enable, reset, out1);
(* KEEP = "TRUE" *) ringoscillator ro2(enable, reset, out2);
(* KEEP = "TRUE" *) ringoscillator ro3(enable, reset, out3);
(* KEEP = "TRUE" *) ringoscillator ro4(enable, reset, out4);
(* KEEP = "TRUE" *) ringoscillator ro5(enable, reset, out5);
(* KEEP = "TRUE" *) ringoscillator ro6(enable, reset, out6);
(* KEEP = "TRUE" *) ringoscillator ro7(enable, reset, out7);
(* KEEP = "TRUE" *) ringoscillator ro8(enable, reset, out8);
(* KEEP = "TRUE" *) ringoscillator ro9(enable, reset, out9);
(* KEEP = "TRUE" *) ringoscillator ro10(enable, reset, out10);
(* KEEP = "TRUE" *) ringoscillator ro11(enable, reset, out11);
(* KEEP = "TRUE" *) ringoscillator ro12(enable, reset, out12);
(* KEEP = "TRUE" *) ringoscillator ro13(enable, reset, out13);
(* KEEP = "TRUE" *) ringoscillator ro14(enable, reset, out14);
(* KEEP = "TRUE" *) ringoscillator ro15(enable, reset, out15);
(* KEEP = "TRUE" *) ringoscillator ro16(enable, reset, out16);

//Instantiate your muxes and counters
Mux16 mux1(select1, {out16,out15,out14,out13,out12,out11,out10,out9,out8,out7,out6,out5,out4,out3,out2,out1}, mux1_out);
Mux16 mux2(select2, {out16,out15,out14,out13,out12,out11,out10,out9,out8,out7,out6,out5,out4,out3,out2,out1}, mux2_out);

//Write the code for generating your PUF output
clk_counter co_clk(clockcounter_out, enable , clock, reset);
assign counter_enable = ~(clockcounter_out == 12'b111111111111);
counter_12 co1(counter1_out, counter_enable , mux1_out, reset);
counter_12 co2(counter2_out, counter_enable , mux2_out, reset);

always @(*) begin
puf_out = (counter1_out>counter2_out) ? 1'b1:1'b0;
end


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