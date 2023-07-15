`timescale 1ns/1ns

module tb_controller;
	//clock
	reg CLK;
///////////////////////////////////////////////////
	//////////////////////////////////
	//input
	reg [7:0] a11, a12, a13, a14,
		  a21, a22, a23, a24,
		  a31, a32, a33, a34,
		  a41, a42, a43, a44;

    	reg [7:0] b11, b12, b13,
		  b21, b22, b23,
		  b31, b32, b33;

	
	
	reg RST;
	reg PRESET;
	
	wire SYS_CACHE_WE_1, SYS_CACHE_WE_2;
	wire PE_INIT, PE_RST, CUS_INIT;
	wire [3:0] PE_SEL_A, PE_SEL_B,
		  SYS_SEL_A, SYS_SEL_B,
		  CUS_SEL_11, CUS_SEL_12, CUS_SEL_13,
		  CUS_SEL_21, CUS_SEL_22, CUS_SEL_23,
		  CUS_SEL_31, CUS_SEL_32, CUS_SEL_33;
	//output
	wire [7:0] stored_a11, stored_a12, stored_a13, stored_a14,
	             stored_a21, stored_a22, stored_a23, stored_a24,
                     stored_a31, stored_a32, stored_a33, stored_a34,
                     stored_a41, stored_a42, stored_a43, stored_a44;

    	wire [7:0] stored_b11, stored_b12, stored_b13,
   		     stored_b21, stored_b22, stored_b23,
    		     stored_b31, stored_b32, stored_b33;
	wire DISPLAY_EN, DIS_RST;
	wire [3:0] COUNT;
	wire [4:0] STATE, NEXT_STATE;
	wire [1:0] MODE;
	wire WE_PE_1, WE_PE_2, WE_PE_3, WE_PE_4,
		WE_SYS_1, WE_SYS_2, WE_SYS_3, WE_SYS_4,
		WE_CUS_1, WE_CUS_2, WE_CUS_3, WE_CUS_4;
	wire [7:0] OUT;
	wire [7:0] PE_C11,PE_C12,PE_C21,PE_C22,
		SYS_C11,SYS_C12,SYS_C21,SYS_C22,
		CUS_C11,CUS_C12,CUS_C21,CUS_C22;
	wire [3:0] ANODE_ACTIVATE;
	wire [6:0] LED_OUT;
///////////////////////////////////////////////////
	//Module instantiation
///////////////////////////////////////////////////
	//Controller
	controller_module controller(.clk(CLK), .rst(RST), .out_count(COUNT),.out_state(STATE), .out_next_state(NEXT_STATE),
	.out_SYS_cache_we_1(SYS_CACHE_WE_1), .out_SYS_cache_we_2(SYS_CACHE_WE_2),
	.DISPLAY_EN(DISPLAY_EN), .DIS_RST(DIS_RST),
	.PE_INIT(PE_INIT), .CUS_INIT(CUS_INIT), .PE_RST(PE_RST), .SYS_RST(SYS_RST), .CUS_RST(CUS_RST),
	.out_PE_sel_a(PE_SEL_A), .out_PE_sel_b(PE_SEL_B),
	.out_SYS_sel_a(SYS_SEL_A), .out_SYS_sel_b(SYS_SEL_B),
	.out_CUS_sel_11(CUS_SEL_11), .out_CUS_sel_12(CUS_SEL_12), .out_CUS_sel_13(CUS_SEL_13),
	.out_CUS_sel_21(CUS_SEL_21), .out_CUS_sel_22(CUS_SEL_22), .out_CUS_sel_23(CUS_SEL_23),
	.out_CUS_sel_31(CUS_SEL_31), .out_CUS_sel_32(CUS_SEL_32), .out_CUS_sel_33(CUS_SEL_33),
	.out_mode(MODE),
	.out_we(WE),
	.out_we_pe_1(WE_PE_1), .out_we_pe_2(WE_PE_2), .out_we_pe_3(WE_PE_3), .out_we_pe_4(WE_PE_4),
	.out_we_sys_1(WE_SYS_1), .out_we_sys_2(WE_SYS_2), .out_we_sys_3(WE_SYS_3), .out_we_sys_4(WE_SYS_4),
	.out_we_cus_1(WE_CUS_1), .out_we_cus_2(WE_CUS_2), .out_we_cus_3(WE_CUS_3), .out_we_cus_4(WE_CUS_4));
///////////////////////////////////////////////////
	//Memory
	memory_module memory( .a11(a11), .a12(a12), .a13(a13), .a14(a14),
	            .a21(a21), .a22(a22), .a23(a23), .a24(a24),
                    .a31(a31), .a32(a32), .a33(a33), .a34(a34),
                    .a41(a41), .a42(a42), .a43(a43), .a44(a44),
    		    .b11(b11), .b12(b12), .b13(b13),
       		    .b21(b12), .b22(b22), .b23(b23),
    		    .b31(b31), .b32(b32), .b33(b33),
		    .out(OUT),
		    .clk(CLK),
		    .we(WE),
		    .we_pe_1(WE_PE_1), .we_pe_2(WE_PE_2), .we_pe_3(WE_PE_3), .we_pe_4(WE_PE_4),
	            .we_sys_1(WE_SYS_1), .we_sys_2(WE_SYS_2), .we_sys_3(WE_SYS_3), .we_sys_4(WE_SYS_4),
	            .we_cus_1(WE_CUS_1), .we_cus_2(WE_CUS_2), .we_cus_3(WE_CUS_3), .we_cus_4(WE_CUS_4),
		    .stored_a11(stored_a11), .stored_a12(stored_a12), .stored_a13(stored_a13), .stored_a14(stored_a14),
	            .stored_a21(stored_a21), .stored_a22(stored_a22), .stored_a23(stored_a23), .stored_a24(stored_a24),
                    .stored_a31(stored_a31), .stored_a32(stored_a32), .stored_a33(stored_a33), .stored_a34(stored_a34),
                    .stored_a41(stored_a41), .stored_a42(stored_a42), .stored_a43(stored_a43), .stored_a44(stored_a44),
    		    .stored_b11(stored_b11), .stored_b12(stored_b12), .stored_b13(stored_b13),
   		    .stored_b21(stored_b21), .stored_b22(stored_b22), .stored_b23(stored_b23),
    		    .stored_b31(stored_b31), .stored_b32(stored_b32), .stored_b33(stored_b33),
		    .pe_c11(PE_C11), .pe_c12(PE_C12), .pe_c21(PE_C21), .pe_c22(PE_C22),
		    .sys_c11(SYS_C11), .sys_c12(SYS_C12), .sys_c21(SYS_C21), .sys_c22(SYS_C22),
		    .cus_c11(CUS_C11), .cus_c12(CUS_C12), .cus_c21(CUS_C21), .cus_c22(CUS_C22));
///////////////////////////////////////////////////
	//Computation
	computation_module computation(.a11(stored_a11), .a12(stored_a12), .a13(stored_a13), .a14(stored_a14),
	            .a21(stored_a21), .a22(stored_a22), .a23(stored_a23), .a24(stored_a24),
                    .a31(stored_a31), .a32(stored_a32), .a33(stored_a33), .a34(stored_a34),
                    .a41(stored_a41), .a42(stored_a42), .a43(stored_a43), .a44(stored_a44),
    		    .b11(stored_b11), .b12(stored_b12), .b13(stored_b13),
       		    .b21(stored_b12), .b22(stored_b22), .b23(stored_b23),
    		    .b31(stored_b31), .b32(stored_b32), .b33(stored_b33),
		    .CLK(CLK), .PE_RST(PE_RST), .SYS_RST(SYS_RST), .CUS_RST(CUS_RST), .PRESET(PRESET),
		    .PE_INIT(PE_INIT), .CUS_INIT(CUS_INIT),
		    .SYS_CACHE_WE_1(SYS_CACHE_WE_1), .SYS_CACHE_WE_2(SYS_CACHE_WE_2),
		    .PE_SEL_A(PE_SEL_A), .PE_SEL_B(PE_SEL_B),
		    .SYS_SEL_A(SYS_SEL_A), .SYS_SEL_B(SYS_SEL_B),
		    .CUS_SEL_11(CUS_SEL_11), .CUS_SEL_12(CUS_SEL_12), .CUS_SEL_13(CUS_SEL_13),
		    .CUS_SEL_21(CUS_SEL_21), .CUS_SEL_22(CUS_SEL_22), .CUS_SEL_23(CUS_SEL_23),
		    .CUS_SEL_31(CUS_SEL_31), .CUS_SEL_32(CUS_SEL_32), .CUS_SEL_33(CUS_SEL_33),
		    .MODE(MODE),
		    .OUT(OUT));
///////////////////////////////////////////////////
	//display
	display_module display(.in_sa_11(SYS_C11), .in_sa_12(SYS_C12), .in_sa_21(SYS_C21), .in_sa_22(SYS_C22),
		 	       .in_custom_11(CUS_C11), .in_custom_12(CUS_C12), .in_custom_21(CUS_C21), .in_custom_22(CUS_C22),
				.clk(CLK), .rst(RST), .display_en(DISPLAY_EN), .display_rst(DIS_RST), .anode_activate(ANODE_ACTIVATE), .out(LED_OUT));


///////////////////////////////////////////////////
		initial
	begin
		
    		RST = 1'b1;
    		PRESET = 1'b0;
    		CLK = 1'b0;
    		
		
         	a11 = 8'd1; a12 = 8'd2; a13 = 8'd3; a14 = 8'd4;
      		a21 = 8'd2; a22 = 8'd3; a23 = 8'd4; a24 = 8'd5;
      		a31 = 8'd3; a32 = 8'd4; a33 = 8'd5; a34 = 8'd5;
      		a41 = 8'd3; a42 = 8'd4; a43 = 8'd5; a44 = 8'd5;

      		b11 = 8'd9; b12 = 8'd8; b13 = 8'd7;
      		b21 = 8'd8; b22 = 8'd7; b23 = 8'd6;
      		b31 = 8'd7; b32 = 8'd6; b33 = 8'd5;
    		
		
		
	end

///////////////////////////////////////////////////  
	//Clock Cycle Time <- 20ns = 50MHz
	initial begin
    		forever begin
        		#5 CLK = ~CLK;
    		end
	end 		
///////////////////////////////////////////////////
	initial
	begin
		
    		#20 RST = 1'b0;
	end
///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////


endmodule