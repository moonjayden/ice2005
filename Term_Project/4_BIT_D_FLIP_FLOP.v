//4_bit_d_flip_flop

module four_bit_d_filp_flop_module(d, clk, rst, preset, q, q_bar);
	input [3:0] d;
	input clk, rst, preset;

	output [3:0] q, q_bar;

	d_flip_flop_behavioral_module dff_out_0(.d(d[0]), .clk(clk), .rst(rst), .preset(preset), .q(q[0]), .q_bar(q_bar[0]));
	d_flip_flop_behavioral_module dff_out_1(.d(d[1]), .clk(clk), .rst(rst), .preset(preset), .q(q[1]), .q_bar(q_bar[1]));
	d_flip_flop_behavioral_module dff_out_2(.d(d[2]), .clk(clk), .rst(rst), .preset(preset), .q(q[2]), .q_bar(q_bar[2]));
	d_flip_flop_behavioral_module dff_out_3(.d(d[3]), .clk(clk), .rst(rst), .preset(preset), .q(q[3]), .q_bar(q_bar[3]));

endmodule