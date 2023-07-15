//Single PE Module

module pe_single_module (
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
	input clk,
	input init,
	input rst,
	input preset,
	//Output
	output [7:0] out);

	wire [7:0] a_out, b_out;

	//PE Input Instantiation
	pe_input_module pe_input//Matrix a
				(.a11(a11), .a12(a12), .a13(a13), .a14(a14),
	          		 .a21(a21), .a22(a22), .a23(a23), .a24(a24),
	          	         .a31(a31), .a32(a32), .a33(a33), .a34(a34),
	           	         .a41(a41), .a42(a42), .a43(a43), .a44(a44),
				//Matrix b
				 .b11(b11), .b12(b12), .b13(b13),
	  	                 .b21(b21), .b22(b22), .b23(b23),
		  		 .b31(b31), .b32(b32), .b33(b33),
				//Select
		        	 .s0(s0), .s1(s1),
				//output
				.a_out(a_out), .b_out(b_out));

	single_pe_computation_module pe_computation(.a(a_out), .b(b_out), .clk(clk), .rst(rst), .preset(preset), .init(init), .out(out), .out_a(),. out_b());

endmodule