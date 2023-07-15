//display controller

module display_controller_module (clk,display_en,out,rst,state);

	input clk,rst,display_en;

	reg [26:0] one_second_counter; 
	wire one_second_enable;

	output [2:0] out,state;
	reg [2:0] out,state;

	//States
	parameter INITIAL = 8, S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;

	//one_second_counter_generating
	always @(posedge clk or posedge rst)
		begin
			if(rst==1)
			one_second_counter <= 0;
			else begin
				if(one_second_counter>=999999999) 
				one_second_counter <= 0;
				else
				one_second_counter <= one_second_counter + 1;
			end
		end 
	assign one_second_enable = (one_second_counter==999999999)?1:0;


	//Determine the output depending on the current state as well as the incoming input
	always @ (state or one_second_enable)
	begin
		case (state)
			
			S0:
			begin
				if (one_second_enable == 1'b1)
					out = S1;
				else
					out = S0;
			end
			S1:
			begin
				if (one_second_enable == 1'b1)
					out = S2;
				else
					out = S1;
			end
			S2:
			begin
				if (one_second_enable == 1'b1)
					out = S3;
				else
					out = S2;
			end
			S3:
			begin
				if (one_second_enable == 1'b1)
					out = S4;
				else
					out = S3;
			end
			S4:
			begin
				if (one_second_enable == 1'b1)
					out = S5;
				else
					out = S4;
			end
			S5:
			begin
				if (one_second_enable == 1'b1)
					out = S6;
				else
					out = S5;
			end
			S6:
			begin
				if (one_second_enable == 1'b1)
					out = S7;
				else
					out = S6;
			end
			S7:
			begin
				if (one_second_enable == 1'b1)
					out = S0;
				else
					out = S7;
			end
		endcase
	end
	
	//Determine the next state
	always @ (posedge clk) begin
		if (rst == 1'b1)
			state <= S0;
		else
			case (state)
				INITIAL:
				begin
					if (display_en == 1'b1)
						state <= S0;
					else
						state <= INITIAL;
				end
				S0:
				begin
					if (one_second_enable == 1'b1)
						state <= S1;
					else
						state <= S0;
				end
				S1:
				begin
					if (one_second_enable == 1'b1)
						state <= S2;
					else
						state <= S1;
				end
				S2:
				begin
					if (one_second_enable == 1'b1)
						state <= S3;
					else
						state <= S2;
				end
				S3:
				begin
					if (one_second_enable == 1'b1)
						state <= S4;
					else
						state <= S3;
				end
				S4:
				begin
					if (one_second_enable == 1'b1)
						state <= S5;
					else
						state <= S4;
				end
				S5:
				begin
					if (one_second_enable == 1'b1)
						state <= S6;
					else
						state <= S5;
				end
				S6:
				begin
					if (one_second_enable == 1'b1)
						state <= S7;
					else
						state <= S6;
				end
				S7:
				begin
					if (one_second_enable == 1'b1)
						state <= S0;
					else
						state <= S7;
				end
			endcase
	end
	

endmodule