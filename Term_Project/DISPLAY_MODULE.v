//display module

module display_module (

	input [7:0] in_sa_11, in_sa_12, in_sa_21, in_sa_22,
	input [7:0] in_custom_11, in_custom_12, in_custom_21, in_custom_22,
	input clk, rst, display_en, display_rst,

	output [3:0] anode_activate,
	output [6:0] out
	);
	
	wire [7:0] out_sa;
	wire [7:0] out_custom;
	wire [2:0] out_select_bit;
	wire [7:0] out_MUX;

	//instantiating display conroller
	display_controller_module display_controller (.clk(clk), .display_en(DISPLAY_EN),.out(out_select_bit),.rst(rst),.state());

	//selecting outputs from SA/custom
	eight_bit_four_to_one_mux_module mux_sa(.a(in_sa_11), .b(in_sa_12), .c(in_sa_21), .d(in_sa_22), .s0(out_select_bit[0]), .s1(out_select_bit[1]), .out(out_sa));
	eight_bit_four_to_one_mux_module mux_custom(.a(in_custom_11), .b(in_custom_12), .c(in_custom_21), .d(in_custom_22), .s0(out_select_bit[0]), .s1(out_select_bit[1]), .out(out_custom));

	//selecting displayed number
	eight_bit_two_to_one_mux_module mux_displayed_number (.a(out_sa), .b(out_custom), .s(out_select_bit[2]), .out(out_MUX));
	
	//displaying
	Seven_segment_LED_Display_Controller display_number (.displayed_number(out_MUX), .clock_100Mhz(clk), .reset(display_rst), .Anode_Activate(anode_activate), .LED_out(out));

endmodule