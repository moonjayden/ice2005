//This is for 8-Bit 4:1 mux module.

module eight_bit_four_to_one_mux_module (a, b, c, d, s0, s1, out);
	input [7:0] a, b, c, d;
	input s0, s1;	
	output [7:0] out;

	one_bit_four_to_one_mux_gatelevel_module mux_0(.a(a[0]), .b(b[0]), .c(c[0]), .d(d[0]), .s0(s0), .s1(s1), .out(out[0]));
	one_bit_four_to_one_mux_gatelevel_module mux_1(.a(a[1]), .b(b[1]), .c(c[1]), .d(d[1]), .s0(s0), .s1(s1), .out(out[1]));
	one_bit_four_to_one_mux_gatelevel_module mux_2(.a(a[2]), .b(b[2]), .c(c[2]), .d(d[2]), .s0(s0), .s1(s1), .out(out[2]));
	one_bit_four_to_one_mux_gatelevel_module mux_3(.a(a[3]), .b(b[3]), .c(c[3]), .d(d[3]), .s0(s0), .s1(s1), .out(out[3]));
	one_bit_four_to_one_mux_gatelevel_module mux_4(.a(a[4]), .b(b[4]), .c(c[4]), .d(d[4]), .s0(s0), .s1(s1), .out(out[4]));
	one_bit_four_to_one_mux_gatelevel_module mux_5(.a(a[5]), .b(b[5]), .c(c[5]), .d(d[5]), .s0(s0), .s1(s1), .out(out[5]));
	one_bit_four_to_one_mux_gatelevel_module mux_6(.a(a[6]), .b(b[6]), .c(c[6]), .d(d[6]), .s0(s0), .s1(s1), .out(out[6]));
	one_bit_four_to_one_mux_gatelevel_module mux_7(.a(a[7]), .b(b[7]), .c(c[7]), .d(d[7]), .s0(s0), .s1(s1), .out(out[7]));


endmodule