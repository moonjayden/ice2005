`timescale 1ns/1ns

module tb_pe_computation;

	//clock
	reg CLK;
///////////////////////////////////////////////////
	//////////////////////////////////
	//input
	reg [7:0] A, B;
	reg INIT;
	reg RST;
	reg PRESET;
	//output
	wire [7:0]OUT, OUT_A, OUT_B;
	//////////////////////////////////

///////////////////////////////////////////////////
	//Module instantiation
	//PE Computation Module
	single_pe_computation_module computation(.a(A), .b(B), .clk(CLK), .rst(RST), .preset(PRESET), .init(INIT), .out(OUT), .out_a(OUT_A), .out_b(OUT_B));	

///////////////////////////////////////////////////
	initial
	begin
		INIT = 1'b0;
    		RST = 1'b1;
    		PRESET = 1'b0;
    		CLK = 1'b0;
    		A = 8'b00000000;
    		B = 8'b00000000;
	end
///////////////////////////////////////////////////
	//Clock Cycle Time <- 20ns = 50MHz
	initial begin
    		forever begin
        		#10 CLK = ~CLK;
    		end
	end
///////////////////////////////////////////////////

	initial
	begin
		#20 RST = 1'b0;
		#20 A = 8'd1; B = 8'd2;
		#20 A = 8'd2; B = 8'd3;
		#20 A = 8'd3; B = 8'd1;
		#20 A = 8'd2; B = 8'd3;
		#20 A = 8'd3; B = 8'd1;
		#20 A = 8'd4; B = 8'd3;
		#20 A = 8'd3; B = 8'd1;
		#20 A = 8'd4; B = 8'd3;
		#20 A = 8'd4; B = 8'd2;

		#20 INIT = 1'b1;
		#20 A = 8'd1; B = 8'd2;

	end

///////////////////////////////////////////////////

	
endmodule