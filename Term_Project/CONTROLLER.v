//Controller Module

module controller_module(
	input clk,
	input rst,
	
	output [3:0] out_count,
	output [4:0] out_state, out_next_state,
	output PE_INIT, CUS_INIT, PE_RST, SYS_RST, CUS_RST, DIS_RST,
	output out_SYS_cache_we_1,out_SYS_cache_we_2,
	output DISPLAY_EN,
	output [3:0] out_PE_sel_a, out_PE_sel_b,
		     out_SYS_sel_a, out_SYS_sel_b,
		     out_CUS_sel_11, out_CUS_sel_12, out_CUS_sel_13,
		     out_CUS_sel_21, out_CUS_sel_22, out_CUS_sel_23,
		     out_CUS_sel_31, out_CUS_sel_32, out_CUS_sel_33,
	output [1:0] out_mode,
	
	output out_we,
	output out_we_pe_1, out_we_pe_2, out_we_pe_3, out_we_pe_4,
	out_we_sys_1, out_we_sys_2, out_we_sys_3, out_we_sys_4,
	out_we_cus_1, out_we_cus_2, out_we_cus_3, out_we_cus_4);
	
	reg PE_en, SYS_en, CUS_en;
	reg DISPLAY_en, DIS_rst;
	reg PE_clear, PE_rst, SYS_clear, CUS_clear, CUS_rst;
	reg count_clear;
	reg [3:0]count;
	reg mem_write;
    	reg sys_to_dis, cus_to_dis;
    	reg comp_end;
	reg SYS_cache_we_1,SYS_cache_we_2;
	reg [3:0] PE_sel_a, PE_sel_b,
		  SYS_sel_a, SYS_sel_b,
		  CUS_sel_11, CUS_sel_12, CUS_sel_13,
		  CUS_sel_21, CUS_sel_22, CUS_sel_23,
		  CUS_sel_31, CUS_sel_32, CUS_sel_33;
	reg [1:0] mode;
	
	reg we;
	reg we_pe_1, we_pe_2, we_pe_3, we_pe_4,
	we_sys_1, we_sys_2, we_sys_3, we_sys_4,
	we_cus_1, we_cus_2, we_cus_3, we_cus_4;
	reg [4:0] state, next_state;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//States
	parameter INITIAL = 5'd0,
		  PE_C11 = 5'd1, PE_C11_END= 5'd2, PE_C12 = 5'd3, PE_C12_END= 5'd4, PE_C21 = 5'd5, PE_C21_END= 5'd6, PE_C22 = 5'd7, PE_C22_END= 5'd8,
		  SYS_B_FIX = 5'd9, SYS_C11 = 5'd10, SYS_C12= 5'd11, SYS_C21 = 5'd12, SYS_C22= 5'd13, SYS_C22_END= 5'd14,
		  CUS_C11 = 5'd15, CUS_C11_END= 5'd16, CUS_C12 = 5'd17, CUS_C12_END= 5'd18, CUS_C21 = 5'd19, CUS_C21_END= 5'd20, CUS_C22 = 5'd21, CUS_C22_END= 5'd22,
		  DISPLAY = 5'd23;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Count for PE State
	always @ (posedge clk)
		begin
    			if (count_clear == 1'b1) 
				begin
        				count = 4'd0;
    				end 
			else 
				begin
        				count = count + 1'b1;
    				end
		end
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Change_state  (Sequential Logic)
	always @ (posedge clk, posedge rst) 
		begin 
	    		if (rst == 1'b1) 
			begin
 	       			state <= INITIAL;
    			end
			else 
			begin
        			state <= next_state;
    			end
		end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Determine the next state
	always @ (clk, state, count) 
	begin
	
	if(clk == 1)
		begin
		if (rst == 1'b1)
			next_state = INITIAL;
		else
		begin
			case (state)
        		INITIAL : next_state = PE_C11;
        		//PE Computation States
        		PE_C11 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C11_END;
            				end 
				else 
					begin
                				next_state = PE_C11;
            				end
        			end
       
			PE_C11_END : next_state = PE_C12;
			PE_C12 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C12_END;
            				end 
				else 
					begin
                				next_state = PE_C12;
            				end
        			end

        		PE_C12_END : next_state = PE_C21;
			PE_C21 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C21_END;
            				end 
				else 
					begin
                				next_state = PE_C21;
            				end
        			end
       
			PE_C21_END : next_state = PE_C22;
			PE_C22 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C22_END;
            				end 
				else 
					begin
                				next_state = PE_C22;
            				end
        			end

        		PE_C22_END : next_state = SYS_B_FIX;
			//Systolic Computation States
			SYS_B_FIX : begin
            			if (count == 4'b0011) 
					begin
                				next_state = SYS_C11;
            				end 
				else 
					begin
                				next_state = SYS_B_FIX;
            				end
        			end
			
        		SYS_C11 : begin
            			if (count == 4'b0111) 
					begin
                				next_state = SYS_C12;
            				end 
				else 
					begin
                				next_state = SYS_C11;
            				end
        			end
       
			
			SYS_C12 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C21;
            				end 
				else 
					begin
                				next_state = SYS_C12;
            				end
        			end

        		
			SYS_C21 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C22;
            				end 
				else 
					begin
                				next_state = SYS_C21;
            				end
        			end
       
			
			SYS_C22 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C22_END;
            				end 
				else 
					begin
                				next_state = SYS_C22;
            				end
        			end

        		SYS_C22_END : next_state = CUS_C11;
			//Custom Mode Computation States
        		CUS_C11 : begin
                			next_state = CUS_C11_END;
        			end
       
			CUS_C11_END : next_state = CUS_C12;
			CUS_C12 : begin
                			next_state = CUS_C12_END;
        			end

        		CUS_C12_END : next_state = CUS_C21;
			CUS_C21 : begin
            			
                			next_state = CUS_C21_END;
            			
        			end
       
			CUS_C21_END : next_state = CUS_C22;
			CUS_C22 : begin
            			 	next_state = CUS_C22_END;
        			end

        		CUS_C22_END : next_state = DISPLAY;
			//Display
			DISPLAY : next_state = DISPLAY;
			
			endcase
			end
		end
	end
	/*always @ (state or count) //Due to Synthesis -> Divide the code of trigger(posedge clk / state or count)
	begin
		if (rst == 1'b1)
			next_state = INITIAL;
		else
		begin
			case (state)
        		INITIAL : next_state = PE_C11;
        		//PE Computation States
        		PE_C11 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C11_END;
            				end 
				else 
					begin
                				next_state = PE_C11;
            				end
        			end
       
			PE_C11_END : next_state = PE_C12;
			PE_C12 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C12_END;
            				end 
				else 
					begin
                				next_state = PE_C12;
            				end
        			end

        		PE_C12_END : next_state = PE_C21;
			PE_C21 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C21_END;
            				end 
				else 
					begin
                				next_state = PE_C21;
            				end
        			end
       
			PE_C21_END : next_state = PE_C22;
			PE_C22 : begin
            			if (count == 4'b1001) 
					begin
                				next_state = PE_C22_END;
            				end 
				else 
					begin
                				next_state = PE_C22;
            				end
        			end

        		PE_C22_END : next_state = SYS_B_FIX;
			//Systolic Computation States
			SYS_B_FIX : begin
            			if (count == 4'b0011) 
					begin
                				next_state = SYS_C11;
            				end 
				else 
					begin
                				next_state = SYS_B_FIX;
            				end
        			end
			
        		SYS_C11 : begin
            			if (count == 4'b0111) 
					begin
                				next_state = SYS_C12;
            				end 
				else 
					begin
                				next_state = SYS_C11;
            				end
        			end
       
			
			SYS_C12 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C21;
            				end 
				else 
					begin
                				next_state = SYS_C12;
            				end
        			end

        		
			SYS_C21 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C22;
            				end 
				else 
					begin
                				next_state = SYS_C21;
            				end
        			end
       
			
			SYS_C22 : begin
            			if (count == 4'b0010) 
					begin
                				next_state = SYS_C22_END;
            				end 
				else 
					begin
                				next_state = SYS_C22;
            				end
        			end

        		SYS_C22_END : next_state = CUS_C11;
			//Custom Mode Computation States
        		CUS_C11 : begin
                			next_state = CUS_C11_END;
        			end
       
			CUS_C11_END : next_state = CUS_C12;
			CUS_C12 : begin
                			next_state = CUS_C12_END;
        			end

        		CUS_C12_END : next_state = CUS_C21;
			CUS_C21 : begin
            			
                			next_state = CUS_C21_END;
            			
        			end
       
			CUS_C21_END : next_state = CUS_C22;
			CUS_C22 : begin
            			 	next_state = CUS_C22_END;
        			end

        		CUS_C22_END : next_state = DISPLAY;
			//Display
			DISPLAY : next_state = DISPLAY;
			
			endcase
		end
	end*/

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Determine the select bit & behavior
	always @ (state or count)
		begin 
    			case (state)
        			INITIAL : 
					begin
						we = 1'b1;
						PE_en = 1'b0; PE_clear = 1'b1; PE_rst=1'b1;
            					SYS_en = 1'b0; SYS_clear = 1'b1;
            					CUS_en = 1'b0; CUS_clear = 1'b1; CUS_rst = 1'b1;
            					DISPLAY_en = 1'b0; DIS_rst = 1'b1;
            					PE_sel_a = 4'b0000; PE_sel_b = 4'b0000;
						SYS_cache_we_1 = 1'b0; SYS_cache_we_2 = 1'b0;
						SYS_sel_a = 4'b0000; SYS_sel_b = 4'b0010;
		  				CUS_sel_11 = 4'b0000; CUS_sel_12 = 4'b0000; CUS_sel_13 = 4'b0000;
		  				CUS_sel_21 = 4'b0000; CUS_sel_22 = 4'b0000; CUS_sel_23 = 4'b0000;
		  				CUS_sel_31 = 4'b0000; CUS_sel_32 = 4'b0000; CUS_sel_33 = 4'b0000;
						mode = 2'b00;
						we_pe_1 = 1'b0; we_pe_2 = 1'b0; we_pe_3 = 1'b0; we_pe_4 = 1'b0;
						we_sys_1 = 1'b0; we_sys_2 = 1'b0; we_sys_3 = 1'b0; we_sys_4 = 1'b0;
						we_cus_1 = 1'b0; we_cus_2 = 1'b0; we_cus_3 = 1'b0; we_cus_4 = 1'b0;
            					count_clear = 1'b1; 
        				end
			//PE Computation
        			PE_C11 : //PE_C11 
					begin            					
            					PE_en = 1'b1; PE_clear = 1'b0; PE_rst=1'b0; we = 1'b0;
						count_clear = 1'b0; 
            					case (count)
                					4'b0000 : begin PE_sel_a = 4'b0000; PE_sel_b = 4'b0000; end
                					4'b0001 : begin PE_sel_a = 4'b0100; PE_sel_b = 4'b0001; end
                					4'b0010 : begin PE_sel_a = 4'b1000; PE_sel_b = 4'b0010; end
               						4'b0011 : begin PE_sel_a = 4'b0001; PE_sel_b = 4'b0100; end
                					4'b0100 : begin PE_sel_a = 4'b0101; PE_sel_b = 4'b0101; end
                					4'b0101 : begin PE_sel_a = 4'b1001; PE_sel_b = 4'b0110; end
                					4'b0110 : begin PE_sel_a = 4'b0010; PE_sel_b = 4'b1000; end
                					4'b0111 : begin PE_sel_a = 4'b0110; PE_sel_b = 4'b1001; end
                					4'b1000 : begin PE_sel_a = 4'b1010; PE_sel_b = 4'b1010; end
							4'b1001 : begin mode = 2'b01;  we_pe_1 = 1'b1; end
						endcase
						
					end
				PE_C11_END :
					begin
            					
            					count_clear = 1'b1; PE_clear = 1'b1; PE_rst=1'b1; mode = 2'b00; we_pe_1 = 1'b0;
					end
				PE_C12 : //PE_C12
					begin
            					count_clear = 1'b0; PE_clear = 1'b0; PE_rst=1'b0;
            					case (count)
                					4'b0000 : begin PE_sel_a = 4'b0100; PE_sel_b = 4'b0000; end
                					4'b0001 : begin PE_sel_a = 4'b1000; PE_sel_b = 4'b0001; end
                					4'b0010 : begin PE_sel_a = 4'b1100; PE_sel_b = 4'b0010; end
               						4'b0011 : begin PE_sel_a = 4'b0101; PE_sel_b = 4'b0100; end
                					4'b0100 : begin PE_sel_a = 4'b1001; PE_sel_b = 4'b0101; end
                					4'b0101 : begin PE_sel_a = 4'b1101; PE_sel_b = 4'b0110; end
                					4'b0110 : begin PE_sel_a = 4'b0110; PE_sel_b = 4'b1000; end
                					4'b0111 : begin PE_sel_a = 4'b1010; PE_sel_b = 4'b1001; end
                					4'b1000 : begin PE_sel_a = 4'b1110; PE_sel_b = 4'b1010; end
							4'b1001 : begin mode = 2'b01;  we_pe_2 = 1'b1; end
						endcase
					end
				PE_C12_END :
					begin
            					
            					count_clear = 1'b1; PE_clear = 1'b1; PE_rst=1'b1; mode = 2'b00; we_pe_2 = 1'b0;
					end		
				PE_C21 : //PE_C21
					begin
            					count_clear = 1'b0; PE_clear = 1'b0; PE_rst=1'b0;
            					case (count)
                					4'b0000 : begin PE_sel_a = 4'b0001; PE_sel_b = 4'b0000; end
                					4'b0001 : begin PE_sel_a = 4'b0101; PE_sel_b = 4'b0001; end
                					4'b0010 : begin PE_sel_a = 4'b1001; PE_sel_b = 4'b0010; end
               						4'b0011 : begin PE_sel_a = 4'b0010; PE_sel_b = 4'b0100; end
                					4'b0100 : begin PE_sel_a = 4'b0110; PE_sel_b = 4'b0101; end
                					4'b0101 : begin PE_sel_a = 4'b1010; PE_sel_b = 4'b0110; end
                					4'b0110 : begin PE_sel_a = 4'b0011; PE_sel_b = 4'b1000; end
                					4'b0111 : begin PE_sel_a = 4'b0111; PE_sel_b = 4'b1001; end
                					4'b1000 : begin PE_sel_a = 4'b1011; PE_sel_b = 4'b1010; end
							4'b1001 : begin mode = 2'b01; we_pe_3 = 1'b1; end
						endcase
					end
				PE_C21_END :
					begin
            					
            					count_clear = 1'b1; PE_clear = 1'b1; PE_rst=1'b1; mode = 2'b00; we_pe_3 = 1'b0;
					end		

				PE_C22 : //PE_C22
					begin
            					count_clear = 1'b0; PE_clear = 1'b0; PE_rst=1'b0;
            					case (count)
                					4'b0000 : begin PE_sel_a = 4'b0101; PE_sel_b = 4'b0000; end
                					4'b0001 : begin PE_sel_a = 4'b1001; PE_sel_b = 4'b0001; end
                					4'b0010 : begin PE_sel_a = 4'b1101; PE_sel_b = 4'b0010; end
               						4'b0011 : begin PE_sel_a = 4'b0110; PE_sel_b = 4'b0100; end
                					4'b0100 : begin PE_sel_a = 4'b1010; PE_sel_b = 4'b0101; end
                					4'b0101 : begin PE_sel_a = 4'b1110; PE_sel_b = 4'b0110; end
                					4'b0110 : begin PE_sel_a = 4'b0111; PE_sel_b = 4'b1000; end
                					4'b0111 : begin PE_sel_a = 4'b1011; PE_sel_b = 4'b1001; end
                					4'b1000 : begin PE_sel_a = 4'b1111; PE_sel_b = 4'b1010; end
							4'b1001 : begin mode = 2'b01;  we_pe_4 = 1'b1; end
						endcase
					end
				PE_C22_END :
					begin
            					
						count_clear = 1'b1; PE_en=1'b0; PE_clear = 1'b1; PE_rst=1'b1; mode = 2'b00; we_pe_4 = 1'b0;
					end	
				//Systolic Computation
				SYS_B_FIX :
					begin
						SYS_en = 1'b1; 
						count_clear = 1'b0;
						case (count)
                					4'b0000 : begin SYS_clear = 1'b0; SYS_sel_b = 4'b0010; SYS_cache_we_1 = 1'b0; SYS_cache_we_2 = 1'b0; end
                					4'b0001 : begin SYS_sel_b = 4'b0001; SYS_cache_we_1 = 1'b1; SYS_cache_we_2 = 1'b0; end
                					4'b0010 : begin SYS_sel_b = 4'b0000; SYS_cache_we_1 = 1'b1; SYS_cache_we_2 = 1'b0; end
               						4'b0011 : begin SYS_sel_b = 4'b0000; SYS_cache_we_1 = 1'b0; SYS_cache_we_2 = 1'b1; count_clear = 1'b1; end
							endcase
        				end
				
				SYS_C11 :
					begin
						SYS_en = 1'b1; SYS_clear = 1'b0;
						count_clear = 1'b0;
						SYS_cache_we_1 = 0;
						SYS_cache_we_2 = 0;
						case (count)
                					4'b0000 : begin SYS_sel_a = 4'b0000; SYS_sel_b = 4'b0000; end
                					4'b0001 : begin SYS_sel_a = 4'b0001; SYS_sel_b = 4'b0000; end
                					4'b0010 : begin SYS_sel_a = 4'b0010; SYS_sel_b = 4'b0000; end
               						4'b0011 : begin SYS_sel_a = 4'b0100; SYS_sel_b = 4'b0000; end
							4'b0100 : begin SYS_sel_a = 4'b0101; SYS_sel_b = 4'b0000; end
                					4'b0101 : begin SYS_sel_a = 4'b0110; SYS_sel_b = 4'b0000; end
                					4'b0110 : begin SYS_sel_a = 4'b0001; SYS_sel_b = 4'b0000; end
                					4'b0111 : begin SYS_sel_a = 4'b0010; SYS_sel_b = 4'b0000; mode = 2'b10; we_sys_1 = 1'b1; count_clear = 1'b1;   end
						endcase
        				end
        			
				SYS_C12 :
					begin
						SYS_en = 1'b1; SYS_clear = 1'b0;mode = 2'b00; we_sys_1 = 1'b0;
						count_clear = 1'b0;
						SYS_cache_we_1 = 0;
						SYS_cache_we_2 = 0;
						case (count)
                					4'b0000 : begin SYS_sel_a = 4'b0011; SYS_sel_b = 4'b0000; end
                					4'b0001 : begin SYS_sel_a = 4'b0101; SYS_sel_b = 4'b0000; end
                					4'b0010 : begin SYS_sel_a = 4'b0110; SYS_sel_b = 4'b0000; mode = 2'b10;  we_sys_2 = 1'b1; count_clear = 1'b1;   end
						endcase
        				end
				
				SYS_C21 :
					begin
						SYS_en = 1'b1; SYS_clear = 1'b0; mode = 2'b00; we_sys_2 = 1'b0;
						count_clear = 1'b0;
						SYS_cache_we_1 = 0;
						SYS_cache_we_2 = 0;
						case (count)
                					4'b0000 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; end
                					4'b0001 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; end
                					4'b0010 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; mode = 2'b10;  we_sys_3 = 1'b1; count_clear = 1'b1;   end
						endcase
        				end
			
				SYS_C22 :
					begin
						SYS_en = 1'b1; SYS_clear = 1'b0; mode = 2'b00; we_sys_3 = 1'b0;
						count_clear = 1'b0;
						SYS_cache_we_1 = 0;
						SYS_cache_we_2 = 0;
						case (count)
                					4'b0000 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; end
                					4'b0001 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; end
                					4'b0010 : begin SYS_sel_a = 4'b0111; SYS_sel_b = 4'b0000; mode = 2'b10;  we_sys_4 = 1'b1; end
						endcase
        				end
				SYS_C22_END : 
					begin            					
            					SYS_sel_a = 4'b0000; SYS_sel_b = 4'b0000; mode = 2'b00; we_sys_4 = 1'b0;
						count_clear = 1'b1; SYS_en = 1'b0; SYS_clear = 1'b1; CUS_rst = 1'b0;   					
        				end
				//Custom Mode Computation
				CUS_C11 :
					begin
						CUS_en = 1'b1; CUS_clear = 1'b0;
						CUS_sel_11 = 4'b0000; CUS_sel_12 = 4'b0100; CUS_sel_13 = 4'b1000;
		  				CUS_sel_21 = 4'b0001; CUS_sel_22 = 4'b0101; CUS_sel_23 = 4'b1001;
		  				CUS_sel_31 = 4'b0010; CUS_sel_32 = 4'b0110; CUS_sel_33 = 4'b1010;
        				end
				CUS_C11_END : 
					begin            					
						CUS_en = 1'b0; CUS_clear = 1'b1; mode = 2'b11;  we_cus_1 = 1'b1;
        				end
				CUS_C12 :
					begin
						CUS_en = 1'b1; CUS_clear = 1'b0;
						CUS_sel_11 = 4'b0100; CUS_sel_12 = 4'b1000; CUS_sel_13 = 4'b1100;
		  				CUS_sel_21 = 4'b0101; CUS_sel_22 = 4'b1001; CUS_sel_23 = 4'b1101;
		  				CUS_sel_31 = 4'b0110; CUS_sel_32 = 4'b1010; CUS_sel_33 = 4'b1110;
						mode = 2'b00; we_cus_1 = 1'b0;
        				end
				CUS_C12_END : 
					begin            					
						CUS_en = 1'b0; CUS_clear = 1'b1; mode = 2'b11;  we_cus_2 = 1'b1;
        				end
				CUS_C21 :
					begin
						CUS_en = 1'b1; CUS_clear = 1'b0;
						CUS_sel_11 = 4'b0001; CUS_sel_12 = 4'b0101; CUS_sel_13 = 4'b1001;
		  				CUS_sel_21 = 4'b0010; CUS_sel_22 = 4'b0110; CUS_sel_23 = 4'b1010;
		  				CUS_sel_31 = 4'b0011; CUS_sel_32 = 4'b0111; CUS_sel_33 = 4'b1011;
						mode = 2'b00; we_cus_2 = 1'b0;
        				end
				CUS_C21_END : 
					begin            					
						CUS_en = 1'b0; CUS_clear = 1'b1; mode = 2'b11;  we_cus_3 = 1'b1;
					end
				CUS_C22 :
					begin
						CUS_en = 1'b1; CUS_clear = 1'b0;
						CUS_sel_11 = 4'b0101; CUS_sel_12 = 4'b1001; CUS_sel_13 = 4'b1101;
		  				CUS_sel_21 = 4'b0110; CUS_sel_22 = 4'b1010; CUS_sel_23 = 4'b1110;
		  				CUS_sel_31 = 4'b0111; CUS_sel_32 = 4'b1011; CUS_sel_33 = 4'b1111;
						mode = 2'b00; we_cus_3 = 1'b0;
        				end
				CUS_C22_END : 
					begin            					
						CUS_en = 1'b0; CUS_clear = 1'b1; mode = 2'b11;  we_cus_4 = 1'b1;
					end
				DISPLAY:
					begin
						DISPLAY_en =1'b1;  DIS_rst = 1'b0;
						mode = 2'b00; we_cus_4 = 1'b0;
						
					end
				endcase
			end
	assign out_count = count;
	assign PE_INIT = PE_clear;
	assign PE_RST = PE_rst;
	assign SYS_RST = SYS_clear;
	assign CUS_INIT = CUS_clear;
	assign CUS_RST = CUS_rst;
	assign DIS_RST = DIS_rst;
	assign DISPLAY_EN = DISPLAY_en;
	assign out_state = state;
	assign out_next_state = next_state;
	assign out_SYS_cache_we_1 = SYS_cache_we_1;
	assign out_SYS_cache_we_2 = SYS_cache_we_2;
	assign out_PE_sel_a = PE_sel_a;
	assign out_PE_sel_b = PE_sel_b;
	assign out_SYS_sel_a = SYS_sel_a;
	assign out_SYS_sel_b = SYS_sel_b;
	assign out_CUS_sel_11 = CUS_sel_11;
	assign out_CUS_sel_12 = CUS_sel_12;
	assign out_CUS_sel_13 = CUS_sel_13;
	assign out_CUS_sel_21 = CUS_sel_21;
	assign out_CUS_sel_22 = CUS_sel_22;
 	assign out_CUS_sel_23 = CUS_sel_23;
	assign out_CUS_sel_31 = CUS_sel_31;
	assign out_CUS_sel_32 = CUS_sel_32;
	assign out_CUS_sel_33 = CUS_sel_33;
	assign out_mode = mode;
	assign out_we = we;
	assign out_we_pe_1 = we_pe_1;
	assign out_we_pe_2 = we_pe_2;
	assign out_we_pe_3 = we_pe_3;
	assign out_we_pe_4 = we_pe_4;
	assign out_we_sys_1 = we_sys_1;
	assign out_we_sys_2 = we_sys_2;
	assign out_we_sys_3 = we_sys_3;
	assign out_we_sys_4 = we_sys_4;
	assign out_we_cus_1 = we_cus_1;
	assign out_we_cus_2 = we_cus_2;
	assign out_we_cus_3 = we_cus_3;
	assign out_we_cus_4 = we_cus_4;





endmodule