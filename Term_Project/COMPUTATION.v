// Computation Module
module computation_module(
	
	input [7:0] a11, a12, a13, a14,
		  a21, a22, a23, a24,
		  a31, a32, a33, a34,
		  a41, a42, a43, a44,
    	input [7:0] b11, b12, b13,
		  b21, b22, b23,
		  b31, b32, b33,
	input CLK,
	input PE_RST, SYS_RST, CUS_RST, PRESET,
	input PE_INIT, CUS_INIT,
	input SYS_CACHE_WE_1,SYS_CACHE_WE_2,
	input [3:0] PE_SEL_A, PE_SEL_B,
		  SYS_SEL_A, SYS_SEL_B,
		  CUS_SEL_11, CUS_SEL_12, CUS_SEL_13,
		  CUS_SEL_21, CUS_SEL_22, CUS_SEL_23,
		  CUS_SEL_31, CUS_SEL_32, CUS_SEL_33,

	input [1:0] MODE,

	output [7:0] OUT);

	wire [7:0] SINGLE_OUT, PARALLEL_OUT, CUSTOM_OUT;



	//Single PE Computation
	pe_single_module pe_single(
    		.a11(a11), .a12(a12), .a13(a13), .a14(a14),
    		.a21(a21), .a22(a22), .a23(a23), .a24(a24),
    		.a31(a31), .a32(a32), .a33(a33), .a34(a34),
    		.a41(a41), .a42(a42), .a43(a43), .a44(a44),
    		.b11(b11), .b12(b12), .b13(b13),
    		.b21(b21), .b22(b22), .b23(b23),
    		.b31(b31), .b32(b32), .b33(b33),
		.s0(PE_SEL_A), .s1(PE_SEL_B),
    		.clk(CLK), .init(PE_INIT),
		.rst(PE_RST), .preset(PRESET),
    		.out(SINGLE_OUT));



	//Systolic Array Computation
	Parallel_module parallel(
       		.a11(a11), .a12(a12), .a13(a13), .a14(a14),
       		.a21(a21), .a22(a22), .a23(a23), .a24(a24),
       		.a31(a31), .a32(a32), .a33(a33), .a34(a34),
       		.a41(a41), .a42(a42), .a43(a43), .a44(a44),
       		.b11(b11), .b12(b12), .b13(b13),
       		.b21(b21), .b22(b22), .b23(b23),
       		.b31(b31), .b32(b32), .b33(b33),
   		.s0(SYS_SEL_A), .s1(SYS_SEL_B),
       		.clk(CLK), .we_1(SYS_CACHE_WE_1), .we_2(SYS_CACHE_WE_2),
   		.rst(SYS_RST), .preset(PRESET),
       		.out(PARALLEL_OUT));



	//Custom Mode Computation
	custom_module custom(
    		.a11(a11), .a12(a12), .a13(a13), .a14(a14),
    		.a21(a21), .a22(a22), .a23(a23), .a24(a24),
    		.a31(a31), .a32(a32), .a33(a33), .a34(a34),
    		.a41(a41), .a42(a42), .a43(a43), .a44(a44),
    		.b11(b11), .b12(b12), .b13(b13),
    		.b21(b21), .b22(b22), .b23(b23),
    		.b31(b31), .b32(b32), .b33(b33),
    		.clk(CLK), .init(CUS_INIT),
		.rst(CUS_RST), .preset(PRESET),
		.s0_11(CUS_SEL_11), .s0_12(CUS_SEL_12), .s0_13(CUS_SEL_13),
    		.s0_21(CUS_SEL_21), .s0_22(CUS_SEL_22), .s0_23(CUS_SEL_23),
    		.s0_31(CUS_SEL_31), .s0_32(CUS_SEL_32), .s0_33(CUS_SEL_33),
    		.out(CUSTOM_OUT));

	eight_bit_four_to_one_mux_module four_two_one_mux(.a(8'b00000000), .b(SINGLE_OUT), .c(PARALLEL_OUT), .d(CUSTOM_OUT), .s0(MODE[0]), .s1(MODE[1]), .out(OUT));


endmodule