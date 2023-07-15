`timescale 1ns/1ns

module tb_top_module;
	//input
	reg CLK;
	reg RST;
	reg PRESET;
	/*reg [7:0] a11, a12, a13, a14,
		  a21, a22, a23, a24,
		  a31, a32, a33, a34,
		  a41, a42, a43, a44;
    	reg [7:0] b11, b12, b13,
		  b21, b22, b23,
		  b31, b32, b33;*/
	//output
	wire [3:0] ANODE_ACTIVATE;
	wire [6:0] LED_OUT;
//////////////////////////////////////////////////
	//Moduel Instantiation
	/*top_module top_module(.CLK(CLK), .RST(RST), .PRESET(PRESET),
		    .a11(8'd1), .a12(8'd2), .a13(8'd3), .a14(8'd4),
	            .a21(8'd2), .a22(8'd3), .a23(8'd4), .a24(8'd5),
                    .a31(8'd3), .a32(8'd4), .a33(8'd5), .a34(8'd5),
                    .a41(8'd3), .a42(8'd4), .a43(8'd5), .a44(8'd5),
    		    .b11(8'd9), .b12(8'd8), .b13(8'd7),
       		    .b21(8'd8), .b22(8'd7), .b23(8'd6),
    		    .b31(8'd7), .b32(8'd6), .b33(8'd5),
	            .ANODE_ACTIVATE(ANODE_ACTIVATE), .LED_OUT(LED_OUT));*/
	top_module top_module(.CLK(CLK), .RST(RST), .PRESET(PRESET),
		    
	            .ANODE_ACTIVATE(ANODE_ACTIVATE), .LED_OUT(LED_OUT));
///////////////////////////////////////////////////
	initial
		begin
			RST = 1'b1;
    			PRESET = 1'b0;
    			CLK = 1'b0;	
			/*a11 = 8'd1; a12 = 8'd2; a13 = 8'd3; a14 = 8'd4;
		a21 = 8'd2; a22 = 8'd3; a23 = 8'd4; a24 = 8'd5;
		a31 = 8'd3; a32 = 8'd4; a33 = 8'd5; a34 = 8'd5;
		a41 = 8'd3; a42 = 8'd4; a43 = 8'd5; a44 = 8'd5;

		b11 = 8'd9; b12 = 8'd8; b13 = 8'd7;
		b21 = 8'd8; b22 = 8'd7; b23 = 8'd6;
		b31 = 8'd7; b32 = 8'd6; b33 = 8'd5;*/
		end
///////////////////////////////////////////////////
///////////////////////////////////////////////////  
	//Clock Cycle Time <- 10ns = 100MHz
	initial begin
    		forever begin
        		#5 CLK = ~CLK;
    		end
	end 		
///////////////////////////////////////////////////
	initial
		begin 
		#10 RST = 1'b0;
		end

endmodule
