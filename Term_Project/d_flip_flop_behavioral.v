//This is for the D flip flop module.

module d_flip_flop_behavioral_module (d, clk, rst, preset, q, q_bar);
	input d;
	input clk; // clock
	input rst;
	input preset;

	output q, q_bar;
	reg q, q_bar;	
	
	always@(posedge clk or posedge rst)
	begin
		if(rst == 1'b1)
		begin
			if(preset == 1'b1)
			begin
				q <= 1'b1;
				q_bar <= 1'b0;
			end
			else
			begin
				q <= 1'b0;
				q_bar <= 1'b1;
			end
		end
		else
		begin
			q <= d;
			q_bar <= !d;		
		end
	end
endmodule
