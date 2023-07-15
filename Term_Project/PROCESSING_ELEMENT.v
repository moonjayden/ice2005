//processing element

module processing_element_module (a, b, c, clk, rst, preset, out, out_a, out_b);
	input [7:0] a, b, c;
  	input clk;
   	input rst;
   	input preset;

   	output [7:0] out, out_a, out_b;

   	wire [7:0] mul_out, sum_out;

   	//8x8 Multiplier <- a[7:0] * b[7:0]
   	eight_bit_multiplier_module multiplier (.a(a), .b(b), .mul(mul_out));

   	//8+8 Adder <-Input Value +  a[7:0] * b[7:0]
   	eight_bit_full_adder_module adder(.a(mul_out), .b(c), .cin(1'b0), .sum(sum_out), .cout());

  	 //Clock trigger
   	eight_bit_d_filp_flop_module dff_1(.d(sum_out), .clk(clk), .rst(rst), .preset(preset), .q(out), .q_bar());
   	eight_bit_d_filp_flop_module dff_2(.d(a), .clk(clk), .rst(rst), .preset(preset), .q(out_a), .q_bar());
   	eight_bit_d_filp_flop_module dff_3(.d(b), .clk(clk), .rst(rst), .preset(preset), .q(out_b), .q_bar());
endmodule