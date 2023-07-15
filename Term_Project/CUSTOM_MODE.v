//Custom Module

module custom_module (
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
	input clk,
	input init,
	input rst,
	input preset,
	input [3:0] s0_11, s0_12, s0_13,
   		    s0_21, s0_22, s0_23,
    		    s0_31, s0_32, s0_33,
	//Output
	output [7:0] out);

	wire [7:0] a11_out, a12_out, a13_out,
	           a21_out, a22_out, a23_out,
                   a31_out, a32_out, a33_out;
	wire [7:0] b11_out, b12_out, b13_out,
   		   b21_out, b22_out, b23_out,
    		   b31_out, b32_out, b33_out;
	wire [7:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9;
	wire [7:0] sum_1, sum_2, sum_3, sum_4, sum_5, sum_6, sum_7;

	custom_input_module custom_input_a11//a11
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_11),
	//output
	.a_out(a11_out));
	custom_input_module custom_input_a12//a12
	(//Matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_12),
	//output
	.a_out(a12_out));
	custom_input_module custom_input_a13//a13
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_13),
	//output
	.a_out(a13_out));
	custom_input_module custom_input_a21//a21
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_21),
	//output
	.a_out(a21_out));
	custom_input_module custom_input_a22//a22
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_22),
	//output
	.a_out(a22_out));
	custom_input_module custom_input_a23//a23
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_23),
	//output
	.a_out(a23_out));
	custom_input_module custom_input_a31//a31
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_31),
	//output
	.a_out(a31_out));
	custom_input_module custom_input_a32//a32
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_32), 
	//output
	.a_out(a32_out));
	custom_input_module custom_input_a33//a33
	(//matrix a
	.a11(a11), .a12(a12), .a13(a13), .a14(a14), .a21(a21), .a22(a22), .a23(a23), .a24(a24), .a31(a31), .a32(a32), .a33(a33), .a34(a34),.a41(a41), .a42(a42), .a43(a43), .a44(a44),
	//Select
	.s0(s0_33),
	//output
	.a_out(a33_out));



	custom_mul_computation_module computation_1(.a(a11_out), .b(b11), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_1));
	custom_mul_computation_module computation_2(.a(a12_out), .b(b21), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_2));
	custom_mul_computation_module computation_3(.a(a13_out), .b(b31), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_3));
	custom_mul_computation_module computation_4(.a(a21_out), .b(b12), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_4));
	custom_mul_computation_module computation_5(.a(a22_out), .b(b22), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_5));
	custom_mul_computation_module computation_6(.a(a23_out), .b(b32), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_6));
	custom_mul_computation_module computation_7(.a(a31_out), .b(b13), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_7));
	custom_mul_computation_module computation_8(.a(a32_out), .b(b23), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_8));
	custom_mul_computation_module computation_9(.a(a33_out), .b(b33), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out_9));

	eight_bit_full_adder_module adder_1(.a(out_1), .b(out_2), .cin(1'b0),   .sum(sum_1), .cout());
	eight_bit_full_adder_module adder_2(.a(out_3), .b(out_4), .cin(1'b0),   .sum(sum_2), .cout());
	eight_bit_full_adder_module adder_3(.a(out_5), .b(out_6), .cin(1'b0),   .sum(sum_3), .cout());
	eight_bit_full_adder_module adder_4(.a(out_7), .b(out_8), .cin(1'b0),   .sum(sum_4), .cout());

	eight_bit_full_adder_module adder_5(.a(sum_1), .b(sum_2), .cin(1'b0),   .sum(sum_5), .cout());
	eight_bit_full_adder_module adder_6(.a(sum_3), .b(sum_4), .cin(1'b0),   .sum(sum_6), .cout());

	eight_bit_full_adder_module adder_7(.a(sum_5), .b(sum_6), .cin(1'b0),   .sum(sum_7), .cout());

	eight_bit_full_adder_module adder_final(.a(sum_7), .b(out_9), .cin(1'b0),   .sum(out), .cout());

endmodule