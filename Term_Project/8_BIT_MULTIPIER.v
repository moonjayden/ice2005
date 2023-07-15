//8-Bit Multiplier module.

module eight_bit_multiplier_module (a, b, mul);
	input [7:0] a, b;
	output [7:0] mul;

	//wire variation of output(Mul Result)
	wire         out_01, out_02, out_03, out_04, out_05, out_06, out_07,
             out_10, out_11, out_12, out_13, out_14, out_15, out_16,
             out_20, out_21, out_22, out_23, out_24, out_25,
             out_30, out_31, out_32, out_33, out_34,
             out_40, out_41, out_42, out_43,
             out_50, out_51, out_52,
             out_60, out_61,
             out_70;
	
	//wire variation of sum(output of full adder)
	wire sum_11, sum_12, sum_13, sum_14, sum_15, sum_16,
             sum_21, sum_22, sum_23, sum_24, sum_25,
             sum_31, sum_32, sum_33, sum_34,
             sum_41, sum_42, sum_43,
             sum_51, sum_52,
             sum_61;


	//wire variation of cout
	wire c_out_10, c_out_11, c_out_12, c_out_13, c_out_14, c_out_15, c_out_16,
             c_out_20, c_out_21, c_out_22, c_out_23, c_out_24, c_out_25,
             c_out_30, c_out_31, c_out_32, c_out_33, c_out_34,
             c_out_40, c_out_41, c_out_42, c_out_43,
             c_out_50, c_out_51, c_out_52,
             c_out_60, c_out_61,
             c_out_70;

        //  a7 a6 a5 a4 a3 a2 a1 a0
	//x b7 b6 b5 b4 b3 b2 b1 b0

	// a * b0
	and_gate and_1(.a(a[0]), .b(b[0]), .out(mul[0]));
	and_gate and_2(.a(a[1]), .b(b[0]), .out(out_10));
	and_gate and_3(.a(a[2]), .b(b[0]), .out(out_20));
	and_gate and_4(.a(a[3]), .b(b[0]), .out(out_30));
	and_gate and_5(.a(a[4]), .b(b[0]), .out(out_40));
	and_gate and_6(.a(a[5]), .b(b[0]), .out(out_50));
	and_gate and_7(.a(a[6]), .b(b[0]), .out(out_60));
	and_gate and_8(.a(a[7]), .b(b[0]), .out(out_70));
	//a * b1
	and_gate and_9(.a(a[0]), .b(b[1]), .out(out_01));
	and_gate and_10(.a(a[1]), .b(b[1]), .out(out_11));
	and_gate and_11(.a(a[2]), .b(b[1]), .out(out_21));
	and_gate and_12(.a(a[3]), .b(b[1]), .out(out_31));
	and_gate and_13(.a(a[4]), .b(b[1]), .out(out_41));
	and_gate and_14(.a(a[5]), .b(b[1]), .out(out_51));
	and_gate and_15(.a(a[6]), .b(b[1]), .out(out_61));
	//a * b2
	and_gate and_16(.a(a[0]), .b(b[2]), .out(out_02));
	and_gate and_17(.a(a[1]), .b(b[2]), .out(out_12));
	and_gate and_18(.a(a[2]), .b(b[2]), .out(out_22));
	and_gate and_19(.a(a[3]), .b(b[2]), .out(out_32));
	and_gate and_20(.a(a[4]), .b(b[2]), .out(out_42));
	and_gate and_21(.a(a[5]), .b(b[2]), .out(out_52));
	//a * b3
	and_gate and_22(.a(a[0]), .b(b[3]), .out(out_03));
	and_gate and_23(.a(a[1]), .b(b[3]), .out(out_13));
	and_gate and_24(.a(a[2]), .b(b[3]), .out(out_23));
	and_gate and_25(.a(a[3]), .b(b[3]), .out(out_33));
	and_gate and_26(.a(a[4]), .b(b[3]), .out(out_43));
	//a * b4
	and_gate and_27(.a(a[0]), .b(b[4]), .out(out_04));
	and_gate and_28(.a(a[1]), .b(b[4]), .out(out_14));
	and_gate and_29(.a(a[2]), .b(b[4]), .out(out_24));
	and_gate and_30(.a(a[3]), .b(b[4]), .out(out_34));
	//a * b5
	and_gate and_31(.a(a[0]), .b(b[5]), .out(out_05));
	and_gate and_32(.a(a[1]), .b(b[5]), .out(out_15));
	and_gate and_33(.a(a[2]), .b(b[5]), .out(out_25));
	//a * b6
	and_gate and_34(.a(a[0]), .b(b[6]), .out(out_06));
	and_gate and_35(.a(a[1]), .b(b[6]), .out(out_16));
	//a * b7
	and_gate and_36(.a(a[0]), .b(b[7]), .out(out_07));



	//1-Bit Full Adder Module instantiation
	//1st line 7 FA
	one_bit_full_adder_gatelevel_module fa_1(.a(out_10), .b(out_01), .cin(1'b0), .sum(mul[1]), .cout(c_out_10));
	one_bit_full_adder_gatelevel_module fa_2(.a(out_20), .b(out_11), .cin(c_out_10), .sum(sum_11), .cout(c_out_11));
	one_bit_full_adder_gatelevel_module fa_3(.a(out_30), .b(out_21), .cin(c_out_11), .sum(sum_12), .cout(c_out_12));
	one_bit_full_adder_gatelevel_module fa_4(.a(out_40), .b(out_31), .cin(c_out_12), .sum(sum_13), .cout(c_out_13));
	one_bit_full_adder_gatelevel_module fa_5(.a(out_50), .b(out_41), .cin(c_out_13), .sum(sum_14), .cout(c_out_14));
	one_bit_full_adder_gatelevel_module fa_6(.a(out_60), .b(out_51), .cin(c_out_14), .sum(sum_15), .cout(c_out_15));
	one_bit_full_adder_gatelevel_module fa_7(.a(out_70), .b(out_61), .cin(c_out_15), .sum(sum_16), .cout());
	//2nd line 6 FA
	one_bit_full_adder_gatelevel_module fa_8(.a(sum_11), .b(out_02), .cin(1'b0), .sum(mul[2]), .cout(c_out_20));
	one_bit_full_adder_gatelevel_module fa_9(.a(sum_12), .b(out_12), .cin(c_out_20), .sum(sum_21), .cout(c_out_21));
	one_bit_full_adder_gatelevel_module fa_10(.a(sum_13), .b(out_22), .cin(c_out_21), .sum(sum_22), .cout(c_out_22));
	one_bit_full_adder_gatelevel_module fa_11(.a(sum_14), .b(out_32), .cin(c_out_22), .sum(sum_23), .cout(c_out_23));
	one_bit_full_adder_gatelevel_module fa_12(.a(sum_15), .b(out_42), .cin(c_out_23), .sum(sum_24), .cout(c_out_24));
	one_bit_full_adder_gatelevel_module fa_13(.a(sum_16), .b(out_52), .cin(c_out_24), .sum(sum_25), .cout());
	//3rd line 5 FA
	one_bit_full_adder_gatelevel_module fa_14(.a(sum_21), .b(out_03), .cin(1'b0), .sum(mul[3]), .cout(c_out_30));
	one_bit_full_adder_gatelevel_module fa_15(.a(sum_22), .b(out_13), .cin(c_out_30), .sum(sum_31), .cout(c_out_31));
	one_bit_full_adder_gatelevel_module fa_16(.a(sum_23), .b(out_23), .cin(c_out_31), .sum(sum_32), .cout(c_out_32));
	one_bit_full_adder_gatelevel_module fa_17(.a(sum_24), .b(out_33), .cin(c_out_32), .sum(sum_33), .cout(c_out_33));
	one_bit_full_adder_gatelevel_module fa_18(.a(sum_25), .b(out_43), .cin(c_out_33), .sum(sum_34), .cout());
	//4th line 4 FA
	one_bit_full_adder_gatelevel_module fa_19(.a(sum_31), .b(out_04), .cin(1'b0), .sum(mul[4]), .cout(c_out_40));
	one_bit_full_adder_gatelevel_module fa_20(.a(sum_32), .b(out_14), .cin(c_out_40), .sum(sum_41), .cout(c_out_41));
	one_bit_full_adder_gatelevel_module fa_21(.a(sum_33), .b(out_24), .cin(c_out_41), .sum(sum_42), .cout(c_out_42));
	one_bit_full_adder_gatelevel_module fa_22(.a(sum_34), .b(out_34), .cin(c_out_42), .sum(sum_43), .cout());
	//5th line 3 FA
	one_bit_full_adder_gatelevel_module fa_23(.a(sum_41), .b(out_05), .cin(1'b0), .sum(mul[5]), .cout(c_out_50));
	one_bit_full_adder_gatelevel_module fa_24(.a(sum_42), .b(out_15), .cin(c_out_50), .sum(sum_51), .cout(c_out_51));
	one_bit_full_adder_gatelevel_module fa_25(.a(sum_43), .b(out_25), .cin(c_out_51), .sum(sum_52), .cout());
	//6th line 2 FA
	one_bit_full_adder_gatelevel_module fa_26(.a(sum_51), .b(out_06), .cin(1'b0), .sum(mul[6]), .cout(c_out_60));
	one_bit_full_adder_gatelevel_module fa_27(.a(sum_52), .b(out_16), .cin(c_out_60), .sum(sum_61), .cout());
	//7th line 1 FA
	one_bit_full_adder_gatelevel_module fa_28(.a(sum_61), .b(out_07), .cin(1'b0), .sum(mul[7]), .cout());
	

endmodule