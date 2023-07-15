//2:1 Mux

module two_to_one_mux_gatelevel_module(a, b, s, out);
	input a, b;
	input s;
	output out;

	wire not_1_output;
	wire and_1_output, and_2_output;

	not_gate not_1(.a(s), .out(not_1_output));
	and_gate and_1(.a(a), .b(not_1_output), .out(and_1_output));
	and_gate and_2(.a(b), .b(s), .out(and_2_output));
	or_gate or_1(.a(and_1_output), .b(and_2_output), .out(out));

endmodule
