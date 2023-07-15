//PE Computation module.

module single_pe_computation_module (a, b, clk, rst, preset, init, out, out_a, out_b);
	input [7:0] a, b;
	input clk;
	input rst;
	input preset;
	input init;

	output [7:0] out, out_a, out_b;

	wire [7:0] out_next;
	
	//processing element
	processing_element_module pe(.a(a), .b(b), .c(out_next), .clk(clk), .rst(rst), .preset(preset), .out(out), .out_a(out_a), .out_b(out_b));

	//Accumulator
	//For initialize init=1 -> initialize
	and_gate and_1(.a(out[0]), .b(!init), .out(out_next[0]));
	and_gate and_2(.a(out[1]), .b(!init), .out(out_next[1]));
	and_gate and_3(.a(out[2]), .b(!init), .out(out_next[2]));
	and_gate and_4(.a(out[3]), .b(!init), .out(out_next[3]));
	and_gate and_5(.a(out[4]), .b(!init), .out(out_next[4]));
	and_gate and_6(.a(out[5]), .b(!init), .out(out_next[5]));
	and_gate and_7(.a(out[6]), .b(!init), .out(out_next[6]));
	and_gate and_8(.a(out[7]), .b(!init), .out(out_next[7]));
	


endmodule