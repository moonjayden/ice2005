`timescale 1ns/1ns

module tb_display;
   //clock
   reg CLK;
//////////////////////////////
   // Input
   reg [7:0] in_sa_11, in_sa_12, in_sa_21, in_sa_22;
   reg [7:0] in_custom_11, in_custom_12, in_custom_21, in_custom_22;
   reg RST,RST_D,EN;
   
   // Output
   wire [3:0] ANODE;
   wire [6:0] out;

   // Module instantiation
   display_module display_module_testbench(
   .in_sa_11(in_sa_11), .in_sa_12(in_sa_12), .in_sa_21(in_sa_21), .in_sa_22(in_sa_22), 
   .in_custom_11(in_custom_11), .in_custom_12(in_custom_12), .in_custom_21(in_custom_21), .in_custom_22(in_custom_22),
   .rst(RST),
   .clk(CLK),
   .anode_activate(ANODE),
   .out(out),
   .display_en(EN),
   .display_rst(RST_D));

////////////////////////////////

   initial
   begin
      RST = 1'b1;
      CLK = 1'b0;
      EN = 1'b0;
      RST_D = 1'b1;
      
      in_sa_11 = 8'd123;
      in_sa_12 = 8'd159;
      in_sa_21 = 8'd198;
      in_sa_22 = 8'd255;

      in_custom_11 = 8'd123;
      in_custom_12 = 8'd159;
      in_custom_21 = 8'd198;
      in_custom_22 = 8'd255;
   end

//Clock Cycle Time <- 10ns = 100MHz
   initial begin
          forever begin
              #5 CLK = ~CLK;
          end
   end    

//Test patern

   initial
      begin
      //reset=0
         #20 RST = 1'b0;
	     RST_D = 1'b0;
	     EN = 1'b1;
      end

endmodule
