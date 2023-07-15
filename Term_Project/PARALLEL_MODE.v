//PM_1

module Parallel_module(
   // Input Matrix a
   input [7:0] a11, a12, a13, a14,
               a21, a22, a23, a24,
                    a31, a32, a33, a34,
                    a41, a42, a43, a44,
   //Input Matrix b(Filter)
       input [7:0] b11, b12, b13,
             b21, b22, b23,
              b31, b32, b33,
   //Input Select Bit for MUX
   input [3:0] s0, s1,
   input clk,
   input we_1, we_2,
   input rst,
   input preset,
 
   //Output
   output [7:0] out);

   wire [3:0] out1_s0, out2_s0, s0_2, s0_3, out1_s1,out2_s1;

   wire [7:0] a_in_11, a_in_12, a_in_13,
         a_in_21, a_in_22, a_in_23,
         a_in_31, a_in_32, a_in_33,
   b_in_11, b_in_12, b_in_13,
         b_in_21, b_in_22, b_in_23,
         b_in_31, b_in_32, b_in_33;
   wire [7:0] b_out_11, b_out_12, b_out_13,
         b_out_21, b_out_22, b_out_23,
         b_out_31, b_out_32, b_out_33;

   wire [7:0] pe_out_11, pe_out_12, pe_out_13,
         pe_out_21, pe_out_22, pe_out_23,
         pe_out_31, pe_out_32, pe_out_33;
   wire [7:0] dff_out_1, dff_out_2, dff_out_3, dff_out_4;
   wire [7:0] sum_out_1, sum_out_2, sum_out_3;
/*------------------explanation---------------------
C11: s0:0->1->2
C12: s0:4->5->6
C21: s0:1->2->3
C22: s0:5->6->7
e.g. s0: 0->1->2->4->5->6->1->2->3->5->6->7->7->7->...->...
   total 16clock
-----------------------------------------------------*/

/*-------------------------filter_b for Weight Stationary-------------------*/
      
/*-------------------------input_a-------------------*/


      //for a_in[1][1]
      pe_input_module pe_input11//Matrix a
               (.a11(a11), .a12(a12), .a13(a13), .a14(a14),
                       .a21(a21), .a22(a22), .a23(a23), .a24(a24),
                            .a31(a31), .a32(a32), .a33(a33), .a34(a34),
                             .a41(a41), .a42(a42), .a43(a43), .a44(a44),
               //Matrix b
                .b11(b11), .b12(b12), .b13(b13),
                            .b21(b21), .b22(b22), .b23(b23),
                  .b31(b31), .b32(b32), .b33(b33),
               //Select
                     .s0(s0), .s1(s1),
               //output
               .a_out(a_in_11), .b_out(b_in_11));

      //for a_in[2][1]
      four_bit_full_adder_module FFA_a_2(.a(s0), .b(4'b0100), .cin(1'b0), .sum(out1_s0), .cout());
      four_bit_d_filp_flop_module dff_aout1(.d(out1_s0), .clk(clk), .rst(rst), .preset(preset), .q(s0_2), .q_bar());
      four_bit_full_adder_module FFA_b_2(.a(s1), .b(4'b0100), .cin(1'b0), .sum(out1_s1), .cout());

      pe_input_module pe_input21//Matrix a
               (.a11(a11), .a12(a12), .a13(a13), .a14(a14),
                       .a21(a21), .a22(a22), .a23(a23), .a24(a24),
                            .a31(a31), .a32(a32), .a33(a33), .a34(a34),
                             .a41(a41), .a42(a42), .a43(a43), .a44(a44),
               //Matrix b
                .b11(b11), .b12(b12), .b13(b13),
                            .b21(b21), .b22(b22), .b23(b23),
                  .b31(b31), .b32(b32), .b33(b33),
               //Select
                     .s0(s0_2), .s1(out1_s1),
               //output
               .a_out(a_in_21), .b_out(b_in_12));

      //for a_in[3][1]
      four_bit_full_adder_module FFA_3(.a(s0_2), .b(4'b0100), .cin(1'b0), .sum(out2_s0), .cout());
      four_bit_d_filp_flop_module dff_out2(.d(out2_s0), .clk(clk), .rst(rst), .preset(preset), .q(s0_3), .q_bar());
      four_bit_full_adder_module FFA_b_3(.a(out1_s1), .b(4'b0100), .cin(1'b0), .sum(out2_s1), .cout());
      pe_input_module pe_input31//Matrix a
               (.a11(a11), .a12(a12), .a13(a13), .a14(a14),
                       .a21(a21), .a22(a22), .a23(a23), .a24(a24),
                            .a31(a31), .a32(a32), .a33(a33), .a34(a34),
                             .a41(a41), .a42(a42), .a43(a43), .a44(a44),
               //Matrix b
                .b11(b11), .b12(b12), .b13(b13),
                            .b21(b21), .b22(b22), .b23(b23),
                  .b31(b31), .b32(b32), .b33(b33),
               //Select
                .s0(s0_3), .s1(out2_s1),
               //output
               .a_out(a_in_31), .b_out(b_in_13));

/*-------------------------pe computation------------*/
   //pe computation
      processing_element_module pe_11(.a(a_in_11), .b(b_in_11), .c(8'b00000000), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_11), .out_a(a_in_12), .out_b(b_in_21));
      processing_element_module pe_12(.a(a_in_12), .b(b_in_12), .c(8'b00000000), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_12), .out_a(a_in_13), .out_b(b_in_22));
      processing_element_module pe_13(.a(a_in_13), .b(b_in_13), .c(8'b00000000), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_13), .out_a(), .out_b(b_in_23));
      cache_memory_module cache_1( .b11(b_in_11), .b12(b_in_12), .b13(b_in_13),
                    .b21(b_in_21), .b22(b_in_22), .b23(b_in_23),
                     .b31(b_in_31), .b32(b_in_32), .b33(b_in_33), .clk(clk), .we(we_1),
          .fix_b11(b_out_11), .fix_b12(b_out_12), .fix_b13(b_out_13),
                    .fix_b21(b_out_21), .fix_b22(b_out_22), .fix_b23(b_out_23),
                     .fix_b31(), .fix_b32(), .fix_b33());

      processing_element_module pe_21(.a(a_in_21), .b(b_out_21), .c(pe_out_11), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_21), .out_a(a_in_22), .out_b(b_in_31));
      processing_element_module pe_22(.a(a_in_22), .b(b_out_22), .c(pe_out_12), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_22), .out_a(a_in_23), .out_b(b_in_32));
      processing_element_module pe_23(.a(a_in_23), .b(b_out_23), .c(pe_out_13), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_23), .out_a(), .out_b(b_in_33));
      cache_memory_module cache( .b11(b_in_11), .b12(b_in_12), .b13(b_in_13),
                    .b21(b_in_21), .b22(b_in_22), .b23(b_in_23),
                     .b31(b_in_31), .b32(b_in_32), .b33(b_in_33), .clk(clk), .we(we_2),
          .fix_b11(b_out_11), .fix_b12(b_out_12), .fix_b13(b_out_13),
                    .fix_b21(), .fix_b22(), .fix_b23(),
                     .fix_b31(b_out_31), .fix_b32(b_out_32), .fix_b33(b_out_33));

      processing_element_module pe_31(.a(a_in_31), .b(b_out_31), .c(pe_out_21), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_31), .out_a(a_in_32), .out_b());
      processing_element_module pe_32(.a(a_in_32), .b(b_out_32), .c(pe_out_22), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_32), .out_a(a_in_33), .out_b());
      processing_element_module pe_33(.a(a_in_33), .b(b_out_33), .c(pe_out_23), .clk(clk), .rst(rst), .preset(preset), .out(pe_out_33), .out_a(), .out_b());
      
      eight_bit_d_filp_flop_module dff_1(.d(pe_out_31), .clk(clk), .rst(rst), .preset(preset), .q(dff_out_1), .q_bar());
      eight_bit_d_filp_flop_module dff_2(.d(dff_out_1), .clk(clk), .rst(rst), .preset(preset), .q(dff_out_2), .q_bar());
      eight_bit_full_adder_module EFA_1(.a(dff_out_2), .b(pe_out_32), .cin(1'b0), .sum(sum_out_1), .cout());
      eight_bit_d_filp_flop_module dff_3(.d(sum_out_1), .clk(clk), .rst(rst), .preset(preset), .q(dff_out_3), .q_bar());
      eight_bit_d_filp_flop_module dff_4(.d(dff_out_3), .clk(clk), .rst(rst), .preset(preset), .q(dff_out_4), .q_bar());
      eight_bit_full_adder_module EFA_2(.a(dff_out_4), .b(pe_out_33), .cin(1'b0), .sum(out), .cout());
/*-------------------------output--------------------*/
      //C11 : CLK 3, 5, 7
      //C12 : CLK 6, 8, 10
      //C21 : CLK 9, 11, 13
      //C22 : CLK 12, 14, 16
endmodule
