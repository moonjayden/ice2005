//This is for 1-Bit 4:1 mux module.

module one_bit_four_to_one_mux_gatelevel_module (a, b, c, d, s0, s1, out);
	input a, b, c, d;
	input s0, s1;	
	output out;
	
	wire not_1_output, not_2_output;
	wire and_1_output, and_2_output, and_3_output, and_4_output,
	     and_5_output, and_6_output, and_7_output, and_8_output;
	wire or_1_output, or_2_output;
	
	//Fill this out
	not_gate not_1(.a(s0),.out(not_1_output));
	not_gate not_2(.a(s1),.out(not_2_output));

	and_gate and_1(.a(not_2_output), .b(not_1_output),.out(and_1_output));
	and_gate and_2(.a(not_2_output), .b(s0),.out(and_2_output));
	and_gate and_3(.a(s1), .b(not_1_output),.out(and_3_output));
	and_gate and_4(.a(s1), .b(s0),.out(and_4_output));

	and_gate and_5(.a(and_1_output), .b(a),.out(and_5_output));
	and_gate and_6(.a(and_2_output), .b(b),.out(and_6_output));
	and_gate and_7(.a(and_3_output), .b(c),.out(and_7_output));
	and_gate and_8(.a(and_4_output), .b(d),.out(and_8_output));

	or_gate or_1(.a(and_5_output),.b(and_6_output),.out(or_1_output));
	or_gate or_2(.a(and_7_output),.b(and_8_output),.out(or_2_output));

	or_gate or_3(.a(or_1_output),.b(or_2_output),.out(out));
endmodule
