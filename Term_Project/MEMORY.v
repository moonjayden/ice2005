//Memory Module

module memory_module
(
	//Input Matrix a
	input [7:0] a11, a12, a13, a14,
	            a21, a22, a23, a24,
                    a31, a32, a33, a34,
                    a41, a42, a43, a44,
	//Input Matrix b(Filter)
    	input [7:0] b11, b12, b13,
   		    b21, b22, b23,
    		    b31, b32, b33,
	input [7:0] out,

	input clk,
	input we,
	      we_pe_1, we_pe_2, we_pe_3, we_pe_4,
	      we_sys_1, we_sys_2, we_sys_3, we_sys_4,
	      we_cus_1, we_cus_2, we_cus_3, we_cus_4,

	output [7:0] stored_a11, stored_a12, stored_a13, stored_a14,
	             stored_a21, stored_a22, stored_a23, stored_a24,
                     stored_a31, stored_a32, stored_a33, stored_a34,
                     stored_a41, stored_a42, stored_a43, stored_a44,
    	output [7:0] stored_b11, stored_b12, stored_b13,
   		     stored_b21, stored_b22, stored_b23,
    		     stored_b31, stored_b32, stored_b33,
	output [7:0] pe_c11,pe_c12,pe_c21,pe_c22,
		     sys_c11,sys_c12,sys_c21,sys_c22,
		     cus_c11,cus_c12,cus_c21,cus_c22);

	single_port_ram ram_a11(.data(a11), .addr(6'd10), .we(we), .clk(clk), .q(stored_a11));
	single_port_ram ram_a12(.data(a12), .addr(6'd11), .we(we), .clk(clk), .q(stored_a12));
	single_port_ram ram_a13(.data(a13), .addr(6'd12), .we(we), .clk(clk), .q(stored_a13));
	single_port_ram ram_a14(.data(a14), .addr(6'd13), .we(we), .clk(clk), .q(stored_a14));
	single_port_ram ram_a21(.data(a21), .addr(6'd14), .we(we), .clk(clk), .q(stored_a21));
	single_port_ram ram_a22(.data(a22), .addr(6'd15), .we(we), .clk(clk), .q(stored_a22));
	single_port_ram ram_a23(.data(a23), .addr(6'd16), .we(we), .clk(clk), .q(stored_a23));
	single_port_ram ram_a24(.data(a24), .addr(6'd17), .we(we), .clk(clk), .q(stored_a24));
	single_port_ram ram_a31(.data(a31), .addr(6'd18), .we(we), .clk(clk), .q(stored_a31));
	single_port_ram ram_a32(.data(a32), .addr(6'd19), .we(we), .clk(clk), .q(stored_a32));
	single_port_ram ram_a33(.data(a33), .addr(6'd20), .we(we), .clk(clk), .q(stored_a33));
	single_port_ram ram_a34(.data(a34), .addr(6'd21), .we(we), .clk(clk), .q(stored_a34));
	single_port_ram ram_a41(.data(a41), .addr(6'd22), .we(we), .clk(clk), .q(stored_a41));
	single_port_ram ram_a42(.data(a42), .addr(6'd23), .we(we), .clk(clk), .q(stored_a42));
	single_port_ram ram_a43(.data(a43), .addr(6'd24), .we(we), .clk(clk), .q(stored_a43));
	single_port_ram ram_a44(.data(a44), .addr(6'd25), .we(we), .clk(clk), .q(stored_a44));

	
	single_port_ram ram_b11(.data(b11), .addr(6'd26), .we(we), .clk(clk), .q(stored_b11));
	single_port_ram ram_b12(.data(b12), .addr(6'd27), .we(we), .clk(clk), .q(stored_b12));
	single_port_ram ram_b13(.data(b13), .addr(6'd28), .we(we), .clk(clk), .q(stored_b13));
	single_port_ram ram_b21(.data(b21), .addr(6'd29), .we(we), .clk(clk), .q(stored_b21));
	single_port_ram ram_b22(.data(b22), .addr(6'd30), .we(we), .clk(clk), .q(stored_b22));
	single_port_ram ram_b23(.data(b23), .addr(6'd31), .we(we), .clk(clk), .q(stored_b23));
	single_port_ram ram_b31(.data(b31), .addr(6'd32), .we(we), .clk(clk), .q(stored_b31));
	single_port_ram ram_b32(.data(b32), .addr(6'd33), .we(we), .clk(clk), .q(stored_b32));
	single_port_ram ram_b33(.data(b33), .addr(6'd34), .we(we), .clk(clk), .q(stored_b33));

	single_port_ram ram_PE_1(.data(out), .addr(6'd44), .we(we_pe_1), .clk(clk), .q(pe_c11));
	single_port_ram ram_PE_2(.data(out), .addr(6'd45), .we(we_pe_2), .clk(clk), .q(pe_c12));
	single_port_ram ram_PE_3(.data(out), .addr(6'd46), .we(we_pe_3), .clk(clk), .q(pe_c21));
	single_port_ram ram_PE_4(.data(out), .addr(6'd47), .we(we_pe_4), .clk(clk), .q(pe_c22));

	single_port_ram ram_SYS_1(.data(out), .addr(6'd48), .we(we_sys_1), .clk(clk), .q(sys_c11));
	single_port_ram ram_SYS_2(.data(out), .addr(6'd49), .we(we_sys_2), .clk(clk), .q(sys_c12));
	single_port_ram ram_SYS_3(.data(out), .addr(6'd50), .we(we_sys_3), .clk(clk), .q(sys_c21));
	single_port_ram ram_SYS_4(.data(out), .addr(6'd51), .we(we_sys_4), .clk(clk), .q(sys_c22));

	single_port_ram ram_CUS_1(.data(out), .addr(6'd52), .we(we_cus_1), .clk(clk), .q(cus_c11));
	single_port_ram ram_CUS_2(.data(out), .addr(6'd53), .we(we_cus_2), .clk(clk), .q(cus_c12));
	single_port_ram ram_CUS_3(.data(out), .addr(6'd54), .we(we_cus_3), .clk(clk), .q(cus_c21));
	single_port_ram ram_CUS_4(.data(out), .addr(6'd55), .we(we_cus_4), .clk(clk), .q(cus_c22));


endmodule


