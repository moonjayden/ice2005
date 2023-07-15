//Cache Memory Module for Systolic

module cache_memory_module
(
	input [7:0] b11, b12, b13,
             	    b21, b22, b23,
              	    b31, b32, b33,
	input clk,
	input we,
	output [7:0] fix_b11, fix_b12, fix_b13,
             	     fix_b21, fix_b22, fix_b23,
              	     fix_b31, fix_b32, fix_b33
);


	single_port_ram ram_1( .data(b11), .addr(6'd1), .we(we), .clk(clk), .q(fix_b11));
	single_port_ram ram_2( .data(b12), .addr(6'd2), .we(we), .clk(clk), .q(fix_b12));
	single_port_ram ram_3( .data(b13), .addr(6'd3), .we(we), .clk(clk), .q(fix_b13));
	single_port_ram ram_4( .data(b21), .addr(6'd4), .we(we), .clk(clk), .q(fix_b21));
	single_port_ram ram_5( .data(b22), .addr(6'd5), .we(we), .clk(clk), .q(fix_b22));
	single_port_ram ram_6( .data(b23), .addr(6'd6), .we(we), .clk(clk), .q(fix_b23));
	single_port_ram ram_7( .data(b31), .addr(6'd7), .we(we), .clk(clk), .q(fix_b31));
	single_port_ram ram_8( .data(b32), .addr(6'd8), .we(we), .clk(clk), .q(fix_b32));
	single_port_ram ram_9( .data(b33), .addr(6'd9), .we(we), .clk(clk), .q(fix_b33));


endmodule