//PE Input Module with MUX

module pe_input_module (
	// Input Matrix a
	input [7:0] a11, a12, a13, a14,
	            a21, a22, a23, a24,
                    a31, a32, a33, a34,
                    a41, a42, a43, a44,
	//Input Matrix b(Filter)
    	input [7:0] b11, b12, b13,
   		    b21, b22, b23,
    		    b31, b32, b33,
	//Input Select Bit for MUX
	input [3:0] s0, s1,

	//Output
	output [7:0] a_out, b_out);


	wire [7:0] row_1, row_2, row_3, row_4;
	wire [7:0] column_1, column_2, column_3;

	//input a
	eight_bit_four_to_one_mux_module mux_row_1(.a(a11), .b(a12), .c(a13), .d(a14), .s0(s0[2]), .s1(s0[3]), .out(row_1));
	eight_bit_four_to_one_mux_module mux_row_2(.a(a21), .b(a22), .c(a23), .d(a24), .s0(s0[2]), .s1(s0[3]), .out(row_2));
	eight_bit_four_to_one_mux_module mux_row_3(.a(a31), .b(a32), .c(a33), .d(a34), .s0(s0[2]), .s1(s0[3]), .out(row_3));
	eight_bit_four_to_one_mux_module mux_row_4(.a(a41), .b(a42), .c(a43), .d(a44), .s0(s0[2]), .s1(s0[3]), .out(row_4));

	eight_bit_four_to_one_mux_module mux_a(.a(row_1), .b(row_2), .c(row_3), .d(row_4), .s0(s0[0]), .s1(s0[1]), .out(a_out));

	//input b
	eight_bit_four_to_one_mux_module mux_column_1(.a(b11), .b(b12), .c(b13), .d(8'd0), .s0(s1[2]), .s1(s1[3]), .out(column_1));
	eight_bit_four_to_one_mux_module mux_column_2(.a(b21), .b(b22), .c(b23), .d(8'd0), .s0(s1[2]), .s1(s1[3]), .out(column_2));
	eight_bit_four_to_one_mux_module mux_column_3(.a(b31), .b(b32), .c(b33), .d(8'd0), .s0(s1[2]), .s1(s1[3]), .out(column_3));

	eight_bit_four_to_one_mux_module mux_b(.a(column_1), .b(column_2), .c(column_3), .d(8'd0), .s0(s1[0]), .s1(s1[1]), .out(b_out));

endmodule