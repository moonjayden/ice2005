//8-bit full adder module.

module eight_bit_full_adder_module (a, b, cin, sum, cout);
	input [7:0] a, b;
	input cin;

	output [7:0] sum;
	output cout;

	wire c_out_1, c_out_2, c_out_3, c_out_4, c_out_5, c_out_6, c_out_7;

	//1-Bit Full Adder Module Instantiation
	one_bit_full_adder_gatelevel_module fa_1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c_out_1));
	one_bit_full_adder_gatelevel_module fa_2(.a(a[1]), .b(b[1]), .cin(c_out_1), .sum(sum[1]), .cout(c_out_2));
	one_bit_full_adder_gatelevel_module fa_3(.a(a[2]), .b(b[2]), .cin(c_out_2), .sum(sum[2]), .cout(c_out_3));
	one_bit_full_adder_gatelevel_module fa_4(.a(a[3]), .b(b[3]), .cin(c_out_3), .sum(sum[3]), .cout(c_out_4));
	one_bit_full_adder_gatelevel_module fa_5(.a(a[4]), .b(b[4]), .cin(c_out_4), .sum(sum[4]), .cout(c_out_5));
	one_bit_full_adder_gatelevel_module fa_6(.a(a[5]), .b(b[5]), .cin(c_out_5), .sum(sum[5]), .cout(c_out_6));
	one_bit_full_adder_gatelevel_module fa_7(.a(a[6]), .b(b[6]), .cin(c_out_6), .sum(sum[6]), .cout(c_out_7));
	one_bit_full_adder_gatelevel_module fa_8(.a(a[7]), .b(b[7]), .cin(c_out_7), .sum(sum[7]), .cout(cout));
endmodule