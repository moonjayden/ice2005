//Custom Computation module.

module custom_mul_computation_module (a, b, clk, rst, preset, init, out);
	input [7:0] a, b;
	input clk;
	input rst;
	input preset;
	input init;

	output [7:0] out;

	wire [7:0] mul_out;
	wire [7:0] out_next;

	//8x8 Multiplier <- a[7:0] * b[7:0]
	eight_bit_multiplier_module multiplier (.a(a), .b(b), .mul(mul_out));

	//For initialize init=1 -> initialize
	and_gate and_1(.a(mul_out[0]), .b(!init), .out(out_next[0]));
	and_gate and_2(.a(mul_out[1]), .b(!init), .out(out_next[1]));
	and_gate and_3(.a(mul_out[2]), .b(!init), .out(out_next[2]));
	and_gate and_4(.a(mul_out[3]), .b(!init), .out(out_next[3]));
	and_gate and_5(.a(mul_out[4]), .b(!init), .out(out_next[4]));
	and_gate and_6(.a(mul_out[5]), .b(!init), .out(out_next[5]));
	and_gate and_7(.a(mul_out[6]), .b(!init), .out(out_next[6]));
	and_gate and_8(.a(mul_out[7]), .b(!init), .out(out_next[7]));


	//output value
	d_flip_flop_behavioral_module dff_out_1(.d(out_next[0]), .clk(clk), .rst(rst), .preset(preset), .q(out[0]), .q_bar());
	d_flip_flop_behavioral_module dff_out_2(.d(out_next[1]), .clk(clk), .rst(rst), .preset(preset), .q(out[1]), .q_bar());
	d_flip_flop_behavioral_module dff_out_3(.d(out_next[2]), .clk(clk), .rst(rst), .preset(preset), .q(out[2]), .q_bar());
	d_flip_flop_behavioral_module dff_out_4(.d(out_next[3]), .clk(clk), .rst(rst), .preset(preset), .q(out[3]), .q_bar());
	d_flip_flop_behavioral_module dff_out_5(.d(out_next[4]), .clk(clk), .rst(rst), .preset(preset), .q(out[4]), .q_bar());
	d_flip_flop_behavioral_module dff_out_6(.d(out_next[5]), .clk(clk), .rst(rst), .preset(preset), .q(out[5]), .q_bar());
	d_flip_flop_behavioral_module dff_out_7(.d(out_next[6]), .clk(clk), .rst(rst), .preset(preset), .q(out[6]), .q_bar());
	d_flip_flop_behavioral_module dff_out_8(.d(out_next[7]), .clk(clk), .rst(rst), .preset(preset), .q(out[7]), .q_bar());


	


endmodule
