//4-bit full adder module.

module four_bit_full_adder_module (a, b, cin, sum, cout);
	input [3:0] a, b;
	input cin;

	output [3:0] sum;
	output cout;

	wire c_out_1, c_out_2, c_out_3;

	//1-Bit Full Adder Module Instantiation
	one_bit_full_adder_gatelevel_module fa_1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c_out_1));
	one_bit_full_adder_gatelevel_module fa_2(.a(a[1]), .b(b[1]), .cin(c_out_1), .sum(sum[1]), .cout(c_out_2));
	one_bit_full_adder_gatelevel_module fa_3(.a(a[2]), .b(b[2]), .cin(c_out_2), .sum(sum[2]), .cout(c_out_3));
	one_bit_full_adder_gatelevel_module fa_8(.a(a[3]), .b(b[3]), .cin(c_out_3), .sum(sum[3]), .cout(cout));
endmodule