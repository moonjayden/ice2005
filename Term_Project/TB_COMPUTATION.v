`timescale 1ns/1ns

module tb_computation;
	integer count;
	//clock
	reg CLK;
///////////////////////////////////////////////////
	//////////////////////////////////
	//8X8 Multiplier
	//input 
	reg [7:0] A_MUL, B_MUL;
	//output
	wire [7:0] OUT_MUL;	
	//////////////////////////////////
	//8+8 Full Adder
	//input
	reg [7:0] A_ADD, B_ADD;
	//output
	wire [7:0] OUT_SUM;
	wire COUT;
	//////////////////////////////////

///////////////////////////////////////////////////
	//Module instantiation
	//8X8 Multiplier
	eight_bit_multiplier_module multiplier(.a(A_MUL), .b(B_MUL), .mul(OUT_MUL));

	//8+8 Full Adder
	eight_bit_full_adder_module adder(.a(A_ADD), .b(B_ADD), .cin(1'b0), .sum(OUT_SUM), .cout(COUT));

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
		A_MUL = 8'd15;
		B_MUL = 8'd16;
		#10
		A_MUL = 8'd16;
		B_MUL = 8'd16;
		#10
		A_MUL = 8'd17;
		B_MUL = 8'd16;
		#10
		B_MUL = 8'd5;
		B_ADD = 8'd5;
    		#10 
		for (count = 0;count < 16;count=count+1)
		begin
			A_MUL <= count;
			A_ADD <= count;
			#10; 
		end
		B_MUL = 8'd6;
		B_ADD = 8'd6;
    		#10 

		A_MUL = 8'd9;
		B_MUL = 8'd13;
		A_ADD = 8'd9;
		B_ADD = 8'd13;
		#10;
	end

endmodule