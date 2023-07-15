//8_bit_d_flip_flop

module eight_bit_d_filp_flop_module(d, clk, rst, preset, q, q_bar);
	input [7:0] d;
	input clk, rst, preset;

	output [7:0] q, q_bar;

	d_flip_flop_behavioral_module dff_out_0(.d(d[0]), .clk(clk), .rst(rst), .preset(preset), .q(q[0]), .q_bar());
	d_flip_flop_behavioral_module dff_out_1(.d(d[1]), .clk(clk), .rst(rst), .preset(preset), .q(q[1]), .q_bar());
	d_flip_flop_behavioral_module dff_out_2(.d(d[2]), .clk(clk), .rst(rst), .preset(preset), .q(q[2]), .q_bar());
	d_flip_flop_behavioral_module dff_out_3(.d(d[3]), .clk(clk), .rst(rst), .preset(preset), .q(q[3]), .q_bar());
	d_flip_flop_behavioral_module dff_out_4(.d(d[4]), .clk(clk), .rst(rst), .preset(preset), .q(q[4]), .q_bar());
	d_flip_flop_behavioral_module dff_out_5(.d(d[5]), .clk(clk), .rst(rst), .preset(preset), .q(q[5]), .q_bar());
	d_flip_flop_behavioral_module dff_out_6(.d(d[6]), .clk(clk), .rst(rst), .preset(preset), .q(q[6]), .q_bar());
	d_flip_flop_behavioral_module dff_out_7(.d(d[7]), .clk(clk), .rst(rst), .preset(preset), .q(q[7]), .q_bar());

endmodule
