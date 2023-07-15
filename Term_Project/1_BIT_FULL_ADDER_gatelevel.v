//1-bit full adder module.

module one_bit_full_adder_gatelevel_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;

	
	wire xnor_out_1, xnor_out_2;
	wire not_out_1, not_out_2;

	wire and_out_1, and_out_2, and_out_3, and_out_4;
	wire or_out_1;

	//sum
	xnor_gatelevel_gate xnor_1(.a(b), .b(cin), .out(xnor_out_1));
	and_gate and_1(.a(xnor_out_1), .b(a), .out(and_out_1));

	not_gate not_1(.a(a), .out(not_out_1));
	xnor_gatelevel_gate xnor_2(.a(b), .b(cin), .out(xnor_out_2));
	not_gate not_2(.a(xnor_out_2), .out(not_out_2));
	and_gate and_2(.a(not_out_1), .b(not_out_2), .out(and_out_2));

	or_gate or_1(.a(and_out_1), .b(and_out_2), .out(sum));
	
	//cout
	and_gate and_3(.a(a), .b(b), .out(and_out_3));

	or_gate or_2(.a(a), .b(b), .out(or_out_1));
	and_gate and_4(.a(or_out_1), .b(cin), .out(and_out_4));

	or_gate or_3(.a(and_out_3), .b(and_out_4), .out(cout));

endmodule