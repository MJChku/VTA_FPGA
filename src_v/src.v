module VCR (
	clk,
	rst,
	io_host_aw_ready,
	io_host_aw_valid,
	io_host_aw_bits_addr,
	io_host_w_ready,
	io_host_w_valid,
	io_host_w_bits_data,
	io_host_b_ready,
	io_host_b_valid,
	io_host_ar_ready,
	io_host_ar_valid,
	io_host_ar_bits_addr,
	io_host_r_ready,
	io_host_r_valid,
	io_host_r_bits_data,
	io_vcr_launch,
	io_vcr_finish,
	io_vcr_ecnt_0_valid,
	io_vcr_ecnt_0_bits,
	io_vcr_vals_0,
	io_vcr_ptrs_0,
	io_vcr_ptrs_1,
	io_vcr_ptrs_2,
	io_vcr_ptrs_3,
	io_vcr_ptrs_4,
	io_vcr_ptrs_5,
	io_vcr_ucnt_0_valid,
	io_vcr_ucnt_0_bits
);
	input clk;
	input rst;
	output wire io_host_aw_ready;
	input io_host_aw_valid;
	input [15:0] io_host_aw_bits_addr;
	output wire io_host_w_ready;
	input io_host_w_valid;
	input [31:0] io_host_w_bits_data;
	input io_host_b_ready;
	output wire io_host_b_valid;
	output wire io_host_ar_ready;
	input io_host_ar_valid;
	input [15:0] io_host_ar_bits_addr;
	input io_host_r_ready;
	output wire io_host_r_valid;
	output wire [31:0] io_host_r_bits_data;
	output wire io_vcr_launch;
	input io_vcr_finish;
	input io_vcr_ecnt_0_valid;
	input [31:0] io_vcr_ecnt_0_bits;
	output wire [31:0] io_vcr_vals_0;
	output wire [63:0] io_vcr_ptrs_0;
	output wire [63:0] io_vcr_ptrs_1;
	output wire [63:0] io_vcr_ptrs_2;
	output wire [63:0] io_vcr_ptrs_3;
	output wire [63:0] io_vcr_ptrs_4;
	output wire [63:0] io_vcr_ptrs_5;
	input io_vcr_ucnt_0_valid;
	input [31:0] io_vcr_ucnt_0_bits;
	reg [15:0] waddr;
	reg [1:0] wstate;
	reg rstate;
	reg [31:0] rdata;
	reg [31:0] reg_0;
	reg [31:0] reg_1;
	reg [31:0] reg_2;
	reg [31:0] reg_3;
	reg [31:0] reg_4;
	reg [31:0] reg_5;
	reg [31:0] reg_6;
	reg [31:0] reg_7;
	reg [31:0] reg_8;
	reg [31:0] reg_9;
	reg [31:0] reg_10;
	reg [31:0] reg_11;
	reg [31:0] reg_12;
	reg [31:0] reg_13;
	reg [31:0] reg_14;
	reg [31:0] reg_15;
	wire [1:0] _GEN_2 = (io_host_b_ready ? 2'h0 : wstate);
	wire _T_3 = io_host_aw_ready & io_host_aw_valid;
	wire _GEN_7 = io_host_ar_valid | rstate;
	wire _T_6 = io_host_w_ready & io_host_w_valid;
	wire _T_51 = io_host_ar_ready & io_host_ar_valid;
	wire [31:0] _rdata_T_1 = (16'h0000 == io_host_ar_bits_addr ? reg_0 : 32'h00000000);
	wire [31:0] _rdata_T_3 = (16'h0004 == io_host_ar_bits_addr ? reg_1 : _rdata_T_1);
	wire [31:0] _rdata_T_5 = (16'h0008 == io_host_ar_bits_addr ? reg_2 : _rdata_T_3);
	wire [31:0] _rdata_T_7 = (16'h000c == io_host_ar_bits_addr ? reg_3 : _rdata_T_5);
	wire [31:0] _rdata_T_9 = (16'h0010 == io_host_ar_bits_addr ? reg_4 : _rdata_T_7);
	wire [31:0] _rdata_T_11 = (16'h0014 == io_host_ar_bits_addr ? reg_5 : _rdata_T_9);
	wire [31:0] _rdata_T_13 = (16'h0018 == io_host_ar_bits_addr ? reg_6 : _rdata_T_11);
	wire [31:0] _rdata_T_15 = (16'h001c == io_host_ar_bits_addr ? reg_7 : _rdata_T_13);
	wire [31:0] _rdata_T_17 = (16'h0020 == io_host_ar_bits_addr ? reg_8 : _rdata_T_15);
	wire [31:0] _rdata_T_19 = (16'h0024 == io_host_ar_bits_addr ? reg_9 : _rdata_T_17);
	wire [31:0] _rdata_T_21 = (16'h0028 == io_host_ar_bits_addr ? reg_10 : _rdata_T_19);
	wire [31:0] _rdata_T_23 = (16'h002c == io_host_ar_bits_addr ? reg_11 : _rdata_T_21);
	wire [31:0] _rdata_T_25 = (16'h0030 == io_host_ar_bits_addr ? reg_12 : _rdata_T_23);
	wire [31:0] _rdata_T_27 = (16'h0034 == io_host_ar_bits_addr ? reg_13 : _rdata_T_25);
	assign io_host_aw_ready = wstate == 2'h0;
	assign io_host_w_ready = wstate == 2'h1;
	assign io_host_b_valid = wstate == 2'h2;
	assign io_host_ar_ready = ~rstate;
	assign io_host_r_valid = rstate;
	assign io_host_r_bits_data = rdata;
	assign io_vcr_launch = reg_0[0];
	assign io_vcr_vals_0 = reg_2;
	assign io_vcr_ptrs_0 = {reg_4, reg_3};
	assign io_vcr_ptrs_1 = {reg_6, reg_5};
	assign io_vcr_ptrs_2 = {reg_8, reg_7};
	assign io_vcr_ptrs_3 = {reg_10, reg_9};
	assign io_vcr_ptrs_4 = {reg_12, reg_11};
	assign io_vcr_ptrs_5 = {reg_14, reg_13};
	always @(posedge clk) begin
		if (rst)
			waddr <= 16'hffff;
		else if (_T_3)
			waddr <= io_host_aw_bits_addr;
		if (rst)
			wstate <= 2'h0;
		else if (2'h0 == wstate) begin
			if (io_host_aw_valid)
				wstate <= 2'h1;
		end
		else if (2'h1 == wstate) begin
			if (io_host_w_valid)
				wstate <= 2'h2;
		end
		else if (2'h2 == wstate)
			wstate <= _GEN_2;
		if (rst)
			rstate <= 1'h0;
		else if (~rstate)
			rstate <= _GEN_7;
		else if (rstate) begin
			if (io_host_r_ready)
				rstate <= 1'h0;
		end
		if (rst)
			rdata <= 32'h00000000;
		else if (_T_51) begin
			if (16'h003c == io_host_ar_bits_addr)
				rdata <= reg_15;
			else if (16'h0038 == io_host_ar_bits_addr)
				rdata <= reg_14;
			else
				rdata <= _rdata_T_27;
		end
		if (rst)
			reg_0 <= 32'h00000000;
		else if (io_vcr_finish)
			reg_0 <= 32'h00000002;
		else if (_T_6 & (16'h0000 == waddr))
			reg_0 <= io_host_w_bits_data;
		if (rst)
			reg_1 <= 32'h00000000;
		else if (io_vcr_ecnt_0_valid)
			reg_1 <= io_vcr_ecnt_0_bits;
		else if (_T_6 & (16'h0004 == waddr))
			reg_1 <= io_host_w_bits_data;
		if (rst)
			reg_2 <= 32'h00000000;
		else if (_T_6 & (16'h0008 == waddr))
			reg_2 <= io_host_w_bits_data;
		if (rst)
			reg_3 <= 32'h00000000;
		else if (_T_6 & (16'h000c == waddr))
			reg_3 <= io_host_w_bits_data;
		if (rst)
			reg_4 <= 32'h00000000;
		else if (_T_6 & (16'h0010 == waddr))
			reg_4 <= io_host_w_bits_data;
		if (rst)
			reg_5 <= 32'h00000000;
		else if (_T_6 & (16'h0014 == waddr))
			reg_5 <= io_host_w_bits_data;
		if (rst)
			reg_6 <= 32'h00000000;
		else if (_T_6 & (16'h0018 == waddr))
			reg_6 <= io_host_w_bits_data;
		if (rst)
			reg_7 <= 32'h00000000;
		else if (_T_6 & (16'h001c == waddr))
			reg_7 <= io_host_w_bits_data;
		if (rst)
			reg_8 <= 32'h00000000;
		else if (_T_6 & (16'h0020 == waddr))
			reg_8 <= io_host_w_bits_data;
		if (rst)
			reg_9 <= 32'h00000000;
		else if (_T_6 & (16'h0024 == waddr))
			reg_9 <= io_host_w_bits_data;
		if (rst)
			reg_10 <= 32'h00000000;
		else if (_T_6 & (16'h0028 == waddr))
			reg_10 <= io_host_w_bits_data;
		if (rst)
			reg_11 <= 32'h00000000;
		else if (_T_6 & (16'h002c == waddr))
			reg_11 <= io_host_w_bits_data;
		if (rst)
			reg_12 <= 32'h00000000;
		else if (_T_6 & (16'h0030 == waddr))
			reg_12 <= io_host_w_bits_data;
		if (rst)
			reg_13 <= 32'h00000000;
		else if (_T_6 & (16'h0034 == waddr))
			reg_13 <= io_host_w_bits_data;
		if (rst)
			reg_14 <= 32'h00000000;
		else if (_T_6 & (16'h0038 == waddr))
			reg_14 <= io_host_w_bits_data;
		if (rst)
			reg_15 <= 32'h00000000;
		else if (io_vcr_ucnt_0_valid)
			reg_15 <= io_vcr_ucnt_0_bits;
		else if (_T_6 & (16'h003c == waddr))
			reg_15 <= io_host_w_bits_data;
	end
endmodule
module Queue (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_addr,
	io_enq_bits_len,
	io_enq_bits_tag,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_addr,
	io_deq_bits_len,
	io_deq_bits_tag
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [63:0] io_enq_bits_addr;
	input [7:0] io_enq_bits_len;
	input [20:0] io_enq_bits_tag;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [63:0] io_deq_bits_addr;
	output wire [7:0] io_deq_bits_len;
	output wire [20:0] io_deq_bits_tag;
	reg [63:0] ram_addr [0:0];
	wire ram_addr_io_deq_bits_MPORT_en;
	wire ram_addr_io_deq_bits_MPORT_addr;
	wire [63:0] ram_addr_io_deq_bits_MPORT_data;
	wire [63:0] ram_addr_MPORT_data;
	wire ram_addr_MPORT_addr;
	wire ram_addr_MPORT_mask;
	wire ram_addr_MPORT_en;
	reg [7:0] ram_len [0:0];
	wire ram_len_io_deq_bits_MPORT_en;
	wire ram_len_io_deq_bits_MPORT_addr;
	wire [7:0] ram_len_io_deq_bits_MPORT_data;
	wire [7:0] ram_len_MPORT_data;
	wire ram_len_MPORT_addr;
	wire ram_len_MPORT_mask;
	wire ram_len_MPORT_en;
	reg [20:0] ram_tag [0:0];
	wire ram_tag_io_deq_bits_MPORT_en;
	wire ram_tag_io_deq_bits_MPORT_addr;
	wire [20:0] ram_tag_io_deq_bits_MPORT_data;
	wire [20:0] ram_tag_MPORT_data;
	wire ram_tag_MPORT_addr;
	wire ram_tag_MPORT_mask;
	wire ram_tag_MPORT_en;
	reg maybe_full;
	wire empty = ~maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	wire do_deq = io_deq_ready & io_deq_valid;
	assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
	assign ram_addr_io_deq_bits_MPORT_addr = 1'h0;
	assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr];
	assign ram_addr_MPORT_data = io_enq_bits_addr;
	assign ram_addr_MPORT_addr = 1'h0;
	assign ram_addr_MPORT_mask = 1'h1;
	assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
	assign ram_len_io_deq_bits_MPORT_en = 1'h1;
	assign ram_len_io_deq_bits_MPORT_addr = 1'h0;
	assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr];
	assign ram_len_MPORT_data = io_enq_bits_len;
	assign ram_len_MPORT_addr = 1'h0;
	assign ram_len_MPORT_mask = 1'h1;
	assign ram_len_MPORT_en = io_enq_ready & io_enq_valid;
	assign ram_tag_io_deq_bits_MPORT_en = 1'h1;
	assign ram_tag_io_deq_bits_MPORT_addr = 1'h0;
	assign ram_tag_io_deq_bits_MPORT_data = ram_tag[ram_tag_io_deq_bits_MPORT_addr];
	assign ram_tag_MPORT_data = io_enq_bits_tag;
	assign ram_tag_MPORT_addr = 1'h0;
	assign ram_tag_MPORT_mask = 1'h1;
	assign ram_tag_MPORT_en = io_enq_ready & io_enq_valid;
	assign io_enq_ready = ~maybe_full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data;
	assign io_deq_bits_len = ram_len_io_deq_bits_MPORT_data;
	assign io_deq_bits_tag = ram_tag_io_deq_bits_MPORT_data;
	always @(posedge clk) begin
		if (ram_addr_MPORT_en & ram_addr_MPORT_mask)
			ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data;
		if (ram_len_MPORT_en & ram_len_MPORT_mask)
			ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data;
		if (ram_tag_MPORT_en & ram_tag_MPORT_mask)
			ram_tag[ram_tag_MPORT_addr] <= ram_tag_MPORT_data;
		if (rst)
			maybe_full <= 1'h0;
		else if (do_enq != do_deq)
			maybe_full <= do_enq;
	end
endmodule
module VME (
	clk,
	rst,
	io_mem_aw_ready,
	io_mem_aw_valid,
	io_mem_aw_bits_addr,
	io_mem_aw_bits_len,
	io_mem_w_ready,
	io_mem_w_valid,
	io_mem_w_bits_data,
	io_mem_w_bits_last,
	io_mem_b_ready,
	io_mem_b_valid,
	io_mem_ar_ready,
	io_mem_ar_valid,
	io_mem_ar_bits_addr,
	io_mem_ar_bits_id,
	io_mem_ar_bits_len,
	io_mem_r_valid,
	io_mem_r_bits_data,
	io_mem_r_bits_last,
	io_mem_r_bits_id,
	io_vme_rd_0_cmd_ready,
	io_vme_rd_0_cmd_valid,
	io_vme_rd_0_cmd_bits_addr,
	io_vme_rd_0_cmd_bits_len,
	io_vme_rd_0_data_ready,
	io_vme_rd_0_data_valid,
	io_vme_rd_0_data_bits_data,
	io_vme_rd_1_cmd_ready,
	io_vme_rd_1_cmd_valid,
	io_vme_rd_1_cmd_bits_addr,
	io_vme_rd_1_cmd_bits_len,
	io_vme_rd_1_cmd_bits_tag,
	io_vme_rd_1_data_valid,
	io_vme_rd_1_data_bits_data,
	io_vme_rd_1_data_bits_tag,
	io_vme_rd_1_data_bits_last,
	io_vme_rd_2_cmd_ready,
	io_vme_rd_2_cmd_valid,
	io_vme_rd_2_cmd_bits_addr,
	io_vme_rd_2_cmd_bits_len,
	io_vme_rd_2_cmd_bits_tag,
	io_vme_rd_2_data_valid,
	io_vme_rd_2_data_bits_data,
	io_vme_rd_2_data_bits_tag,
	io_vme_rd_3_cmd_ready,
	io_vme_rd_3_cmd_valid,
	io_vme_rd_3_cmd_bits_addr,
	io_vme_rd_3_cmd_bits_len,
	io_vme_rd_3_cmd_bits_tag,
	io_vme_rd_3_data_valid,
	io_vme_rd_3_data_bits_data,
	io_vme_rd_3_data_bits_tag,
	io_vme_rd_4_cmd_ready,
	io_vme_rd_4_cmd_valid,
	io_vme_rd_4_cmd_bits_addr,
	io_vme_rd_4_cmd_bits_len,
	io_vme_rd_4_cmd_bits_tag,
	io_vme_rd_4_data_valid,
	io_vme_rd_4_data_bits_data,
	io_vme_rd_4_data_bits_tag,
	io_vme_wr_0_cmd_ready,
	io_vme_wr_0_cmd_valid,
	io_vme_wr_0_cmd_bits_addr,
	io_vme_wr_0_cmd_bits_len,
	io_vme_wr_0_data_ready,
	io_vme_wr_0_data_valid,
	io_vme_wr_0_data_bits_data,
	io_vme_wr_0_ack
);
	input clk;
	input rst;
	input io_mem_aw_ready;
	output wire io_mem_aw_valid;
	output wire [63:0] io_mem_aw_bits_addr;
	output wire [7:0] io_mem_aw_bits_len;
	input io_mem_w_ready;
	output wire io_mem_w_valid;
	output wire [63:0] io_mem_w_bits_data;
	output wire io_mem_w_bits_last;
	output wire io_mem_b_ready;
	input io_mem_b_valid;
	input io_mem_ar_ready;
	output wire io_mem_ar_valid;
	output wire [63:0] io_mem_ar_bits_addr;
	output wire [7:0] io_mem_ar_bits_id;
	output wire [7:0] io_mem_ar_bits_len;
	input io_mem_r_valid;
	input [63:0] io_mem_r_bits_data;
	input io_mem_r_bits_last;
	input [7:0] io_mem_r_bits_id;
	output wire io_vme_rd_0_cmd_ready;
	input io_vme_rd_0_cmd_valid;
	input [63:0] io_vme_rd_0_cmd_bits_addr;
	input [7:0] io_vme_rd_0_cmd_bits_len;
	input io_vme_rd_0_data_ready;
	output wire io_vme_rd_0_data_valid;
	output wire [63:0] io_vme_rd_0_data_bits_data;
	output wire io_vme_rd_1_cmd_ready;
	input io_vme_rd_1_cmd_valid;
	input [63:0] io_vme_rd_1_cmd_bits_addr;
	input [7:0] io_vme_rd_1_cmd_bits_len;
	input [20:0] io_vme_rd_1_cmd_bits_tag;
	output wire io_vme_rd_1_data_valid;
	output wire [63:0] io_vme_rd_1_data_bits_data;
	output wire [20:0] io_vme_rd_1_data_bits_tag;
	output wire io_vme_rd_1_data_bits_last;
	output wire io_vme_rd_2_cmd_ready;
	input io_vme_rd_2_cmd_valid;
	input [63:0] io_vme_rd_2_cmd_bits_addr;
	input [7:0] io_vme_rd_2_cmd_bits_len;
	input [20:0] io_vme_rd_2_cmd_bits_tag;
	output wire io_vme_rd_2_data_valid;
	output wire [63:0] io_vme_rd_2_data_bits_data;
	output wire [20:0] io_vme_rd_2_data_bits_tag;
	output wire io_vme_rd_3_cmd_ready;
	input io_vme_rd_3_cmd_valid;
	input [63:0] io_vme_rd_3_cmd_bits_addr;
	input [7:0] io_vme_rd_3_cmd_bits_len;
	input [20:0] io_vme_rd_3_cmd_bits_tag;
	output wire io_vme_rd_3_data_valid;
	output wire [63:0] io_vme_rd_3_data_bits_data;
	output wire [20:0] io_vme_rd_3_data_bits_tag;
	output wire io_vme_rd_4_cmd_ready;
	input io_vme_rd_4_cmd_valid;
	input [63:0] io_vme_rd_4_cmd_bits_addr;
	input [7:0] io_vme_rd_4_cmd_bits_len;
	input [20:0] io_vme_rd_4_cmd_bits_tag;
	output wire io_vme_rd_4_data_valid;
	output wire [63:0] io_vme_rd_4_data_bits_data;
	output wire [20:0] io_vme_rd_4_data_bits_tag;
	output wire io_vme_wr_0_cmd_ready;
	input io_vme_wr_0_cmd_valid;
	input [63:0] io_vme_wr_0_cmd_bits_addr;
	input [7:0] io_vme_wr_0_cmd_bits_len;
	output wire io_vme_wr_0_data_ready;
	input io_vme_wr_0_data_valid;
	input [63:0] io_vme_wr_0_data_bits_data;
	output wire io_vme_wr_0_ack;
	reg [2:0] vmeTag_array_client_id [0:15];
	wire vmeTag_array_client_id_localTag_out_MPORT_en;
	wire [3:0] vmeTag_array_client_id_localTag_out_MPORT_addr;
	wire [2:0] vmeTag_array_client_id_localTag_out_MPORT_data;
	wire [2:0] vmeTag_array_client_id_rdwrPort_data;
	wire [3:0] vmeTag_array_client_id_rdwrPort_addr;
	wire vmeTag_array_client_id_rdwrPort_mask;
	wire vmeTag_array_client_id_rdwrPort_en;
	reg vmeTag_array_client_id_localTag_out_MPORT_en_pipe_0;
	reg [3:0] vmeTag_array_client_id_localTag_out_MPORT_addr_pipe_0;
	reg [20:0] vmeTag_array_client_tag [0:15];
	wire vmeTag_array_client_tag_localTag_out_MPORT_en;
	wire [3:0] vmeTag_array_client_tag_localTag_out_MPORT_addr;
	wire [20:0] vmeTag_array_client_tag_localTag_out_MPORT_data;
	wire [20:0] vmeTag_array_client_tag_rdwrPort_data;
	wire [3:0] vmeTag_array_client_tag_rdwrPort_addr;
	wire vmeTag_array_client_tag_rdwrPort_mask;
	wire vmeTag_array_client_tag_rdwrPort_en;
	reg vmeTag_array_client_tag_localTag_out_MPORT_en_pipe_0;
	reg [3:0] vmeTag_array_client_tag_localTag_out_MPORT_addr_pipe_0;
	wire VMEcmd_Qs_0_clock;
	wire VMEcmd_Qs_0_reset;
	wire VMEcmd_Qs_0_io_enq_ready;
	wire VMEcmd_Qs_0_io_enq_valid;
	wire [63:0] VMEcmd_Qs_0_io_enq_bits_addr;
	wire [7:0] VMEcmd_Qs_0_io_enq_bits_len;
	wire [20:0] VMEcmd_Qs_0_io_enq_bits_tag;
	wire VMEcmd_Qs_0_io_deq_ready;
	wire VMEcmd_Qs_0_io_deq_valid;
	wire [63:0] VMEcmd_Qs_0_io_deq_bits_addr;
	wire [7:0] VMEcmd_Qs_0_io_deq_bits_len;
	wire [20:0] VMEcmd_Qs_0_io_deq_bits_tag;
	wire VMEcmd_Qs_1_clock;
	wire VMEcmd_Qs_1_reset;
	wire VMEcmd_Qs_1_io_enq_ready;
	wire VMEcmd_Qs_1_io_enq_valid;
	wire [63:0] VMEcmd_Qs_1_io_enq_bits_addr;
	wire [7:0] VMEcmd_Qs_1_io_enq_bits_len;
	wire [20:0] VMEcmd_Qs_1_io_enq_bits_tag;
	wire VMEcmd_Qs_1_io_deq_ready;
	wire VMEcmd_Qs_1_io_deq_valid;
	wire [63:0] VMEcmd_Qs_1_io_deq_bits_addr;
	wire [7:0] VMEcmd_Qs_1_io_deq_bits_len;
	wire [20:0] VMEcmd_Qs_1_io_deq_bits_tag;
	wire VMEcmd_Qs_2_clock;
	wire VMEcmd_Qs_2_reset;
	wire VMEcmd_Qs_2_io_enq_ready;
	wire VMEcmd_Qs_2_io_enq_valid;
	wire [63:0] VMEcmd_Qs_2_io_enq_bits_addr;
	wire [7:0] VMEcmd_Qs_2_io_enq_bits_len;
	wire [20:0] VMEcmd_Qs_2_io_enq_bits_tag;
	wire VMEcmd_Qs_2_io_deq_ready;
	wire VMEcmd_Qs_2_io_deq_valid;
	wire [63:0] VMEcmd_Qs_2_io_deq_bits_addr;
	wire [7:0] VMEcmd_Qs_2_io_deq_bits_len;
	wire [20:0] VMEcmd_Qs_2_io_deq_bits_tag;
	wire VMEcmd_Qs_3_clock;
	wire VMEcmd_Qs_3_reset;
	wire VMEcmd_Qs_3_io_enq_ready;
	wire VMEcmd_Qs_3_io_enq_valid;
	wire [63:0] VMEcmd_Qs_3_io_enq_bits_addr;
	wire [7:0] VMEcmd_Qs_3_io_enq_bits_len;
	wire [20:0] VMEcmd_Qs_3_io_enq_bits_tag;
	wire VMEcmd_Qs_3_io_deq_ready;
	wire VMEcmd_Qs_3_io_deq_valid;
	wire [63:0] VMEcmd_Qs_3_io_deq_bits_addr;
	wire [7:0] VMEcmd_Qs_3_io_deq_bits_len;
	wire [20:0] VMEcmd_Qs_3_io_deq_bits_tag;
	wire VMEcmd_Qs_4_clock;
	wire VMEcmd_Qs_4_reset;
	wire VMEcmd_Qs_4_io_enq_ready;
	wire VMEcmd_Qs_4_io_enq_valid;
	wire [63:0] VMEcmd_Qs_4_io_enq_bits_addr;
	wire [7:0] VMEcmd_Qs_4_io_enq_bits_len;
	wire [20:0] VMEcmd_Qs_4_io_enq_bits_tag;
	wire VMEcmd_Qs_4_io_deq_ready;
	wire VMEcmd_Qs_4_io_deq_valid;
	wire [63:0] VMEcmd_Qs_4_io_deq_bits_addr;
	wire [7:0] VMEcmd_Qs_4_io_deq_bits_len;
	wire [20:0] VMEcmd_Qs_4_io_deq_bits_tag;
	reg [15:0] availableEntries;
	wire oneHotIdx_0 = availableEntries[0];
	wire oneHotIdx_1 = availableEntries[1] & ~(|oneHotIdx_0);
	wire oneHotIdx_2 = availableEntries[2] & ~(|availableEntries[1:0]);
	wire oneHotIdx_3 = availableEntries[3] & ~(|availableEntries[2:0]);
	wire oneHotIdx_4 = availableEntries[4] & ~(|availableEntries[3:0]);
	wire oneHotIdx_5 = availableEntries[5] & ~(|availableEntries[4:0]);
	wire oneHotIdx_6 = availableEntries[6] & ~(|availableEntries[5:0]);
	wire oneHotIdx_7 = availableEntries[7] & ~(|availableEntries[6:0]);
	wire oneHotIdx_8 = availableEntries[8] & ~(|availableEntries[7:0]);
	wire oneHotIdx_9 = availableEntries[9] & ~(|availableEntries[8:0]);
	wire oneHotIdx_10 = availableEntries[10] & ~(|availableEntries[9:0]);
	wire oneHotIdx_11 = availableEntries[11] & ~(|availableEntries[10:0]);
	wire oneHotIdx_12 = availableEntries[12] & ~(|availableEntries[11:0]);
	wire oneHotIdx_13 = availableEntries[13] & ~(|availableEntries[12:0]);
	wire oneHotIdx_14 = availableEntries[14] & ~(|availableEntries[13:0]);
	wire oneHotIdx_15 = availableEntries[15] & ~(|availableEntries[14:0]);
	wire [7:0] oHot_lo = {oneHotIdx_7, oneHotIdx_6, oneHotIdx_5, oneHotIdx_4, oneHotIdx_3, oneHotIdx_2, oneHotIdx_1, oneHotIdx_0};
	wire [15:0] resetEntry = {oneHotIdx_15, oneHotIdx_14, oneHotIdx_13, oneHotIdx_12, oneHotIdx_11, oneHotIdx_10, oneHotIdx_9, oneHotIdx_8, oHot_lo};
	wire [15:0] _newVec_T = ~resetEntry;
	wire [15:0] newEntry = availableEntries & _newVec_T;
	wire [3:0] _bitPostn_T = (oneHotIdx_14 ? 4'he : 4'hf);
	wire [3:0] _bitPostn_T_1 = (oneHotIdx_13 ? 4'hd : _bitPostn_T);
	wire [3:0] _bitPostn_T_2 = (oneHotIdx_12 ? 4'hc : _bitPostn_T_1);
	wire [3:0] _bitPostn_T_3 = (oneHotIdx_11 ? 4'hb : _bitPostn_T_2);
	wire [3:0] _bitPostn_T_4 = (oneHotIdx_10 ? 4'ha : _bitPostn_T_3);
	wire [3:0] _bitPostn_T_5 = (oneHotIdx_9 ? 4'h9 : _bitPostn_T_4);
	wire [3:0] _bitPostn_T_6 = (oneHotIdx_8 ? 4'h8 : _bitPostn_T_5);
	wire [3:0] _bitPostn_T_7 = (oneHotIdx_7 ? 4'h7 : _bitPostn_T_6);
	wire [3:0] _bitPostn_T_8 = (oneHotIdx_6 ? 4'h6 : _bitPostn_T_7);
	wire [3:0] _bitPostn_T_9 = (oneHotIdx_5 ? 4'h5 : _bitPostn_T_8);
	wire [3:0] _bitPostn_T_10 = (oneHotIdx_4 ? 4'h4 : _bitPostn_T_9);
	wire [3:0] _bitPostn_T_11 = (oneHotIdx_3 ? 4'h3 : _bitPostn_T_10);
	wire [3:0] _bitPostn_T_12 = (oneHotIdx_2 ? 4'h2 : _bitPostn_T_11);
	wire [3:0] _bitPostn_T_13 = (oneHotIdx_1 ? 4'h1 : _bitPostn_T_12);
	wire [3:0] firstPostn = (oneHotIdx_0 ? 4'h0 : _bitPostn_T_13);
	wire _T = io_mem_r_bits_last & io_mem_r_valid;
	wire [7:0] updateEntry_lo = {8'h07 == io_mem_r_bits_id, 8'h06 == io_mem_r_bits_id, 8'h05 == io_mem_r_bits_id, 8'h04 == io_mem_r_bits_id, 8'h03 == io_mem_r_bits_id, 8'h02 == io_mem_r_bits_id, 8'h01 == io_mem_r_bits_id, 8'h00 == io_mem_r_bits_id};
	wire [15:0] _updateEntry_T_16 = {8'h0f == io_mem_r_bits_id, 8'h0e == io_mem_r_bits_id, 8'h0d == io_mem_r_bits_id, 8'h0c == io_mem_r_bits_id, 8'h0b == io_mem_r_bits_id, 8'h0a == io_mem_r_bits_id, 8'h09 == io_mem_r_bits_id, 8'h08 == io_mem_r_bits_id, updateEntry_lo};
	wire [15:0] updateEntry = (rst ? 16'h0000 : _updateEntry_T_16);
	wire [15:0] _availableEntriesNext_T = updateEntry | availableEntries;
	wire _T_1 = availableEntries != 16'h0000;
	wire any_cmd_valid = (((VMEcmd_Qs_0_io_deq_valid | VMEcmd_Qs_1_io_deq_valid) | VMEcmd_Qs_2_io_deq_valid) | VMEcmd_Qs_3_io_deq_valid) | VMEcmd_Qs_4_io_deq_valid;
	wire availableEntriesEn = io_mem_ar_ready & any_cmd_valid;
	wire _T_4 = ~_T;
	wire [2:0] _vme_select_T = (VMEcmd_Qs_4_io_deq_valid ? 3'h4 : 3'h5);
	wire [2:0] _vme_select_T_1 = (VMEcmd_Qs_3_io_deq_valid ? 3'h3 : _vme_select_T);
	wire [2:0] _vme_select_T_2 = (VMEcmd_Qs_2_io_deq_valid ? 3'h2 : _vme_select_T_1);
	wire [2:0] _vme_select_T_3 = (VMEcmd_Qs_1_io_deq_valid ? 3'h1 : _vme_select_T_2);
	wire [2:0] vme_select = (VMEcmd_Qs_0_io_deq_valid ? 3'h0 : _vme_select_T_3);
	wire _VMEcmd_Qs_0_io_deq_ready_T = vme_select == 3'h0;
	wire _VMEcmd_Qs_0_io_deq_ready_T_1 = io_mem_ar_ready & _VMEcmd_Qs_0_io_deq_ready_T;
	wire _VMEcmd_Qs_1_io_deq_ready_T = vme_select == 3'h1;
	wire _VMEcmd_Qs_1_io_deq_ready_T_1 = io_mem_ar_ready & _VMEcmd_Qs_1_io_deq_ready_T;
	wire _VMEcmd_Qs_2_io_deq_ready_T = vme_select == 3'h2;
	wire _VMEcmd_Qs_2_io_deq_ready_T_1 = io_mem_ar_ready & _VMEcmd_Qs_2_io_deq_ready_T;
	wire _VMEcmd_Qs_3_io_deq_ready_T = vme_select == 3'h3;
	wire _VMEcmd_Qs_3_io_deq_ready_T_1 = io_mem_ar_ready & _VMEcmd_Qs_3_io_deq_ready_T;
	wire _VMEcmd_Qs_4_io_deq_ready_T = vme_select == 3'h4;
	wire _VMEcmd_Qs_4_io_deq_ready_T_1 = io_mem_ar_ready & _VMEcmd_Qs_4_io_deq_ready_T;
	wire _any_cmd_ready_T_3 = ((VMEcmd_Qs_0_io_deq_ready | VMEcmd_Qs_1_io_deq_ready) | VMEcmd_Qs_2_io_deq_ready) | VMEcmd_Qs_3_io_deq_ready;
	wire [20:0] _GEN_16 = (VMEcmd_Qs_4_io_deq_ready ? VMEcmd_Qs_4_io_deq_bits_tag : 21'h000000);
	wire [20:0] _GEN_23 = (VMEcmd_Qs_3_io_deq_ready ? VMEcmd_Qs_3_io_deq_bits_tag : _GEN_16);
	wire [20:0] _GEN_30 = (VMEcmd_Qs_2_io_deq_ready ? VMEcmd_Qs_2_io_deq_bits_tag : _GEN_23);
	wire [20:0] _GEN_37 = (VMEcmd_Qs_1_io_deq_ready ? VMEcmd_Qs_1_io_deq_bits_tag : _GEN_30);
	wire [2:0] _GEN_15 = (VMEcmd_Qs_4_io_deq_ready ? 3'h4 : 3'h0);
	wire [2:0] _GEN_22 = (VMEcmd_Qs_3_io_deq_ready ? 3'h3 : _GEN_15);
	wire [2:0] _GEN_29 = (VMEcmd_Qs_2_io_deq_ready ? 3'h2 : _GEN_22);
	wire [2:0] _GEN_36 = (VMEcmd_Qs_1_io_deq_ready ? 3'h1 : _GEN_29);
	wire [63:0] _GEN_11 = (VMEcmd_Qs_4_io_deq_ready ? VMEcmd_Qs_4_io_deq_bits_addr : 64'h0000000000000000);
	wire [7:0] _GEN_12 = (VMEcmd_Qs_4_io_deq_ready ? VMEcmd_Qs_4_io_deq_bits_len : 8'h00);
	wire _GEN_13 = VMEcmd_Qs_4_io_deq_ready & VMEcmd_Qs_4_io_deq_valid;
	wire [3:0] _GEN_14 = (VMEcmd_Qs_4_io_deq_ready ? firstPostn : 4'h0);
	wire [63:0] _GEN_18 = (VMEcmd_Qs_3_io_deq_ready ? VMEcmd_Qs_3_io_deq_bits_addr : _GEN_11);
	wire [7:0] _GEN_19 = (VMEcmd_Qs_3_io_deq_ready ? VMEcmd_Qs_3_io_deq_bits_len : _GEN_12);
	wire _GEN_20 = (VMEcmd_Qs_3_io_deq_ready ? VMEcmd_Qs_3_io_deq_valid : _GEN_13);
	wire [3:0] _GEN_21 = (VMEcmd_Qs_3_io_deq_ready ? firstPostn : _GEN_14);
	wire [63:0] _GEN_25 = (VMEcmd_Qs_2_io_deq_ready ? VMEcmd_Qs_2_io_deq_bits_addr : _GEN_18);
	wire [7:0] _GEN_26 = (VMEcmd_Qs_2_io_deq_ready ? VMEcmd_Qs_2_io_deq_bits_len : _GEN_19);
	wire _GEN_27 = (VMEcmd_Qs_2_io_deq_ready ? VMEcmd_Qs_2_io_deq_valid : _GEN_20);
	wire [3:0] _GEN_28 = (VMEcmd_Qs_2_io_deq_ready ? firstPostn : _GEN_21);
	wire [63:0] _GEN_32 = (VMEcmd_Qs_1_io_deq_ready ? VMEcmd_Qs_1_io_deq_bits_addr : _GEN_25);
	wire [7:0] _GEN_33 = (VMEcmd_Qs_1_io_deq_ready ? VMEcmd_Qs_1_io_deq_bits_len : _GEN_26);
	wire _GEN_34 = (VMEcmd_Qs_1_io_deq_ready ? VMEcmd_Qs_1_io_deq_valid : _GEN_27);
	wire [3:0] _GEN_35 = (VMEcmd_Qs_1_io_deq_ready ? firstPostn : _GEN_28);
	wire [3:0] _GEN_42 = (VMEcmd_Qs_0_io_deq_ready ? firstPostn : _GEN_35);
	reg io_vme_rd_0_data_valid_REG;
	wire [2:0] localTag_out_client_id = vmeTag_array_client_id_localTag_out_MPORT_data;
	wire _io_vme_rd_0_data_valid_T_1 = io_vme_rd_0_data_valid_REG & (localTag_out_client_id == 3'h0);
	reg [63:0] io_vme_rd_0_data_bits_data_REG;
	reg io_vme_rd_1_data_valid_REG;
	reg [63:0] io_vme_rd_1_data_bits_data_REG;
	reg io_vme_rd_1_data_bits_last_REG;
	reg io_vme_rd_2_data_valid_REG;
	reg [63:0] io_vme_rd_2_data_bits_data_REG;
	reg io_vme_rd_3_data_valid_REG;
	reg [63:0] io_vme_rd_3_data_bits_data_REG;
	reg io_vme_rd_4_data_valid_REG;
	reg [63:0] io_vme_rd_4_data_bits_data_REG;
	reg [7:0] wr_len;
	reg [63:0] wr_addr;
	reg [1:0] wstate;
	reg [7:0] wr_cnt;
	wire _io_vme_wr_0_cmd_ready_T = wstate == 2'h0;
	wire _io_vme_wr_0_data_ready_T = wstate == 2'h2;
	wire _io_mem_w_bits_last_T = wr_cnt == wr_len;
	wire _T_32 = io_vme_wr_0_cmd_ready & io_vme_wr_0_cmd_valid;
	wire _T_34 = io_mem_w_ready & io_mem_w_valid;
	wire [7:0] _wr_cnt_T_1 = wr_cnt + 8'h01;
	wire [1:0] _GEN_52 = ((io_vme_wr_0_data_valid & io_mem_w_ready) & _io_mem_w_bits_last_T ? 2'h3 : wstate);
	wire [1:0] _GEN_53 = (io_mem_b_valid ? 2'h0 : wstate);
	wire [1:0] _GEN_54 = (2'h3 == wstate ? _GEN_53 : wstate);
	Queue VMEcmd_Qs_0(
		.clk(VMEcmd_Qs_0_clock),
		.rst(VMEcmd_Qs_0_reset),
		.io_enq_ready(VMEcmd_Qs_0_io_enq_ready),
		.io_enq_valid(VMEcmd_Qs_0_io_enq_valid),
		.io_enq_bits_addr(VMEcmd_Qs_0_io_enq_bits_addr),
		.io_enq_bits_len(VMEcmd_Qs_0_io_enq_bits_len),
		.io_enq_bits_tag(VMEcmd_Qs_0_io_enq_bits_tag),
		.io_deq_ready(VMEcmd_Qs_0_io_deq_ready),
		.io_deq_valid(VMEcmd_Qs_0_io_deq_valid),
		.io_deq_bits_addr(VMEcmd_Qs_0_io_deq_bits_addr),
		.io_deq_bits_len(VMEcmd_Qs_0_io_deq_bits_len),
		.io_deq_bits_tag(VMEcmd_Qs_0_io_deq_bits_tag)
	);
	Queue VMEcmd_Qs_1(
		.clk(VMEcmd_Qs_1_clock),
		.rst(VMEcmd_Qs_1_reset),
		.io_enq_ready(VMEcmd_Qs_1_io_enq_ready),
		.io_enq_valid(VMEcmd_Qs_1_io_enq_valid),
		.io_enq_bits_addr(VMEcmd_Qs_1_io_enq_bits_addr),
		.io_enq_bits_len(VMEcmd_Qs_1_io_enq_bits_len),
		.io_enq_bits_tag(VMEcmd_Qs_1_io_enq_bits_tag),
		.io_deq_ready(VMEcmd_Qs_1_io_deq_ready),
		.io_deq_valid(VMEcmd_Qs_1_io_deq_valid),
		.io_deq_bits_addr(VMEcmd_Qs_1_io_deq_bits_addr),
		.io_deq_bits_len(VMEcmd_Qs_1_io_deq_bits_len),
		.io_deq_bits_tag(VMEcmd_Qs_1_io_deq_bits_tag)
	);
	Queue VMEcmd_Qs_2(
		.clk(VMEcmd_Qs_2_clock),
		.rst(VMEcmd_Qs_2_reset),
		.io_enq_ready(VMEcmd_Qs_2_io_enq_ready),
		.io_enq_valid(VMEcmd_Qs_2_io_enq_valid),
		.io_enq_bits_addr(VMEcmd_Qs_2_io_enq_bits_addr),
		.io_enq_bits_len(VMEcmd_Qs_2_io_enq_bits_len),
		.io_enq_bits_tag(VMEcmd_Qs_2_io_enq_bits_tag),
		.io_deq_ready(VMEcmd_Qs_2_io_deq_ready),
		.io_deq_valid(VMEcmd_Qs_2_io_deq_valid),
		.io_deq_bits_addr(VMEcmd_Qs_2_io_deq_bits_addr),
		.io_deq_bits_len(VMEcmd_Qs_2_io_deq_bits_len),
		.io_deq_bits_tag(VMEcmd_Qs_2_io_deq_bits_tag)
	);
	Queue VMEcmd_Qs_3(
		.clk(VMEcmd_Qs_3_clock),
		.rst(VMEcmd_Qs_3_reset),
		.io_enq_ready(VMEcmd_Qs_3_io_enq_ready),
		.io_enq_valid(VMEcmd_Qs_3_io_enq_valid),
		.io_enq_bits_addr(VMEcmd_Qs_3_io_enq_bits_addr),
		.io_enq_bits_len(VMEcmd_Qs_3_io_enq_bits_len),
		.io_enq_bits_tag(VMEcmd_Qs_3_io_enq_bits_tag),
		.io_deq_ready(VMEcmd_Qs_3_io_deq_ready),
		.io_deq_valid(VMEcmd_Qs_3_io_deq_valid),
		.io_deq_bits_addr(VMEcmd_Qs_3_io_deq_bits_addr),
		.io_deq_bits_len(VMEcmd_Qs_3_io_deq_bits_len),
		.io_deq_bits_tag(VMEcmd_Qs_3_io_deq_bits_tag)
	);
	Queue VMEcmd_Qs_4(
		.clk(VMEcmd_Qs_4_clock),
		.rst(VMEcmd_Qs_4_reset),
		.io_enq_ready(VMEcmd_Qs_4_io_enq_ready),
		.io_enq_valid(VMEcmd_Qs_4_io_enq_valid),
		.io_enq_bits_addr(VMEcmd_Qs_4_io_enq_bits_addr),
		.io_enq_bits_len(VMEcmd_Qs_4_io_enq_bits_len),
		.io_enq_bits_tag(VMEcmd_Qs_4_io_enq_bits_tag),
		.io_deq_ready(VMEcmd_Qs_4_io_deq_ready),
		.io_deq_valid(VMEcmd_Qs_4_io_deq_valid),
		.io_deq_bits_addr(VMEcmd_Qs_4_io_deq_bits_addr),
		.io_deq_bits_len(VMEcmd_Qs_4_io_deq_bits_len),
		.io_deq_bits_tag(VMEcmd_Qs_4_io_deq_bits_tag)
	);
	assign vmeTag_array_client_id_localTag_out_MPORT_en = vmeTag_array_client_id_localTag_out_MPORT_en_pipe_0;
	assign vmeTag_array_client_id_localTag_out_MPORT_addr = vmeTag_array_client_id_localTag_out_MPORT_addr_pipe_0;
	assign vmeTag_array_client_id_localTag_out_MPORT_data = vmeTag_array_client_id[vmeTag_array_client_id_localTag_out_MPORT_addr];
	assign vmeTag_array_client_id_rdwrPort_data = (VMEcmd_Qs_0_io_deq_ready ? 3'h0 : _GEN_36);
	assign vmeTag_array_client_id_rdwrPort_addr = (oneHotIdx_0 ? 4'h0 : _bitPostn_T_13);
	assign vmeTag_array_client_id_rdwrPort_mask = 1'h1;
	assign vmeTag_array_client_id_rdwrPort_en = _any_cmd_ready_T_3 | VMEcmd_Qs_4_io_deq_ready;
	assign vmeTag_array_client_tag_localTag_out_MPORT_en = vmeTag_array_client_tag_localTag_out_MPORT_en_pipe_0;
	assign vmeTag_array_client_tag_localTag_out_MPORT_addr = vmeTag_array_client_tag_localTag_out_MPORT_addr_pipe_0;
	assign vmeTag_array_client_tag_localTag_out_MPORT_data = vmeTag_array_client_tag[vmeTag_array_client_tag_localTag_out_MPORT_addr];
	assign vmeTag_array_client_tag_rdwrPort_data = (VMEcmd_Qs_0_io_deq_ready ? VMEcmd_Qs_0_io_deq_bits_tag : _GEN_37);
	assign vmeTag_array_client_tag_rdwrPort_addr = (oneHotIdx_0 ? 4'h0 : _bitPostn_T_13);
	assign vmeTag_array_client_tag_rdwrPort_mask = 1'h1;
	assign vmeTag_array_client_tag_rdwrPort_en = _any_cmd_ready_T_3 | VMEcmd_Qs_4_io_deq_ready;
	assign io_mem_aw_valid = wstate == 2'h1;
	assign io_mem_aw_bits_addr = wr_addr;
	assign io_mem_aw_bits_len = wr_len;
	assign io_mem_w_valid = _io_vme_wr_0_data_ready_T & io_vme_wr_0_data_valid;
	assign io_mem_w_bits_data = io_vme_wr_0_data_bits_data;
	assign io_mem_w_bits_last = wr_cnt == wr_len;
	assign io_mem_b_ready = wstate == 2'h3;
	assign io_mem_ar_valid = (VMEcmd_Qs_0_io_deq_ready ? VMEcmd_Qs_0_io_deq_valid : _GEN_34);
	assign io_mem_ar_bits_addr = (VMEcmd_Qs_0_io_deq_ready ? VMEcmd_Qs_0_io_deq_bits_addr : _GEN_32);
	assign io_mem_ar_bits_id = {4'd0, _GEN_42};
	assign io_mem_ar_bits_len = (VMEcmd_Qs_0_io_deq_ready ? VMEcmd_Qs_0_io_deq_bits_len : _GEN_33);
	assign io_vme_rd_0_cmd_ready = VMEcmd_Qs_0_io_enq_ready;
	assign io_vme_rd_0_data_valid = _io_vme_rd_0_data_valid_T_1 & io_vme_rd_0_data_ready;
	assign io_vme_rd_0_data_bits_data = io_vme_rd_0_data_bits_data_REG;
	assign io_vme_rd_1_cmd_ready = VMEcmd_Qs_1_io_enq_ready;
	assign io_vme_rd_1_data_valid = io_vme_rd_1_data_valid_REG & (localTag_out_client_id == 3'h1);
	assign io_vme_rd_1_data_bits_data = io_vme_rd_1_data_bits_data_REG;
	assign io_vme_rd_1_data_bits_tag = vmeTag_array_client_tag_localTag_out_MPORT_data;
	assign io_vme_rd_1_data_bits_last = io_vme_rd_1_data_bits_last_REG;
	assign io_vme_rd_2_cmd_ready = VMEcmd_Qs_2_io_enq_ready;
	assign io_vme_rd_2_data_valid = io_vme_rd_2_data_valid_REG & (localTag_out_client_id == 3'h2);
	assign io_vme_rd_2_data_bits_data = io_vme_rd_2_data_bits_data_REG;
	assign io_vme_rd_2_data_bits_tag = vmeTag_array_client_tag_localTag_out_MPORT_data;
	assign io_vme_rd_3_cmd_ready = VMEcmd_Qs_3_io_enq_ready;
	assign io_vme_rd_3_data_valid = io_vme_rd_3_data_valid_REG & (localTag_out_client_id == 3'h3);
	assign io_vme_rd_3_data_bits_data = io_vme_rd_3_data_bits_data_REG;
	assign io_vme_rd_3_data_bits_tag = vmeTag_array_client_tag_localTag_out_MPORT_data;
	assign io_vme_rd_4_cmd_ready = VMEcmd_Qs_4_io_enq_ready;
	assign io_vme_rd_4_data_valid = io_vme_rd_4_data_valid_REG & (localTag_out_client_id == 3'h4);
	assign io_vme_rd_4_data_bits_data = io_vme_rd_4_data_bits_data_REG;
	assign io_vme_rd_4_data_bits_tag = vmeTag_array_client_tag_localTag_out_MPORT_data;
	assign io_vme_wr_0_cmd_ready = wstate == 2'h0;
	assign io_vme_wr_0_data_ready = (wstate == 2'h2) & io_mem_w_ready;
	assign io_vme_wr_0_ack = io_mem_b_ready & io_mem_b_valid;
	assign VMEcmd_Qs_0_clock = clk;
	assign VMEcmd_Qs_0_reset = rst;
	assign VMEcmd_Qs_0_io_enq_valid = io_vme_rd_0_cmd_valid & VMEcmd_Qs_0_io_enq_ready;
	assign VMEcmd_Qs_0_io_enq_bits_addr = io_vme_rd_0_cmd_bits_addr;
	assign VMEcmd_Qs_0_io_enq_bits_len = io_vme_rd_0_cmd_bits_len;
	assign VMEcmd_Qs_0_io_enq_bits_tag = 21'h000000;
	assign VMEcmd_Qs_0_io_deq_ready = (_VMEcmd_Qs_0_io_deq_ready_T_1 & _T_1) & _T_4;
	assign VMEcmd_Qs_1_clock = clk;
	assign VMEcmd_Qs_1_reset = rst;
	assign VMEcmd_Qs_1_io_enq_valid = io_vme_rd_1_cmd_valid & VMEcmd_Qs_1_io_enq_ready;
	assign VMEcmd_Qs_1_io_enq_bits_addr = io_vme_rd_1_cmd_bits_addr;
	assign VMEcmd_Qs_1_io_enq_bits_len = io_vme_rd_1_cmd_bits_len;
	assign VMEcmd_Qs_1_io_enq_bits_tag = io_vme_rd_1_cmd_bits_tag;
	assign VMEcmd_Qs_1_io_deq_ready = (_VMEcmd_Qs_1_io_deq_ready_T_1 & _T_1) & _T_4;
	assign VMEcmd_Qs_2_clock = clk;
	assign VMEcmd_Qs_2_reset = rst;
	assign VMEcmd_Qs_2_io_enq_valid = io_vme_rd_2_cmd_valid & VMEcmd_Qs_2_io_enq_ready;
	assign VMEcmd_Qs_2_io_enq_bits_addr = io_vme_rd_2_cmd_bits_addr;
	assign VMEcmd_Qs_2_io_enq_bits_len = io_vme_rd_2_cmd_bits_len;
	assign VMEcmd_Qs_2_io_enq_bits_tag = io_vme_rd_2_cmd_bits_tag;
	assign VMEcmd_Qs_2_io_deq_ready = (_VMEcmd_Qs_2_io_deq_ready_T_1 & _T_1) & _T_4;
	assign VMEcmd_Qs_3_clock = clk;
	assign VMEcmd_Qs_3_reset = rst;
	assign VMEcmd_Qs_3_io_enq_valid = io_vme_rd_3_cmd_valid & VMEcmd_Qs_3_io_enq_ready;
	assign VMEcmd_Qs_3_io_enq_bits_addr = io_vme_rd_3_cmd_bits_addr;
	assign VMEcmd_Qs_3_io_enq_bits_len = io_vme_rd_3_cmd_bits_len;
	assign VMEcmd_Qs_3_io_enq_bits_tag = io_vme_rd_3_cmd_bits_tag;
	assign VMEcmd_Qs_3_io_deq_ready = (_VMEcmd_Qs_3_io_deq_ready_T_1 & _T_1) & _T_4;
	assign VMEcmd_Qs_4_clock = clk;
	assign VMEcmd_Qs_4_reset = rst;
	assign VMEcmd_Qs_4_io_enq_valid = io_vme_rd_4_cmd_valid & VMEcmd_Qs_4_io_enq_ready;
	assign VMEcmd_Qs_4_io_enq_bits_addr = io_vme_rd_4_cmd_bits_addr;
	assign VMEcmd_Qs_4_io_enq_bits_len = io_vme_rd_4_cmd_bits_len;
	assign VMEcmd_Qs_4_io_enq_bits_tag = io_vme_rd_4_cmd_bits_tag;
	assign VMEcmd_Qs_4_io_deq_ready = (_VMEcmd_Qs_4_io_deq_ready_T_1 & _T_1) & _T_4;
	always @(posedge clk) begin
		if (vmeTag_array_client_id_rdwrPort_en & vmeTag_array_client_id_rdwrPort_mask)
			vmeTag_array_client_id[vmeTag_array_client_id_rdwrPort_addr] <= vmeTag_array_client_id_rdwrPort_data;
		vmeTag_array_client_id_localTag_out_MPORT_en_pipe_0 <= 1'h1;
		vmeTag_array_client_id_localTag_out_MPORT_addr_pipe_0 <= io_mem_r_bits_id[3:0];
		if (vmeTag_array_client_tag_rdwrPort_en & vmeTag_array_client_tag_rdwrPort_mask)
			vmeTag_array_client_tag[vmeTag_array_client_tag_rdwrPort_addr] <= vmeTag_array_client_tag_rdwrPort_data;
		vmeTag_array_client_tag_localTag_out_MPORT_en_pipe_0 <= 1'h1;
		vmeTag_array_client_tag_localTag_out_MPORT_addr_pipe_0 <= io_mem_r_bits_id[3:0];
		if (rst)
			availableEntries <= 16'hffff;
		else if (io_mem_r_bits_last & io_mem_r_valid)
			availableEntries <= _availableEntriesNext_T;
		else if ((availableEntriesEn & (availableEntries != 16'h0000)) & ~_T)
			availableEntries <= newEntry;
		if (rst)
			io_vme_rd_0_data_valid_REG <= 1'h0;
		else
			io_vme_rd_0_data_valid_REG <= io_mem_r_valid;
		if (rst)
			io_vme_rd_0_data_bits_data_REG <= 64'h0000000000000000;
		else
			io_vme_rd_0_data_bits_data_REG <= io_mem_r_bits_data;
		if (rst)
			io_vme_rd_1_data_valid_REG <= 1'h0;
		else
			io_vme_rd_1_data_valid_REG <= io_mem_r_valid;
		if (rst)
			io_vme_rd_1_data_bits_data_REG <= 64'h0000000000000000;
		else
			io_vme_rd_1_data_bits_data_REG <= io_mem_r_bits_data;
		if (rst)
			io_vme_rd_1_data_bits_last_REG <= 1'h0;
		else
			io_vme_rd_1_data_bits_last_REG <= io_mem_r_bits_last;
		if (rst)
			io_vme_rd_2_data_valid_REG <= 1'h0;
		else
			io_vme_rd_2_data_valid_REG <= io_mem_r_valid;
		if (rst)
			io_vme_rd_2_data_bits_data_REG <= 64'h0000000000000000;
		else
			io_vme_rd_2_data_bits_data_REG <= io_mem_r_bits_data;
		if (rst)
			io_vme_rd_3_data_valid_REG <= 1'h0;
		else
			io_vme_rd_3_data_valid_REG <= io_mem_r_valid;
		if (rst)
			io_vme_rd_3_data_bits_data_REG <= 64'h0000000000000000;
		else
			io_vme_rd_3_data_bits_data_REG <= io_mem_r_bits_data;
		if (rst)
			io_vme_rd_4_data_valid_REG <= 1'h0;
		else
			io_vme_rd_4_data_valid_REG <= io_mem_r_valid;
		if (rst)
			io_vme_rd_4_data_bits_data_REG <= 64'h0000000000000000;
		else
			io_vme_rd_4_data_bits_data_REG <= io_mem_r_bits_data;
		if (rst)
			wr_len <= 8'h00;
		else if (_T_32)
			wr_len <= io_vme_wr_0_cmd_bits_len;
		if (rst)
			wr_addr <= 64'h0000000000000000;
		else if (_T_32)
			wr_addr <= io_vme_wr_0_cmd_bits_addr;
		if (rst)
			wstate <= 2'h0;
		else if (2'h0 == wstate) begin
			if (io_vme_wr_0_cmd_valid)
				wstate <= 2'h1;
		end
		else if (2'h1 == wstate) begin
			if (io_mem_aw_ready)
				wstate <= 2'h2;
		end
		else if (2'h2 == wstate)
			wstate <= _GEN_52;
		else
			wstate <= _GEN_54;
		if (rst)
			wr_cnt <= 8'h00;
		else if (_io_vme_wr_0_cmd_ready_T)
			wr_cnt <= 8'h00;
		else if (_T_34)
			wr_cnt <= _wr_cnt_T_1;
		if (~rst & ~(io_vme_rd_0_data_ready | ~io_vme_rd_0_data_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at VME.scala:300 assert(io.vme.rd(i).data.ready || ~io.vme.rd(i).data.valid)\n");
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (~rst)
			;
		if (~rst)
			;
		if (~rst)
			;
		if (~rst)
			;
	end
endmodule
module TwoPortMem (
	clk,
	io_wr_en,
	io_wr_addr,
	io_wr_data,
	io_rd_en,
	io_rd_addr,
	io_rd_data
);
	input clk;
	input io_wr_en;
	input [15:0] io_wr_addr;
	input [127:0] io_wr_data;
	input io_rd_en;
	input [15:0] io_rd_addr;
	output wire [127:0] io_rd_data;
	reg [127:0] mem [0:127];
	wire mem_io_rd_data_MPORT_en;
	wire [6:0] mem_io_rd_data_MPORT_addr;
	wire [127:0] mem_io_rd_data_MPORT_data;
	wire [127:0] mem_MPORT_data;
	wire [6:0] mem_MPORT_addr;
	wire mem_MPORT_mask;
	wire mem_MPORT_en;
	reg mem_io_rd_data_MPORT_en_pipe_0;
	reg [6:0] mem_io_rd_data_MPORT_addr_pipe_0;
	assign mem_io_rd_data_MPORT_en = mem_io_rd_data_MPORT_en_pipe_0;
	assign mem_io_rd_data_MPORT_addr = mem_io_rd_data_MPORT_addr_pipe_0;
	assign mem_io_rd_data_MPORT_data = mem[mem_io_rd_data_MPORT_addr];
	assign mem_MPORT_data = io_wr_data;
	assign mem_MPORT_addr = io_wr_addr[6:0];
	assign mem_MPORT_mask = 1'h1;
	assign mem_MPORT_en = io_wr_en;
	assign io_rd_data = mem_io_rd_data_MPORT_data;
	always @(posedge clk) begin
		if (mem_MPORT_en & mem_MPORT_mask)
			mem[mem_MPORT_addr] <= mem_MPORT_data;
		mem_io_rd_data_MPORT_en_pipe_0 <= io_rd_en;
		if (io_rd_en)
			mem_io_rd_data_MPORT_addr_pipe_0 <= io_rd_addr[6:0];
	end
endmodule
module OneCycleQueue (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits,
	io_count
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	output wire [7:0] io_count;
	wire ram0_clock;
	wire ram0_io_wr_en;
	wire [15:0] ram0_io_wr_addr;
	wire [127:0] ram0_io_wr_data;
	wire ram0_io_rd_en;
	wire [15:0] ram0_io_rd_addr;
	wire [127:0] ram0_io_rd_data;
	reg [6:0] value;
	reg [6:0] value_1;
	reg maybe_full;
	wire ptr_match = value == value_1;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	wire do_deq = io_deq_ready & io_deq_valid;
	wire wrap = value_1 == 7'h7f;
	wire [6:0] _value_T_1 = value_1 + 7'h01;
	wire [6:0] _value_T_3 = value + 7'h01;
	wire _firstRead_T_1 = do_enq & (io_count == 8'h00);
	reg firstRead;
	wire _io_deq_valid_T_1 = ~firstRead;
	wire [6:0] _GEN_4 = (wrap ? 7'h00 : _value_T_1);
	wire [6:0] _GEN_5 = (do_deq ? _GEN_4 : value_1);
	wire [6:0] rdAddr = (firstRead ? value_1 : _GEN_5);
	wire [6:0] ptr_diff = value - value_1;
	wire [7:0] _io_count_T_1 = (maybe_full & ptr_match ? 8'h80 : 8'h00);
	wire [7:0] _GEN_7 = {1'd0, ptr_diff};
	TwoPortMem ram0(
		.clk(ram0_clock),
		.io_wr_en(ram0_io_wr_en),
		.io_wr_addr(ram0_io_wr_addr),
		.io_wr_data(ram0_io_wr_data),
		.io_rd_en(ram0_io_rd_en),
		.io_rd_addr(ram0_io_rd_addr),
		.io_rd_data(ram0_io_rd_data)
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty & ~firstRead;
	assign io_deq_bits = ram0_io_rd_data;
	assign io_count = _io_count_T_1 | _GEN_7;
	assign ram0_clock = clk;
	assign ram0_io_wr_en = io_enq_ready & io_enq_valid;
	assign ram0_io_wr_addr = {9'd0, value};
	assign ram0_io_wr_data = io_enq_bits;
	assign ram0_io_rd_en = do_deq | firstRead;
	assign ram0_io_rd_addr = {9'd0, rdAddr};
	always @(posedge clk) begin
		if (rst)
			value <= 7'h00;
		else if (do_enq)
			value <= _value_T_3;
		if (rst)
			value_1 <= 7'h00;
		else if (do_deq)
			value_1 <= _value_T_1;
		if (rst)
			maybe_full <= 1'h0;
		else if (do_enq != do_deq)
			maybe_full <= do_enq;
		if (rst)
			firstRead <= 1'h0;
		else
			firstRead <= _firstRead_T_1;
		if (~rst & ~(_io_deq_valid_T_1 | ~do_deq))
			$fwrite(32'h80000002, "Assertion failed: -F- Cannot have deq with first read as queue output is not valid yet\n    at SyncQueue.scala:406 assert(!firstRead || !do_deq, \"-F- Cannot have deq with first read as queue output is not valid yet\")\n");
	end
	always @(posedge clk)
		if (~rst)
			;
endmodule
module Queue_5 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	reg [127:0] ram [0:2];
	wire ram_io_deq_bits_MPORT_en;
	wire [1:0] ram_io_deq_bits_MPORT_addr;
	wire [127:0] ram_io_deq_bits_MPORT_data;
	wire [127:0] ram_MPORT_data;
	wire [1:0] ram_MPORT_addr;
	wire ram_MPORT_mask;
	wire ram_MPORT_en;
	reg [1:0] enq_ptr_value;
	reg [1:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	wire do_deq = io_deq_ready & io_deq_valid;
	wire wrap = enq_ptr_value == 2'h2;
	wire [1:0] _value_T_1 = enq_ptr_value + 2'h1;
	wire wrap_1 = deq_ptr_value == 2'h2;
	wire [1:0] _value_T_3 = deq_ptr_value + 2'h1;
	assign ram_io_deq_bits_MPORT_en = 1'h1;
	assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
	assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr];
	assign ram_MPORT_data = io_enq_bits;
	assign ram_MPORT_addr = enq_ptr_value;
	assign ram_MPORT_mask = 1'h1;
	assign ram_MPORT_en = io_enq_ready & io_enq_valid;
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits = ram_io_deq_bits_MPORT_data;
	always @(posedge clk) begin
		if (ram_MPORT_en & ram_MPORT_mask)
			ram[ram_MPORT_addr] <= ram_MPORT_data;
		if (rst)
			enq_ptr_value <= 2'h0;
		else if (do_enq) begin
			if (wrap)
				enq_ptr_value <= 2'h0;
			else
				enq_ptr_value <= _value_T_1;
		end
		if (rst)
			deq_ptr_value <= 2'h0;
		else if (do_deq) begin
			if (wrap_1)
				deq_ptr_value <= 2'h0;
			else
				deq_ptr_value <= _value_T_3;
		end
		if (rst)
			maybe_full <= 1'h0;
		else if (do_enq != do_deq)
			maybe_full <= do_enq;
	end
endmodule
module SyncQueue2PortMemImpl (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits,
	io_count
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	output wire [7:0] io_count;
	wire memoryQueue_clock;
	wire memoryQueue_reset;
	wire memoryQueue_io_enq_ready;
	wire memoryQueue_io_enq_valid;
	wire [127:0] memoryQueue_io_enq_bits;
	wire memoryQueue_io_deq_ready;
	wire memoryQueue_io_deq_valid;
	wire [127:0] memoryQueue_io_deq_bits;
	wire [7:0] memoryQueue_io_count;
	wire buffer_clock;
	wire buffer_reset;
	wire buffer_io_enq_ready;
	wire buffer_io_enq_valid;
	wire [127:0] buffer_io_enq_bits;
	wire buffer_io_deq_ready;
	wire buffer_io_deq_valid;
	wire [127:0] buffer_io_deq_bits;
	wire memoryQueueHasValues = memoryQueue_io_count != 8'h00;
	wire _memoryQueue_io_enq_valid_T = io_enq_ready & io_enq_valid;
	wire _countNext_T_1 = io_deq_ready & io_deq_valid;
	wire _countNext_T_2 = _memoryQueue_io_enq_valid_T | _countNext_T_1;
	reg [7:0] countNext;
	wire _T_3 = _memoryQueue_io_enq_valid_T & ~_countNext_T_1;
	wire [7:0] _count_T_1 = countNext + 8'h01;
	wire _T_11 = ~_memoryQueue_io_enq_valid_T & _countNext_T_1;
	wire [7:0] _count_T_3 = countNext - 8'h01;
	wire _T_6 = ~rst;
	OneCycleQueue memoryQueue(
		.clk(memoryQueue_clock),
		.rst(memoryQueue_reset),
		.io_enq_ready(memoryQueue_io_enq_ready),
		.io_enq_valid(memoryQueue_io_enq_valid),
		.io_enq_bits(memoryQueue_io_enq_bits),
		.io_deq_ready(memoryQueue_io_deq_ready),
		.io_deq_valid(memoryQueue_io_deq_valid),
		.io_deq_bits(memoryQueue_io_deq_bits),
		.io_count(memoryQueue_io_count)
	);
	Queue_5 buffer(
		.clk(buffer_clock),
		.rst(buffer_reset),
		.io_enq_ready(buffer_io_enq_ready),
		.io_enq_valid(buffer_io_enq_valid),
		.io_enq_bits(buffer_io_enq_bits),
		.io_deq_ready(buffer_io_deq_ready),
		.io_deq_valid(buffer_io_deq_valid),
		.io_deq_bits(buffer_io_deq_bits)
	);
	assign io_enq_ready = countNext != 8'h80;
	assign io_deq_valid = countNext != 8'h00;
	assign io_deq_bits = buffer_io_deq_bits;
	assign io_count = countNext;
	assign memoryQueue_clock = clk;
	assign memoryQueue_reset = rst;
	assign memoryQueue_io_enq_valid = _memoryQueue_io_enq_valid_T & (~buffer_io_enq_ready | memoryQueueHasValues);
	assign memoryQueue_io_enq_bits = io_enq_bits;
	assign memoryQueue_io_deq_ready = buffer_io_enq_ready;
	assign buffer_clock = clk;
	assign buffer_reset = rst;
	assign buffer_io_enq_valid = (memoryQueueHasValues ? memoryQueue_io_deq_valid : io_enq_valid);
	assign buffer_io_enq_bits = (memoryQueueHasValues ? memoryQueue_io_deq_bits : io_enq_bits);
	assign buffer_io_deq_ready = io_deq_ready;
	always @(posedge clk) begin
		if (rst)
			countNext <= 8'h00;
		else if (_countNext_T_2) begin
			if (_memoryQueue_io_enq_valid_T & ~_countNext_T_1)
				countNext <= _count_T_1;
			else if (~_memoryQueue_io_enq_valid_T & _countNext_T_1)
				countNext <= _count_T_3;
		end
		if ((_T_3 & ~rst) & ~(countNext < 8'h80))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:192 assert(countNext < entries.U)\n");
		if (((~_T_3 & _T_11) & _T_6) & ~(countNext > 8'h00))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:195 assert(countNext > 0.U)\n");
		if (_T_6 & ~(io_deq_valid == buffer_io_deq_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:204 assert(io.deq.valid === buffer.io.deq.valid)\n");
		if (_T_6 & ~((io_enq_ready == buffer_io_enq_ready) | memoryQueue_io_enq_ready))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:205 assert(io.enq.ready === buffer.io.enq.ready || memoryQueue.io.enq.ready)\n");
	end
	always @(posedge clk) begin
		if (_T_3 & ~rst)
			;
		if ((~_T_3 & _T_11) & _T_6)
			;
		if (_T_6)
			;
		if (_T_6)
			;
	end
endmodule
module SyncQueue2PortMem (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits,
	io_count
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	output wire [7:0] io_count;
	wire queue_clock;
	wire queue_reset;
	wire queue_io_enq_ready;
	wire queue_io_enq_valid;
	wire [127:0] queue_io_enq_bits;
	wire queue_io_deq_ready;
	wire queue_io_deq_valid;
	wire [127:0] queue_io_deq_bits;
	wire [7:0] queue_io_count;
	SyncQueue2PortMemImpl queue(
		.clk(queue_clock),
		.rst(queue_reset),
		.io_enq_ready(queue_io_enq_ready),
		.io_enq_valid(queue_io_enq_valid),
		.io_enq_bits(queue_io_enq_bits),
		.io_deq_ready(queue_io_deq_ready),
		.io_deq_valid(queue_io_deq_valid),
		.io_deq_bits(queue_io_deq_bits),
		.io_count(queue_io_count)
	);
	assign io_enq_ready = queue_io_enq_ready;
	assign io_deq_valid = queue_io_deq_valid;
	assign io_deq_bits = queue_io_deq_bits;
	assign io_count = queue_io_count;
	assign queue_clock = clk;
	assign queue_reset = rst;
	assign queue_io_enq_valid = io_enq_valid;
	assign queue_io_enq_bits = io_enq_bits;
	assign queue_io_deq_ready = io_deq_ready;
endmodule
module SyncQueue (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits,
	io_count
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	output wire [7:0] io_count;
	wire queue_clock;
	wire queue_reset;
	wire queue_io_enq_ready;
	wire queue_io_enq_valid;
	wire [127:0] queue_io_enq_bits;
	wire queue_io_deq_ready;
	wire queue_io_deq_valid;
	wire [127:0] queue_io_deq_bits;
	wire [7:0] queue_io_count;
	SyncQueue2PortMem queue(
		.clk(queue_clock),
		.rst(queue_reset),
		.io_enq_ready(queue_io_enq_ready),
		.io_enq_valid(queue_io_enq_valid),
		.io_enq_bits(queue_io_enq_bits),
		.io_deq_ready(queue_io_deq_ready),
		.io_deq_valid(queue_io_deq_valid),
		.io_deq_bits(queue_io_deq_bits),
		.io_count(queue_io_count)
	);
	assign io_enq_ready = queue_io_enq_ready;
	assign io_deq_valid = queue_io_deq_valid;
	assign io_deq_bits = queue_io_deq_bits;
	assign io_count = queue_io_count;
	assign queue_clock = clk;
	assign queue_reset = rst;
	assign queue_io_enq_valid = io_enq_valid;
	assign queue_io_enq_bits = io_enq_bits;
	assign queue_io_deq_ready = io_deq_ready;
endmodule
module FetchDecode (
	io_inst,
	io_isLoad,
	io_isCompute,
	io_isStore
);
	input [127:0] io_inst;
	output wire io_isLoad;
	output wire io_isCompute;
	output wire io_isStore;
	wire [127:0] _csignals_T = io_inst & 128'h00000000000000000000000000000387;
	wire _csignals_T_1 = 128'h00000000000000000000000000000000 == _csignals_T;
	wire _csignals_T_3 = 128'h00000000000000000000000000000080 == _csignals_T;
	wire _csignals_T_5 = 128'h00000000000000000000000000000100 == _csignals_T;
	wire _csignals_T_7 = 128'h00000000000000000000000000000180 == _csignals_T;
	wire [127:0] _csignals_T_8 = io_inst & 128'h00000000000000000000000000000007;
	wire _csignals_T_9 = 128'h00000000000000000000000000000001 == _csignals_T_8;
	wire _csignals_T_11 = 128'h00000000000000000000000000000002 == _csignals_T_8;
	wire _csignals_T_13 = 128'h00000000000000000000000000000003 == _csignals_T_8;
	wire [127:0] _csignals_T_14 = io_inst & 128'h00007000000000000000000000000007;
	wire _csignals_T_15 = 128'h00000000000000000000000000000004 == _csignals_T_14;
	wire _csignals_T_17 = 128'h00001000000000000000000000000004 == _csignals_T_14;
	wire _csignals_T_19 = 128'h00002000000000000000000000000004 == _csignals_T_14;
	wire _csignals_T_21 = 128'h00003000000000000000000000000004 == _csignals_T_14;
	wire cs_val_inst = _csignals_T_1 | (_csignals_T_3 | (_csignals_T_5 | (_csignals_T_7 | (_csignals_T_9 | (_csignals_T_11 | (_csignals_T_13 | (_csignals_T_15 | (_csignals_T_17 | (_csignals_T_19 | _csignals_T_21)))))))));
	wire [2:0] _csignals_T_32 = (_csignals_T_21 ? 3'h2 : 3'h5);
	wire [2:0] _csignals_T_33 = (_csignals_T_19 ? 3'h2 : _csignals_T_32);
	wire [2:0] _csignals_T_34 = (_csignals_T_17 ? 3'h2 : _csignals_T_33);
	wire [2:0] _csignals_T_35 = (_csignals_T_15 ? 3'h2 : _csignals_T_34);
	wire [2:0] _csignals_T_36 = (_csignals_T_13 ? 3'h2 : _csignals_T_35);
	wire [2:0] _csignals_T_37 = (_csignals_T_11 ? 3'h2 : _csignals_T_36);
	wire [2:0] _csignals_T_38 = (_csignals_T_9 ? 3'h1 : _csignals_T_37);
	wire [2:0] _csignals_T_39 = (_csignals_T_7 ? 3'h2 : _csignals_T_38);
	wire [2:0] _csignals_T_40 = (_csignals_T_5 ? 3'h0 : _csignals_T_39);
	wire [2:0] _csignals_T_41 = (_csignals_T_3 ? 3'h0 : _csignals_T_40);
	wire [2:0] cs_op_type = (_csignals_T_1 ? 3'h2 : _csignals_T_41);
	assign io_isLoad = cs_val_inst & (cs_op_type == 3'h0);
	assign io_isCompute = cs_val_inst & (cs_op_type == 3'h2);
	assign io_isStore = cs_val_inst & (cs_op_type == 3'h1);
endmodule
module Fetch64Bit (
	clk,
	rst,
	io_launch,
	io_ins_baddr,
	io_ins_count,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_inst_ld_ready,
	io_inst_ld_valid,
	io_inst_ld_bits,
	io_inst_co_ready,
	io_inst_co_valid,
	io_inst_co_bits,
	io_inst_st_ready,
	io_inst_st_valid,
	io_inst_st_bits
);
	input clk;
	input rst;
	input io_launch;
	input [63:0] io_ins_baddr;
	input [31:0] io_ins_count;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input io_inst_ld_ready;
	output wire io_inst_ld_valid;
	output wire [127:0] io_inst_ld_bits;
	input io_inst_co_ready;
	output wire io_inst_co_valid;
	output wire [127:0] io_inst_co_bits;
	input io_inst_st_ready;
	output wire io_inst_st_valid;
	output wire [127:0] io_inst_st_bits;
	wire inst_q_clock;
	wire inst_q_reset;
	wire inst_q_io_enq_ready;
	wire inst_q_io_enq_valid;
	wire [127:0] inst_q_io_enq_bits;
	wire inst_q_io_deq_ready;
	wire inst_q_io_deq_valid;
	wire [127:0] inst_q_io_deq_bits;
	wire [7:0] inst_q_io_count;
	wire [127:0] dec_io_inst;
	wire dec_io_isLoad;
	wire dec_io_isCompute;
	wire dec_io_isStore;
	reg s1_launch;
	wire pulse = io_launch & ~s1_launch;
	reg [63:0] raddr;
	reg [7:0] rlen;
	reg [7:0] ilen;
	reg [31:0] xrem;
	wire [32:0] _xsize_T = {io_ins_count, 1'h0};
	wire [32:0] xsize = _xsize_T - 33'h000000001;
	reg [2:0] state;
	wire [32:0] _ilen_T = {1'd0, xsize[32:1]};
	wire [8:0] _rlen_T_1 = 9'h100 - 9'h001;
	wire [8:0] _ilen_T_3 = 9'h080 - 9'h001;
	wire [32:0] _xrem_T_1 = xsize - 33'h000000100;
	wire [32:0] _GEN_0 = (xsize < 33'h000000100 ? xsize : {24'd0, _rlen_T_1});
	wire [32:0] _GEN_1 = (xsize < 33'h000000100 ? _ilen_T : {24'd0, _ilen_T_3});
	wire [32:0] _GEN_2 = (xsize < 33'h000000100 ? 33'h000000000 : _xrem_T_1);
	wire [32:0] _GEN_4 = (pulse ? _GEN_0 : {25'd0, rlen});
	wire [32:0] _GEN_5 = (pulse ? _GEN_1 : {25'd0, ilen});
	wire [32:0] _GEN_6 = (pulse ? _GEN_2 : {1'd0, xrem});
	wire [2:0] _GEN_8 = (io_vme_rd_data_valid ? 3'h3 : state);
	wire [2:0] _GEN_9 = (inst_q_io_count == ilen ? 3'h4 : 3'h2);
	wire [2:0] _GEN_10 = (io_vme_rd_data_valid ? _GEN_9 : state);
	wire _T_7 = inst_q_io_count == 8'h00;
	wire [31:0] _ilen_T_4 = {1'd0, xrem[31:1]};
	wire [31:0] _xrem_T_3 = xrem - 32'h00000100;
	wire [31:0] _GEN_12 = (xrem < 32'h00000100 ? xrem : {23'd0, _rlen_T_1});
	wire [31:0] _GEN_13 = (xrem < 32'h00000100 ? _ilen_T_4 : {23'd0, _ilen_T_3});
	wire [31:0] _GEN_14 = (xrem < 32'h00000100 ? 32'h00000000 : _xrem_T_3);
	wire [2:0] _GEN_15 = (xrem == 32'h00000000 ? 3'h0 : 3'h1);
	wire [31:0] _GEN_16 = (xrem == 32'h00000000 ? {24'd0, rlen} : _GEN_12);
	wire [31:0] _GEN_17 = (xrem == 32'h00000000 ? {24'd0, ilen} : _GEN_13);
	wire [31:0] _GEN_18 = (xrem == 32'h00000000 ? xrem : _GEN_14);
	wire [2:0] _GEN_19 = (inst_q_io_count == 8'h00 ? _GEN_15 : state);
	wire [31:0] _GEN_20 = (inst_q_io_count == 8'h00 ? _GEN_16 : {24'd0, rlen});
	wire [31:0] _GEN_21 = (inst_q_io_count == 8'h00 ? _GEN_17 : {24'd0, ilen});
	wire [31:0] _GEN_22 = (inst_q_io_count == 8'h00 ? _GEN_18 : xrem);
	wire [2:0] _GEN_23 = (3'h4 == state ? _GEN_19 : state);
	wire [31:0] _GEN_24 = (3'h4 == state ? _GEN_20 : {24'd0, rlen});
	wire [31:0] _GEN_25 = (3'h4 == state ? _GEN_21 : {24'd0, ilen});
	wire [31:0] _GEN_26 = (3'h4 == state ? _GEN_22 : xrem);
	wire [2:0] _GEN_27 = (3'h3 == state ? _GEN_10 : _GEN_23);
	wire [31:0] _GEN_28 = (3'h3 == state ? {24'd0, rlen} : _GEN_24);
	wire [31:0] _GEN_29 = (3'h3 == state ? {24'd0, ilen} : _GEN_25);
	wire [31:0] _GEN_30 = (3'h3 == state ? xrem : _GEN_26);
	wire [31:0] _GEN_32 = (3'h2 == state ? {24'd0, rlen} : _GEN_28);
	wire [31:0] _GEN_33 = (3'h2 == state ? {24'd0, ilen} : _GEN_29);
	wire [31:0] _GEN_34 = (3'h2 == state ? xrem : _GEN_30);
	wire [31:0] _GEN_36 = (3'h1 == state ? {24'd0, rlen} : _GEN_32);
	wire [31:0] _GEN_37 = (3'h1 == state ? {24'd0, ilen} : _GEN_33);
	wire [31:0] _GEN_38 = (3'h1 == state ? xrem : _GEN_34);
	wire [32:0] _GEN_40 = (3'h0 == state ? _GEN_4 : {1'd0, _GEN_36});
	wire [32:0] _GEN_41 = (3'h0 == state ? _GEN_5 : {1'd0, _GEN_37});
	wire [32:0] _GEN_42 = (3'h0 == state ? _GEN_6 : {1'd0, _GEN_38});
	wire _T_11 = state == 3'h4;
	wire [63:0] _raddr_T_1 = raddr + 64'h0000000000000800;
	reg [63:0] lsb;
	wire [2:0] deq_sel = {dec_io_isCompute, dec_io_isStore, dec_io_isLoad};
	wire _deq_ready_T_3 = (3'h2 == deq_sel ? io_inst_st_ready : (3'h1 == deq_sel) & io_inst_ld_ready);
	wire deq_ready = (3'h4 == deq_sel ? io_inst_co_ready : _deq_ready_T_3);
	SyncQueue inst_q(
		.clk(inst_q_clock),
		.rst(inst_q_reset),
		.io_enq_ready(inst_q_io_enq_ready),
		.io_enq_valid(inst_q_io_enq_valid),
		.io_enq_bits(inst_q_io_enq_bits),
		.io_deq_ready(inst_q_io_deq_ready),
		.io_deq_valid(inst_q_io_deq_valid),
		.io_deq_bits(inst_q_io_deq_bits),
		.io_count(inst_q_io_count)
	);
	FetchDecode dec(
		.io_inst(dec_io_inst),
		.io_isLoad(dec_io_isLoad),
		.io_isCompute(dec_io_isCompute),
		.io_isStore(dec_io_isStore)
	);
	assign io_vme_rd_cmd_valid = state == 3'h1;
	assign io_vme_rd_cmd_bits_addr = raddr;
	assign io_vme_rd_cmd_bits_len = rlen;
	assign io_vme_rd_data_ready = inst_q_io_enq_ready;
	assign io_inst_ld_valid = (dec_io_isLoad & inst_q_io_deq_valid) & _T_11;
	assign io_inst_ld_bits = inst_q_io_deq_bits;
	assign io_inst_co_valid = (dec_io_isCompute & inst_q_io_deq_valid) & _T_11;
	assign io_inst_co_bits = inst_q_io_deq_bits;
	assign io_inst_st_valid = (dec_io_isStore & inst_q_io_deq_valid) & _T_11;
	assign io_inst_st_bits = inst_q_io_deq_bits;
	assign inst_q_clock = clk;
	assign inst_q_reset = rst;
	assign inst_q_io_enq_valid = io_vme_rd_data_valid & (state == 3'h3);
	assign inst_q_io_enq_bits = {io_vme_rd_data_bits_data, lsb};
	assign inst_q_io_deq_ready = (deq_ready & inst_q_io_deq_valid) & _T_11;
	assign dec_io_inst = inst_q_io_deq_bits;
	always @(posedge clk) begin
		if (rst)
			s1_launch <= 1'h0;
		else
			s1_launch <= io_launch;
		if (state == 3'h0)
			raddr <= io_ins_baddr;
		else if (((state == 3'h4) & _T_7) & (xrem != 32'h00000000))
			raddr <= _raddr_T_1;
		rlen <= _GEN_40[7:0];
		ilen <= _GEN_41[7:0];
		xrem <= _GEN_42[31:0];
		if (rst)
			state <= 3'h0;
		else if (3'h0 == state) begin
			if (pulse)
				state <= 3'h1;
		end
		else if (3'h1 == state) begin
			if (io_vme_rd_cmd_ready)
				state <= 3'h2;
		end
		else if (3'h2 == state)
			state <= _GEN_8;
		else
			state <= _GEN_27;
		if (state == 3'h2)
			lsb <= io_vme_rd_data_bits_data;
		if (~rst & ~(((~(inst_q_io_deq_valid & _T_11) | dec_io_isLoad) | dec_io_isCompute) | dec_io_isStore))
			$fwrite(32'h80000002, "Assertion failed: -F- Fetch: Unknown instruction type\n    at FetchVME64.scala:161 assert(!(inst_q.io.deq.valid & state === sDrain) || dec.io.isLoad || dec.io.isCompute || dec.io.isStore,\n");
	end
	always @(posedge clk)
		if (~rst)
			;
endmodule
module Fetch (
	clk,
	rst,
	io_launch,
	io_ins_baddr,
	io_ins_count,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_inst_ld_ready,
	io_inst_ld_valid,
	io_inst_ld_bits,
	io_inst_co_ready,
	io_inst_co_valid,
	io_inst_co_bits,
	io_inst_st_ready,
	io_inst_st_valid,
	io_inst_st_bits
);
	input clk;
	input rst;
	input io_launch;
	input [63:0] io_ins_baddr;
	input [31:0] io_ins_count;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input io_inst_ld_ready;
	output wire io_inst_ld_valid;
	output wire [127:0] io_inst_ld_bits;
	input io_inst_co_ready;
	output wire io_inst_co_valid;
	output wire [127:0] io_inst_co_bits;
	input io_inst_st_ready;
	output wire io_inst_st_valid;
	output wire [127:0] io_inst_st_bits;
	wire fetch_clock;
	wire fetch_reset;
	wire fetch_io_launch;
	wire [63:0] fetch_io_ins_baddr;
	wire [31:0] fetch_io_ins_count;
	wire fetch_io_vme_rd_cmd_ready;
	wire fetch_io_vme_rd_cmd_valid;
	wire [63:0] fetch_io_vme_rd_cmd_bits_addr;
	wire [7:0] fetch_io_vme_rd_cmd_bits_len;
	wire fetch_io_vme_rd_data_ready;
	wire fetch_io_vme_rd_data_valid;
	wire [63:0] fetch_io_vme_rd_data_bits_data;
	wire fetch_io_inst_ld_ready;
	wire fetch_io_inst_ld_valid;
	wire [127:0] fetch_io_inst_ld_bits;
	wire fetch_io_inst_co_ready;
	wire fetch_io_inst_co_valid;
	wire [127:0] fetch_io_inst_co_bits;
	wire fetch_io_inst_st_ready;
	wire fetch_io_inst_st_valid;
	wire [127:0] fetch_io_inst_st_bits;
	Fetch64Bit fetch(
		.clk(fetch_clock),
		.rst(fetch_reset),
		.io_launch(fetch_io_launch),
		.io_ins_baddr(fetch_io_ins_baddr),
		.io_ins_count(fetch_io_ins_count),
		.io_vme_rd_cmd_ready(fetch_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(fetch_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(fetch_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(fetch_io_vme_rd_cmd_bits_len),
		.io_vme_rd_data_ready(fetch_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(fetch_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(fetch_io_vme_rd_data_bits_data),
		.io_inst_ld_ready(fetch_io_inst_ld_ready),
		.io_inst_ld_valid(fetch_io_inst_ld_valid),
		.io_inst_ld_bits(fetch_io_inst_ld_bits),
		.io_inst_co_ready(fetch_io_inst_co_ready),
		.io_inst_co_valid(fetch_io_inst_co_valid),
		.io_inst_co_bits(fetch_io_inst_co_bits),
		.io_inst_st_ready(fetch_io_inst_st_ready),
		.io_inst_st_valid(fetch_io_inst_st_valid),
		.io_inst_st_bits(fetch_io_inst_st_bits)
	);
	assign io_vme_rd_cmd_valid = fetch_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = fetch_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = fetch_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_data_ready = fetch_io_vme_rd_data_ready;
	assign io_inst_ld_valid = fetch_io_inst_ld_valid;
	assign io_inst_ld_bits = fetch_io_inst_ld_bits;
	assign io_inst_co_valid = fetch_io_inst_co_valid;
	assign io_inst_co_bits = fetch_io_inst_co_bits;
	assign io_inst_st_valid = fetch_io_inst_st_valid;
	assign io_inst_st_bits = fetch_io_inst_st_bits;
	assign fetch_clock = clk;
	assign fetch_reset = rst;
	assign fetch_io_launch = io_launch;
	assign fetch_io_ins_baddr = io_ins_baddr;
	assign fetch_io_ins_count = io_ins_count;
	assign fetch_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign fetch_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign fetch_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign fetch_io_inst_ld_ready = io_inst_ld_ready;
	assign fetch_io_inst_co_ready = io_inst_co_ready;
	assign fetch_io_inst_st_ready = io_inst_st_ready;
endmodule
module Semaphore (
	clk,
	rst,
	io_spost,
	io_swait,
	io_sready
);
	input clk;
	input rst;
	input io_spost;
	input io_swait;
	output wire io_sready;
	reg [7:0] cnt;
	wire [7:0] _cnt_T_1 = cnt + 8'h01;
	wire [7:0] _cnt_T_3 = cnt - 8'h01;
	assign io_sready = cnt != 8'h00;
	always @(posedge clk)
		if (rst)
			cnt <= 8'h00;
		else if ((~io_spost & io_swait) & (cnt != 8'h00))
			cnt <= _cnt_T_3;
		else if ((io_spost & ~io_swait) & (cnt != 8'hff))
			cnt <= _cnt_T_1;
endmodule
module Queue_6 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	reg [127:0] ram [0:511];
	wire ram_io_deq_bits_MPORT_en;
	wire [8:0] ram_io_deq_bits_MPORT_addr;
	wire [127:0] ram_io_deq_bits_MPORT_data;
	wire [127:0] ram_MPORT_data;
	wire [8:0] ram_MPORT_addr;
	wire ram_MPORT_mask;
	wire ram_MPORT_en;
	reg [8:0] enq_ptr_value;
	reg [8:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	wire do_deq = io_deq_ready & io_deq_valid;
	wire [8:0] _value_T_1 = enq_ptr_value + 9'h001;
	wire [8:0] _value_T_3 = deq_ptr_value + 9'h001;
	assign ram_io_deq_bits_MPORT_en = 1'h1;
	assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
	assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr];
	assign ram_MPORT_data = io_enq_bits;
	assign ram_MPORT_addr = enq_ptr_value;
	assign ram_MPORT_mask = 1'h1;
	assign ram_MPORT_en = io_enq_ready & io_enq_valid;
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits = ram_io_deq_bits_MPORT_data;
	always @(posedge clk) begin
		if (ram_MPORT_en & ram_MPORT_mask)
			ram[ram_MPORT_addr] <= ram_MPORT_data;
		if (rst)
			enq_ptr_value <= 9'h000;
		else if (do_enq)
			enq_ptr_value <= _value_T_1;
		if (rst)
			deq_ptr_value <= 9'h000;
		else if (do_deq)
			deq_ptr_value <= _value_T_3;
		if (rst)
			maybe_full <= 1'h0;
		else if (do_enq != do_deq)
			maybe_full <= do_enq;
	end
endmodule
module LoadDecode (
	io_inst,
	io_push_next,
	io_pop_next,
	io_isInput,
	io_isWeight,
	io_isSync
);
	input [127:0] io_inst;
	output wire io_push_next;
	output wire io_pop_next;
	output wire io_isInput;
	output wire io_isWeight;
	output wire io_isSync;
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [127:0] _io_isInput_T = io_inst & 128'h00000000000000000000000000000387;
	wire _io_isInput_T_1 = 128'h00000000000000000000000000000100 == _io_isInput_T;
	wire _io_isInput_T_2 = dec_xsize != 16'h0000;
	wire _io_isWeight_T_1 = 128'h00000000000000000000000000000080 == _io_isInput_T;
	assign io_push_next = io_inst[6];
	assign io_pop_next = io_inst[4];
	assign io_isInput = (128'h00000000000000000000000000000100 == _io_isInput_T) & (dec_xsize != 16'h0000);
	assign io_isWeight = (128'h00000000000000000000000000000080 == _io_isInput_T) & _io_isInput_T_2;
	assign io_isSync = (_io_isInput_T_1 | _io_isWeight_T_1) & (dec_xsize == 16'h0000);
endmodule
module GenVMECmd (
	clk,
	rst,
	io_start,
	io_isBusy,
	io_inst,
	io_baddr,
	io_vmeCmd_ready,
	io_vmeCmd_valid,
	io_vmeCmd_bits_addr,
	io_vmeCmd_bits_len,
	io_vmeCmd_bits_tag,
	io_readLen,
	io_done
);
	input clk;
	input rst;
	input io_start;
	input io_isBusy;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vmeCmd_ready;
	output wire io_vmeCmd_valid;
	output wire [63:0] io_vmeCmd_bits_addr;
	output wire [7:0] io_vmeCmd_bits_len;
	output wire [20:0] io_vmeCmd_bits_tag;
	output wire [8:0] io_readLen;
	output wire io_done;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [31:0] dec_dram_offset = io_inst[57:26];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [15:0] dec_xstride = io_inst[111:96];
	wire [3:0] dec_ypad_0 = io_inst[115:112];
	wire [3:0] dec_xpad_0 = io_inst[123:120];
	wire [3:0] dec_xpad_1 = io_inst[127:124];
	reg [63:0] rdCmdExtAddr;
	wire [35:0] _xfer_init_addr_T = {dec_dram_offset, 4'h0};
	wire [35:0] _xfer_init_addr_T_1 = 36'h0ffffffff & _xfer_init_addr_T;
	wire [63:0] _GEN_31 = {28'd0, _xfer_init_addr_T_1};
	wire [63:0] xfer_init_addr = io_baddr | _GEN_31;
	wire [63:0] _GEN_0 = rdCmdExtAddr % 64'h0000000000000800;
	wire [11:0] _firstMaxTransfer_T = _GEN_0[11:0];
	wire [11:0] _firstMaxTransfer_T_2 = 12'h800 - _firstMaxTransfer_T;
	wire [8:0] firstMaxTransfer = _firstMaxTransfer_T_2[11:3];
	reg [10:0] rdCmdStartIdx;
	reg commandsDone;
	wire [16:0] blocksReadSize = {dec_xsize, 1'h0};
	reg [16:0] blocksReadNb;
	reg [63:0] rdCmdExtAddrRowBegin;
	reg newReadRow;
	reg [15:0] srcRowIdx;
	wire [15:0] _srcRowIdx_T_1 = srcRowIdx + 16'h0001;
	wire [16:0] blocksRemained = blocksReadSize - blocksReadNb;
	wire [16:0] _GEN_32 = {8'd0, firstMaxTransfer};
	wire [16:0] _GEN_8 = (blocksRemained < _GEN_32 ? blocksRemained : {8'd0, firstMaxTransfer});
	wire [16:0] _GEN_9 = (blocksRemained < 17'h00100 ? blocksRemained : 17'h00100);
	wire [16:0] _GEN_10 = (newReadRow ? _GEN_8 : _GEN_9);
	wire [8:0] readLen = _GEN_10[8:0];
	wire [16:0] _GEN_33 = {8'd0, readLen};
	wire [16:0] _T_8 = blocksReadSize - _GEN_33;
	wire [15:0] _T_11 = dec_ysize - 16'h0001;
	wire _T_14 = io_vmeCmd_ready & io_vmeCmd_valid;
	wire stride = ((blocksReadNb == _T_8) & (srcRowIdx != _T_11)) & _T_14;
	wire [16:0] nextBlRNb = blocksReadNb + _GEN_33;
	wire _GEN_2 = ((nextBlRNb == blocksReadSize) & (srcRowIdx == _T_11)) | commandsDone;
	wire _GEN_4 = (_T_14 ? _GEN_2 : commandsDone);
	wire _GEN_6 = (io_start | stride ? 1'h0 : _GEN_4);
	wire _T_20 = ~rst;
	wire [15:0] _GEN_35 = {12'd0, dec_xpad_0};
	wire [15:0] _totalWidth_T_1 = dec_xsize + _GEN_35;
	wire [15:0] _GEN_36 = {12'd0, dec_xpad_1};
	wire [15:0] totalWidth = _totalWidth_T_1 + _GEN_36;
	reg [19:0] currentRowIdx;
	wire [19:0] _GEN_37 = {16'd0, dec_ypad_0};
	wire [15:0] _GEN_38 = {12'd0, dec_ypad_0};
	wire [15:0] _rdCmdStartIdxValid_T_2 = dec_ysize + _GEN_38;
	wire [19:0] _GEN_39 = {4'd0, _rdCmdStartIdxValid_T_2};
	wire _rdCmdStartIdxValid_T_3 = currentRowIdx < _GEN_39;
	wire _rdCmdStartIdxValid_T_4 = (currentRowIdx >= _GEN_37) & _rdCmdStartIdxValid_T_3;
	wire _rdCmdStartIdxValid_T_5 = _rdCmdStartIdxValid_T_4 & io_isBusy;
	wire _rdCmdStartIdxValid_T_6 = ~commandsDone;
	wire rdCmdStartIdxValid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	wire [15:0] _rdCmdStartIdx_T_1 = dec_sram_offset + _GEN_35;
	wire [15:0] _GEN_42 = {5'd0, rdCmdStartIdx};
	wire [15:0] _rdCmdStartIdx_T_3 = _GEN_42 + totalWidth;
	wire [19:0] _currentRowIdx_T_1 = currentRowIdx + 20'h00001;
	wire [15:0] _GEN_11 = (io_isBusy & ((currentRowIdx < _GEN_37) | stride) ? _rdCmdStartIdx_T_3 : {5'd0, rdCmdStartIdx});
	wire [15:0] _GEN_14 = (io_start ? _rdCmdStartIdx_T_1 : _GEN_11);
	wire startIssueCmdRead = (blocksReadNb == 17'h00000) & rdCmdStartIdxValid;
	wire [19:0] _memRow_T = {dec_xstride, 4'h0};
	wire [63:0] _GEN_43 = {44'd0, _memRow_T};
	wire [63:0] memRow = rdCmdExtAddrRowBegin + _GEN_43;
	wire [11:0] _rdCmdExtAddr_T = {readLen, 3'h0};
	wire [63:0] _GEN_44 = {52'd0, _rdCmdExtAddr_T};
	wire [63:0] _rdCmdExtAddr_T_2 = rdCmdExtAddr + _GEN_44;
	wire _GEN_21 = (_T_14 ? stride : newReadRow);
	reg [11:0] rdCmdDestBlockIdxNext;
	wire [11:0] _rdCmdDestBlockIdx_T = {rdCmdStartIdx, 1'h0};
	wire [11:0] _GEN_26 = (startIssueCmdRead ? _rdCmdDestBlockIdx_T : rdCmdDestBlockIdxNext);
	wire [11:0] rdCmdDestBlockIdx = (rdCmdStartIdxValid ? _GEN_26 : rdCmdDestBlockIdxNext);
	wire [11:0] _GEN_45 = {3'd0, readLen};
	wire [11:0] _rdCmdDestBlockIdxNext_T_1 = rdCmdDestBlockIdx + _GEN_45;
	wire [11:0] _rdCmdDestBlockIdxNext_T_3 = rdCmdDestBlockIdxNext + _GEN_45;
	wire [8:0] _io_vmeCmd_bits_len_T_1 = readLen - 9'h001;
	assign io_vmeCmd_valid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	assign io_vmeCmd_bits_addr = rdCmdExtAddr;
	assign io_vmeCmd_bits_len = _io_vmeCmd_bits_len_T_1[7:0];
	assign io_vmeCmd_bits_tag = {9'd0, rdCmdDestBlockIdx};
	assign io_readLen = _GEN_10[8:0];
	assign io_done = commandsDone;
	always @(posedge clk) begin
		if (io_start)
			rdCmdExtAddr <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddr <= memRow;
			else
				rdCmdExtAddr <= _rdCmdExtAddr_T_2;
		end
		rdCmdStartIdx <= _GEN_14[10:0];
		commandsDone <= rst | _GEN_6;
		if (io_start | stride)
			blocksReadNb <= 17'h00000;
		else if (_T_14)
			blocksReadNb <= nextBlRNb;
		if (io_start)
			rdCmdExtAddrRowBegin <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddrRowBegin <= memRow;
		end
		newReadRow <= io_start | _GEN_21;
		if (io_start)
			srcRowIdx <= 16'h0000;
		else if (stride)
			srcRowIdx <= _srcRowIdx_T_1;
		if (io_start)
			currentRowIdx <= 20'h00000;
		else if (io_isBusy & ((currentRowIdx < _GEN_37) | stride))
			currentRowIdx <= _currentRowIdx_T_1;
		if (rdCmdStartIdxValid) begin
			if (startIssueCmdRead)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_1;
			else if (_T_14)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_3;
		end
		if (~rst & ~(~io_isBusy | (blocksReadSize >= blocksReadNb)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:627 assert(!io.isBusy || blocksReadSize >= blocksReadNb)// define how many block to read at this cycle\n");
		if (_T_20 & ~(~io_vmeCmd_valid | (_rdCmdExtAddr_T <= _firstMaxTransfer_T_2)))
			$fwrite(32'h80000002, "Assertion failed: -F- inp DRAM page alignment failure. DRAM address + len overlaps mp.lenBits*memBlockSize alignment %x %x\n    at TensorLoadNarrowVME.scala:733 assert(!io.vmeCmd.valid || ((readLen << log2Ceil(mp.dataBits/8)) <= (maxTrBytes - rdCmdExtAddr %% maxTrBytes)),\n", rdCmdExtAddr, readLen);
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_20)
			;
	end
endmodule
module ReadVMEData (
	clk,
	rst,
	io_start,
	io_vmeData_ready,
	io_vmeData_valid,
	io_vmeData_bits_tag,
	io_idx,
	io_col
);
	input clk;
	input rst;
	input io_start;
	output wire io_vmeData_ready;
	input io_vmeData_valid;
	input [20:0] io_vmeData_bits_tag;
	output wire [10:0] io_idx;
	output wire io_col;
	reg [20:0] vmeTagDecodeLast;
	wire [19:0] rdDataIdx = io_vmeData_bits_tag[20:1];
	wire rdDataCol = io_vmeData_bits_tag[0];
	reg rdDataDestColNext;
	reg [15:0] rdDataDestIdxNext;
	reg vmeTagDecodeLastValidNext;
	wire _T = io_vmeData_ready & io_vmeData_valid;
	wire _GEN_0 = _T | vmeTagDecodeLastValidNext;
	wire _T_3 = io_vmeData_bits_tag != vmeTagDecodeLast;
	wire _T_4 = vmeTagDecodeLastValidNext & _T_3;
	wire _T_5 = ~vmeTagDecodeLastValidNext | _T_4;
	wire rdDataDestCol = (_T_5 ? rdDataCol : rdDataDestColNext);
	wire [15:0] _rdDataDestIdxNext_T_1 = rdDataDestIdxNext + 16'h0001;
	wire [15:0] _GEN_2 = (rdDataDestCol ? _rdDataDestIdxNext_T_1 : rdDataDestIdxNext);
	wire [19:0] _GEN_5 = (_T_5 ? rdDataIdx : {4'd0, rdDataDestIdxNext});
	wire [19:0] _GEN_7 = (_T_5 ? rdDataIdx : {4'd0, _GEN_2});
	wire [19:0] _GEN_12 = (_T ? _GEN_7 : {4'd0, rdDataDestIdxNext});
	wire [15:0] rdDataDestIdx = _GEN_5[15:0];
	assign io_vmeData_ready = 1'h1;
	assign io_idx = rdDataDestIdx[10:0];
	assign io_col = (_T_5 ? rdDataCol : rdDataDestColNext);
	always @(posedge clk) begin
		if (_T) begin
			if (_T_5)
				vmeTagDecodeLast <= io_vmeData_bits_tag;
		end
		if (_T) begin
			if (_T_5)
				rdDataDestColNext <= rdDataCol + 1'h1;
			else
				rdDataDestColNext <= rdDataDestColNext + 1'h1;
		end
		rdDataDestIdxNext <= _GEN_12[15:0];
		if (rst)
			vmeTagDecodeLastValidNext <= 1'h0;
		else if (io_start)
			vmeTagDecodeLastValidNext <= 1'h0;
		else
			vmeTagDecodeLastValidNext <= _GEN_0;
	end
endmodule
module ZeroPadding (
	clk,
	rst,
	io_canWriteMem,
	io_inst,
	io_tensorIdx_valid,
	io_tensorIdx_bits,
	io_start,
	io_done
);
	input clk;
	input rst;
	input io_canWriteMem;
	input [127:0] io_inst;
	output wire io_tensorIdx_valid;
	output wire [10:0] io_tensorIdx_bits;
	input io_start;
	output wire io_done;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [3:0] dec_ypad_0 = io_inst[115:112];
	wire [3:0] dec_ypad_1 = io_inst[119:116];
	wire [3:0] dec_xpad_0 = io_inst[123:120];
	wire [3:0] dec_xpad_1 = io_inst[127:124];
	reg [2:0] zpState;
	reg [23:0] zpColIdx;
	reg [23:0] zpRowIdx;
	reg [15:0] zpDestRowOffset;
	wire [15:0] _GEN_35 = {12'd0, dec_ypad_0};
	wire [15:0] _zpLastDataRow_T_1 = _GEN_35 + dec_ysize;
	wire [15:0] _zpLastDataRow_T_3 = _zpLastDataRow_T_1 - 16'h0001;
	wire [23:0] _GEN_36 = {8'd0, _zpLastDataRow_T_3};
	wire zpLastDataRow = zpRowIdx == _GEN_36;
	wire [15:0] _GEN_37 = {12'd0, dec_xpad_0};
	wire [15:0] _zpTopLastIdx_T_1 = _GEN_37 + dec_xsize;
	wire [15:0] _GEN_38 = {12'd0, dec_xpad_1};
	wire [15:0] _zpTopLastIdx_T_3 = _zpTopLastIdx_T_1 + _GEN_38;
	wire [15:0] zpTopLastIdx = _zpTopLastIdx_T_3 - 16'h0001;
	wire _zpWideLineEnd_T = zpState == 3'h4;
	wire _zpWideLineEnd_T_1 = zpState == 3'h3;
	wire [23:0] _GEN_39 = {8'd0, zpTopLastIdx};
	wire _zpWideLineEnd_T_3 = zpColIdx == _GEN_39;
	wire zpWideLineEnd = ((zpState == 3'h4) | (zpState == 3'h3)) & (zpColIdx == _GEN_39);
	wire [3:0] _zpNarwLineEnd_T_2 = dec_xpad_0 - 4'h1;
	wire [23:0] _GEN_40 = {20'd0, _zpNarwLineEnd_T_2};
	wire _zpNarwLineEnd_T_3 = zpColIdx == _GEN_40;
	wire zpNarwLineEnd = (zpState == 3'h2) & (zpColIdx == _GEN_40);
	wire zpFillLineEnd = zpWideLineEnd | zpNarwLineEnd;
	wire _T_1 = dec_xpad_1 != 4'h0;
	wire _T_2 = (dec_xpad_0 == 4'h0) & (dec_xpad_1 != 4'h0);
	wire [15:0] _GEN_0 = (((dec_xpad_0 == 4'h0) & (dec_xpad_1 != 4'h0)) & (dec_ypad_0 == 4'h0) ? _zpTopLastIdx_T_1 : 16'h0000);
	wire _T_6 = dec_xpad_0 != 4'h0;
	wire _T_15 = dec_ypad_1 != 4'h0;
	wire [2:0] _GEN_1 = (dec_ypad_1 != 4'h0 ? 3'h5 : 3'h0);
	wire [2:0] _GEN_2 = (_T_6 & _T_1 ? 3'h4 : _GEN_1);
	wire [2:0] _GEN_3 = (_T_2 ? 3'h3 : _GEN_2);
	wire [2:0] _GEN_4 = ((dec_xpad_0 != 4'h0) & (dec_xpad_1 == 4'h0) ? 3'h2 : _GEN_3);
	wire _T_16 = zpState == 3'h1;
	wire _T_17 = io_canWriteMem & _T_16;
	wire [3:0] _T_19 = dec_ypad_0 - 4'h1;
	wire [23:0] _GEN_42 = {20'd0, _T_19};
	wire _T_20 = zpRowIdx == _GEN_42;
	wire _T_21 = _T_17 & _T_20;
	wire _T_23 = _T_21 & _zpWideLineEnd_T_3;
	wire [15:0] _GEN_6 = (_T_2 ? _zpTopLastIdx_T_1 : 16'h0000);
	wire _T_38 = zpState == 3'h5;
	wire _T_39 = (zpFillLineEnd & io_canWriteMem) | _T_38;
	wire _T_40 = zpLastDataRow & _T_39;
	wire [23:0] _GEN_11 = (_T_15 ? 24'h000000 : zpColIdx);
	wire [2:0] _GEN_12 = (_T_15 ? 3'h6 : 3'h0);
	wire _T_42 = zpState == 3'h6;
	wire _T_43 = io_canWriteMem & _T_42;
	wire [15:0] _GEN_46 = {12'd0, dec_ypad_1};
	wire [15:0] _T_47 = _zpLastDataRow_T_1 + _GEN_46;
	wire [15:0] _T_49 = _T_47 - 16'h0001;
	wire [23:0] _GEN_47 = {8'd0, _T_49};
	wire _T_50 = zpRowIdx == _GEN_47;
	wire _T_51 = _T_43 & _T_50;
	wire _T_53 = _T_51 & _zpWideLineEnd_T_3;
	wire [23:0] _GEN_14 = (_T_53 ? 24'h000000 : zpColIdx);
	wire [2:0] _GEN_15 = (_T_53 ? 3'h0 : zpState);
	wire _GEN_16 = _T_40 | _T_53;
	wire [23:0] _GEN_17 = (_T_40 ? _GEN_11 : _GEN_14);
	wire _GEN_19 = _T_23 | _GEN_16;
	wire [23:0] _GEN_20 = (_T_23 ? {8'd0, _GEN_6} : _GEN_17);
	wire [23:0] _GEN_24 = (io_start ? {8'd0, _GEN_0} : _GEN_20);
	wire zpNewFillBlock = (io_start ? 1'h0 : _GEN_19);
	wire isZeroPadWrite = ((zpState != 3'h0) & (zpState != 3'h5)) & io_canWriteMem;
	wire [23:0] _GEN_49 = {8'd0, zpDestRowOffset};
	wire [23:0] _zpDestIdx_T_1 = _GEN_49 + zpColIdx;
	wire _T_62 = (((_T_16 | _zpWideLineEnd_T) | _zpWideLineEnd_T_1) | _T_42) & _zpWideLineEnd_T_3;
	wire _T_68 = _T_62 | zpNarwLineEnd;
	wire incrementRow = (_T_68 & io_canWriteMem) | _T_38;
	wire [15:0] _zpDestRowOffset_T_1 = zpDestRowOffset + zpTopLastIdx;
	wire [15:0] _zpDestRowOffset_T_3 = _zpDestRowOffset_T_1 + 16'h0001;
	wire [23:0] _zpRowIdx_T_1 = zpRowIdx + 24'h000001;
	wire _T_72 = ~zpNewFillBlock;
	wire [15:0] _GEN_27 = (_zpWideLineEnd_T_1 ? _zpTopLastIdx_T_1 : 16'h0000);
	wire [23:0] _GEN_54 = {8'd0, dec_xsize};
	wire [23:0] _zpColIdx_T_7 = zpColIdx + _GEN_54;
	wire [23:0] _zpColIdx_T_9 = _zpColIdx_T_7 + 24'h000001;
	wire [23:0] _zpColIdx_T_11 = zpColIdx + 24'h000001;
	wire [15:0] zpDestIdx = _zpDestIdx_T_1[15:0];
	assign io_tensorIdx_valid = ((zpState != 3'h0) & (zpState != 3'h5)) & io_canWriteMem;
	assign io_tensorIdx_bits = zpDestIdx[10:0];
	assign io_done = zpState == 3'h0;
	always @(posedge clk) begin
		if (rst)
			zpState <= 3'h0;
		else if (io_start) begin
			if (dec_ypad_0 != 4'h0)
				zpState <= 3'h1;
			else
				zpState <= _GEN_4;
		end
		else if (_T_23)
			zpState <= _GEN_4;
		else if (_T_40)
			zpState <= _GEN_12;
		else
			zpState <= _GEN_15;
		if ((isZeroPadWrite & _T_72) & ~incrementRow) begin
			if (_zpWideLineEnd_T & _zpNarwLineEnd_T_3)
				zpColIdx <= _zpColIdx_T_9;
			else
				zpColIdx <= _zpColIdx_T_11;
		end
		else if (incrementRow) begin
			if (~zpNewFillBlock)
				zpColIdx <= {8'd0, _GEN_27};
			else
				zpColIdx <= _GEN_24;
		end
		else
			zpColIdx <= _GEN_24;
		if (incrementRow)
			zpRowIdx <= _zpRowIdx_T_1;
		else if (io_start)
			zpRowIdx <= 24'h000000;
		if (incrementRow)
			zpDestRowOffset <= _zpDestRowOffset_T_3;
		else if (io_start)
			zpDestRowOffset <= dec_sram_offset;
	end
endmodule
module TensorLoadNarrowVME (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [7:0] io_tensor_rd_0_data_bits_0_0;
	output wire [7:0] io_tensor_rd_0_data_bits_0_1;
	output wire [7:0] io_tensor_rd_0_data_bits_0_2;
	output wire [7:0] io_tensor_rd_0_data_bits_0_3;
	output wire [7:0] io_tensor_rd_0_data_bits_0_4;
	output wire [7:0] io_tensor_rd_0_data_bits_0_5;
	output wire [7:0] io_tensor_rd_0_data_bits_0_6;
	output wire [7:0] io_tensor_rd_0_data_bits_0_7;
	output wire [7:0] io_tensor_rd_0_data_bits_0_8;
	output wire [7:0] io_tensor_rd_0_data_bits_0_9;
	output wire [7:0] io_tensor_rd_0_data_bits_0_10;
	output wire [7:0] io_tensor_rd_0_data_bits_0_11;
	output wire [7:0] io_tensor_rd_0_data_bits_0_12;
	output wire [7:0] io_tensor_rd_0_data_bits_0_13;
	output wire [7:0] io_tensor_rd_0_data_bits_0_14;
	output wire [7:0] io_tensor_rd_0_data_bits_0_15;
	wire vmeCmd_clock;
	wire vmeCmd_reset;
	wire vmeCmd_io_start;
	wire vmeCmd_io_isBusy;
	wire [127:0] vmeCmd_io_inst;
	wire [63:0] vmeCmd_io_baddr;
	wire vmeCmd_io_vmeCmd_ready;
	wire vmeCmd_io_vmeCmd_valid;
	wire [63:0] vmeCmd_io_vmeCmd_bits_addr;
	wire [7:0] vmeCmd_io_vmeCmd_bits_len;
	wire [20:0] vmeCmd_io_vmeCmd_bits_tag;
	wire [8:0] vmeCmd_io_readLen;
	wire vmeCmd_io_done;
	wire readData_clock;
	wire readData_reset;
	wire readData_io_start;
	wire readData_io_vmeData_ready;
	wire readData_io_vmeData_valid;
	wire [20:0] readData_io_vmeData_bits_tag;
	wire [10:0] readData_io_idx;
	wire readData_io_col;
	wire fillPadding_clock;
	wire fillPadding_reset;
	wire fillPadding_io_canWriteMem;
	wire [127:0] fillPadding_io_inst;
	wire fillPadding_io_tensorIdx_valid;
	wire [10:0] fillPadding_io_tensorIdx_bits;
	wire fillPadding_io_start;
	wire fillPadding_io_done;
	reg [63:0] tensorFile_0 [0:2047];
	wire tensorFile_0_MPORT_2_en;
	wire [10:0] tensorFile_0_MPORT_2_addr;
	wire [63:0] tensorFile_0_MPORT_2_data;
	wire [63:0] tensorFile_0_MPORT_data;
	wire [10:0] tensorFile_0_MPORT_addr;
	wire tensorFile_0_MPORT_mask;
	wire tensorFile_0_MPORT_en;
	reg tensorFile_0_MPORT_2_en_pipe_0;
	reg [10:0] tensorFile_0_MPORT_2_addr_pipe_0;
	reg [63:0] tensorFile_1 [0:2047];
	wire tensorFile_1_MPORT_3_en;
	wire [10:0] tensorFile_1_MPORT_3_addr;
	wire [63:0] tensorFile_1_MPORT_3_data;
	wire [63:0] tensorFile_1_MPORT_1_data;
	wire [10:0] tensorFile_1_MPORT_1_addr;
	wire tensorFile_1_MPORT_1_mask;
	wire tensorFile_1_MPORT_1_en;
	reg tensorFile_1_MPORT_3_en_pipe_0;
	reg [10:0] tensorFile_1_MPORT_3_addr_pipe_0;
	reg state;
	reg [11:0] blocksInFlight;
	wire loadDone = ((blocksInFlight == 12'h000) & vmeCmd_io_done) & state;
	wire localDone = loadDone & fillPadding_io_done;
	wire _GEN_0 = (localDone ? 1'h0 : state);
	wire _GEN_1 = io_start | _GEN_0;
	reg [63:0] vmeDataBitsPipe_data;
	reg [20:0] vmeDataBitsPipe_tag;
	reg vmeDataValidPipe;
	reg vmeDataReadyPipe;
	wire vmeDataFirePipe = vmeDataValidPipe & vmeDataReadyPipe;
	wire _T = io_vme_rd_cmd_ready & io_vme_rd_cmd_valid;
	wire _T_1 = state & _T;
	wire _T_3 = (state & _T) & ~vmeDataFirePipe;
	wire [11:0] _GEN_22 = {3'd0, vmeCmd_io_readLen};
	wire [11:0] _blocksInFlight_T_1 = blocksInFlight + _GEN_22;
	wire _T_6 = _T_1 & vmeDataFirePipe;
	wire [11:0] _blocksInFlight_T_5 = _blocksInFlight_T_1 - 12'h001;
	wire _T_10 = (state & ~_T) & vmeDataFirePipe;
	wire _T_13 = ~rst;
	wire [11:0] _blocksInFlight_T_7 = blocksInFlight - 12'h001;
	reg [127:0] fillPadding_io_inst_REG;
	reg fillPadding_io_start_REG;
	wire [10:0] waddrTensInstrTmp = (fillPadding_io_tensorIdx_valid ? fillPadding_io_tensorIdx_bits : readData_io_idx);
	wire _waddr_0_T = ~state;
	wire wenTensInstr_0 = fillPadding_io_tensorIdx_valid | (~readData_io_col & vmeDataFirePipe);
	wire wenTensInstr_1 = fillPadding_io_tensorIdx_valid | (readData_io_col & vmeDataFirePipe);
	wire [63:0] wdataTensInstr_0 = (fillPadding_io_tensorIdx_valid ? 64'h0000000000000000 : vmeDataBitsPipe_data);
	reg rvalid;
	wire [63:0] _WIRE_2_1 = tensorFile_1_MPORT_3_data;
	wire [63:0] _WIRE_2_0 = tensorFile_0_MPORT_2_data;
	wire [127:0] _T_24 = {_WIRE_2_1, _WIRE_2_0};
	GenVMECmd vmeCmd(
		.clk(vmeCmd_clock),
		.rst(vmeCmd_reset),
		.io_start(vmeCmd_io_start),
		.io_isBusy(vmeCmd_io_isBusy),
		.io_inst(vmeCmd_io_inst),
		.io_baddr(vmeCmd_io_baddr),
		.io_vmeCmd_ready(vmeCmd_io_vmeCmd_ready),
		.io_vmeCmd_valid(vmeCmd_io_vmeCmd_valid),
		.io_vmeCmd_bits_addr(vmeCmd_io_vmeCmd_bits_addr),
		.io_vmeCmd_bits_len(vmeCmd_io_vmeCmd_bits_len),
		.io_vmeCmd_bits_tag(vmeCmd_io_vmeCmd_bits_tag),
		.io_readLen(vmeCmd_io_readLen),
		.io_done(vmeCmd_io_done)
	);
	ReadVMEData readData(
		.clk(readData_clock),
		.rst(readData_reset),
		.io_start(readData_io_start),
		.io_vmeData_ready(readData_io_vmeData_ready),
		.io_vmeData_valid(readData_io_vmeData_valid),
		.io_vmeData_bits_tag(readData_io_vmeData_bits_tag),
		.io_idx(readData_io_idx),
		.io_col(readData_io_col)
	);
	ZeroPadding fillPadding(
		.clk(fillPadding_clock),
		.rst(fillPadding_reset),
		.io_canWriteMem(fillPadding_io_canWriteMem),
		.io_inst(fillPadding_io_inst),
		.io_tensorIdx_valid(fillPadding_io_tensorIdx_valid),
		.io_tensorIdx_bits(fillPadding_io_tensorIdx_bits),
		.io_start(fillPadding_io_start),
		.io_done(fillPadding_io_done)
	);
	assign tensorFile_0_MPORT_2_en = tensorFile_0_MPORT_2_en_pipe_0;
	assign tensorFile_0_MPORT_2_addr = tensorFile_0_MPORT_2_addr_pipe_0;
	assign tensorFile_0_MPORT_2_data = tensorFile_0[tensorFile_0_MPORT_2_addr];
	assign tensorFile_0_MPORT_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_0_MPORT_addr = (_waddr_0_T ? 11'h000 : waddrTensInstrTmp);
	assign tensorFile_0_MPORT_mask = 1'h1;
	assign tensorFile_0_MPORT_en = (_waddr_0_T ? 1'h0 : wenTensInstr_0);
	assign tensorFile_1_MPORT_3_en = tensorFile_1_MPORT_3_en_pipe_0;
	assign tensorFile_1_MPORT_3_addr = tensorFile_1_MPORT_3_addr_pipe_0;
	assign tensorFile_1_MPORT_3_data = tensorFile_1[tensorFile_1_MPORT_3_addr];
	assign tensorFile_1_MPORT_1_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_1_MPORT_1_addr = (_waddr_0_T ? 11'h000 : waddrTensInstrTmp);
	assign tensorFile_1_MPORT_1_mask = 1'h1;
	assign tensorFile_1_MPORT_1_en = (_waddr_0_T ? 1'h0 : wenTensInstr_1);
	assign io_done = loadDone & fillPadding_io_done;
	assign io_vme_rd_cmd_valid = vmeCmd_io_vmeCmd_valid;
	assign io_vme_rd_cmd_bits_addr = vmeCmd_io_vmeCmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = vmeCmd_io_vmeCmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = vmeCmd_io_vmeCmd_bits_tag;
	assign io_vme_rd_data_ready = 1'h1;
	assign io_tensor_rd_0_data_valid = rvalid;
	assign io_tensor_rd_0_data_bits_0_0 = _T_24[7:0];
	assign io_tensor_rd_0_data_bits_0_1 = _T_24[15:8];
	assign io_tensor_rd_0_data_bits_0_2 = _T_24[23:16];
	assign io_tensor_rd_0_data_bits_0_3 = _T_24[31:24];
	assign io_tensor_rd_0_data_bits_0_4 = _T_24[39:32];
	assign io_tensor_rd_0_data_bits_0_5 = _T_24[47:40];
	assign io_tensor_rd_0_data_bits_0_6 = _T_24[55:48];
	assign io_tensor_rd_0_data_bits_0_7 = _T_24[63:56];
	assign io_tensor_rd_0_data_bits_0_8 = _T_24[71:64];
	assign io_tensor_rd_0_data_bits_0_9 = _T_24[79:72];
	assign io_tensor_rd_0_data_bits_0_10 = _T_24[87:80];
	assign io_tensor_rd_0_data_bits_0_11 = _T_24[95:88];
	assign io_tensor_rd_0_data_bits_0_12 = _T_24[103:96];
	assign io_tensor_rd_0_data_bits_0_13 = _T_24[111:104];
	assign io_tensor_rd_0_data_bits_0_14 = _T_24[119:112];
	assign io_tensor_rd_0_data_bits_0_15 = _T_24[127:120];
	assign vmeCmd_clock = clk;
	assign vmeCmd_reset = rst;
	assign vmeCmd_io_start = io_start;
	assign vmeCmd_io_isBusy = state;
	assign vmeCmd_io_inst = io_inst;
	assign vmeCmd_io_baddr = io_baddr;
	assign vmeCmd_io_vmeCmd_ready = io_vme_rd_cmd_ready;
	assign readData_clock = clk;
	assign readData_reset = rst;
	assign readData_io_start = io_start;
	assign readData_io_vmeData_valid = vmeDataValidPipe;
	assign readData_io_vmeData_bits_tag = vmeDataBitsPipe_tag;
	assign fillPadding_clock = clk;
	assign fillPadding_reset = rst;
	assign fillPadding_io_canWriteMem = ~vmeDataFirePipe;
	assign fillPadding_io_inst = fillPadding_io_inst_REG;
	assign fillPadding_io_start = fillPadding_io_start_REG;
	always @(posedge clk) begin
		if (tensorFile_0_MPORT_en & tensorFile_0_MPORT_mask)
			tensorFile_0[tensorFile_0_MPORT_addr] <= tensorFile_0_MPORT_data;
		tensorFile_0_MPORT_2_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_0_MPORT_2_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_1_MPORT_1_en & tensorFile_1_MPORT_1_mask)
			tensorFile_1[tensorFile_1_MPORT_1_addr] <= tensorFile_1_MPORT_1_data;
		tensorFile_1_MPORT_3_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_1_MPORT_3_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (rst)
			state <= 1'h0;
		else
			state <= _GEN_1;
		if (io_start)
			blocksInFlight <= 12'h000;
		else if ((state & _T) & ~vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_1;
		else if (_T_1 & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_5;
		else if ((state & ~_T) & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_7;
		vmeDataBitsPipe_data <= io_vme_rd_data_bits_data;
		vmeDataBitsPipe_tag <= io_vme_rd_data_bits_tag;
		if (rst)
			vmeDataValidPipe <= 1'h0;
		else
			vmeDataValidPipe <= io_vme_rd_data_valid;
		if (rst)
			vmeDataReadyPipe <= 1'h0;
		else
			vmeDataReadyPipe <= io_vme_rd_data_ready;
		fillPadding_io_inst_REG <= io_inst;
		if (rst)
			fillPadding_io_start_REG <= 1'h0;
		else
			fillPadding_io_start_REG <= io_start;
		if (rst)
			rvalid <= 1'h0;
		else
			rvalid <= io_tensor_rd_0_idx_valid;
		if (((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst) & ~(blocksInFlight > 12'h000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:95 assert(blocksInFlight > 0.U)\n");
	end
	always @(posedge clk) begin
		if ((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst)
			;
		if (_T_13)
			;
	end
endmodule
module TensorLoadInp (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [7:0] io_tensor_rd_0_data_bits_0_0;
	output wire [7:0] io_tensor_rd_0_data_bits_0_1;
	output wire [7:0] io_tensor_rd_0_data_bits_0_2;
	output wire [7:0] io_tensor_rd_0_data_bits_0_3;
	output wire [7:0] io_tensor_rd_0_data_bits_0_4;
	output wire [7:0] io_tensor_rd_0_data_bits_0_5;
	output wire [7:0] io_tensor_rd_0_data_bits_0_6;
	output wire [7:0] io_tensor_rd_0_data_bits_0_7;
	output wire [7:0] io_tensor_rd_0_data_bits_0_8;
	output wire [7:0] io_tensor_rd_0_data_bits_0_9;
	output wire [7:0] io_tensor_rd_0_data_bits_0_10;
	output wire [7:0] io_tensor_rd_0_data_bits_0_11;
	output wire [7:0] io_tensor_rd_0_data_bits_0_12;
	output wire [7:0] io_tensor_rd_0_data_bits_0_13;
	output wire [7:0] io_tensor_rd_0_data_bits_0_14;
	output wire [7:0] io_tensor_rd_0_data_bits_0_15;
	wire tensorLoad_clock;
	wire tensorLoad_reset;
	wire tensorLoad_io_start;
	wire tensorLoad_io_done;
	wire [127:0] tensorLoad_io_inst;
	wire [63:0] tensorLoad_io_baddr;
	wire tensorLoad_io_vme_rd_cmd_ready;
	wire tensorLoad_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_io_vme_rd_data_ready;
	wire tensorLoad_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_io_vme_rd_data_bits_tag;
	wire tensorLoad_io_tensor_rd_0_idx_valid;
	wire [10:0] tensorLoad_io_tensor_rd_0_idx_bits;
	wire tensorLoad_io_tensor_rd_0_data_valid;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_15;
	TensorLoadNarrowVME tensorLoad(
		.clk(tensorLoad_clock),
		.rst(tensorLoad_reset),
		.io_start(tensorLoad_io_start),
		.io_done(tensorLoad_io_done),
		.io_inst(tensorLoad_io_inst),
		.io_baddr(tensorLoad_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_ready(tensorLoad_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(tensorLoad_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorLoad_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorLoad_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorLoad_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorLoad_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorLoad_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorLoad_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorLoad_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorLoad_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorLoad_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorLoad_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorLoad_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorLoad_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorLoad_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorLoad_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorLoad_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorLoad_io_tensor_rd_0_data_bits_0_15)
	);
	assign io_done = tensorLoad_io_done;
	assign io_vme_rd_cmd_valid = tensorLoad_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = tensorLoad_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = tensorLoad_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = tensorLoad_io_vme_rd_cmd_bits_tag;
	assign io_tensor_rd_0_data_valid = tensorLoad_io_tensor_rd_0_data_valid;
	assign io_tensor_rd_0_data_bits_0_0 = tensorLoad_io_tensor_rd_0_data_bits_0_0;
	assign io_tensor_rd_0_data_bits_0_1 = tensorLoad_io_tensor_rd_0_data_bits_0_1;
	assign io_tensor_rd_0_data_bits_0_2 = tensorLoad_io_tensor_rd_0_data_bits_0_2;
	assign io_tensor_rd_0_data_bits_0_3 = tensorLoad_io_tensor_rd_0_data_bits_0_3;
	assign io_tensor_rd_0_data_bits_0_4 = tensorLoad_io_tensor_rd_0_data_bits_0_4;
	assign io_tensor_rd_0_data_bits_0_5 = tensorLoad_io_tensor_rd_0_data_bits_0_5;
	assign io_tensor_rd_0_data_bits_0_6 = tensorLoad_io_tensor_rd_0_data_bits_0_6;
	assign io_tensor_rd_0_data_bits_0_7 = tensorLoad_io_tensor_rd_0_data_bits_0_7;
	assign io_tensor_rd_0_data_bits_0_8 = tensorLoad_io_tensor_rd_0_data_bits_0_8;
	assign io_tensor_rd_0_data_bits_0_9 = tensorLoad_io_tensor_rd_0_data_bits_0_9;
	assign io_tensor_rd_0_data_bits_0_10 = tensorLoad_io_tensor_rd_0_data_bits_0_10;
	assign io_tensor_rd_0_data_bits_0_11 = tensorLoad_io_tensor_rd_0_data_bits_0_11;
	assign io_tensor_rd_0_data_bits_0_12 = tensorLoad_io_tensor_rd_0_data_bits_0_12;
	assign io_tensor_rd_0_data_bits_0_13 = tensorLoad_io_tensor_rd_0_data_bits_0_13;
	assign io_tensor_rd_0_data_bits_0_14 = tensorLoad_io_tensor_rd_0_data_bits_0_14;
	assign io_tensor_rd_0_data_bits_0_15 = tensorLoad_io_tensor_rd_0_data_bits_0_15;
	assign tensorLoad_clock = clk;
	assign tensorLoad_reset = rst;
	assign tensorLoad_io_start = io_start;
	assign tensorLoad_io_inst = io_inst;
	assign tensorLoad_io_baddr = io_baddr;
	assign tensorLoad_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign tensorLoad_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign tensorLoad_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign tensorLoad_io_vme_rd_data_bits_tag = io_vme_rd_data_bits_tag;
	assign tensorLoad_io_tensor_rd_0_idx_valid = io_tensor_rd_0_idx_valid;
	assign tensorLoad_io_tensor_rd_0_idx_bits = io_tensor_rd_0_idx_bits;
endmodule
module GenVMECmd_1 (
	clk,
	rst,
	io_start,
	io_isBusy,
	io_inst,
	io_baddr,
	io_vmeCmd_ready,
	io_vmeCmd_valid,
	io_vmeCmd_bits_addr,
	io_vmeCmd_bits_len,
	io_vmeCmd_bits_tag,
	io_readLen,
	io_done
);
	input clk;
	input rst;
	input io_start;
	input io_isBusy;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vmeCmd_ready;
	output wire io_vmeCmd_valid;
	output wire [63:0] io_vmeCmd_bits_addr;
	output wire [7:0] io_vmeCmd_bits_len;
	output wire [20:0] io_vmeCmd_bits_tag;
	output wire [8:0] io_readLen;
	output wire io_done;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [31:0] dec_dram_offset = io_inst[57:26];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [15:0] dec_xstride = io_inst[111:96];
	wire [3:0] dec_ypad_0 = io_inst[115:112];
	wire [3:0] dec_xpad_0 = io_inst[123:120];
	wire [3:0] dec_xpad_1 = io_inst[127:124];
	reg [63:0] rdCmdExtAddr;
	wire [39:0] _xfer_init_addr_T = {dec_dram_offset, 8'h00};
	wire [39:0] _xfer_init_addr_T_1 = 40'h00ffffffff & _xfer_init_addr_T;
	wire [63:0] _GEN_31 = {24'd0, _xfer_init_addr_T_1};
	wire [63:0] xfer_init_addr = io_baddr | _GEN_31;
	wire [63:0] _GEN_0 = rdCmdExtAddr % 64'h0000000000000800;
	wire [11:0] _firstMaxTransfer_T = _GEN_0[11:0];
	wire [11:0] _firstMaxTransfer_T_2 = 12'h800 - _firstMaxTransfer_T;
	wire [8:0] firstMaxTransfer = _firstMaxTransfer_T_2[11:3];
	reg [9:0] rdCmdStartIdx;
	reg commandsDone;
	wire [20:0] blocksReadSize = {dec_xsize, 5'h00};
	reg [20:0] blocksReadNb;
	reg [63:0] rdCmdExtAddrRowBegin;
	reg newReadRow;
	reg [15:0] srcRowIdx;
	wire [15:0] _srcRowIdx_T_1 = srcRowIdx + 16'h0001;
	wire [20:0] blocksRemained = blocksReadSize - blocksReadNb;
	wire [20:0] _GEN_32 = {12'd0, firstMaxTransfer};
	wire [20:0] _GEN_8 = (blocksRemained < _GEN_32 ? blocksRemained : {12'd0, firstMaxTransfer});
	wire [20:0] _GEN_9 = (blocksRemained < 21'h000100 ? blocksRemained : 21'h000100);
	wire [20:0] _GEN_10 = (newReadRow ? _GEN_8 : _GEN_9);
	wire [8:0] readLen = _GEN_10[8:0];
	wire [20:0] _GEN_33 = {12'd0, readLen};
	wire [20:0] _T_8 = blocksReadSize - _GEN_33;
	wire [15:0] _T_11 = dec_ysize - 16'h0001;
	wire _T_14 = io_vmeCmd_ready & io_vmeCmd_valid;
	wire stride = ((blocksReadNb == _T_8) & (srcRowIdx != _T_11)) & _T_14;
	wire [20:0] nextBlRNb = blocksReadNb + _GEN_33;
	wire _GEN_2 = ((nextBlRNb == blocksReadSize) & (srcRowIdx == _T_11)) | commandsDone;
	wire _GEN_4 = (_T_14 ? _GEN_2 : commandsDone);
	wire _GEN_6 = (io_start | stride ? 1'h0 : _GEN_4);
	wire _T_20 = ~rst;
	wire [15:0] _GEN_35 = {12'd0, dec_xpad_0};
	wire [15:0] _totalWidth_T_1 = dec_xsize + _GEN_35;
	wire [15:0] _GEN_36 = {12'd0, dec_xpad_1};
	wire [15:0] totalWidth = _totalWidth_T_1 + _GEN_36;
	reg [19:0] currentRowIdx;
	wire [19:0] _GEN_37 = {16'd0, dec_ypad_0};
	wire [15:0] _GEN_38 = {12'd0, dec_ypad_0};
	wire [15:0] _rdCmdStartIdxValid_T_2 = dec_ysize + _GEN_38;
	wire [19:0] _GEN_39 = {4'd0, _rdCmdStartIdxValid_T_2};
	wire _rdCmdStartIdxValid_T_3 = currentRowIdx < _GEN_39;
	wire _rdCmdStartIdxValid_T_4 = (currentRowIdx >= _GEN_37) & _rdCmdStartIdxValid_T_3;
	wire _rdCmdStartIdxValid_T_5 = _rdCmdStartIdxValid_T_4 & io_isBusy;
	wire _rdCmdStartIdxValid_T_6 = ~commandsDone;
	wire rdCmdStartIdxValid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	wire [15:0] _rdCmdStartIdx_T_1 = dec_sram_offset + _GEN_35;
	wire [15:0] _GEN_42 = {6'd0, rdCmdStartIdx};
	wire [15:0] _rdCmdStartIdx_T_3 = _GEN_42 + totalWidth;
	wire [19:0] _currentRowIdx_T_1 = currentRowIdx + 20'h00001;
	wire [15:0] _GEN_11 = (io_isBusy & ((currentRowIdx < _GEN_37) | stride) ? _rdCmdStartIdx_T_3 : {6'd0, rdCmdStartIdx});
	wire [15:0] _GEN_14 = (io_start ? _rdCmdStartIdx_T_1 : _GEN_11);
	wire startIssueCmdRead = (blocksReadNb == 21'h000000) & rdCmdStartIdxValid;
	wire [23:0] _memRow_T = {dec_xstride, 8'h00};
	wire [63:0] _GEN_43 = {40'd0, _memRow_T};
	wire [63:0] memRow = rdCmdExtAddrRowBegin + _GEN_43;
	wire [11:0] _rdCmdExtAddr_T = {readLen, 3'h0};
	wire [63:0] _GEN_44 = {52'd0, _rdCmdExtAddr_T};
	wire [63:0] _rdCmdExtAddr_T_2 = rdCmdExtAddr + _GEN_44;
	wire _GEN_21 = (_T_14 ? stride : newReadRow);
	reg [14:0] rdCmdDestBlockIdxNext;
	wire [14:0] _rdCmdDestBlockIdx_T = {rdCmdStartIdx, 5'h00};
	wire [14:0] _GEN_26 = (startIssueCmdRead ? _rdCmdDestBlockIdx_T : rdCmdDestBlockIdxNext);
	wire [14:0] rdCmdDestBlockIdx = (rdCmdStartIdxValid ? _GEN_26 : rdCmdDestBlockIdxNext);
	wire [14:0] _GEN_45 = {6'd0, readLen};
	wire [14:0] _rdCmdDestBlockIdxNext_T_1 = rdCmdDestBlockIdx + _GEN_45;
	wire [14:0] _rdCmdDestBlockIdxNext_T_3 = rdCmdDestBlockIdxNext + _GEN_45;
	wire [8:0] _io_vmeCmd_bits_len_T_1 = readLen - 9'h001;
	assign io_vmeCmd_valid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	assign io_vmeCmd_bits_addr = rdCmdExtAddr;
	assign io_vmeCmd_bits_len = _io_vmeCmd_bits_len_T_1[7:0];
	assign io_vmeCmd_bits_tag = {6'd0, rdCmdDestBlockIdx};
	assign io_readLen = _GEN_10[8:0];
	assign io_done = commandsDone;
	always @(posedge clk) begin
		if (io_start)
			rdCmdExtAddr <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddr <= memRow;
			else
				rdCmdExtAddr <= _rdCmdExtAddr_T_2;
		end
		rdCmdStartIdx <= _GEN_14[9:0];
		commandsDone <= rst | _GEN_6;
		if (io_start | stride)
			blocksReadNb <= 21'h000000;
		else if (_T_14)
			blocksReadNb <= nextBlRNb;
		if (io_start)
			rdCmdExtAddrRowBegin <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddrRowBegin <= memRow;
		end
		newReadRow <= io_start | _GEN_21;
		if (io_start)
			srcRowIdx <= 16'h0000;
		else if (stride)
			srcRowIdx <= _srcRowIdx_T_1;
		if (io_start)
			currentRowIdx <= 20'h00000;
		else if (io_isBusy & ((currentRowIdx < _GEN_37) | stride))
			currentRowIdx <= _currentRowIdx_T_1;
		if (rdCmdStartIdxValid) begin
			if (startIssueCmdRead)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_1;
			else if (_T_14)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_3;
		end
		if (~rst & ~(~io_isBusy | (blocksReadSize >= blocksReadNb)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:627 assert(!io.isBusy || blocksReadSize >= blocksReadNb)// define how many block to read at this cycle\n");
		if (_T_20 & ~(~io_vmeCmd_valid | (_rdCmdExtAddr_T <= _firstMaxTransfer_T_2)))
			$fwrite(32'h80000002, "Assertion failed: -F- wgt DRAM page alignment failure. DRAM address + len overlaps mp.lenBits*memBlockSize alignment %x %x\n    at TensorLoadNarrowVME.scala:733 assert(!io.vmeCmd.valid || ((readLen << log2Ceil(mp.dataBits/8)) <= (maxTrBytes - rdCmdExtAddr %% maxTrBytes)),\n", rdCmdExtAddr, readLen);
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_20)
			;
	end
endmodule
module ReadVMEData_1 (
	clk,
	rst,
	io_start,
	io_vmeData_ready,
	io_vmeData_valid,
	io_vmeData_bits_tag,
	io_idx,
	io_col
);
	input clk;
	input rst;
	input io_start;
	output wire io_vmeData_ready;
	input io_vmeData_valid;
	input [20:0] io_vmeData_bits_tag;
	output wire [9:0] io_idx;
	output wire [4:0] io_col;
	reg [20:0] vmeTagDecodeLast;
	wire [15:0] rdDataIdx = io_vmeData_bits_tag[20:5];
	wire [4:0] rdDataCol = io_vmeData_bits_tag[4:0];
	reg [4:0] rdDataDestColNext;
	reg [15:0] rdDataDestIdxNext;
	reg vmeTagDecodeLastValidNext;
	wire _T = io_vmeData_ready & io_vmeData_valid;
	wire _GEN_0 = _T | vmeTagDecodeLastValidNext;
	wire _T_3 = io_vmeData_bits_tag != vmeTagDecodeLast;
	wire _T_4 = vmeTagDecodeLastValidNext & _T_3;
	wire _T_5 = ~vmeTagDecodeLastValidNext | _T_4;
	wire [4:0] _rdDataDestColNext_T_1 = rdDataCol + 5'h01;
	wire [4:0] _rdDataDestColNext_T_3 = rdDataDestColNext + 5'h01;
	wire [4:0] rdDataDestCol = (_T_5 ? rdDataCol : rdDataDestColNext);
	wire [15:0] _rdDataDestIdxNext_T_1 = rdDataDestIdxNext + 16'h0001;
	wire [15:0] rdDataDestIdx = (_T_5 ? rdDataIdx : rdDataDestIdxNext);
	assign io_vmeData_ready = 1'h1;
	assign io_idx = rdDataDestIdx[9:0];
	assign io_col = (_T_5 ? rdDataCol : rdDataDestColNext);
	always @(posedge clk) begin
		if (_T) begin
			if (_T_5)
				vmeTagDecodeLast <= io_vmeData_bits_tag;
		end
		if (_T) begin
			if (_T_5)
				rdDataDestColNext <= _rdDataDestColNext_T_1;
			else
				rdDataDestColNext <= _rdDataDestColNext_T_3;
		end
		if (_T) begin
			if (_T_5)
				rdDataDestIdxNext <= rdDataIdx;
			else if (rdDataDestCol == 5'h1f)
				rdDataDestIdxNext <= _rdDataDestIdxNext_T_1;
		end
		if (rst)
			vmeTagDecodeLastValidNext <= 1'h0;
		else if (io_start)
			vmeTagDecodeLastValidNext <= 1'h0;
		else
			vmeTagDecodeLastValidNext <= _GEN_0;
	end
endmodule
module ZeroPadding_1 (
	clk,
	rst,
	io_canWriteMem,
	io_inst,
	io_tensorIdx_valid,
	io_tensorIdx_bits,
	io_start,
	io_done
);
	input clk;
	input rst;
	input io_canWriteMem;
	input [127:0] io_inst;
	output wire io_tensorIdx_valid;
	output wire [9:0] io_tensorIdx_bits;
	input io_start;
	output wire io_done;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [3:0] dec_ypad_0 = io_inst[115:112];
	wire [3:0] dec_ypad_1 = io_inst[119:116];
	wire [3:0] dec_xpad_0 = io_inst[123:120];
	wire [3:0] dec_xpad_1 = io_inst[127:124];
	reg [2:0] zpState;
	reg [23:0] zpColIdx;
	reg [23:0] zpRowIdx;
	reg [15:0] zpDestRowOffset;
	wire [15:0] _GEN_35 = {12'd0, dec_ypad_0};
	wire [15:0] _zpLastDataRow_T_1 = _GEN_35 + dec_ysize;
	wire [15:0] _zpLastDataRow_T_3 = _zpLastDataRow_T_1 - 16'h0001;
	wire [23:0] _GEN_36 = {8'd0, _zpLastDataRow_T_3};
	wire zpLastDataRow = zpRowIdx == _GEN_36;
	wire [15:0] _GEN_37 = {12'd0, dec_xpad_0};
	wire [15:0] _zpTopLastIdx_T_1 = _GEN_37 + dec_xsize;
	wire [15:0] _GEN_38 = {12'd0, dec_xpad_1};
	wire [15:0] _zpTopLastIdx_T_3 = _zpTopLastIdx_T_1 + _GEN_38;
	wire [15:0] zpTopLastIdx = _zpTopLastIdx_T_3 - 16'h0001;
	wire _zpWideLineEnd_T = zpState == 3'h4;
	wire _zpWideLineEnd_T_1 = zpState == 3'h3;
	wire [23:0] _GEN_39 = {8'd0, zpTopLastIdx};
	wire _zpWideLineEnd_T_3 = zpColIdx == _GEN_39;
	wire zpWideLineEnd = ((zpState == 3'h4) | (zpState == 3'h3)) & (zpColIdx == _GEN_39);
	wire [3:0] _zpNarwLineEnd_T_2 = dec_xpad_0 - 4'h1;
	wire [23:0] _GEN_40 = {20'd0, _zpNarwLineEnd_T_2};
	wire _zpNarwLineEnd_T_3 = zpColIdx == _GEN_40;
	wire zpNarwLineEnd = (zpState == 3'h2) & (zpColIdx == _GEN_40);
	wire zpFillLineEnd = zpWideLineEnd | zpNarwLineEnd;
	wire _T_1 = dec_xpad_1 != 4'h0;
	wire _T_2 = (dec_xpad_0 == 4'h0) & (dec_xpad_1 != 4'h0);
	wire [15:0] _GEN_0 = (((dec_xpad_0 == 4'h0) & (dec_xpad_1 != 4'h0)) & (dec_ypad_0 == 4'h0) ? _zpTopLastIdx_T_1 : 16'h0000);
	wire _T_6 = dec_xpad_0 != 4'h0;
	wire _T_15 = dec_ypad_1 != 4'h0;
	wire [2:0] _GEN_1 = (dec_ypad_1 != 4'h0 ? 3'h5 : 3'h0);
	wire [2:0] _GEN_2 = (_T_6 & _T_1 ? 3'h4 : _GEN_1);
	wire [2:0] _GEN_3 = (_T_2 ? 3'h3 : _GEN_2);
	wire [2:0] _GEN_4 = ((dec_xpad_0 != 4'h0) & (dec_xpad_1 == 4'h0) ? 3'h2 : _GEN_3);
	wire _T_16 = zpState == 3'h1;
	wire _T_17 = io_canWriteMem & _T_16;
	wire [3:0] _T_19 = dec_ypad_0 - 4'h1;
	wire [23:0] _GEN_42 = {20'd0, _T_19};
	wire _T_20 = zpRowIdx == _GEN_42;
	wire _T_21 = _T_17 & _T_20;
	wire _T_23 = _T_21 & _zpWideLineEnd_T_3;
	wire [15:0] _GEN_6 = (_T_2 ? _zpTopLastIdx_T_1 : 16'h0000);
	wire _T_38 = zpState == 3'h5;
	wire _T_39 = (zpFillLineEnd & io_canWriteMem) | _T_38;
	wire _T_40 = zpLastDataRow & _T_39;
	wire [23:0] _GEN_11 = (_T_15 ? 24'h000000 : zpColIdx);
	wire [2:0] _GEN_12 = (_T_15 ? 3'h6 : 3'h0);
	wire _T_42 = zpState == 3'h6;
	wire _T_43 = io_canWriteMem & _T_42;
	wire [15:0] _GEN_46 = {12'd0, dec_ypad_1};
	wire [15:0] _T_47 = _zpLastDataRow_T_1 + _GEN_46;
	wire [15:0] _T_49 = _T_47 - 16'h0001;
	wire [23:0] _GEN_47 = {8'd0, _T_49};
	wire _T_50 = zpRowIdx == _GEN_47;
	wire _T_51 = _T_43 & _T_50;
	wire _T_53 = _T_51 & _zpWideLineEnd_T_3;
	wire [23:0] _GEN_14 = (_T_53 ? 24'h000000 : zpColIdx);
	wire [2:0] _GEN_15 = (_T_53 ? 3'h0 : zpState);
	wire _GEN_16 = _T_40 | _T_53;
	wire [23:0] _GEN_17 = (_T_40 ? _GEN_11 : _GEN_14);
	wire _GEN_19 = _T_23 | _GEN_16;
	wire [23:0] _GEN_20 = (_T_23 ? {8'd0, _GEN_6} : _GEN_17);
	wire [23:0] _GEN_24 = (io_start ? {8'd0, _GEN_0} : _GEN_20);
	wire zpNewFillBlock = (io_start ? 1'h0 : _GEN_19);
	wire isZeroPadWrite = ((zpState != 3'h0) & (zpState != 3'h5)) & io_canWriteMem;
	wire [23:0] _GEN_49 = {8'd0, zpDestRowOffset};
	wire [23:0] _zpDestIdx_T_1 = _GEN_49 + zpColIdx;
	wire _T_62 = (((_T_16 | _zpWideLineEnd_T) | _zpWideLineEnd_T_1) | _T_42) & _zpWideLineEnd_T_3;
	wire _T_68 = _T_62 | zpNarwLineEnd;
	wire incrementRow = (_T_68 & io_canWriteMem) | _T_38;
	wire [15:0] _zpDestRowOffset_T_1 = zpDestRowOffset + zpTopLastIdx;
	wire [15:0] _zpDestRowOffset_T_3 = _zpDestRowOffset_T_1 + 16'h0001;
	wire [23:0] _zpRowIdx_T_1 = zpRowIdx + 24'h000001;
	wire _T_72 = ~zpNewFillBlock;
	wire [15:0] _GEN_27 = (_zpWideLineEnd_T_1 ? _zpTopLastIdx_T_1 : 16'h0000);
	wire [23:0] _GEN_54 = {8'd0, dec_xsize};
	wire [23:0] _zpColIdx_T_7 = zpColIdx + _GEN_54;
	wire [23:0] _zpColIdx_T_9 = _zpColIdx_T_7 + 24'h000001;
	wire [23:0] _zpColIdx_T_11 = zpColIdx + 24'h000001;
	wire [15:0] zpDestIdx = _zpDestIdx_T_1[15:0];
	assign io_tensorIdx_valid = ((zpState != 3'h0) & (zpState != 3'h5)) & io_canWriteMem;
	assign io_tensorIdx_bits = zpDestIdx[9:0];
	assign io_done = zpState == 3'h0;
	always @(posedge clk) begin
		if (rst)
			zpState <= 3'h0;
		else if (io_start) begin
			if (dec_ypad_0 != 4'h0)
				zpState <= 3'h1;
			else
				zpState <= _GEN_4;
		end
		else if (_T_23)
			zpState <= _GEN_4;
		else if (_T_40)
			zpState <= _GEN_12;
		else
			zpState <= _GEN_15;
		if ((isZeroPadWrite & _T_72) & ~incrementRow) begin
			if (_zpWideLineEnd_T & _zpNarwLineEnd_T_3)
				zpColIdx <= _zpColIdx_T_9;
			else
				zpColIdx <= _zpColIdx_T_11;
		end
		else if (incrementRow) begin
			if (~zpNewFillBlock)
				zpColIdx <= {8'd0, _GEN_27};
			else
				zpColIdx <= _GEN_24;
		end
		else
			zpColIdx <= _GEN_24;
		if (incrementRow)
			zpRowIdx <= _zpRowIdx_T_1;
		else if (io_start)
			zpRowIdx <= 24'h000000;
		if (incrementRow)
			zpDestRowOffset <= _zpDestRowOffset_T_3;
		else if (io_start)
			zpDestRowOffset <= dec_sram_offset;
	end
endmodule
module TensorLoadNarrowVME_1 (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15,
	io_tensor_rd_0_data_bits_1_0,
	io_tensor_rd_0_data_bits_1_1,
	io_tensor_rd_0_data_bits_1_2,
	io_tensor_rd_0_data_bits_1_3,
	io_tensor_rd_0_data_bits_1_4,
	io_tensor_rd_0_data_bits_1_5,
	io_tensor_rd_0_data_bits_1_6,
	io_tensor_rd_0_data_bits_1_7,
	io_tensor_rd_0_data_bits_1_8,
	io_tensor_rd_0_data_bits_1_9,
	io_tensor_rd_0_data_bits_1_10,
	io_tensor_rd_0_data_bits_1_11,
	io_tensor_rd_0_data_bits_1_12,
	io_tensor_rd_0_data_bits_1_13,
	io_tensor_rd_0_data_bits_1_14,
	io_tensor_rd_0_data_bits_1_15,
	io_tensor_rd_0_data_bits_2_0,
	io_tensor_rd_0_data_bits_2_1,
	io_tensor_rd_0_data_bits_2_2,
	io_tensor_rd_0_data_bits_2_3,
	io_tensor_rd_0_data_bits_2_4,
	io_tensor_rd_0_data_bits_2_5,
	io_tensor_rd_0_data_bits_2_6,
	io_tensor_rd_0_data_bits_2_7,
	io_tensor_rd_0_data_bits_2_8,
	io_tensor_rd_0_data_bits_2_9,
	io_tensor_rd_0_data_bits_2_10,
	io_tensor_rd_0_data_bits_2_11,
	io_tensor_rd_0_data_bits_2_12,
	io_tensor_rd_0_data_bits_2_13,
	io_tensor_rd_0_data_bits_2_14,
	io_tensor_rd_0_data_bits_2_15,
	io_tensor_rd_0_data_bits_3_0,
	io_tensor_rd_0_data_bits_3_1,
	io_tensor_rd_0_data_bits_3_2,
	io_tensor_rd_0_data_bits_3_3,
	io_tensor_rd_0_data_bits_3_4,
	io_tensor_rd_0_data_bits_3_5,
	io_tensor_rd_0_data_bits_3_6,
	io_tensor_rd_0_data_bits_3_7,
	io_tensor_rd_0_data_bits_3_8,
	io_tensor_rd_0_data_bits_3_9,
	io_tensor_rd_0_data_bits_3_10,
	io_tensor_rd_0_data_bits_3_11,
	io_tensor_rd_0_data_bits_3_12,
	io_tensor_rd_0_data_bits_3_13,
	io_tensor_rd_0_data_bits_3_14,
	io_tensor_rd_0_data_bits_3_15,
	io_tensor_rd_0_data_bits_4_0,
	io_tensor_rd_0_data_bits_4_1,
	io_tensor_rd_0_data_bits_4_2,
	io_tensor_rd_0_data_bits_4_3,
	io_tensor_rd_0_data_bits_4_4,
	io_tensor_rd_0_data_bits_4_5,
	io_tensor_rd_0_data_bits_4_6,
	io_tensor_rd_0_data_bits_4_7,
	io_tensor_rd_0_data_bits_4_8,
	io_tensor_rd_0_data_bits_4_9,
	io_tensor_rd_0_data_bits_4_10,
	io_tensor_rd_0_data_bits_4_11,
	io_tensor_rd_0_data_bits_4_12,
	io_tensor_rd_0_data_bits_4_13,
	io_tensor_rd_0_data_bits_4_14,
	io_tensor_rd_0_data_bits_4_15,
	io_tensor_rd_0_data_bits_5_0,
	io_tensor_rd_0_data_bits_5_1,
	io_tensor_rd_0_data_bits_5_2,
	io_tensor_rd_0_data_bits_5_3,
	io_tensor_rd_0_data_bits_5_4,
	io_tensor_rd_0_data_bits_5_5,
	io_tensor_rd_0_data_bits_5_6,
	io_tensor_rd_0_data_bits_5_7,
	io_tensor_rd_0_data_bits_5_8,
	io_tensor_rd_0_data_bits_5_9,
	io_tensor_rd_0_data_bits_5_10,
	io_tensor_rd_0_data_bits_5_11,
	io_tensor_rd_0_data_bits_5_12,
	io_tensor_rd_0_data_bits_5_13,
	io_tensor_rd_0_data_bits_5_14,
	io_tensor_rd_0_data_bits_5_15,
	io_tensor_rd_0_data_bits_6_0,
	io_tensor_rd_0_data_bits_6_1,
	io_tensor_rd_0_data_bits_6_2,
	io_tensor_rd_0_data_bits_6_3,
	io_tensor_rd_0_data_bits_6_4,
	io_tensor_rd_0_data_bits_6_5,
	io_tensor_rd_0_data_bits_6_6,
	io_tensor_rd_0_data_bits_6_7,
	io_tensor_rd_0_data_bits_6_8,
	io_tensor_rd_0_data_bits_6_9,
	io_tensor_rd_0_data_bits_6_10,
	io_tensor_rd_0_data_bits_6_11,
	io_tensor_rd_0_data_bits_6_12,
	io_tensor_rd_0_data_bits_6_13,
	io_tensor_rd_0_data_bits_6_14,
	io_tensor_rd_0_data_bits_6_15,
	io_tensor_rd_0_data_bits_7_0,
	io_tensor_rd_0_data_bits_7_1,
	io_tensor_rd_0_data_bits_7_2,
	io_tensor_rd_0_data_bits_7_3,
	io_tensor_rd_0_data_bits_7_4,
	io_tensor_rd_0_data_bits_7_5,
	io_tensor_rd_0_data_bits_7_6,
	io_tensor_rd_0_data_bits_7_7,
	io_tensor_rd_0_data_bits_7_8,
	io_tensor_rd_0_data_bits_7_9,
	io_tensor_rd_0_data_bits_7_10,
	io_tensor_rd_0_data_bits_7_11,
	io_tensor_rd_0_data_bits_7_12,
	io_tensor_rd_0_data_bits_7_13,
	io_tensor_rd_0_data_bits_7_14,
	io_tensor_rd_0_data_bits_7_15,
	io_tensor_rd_0_data_bits_8_0,
	io_tensor_rd_0_data_bits_8_1,
	io_tensor_rd_0_data_bits_8_2,
	io_tensor_rd_0_data_bits_8_3,
	io_tensor_rd_0_data_bits_8_4,
	io_tensor_rd_0_data_bits_8_5,
	io_tensor_rd_0_data_bits_8_6,
	io_tensor_rd_0_data_bits_8_7,
	io_tensor_rd_0_data_bits_8_8,
	io_tensor_rd_0_data_bits_8_9,
	io_tensor_rd_0_data_bits_8_10,
	io_tensor_rd_0_data_bits_8_11,
	io_tensor_rd_0_data_bits_8_12,
	io_tensor_rd_0_data_bits_8_13,
	io_tensor_rd_0_data_bits_8_14,
	io_tensor_rd_0_data_bits_8_15,
	io_tensor_rd_0_data_bits_9_0,
	io_tensor_rd_0_data_bits_9_1,
	io_tensor_rd_0_data_bits_9_2,
	io_tensor_rd_0_data_bits_9_3,
	io_tensor_rd_0_data_bits_9_4,
	io_tensor_rd_0_data_bits_9_5,
	io_tensor_rd_0_data_bits_9_6,
	io_tensor_rd_0_data_bits_9_7,
	io_tensor_rd_0_data_bits_9_8,
	io_tensor_rd_0_data_bits_9_9,
	io_tensor_rd_0_data_bits_9_10,
	io_tensor_rd_0_data_bits_9_11,
	io_tensor_rd_0_data_bits_9_12,
	io_tensor_rd_0_data_bits_9_13,
	io_tensor_rd_0_data_bits_9_14,
	io_tensor_rd_0_data_bits_9_15,
	io_tensor_rd_0_data_bits_10_0,
	io_tensor_rd_0_data_bits_10_1,
	io_tensor_rd_0_data_bits_10_2,
	io_tensor_rd_0_data_bits_10_3,
	io_tensor_rd_0_data_bits_10_4,
	io_tensor_rd_0_data_bits_10_5,
	io_tensor_rd_0_data_bits_10_6,
	io_tensor_rd_0_data_bits_10_7,
	io_tensor_rd_0_data_bits_10_8,
	io_tensor_rd_0_data_bits_10_9,
	io_tensor_rd_0_data_bits_10_10,
	io_tensor_rd_0_data_bits_10_11,
	io_tensor_rd_0_data_bits_10_12,
	io_tensor_rd_0_data_bits_10_13,
	io_tensor_rd_0_data_bits_10_14,
	io_tensor_rd_0_data_bits_10_15,
	io_tensor_rd_0_data_bits_11_0,
	io_tensor_rd_0_data_bits_11_1,
	io_tensor_rd_0_data_bits_11_2,
	io_tensor_rd_0_data_bits_11_3,
	io_tensor_rd_0_data_bits_11_4,
	io_tensor_rd_0_data_bits_11_5,
	io_tensor_rd_0_data_bits_11_6,
	io_tensor_rd_0_data_bits_11_7,
	io_tensor_rd_0_data_bits_11_8,
	io_tensor_rd_0_data_bits_11_9,
	io_tensor_rd_0_data_bits_11_10,
	io_tensor_rd_0_data_bits_11_11,
	io_tensor_rd_0_data_bits_11_12,
	io_tensor_rd_0_data_bits_11_13,
	io_tensor_rd_0_data_bits_11_14,
	io_tensor_rd_0_data_bits_11_15,
	io_tensor_rd_0_data_bits_12_0,
	io_tensor_rd_0_data_bits_12_1,
	io_tensor_rd_0_data_bits_12_2,
	io_tensor_rd_0_data_bits_12_3,
	io_tensor_rd_0_data_bits_12_4,
	io_tensor_rd_0_data_bits_12_5,
	io_tensor_rd_0_data_bits_12_6,
	io_tensor_rd_0_data_bits_12_7,
	io_tensor_rd_0_data_bits_12_8,
	io_tensor_rd_0_data_bits_12_9,
	io_tensor_rd_0_data_bits_12_10,
	io_tensor_rd_0_data_bits_12_11,
	io_tensor_rd_0_data_bits_12_12,
	io_tensor_rd_0_data_bits_12_13,
	io_tensor_rd_0_data_bits_12_14,
	io_tensor_rd_0_data_bits_12_15,
	io_tensor_rd_0_data_bits_13_0,
	io_tensor_rd_0_data_bits_13_1,
	io_tensor_rd_0_data_bits_13_2,
	io_tensor_rd_0_data_bits_13_3,
	io_tensor_rd_0_data_bits_13_4,
	io_tensor_rd_0_data_bits_13_5,
	io_tensor_rd_0_data_bits_13_6,
	io_tensor_rd_0_data_bits_13_7,
	io_tensor_rd_0_data_bits_13_8,
	io_tensor_rd_0_data_bits_13_9,
	io_tensor_rd_0_data_bits_13_10,
	io_tensor_rd_0_data_bits_13_11,
	io_tensor_rd_0_data_bits_13_12,
	io_tensor_rd_0_data_bits_13_13,
	io_tensor_rd_0_data_bits_13_14,
	io_tensor_rd_0_data_bits_13_15,
	io_tensor_rd_0_data_bits_14_0,
	io_tensor_rd_0_data_bits_14_1,
	io_tensor_rd_0_data_bits_14_2,
	io_tensor_rd_0_data_bits_14_3,
	io_tensor_rd_0_data_bits_14_4,
	io_tensor_rd_0_data_bits_14_5,
	io_tensor_rd_0_data_bits_14_6,
	io_tensor_rd_0_data_bits_14_7,
	io_tensor_rd_0_data_bits_14_8,
	io_tensor_rd_0_data_bits_14_9,
	io_tensor_rd_0_data_bits_14_10,
	io_tensor_rd_0_data_bits_14_11,
	io_tensor_rd_0_data_bits_14_12,
	io_tensor_rd_0_data_bits_14_13,
	io_tensor_rd_0_data_bits_14_14,
	io_tensor_rd_0_data_bits_14_15,
	io_tensor_rd_0_data_bits_15_0,
	io_tensor_rd_0_data_bits_15_1,
	io_tensor_rd_0_data_bits_15_2,
	io_tensor_rd_0_data_bits_15_3,
	io_tensor_rd_0_data_bits_15_4,
	io_tensor_rd_0_data_bits_15_5,
	io_tensor_rd_0_data_bits_15_6,
	io_tensor_rd_0_data_bits_15_7,
	io_tensor_rd_0_data_bits_15_8,
	io_tensor_rd_0_data_bits_15_9,
	io_tensor_rd_0_data_bits_15_10,
	io_tensor_rd_0_data_bits_15_11,
	io_tensor_rd_0_data_bits_15_12,
	io_tensor_rd_0_data_bits_15_13,
	io_tensor_rd_0_data_bits_15_14,
	io_tensor_rd_0_data_bits_15_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [9:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [7:0] io_tensor_rd_0_data_bits_0_0;
	output wire [7:0] io_tensor_rd_0_data_bits_0_1;
	output wire [7:0] io_tensor_rd_0_data_bits_0_2;
	output wire [7:0] io_tensor_rd_0_data_bits_0_3;
	output wire [7:0] io_tensor_rd_0_data_bits_0_4;
	output wire [7:0] io_tensor_rd_0_data_bits_0_5;
	output wire [7:0] io_tensor_rd_0_data_bits_0_6;
	output wire [7:0] io_tensor_rd_0_data_bits_0_7;
	output wire [7:0] io_tensor_rd_0_data_bits_0_8;
	output wire [7:0] io_tensor_rd_0_data_bits_0_9;
	output wire [7:0] io_tensor_rd_0_data_bits_0_10;
	output wire [7:0] io_tensor_rd_0_data_bits_0_11;
	output wire [7:0] io_tensor_rd_0_data_bits_0_12;
	output wire [7:0] io_tensor_rd_0_data_bits_0_13;
	output wire [7:0] io_tensor_rd_0_data_bits_0_14;
	output wire [7:0] io_tensor_rd_0_data_bits_0_15;
	output wire [7:0] io_tensor_rd_0_data_bits_1_0;
	output wire [7:0] io_tensor_rd_0_data_bits_1_1;
	output wire [7:0] io_tensor_rd_0_data_bits_1_2;
	output wire [7:0] io_tensor_rd_0_data_bits_1_3;
	output wire [7:0] io_tensor_rd_0_data_bits_1_4;
	output wire [7:0] io_tensor_rd_0_data_bits_1_5;
	output wire [7:0] io_tensor_rd_0_data_bits_1_6;
	output wire [7:0] io_tensor_rd_0_data_bits_1_7;
	output wire [7:0] io_tensor_rd_0_data_bits_1_8;
	output wire [7:0] io_tensor_rd_0_data_bits_1_9;
	output wire [7:0] io_tensor_rd_0_data_bits_1_10;
	output wire [7:0] io_tensor_rd_0_data_bits_1_11;
	output wire [7:0] io_tensor_rd_0_data_bits_1_12;
	output wire [7:0] io_tensor_rd_0_data_bits_1_13;
	output wire [7:0] io_tensor_rd_0_data_bits_1_14;
	output wire [7:0] io_tensor_rd_0_data_bits_1_15;
	output wire [7:0] io_tensor_rd_0_data_bits_2_0;
	output wire [7:0] io_tensor_rd_0_data_bits_2_1;
	output wire [7:0] io_tensor_rd_0_data_bits_2_2;
	output wire [7:0] io_tensor_rd_0_data_bits_2_3;
	output wire [7:0] io_tensor_rd_0_data_bits_2_4;
	output wire [7:0] io_tensor_rd_0_data_bits_2_5;
	output wire [7:0] io_tensor_rd_0_data_bits_2_6;
	output wire [7:0] io_tensor_rd_0_data_bits_2_7;
	output wire [7:0] io_tensor_rd_0_data_bits_2_8;
	output wire [7:0] io_tensor_rd_0_data_bits_2_9;
	output wire [7:0] io_tensor_rd_0_data_bits_2_10;
	output wire [7:0] io_tensor_rd_0_data_bits_2_11;
	output wire [7:0] io_tensor_rd_0_data_bits_2_12;
	output wire [7:0] io_tensor_rd_0_data_bits_2_13;
	output wire [7:0] io_tensor_rd_0_data_bits_2_14;
	output wire [7:0] io_tensor_rd_0_data_bits_2_15;
	output wire [7:0] io_tensor_rd_0_data_bits_3_0;
	output wire [7:0] io_tensor_rd_0_data_bits_3_1;
	output wire [7:0] io_tensor_rd_0_data_bits_3_2;
	output wire [7:0] io_tensor_rd_0_data_bits_3_3;
	output wire [7:0] io_tensor_rd_0_data_bits_3_4;
	output wire [7:0] io_tensor_rd_0_data_bits_3_5;
	output wire [7:0] io_tensor_rd_0_data_bits_3_6;
	output wire [7:0] io_tensor_rd_0_data_bits_3_7;
	output wire [7:0] io_tensor_rd_0_data_bits_3_8;
	output wire [7:0] io_tensor_rd_0_data_bits_3_9;
	output wire [7:0] io_tensor_rd_0_data_bits_3_10;
	output wire [7:0] io_tensor_rd_0_data_bits_3_11;
	output wire [7:0] io_tensor_rd_0_data_bits_3_12;
	output wire [7:0] io_tensor_rd_0_data_bits_3_13;
	output wire [7:0] io_tensor_rd_0_data_bits_3_14;
	output wire [7:0] io_tensor_rd_0_data_bits_3_15;
	output wire [7:0] io_tensor_rd_0_data_bits_4_0;
	output wire [7:0] io_tensor_rd_0_data_bits_4_1;
	output wire [7:0] io_tensor_rd_0_data_bits_4_2;
	output wire [7:0] io_tensor_rd_0_data_bits_4_3;
	output wire [7:0] io_tensor_rd_0_data_bits_4_4;
	output wire [7:0] io_tensor_rd_0_data_bits_4_5;
	output wire [7:0] io_tensor_rd_0_data_bits_4_6;
	output wire [7:0] io_tensor_rd_0_data_bits_4_7;
	output wire [7:0] io_tensor_rd_0_data_bits_4_8;
	output wire [7:0] io_tensor_rd_0_data_bits_4_9;
	output wire [7:0] io_tensor_rd_0_data_bits_4_10;
	output wire [7:0] io_tensor_rd_0_data_bits_4_11;
	output wire [7:0] io_tensor_rd_0_data_bits_4_12;
	output wire [7:0] io_tensor_rd_0_data_bits_4_13;
	output wire [7:0] io_tensor_rd_0_data_bits_4_14;
	output wire [7:0] io_tensor_rd_0_data_bits_4_15;
	output wire [7:0] io_tensor_rd_0_data_bits_5_0;
	output wire [7:0] io_tensor_rd_0_data_bits_5_1;
	output wire [7:0] io_tensor_rd_0_data_bits_5_2;
	output wire [7:0] io_tensor_rd_0_data_bits_5_3;
	output wire [7:0] io_tensor_rd_0_data_bits_5_4;
	output wire [7:0] io_tensor_rd_0_data_bits_5_5;
	output wire [7:0] io_tensor_rd_0_data_bits_5_6;
	output wire [7:0] io_tensor_rd_0_data_bits_5_7;
	output wire [7:0] io_tensor_rd_0_data_bits_5_8;
	output wire [7:0] io_tensor_rd_0_data_bits_5_9;
	output wire [7:0] io_tensor_rd_0_data_bits_5_10;
	output wire [7:0] io_tensor_rd_0_data_bits_5_11;
	output wire [7:0] io_tensor_rd_0_data_bits_5_12;
	output wire [7:0] io_tensor_rd_0_data_bits_5_13;
	output wire [7:0] io_tensor_rd_0_data_bits_5_14;
	output wire [7:0] io_tensor_rd_0_data_bits_5_15;
	output wire [7:0] io_tensor_rd_0_data_bits_6_0;
	output wire [7:0] io_tensor_rd_0_data_bits_6_1;
	output wire [7:0] io_tensor_rd_0_data_bits_6_2;
	output wire [7:0] io_tensor_rd_0_data_bits_6_3;
	output wire [7:0] io_tensor_rd_0_data_bits_6_4;
	output wire [7:0] io_tensor_rd_0_data_bits_6_5;
	output wire [7:0] io_tensor_rd_0_data_bits_6_6;
	output wire [7:0] io_tensor_rd_0_data_bits_6_7;
	output wire [7:0] io_tensor_rd_0_data_bits_6_8;
	output wire [7:0] io_tensor_rd_0_data_bits_6_9;
	output wire [7:0] io_tensor_rd_0_data_bits_6_10;
	output wire [7:0] io_tensor_rd_0_data_bits_6_11;
	output wire [7:0] io_tensor_rd_0_data_bits_6_12;
	output wire [7:0] io_tensor_rd_0_data_bits_6_13;
	output wire [7:0] io_tensor_rd_0_data_bits_6_14;
	output wire [7:0] io_tensor_rd_0_data_bits_6_15;
	output wire [7:0] io_tensor_rd_0_data_bits_7_0;
	output wire [7:0] io_tensor_rd_0_data_bits_7_1;
	output wire [7:0] io_tensor_rd_0_data_bits_7_2;
	output wire [7:0] io_tensor_rd_0_data_bits_7_3;
	output wire [7:0] io_tensor_rd_0_data_bits_7_4;
	output wire [7:0] io_tensor_rd_0_data_bits_7_5;
	output wire [7:0] io_tensor_rd_0_data_bits_7_6;
	output wire [7:0] io_tensor_rd_0_data_bits_7_7;
	output wire [7:0] io_tensor_rd_0_data_bits_7_8;
	output wire [7:0] io_tensor_rd_0_data_bits_7_9;
	output wire [7:0] io_tensor_rd_0_data_bits_7_10;
	output wire [7:0] io_tensor_rd_0_data_bits_7_11;
	output wire [7:0] io_tensor_rd_0_data_bits_7_12;
	output wire [7:0] io_tensor_rd_0_data_bits_7_13;
	output wire [7:0] io_tensor_rd_0_data_bits_7_14;
	output wire [7:0] io_tensor_rd_0_data_bits_7_15;
	output wire [7:0] io_tensor_rd_0_data_bits_8_0;
	output wire [7:0] io_tensor_rd_0_data_bits_8_1;
	output wire [7:0] io_tensor_rd_0_data_bits_8_2;
	output wire [7:0] io_tensor_rd_0_data_bits_8_3;
	output wire [7:0] io_tensor_rd_0_data_bits_8_4;
	output wire [7:0] io_tensor_rd_0_data_bits_8_5;
	output wire [7:0] io_tensor_rd_0_data_bits_8_6;
	output wire [7:0] io_tensor_rd_0_data_bits_8_7;
	output wire [7:0] io_tensor_rd_0_data_bits_8_8;
	output wire [7:0] io_tensor_rd_0_data_bits_8_9;
	output wire [7:0] io_tensor_rd_0_data_bits_8_10;
	output wire [7:0] io_tensor_rd_0_data_bits_8_11;
	output wire [7:0] io_tensor_rd_0_data_bits_8_12;
	output wire [7:0] io_tensor_rd_0_data_bits_8_13;
	output wire [7:0] io_tensor_rd_0_data_bits_8_14;
	output wire [7:0] io_tensor_rd_0_data_bits_8_15;
	output wire [7:0] io_tensor_rd_0_data_bits_9_0;
	output wire [7:0] io_tensor_rd_0_data_bits_9_1;
	output wire [7:0] io_tensor_rd_0_data_bits_9_2;
	output wire [7:0] io_tensor_rd_0_data_bits_9_3;
	output wire [7:0] io_tensor_rd_0_data_bits_9_4;
	output wire [7:0] io_tensor_rd_0_data_bits_9_5;
	output wire [7:0] io_tensor_rd_0_data_bits_9_6;
	output wire [7:0] io_tensor_rd_0_data_bits_9_7;
	output wire [7:0] io_tensor_rd_0_data_bits_9_8;
	output wire [7:0] io_tensor_rd_0_data_bits_9_9;
	output wire [7:0] io_tensor_rd_0_data_bits_9_10;
	output wire [7:0] io_tensor_rd_0_data_bits_9_11;
	output wire [7:0] io_tensor_rd_0_data_bits_9_12;
	output wire [7:0] io_tensor_rd_0_data_bits_9_13;
	output wire [7:0] io_tensor_rd_0_data_bits_9_14;
	output wire [7:0] io_tensor_rd_0_data_bits_9_15;
	output wire [7:0] io_tensor_rd_0_data_bits_10_0;
	output wire [7:0] io_tensor_rd_0_data_bits_10_1;
	output wire [7:0] io_tensor_rd_0_data_bits_10_2;
	output wire [7:0] io_tensor_rd_0_data_bits_10_3;
	output wire [7:0] io_tensor_rd_0_data_bits_10_4;
	output wire [7:0] io_tensor_rd_0_data_bits_10_5;
	output wire [7:0] io_tensor_rd_0_data_bits_10_6;
	output wire [7:0] io_tensor_rd_0_data_bits_10_7;
	output wire [7:0] io_tensor_rd_0_data_bits_10_8;
	output wire [7:0] io_tensor_rd_0_data_bits_10_9;
	output wire [7:0] io_tensor_rd_0_data_bits_10_10;
	output wire [7:0] io_tensor_rd_0_data_bits_10_11;
	output wire [7:0] io_tensor_rd_0_data_bits_10_12;
	output wire [7:0] io_tensor_rd_0_data_bits_10_13;
	output wire [7:0] io_tensor_rd_0_data_bits_10_14;
	output wire [7:0] io_tensor_rd_0_data_bits_10_15;
	output wire [7:0] io_tensor_rd_0_data_bits_11_0;
	output wire [7:0] io_tensor_rd_0_data_bits_11_1;
	output wire [7:0] io_tensor_rd_0_data_bits_11_2;
	output wire [7:0] io_tensor_rd_0_data_bits_11_3;
	output wire [7:0] io_tensor_rd_0_data_bits_11_4;
	output wire [7:0] io_tensor_rd_0_data_bits_11_5;
	output wire [7:0] io_tensor_rd_0_data_bits_11_6;
	output wire [7:0] io_tensor_rd_0_data_bits_11_7;
	output wire [7:0] io_tensor_rd_0_data_bits_11_8;
	output wire [7:0] io_tensor_rd_0_data_bits_11_9;
	output wire [7:0] io_tensor_rd_0_data_bits_11_10;
	output wire [7:0] io_tensor_rd_0_data_bits_11_11;
	output wire [7:0] io_tensor_rd_0_data_bits_11_12;
	output wire [7:0] io_tensor_rd_0_data_bits_11_13;
	output wire [7:0] io_tensor_rd_0_data_bits_11_14;
	output wire [7:0] io_tensor_rd_0_data_bits_11_15;
	output wire [7:0] io_tensor_rd_0_data_bits_12_0;
	output wire [7:0] io_tensor_rd_0_data_bits_12_1;
	output wire [7:0] io_tensor_rd_0_data_bits_12_2;
	output wire [7:0] io_tensor_rd_0_data_bits_12_3;
	output wire [7:0] io_tensor_rd_0_data_bits_12_4;
	output wire [7:0] io_tensor_rd_0_data_bits_12_5;
	output wire [7:0] io_tensor_rd_0_data_bits_12_6;
	output wire [7:0] io_tensor_rd_0_data_bits_12_7;
	output wire [7:0] io_tensor_rd_0_data_bits_12_8;
	output wire [7:0] io_tensor_rd_0_data_bits_12_9;
	output wire [7:0] io_tensor_rd_0_data_bits_12_10;
	output wire [7:0] io_tensor_rd_0_data_bits_12_11;
	output wire [7:0] io_tensor_rd_0_data_bits_12_12;
	output wire [7:0] io_tensor_rd_0_data_bits_12_13;
	output wire [7:0] io_tensor_rd_0_data_bits_12_14;
	output wire [7:0] io_tensor_rd_0_data_bits_12_15;
	output wire [7:0] io_tensor_rd_0_data_bits_13_0;
	output wire [7:0] io_tensor_rd_0_data_bits_13_1;
	output wire [7:0] io_tensor_rd_0_data_bits_13_2;
	output wire [7:0] io_tensor_rd_0_data_bits_13_3;
	output wire [7:0] io_tensor_rd_0_data_bits_13_4;
	output wire [7:0] io_tensor_rd_0_data_bits_13_5;
	output wire [7:0] io_tensor_rd_0_data_bits_13_6;
	output wire [7:0] io_tensor_rd_0_data_bits_13_7;
	output wire [7:0] io_tensor_rd_0_data_bits_13_8;
	output wire [7:0] io_tensor_rd_0_data_bits_13_9;
	output wire [7:0] io_tensor_rd_0_data_bits_13_10;
	output wire [7:0] io_tensor_rd_0_data_bits_13_11;
	output wire [7:0] io_tensor_rd_0_data_bits_13_12;
	output wire [7:0] io_tensor_rd_0_data_bits_13_13;
	output wire [7:0] io_tensor_rd_0_data_bits_13_14;
	output wire [7:0] io_tensor_rd_0_data_bits_13_15;
	output wire [7:0] io_tensor_rd_0_data_bits_14_0;
	output wire [7:0] io_tensor_rd_0_data_bits_14_1;
	output wire [7:0] io_tensor_rd_0_data_bits_14_2;
	output wire [7:0] io_tensor_rd_0_data_bits_14_3;
	output wire [7:0] io_tensor_rd_0_data_bits_14_4;
	output wire [7:0] io_tensor_rd_0_data_bits_14_5;
	output wire [7:0] io_tensor_rd_0_data_bits_14_6;
	output wire [7:0] io_tensor_rd_0_data_bits_14_7;
	output wire [7:0] io_tensor_rd_0_data_bits_14_8;
	output wire [7:0] io_tensor_rd_0_data_bits_14_9;
	output wire [7:0] io_tensor_rd_0_data_bits_14_10;
	output wire [7:0] io_tensor_rd_0_data_bits_14_11;
	output wire [7:0] io_tensor_rd_0_data_bits_14_12;
	output wire [7:0] io_tensor_rd_0_data_bits_14_13;
	output wire [7:0] io_tensor_rd_0_data_bits_14_14;
	output wire [7:0] io_tensor_rd_0_data_bits_14_15;
	output wire [7:0] io_tensor_rd_0_data_bits_15_0;
	output wire [7:0] io_tensor_rd_0_data_bits_15_1;
	output wire [7:0] io_tensor_rd_0_data_bits_15_2;
	output wire [7:0] io_tensor_rd_0_data_bits_15_3;
	output wire [7:0] io_tensor_rd_0_data_bits_15_4;
	output wire [7:0] io_tensor_rd_0_data_bits_15_5;
	output wire [7:0] io_tensor_rd_0_data_bits_15_6;
	output wire [7:0] io_tensor_rd_0_data_bits_15_7;
	output wire [7:0] io_tensor_rd_0_data_bits_15_8;
	output wire [7:0] io_tensor_rd_0_data_bits_15_9;
	output wire [7:0] io_tensor_rd_0_data_bits_15_10;
	output wire [7:0] io_tensor_rd_0_data_bits_15_11;
	output wire [7:0] io_tensor_rd_0_data_bits_15_12;
	output wire [7:0] io_tensor_rd_0_data_bits_15_13;
	output wire [7:0] io_tensor_rd_0_data_bits_15_14;
	output wire [7:0] io_tensor_rd_0_data_bits_15_15;
	wire vmeCmd_clock;
	wire vmeCmd_reset;
	wire vmeCmd_io_start;
	wire vmeCmd_io_isBusy;
	wire [127:0] vmeCmd_io_inst;
	wire [63:0] vmeCmd_io_baddr;
	wire vmeCmd_io_vmeCmd_ready;
	wire vmeCmd_io_vmeCmd_valid;
	wire [63:0] vmeCmd_io_vmeCmd_bits_addr;
	wire [7:0] vmeCmd_io_vmeCmd_bits_len;
	wire [20:0] vmeCmd_io_vmeCmd_bits_tag;
	wire [8:0] vmeCmd_io_readLen;
	wire vmeCmd_io_done;
	wire readData_clock;
	wire readData_reset;
	wire readData_io_start;
	wire readData_io_vmeData_ready;
	wire readData_io_vmeData_valid;
	wire [20:0] readData_io_vmeData_bits_tag;
	wire [9:0] readData_io_idx;
	wire [4:0] readData_io_col;
	wire fillPadding_clock;
	wire fillPadding_reset;
	wire fillPadding_io_canWriteMem;
	wire [127:0] fillPadding_io_inst;
	wire fillPadding_io_tensorIdx_valid;
	wire [9:0] fillPadding_io_tensorIdx_bits;
	wire fillPadding_io_start;
	wire fillPadding_io_done;
	reg [63:0] tensorFile_0 [0:1023];
	wire tensorFile_0_MPORT_32_en;
	wire [9:0] tensorFile_0_MPORT_32_addr;
	wire [63:0] tensorFile_0_MPORT_32_data;
	wire [63:0] tensorFile_0_MPORT_data;
	wire [9:0] tensorFile_0_MPORT_addr;
	wire tensorFile_0_MPORT_mask;
	wire tensorFile_0_MPORT_en;
	reg tensorFile_0_MPORT_32_en_pipe_0;
	reg [9:0] tensorFile_0_MPORT_32_addr_pipe_0;
	reg [63:0] tensorFile_1 [0:1023];
	wire tensorFile_1_MPORT_33_en;
	wire [9:0] tensorFile_1_MPORT_33_addr;
	wire [63:0] tensorFile_1_MPORT_33_data;
	wire [63:0] tensorFile_1_MPORT_1_data;
	wire [9:0] tensorFile_1_MPORT_1_addr;
	wire tensorFile_1_MPORT_1_mask;
	wire tensorFile_1_MPORT_1_en;
	reg tensorFile_1_MPORT_33_en_pipe_0;
	reg [9:0] tensorFile_1_MPORT_33_addr_pipe_0;
	reg [63:0] tensorFile_2 [0:1023];
	wire tensorFile_2_MPORT_34_en;
	wire [9:0] tensorFile_2_MPORT_34_addr;
	wire [63:0] tensorFile_2_MPORT_34_data;
	wire [63:0] tensorFile_2_MPORT_2_data;
	wire [9:0] tensorFile_2_MPORT_2_addr;
	wire tensorFile_2_MPORT_2_mask;
	wire tensorFile_2_MPORT_2_en;
	reg tensorFile_2_MPORT_34_en_pipe_0;
	reg [9:0] tensorFile_2_MPORT_34_addr_pipe_0;
	reg [63:0] tensorFile_3 [0:1023];
	wire tensorFile_3_MPORT_35_en;
	wire [9:0] tensorFile_3_MPORT_35_addr;
	wire [63:0] tensorFile_3_MPORT_35_data;
	wire [63:0] tensorFile_3_MPORT_3_data;
	wire [9:0] tensorFile_3_MPORT_3_addr;
	wire tensorFile_3_MPORT_3_mask;
	wire tensorFile_3_MPORT_3_en;
	reg tensorFile_3_MPORT_35_en_pipe_0;
	reg [9:0] tensorFile_3_MPORT_35_addr_pipe_0;
	reg [63:0] tensorFile_4 [0:1023];
	wire tensorFile_4_MPORT_36_en;
	wire [9:0] tensorFile_4_MPORT_36_addr;
	wire [63:0] tensorFile_4_MPORT_36_data;
	wire [63:0] tensorFile_4_MPORT_4_data;
	wire [9:0] tensorFile_4_MPORT_4_addr;
	wire tensorFile_4_MPORT_4_mask;
	wire tensorFile_4_MPORT_4_en;
	reg tensorFile_4_MPORT_36_en_pipe_0;
	reg [9:0] tensorFile_4_MPORT_36_addr_pipe_0;
	reg [63:0] tensorFile_5 [0:1023];
	wire tensorFile_5_MPORT_37_en;
	wire [9:0] tensorFile_5_MPORT_37_addr;
	wire [63:0] tensorFile_5_MPORT_37_data;
	wire [63:0] tensorFile_5_MPORT_5_data;
	wire [9:0] tensorFile_5_MPORT_5_addr;
	wire tensorFile_5_MPORT_5_mask;
	wire tensorFile_5_MPORT_5_en;
	reg tensorFile_5_MPORT_37_en_pipe_0;
	reg [9:0] tensorFile_5_MPORT_37_addr_pipe_0;
	reg [63:0] tensorFile_6 [0:1023];
	wire tensorFile_6_MPORT_38_en;
	wire [9:0] tensorFile_6_MPORT_38_addr;
	wire [63:0] tensorFile_6_MPORT_38_data;
	wire [63:0] tensorFile_6_MPORT_6_data;
	wire [9:0] tensorFile_6_MPORT_6_addr;
	wire tensorFile_6_MPORT_6_mask;
	wire tensorFile_6_MPORT_6_en;
	reg tensorFile_6_MPORT_38_en_pipe_0;
	reg [9:0] tensorFile_6_MPORT_38_addr_pipe_0;
	reg [63:0] tensorFile_7 [0:1023];
	wire tensorFile_7_MPORT_39_en;
	wire [9:0] tensorFile_7_MPORT_39_addr;
	wire [63:0] tensorFile_7_MPORT_39_data;
	wire [63:0] tensorFile_7_MPORT_7_data;
	wire [9:0] tensorFile_7_MPORT_7_addr;
	wire tensorFile_7_MPORT_7_mask;
	wire tensorFile_7_MPORT_7_en;
	reg tensorFile_7_MPORT_39_en_pipe_0;
	reg [9:0] tensorFile_7_MPORT_39_addr_pipe_0;
	reg [63:0] tensorFile_8 [0:1023];
	wire tensorFile_8_MPORT_40_en;
	wire [9:0] tensorFile_8_MPORT_40_addr;
	wire [63:0] tensorFile_8_MPORT_40_data;
	wire [63:0] tensorFile_8_MPORT_8_data;
	wire [9:0] tensorFile_8_MPORT_8_addr;
	wire tensorFile_8_MPORT_8_mask;
	wire tensorFile_8_MPORT_8_en;
	reg tensorFile_8_MPORT_40_en_pipe_0;
	reg [9:0] tensorFile_8_MPORT_40_addr_pipe_0;
	reg [63:0] tensorFile_9 [0:1023];
	wire tensorFile_9_MPORT_41_en;
	wire [9:0] tensorFile_9_MPORT_41_addr;
	wire [63:0] tensorFile_9_MPORT_41_data;
	wire [63:0] tensorFile_9_MPORT_9_data;
	wire [9:0] tensorFile_9_MPORT_9_addr;
	wire tensorFile_9_MPORT_9_mask;
	wire tensorFile_9_MPORT_9_en;
	reg tensorFile_9_MPORT_41_en_pipe_0;
	reg [9:0] tensorFile_9_MPORT_41_addr_pipe_0;
	reg [63:0] tensorFile_10 [0:1023];
	wire tensorFile_10_MPORT_42_en;
	wire [9:0] tensorFile_10_MPORT_42_addr;
	wire [63:0] tensorFile_10_MPORT_42_data;
	wire [63:0] tensorFile_10_MPORT_10_data;
	wire [9:0] tensorFile_10_MPORT_10_addr;
	wire tensorFile_10_MPORT_10_mask;
	wire tensorFile_10_MPORT_10_en;
	reg tensorFile_10_MPORT_42_en_pipe_0;
	reg [9:0] tensorFile_10_MPORT_42_addr_pipe_0;
	reg [63:0] tensorFile_11 [0:1023];
	wire tensorFile_11_MPORT_43_en;
	wire [9:0] tensorFile_11_MPORT_43_addr;
	wire [63:0] tensorFile_11_MPORT_43_data;
	wire [63:0] tensorFile_11_MPORT_11_data;
	wire [9:0] tensorFile_11_MPORT_11_addr;
	wire tensorFile_11_MPORT_11_mask;
	wire tensorFile_11_MPORT_11_en;
	reg tensorFile_11_MPORT_43_en_pipe_0;
	reg [9:0] tensorFile_11_MPORT_43_addr_pipe_0;
	reg [63:0] tensorFile_12 [0:1023];
	wire tensorFile_12_MPORT_44_en;
	wire [9:0] tensorFile_12_MPORT_44_addr;
	wire [63:0] tensorFile_12_MPORT_44_data;
	wire [63:0] tensorFile_12_MPORT_12_data;
	wire [9:0] tensorFile_12_MPORT_12_addr;
	wire tensorFile_12_MPORT_12_mask;
	wire tensorFile_12_MPORT_12_en;
	reg tensorFile_12_MPORT_44_en_pipe_0;
	reg [9:0] tensorFile_12_MPORT_44_addr_pipe_0;
	reg [63:0] tensorFile_13 [0:1023];
	wire tensorFile_13_MPORT_45_en;
	wire [9:0] tensorFile_13_MPORT_45_addr;
	wire [63:0] tensorFile_13_MPORT_45_data;
	wire [63:0] tensorFile_13_MPORT_13_data;
	wire [9:0] tensorFile_13_MPORT_13_addr;
	wire tensorFile_13_MPORT_13_mask;
	wire tensorFile_13_MPORT_13_en;
	reg tensorFile_13_MPORT_45_en_pipe_0;
	reg [9:0] tensorFile_13_MPORT_45_addr_pipe_0;
	reg [63:0] tensorFile_14 [0:1023];
	wire tensorFile_14_MPORT_46_en;
	wire [9:0] tensorFile_14_MPORT_46_addr;
	wire [63:0] tensorFile_14_MPORT_46_data;
	wire [63:0] tensorFile_14_MPORT_14_data;
	wire [9:0] tensorFile_14_MPORT_14_addr;
	wire tensorFile_14_MPORT_14_mask;
	wire tensorFile_14_MPORT_14_en;
	reg tensorFile_14_MPORT_46_en_pipe_0;
	reg [9:0] tensorFile_14_MPORT_46_addr_pipe_0;
	reg [63:0] tensorFile_15 [0:1023];
	wire tensorFile_15_MPORT_47_en;
	wire [9:0] tensorFile_15_MPORT_47_addr;
	wire [63:0] tensorFile_15_MPORT_47_data;
	wire [63:0] tensorFile_15_MPORT_15_data;
	wire [9:0] tensorFile_15_MPORT_15_addr;
	wire tensorFile_15_MPORT_15_mask;
	wire tensorFile_15_MPORT_15_en;
	reg tensorFile_15_MPORT_47_en_pipe_0;
	reg [9:0] tensorFile_15_MPORT_47_addr_pipe_0;
	reg [63:0] tensorFile_16 [0:1023];
	wire tensorFile_16_MPORT_48_en;
	wire [9:0] tensorFile_16_MPORT_48_addr;
	wire [63:0] tensorFile_16_MPORT_48_data;
	wire [63:0] tensorFile_16_MPORT_16_data;
	wire [9:0] tensorFile_16_MPORT_16_addr;
	wire tensorFile_16_MPORT_16_mask;
	wire tensorFile_16_MPORT_16_en;
	reg tensorFile_16_MPORT_48_en_pipe_0;
	reg [9:0] tensorFile_16_MPORT_48_addr_pipe_0;
	reg [63:0] tensorFile_17 [0:1023];
	wire tensorFile_17_MPORT_49_en;
	wire [9:0] tensorFile_17_MPORT_49_addr;
	wire [63:0] tensorFile_17_MPORT_49_data;
	wire [63:0] tensorFile_17_MPORT_17_data;
	wire [9:0] tensorFile_17_MPORT_17_addr;
	wire tensorFile_17_MPORT_17_mask;
	wire tensorFile_17_MPORT_17_en;
	reg tensorFile_17_MPORT_49_en_pipe_0;
	reg [9:0] tensorFile_17_MPORT_49_addr_pipe_0;
	reg [63:0] tensorFile_18 [0:1023];
	wire tensorFile_18_MPORT_50_en;
	wire [9:0] tensorFile_18_MPORT_50_addr;
	wire [63:0] tensorFile_18_MPORT_50_data;
	wire [63:0] tensorFile_18_MPORT_18_data;
	wire [9:0] tensorFile_18_MPORT_18_addr;
	wire tensorFile_18_MPORT_18_mask;
	wire tensorFile_18_MPORT_18_en;
	reg tensorFile_18_MPORT_50_en_pipe_0;
	reg [9:0] tensorFile_18_MPORT_50_addr_pipe_0;
	reg [63:0] tensorFile_19 [0:1023];
	wire tensorFile_19_MPORT_51_en;
	wire [9:0] tensorFile_19_MPORT_51_addr;
	wire [63:0] tensorFile_19_MPORT_51_data;
	wire [63:0] tensorFile_19_MPORT_19_data;
	wire [9:0] tensorFile_19_MPORT_19_addr;
	wire tensorFile_19_MPORT_19_mask;
	wire tensorFile_19_MPORT_19_en;
	reg tensorFile_19_MPORT_51_en_pipe_0;
	reg [9:0] tensorFile_19_MPORT_51_addr_pipe_0;
	reg [63:0] tensorFile_20 [0:1023];
	wire tensorFile_20_MPORT_52_en;
	wire [9:0] tensorFile_20_MPORT_52_addr;
	wire [63:0] tensorFile_20_MPORT_52_data;
	wire [63:0] tensorFile_20_MPORT_20_data;
	wire [9:0] tensorFile_20_MPORT_20_addr;
	wire tensorFile_20_MPORT_20_mask;
	wire tensorFile_20_MPORT_20_en;
	reg tensorFile_20_MPORT_52_en_pipe_0;
	reg [9:0] tensorFile_20_MPORT_52_addr_pipe_0;
	reg [63:0] tensorFile_21 [0:1023];
	wire tensorFile_21_MPORT_53_en;
	wire [9:0] tensorFile_21_MPORT_53_addr;
	wire [63:0] tensorFile_21_MPORT_53_data;
	wire [63:0] tensorFile_21_MPORT_21_data;
	wire [9:0] tensorFile_21_MPORT_21_addr;
	wire tensorFile_21_MPORT_21_mask;
	wire tensorFile_21_MPORT_21_en;
	reg tensorFile_21_MPORT_53_en_pipe_0;
	reg [9:0] tensorFile_21_MPORT_53_addr_pipe_0;
	reg [63:0] tensorFile_22 [0:1023];
	wire tensorFile_22_MPORT_54_en;
	wire [9:0] tensorFile_22_MPORT_54_addr;
	wire [63:0] tensorFile_22_MPORT_54_data;
	wire [63:0] tensorFile_22_MPORT_22_data;
	wire [9:0] tensorFile_22_MPORT_22_addr;
	wire tensorFile_22_MPORT_22_mask;
	wire tensorFile_22_MPORT_22_en;
	reg tensorFile_22_MPORT_54_en_pipe_0;
	reg [9:0] tensorFile_22_MPORT_54_addr_pipe_0;
	reg [63:0] tensorFile_23 [0:1023];
	wire tensorFile_23_MPORT_55_en;
	wire [9:0] tensorFile_23_MPORT_55_addr;
	wire [63:0] tensorFile_23_MPORT_55_data;
	wire [63:0] tensorFile_23_MPORT_23_data;
	wire [9:0] tensorFile_23_MPORT_23_addr;
	wire tensorFile_23_MPORT_23_mask;
	wire tensorFile_23_MPORT_23_en;
	reg tensorFile_23_MPORT_55_en_pipe_0;
	reg [9:0] tensorFile_23_MPORT_55_addr_pipe_0;
	reg [63:0] tensorFile_24 [0:1023];
	wire tensorFile_24_MPORT_56_en;
	wire [9:0] tensorFile_24_MPORT_56_addr;
	wire [63:0] tensorFile_24_MPORT_56_data;
	wire [63:0] tensorFile_24_MPORT_24_data;
	wire [9:0] tensorFile_24_MPORT_24_addr;
	wire tensorFile_24_MPORT_24_mask;
	wire tensorFile_24_MPORT_24_en;
	reg tensorFile_24_MPORT_56_en_pipe_0;
	reg [9:0] tensorFile_24_MPORT_56_addr_pipe_0;
	reg [63:0] tensorFile_25 [0:1023];
	wire tensorFile_25_MPORT_57_en;
	wire [9:0] tensorFile_25_MPORT_57_addr;
	wire [63:0] tensorFile_25_MPORT_57_data;
	wire [63:0] tensorFile_25_MPORT_25_data;
	wire [9:0] tensorFile_25_MPORT_25_addr;
	wire tensorFile_25_MPORT_25_mask;
	wire tensorFile_25_MPORT_25_en;
	reg tensorFile_25_MPORT_57_en_pipe_0;
	reg [9:0] tensorFile_25_MPORT_57_addr_pipe_0;
	reg [63:0] tensorFile_26 [0:1023];
	wire tensorFile_26_MPORT_58_en;
	wire [9:0] tensorFile_26_MPORT_58_addr;
	wire [63:0] tensorFile_26_MPORT_58_data;
	wire [63:0] tensorFile_26_MPORT_26_data;
	wire [9:0] tensorFile_26_MPORT_26_addr;
	wire tensorFile_26_MPORT_26_mask;
	wire tensorFile_26_MPORT_26_en;
	reg tensorFile_26_MPORT_58_en_pipe_0;
	reg [9:0] tensorFile_26_MPORT_58_addr_pipe_0;
	reg [63:0] tensorFile_27 [0:1023];
	wire tensorFile_27_MPORT_59_en;
	wire [9:0] tensorFile_27_MPORT_59_addr;
	wire [63:0] tensorFile_27_MPORT_59_data;
	wire [63:0] tensorFile_27_MPORT_27_data;
	wire [9:0] tensorFile_27_MPORT_27_addr;
	wire tensorFile_27_MPORT_27_mask;
	wire tensorFile_27_MPORT_27_en;
	reg tensorFile_27_MPORT_59_en_pipe_0;
	reg [9:0] tensorFile_27_MPORT_59_addr_pipe_0;
	reg [63:0] tensorFile_28 [0:1023];
	wire tensorFile_28_MPORT_60_en;
	wire [9:0] tensorFile_28_MPORT_60_addr;
	wire [63:0] tensorFile_28_MPORT_60_data;
	wire [63:0] tensorFile_28_MPORT_28_data;
	wire [9:0] tensorFile_28_MPORT_28_addr;
	wire tensorFile_28_MPORT_28_mask;
	wire tensorFile_28_MPORT_28_en;
	reg tensorFile_28_MPORT_60_en_pipe_0;
	reg [9:0] tensorFile_28_MPORT_60_addr_pipe_0;
	reg [63:0] tensorFile_29 [0:1023];
	wire tensorFile_29_MPORT_61_en;
	wire [9:0] tensorFile_29_MPORT_61_addr;
	wire [63:0] tensorFile_29_MPORT_61_data;
	wire [63:0] tensorFile_29_MPORT_29_data;
	wire [9:0] tensorFile_29_MPORT_29_addr;
	wire tensorFile_29_MPORT_29_mask;
	wire tensorFile_29_MPORT_29_en;
	reg tensorFile_29_MPORT_61_en_pipe_0;
	reg [9:0] tensorFile_29_MPORT_61_addr_pipe_0;
	reg [63:0] tensorFile_30 [0:1023];
	wire tensorFile_30_MPORT_62_en;
	wire [9:0] tensorFile_30_MPORT_62_addr;
	wire [63:0] tensorFile_30_MPORT_62_data;
	wire [63:0] tensorFile_30_MPORT_30_data;
	wire [9:0] tensorFile_30_MPORT_30_addr;
	wire tensorFile_30_MPORT_30_mask;
	wire tensorFile_30_MPORT_30_en;
	reg tensorFile_30_MPORT_62_en_pipe_0;
	reg [9:0] tensorFile_30_MPORT_62_addr_pipe_0;
	reg [63:0] tensorFile_31 [0:1023];
	wire tensorFile_31_MPORT_63_en;
	wire [9:0] tensorFile_31_MPORT_63_addr;
	wire [63:0] tensorFile_31_MPORT_63_data;
	wire [63:0] tensorFile_31_MPORT_31_data;
	wire [9:0] tensorFile_31_MPORT_31_addr;
	wire tensorFile_31_MPORT_31_mask;
	wire tensorFile_31_MPORT_31_en;
	reg tensorFile_31_MPORT_63_en_pipe_0;
	reg [9:0] tensorFile_31_MPORT_63_addr_pipe_0;
	reg state;
	reg [14:0] blocksInFlight;
	wire loadDone = ((blocksInFlight == 15'h0000) & vmeCmd_io_done) & state;
	wire localDone = loadDone & fillPadding_io_done;
	wire _GEN_0 = (localDone ? 1'h0 : state);
	wire _GEN_1 = io_start | _GEN_0;
	reg [63:0] vmeDataBitsPipe_data;
	reg [20:0] vmeDataBitsPipe_tag;
	reg vmeDataValidPipe;
	reg vmeDataReadyPipe;
	wire vmeDataFirePipe = vmeDataValidPipe & vmeDataReadyPipe;
	wire _T = io_vme_rd_cmd_ready & io_vme_rd_cmd_valid;
	wire _T_1 = state & _T;
	wire _T_3 = (state & _T) & ~vmeDataFirePipe;
	wire [14:0] _GEN_202 = {6'd0, vmeCmd_io_readLen};
	wire [14:0] _blocksInFlight_T_1 = blocksInFlight + _GEN_202;
	wire _T_6 = _T_1 & vmeDataFirePipe;
	wire [14:0] _blocksInFlight_T_5 = _blocksInFlight_T_1 - 15'h0001;
	wire _T_10 = (state & ~_T) & vmeDataFirePipe;
	wire _T_13 = ~rst;
	wire [14:0] _blocksInFlight_T_7 = blocksInFlight - 15'h0001;
	reg [127:0] fillPadding_io_inst_REG;
	reg fillPadding_io_start_REG;
	wire [9:0] waddrTensInstrTmp = (fillPadding_io_tensorIdx_valid ? fillPadding_io_tensorIdx_bits : readData_io_idx);
	wire _waddr_0_T = ~state;
	wire wenTensInstr_0 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h00) & vmeDataFirePipe);
	wire wenTensInstr_1 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h01) & vmeDataFirePipe);
	wire wenTensInstr_2 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h02) & vmeDataFirePipe);
	wire wenTensInstr_3 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h03) & vmeDataFirePipe);
	wire wenTensInstr_4 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h04) & vmeDataFirePipe);
	wire wenTensInstr_5 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h05) & vmeDataFirePipe);
	wire wenTensInstr_6 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h06) & vmeDataFirePipe);
	wire wenTensInstr_7 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h07) & vmeDataFirePipe);
	wire wenTensInstr_8 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h08) & vmeDataFirePipe);
	wire wenTensInstr_9 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h09) & vmeDataFirePipe);
	wire wenTensInstr_10 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0a) & vmeDataFirePipe);
	wire wenTensInstr_11 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0b) & vmeDataFirePipe);
	wire wenTensInstr_12 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0c) & vmeDataFirePipe);
	wire wenTensInstr_13 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0d) & vmeDataFirePipe);
	wire wenTensInstr_14 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0e) & vmeDataFirePipe);
	wire wenTensInstr_15 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h0f) & vmeDataFirePipe);
	wire wenTensInstr_16 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h10) & vmeDataFirePipe);
	wire wenTensInstr_17 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h11) & vmeDataFirePipe);
	wire wenTensInstr_18 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h12) & vmeDataFirePipe);
	wire wenTensInstr_19 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h13) & vmeDataFirePipe);
	wire wenTensInstr_20 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h14) & vmeDataFirePipe);
	wire wenTensInstr_21 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h15) & vmeDataFirePipe);
	wire wenTensInstr_22 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h16) & vmeDataFirePipe);
	wire wenTensInstr_23 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h17) & vmeDataFirePipe);
	wire wenTensInstr_24 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h18) & vmeDataFirePipe);
	wire wenTensInstr_25 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h19) & vmeDataFirePipe);
	wire wenTensInstr_26 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1a) & vmeDataFirePipe);
	wire wenTensInstr_27 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1b) & vmeDataFirePipe);
	wire wenTensInstr_28 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1c) & vmeDataFirePipe);
	wire wenTensInstr_29 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1d) & vmeDataFirePipe);
	wire wenTensInstr_30 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1e) & vmeDataFirePipe);
	wire wenTensInstr_31 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 5'h1f) & vmeDataFirePipe);
	wire [63:0] wdataTensInstr_0 = (fillPadding_io_tensorIdx_valid ? 64'h0000000000000000 : vmeDataBitsPipe_data);
	reg rvalid;
	wire [63:0] _WIRE_32_1 = tensorFile_1_MPORT_33_data;
	wire [63:0] _WIRE_32_0 = tensorFile_0_MPORT_32_data;
	wire [63:0] _WIRE_32_3 = tensorFile_3_MPORT_35_data;
	wire [63:0] _WIRE_32_2 = tensorFile_2_MPORT_34_data;
	wire [63:0] _WIRE_32_5 = tensorFile_5_MPORT_37_data;
	wire [63:0] _WIRE_32_4 = tensorFile_4_MPORT_36_data;
	wire [63:0] _WIRE_32_7 = tensorFile_7_MPORT_39_data;
	wire [63:0] _WIRE_32_6 = tensorFile_6_MPORT_38_data;
	wire [511:0] lo_lo = {_WIRE_32_7, _WIRE_32_6, _WIRE_32_5, _WIRE_32_4, _WIRE_32_3, _WIRE_32_2, _WIRE_32_1, _WIRE_32_0};
	wire [63:0] _WIRE_32_9 = tensorFile_9_MPORT_41_data;
	wire [63:0] _WIRE_32_8 = tensorFile_8_MPORT_40_data;
	wire [63:0] _WIRE_32_11 = tensorFile_11_MPORT_43_data;
	wire [63:0] _WIRE_32_10 = tensorFile_10_MPORT_42_data;
	wire [63:0] _WIRE_32_13 = tensorFile_13_MPORT_45_data;
	wire [63:0] _WIRE_32_12 = tensorFile_12_MPORT_44_data;
	wire [63:0] _WIRE_32_15 = tensorFile_15_MPORT_47_data;
	wire [63:0] _WIRE_32_14 = tensorFile_14_MPORT_46_data;
	wire [1023:0] lo = {_WIRE_32_15, _WIRE_32_14, _WIRE_32_13, _WIRE_32_12, _WIRE_32_11, _WIRE_32_10, _WIRE_32_9, _WIRE_32_8, lo_lo};
	wire [63:0] _WIRE_32_17 = tensorFile_17_MPORT_49_data;
	wire [63:0] _WIRE_32_16 = tensorFile_16_MPORT_48_data;
	wire [63:0] _WIRE_32_19 = tensorFile_19_MPORT_51_data;
	wire [63:0] _WIRE_32_18 = tensorFile_18_MPORT_50_data;
	wire [63:0] _WIRE_32_21 = tensorFile_21_MPORT_53_data;
	wire [63:0] _WIRE_32_20 = tensorFile_20_MPORT_52_data;
	wire [63:0] _WIRE_32_23 = tensorFile_23_MPORT_55_data;
	wire [63:0] _WIRE_32_22 = tensorFile_22_MPORT_54_data;
	wire [511:0] hi_lo = {_WIRE_32_23, _WIRE_32_22, _WIRE_32_21, _WIRE_32_20, _WIRE_32_19, _WIRE_32_18, _WIRE_32_17, _WIRE_32_16};
	wire [63:0] _WIRE_32_25 = tensorFile_25_MPORT_57_data;
	wire [63:0] _WIRE_32_24 = tensorFile_24_MPORT_56_data;
	wire [63:0] _WIRE_32_27 = tensorFile_27_MPORT_59_data;
	wire [63:0] _WIRE_32_26 = tensorFile_26_MPORT_58_data;
	wire [63:0] _WIRE_32_29 = tensorFile_29_MPORT_61_data;
	wire [63:0] _WIRE_32_28 = tensorFile_28_MPORT_60_data;
	wire [63:0] _WIRE_32_31 = tensorFile_31_MPORT_63_data;
	wire [63:0] _WIRE_32_30 = tensorFile_30_MPORT_62_data;
	wire [2047:0] _T_84 = {_WIRE_32_31, _WIRE_32_30, _WIRE_32_29, _WIRE_32_28, _WIRE_32_27, _WIRE_32_26, _WIRE_32_25, _WIRE_32_24, hi_lo, lo};
	GenVMECmd_1 vmeCmd(
		.clk(vmeCmd_clock),
		.rst(vmeCmd_reset),
		.io_start(vmeCmd_io_start),
		.io_isBusy(vmeCmd_io_isBusy),
		.io_inst(vmeCmd_io_inst),
		.io_baddr(vmeCmd_io_baddr),
		.io_vmeCmd_ready(vmeCmd_io_vmeCmd_ready),
		.io_vmeCmd_valid(vmeCmd_io_vmeCmd_valid),
		.io_vmeCmd_bits_addr(vmeCmd_io_vmeCmd_bits_addr),
		.io_vmeCmd_bits_len(vmeCmd_io_vmeCmd_bits_len),
		.io_vmeCmd_bits_tag(vmeCmd_io_vmeCmd_bits_tag),
		.io_readLen(vmeCmd_io_readLen),
		.io_done(vmeCmd_io_done)
	);
	ReadVMEData_1 readData(
		.clk(readData_clock),
		.rst(readData_reset),
		.io_start(readData_io_start),
		.io_vmeData_ready(readData_io_vmeData_ready),
		.io_vmeData_valid(readData_io_vmeData_valid),
		.io_vmeData_bits_tag(readData_io_vmeData_bits_tag),
		.io_idx(readData_io_idx),
		.io_col(readData_io_col)
	);
	ZeroPadding_1 fillPadding(
		.clk(fillPadding_clock),
		.rst(fillPadding_reset),
		.io_canWriteMem(fillPadding_io_canWriteMem),
		.io_inst(fillPadding_io_inst),
		.io_tensorIdx_valid(fillPadding_io_tensorIdx_valid),
		.io_tensorIdx_bits(fillPadding_io_tensorIdx_bits),
		.io_start(fillPadding_io_start),
		.io_done(fillPadding_io_done)
	);
	assign tensorFile_0_MPORT_32_en = tensorFile_0_MPORT_32_en_pipe_0;
	assign tensorFile_0_MPORT_32_addr = tensorFile_0_MPORT_32_addr_pipe_0;
	assign tensorFile_0_MPORT_32_data = tensorFile_0[tensorFile_0_MPORT_32_addr];
	assign tensorFile_0_MPORT_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_0_MPORT_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_0_MPORT_mask = 1'h1;
	assign tensorFile_0_MPORT_en = (_waddr_0_T ? 1'h0 : wenTensInstr_0);
	assign tensorFile_1_MPORT_33_en = tensorFile_1_MPORT_33_en_pipe_0;
	assign tensorFile_1_MPORT_33_addr = tensorFile_1_MPORT_33_addr_pipe_0;
	assign tensorFile_1_MPORT_33_data = tensorFile_1[tensorFile_1_MPORT_33_addr];
	assign tensorFile_1_MPORT_1_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_1_MPORT_1_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_1_MPORT_1_mask = 1'h1;
	assign tensorFile_1_MPORT_1_en = (_waddr_0_T ? 1'h0 : wenTensInstr_1);
	assign tensorFile_2_MPORT_34_en = tensorFile_2_MPORT_34_en_pipe_0;
	assign tensorFile_2_MPORT_34_addr = tensorFile_2_MPORT_34_addr_pipe_0;
	assign tensorFile_2_MPORT_34_data = tensorFile_2[tensorFile_2_MPORT_34_addr];
	assign tensorFile_2_MPORT_2_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_2_MPORT_2_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_2_MPORT_2_mask = 1'h1;
	assign tensorFile_2_MPORT_2_en = (_waddr_0_T ? 1'h0 : wenTensInstr_2);
	assign tensorFile_3_MPORT_35_en = tensorFile_3_MPORT_35_en_pipe_0;
	assign tensorFile_3_MPORT_35_addr = tensorFile_3_MPORT_35_addr_pipe_0;
	assign tensorFile_3_MPORT_35_data = tensorFile_3[tensorFile_3_MPORT_35_addr];
	assign tensorFile_3_MPORT_3_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_3_MPORT_3_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_3_MPORT_3_mask = 1'h1;
	assign tensorFile_3_MPORT_3_en = (_waddr_0_T ? 1'h0 : wenTensInstr_3);
	assign tensorFile_4_MPORT_36_en = tensorFile_4_MPORT_36_en_pipe_0;
	assign tensorFile_4_MPORT_36_addr = tensorFile_4_MPORT_36_addr_pipe_0;
	assign tensorFile_4_MPORT_36_data = tensorFile_4[tensorFile_4_MPORT_36_addr];
	assign tensorFile_4_MPORT_4_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_4_MPORT_4_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_4_MPORT_4_mask = 1'h1;
	assign tensorFile_4_MPORT_4_en = (_waddr_0_T ? 1'h0 : wenTensInstr_4);
	assign tensorFile_5_MPORT_37_en = tensorFile_5_MPORT_37_en_pipe_0;
	assign tensorFile_5_MPORT_37_addr = tensorFile_5_MPORT_37_addr_pipe_0;
	assign tensorFile_5_MPORT_37_data = tensorFile_5[tensorFile_5_MPORT_37_addr];
	assign tensorFile_5_MPORT_5_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_5_MPORT_5_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_5_MPORT_5_mask = 1'h1;
	assign tensorFile_5_MPORT_5_en = (_waddr_0_T ? 1'h0 : wenTensInstr_5);
	assign tensorFile_6_MPORT_38_en = tensorFile_6_MPORT_38_en_pipe_0;
	assign tensorFile_6_MPORT_38_addr = tensorFile_6_MPORT_38_addr_pipe_0;
	assign tensorFile_6_MPORT_38_data = tensorFile_6[tensorFile_6_MPORT_38_addr];
	assign tensorFile_6_MPORT_6_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_6_MPORT_6_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_6_MPORT_6_mask = 1'h1;
	assign tensorFile_6_MPORT_6_en = (_waddr_0_T ? 1'h0 : wenTensInstr_6);
	assign tensorFile_7_MPORT_39_en = tensorFile_7_MPORT_39_en_pipe_0;
	assign tensorFile_7_MPORT_39_addr = tensorFile_7_MPORT_39_addr_pipe_0;
	assign tensorFile_7_MPORT_39_data = tensorFile_7[tensorFile_7_MPORT_39_addr];
	assign tensorFile_7_MPORT_7_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_7_MPORT_7_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_7_MPORT_7_mask = 1'h1;
	assign tensorFile_7_MPORT_7_en = (_waddr_0_T ? 1'h0 : wenTensInstr_7);
	assign tensorFile_8_MPORT_40_en = tensorFile_8_MPORT_40_en_pipe_0;
	assign tensorFile_8_MPORT_40_addr = tensorFile_8_MPORT_40_addr_pipe_0;
	assign tensorFile_8_MPORT_40_data = tensorFile_8[tensorFile_8_MPORT_40_addr];
	assign tensorFile_8_MPORT_8_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_8_MPORT_8_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_8_MPORT_8_mask = 1'h1;
	assign tensorFile_8_MPORT_8_en = (_waddr_0_T ? 1'h0 : wenTensInstr_8);
	assign tensorFile_9_MPORT_41_en = tensorFile_9_MPORT_41_en_pipe_0;
	assign tensorFile_9_MPORT_41_addr = tensorFile_9_MPORT_41_addr_pipe_0;
	assign tensorFile_9_MPORT_41_data = tensorFile_9[tensorFile_9_MPORT_41_addr];
	assign tensorFile_9_MPORT_9_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_9_MPORT_9_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_9_MPORT_9_mask = 1'h1;
	assign tensorFile_9_MPORT_9_en = (_waddr_0_T ? 1'h0 : wenTensInstr_9);
	assign tensorFile_10_MPORT_42_en = tensorFile_10_MPORT_42_en_pipe_0;
	assign tensorFile_10_MPORT_42_addr = tensorFile_10_MPORT_42_addr_pipe_0;
	assign tensorFile_10_MPORT_42_data = tensorFile_10[tensorFile_10_MPORT_42_addr];
	assign tensorFile_10_MPORT_10_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_10_MPORT_10_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_10_MPORT_10_mask = 1'h1;
	assign tensorFile_10_MPORT_10_en = (_waddr_0_T ? 1'h0 : wenTensInstr_10);
	assign tensorFile_11_MPORT_43_en = tensorFile_11_MPORT_43_en_pipe_0;
	assign tensorFile_11_MPORT_43_addr = tensorFile_11_MPORT_43_addr_pipe_0;
	assign tensorFile_11_MPORT_43_data = tensorFile_11[tensorFile_11_MPORT_43_addr];
	assign tensorFile_11_MPORT_11_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_11_MPORT_11_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_11_MPORT_11_mask = 1'h1;
	assign tensorFile_11_MPORT_11_en = (_waddr_0_T ? 1'h0 : wenTensInstr_11);
	assign tensorFile_12_MPORT_44_en = tensorFile_12_MPORT_44_en_pipe_0;
	assign tensorFile_12_MPORT_44_addr = tensorFile_12_MPORT_44_addr_pipe_0;
	assign tensorFile_12_MPORT_44_data = tensorFile_12[tensorFile_12_MPORT_44_addr];
	assign tensorFile_12_MPORT_12_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_12_MPORT_12_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_12_MPORT_12_mask = 1'h1;
	assign tensorFile_12_MPORT_12_en = (_waddr_0_T ? 1'h0 : wenTensInstr_12);
	assign tensorFile_13_MPORT_45_en = tensorFile_13_MPORT_45_en_pipe_0;
	assign tensorFile_13_MPORT_45_addr = tensorFile_13_MPORT_45_addr_pipe_0;
	assign tensorFile_13_MPORT_45_data = tensorFile_13[tensorFile_13_MPORT_45_addr];
	assign tensorFile_13_MPORT_13_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_13_MPORT_13_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_13_MPORT_13_mask = 1'h1;
	assign tensorFile_13_MPORT_13_en = (_waddr_0_T ? 1'h0 : wenTensInstr_13);
	assign tensorFile_14_MPORT_46_en = tensorFile_14_MPORT_46_en_pipe_0;
	assign tensorFile_14_MPORT_46_addr = tensorFile_14_MPORT_46_addr_pipe_0;
	assign tensorFile_14_MPORT_46_data = tensorFile_14[tensorFile_14_MPORT_46_addr];
	assign tensorFile_14_MPORT_14_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_14_MPORT_14_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_14_MPORT_14_mask = 1'h1;
	assign tensorFile_14_MPORT_14_en = (_waddr_0_T ? 1'h0 : wenTensInstr_14);
	assign tensorFile_15_MPORT_47_en = tensorFile_15_MPORT_47_en_pipe_0;
	assign tensorFile_15_MPORT_47_addr = tensorFile_15_MPORT_47_addr_pipe_0;
	assign tensorFile_15_MPORT_47_data = tensorFile_15[tensorFile_15_MPORT_47_addr];
	assign tensorFile_15_MPORT_15_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_15_MPORT_15_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_15_MPORT_15_mask = 1'h1;
	assign tensorFile_15_MPORT_15_en = (_waddr_0_T ? 1'h0 : wenTensInstr_15);
	assign tensorFile_16_MPORT_48_en = tensorFile_16_MPORT_48_en_pipe_0;
	assign tensorFile_16_MPORT_48_addr = tensorFile_16_MPORT_48_addr_pipe_0;
	assign tensorFile_16_MPORT_48_data = tensorFile_16[tensorFile_16_MPORT_48_addr];
	assign tensorFile_16_MPORT_16_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_16_MPORT_16_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_16_MPORT_16_mask = 1'h1;
	assign tensorFile_16_MPORT_16_en = (_waddr_0_T ? 1'h0 : wenTensInstr_16);
	assign tensorFile_17_MPORT_49_en = tensorFile_17_MPORT_49_en_pipe_0;
	assign tensorFile_17_MPORT_49_addr = tensorFile_17_MPORT_49_addr_pipe_0;
	assign tensorFile_17_MPORT_49_data = tensorFile_17[tensorFile_17_MPORT_49_addr];
	assign tensorFile_17_MPORT_17_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_17_MPORT_17_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_17_MPORT_17_mask = 1'h1;
	assign tensorFile_17_MPORT_17_en = (_waddr_0_T ? 1'h0 : wenTensInstr_17);
	assign tensorFile_18_MPORT_50_en = tensorFile_18_MPORT_50_en_pipe_0;
	assign tensorFile_18_MPORT_50_addr = tensorFile_18_MPORT_50_addr_pipe_0;
	assign tensorFile_18_MPORT_50_data = tensorFile_18[tensorFile_18_MPORT_50_addr];
	assign tensorFile_18_MPORT_18_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_18_MPORT_18_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_18_MPORT_18_mask = 1'h1;
	assign tensorFile_18_MPORT_18_en = (_waddr_0_T ? 1'h0 : wenTensInstr_18);
	assign tensorFile_19_MPORT_51_en = tensorFile_19_MPORT_51_en_pipe_0;
	assign tensorFile_19_MPORT_51_addr = tensorFile_19_MPORT_51_addr_pipe_0;
	assign tensorFile_19_MPORT_51_data = tensorFile_19[tensorFile_19_MPORT_51_addr];
	assign tensorFile_19_MPORT_19_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_19_MPORT_19_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_19_MPORT_19_mask = 1'h1;
	assign tensorFile_19_MPORT_19_en = (_waddr_0_T ? 1'h0 : wenTensInstr_19);
	assign tensorFile_20_MPORT_52_en = tensorFile_20_MPORT_52_en_pipe_0;
	assign tensorFile_20_MPORT_52_addr = tensorFile_20_MPORT_52_addr_pipe_0;
	assign tensorFile_20_MPORT_52_data = tensorFile_20[tensorFile_20_MPORT_52_addr];
	assign tensorFile_20_MPORT_20_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_20_MPORT_20_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_20_MPORT_20_mask = 1'h1;
	assign tensorFile_20_MPORT_20_en = (_waddr_0_T ? 1'h0 : wenTensInstr_20);
	assign tensorFile_21_MPORT_53_en = tensorFile_21_MPORT_53_en_pipe_0;
	assign tensorFile_21_MPORT_53_addr = tensorFile_21_MPORT_53_addr_pipe_0;
	assign tensorFile_21_MPORT_53_data = tensorFile_21[tensorFile_21_MPORT_53_addr];
	assign tensorFile_21_MPORT_21_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_21_MPORT_21_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_21_MPORT_21_mask = 1'h1;
	assign tensorFile_21_MPORT_21_en = (_waddr_0_T ? 1'h0 : wenTensInstr_21);
	assign tensorFile_22_MPORT_54_en = tensorFile_22_MPORT_54_en_pipe_0;
	assign tensorFile_22_MPORT_54_addr = tensorFile_22_MPORT_54_addr_pipe_0;
	assign tensorFile_22_MPORT_54_data = tensorFile_22[tensorFile_22_MPORT_54_addr];
	assign tensorFile_22_MPORT_22_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_22_MPORT_22_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_22_MPORT_22_mask = 1'h1;
	assign tensorFile_22_MPORT_22_en = (_waddr_0_T ? 1'h0 : wenTensInstr_22);
	assign tensorFile_23_MPORT_55_en = tensorFile_23_MPORT_55_en_pipe_0;
	assign tensorFile_23_MPORT_55_addr = tensorFile_23_MPORT_55_addr_pipe_0;
	assign tensorFile_23_MPORT_55_data = tensorFile_23[tensorFile_23_MPORT_55_addr];
	assign tensorFile_23_MPORT_23_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_23_MPORT_23_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_23_MPORT_23_mask = 1'h1;
	assign tensorFile_23_MPORT_23_en = (_waddr_0_T ? 1'h0 : wenTensInstr_23);
	assign tensorFile_24_MPORT_56_en = tensorFile_24_MPORT_56_en_pipe_0;
	assign tensorFile_24_MPORT_56_addr = tensorFile_24_MPORT_56_addr_pipe_0;
	assign tensorFile_24_MPORT_56_data = tensorFile_24[tensorFile_24_MPORT_56_addr];
	assign tensorFile_24_MPORT_24_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_24_MPORT_24_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_24_MPORT_24_mask = 1'h1;
	assign tensorFile_24_MPORT_24_en = (_waddr_0_T ? 1'h0 : wenTensInstr_24);
	assign tensorFile_25_MPORT_57_en = tensorFile_25_MPORT_57_en_pipe_0;
	assign tensorFile_25_MPORT_57_addr = tensorFile_25_MPORT_57_addr_pipe_0;
	assign tensorFile_25_MPORT_57_data = tensorFile_25[tensorFile_25_MPORT_57_addr];
	assign tensorFile_25_MPORT_25_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_25_MPORT_25_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_25_MPORT_25_mask = 1'h1;
	assign tensorFile_25_MPORT_25_en = (_waddr_0_T ? 1'h0 : wenTensInstr_25);
	assign tensorFile_26_MPORT_58_en = tensorFile_26_MPORT_58_en_pipe_0;
	assign tensorFile_26_MPORT_58_addr = tensorFile_26_MPORT_58_addr_pipe_0;
	assign tensorFile_26_MPORT_58_data = tensorFile_26[tensorFile_26_MPORT_58_addr];
	assign tensorFile_26_MPORT_26_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_26_MPORT_26_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_26_MPORT_26_mask = 1'h1;
	assign tensorFile_26_MPORT_26_en = (_waddr_0_T ? 1'h0 : wenTensInstr_26);
	assign tensorFile_27_MPORT_59_en = tensorFile_27_MPORT_59_en_pipe_0;
	assign tensorFile_27_MPORT_59_addr = tensorFile_27_MPORT_59_addr_pipe_0;
	assign tensorFile_27_MPORT_59_data = tensorFile_27[tensorFile_27_MPORT_59_addr];
	assign tensorFile_27_MPORT_27_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_27_MPORT_27_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_27_MPORT_27_mask = 1'h1;
	assign tensorFile_27_MPORT_27_en = (_waddr_0_T ? 1'h0 : wenTensInstr_27);
	assign tensorFile_28_MPORT_60_en = tensorFile_28_MPORT_60_en_pipe_0;
	assign tensorFile_28_MPORT_60_addr = tensorFile_28_MPORT_60_addr_pipe_0;
	assign tensorFile_28_MPORT_60_data = tensorFile_28[tensorFile_28_MPORT_60_addr];
	assign tensorFile_28_MPORT_28_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_28_MPORT_28_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_28_MPORT_28_mask = 1'h1;
	assign tensorFile_28_MPORT_28_en = (_waddr_0_T ? 1'h0 : wenTensInstr_28);
	assign tensorFile_29_MPORT_61_en = tensorFile_29_MPORT_61_en_pipe_0;
	assign tensorFile_29_MPORT_61_addr = tensorFile_29_MPORT_61_addr_pipe_0;
	assign tensorFile_29_MPORT_61_data = tensorFile_29[tensorFile_29_MPORT_61_addr];
	assign tensorFile_29_MPORT_29_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_29_MPORT_29_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_29_MPORT_29_mask = 1'h1;
	assign tensorFile_29_MPORT_29_en = (_waddr_0_T ? 1'h0 : wenTensInstr_29);
	assign tensorFile_30_MPORT_62_en = tensorFile_30_MPORT_62_en_pipe_0;
	assign tensorFile_30_MPORT_62_addr = tensorFile_30_MPORT_62_addr_pipe_0;
	assign tensorFile_30_MPORT_62_data = tensorFile_30[tensorFile_30_MPORT_62_addr];
	assign tensorFile_30_MPORT_30_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_30_MPORT_30_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_30_MPORT_30_mask = 1'h1;
	assign tensorFile_30_MPORT_30_en = (_waddr_0_T ? 1'h0 : wenTensInstr_30);
	assign tensorFile_31_MPORT_63_en = tensorFile_31_MPORT_63_en_pipe_0;
	assign tensorFile_31_MPORT_63_addr = tensorFile_31_MPORT_63_addr_pipe_0;
	assign tensorFile_31_MPORT_63_data = tensorFile_31[tensorFile_31_MPORT_63_addr];
	assign tensorFile_31_MPORT_31_data = (_waddr_0_T ? 64'h0000000000000000 : wdataTensInstr_0);
	assign tensorFile_31_MPORT_31_addr = (_waddr_0_T ? 10'h000 : waddrTensInstrTmp);
	assign tensorFile_31_MPORT_31_mask = 1'h1;
	assign tensorFile_31_MPORT_31_en = (_waddr_0_T ? 1'h0 : wenTensInstr_31);
	assign io_done = loadDone & fillPadding_io_done;
	assign io_vme_rd_cmd_valid = vmeCmd_io_vmeCmd_valid;
	assign io_vme_rd_cmd_bits_addr = vmeCmd_io_vmeCmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = vmeCmd_io_vmeCmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = vmeCmd_io_vmeCmd_bits_tag;
	assign io_vme_rd_data_ready = 1'h1;
	assign io_tensor_rd_0_data_valid = rvalid;
	assign io_tensor_rd_0_data_bits_0_0 = _T_84[7:0];
	assign io_tensor_rd_0_data_bits_0_1 = _T_84[15:8];
	assign io_tensor_rd_0_data_bits_0_2 = _T_84[23:16];
	assign io_tensor_rd_0_data_bits_0_3 = _T_84[31:24];
	assign io_tensor_rd_0_data_bits_0_4 = _T_84[39:32];
	assign io_tensor_rd_0_data_bits_0_5 = _T_84[47:40];
	assign io_tensor_rd_0_data_bits_0_6 = _T_84[55:48];
	assign io_tensor_rd_0_data_bits_0_7 = _T_84[63:56];
	assign io_tensor_rd_0_data_bits_0_8 = _T_84[71:64];
	assign io_tensor_rd_0_data_bits_0_9 = _T_84[79:72];
	assign io_tensor_rd_0_data_bits_0_10 = _T_84[87:80];
	assign io_tensor_rd_0_data_bits_0_11 = _T_84[95:88];
	assign io_tensor_rd_0_data_bits_0_12 = _T_84[103:96];
	assign io_tensor_rd_0_data_bits_0_13 = _T_84[111:104];
	assign io_tensor_rd_0_data_bits_0_14 = _T_84[119:112];
	assign io_tensor_rd_0_data_bits_0_15 = _T_84[127:120];
	assign io_tensor_rd_0_data_bits_1_0 = _T_84[135:128];
	assign io_tensor_rd_0_data_bits_1_1 = _T_84[143:136];
	assign io_tensor_rd_0_data_bits_1_2 = _T_84[151:144];
	assign io_tensor_rd_0_data_bits_1_3 = _T_84[159:152];
	assign io_tensor_rd_0_data_bits_1_4 = _T_84[167:160];
	assign io_tensor_rd_0_data_bits_1_5 = _T_84[175:168];
	assign io_tensor_rd_0_data_bits_1_6 = _T_84[183:176];
	assign io_tensor_rd_0_data_bits_1_7 = _T_84[191:184];
	assign io_tensor_rd_0_data_bits_1_8 = _T_84[199:192];
	assign io_tensor_rd_0_data_bits_1_9 = _T_84[207:200];
	assign io_tensor_rd_0_data_bits_1_10 = _T_84[215:208];
	assign io_tensor_rd_0_data_bits_1_11 = _T_84[223:216];
	assign io_tensor_rd_0_data_bits_1_12 = _T_84[231:224];
	assign io_tensor_rd_0_data_bits_1_13 = _T_84[239:232];
	assign io_tensor_rd_0_data_bits_1_14 = _T_84[247:240];
	assign io_tensor_rd_0_data_bits_1_15 = _T_84[255:248];
	assign io_tensor_rd_0_data_bits_2_0 = _T_84[263:256];
	assign io_tensor_rd_0_data_bits_2_1 = _T_84[271:264];
	assign io_tensor_rd_0_data_bits_2_2 = _T_84[279:272];
	assign io_tensor_rd_0_data_bits_2_3 = _T_84[287:280];
	assign io_tensor_rd_0_data_bits_2_4 = _T_84[295:288];
	assign io_tensor_rd_0_data_bits_2_5 = _T_84[303:296];
	assign io_tensor_rd_0_data_bits_2_6 = _T_84[311:304];
	assign io_tensor_rd_0_data_bits_2_7 = _T_84[319:312];
	assign io_tensor_rd_0_data_bits_2_8 = _T_84[327:320];
	assign io_tensor_rd_0_data_bits_2_9 = _T_84[335:328];
	assign io_tensor_rd_0_data_bits_2_10 = _T_84[343:336];
	assign io_tensor_rd_0_data_bits_2_11 = _T_84[351:344];
	assign io_tensor_rd_0_data_bits_2_12 = _T_84[359:352];
	assign io_tensor_rd_0_data_bits_2_13 = _T_84[367:360];
	assign io_tensor_rd_0_data_bits_2_14 = _T_84[375:368];
	assign io_tensor_rd_0_data_bits_2_15 = _T_84[383:376];
	assign io_tensor_rd_0_data_bits_3_0 = _T_84[391:384];
	assign io_tensor_rd_0_data_bits_3_1 = _T_84[399:392];
	assign io_tensor_rd_0_data_bits_3_2 = _T_84[407:400];
	assign io_tensor_rd_0_data_bits_3_3 = _T_84[415:408];
	assign io_tensor_rd_0_data_bits_3_4 = _T_84[423:416];
	assign io_tensor_rd_0_data_bits_3_5 = _T_84[431:424];
	assign io_tensor_rd_0_data_bits_3_6 = _T_84[439:432];
	assign io_tensor_rd_0_data_bits_3_7 = _T_84[447:440];
	assign io_tensor_rd_0_data_bits_3_8 = _T_84[455:448];
	assign io_tensor_rd_0_data_bits_3_9 = _T_84[463:456];
	assign io_tensor_rd_0_data_bits_3_10 = _T_84[471:464];
	assign io_tensor_rd_0_data_bits_3_11 = _T_84[479:472];
	assign io_tensor_rd_0_data_bits_3_12 = _T_84[487:480];
	assign io_tensor_rd_0_data_bits_3_13 = _T_84[495:488];
	assign io_tensor_rd_0_data_bits_3_14 = _T_84[503:496];
	assign io_tensor_rd_0_data_bits_3_15 = _T_84[511:504];
	assign io_tensor_rd_0_data_bits_4_0 = _T_84[519:512];
	assign io_tensor_rd_0_data_bits_4_1 = _T_84[527:520];
	assign io_tensor_rd_0_data_bits_4_2 = _T_84[535:528];
	assign io_tensor_rd_0_data_bits_4_3 = _T_84[543:536];
	assign io_tensor_rd_0_data_bits_4_4 = _T_84[551:544];
	assign io_tensor_rd_0_data_bits_4_5 = _T_84[559:552];
	assign io_tensor_rd_0_data_bits_4_6 = _T_84[567:560];
	assign io_tensor_rd_0_data_bits_4_7 = _T_84[575:568];
	assign io_tensor_rd_0_data_bits_4_8 = _T_84[583:576];
	assign io_tensor_rd_0_data_bits_4_9 = _T_84[591:584];
	assign io_tensor_rd_0_data_bits_4_10 = _T_84[599:592];
	assign io_tensor_rd_0_data_bits_4_11 = _T_84[607:600];
	assign io_tensor_rd_0_data_bits_4_12 = _T_84[615:608];
	assign io_tensor_rd_0_data_bits_4_13 = _T_84[623:616];
	assign io_tensor_rd_0_data_bits_4_14 = _T_84[631:624];
	assign io_tensor_rd_0_data_bits_4_15 = _T_84[639:632];
	assign io_tensor_rd_0_data_bits_5_0 = _T_84[647:640];
	assign io_tensor_rd_0_data_bits_5_1 = _T_84[655:648];
	assign io_tensor_rd_0_data_bits_5_2 = _T_84[663:656];
	assign io_tensor_rd_0_data_bits_5_3 = _T_84[671:664];
	assign io_tensor_rd_0_data_bits_5_4 = _T_84[679:672];
	assign io_tensor_rd_0_data_bits_5_5 = _T_84[687:680];
	assign io_tensor_rd_0_data_bits_5_6 = _T_84[695:688];
	assign io_tensor_rd_0_data_bits_5_7 = _T_84[703:696];
	assign io_tensor_rd_0_data_bits_5_8 = _T_84[711:704];
	assign io_tensor_rd_0_data_bits_5_9 = _T_84[719:712];
	assign io_tensor_rd_0_data_bits_5_10 = _T_84[727:720];
	assign io_tensor_rd_0_data_bits_5_11 = _T_84[735:728];
	assign io_tensor_rd_0_data_bits_5_12 = _T_84[743:736];
	assign io_tensor_rd_0_data_bits_5_13 = _T_84[751:744];
	assign io_tensor_rd_0_data_bits_5_14 = _T_84[759:752];
	assign io_tensor_rd_0_data_bits_5_15 = _T_84[767:760];
	assign io_tensor_rd_0_data_bits_6_0 = _T_84[775:768];
	assign io_tensor_rd_0_data_bits_6_1 = _T_84[783:776];
	assign io_tensor_rd_0_data_bits_6_2 = _T_84[791:784];
	assign io_tensor_rd_0_data_bits_6_3 = _T_84[799:792];
	assign io_tensor_rd_0_data_bits_6_4 = _T_84[807:800];
	assign io_tensor_rd_0_data_bits_6_5 = _T_84[815:808];
	assign io_tensor_rd_0_data_bits_6_6 = _T_84[823:816];
	assign io_tensor_rd_0_data_bits_6_7 = _T_84[831:824];
	assign io_tensor_rd_0_data_bits_6_8 = _T_84[839:832];
	assign io_tensor_rd_0_data_bits_6_9 = _T_84[847:840];
	assign io_tensor_rd_0_data_bits_6_10 = _T_84[855:848];
	assign io_tensor_rd_0_data_bits_6_11 = _T_84[863:856];
	assign io_tensor_rd_0_data_bits_6_12 = _T_84[871:864];
	assign io_tensor_rd_0_data_bits_6_13 = _T_84[879:872];
	assign io_tensor_rd_0_data_bits_6_14 = _T_84[887:880];
	assign io_tensor_rd_0_data_bits_6_15 = _T_84[895:888];
	assign io_tensor_rd_0_data_bits_7_0 = _T_84[903:896];
	assign io_tensor_rd_0_data_bits_7_1 = _T_84[911:904];
	assign io_tensor_rd_0_data_bits_7_2 = _T_84[919:912];
	assign io_tensor_rd_0_data_bits_7_3 = _T_84[927:920];
	assign io_tensor_rd_0_data_bits_7_4 = _T_84[935:928];
	assign io_tensor_rd_0_data_bits_7_5 = _T_84[943:936];
	assign io_tensor_rd_0_data_bits_7_6 = _T_84[951:944];
	assign io_tensor_rd_0_data_bits_7_7 = _T_84[959:952];
	assign io_tensor_rd_0_data_bits_7_8 = _T_84[967:960];
	assign io_tensor_rd_0_data_bits_7_9 = _T_84[975:968];
	assign io_tensor_rd_0_data_bits_7_10 = _T_84[983:976];
	assign io_tensor_rd_0_data_bits_7_11 = _T_84[991:984];
	assign io_tensor_rd_0_data_bits_7_12 = _T_84[999:992];
	assign io_tensor_rd_0_data_bits_7_13 = _T_84[1007:1000];
	assign io_tensor_rd_0_data_bits_7_14 = _T_84[1015:1008];
	assign io_tensor_rd_0_data_bits_7_15 = _T_84[1023:1016];
	assign io_tensor_rd_0_data_bits_8_0 = _T_84[1031:1024];
	assign io_tensor_rd_0_data_bits_8_1 = _T_84[1039:1032];
	assign io_tensor_rd_0_data_bits_8_2 = _T_84[1047:1040];
	assign io_tensor_rd_0_data_bits_8_3 = _T_84[1055:1048];
	assign io_tensor_rd_0_data_bits_8_4 = _T_84[1063:1056];
	assign io_tensor_rd_0_data_bits_8_5 = _T_84[1071:1064];
	assign io_tensor_rd_0_data_bits_8_6 = _T_84[1079:1072];
	assign io_tensor_rd_0_data_bits_8_7 = _T_84[1087:1080];
	assign io_tensor_rd_0_data_bits_8_8 = _T_84[1095:1088];
	assign io_tensor_rd_0_data_bits_8_9 = _T_84[1103:1096];
	assign io_tensor_rd_0_data_bits_8_10 = _T_84[1111:1104];
	assign io_tensor_rd_0_data_bits_8_11 = _T_84[1119:1112];
	assign io_tensor_rd_0_data_bits_8_12 = _T_84[1127:1120];
	assign io_tensor_rd_0_data_bits_8_13 = _T_84[1135:1128];
	assign io_tensor_rd_0_data_bits_8_14 = _T_84[1143:1136];
	assign io_tensor_rd_0_data_bits_8_15 = _T_84[1151:1144];
	assign io_tensor_rd_0_data_bits_9_0 = _T_84[1159:1152];
	assign io_tensor_rd_0_data_bits_9_1 = _T_84[1167:1160];
	assign io_tensor_rd_0_data_bits_9_2 = _T_84[1175:1168];
	assign io_tensor_rd_0_data_bits_9_3 = _T_84[1183:1176];
	assign io_tensor_rd_0_data_bits_9_4 = _T_84[1191:1184];
	assign io_tensor_rd_0_data_bits_9_5 = _T_84[1199:1192];
	assign io_tensor_rd_0_data_bits_9_6 = _T_84[1207:1200];
	assign io_tensor_rd_0_data_bits_9_7 = _T_84[1215:1208];
	assign io_tensor_rd_0_data_bits_9_8 = _T_84[1223:1216];
	assign io_tensor_rd_0_data_bits_9_9 = _T_84[1231:1224];
	assign io_tensor_rd_0_data_bits_9_10 = _T_84[1239:1232];
	assign io_tensor_rd_0_data_bits_9_11 = _T_84[1247:1240];
	assign io_tensor_rd_0_data_bits_9_12 = _T_84[1255:1248];
	assign io_tensor_rd_0_data_bits_9_13 = _T_84[1263:1256];
	assign io_tensor_rd_0_data_bits_9_14 = _T_84[1271:1264];
	assign io_tensor_rd_0_data_bits_9_15 = _T_84[1279:1272];
	assign io_tensor_rd_0_data_bits_10_0 = _T_84[1287:1280];
	assign io_tensor_rd_0_data_bits_10_1 = _T_84[1295:1288];
	assign io_tensor_rd_0_data_bits_10_2 = _T_84[1303:1296];
	assign io_tensor_rd_0_data_bits_10_3 = _T_84[1311:1304];
	assign io_tensor_rd_0_data_bits_10_4 = _T_84[1319:1312];
	assign io_tensor_rd_0_data_bits_10_5 = _T_84[1327:1320];
	assign io_tensor_rd_0_data_bits_10_6 = _T_84[1335:1328];
	assign io_tensor_rd_0_data_bits_10_7 = _T_84[1343:1336];
	assign io_tensor_rd_0_data_bits_10_8 = _T_84[1351:1344];
	assign io_tensor_rd_0_data_bits_10_9 = _T_84[1359:1352];
	assign io_tensor_rd_0_data_bits_10_10 = _T_84[1367:1360];
	assign io_tensor_rd_0_data_bits_10_11 = _T_84[1375:1368];
	assign io_tensor_rd_0_data_bits_10_12 = _T_84[1383:1376];
	assign io_tensor_rd_0_data_bits_10_13 = _T_84[1391:1384];
	assign io_tensor_rd_0_data_bits_10_14 = _T_84[1399:1392];
	assign io_tensor_rd_0_data_bits_10_15 = _T_84[1407:1400];
	assign io_tensor_rd_0_data_bits_11_0 = _T_84[1415:1408];
	assign io_tensor_rd_0_data_bits_11_1 = _T_84[1423:1416];
	assign io_tensor_rd_0_data_bits_11_2 = _T_84[1431:1424];
	assign io_tensor_rd_0_data_bits_11_3 = _T_84[1439:1432];
	assign io_tensor_rd_0_data_bits_11_4 = _T_84[1447:1440];
	assign io_tensor_rd_0_data_bits_11_5 = _T_84[1455:1448];
	assign io_tensor_rd_0_data_bits_11_6 = _T_84[1463:1456];
	assign io_tensor_rd_0_data_bits_11_7 = _T_84[1471:1464];
	assign io_tensor_rd_0_data_bits_11_8 = _T_84[1479:1472];
	assign io_tensor_rd_0_data_bits_11_9 = _T_84[1487:1480];
	assign io_tensor_rd_0_data_bits_11_10 = _T_84[1495:1488];
	assign io_tensor_rd_0_data_bits_11_11 = _T_84[1503:1496];
	assign io_tensor_rd_0_data_bits_11_12 = _T_84[1511:1504];
	assign io_tensor_rd_0_data_bits_11_13 = _T_84[1519:1512];
	assign io_tensor_rd_0_data_bits_11_14 = _T_84[1527:1520];
	assign io_tensor_rd_0_data_bits_11_15 = _T_84[1535:1528];
	assign io_tensor_rd_0_data_bits_12_0 = _T_84[1543:1536];
	assign io_tensor_rd_0_data_bits_12_1 = _T_84[1551:1544];
	assign io_tensor_rd_0_data_bits_12_2 = _T_84[1559:1552];
	assign io_tensor_rd_0_data_bits_12_3 = _T_84[1567:1560];
	assign io_tensor_rd_0_data_bits_12_4 = _T_84[1575:1568];
	assign io_tensor_rd_0_data_bits_12_5 = _T_84[1583:1576];
	assign io_tensor_rd_0_data_bits_12_6 = _T_84[1591:1584];
	assign io_tensor_rd_0_data_bits_12_7 = _T_84[1599:1592];
	assign io_tensor_rd_0_data_bits_12_8 = _T_84[1607:1600];
	assign io_tensor_rd_0_data_bits_12_9 = _T_84[1615:1608];
	assign io_tensor_rd_0_data_bits_12_10 = _T_84[1623:1616];
	assign io_tensor_rd_0_data_bits_12_11 = _T_84[1631:1624];
	assign io_tensor_rd_0_data_bits_12_12 = _T_84[1639:1632];
	assign io_tensor_rd_0_data_bits_12_13 = _T_84[1647:1640];
	assign io_tensor_rd_0_data_bits_12_14 = _T_84[1655:1648];
	assign io_tensor_rd_0_data_bits_12_15 = _T_84[1663:1656];
	assign io_tensor_rd_0_data_bits_13_0 = _T_84[1671:1664];
	assign io_tensor_rd_0_data_bits_13_1 = _T_84[1679:1672];
	assign io_tensor_rd_0_data_bits_13_2 = _T_84[1687:1680];
	assign io_tensor_rd_0_data_bits_13_3 = _T_84[1695:1688];
	assign io_tensor_rd_0_data_bits_13_4 = _T_84[1703:1696];
	assign io_tensor_rd_0_data_bits_13_5 = _T_84[1711:1704];
	assign io_tensor_rd_0_data_bits_13_6 = _T_84[1719:1712];
	assign io_tensor_rd_0_data_bits_13_7 = _T_84[1727:1720];
	assign io_tensor_rd_0_data_bits_13_8 = _T_84[1735:1728];
	assign io_tensor_rd_0_data_bits_13_9 = _T_84[1743:1736];
	assign io_tensor_rd_0_data_bits_13_10 = _T_84[1751:1744];
	assign io_tensor_rd_0_data_bits_13_11 = _T_84[1759:1752];
	assign io_tensor_rd_0_data_bits_13_12 = _T_84[1767:1760];
	assign io_tensor_rd_0_data_bits_13_13 = _T_84[1775:1768];
	assign io_tensor_rd_0_data_bits_13_14 = _T_84[1783:1776];
	assign io_tensor_rd_0_data_bits_13_15 = _T_84[1791:1784];
	assign io_tensor_rd_0_data_bits_14_0 = _T_84[1799:1792];
	assign io_tensor_rd_0_data_bits_14_1 = _T_84[1807:1800];
	assign io_tensor_rd_0_data_bits_14_2 = _T_84[1815:1808];
	assign io_tensor_rd_0_data_bits_14_3 = _T_84[1823:1816];
	assign io_tensor_rd_0_data_bits_14_4 = _T_84[1831:1824];
	assign io_tensor_rd_0_data_bits_14_5 = _T_84[1839:1832];
	assign io_tensor_rd_0_data_bits_14_6 = _T_84[1847:1840];
	assign io_tensor_rd_0_data_bits_14_7 = _T_84[1855:1848];
	assign io_tensor_rd_0_data_bits_14_8 = _T_84[1863:1856];
	assign io_tensor_rd_0_data_bits_14_9 = _T_84[1871:1864];
	assign io_tensor_rd_0_data_bits_14_10 = _T_84[1879:1872];
	assign io_tensor_rd_0_data_bits_14_11 = _T_84[1887:1880];
	assign io_tensor_rd_0_data_bits_14_12 = _T_84[1895:1888];
	assign io_tensor_rd_0_data_bits_14_13 = _T_84[1903:1896];
	assign io_tensor_rd_0_data_bits_14_14 = _T_84[1911:1904];
	assign io_tensor_rd_0_data_bits_14_15 = _T_84[1919:1912];
	assign io_tensor_rd_0_data_bits_15_0 = _T_84[1927:1920];
	assign io_tensor_rd_0_data_bits_15_1 = _T_84[1935:1928];
	assign io_tensor_rd_0_data_bits_15_2 = _T_84[1943:1936];
	assign io_tensor_rd_0_data_bits_15_3 = _T_84[1951:1944];
	assign io_tensor_rd_0_data_bits_15_4 = _T_84[1959:1952];
	assign io_tensor_rd_0_data_bits_15_5 = _T_84[1967:1960];
	assign io_tensor_rd_0_data_bits_15_6 = _T_84[1975:1968];
	assign io_tensor_rd_0_data_bits_15_7 = _T_84[1983:1976];
	assign io_tensor_rd_0_data_bits_15_8 = _T_84[1991:1984];
	assign io_tensor_rd_0_data_bits_15_9 = _T_84[1999:1992];
	assign io_tensor_rd_0_data_bits_15_10 = _T_84[2007:2000];
	assign io_tensor_rd_0_data_bits_15_11 = _T_84[2015:2008];
	assign io_tensor_rd_0_data_bits_15_12 = _T_84[2023:2016];
	assign io_tensor_rd_0_data_bits_15_13 = _T_84[2031:2024];
	assign io_tensor_rd_0_data_bits_15_14 = _T_84[2039:2032];
	assign io_tensor_rd_0_data_bits_15_15 = _T_84[2047:2040];
	assign vmeCmd_clock = clk;
	assign vmeCmd_reset = rst;
	assign vmeCmd_io_start = io_start;
	assign vmeCmd_io_isBusy = state;
	assign vmeCmd_io_inst = io_inst;
	assign vmeCmd_io_baddr = io_baddr;
	assign vmeCmd_io_vmeCmd_ready = io_vme_rd_cmd_ready;
	assign readData_clock = clk;
	assign readData_reset = rst;
	assign readData_io_start = io_start;
	assign readData_io_vmeData_valid = vmeDataValidPipe;
	assign readData_io_vmeData_bits_tag = vmeDataBitsPipe_tag;
	assign fillPadding_clock = clk;
	assign fillPadding_reset = rst;
	assign fillPadding_io_canWriteMem = ~vmeDataFirePipe;
	assign fillPadding_io_inst = fillPadding_io_inst_REG;
	assign fillPadding_io_start = fillPadding_io_start_REG;
	always @(posedge clk) begin
		if (tensorFile_0_MPORT_en & tensorFile_0_MPORT_mask)
			tensorFile_0[tensorFile_0_MPORT_addr] <= tensorFile_0_MPORT_data;
		tensorFile_0_MPORT_32_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_0_MPORT_32_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_1_MPORT_1_en & tensorFile_1_MPORT_1_mask)
			tensorFile_1[tensorFile_1_MPORT_1_addr] <= tensorFile_1_MPORT_1_data;
		tensorFile_1_MPORT_33_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_1_MPORT_33_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_2_MPORT_2_en & tensorFile_2_MPORT_2_mask)
			tensorFile_2[tensorFile_2_MPORT_2_addr] <= tensorFile_2_MPORT_2_data;
		tensorFile_2_MPORT_34_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_2_MPORT_34_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_3_MPORT_3_en & tensorFile_3_MPORT_3_mask)
			tensorFile_3[tensorFile_3_MPORT_3_addr] <= tensorFile_3_MPORT_3_data;
		tensorFile_3_MPORT_35_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_3_MPORT_35_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_4_MPORT_4_en & tensorFile_4_MPORT_4_mask)
			tensorFile_4[tensorFile_4_MPORT_4_addr] <= tensorFile_4_MPORT_4_data;
		tensorFile_4_MPORT_36_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_4_MPORT_36_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_5_MPORT_5_en & tensorFile_5_MPORT_5_mask)
			tensorFile_5[tensorFile_5_MPORT_5_addr] <= tensorFile_5_MPORT_5_data;
		tensorFile_5_MPORT_37_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_5_MPORT_37_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_6_MPORT_6_en & tensorFile_6_MPORT_6_mask)
			tensorFile_6[tensorFile_6_MPORT_6_addr] <= tensorFile_6_MPORT_6_data;
		tensorFile_6_MPORT_38_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_6_MPORT_38_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_7_MPORT_7_en & tensorFile_7_MPORT_7_mask)
			tensorFile_7[tensorFile_7_MPORT_7_addr] <= tensorFile_7_MPORT_7_data;
		tensorFile_7_MPORT_39_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_7_MPORT_39_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_8_MPORT_8_en & tensorFile_8_MPORT_8_mask)
			tensorFile_8[tensorFile_8_MPORT_8_addr] <= tensorFile_8_MPORT_8_data;
		tensorFile_8_MPORT_40_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_8_MPORT_40_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_9_MPORT_9_en & tensorFile_9_MPORT_9_mask)
			tensorFile_9[tensorFile_9_MPORT_9_addr] <= tensorFile_9_MPORT_9_data;
		tensorFile_9_MPORT_41_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_9_MPORT_41_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_10_MPORT_10_en & tensorFile_10_MPORT_10_mask)
			tensorFile_10[tensorFile_10_MPORT_10_addr] <= tensorFile_10_MPORT_10_data;
		tensorFile_10_MPORT_42_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_10_MPORT_42_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_11_MPORT_11_en & tensorFile_11_MPORT_11_mask)
			tensorFile_11[tensorFile_11_MPORT_11_addr] <= tensorFile_11_MPORT_11_data;
		tensorFile_11_MPORT_43_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_11_MPORT_43_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_12_MPORT_12_en & tensorFile_12_MPORT_12_mask)
			tensorFile_12[tensorFile_12_MPORT_12_addr] <= tensorFile_12_MPORT_12_data;
		tensorFile_12_MPORT_44_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_12_MPORT_44_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_13_MPORT_13_en & tensorFile_13_MPORT_13_mask)
			tensorFile_13[tensorFile_13_MPORT_13_addr] <= tensorFile_13_MPORT_13_data;
		tensorFile_13_MPORT_45_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_13_MPORT_45_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_14_MPORT_14_en & tensorFile_14_MPORT_14_mask)
			tensorFile_14[tensorFile_14_MPORT_14_addr] <= tensorFile_14_MPORT_14_data;
		tensorFile_14_MPORT_46_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_14_MPORT_46_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_15_MPORT_15_en & tensorFile_15_MPORT_15_mask)
			tensorFile_15[tensorFile_15_MPORT_15_addr] <= tensorFile_15_MPORT_15_data;
		tensorFile_15_MPORT_47_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_15_MPORT_47_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_16_MPORT_16_en & tensorFile_16_MPORT_16_mask)
			tensorFile_16[tensorFile_16_MPORT_16_addr] <= tensorFile_16_MPORT_16_data;
		tensorFile_16_MPORT_48_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_16_MPORT_48_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_17_MPORT_17_en & tensorFile_17_MPORT_17_mask)
			tensorFile_17[tensorFile_17_MPORT_17_addr] <= tensorFile_17_MPORT_17_data;
		tensorFile_17_MPORT_49_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_17_MPORT_49_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_18_MPORT_18_en & tensorFile_18_MPORT_18_mask)
			tensorFile_18[tensorFile_18_MPORT_18_addr] <= tensorFile_18_MPORT_18_data;
		tensorFile_18_MPORT_50_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_18_MPORT_50_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_19_MPORT_19_en & tensorFile_19_MPORT_19_mask)
			tensorFile_19[tensorFile_19_MPORT_19_addr] <= tensorFile_19_MPORT_19_data;
		tensorFile_19_MPORT_51_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_19_MPORT_51_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_20_MPORT_20_en & tensorFile_20_MPORT_20_mask)
			tensorFile_20[tensorFile_20_MPORT_20_addr] <= tensorFile_20_MPORT_20_data;
		tensorFile_20_MPORT_52_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_20_MPORT_52_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_21_MPORT_21_en & tensorFile_21_MPORT_21_mask)
			tensorFile_21[tensorFile_21_MPORT_21_addr] <= tensorFile_21_MPORT_21_data;
		tensorFile_21_MPORT_53_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_21_MPORT_53_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_22_MPORT_22_en & tensorFile_22_MPORT_22_mask)
			tensorFile_22[tensorFile_22_MPORT_22_addr] <= tensorFile_22_MPORT_22_data;
		tensorFile_22_MPORT_54_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_22_MPORT_54_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_23_MPORT_23_en & tensorFile_23_MPORT_23_mask)
			tensorFile_23[tensorFile_23_MPORT_23_addr] <= tensorFile_23_MPORT_23_data;
		tensorFile_23_MPORT_55_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_23_MPORT_55_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_24_MPORT_24_en & tensorFile_24_MPORT_24_mask)
			tensorFile_24[tensorFile_24_MPORT_24_addr] <= tensorFile_24_MPORT_24_data;
		tensorFile_24_MPORT_56_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_24_MPORT_56_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_25_MPORT_25_en & tensorFile_25_MPORT_25_mask)
			tensorFile_25[tensorFile_25_MPORT_25_addr] <= tensorFile_25_MPORT_25_data;
		tensorFile_25_MPORT_57_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_25_MPORT_57_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_26_MPORT_26_en & tensorFile_26_MPORT_26_mask)
			tensorFile_26[tensorFile_26_MPORT_26_addr] <= tensorFile_26_MPORT_26_data;
		tensorFile_26_MPORT_58_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_26_MPORT_58_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_27_MPORT_27_en & tensorFile_27_MPORT_27_mask)
			tensorFile_27[tensorFile_27_MPORT_27_addr] <= tensorFile_27_MPORT_27_data;
		tensorFile_27_MPORT_59_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_27_MPORT_59_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_28_MPORT_28_en & tensorFile_28_MPORT_28_mask)
			tensorFile_28[tensorFile_28_MPORT_28_addr] <= tensorFile_28_MPORT_28_data;
		tensorFile_28_MPORT_60_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_28_MPORT_60_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_29_MPORT_29_en & tensorFile_29_MPORT_29_mask)
			tensorFile_29[tensorFile_29_MPORT_29_addr] <= tensorFile_29_MPORT_29_data;
		tensorFile_29_MPORT_61_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_29_MPORT_61_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_30_MPORT_30_en & tensorFile_30_MPORT_30_mask)
			tensorFile_30[tensorFile_30_MPORT_30_addr] <= tensorFile_30_MPORT_30_data;
		tensorFile_30_MPORT_62_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_30_MPORT_62_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_31_MPORT_31_en & tensorFile_31_MPORT_31_mask)
			tensorFile_31[tensorFile_31_MPORT_31_addr] <= tensorFile_31_MPORT_31_data;
		tensorFile_31_MPORT_63_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_31_MPORT_63_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (rst)
			state <= 1'h0;
		else
			state <= _GEN_1;
		if (io_start)
			blocksInFlight <= 15'h0000;
		else if ((state & _T) & ~vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_1;
		else if (_T_1 & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_5;
		else if ((state & ~_T) & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_7;
		vmeDataBitsPipe_data <= io_vme_rd_data_bits_data;
		vmeDataBitsPipe_tag <= io_vme_rd_data_bits_tag;
		if (rst)
			vmeDataValidPipe <= 1'h0;
		else
			vmeDataValidPipe <= io_vme_rd_data_valid;
		if (rst)
			vmeDataReadyPipe <= 1'h0;
		else
			vmeDataReadyPipe <= io_vme_rd_data_ready;
		fillPadding_io_inst_REG <= io_inst;
		if (rst)
			fillPadding_io_start_REG <= 1'h0;
		else
			fillPadding_io_start_REG <= io_start;
		if (rst)
			rvalid <= 1'h0;
		else
			rvalid <= io_tensor_rd_0_idx_valid;
		if (((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst) & ~(blocksInFlight > 15'h0000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:95 assert(blocksInFlight > 0.U)\n");
	end
	always @(posedge clk) begin
		if ((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst)
			;
		if (_T_13)
			;
	end
endmodule
module TensorLoadWgt (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15,
	io_tensor_rd_0_data_bits_1_0,
	io_tensor_rd_0_data_bits_1_1,
	io_tensor_rd_0_data_bits_1_2,
	io_tensor_rd_0_data_bits_1_3,
	io_tensor_rd_0_data_bits_1_4,
	io_tensor_rd_0_data_bits_1_5,
	io_tensor_rd_0_data_bits_1_6,
	io_tensor_rd_0_data_bits_1_7,
	io_tensor_rd_0_data_bits_1_8,
	io_tensor_rd_0_data_bits_1_9,
	io_tensor_rd_0_data_bits_1_10,
	io_tensor_rd_0_data_bits_1_11,
	io_tensor_rd_0_data_bits_1_12,
	io_tensor_rd_0_data_bits_1_13,
	io_tensor_rd_0_data_bits_1_14,
	io_tensor_rd_0_data_bits_1_15,
	io_tensor_rd_0_data_bits_2_0,
	io_tensor_rd_0_data_bits_2_1,
	io_tensor_rd_0_data_bits_2_2,
	io_tensor_rd_0_data_bits_2_3,
	io_tensor_rd_0_data_bits_2_4,
	io_tensor_rd_0_data_bits_2_5,
	io_tensor_rd_0_data_bits_2_6,
	io_tensor_rd_0_data_bits_2_7,
	io_tensor_rd_0_data_bits_2_8,
	io_tensor_rd_0_data_bits_2_9,
	io_tensor_rd_0_data_bits_2_10,
	io_tensor_rd_0_data_bits_2_11,
	io_tensor_rd_0_data_bits_2_12,
	io_tensor_rd_0_data_bits_2_13,
	io_tensor_rd_0_data_bits_2_14,
	io_tensor_rd_0_data_bits_2_15,
	io_tensor_rd_0_data_bits_3_0,
	io_tensor_rd_0_data_bits_3_1,
	io_tensor_rd_0_data_bits_3_2,
	io_tensor_rd_0_data_bits_3_3,
	io_tensor_rd_0_data_bits_3_4,
	io_tensor_rd_0_data_bits_3_5,
	io_tensor_rd_0_data_bits_3_6,
	io_tensor_rd_0_data_bits_3_7,
	io_tensor_rd_0_data_bits_3_8,
	io_tensor_rd_0_data_bits_3_9,
	io_tensor_rd_0_data_bits_3_10,
	io_tensor_rd_0_data_bits_3_11,
	io_tensor_rd_0_data_bits_3_12,
	io_tensor_rd_0_data_bits_3_13,
	io_tensor_rd_0_data_bits_3_14,
	io_tensor_rd_0_data_bits_3_15,
	io_tensor_rd_0_data_bits_4_0,
	io_tensor_rd_0_data_bits_4_1,
	io_tensor_rd_0_data_bits_4_2,
	io_tensor_rd_0_data_bits_4_3,
	io_tensor_rd_0_data_bits_4_4,
	io_tensor_rd_0_data_bits_4_5,
	io_tensor_rd_0_data_bits_4_6,
	io_tensor_rd_0_data_bits_4_7,
	io_tensor_rd_0_data_bits_4_8,
	io_tensor_rd_0_data_bits_4_9,
	io_tensor_rd_0_data_bits_4_10,
	io_tensor_rd_0_data_bits_4_11,
	io_tensor_rd_0_data_bits_4_12,
	io_tensor_rd_0_data_bits_4_13,
	io_tensor_rd_0_data_bits_4_14,
	io_tensor_rd_0_data_bits_4_15,
	io_tensor_rd_0_data_bits_5_0,
	io_tensor_rd_0_data_bits_5_1,
	io_tensor_rd_0_data_bits_5_2,
	io_tensor_rd_0_data_bits_5_3,
	io_tensor_rd_0_data_bits_5_4,
	io_tensor_rd_0_data_bits_5_5,
	io_tensor_rd_0_data_bits_5_6,
	io_tensor_rd_0_data_bits_5_7,
	io_tensor_rd_0_data_bits_5_8,
	io_tensor_rd_0_data_bits_5_9,
	io_tensor_rd_0_data_bits_5_10,
	io_tensor_rd_0_data_bits_5_11,
	io_tensor_rd_0_data_bits_5_12,
	io_tensor_rd_0_data_bits_5_13,
	io_tensor_rd_0_data_bits_5_14,
	io_tensor_rd_0_data_bits_5_15,
	io_tensor_rd_0_data_bits_6_0,
	io_tensor_rd_0_data_bits_6_1,
	io_tensor_rd_0_data_bits_6_2,
	io_tensor_rd_0_data_bits_6_3,
	io_tensor_rd_0_data_bits_6_4,
	io_tensor_rd_0_data_bits_6_5,
	io_tensor_rd_0_data_bits_6_6,
	io_tensor_rd_0_data_bits_6_7,
	io_tensor_rd_0_data_bits_6_8,
	io_tensor_rd_0_data_bits_6_9,
	io_tensor_rd_0_data_bits_6_10,
	io_tensor_rd_0_data_bits_6_11,
	io_tensor_rd_0_data_bits_6_12,
	io_tensor_rd_0_data_bits_6_13,
	io_tensor_rd_0_data_bits_6_14,
	io_tensor_rd_0_data_bits_6_15,
	io_tensor_rd_0_data_bits_7_0,
	io_tensor_rd_0_data_bits_7_1,
	io_tensor_rd_0_data_bits_7_2,
	io_tensor_rd_0_data_bits_7_3,
	io_tensor_rd_0_data_bits_7_4,
	io_tensor_rd_0_data_bits_7_5,
	io_tensor_rd_0_data_bits_7_6,
	io_tensor_rd_0_data_bits_7_7,
	io_tensor_rd_0_data_bits_7_8,
	io_tensor_rd_0_data_bits_7_9,
	io_tensor_rd_0_data_bits_7_10,
	io_tensor_rd_0_data_bits_7_11,
	io_tensor_rd_0_data_bits_7_12,
	io_tensor_rd_0_data_bits_7_13,
	io_tensor_rd_0_data_bits_7_14,
	io_tensor_rd_0_data_bits_7_15,
	io_tensor_rd_0_data_bits_8_0,
	io_tensor_rd_0_data_bits_8_1,
	io_tensor_rd_0_data_bits_8_2,
	io_tensor_rd_0_data_bits_8_3,
	io_tensor_rd_0_data_bits_8_4,
	io_tensor_rd_0_data_bits_8_5,
	io_tensor_rd_0_data_bits_8_6,
	io_tensor_rd_0_data_bits_8_7,
	io_tensor_rd_0_data_bits_8_8,
	io_tensor_rd_0_data_bits_8_9,
	io_tensor_rd_0_data_bits_8_10,
	io_tensor_rd_0_data_bits_8_11,
	io_tensor_rd_0_data_bits_8_12,
	io_tensor_rd_0_data_bits_8_13,
	io_tensor_rd_0_data_bits_8_14,
	io_tensor_rd_0_data_bits_8_15,
	io_tensor_rd_0_data_bits_9_0,
	io_tensor_rd_0_data_bits_9_1,
	io_tensor_rd_0_data_bits_9_2,
	io_tensor_rd_0_data_bits_9_3,
	io_tensor_rd_0_data_bits_9_4,
	io_tensor_rd_0_data_bits_9_5,
	io_tensor_rd_0_data_bits_9_6,
	io_tensor_rd_0_data_bits_9_7,
	io_tensor_rd_0_data_bits_9_8,
	io_tensor_rd_0_data_bits_9_9,
	io_tensor_rd_0_data_bits_9_10,
	io_tensor_rd_0_data_bits_9_11,
	io_tensor_rd_0_data_bits_9_12,
	io_tensor_rd_0_data_bits_9_13,
	io_tensor_rd_0_data_bits_9_14,
	io_tensor_rd_0_data_bits_9_15,
	io_tensor_rd_0_data_bits_10_0,
	io_tensor_rd_0_data_bits_10_1,
	io_tensor_rd_0_data_bits_10_2,
	io_tensor_rd_0_data_bits_10_3,
	io_tensor_rd_0_data_bits_10_4,
	io_tensor_rd_0_data_bits_10_5,
	io_tensor_rd_0_data_bits_10_6,
	io_tensor_rd_0_data_bits_10_7,
	io_tensor_rd_0_data_bits_10_8,
	io_tensor_rd_0_data_bits_10_9,
	io_tensor_rd_0_data_bits_10_10,
	io_tensor_rd_0_data_bits_10_11,
	io_tensor_rd_0_data_bits_10_12,
	io_tensor_rd_0_data_bits_10_13,
	io_tensor_rd_0_data_bits_10_14,
	io_tensor_rd_0_data_bits_10_15,
	io_tensor_rd_0_data_bits_11_0,
	io_tensor_rd_0_data_bits_11_1,
	io_tensor_rd_0_data_bits_11_2,
	io_tensor_rd_0_data_bits_11_3,
	io_tensor_rd_0_data_bits_11_4,
	io_tensor_rd_0_data_bits_11_5,
	io_tensor_rd_0_data_bits_11_6,
	io_tensor_rd_0_data_bits_11_7,
	io_tensor_rd_0_data_bits_11_8,
	io_tensor_rd_0_data_bits_11_9,
	io_tensor_rd_0_data_bits_11_10,
	io_tensor_rd_0_data_bits_11_11,
	io_tensor_rd_0_data_bits_11_12,
	io_tensor_rd_0_data_bits_11_13,
	io_tensor_rd_0_data_bits_11_14,
	io_tensor_rd_0_data_bits_11_15,
	io_tensor_rd_0_data_bits_12_0,
	io_tensor_rd_0_data_bits_12_1,
	io_tensor_rd_0_data_bits_12_2,
	io_tensor_rd_0_data_bits_12_3,
	io_tensor_rd_0_data_bits_12_4,
	io_tensor_rd_0_data_bits_12_5,
	io_tensor_rd_0_data_bits_12_6,
	io_tensor_rd_0_data_bits_12_7,
	io_tensor_rd_0_data_bits_12_8,
	io_tensor_rd_0_data_bits_12_9,
	io_tensor_rd_0_data_bits_12_10,
	io_tensor_rd_0_data_bits_12_11,
	io_tensor_rd_0_data_bits_12_12,
	io_tensor_rd_0_data_bits_12_13,
	io_tensor_rd_0_data_bits_12_14,
	io_tensor_rd_0_data_bits_12_15,
	io_tensor_rd_0_data_bits_13_0,
	io_tensor_rd_0_data_bits_13_1,
	io_tensor_rd_0_data_bits_13_2,
	io_tensor_rd_0_data_bits_13_3,
	io_tensor_rd_0_data_bits_13_4,
	io_tensor_rd_0_data_bits_13_5,
	io_tensor_rd_0_data_bits_13_6,
	io_tensor_rd_0_data_bits_13_7,
	io_tensor_rd_0_data_bits_13_8,
	io_tensor_rd_0_data_bits_13_9,
	io_tensor_rd_0_data_bits_13_10,
	io_tensor_rd_0_data_bits_13_11,
	io_tensor_rd_0_data_bits_13_12,
	io_tensor_rd_0_data_bits_13_13,
	io_tensor_rd_0_data_bits_13_14,
	io_tensor_rd_0_data_bits_13_15,
	io_tensor_rd_0_data_bits_14_0,
	io_tensor_rd_0_data_bits_14_1,
	io_tensor_rd_0_data_bits_14_2,
	io_tensor_rd_0_data_bits_14_3,
	io_tensor_rd_0_data_bits_14_4,
	io_tensor_rd_0_data_bits_14_5,
	io_tensor_rd_0_data_bits_14_6,
	io_tensor_rd_0_data_bits_14_7,
	io_tensor_rd_0_data_bits_14_8,
	io_tensor_rd_0_data_bits_14_9,
	io_tensor_rd_0_data_bits_14_10,
	io_tensor_rd_0_data_bits_14_11,
	io_tensor_rd_0_data_bits_14_12,
	io_tensor_rd_0_data_bits_14_13,
	io_tensor_rd_0_data_bits_14_14,
	io_tensor_rd_0_data_bits_14_15,
	io_tensor_rd_0_data_bits_15_0,
	io_tensor_rd_0_data_bits_15_1,
	io_tensor_rd_0_data_bits_15_2,
	io_tensor_rd_0_data_bits_15_3,
	io_tensor_rd_0_data_bits_15_4,
	io_tensor_rd_0_data_bits_15_5,
	io_tensor_rd_0_data_bits_15_6,
	io_tensor_rd_0_data_bits_15_7,
	io_tensor_rd_0_data_bits_15_8,
	io_tensor_rd_0_data_bits_15_9,
	io_tensor_rd_0_data_bits_15_10,
	io_tensor_rd_0_data_bits_15_11,
	io_tensor_rd_0_data_bits_15_12,
	io_tensor_rd_0_data_bits_15_13,
	io_tensor_rd_0_data_bits_15_14,
	io_tensor_rd_0_data_bits_15_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [9:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [7:0] io_tensor_rd_0_data_bits_0_0;
	output wire [7:0] io_tensor_rd_0_data_bits_0_1;
	output wire [7:0] io_tensor_rd_0_data_bits_0_2;
	output wire [7:0] io_tensor_rd_0_data_bits_0_3;
	output wire [7:0] io_tensor_rd_0_data_bits_0_4;
	output wire [7:0] io_tensor_rd_0_data_bits_0_5;
	output wire [7:0] io_tensor_rd_0_data_bits_0_6;
	output wire [7:0] io_tensor_rd_0_data_bits_0_7;
	output wire [7:0] io_tensor_rd_0_data_bits_0_8;
	output wire [7:0] io_tensor_rd_0_data_bits_0_9;
	output wire [7:0] io_tensor_rd_0_data_bits_0_10;
	output wire [7:0] io_tensor_rd_0_data_bits_0_11;
	output wire [7:0] io_tensor_rd_0_data_bits_0_12;
	output wire [7:0] io_tensor_rd_0_data_bits_0_13;
	output wire [7:0] io_tensor_rd_0_data_bits_0_14;
	output wire [7:0] io_tensor_rd_0_data_bits_0_15;
	output wire [7:0] io_tensor_rd_0_data_bits_1_0;
	output wire [7:0] io_tensor_rd_0_data_bits_1_1;
	output wire [7:0] io_tensor_rd_0_data_bits_1_2;
	output wire [7:0] io_tensor_rd_0_data_bits_1_3;
	output wire [7:0] io_tensor_rd_0_data_bits_1_4;
	output wire [7:0] io_tensor_rd_0_data_bits_1_5;
	output wire [7:0] io_tensor_rd_0_data_bits_1_6;
	output wire [7:0] io_tensor_rd_0_data_bits_1_7;
	output wire [7:0] io_tensor_rd_0_data_bits_1_8;
	output wire [7:0] io_tensor_rd_0_data_bits_1_9;
	output wire [7:0] io_tensor_rd_0_data_bits_1_10;
	output wire [7:0] io_tensor_rd_0_data_bits_1_11;
	output wire [7:0] io_tensor_rd_0_data_bits_1_12;
	output wire [7:0] io_tensor_rd_0_data_bits_1_13;
	output wire [7:0] io_tensor_rd_0_data_bits_1_14;
	output wire [7:0] io_tensor_rd_0_data_bits_1_15;
	output wire [7:0] io_tensor_rd_0_data_bits_2_0;
	output wire [7:0] io_tensor_rd_0_data_bits_2_1;
	output wire [7:0] io_tensor_rd_0_data_bits_2_2;
	output wire [7:0] io_tensor_rd_0_data_bits_2_3;
	output wire [7:0] io_tensor_rd_0_data_bits_2_4;
	output wire [7:0] io_tensor_rd_0_data_bits_2_5;
	output wire [7:0] io_tensor_rd_0_data_bits_2_6;
	output wire [7:0] io_tensor_rd_0_data_bits_2_7;
	output wire [7:0] io_tensor_rd_0_data_bits_2_8;
	output wire [7:0] io_tensor_rd_0_data_bits_2_9;
	output wire [7:0] io_tensor_rd_0_data_bits_2_10;
	output wire [7:0] io_tensor_rd_0_data_bits_2_11;
	output wire [7:0] io_tensor_rd_0_data_bits_2_12;
	output wire [7:0] io_tensor_rd_0_data_bits_2_13;
	output wire [7:0] io_tensor_rd_0_data_bits_2_14;
	output wire [7:0] io_tensor_rd_0_data_bits_2_15;
	output wire [7:0] io_tensor_rd_0_data_bits_3_0;
	output wire [7:0] io_tensor_rd_0_data_bits_3_1;
	output wire [7:0] io_tensor_rd_0_data_bits_3_2;
	output wire [7:0] io_tensor_rd_0_data_bits_3_3;
	output wire [7:0] io_tensor_rd_0_data_bits_3_4;
	output wire [7:0] io_tensor_rd_0_data_bits_3_5;
	output wire [7:0] io_tensor_rd_0_data_bits_3_6;
	output wire [7:0] io_tensor_rd_0_data_bits_3_7;
	output wire [7:0] io_tensor_rd_0_data_bits_3_8;
	output wire [7:0] io_tensor_rd_0_data_bits_3_9;
	output wire [7:0] io_tensor_rd_0_data_bits_3_10;
	output wire [7:0] io_tensor_rd_0_data_bits_3_11;
	output wire [7:0] io_tensor_rd_0_data_bits_3_12;
	output wire [7:0] io_tensor_rd_0_data_bits_3_13;
	output wire [7:0] io_tensor_rd_0_data_bits_3_14;
	output wire [7:0] io_tensor_rd_0_data_bits_3_15;
	output wire [7:0] io_tensor_rd_0_data_bits_4_0;
	output wire [7:0] io_tensor_rd_0_data_bits_4_1;
	output wire [7:0] io_tensor_rd_0_data_bits_4_2;
	output wire [7:0] io_tensor_rd_0_data_bits_4_3;
	output wire [7:0] io_tensor_rd_0_data_bits_4_4;
	output wire [7:0] io_tensor_rd_0_data_bits_4_5;
	output wire [7:0] io_tensor_rd_0_data_bits_4_6;
	output wire [7:0] io_tensor_rd_0_data_bits_4_7;
	output wire [7:0] io_tensor_rd_0_data_bits_4_8;
	output wire [7:0] io_tensor_rd_0_data_bits_4_9;
	output wire [7:0] io_tensor_rd_0_data_bits_4_10;
	output wire [7:0] io_tensor_rd_0_data_bits_4_11;
	output wire [7:0] io_tensor_rd_0_data_bits_4_12;
	output wire [7:0] io_tensor_rd_0_data_bits_4_13;
	output wire [7:0] io_tensor_rd_0_data_bits_4_14;
	output wire [7:0] io_tensor_rd_0_data_bits_4_15;
	output wire [7:0] io_tensor_rd_0_data_bits_5_0;
	output wire [7:0] io_tensor_rd_0_data_bits_5_1;
	output wire [7:0] io_tensor_rd_0_data_bits_5_2;
	output wire [7:0] io_tensor_rd_0_data_bits_5_3;
	output wire [7:0] io_tensor_rd_0_data_bits_5_4;
	output wire [7:0] io_tensor_rd_0_data_bits_5_5;
	output wire [7:0] io_tensor_rd_0_data_bits_5_6;
	output wire [7:0] io_tensor_rd_0_data_bits_5_7;
	output wire [7:0] io_tensor_rd_0_data_bits_5_8;
	output wire [7:0] io_tensor_rd_0_data_bits_5_9;
	output wire [7:0] io_tensor_rd_0_data_bits_5_10;
	output wire [7:0] io_tensor_rd_0_data_bits_5_11;
	output wire [7:0] io_tensor_rd_0_data_bits_5_12;
	output wire [7:0] io_tensor_rd_0_data_bits_5_13;
	output wire [7:0] io_tensor_rd_0_data_bits_5_14;
	output wire [7:0] io_tensor_rd_0_data_bits_5_15;
	output wire [7:0] io_tensor_rd_0_data_bits_6_0;
	output wire [7:0] io_tensor_rd_0_data_bits_6_1;
	output wire [7:0] io_tensor_rd_0_data_bits_6_2;
	output wire [7:0] io_tensor_rd_0_data_bits_6_3;
	output wire [7:0] io_tensor_rd_0_data_bits_6_4;
	output wire [7:0] io_tensor_rd_0_data_bits_6_5;
	output wire [7:0] io_tensor_rd_0_data_bits_6_6;
	output wire [7:0] io_tensor_rd_0_data_bits_6_7;
	output wire [7:0] io_tensor_rd_0_data_bits_6_8;
	output wire [7:0] io_tensor_rd_0_data_bits_6_9;
	output wire [7:0] io_tensor_rd_0_data_bits_6_10;
	output wire [7:0] io_tensor_rd_0_data_bits_6_11;
	output wire [7:0] io_tensor_rd_0_data_bits_6_12;
	output wire [7:0] io_tensor_rd_0_data_bits_6_13;
	output wire [7:0] io_tensor_rd_0_data_bits_6_14;
	output wire [7:0] io_tensor_rd_0_data_bits_6_15;
	output wire [7:0] io_tensor_rd_0_data_bits_7_0;
	output wire [7:0] io_tensor_rd_0_data_bits_7_1;
	output wire [7:0] io_tensor_rd_0_data_bits_7_2;
	output wire [7:0] io_tensor_rd_0_data_bits_7_3;
	output wire [7:0] io_tensor_rd_0_data_bits_7_4;
	output wire [7:0] io_tensor_rd_0_data_bits_7_5;
	output wire [7:0] io_tensor_rd_0_data_bits_7_6;
	output wire [7:0] io_tensor_rd_0_data_bits_7_7;
	output wire [7:0] io_tensor_rd_0_data_bits_7_8;
	output wire [7:0] io_tensor_rd_0_data_bits_7_9;
	output wire [7:0] io_tensor_rd_0_data_bits_7_10;
	output wire [7:0] io_tensor_rd_0_data_bits_7_11;
	output wire [7:0] io_tensor_rd_0_data_bits_7_12;
	output wire [7:0] io_tensor_rd_0_data_bits_7_13;
	output wire [7:0] io_tensor_rd_0_data_bits_7_14;
	output wire [7:0] io_tensor_rd_0_data_bits_7_15;
	output wire [7:0] io_tensor_rd_0_data_bits_8_0;
	output wire [7:0] io_tensor_rd_0_data_bits_8_1;
	output wire [7:0] io_tensor_rd_0_data_bits_8_2;
	output wire [7:0] io_tensor_rd_0_data_bits_8_3;
	output wire [7:0] io_tensor_rd_0_data_bits_8_4;
	output wire [7:0] io_tensor_rd_0_data_bits_8_5;
	output wire [7:0] io_tensor_rd_0_data_bits_8_6;
	output wire [7:0] io_tensor_rd_0_data_bits_8_7;
	output wire [7:0] io_tensor_rd_0_data_bits_8_8;
	output wire [7:0] io_tensor_rd_0_data_bits_8_9;
	output wire [7:0] io_tensor_rd_0_data_bits_8_10;
	output wire [7:0] io_tensor_rd_0_data_bits_8_11;
	output wire [7:0] io_tensor_rd_0_data_bits_8_12;
	output wire [7:0] io_tensor_rd_0_data_bits_8_13;
	output wire [7:0] io_tensor_rd_0_data_bits_8_14;
	output wire [7:0] io_tensor_rd_0_data_bits_8_15;
	output wire [7:0] io_tensor_rd_0_data_bits_9_0;
	output wire [7:0] io_tensor_rd_0_data_bits_9_1;
	output wire [7:0] io_tensor_rd_0_data_bits_9_2;
	output wire [7:0] io_tensor_rd_0_data_bits_9_3;
	output wire [7:0] io_tensor_rd_0_data_bits_9_4;
	output wire [7:0] io_tensor_rd_0_data_bits_9_5;
	output wire [7:0] io_tensor_rd_0_data_bits_9_6;
	output wire [7:0] io_tensor_rd_0_data_bits_9_7;
	output wire [7:0] io_tensor_rd_0_data_bits_9_8;
	output wire [7:0] io_tensor_rd_0_data_bits_9_9;
	output wire [7:0] io_tensor_rd_0_data_bits_9_10;
	output wire [7:0] io_tensor_rd_0_data_bits_9_11;
	output wire [7:0] io_tensor_rd_0_data_bits_9_12;
	output wire [7:0] io_tensor_rd_0_data_bits_9_13;
	output wire [7:0] io_tensor_rd_0_data_bits_9_14;
	output wire [7:0] io_tensor_rd_0_data_bits_9_15;
	output wire [7:0] io_tensor_rd_0_data_bits_10_0;
	output wire [7:0] io_tensor_rd_0_data_bits_10_1;
	output wire [7:0] io_tensor_rd_0_data_bits_10_2;
	output wire [7:0] io_tensor_rd_0_data_bits_10_3;
	output wire [7:0] io_tensor_rd_0_data_bits_10_4;
	output wire [7:0] io_tensor_rd_0_data_bits_10_5;
	output wire [7:0] io_tensor_rd_0_data_bits_10_6;
	output wire [7:0] io_tensor_rd_0_data_bits_10_7;
	output wire [7:0] io_tensor_rd_0_data_bits_10_8;
	output wire [7:0] io_tensor_rd_0_data_bits_10_9;
	output wire [7:0] io_tensor_rd_0_data_bits_10_10;
	output wire [7:0] io_tensor_rd_0_data_bits_10_11;
	output wire [7:0] io_tensor_rd_0_data_bits_10_12;
	output wire [7:0] io_tensor_rd_0_data_bits_10_13;
	output wire [7:0] io_tensor_rd_0_data_bits_10_14;
	output wire [7:0] io_tensor_rd_0_data_bits_10_15;
	output wire [7:0] io_tensor_rd_0_data_bits_11_0;
	output wire [7:0] io_tensor_rd_0_data_bits_11_1;
	output wire [7:0] io_tensor_rd_0_data_bits_11_2;
	output wire [7:0] io_tensor_rd_0_data_bits_11_3;
	output wire [7:0] io_tensor_rd_0_data_bits_11_4;
	output wire [7:0] io_tensor_rd_0_data_bits_11_5;
	output wire [7:0] io_tensor_rd_0_data_bits_11_6;
	output wire [7:0] io_tensor_rd_0_data_bits_11_7;
	output wire [7:0] io_tensor_rd_0_data_bits_11_8;
	output wire [7:0] io_tensor_rd_0_data_bits_11_9;
	output wire [7:0] io_tensor_rd_0_data_bits_11_10;
	output wire [7:0] io_tensor_rd_0_data_bits_11_11;
	output wire [7:0] io_tensor_rd_0_data_bits_11_12;
	output wire [7:0] io_tensor_rd_0_data_bits_11_13;
	output wire [7:0] io_tensor_rd_0_data_bits_11_14;
	output wire [7:0] io_tensor_rd_0_data_bits_11_15;
	output wire [7:0] io_tensor_rd_0_data_bits_12_0;
	output wire [7:0] io_tensor_rd_0_data_bits_12_1;
	output wire [7:0] io_tensor_rd_0_data_bits_12_2;
	output wire [7:0] io_tensor_rd_0_data_bits_12_3;
	output wire [7:0] io_tensor_rd_0_data_bits_12_4;
	output wire [7:0] io_tensor_rd_0_data_bits_12_5;
	output wire [7:0] io_tensor_rd_0_data_bits_12_6;
	output wire [7:0] io_tensor_rd_0_data_bits_12_7;
	output wire [7:0] io_tensor_rd_0_data_bits_12_8;
	output wire [7:0] io_tensor_rd_0_data_bits_12_9;
	output wire [7:0] io_tensor_rd_0_data_bits_12_10;
	output wire [7:0] io_tensor_rd_0_data_bits_12_11;
	output wire [7:0] io_tensor_rd_0_data_bits_12_12;
	output wire [7:0] io_tensor_rd_0_data_bits_12_13;
	output wire [7:0] io_tensor_rd_0_data_bits_12_14;
	output wire [7:0] io_tensor_rd_0_data_bits_12_15;
	output wire [7:0] io_tensor_rd_0_data_bits_13_0;
	output wire [7:0] io_tensor_rd_0_data_bits_13_1;
	output wire [7:0] io_tensor_rd_0_data_bits_13_2;
	output wire [7:0] io_tensor_rd_0_data_bits_13_3;
	output wire [7:0] io_tensor_rd_0_data_bits_13_4;
	output wire [7:0] io_tensor_rd_0_data_bits_13_5;
	output wire [7:0] io_tensor_rd_0_data_bits_13_6;
	output wire [7:0] io_tensor_rd_0_data_bits_13_7;
	output wire [7:0] io_tensor_rd_0_data_bits_13_8;
	output wire [7:0] io_tensor_rd_0_data_bits_13_9;
	output wire [7:0] io_tensor_rd_0_data_bits_13_10;
	output wire [7:0] io_tensor_rd_0_data_bits_13_11;
	output wire [7:0] io_tensor_rd_0_data_bits_13_12;
	output wire [7:0] io_tensor_rd_0_data_bits_13_13;
	output wire [7:0] io_tensor_rd_0_data_bits_13_14;
	output wire [7:0] io_tensor_rd_0_data_bits_13_15;
	output wire [7:0] io_tensor_rd_0_data_bits_14_0;
	output wire [7:0] io_tensor_rd_0_data_bits_14_1;
	output wire [7:0] io_tensor_rd_0_data_bits_14_2;
	output wire [7:0] io_tensor_rd_0_data_bits_14_3;
	output wire [7:0] io_tensor_rd_0_data_bits_14_4;
	output wire [7:0] io_tensor_rd_0_data_bits_14_5;
	output wire [7:0] io_tensor_rd_0_data_bits_14_6;
	output wire [7:0] io_tensor_rd_0_data_bits_14_7;
	output wire [7:0] io_tensor_rd_0_data_bits_14_8;
	output wire [7:0] io_tensor_rd_0_data_bits_14_9;
	output wire [7:0] io_tensor_rd_0_data_bits_14_10;
	output wire [7:0] io_tensor_rd_0_data_bits_14_11;
	output wire [7:0] io_tensor_rd_0_data_bits_14_12;
	output wire [7:0] io_tensor_rd_0_data_bits_14_13;
	output wire [7:0] io_tensor_rd_0_data_bits_14_14;
	output wire [7:0] io_tensor_rd_0_data_bits_14_15;
	output wire [7:0] io_tensor_rd_0_data_bits_15_0;
	output wire [7:0] io_tensor_rd_0_data_bits_15_1;
	output wire [7:0] io_tensor_rd_0_data_bits_15_2;
	output wire [7:0] io_tensor_rd_0_data_bits_15_3;
	output wire [7:0] io_tensor_rd_0_data_bits_15_4;
	output wire [7:0] io_tensor_rd_0_data_bits_15_5;
	output wire [7:0] io_tensor_rd_0_data_bits_15_6;
	output wire [7:0] io_tensor_rd_0_data_bits_15_7;
	output wire [7:0] io_tensor_rd_0_data_bits_15_8;
	output wire [7:0] io_tensor_rd_0_data_bits_15_9;
	output wire [7:0] io_tensor_rd_0_data_bits_15_10;
	output wire [7:0] io_tensor_rd_0_data_bits_15_11;
	output wire [7:0] io_tensor_rd_0_data_bits_15_12;
	output wire [7:0] io_tensor_rd_0_data_bits_15_13;
	output wire [7:0] io_tensor_rd_0_data_bits_15_14;
	output wire [7:0] io_tensor_rd_0_data_bits_15_15;
	wire tensorLoad_clock;
	wire tensorLoad_reset;
	wire tensorLoad_io_start;
	wire tensorLoad_io_done;
	wire [127:0] tensorLoad_io_inst;
	wire [63:0] tensorLoad_io_baddr;
	wire tensorLoad_io_vme_rd_cmd_ready;
	wire tensorLoad_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_io_vme_rd_data_ready;
	wire tensorLoad_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_io_vme_rd_data_bits_tag;
	wire tensorLoad_io_tensor_rd_0_idx_valid;
	wire [9:0] tensorLoad_io_tensor_rd_0_idx_bits;
	wire tensorLoad_io_tensor_rd_0_data_valid;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_0_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_1_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_2_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_3_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_4_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_5_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_6_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_7_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_8_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_9_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_10_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_11_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_12_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_13_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_14_15;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_0;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_1;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_2;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_3;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_4;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_5;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_6;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_7;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_8;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_9;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_10;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_11;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_12;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_13;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_14;
	wire [7:0] tensorLoad_io_tensor_rd_0_data_bits_15_15;
	TensorLoadNarrowVME_1 tensorLoad(
		.clk(tensorLoad_clock),
		.rst(tensorLoad_reset),
		.io_start(tensorLoad_io_start),
		.io_done(tensorLoad_io_done),
		.io_inst(tensorLoad_io_inst),
		.io_baddr(tensorLoad_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_ready(tensorLoad_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(tensorLoad_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorLoad_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorLoad_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorLoad_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorLoad_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorLoad_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorLoad_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorLoad_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorLoad_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorLoad_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorLoad_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorLoad_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorLoad_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorLoad_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorLoad_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorLoad_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorLoad_io_tensor_rd_0_data_bits_0_15),
		.io_tensor_rd_0_data_bits_1_0(tensorLoad_io_tensor_rd_0_data_bits_1_0),
		.io_tensor_rd_0_data_bits_1_1(tensorLoad_io_tensor_rd_0_data_bits_1_1),
		.io_tensor_rd_0_data_bits_1_2(tensorLoad_io_tensor_rd_0_data_bits_1_2),
		.io_tensor_rd_0_data_bits_1_3(tensorLoad_io_tensor_rd_0_data_bits_1_3),
		.io_tensor_rd_0_data_bits_1_4(tensorLoad_io_tensor_rd_0_data_bits_1_4),
		.io_tensor_rd_0_data_bits_1_5(tensorLoad_io_tensor_rd_0_data_bits_1_5),
		.io_tensor_rd_0_data_bits_1_6(tensorLoad_io_tensor_rd_0_data_bits_1_6),
		.io_tensor_rd_0_data_bits_1_7(tensorLoad_io_tensor_rd_0_data_bits_1_7),
		.io_tensor_rd_0_data_bits_1_8(tensorLoad_io_tensor_rd_0_data_bits_1_8),
		.io_tensor_rd_0_data_bits_1_9(tensorLoad_io_tensor_rd_0_data_bits_1_9),
		.io_tensor_rd_0_data_bits_1_10(tensorLoad_io_tensor_rd_0_data_bits_1_10),
		.io_tensor_rd_0_data_bits_1_11(tensorLoad_io_tensor_rd_0_data_bits_1_11),
		.io_tensor_rd_0_data_bits_1_12(tensorLoad_io_tensor_rd_0_data_bits_1_12),
		.io_tensor_rd_0_data_bits_1_13(tensorLoad_io_tensor_rd_0_data_bits_1_13),
		.io_tensor_rd_0_data_bits_1_14(tensorLoad_io_tensor_rd_0_data_bits_1_14),
		.io_tensor_rd_0_data_bits_1_15(tensorLoad_io_tensor_rd_0_data_bits_1_15),
		.io_tensor_rd_0_data_bits_2_0(tensorLoad_io_tensor_rd_0_data_bits_2_0),
		.io_tensor_rd_0_data_bits_2_1(tensorLoad_io_tensor_rd_0_data_bits_2_1),
		.io_tensor_rd_0_data_bits_2_2(tensorLoad_io_tensor_rd_0_data_bits_2_2),
		.io_tensor_rd_0_data_bits_2_3(tensorLoad_io_tensor_rd_0_data_bits_2_3),
		.io_tensor_rd_0_data_bits_2_4(tensorLoad_io_tensor_rd_0_data_bits_2_4),
		.io_tensor_rd_0_data_bits_2_5(tensorLoad_io_tensor_rd_0_data_bits_2_5),
		.io_tensor_rd_0_data_bits_2_6(tensorLoad_io_tensor_rd_0_data_bits_2_6),
		.io_tensor_rd_0_data_bits_2_7(tensorLoad_io_tensor_rd_0_data_bits_2_7),
		.io_tensor_rd_0_data_bits_2_8(tensorLoad_io_tensor_rd_0_data_bits_2_8),
		.io_tensor_rd_0_data_bits_2_9(tensorLoad_io_tensor_rd_0_data_bits_2_9),
		.io_tensor_rd_0_data_bits_2_10(tensorLoad_io_tensor_rd_0_data_bits_2_10),
		.io_tensor_rd_0_data_bits_2_11(tensorLoad_io_tensor_rd_0_data_bits_2_11),
		.io_tensor_rd_0_data_bits_2_12(tensorLoad_io_tensor_rd_0_data_bits_2_12),
		.io_tensor_rd_0_data_bits_2_13(tensorLoad_io_tensor_rd_0_data_bits_2_13),
		.io_tensor_rd_0_data_bits_2_14(tensorLoad_io_tensor_rd_0_data_bits_2_14),
		.io_tensor_rd_0_data_bits_2_15(tensorLoad_io_tensor_rd_0_data_bits_2_15),
		.io_tensor_rd_0_data_bits_3_0(tensorLoad_io_tensor_rd_0_data_bits_3_0),
		.io_tensor_rd_0_data_bits_3_1(tensorLoad_io_tensor_rd_0_data_bits_3_1),
		.io_tensor_rd_0_data_bits_3_2(tensorLoad_io_tensor_rd_0_data_bits_3_2),
		.io_tensor_rd_0_data_bits_3_3(tensorLoad_io_tensor_rd_0_data_bits_3_3),
		.io_tensor_rd_0_data_bits_3_4(tensorLoad_io_tensor_rd_0_data_bits_3_4),
		.io_tensor_rd_0_data_bits_3_5(tensorLoad_io_tensor_rd_0_data_bits_3_5),
		.io_tensor_rd_0_data_bits_3_6(tensorLoad_io_tensor_rd_0_data_bits_3_6),
		.io_tensor_rd_0_data_bits_3_7(tensorLoad_io_tensor_rd_0_data_bits_3_7),
		.io_tensor_rd_0_data_bits_3_8(tensorLoad_io_tensor_rd_0_data_bits_3_8),
		.io_tensor_rd_0_data_bits_3_9(tensorLoad_io_tensor_rd_0_data_bits_3_9),
		.io_tensor_rd_0_data_bits_3_10(tensorLoad_io_tensor_rd_0_data_bits_3_10),
		.io_tensor_rd_0_data_bits_3_11(tensorLoad_io_tensor_rd_0_data_bits_3_11),
		.io_tensor_rd_0_data_bits_3_12(tensorLoad_io_tensor_rd_0_data_bits_3_12),
		.io_tensor_rd_0_data_bits_3_13(tensorLoad_io_tensor_rd_0_data_bits_3_13),
		.io_tensor_rd_0_data_bits_3_14(tensorLoad_io_tensor_rd_0_data_bits_3_14),
		.io_tensor_rd_0_data_bits_3_15(tensorLoad_io_tensor_rd_0_data_bits_3_15),
		.io_tensor_rd_0_data_bits_4_0(tensorLoad_io_tensor_rd_0_data_bits_4_0),
		.io_tensor_rd_0_data_bits_4_1(tensorLoad_io_tensor_rd_0_data_bits_4_1),
		.io_tensor_rd_0_data_bits_4_2(tensorLoad_io_tensor_rd_0_data_bits_4_2),
		.io_tensor_rd_0_data_bits_4_3(tensorLoad_io_tensor_rd_0_data_bits_4_3),
		.io_tensor_rd_0_data_bits_4_4(tensorLoad_io_tensor_rd_0_data_bits_4_4),
		.io_tensor_rd_0_data_bits_4_5(tensorLoad_io_tensor_rd_0_data_bits_4_5),
		.io_tensor_rd_0_data_bits_4_6(tensorLoad_io_tensor_rd_0_data_bits_4_6),
		.io_tensor_rd_0_data_bits_4_7(tensorLoad_io_tensor_rd_0_data_bits_4_7),
		.io_tensor_rd_0_data_bits_4_8(tensorLoad_io_tensor_rd_0_data_bits_4_8),
		.io_tensor_rd_0_data_bits_4_9(tensorLoad_io_tensor_rd_0_data_bits_4_9),
		.io_tensor_rd_0_data_bits_4_10(tensorLoad_io_tensor_rd_0_data_bits_4_10),
		.io_tensor_rd_0_data_bits_4_11(tensorLoad_io_tensor_rd_0_data_bits_4_11),
		.io_tensor_rd_0_data_bits_4_12(tensorLoad_io_tensor_rd_0_data_bits_4_12),
		.io_tensor_rd_0_data_bits_4_13(tensorLoad_io_tensor_rd_0_data_bits_4_13),
		.io_tensor_rd_0_data_bits_4_14(tensorLoad_io_tensor_rd_0_data_bits_4_14),
		.io_tensor_rd_0_data_bits_4_15(tensorLoad_io_tensor_rd_0_data_bits_4_15),
		.io_tensor_rd_0_data_bits_5_0(tensorLoad_io_tensor_rd_0_data_bits_5_0),
		.io_tensor_rd_0_data_bits_5_1(tensorLoad_io_tensor_rd_0_data_bits_5_1),
		.io_tensor_rd_0_data_bits_5_2(tensorLoad_io_tensor_rd_0_data_bits_5_2),
		.io_tensor_rd_0_data_bits_5_3(tensorLoad_io_tensor_rd_0_data_bits_5_3),
		.io_tensor_rd_0_data_bits_5_4(tensorLoad_io_tensor_rd_0_data_bits_5_4),
		.io_tensor_rd_0_data_bits_5_5(tensorLoad_io_tensor_rd_0_data_bits_5_5),
		.io_tensor_rd_0_data_bits_5_6(tensorLoad_io_tensor_rd_0_data_bits_5_6),
		.io_tensor_rd_0_data_bits_5_7(tensorLoad_io_tensor_rd_0_data_bits_5_7),
		.io_tensor_rd_0_data_bits_5_8(tensorLoad_io_tensor_rd_0_data_bits_5_8),
		.io_tensor_rd_0_data_bits_5_9(tensorLoad_io_tensor_rd_0_data_bits_5_9),
		.io_tensor_rd_0_data_bits_5_10(tensorLoad_io_tensor_rd_0_data_bits_5_10),
		.io_tensor_rd_0_data_bits_5_11(tensorLoad_io_tensor_rd_0_data_bits_5_11),
		.io_tensor_rd_0_data_bits_5_12(tensorLoad_io_tensor_rd_0_data_bits_5_12),
		.io_tensor_rd_0_data_bits_5_13(tensorLoad_io_tensor_rd_0_data_bits_5_13),
		.io_tensor_rd_0_data_bits_5_14(tensorLoad_io_tensor_rd_0_data_bits_5_14),
		.io_tensor_rd_0_data_bits_5_15(tensorLoad_io_tensor_rd_0_data_bits_5_15),
		.io_tensor_rd_0_data_bits_6_0(tensorLoad_io_tensor_rd_0_data_bits_6_0),
		.io_tensor_rd_0_data_bits_6_1(tensorLoad_io_tensor_rd_0_data_bits_6_1),
		.io_tensor_rd_0_data_bits_6_2(tensorLoad_io_tensor_rd_0_data_bits_6_2),
		.io_tensor_rd_0_data_bits_6_3(tensorLoad_io_tensor_rd_0_data_bits_6_3),
		.io_tensor_rd_0_data_bits_6_4(tensorLoad_io_tensor_rd_0_data_bits_6_4),
		.io_tensor_rd_0_data_bits_6_5(tensorLoad_io_tensor_rd_0_data_bits_6_5),
		.io_tensor_rd_0_data_bits_6_6(tensorLoad_io_tensor_rd_0_data_bits_6_6),
		.io_tensor_rd_0_data_bits_6_7(tensorLoad_io_tensor_rd_0_data_bits_6_7),
		.io_tensor_rd_0_data_bits_6_8(tensorLoad_io_tensor_rd_0_data_bits_6_8),
		.io_tensor_rd_0_data_bits_6_9(tensorLoad_io_tensor_rd_0_data_bits_6_9),
		.io_tensor_rd_0_data_bits_6_10(tensorLoad_io_tensor_rd_0_data_bits_6_10),
		.io_tensor_rd_0_data_bits_6_11(tensorLoad_io_tensor_rd_0_data_bits_6_11),
		.io_tensor_rd_0_data_bits_6_12(tensorLoad_io_tensor_rd_0_data_bits_6_12),
		.io_tensor_rd_0_data_bits_6_13(tensorLoad_io_tensor_rd_0_data_bits_6_13),
		.io_tensor_rd_0_data_bits_6_14(tensorLoad_io_tensor_rd_0_data_bits_6_14),
		.io_tensor_rd_0_data_bits_6_15(tensorLoad_io_tensor_rd_0_data_bits_6_15),
		.io_tensor_rd_0_data_bits_7_0(tensorLoad_io_tensor_rd_0_data_bits_7_0),
		.io_tensor_rd_0_data_bits_7_1(tensorLoad_io_tensor_rd_0_data_bits_7_1),
		.io_tensor_rd_0_data_bits_7_2(tensorLoad_io_tensor_rd_0_data_bits_7_2),
		.io_tensor_rd_0_data_bits_7_3(tensorLoad_io_tensor_rd_0_data_bits_7_3),
		.io_tensor_rd_0_data_bits_7_4(tensorLoad_io_tensor_rd_0_data_bits_7_4),
		.io_tensor_rd_0_data_bits_7_5(tensorLoad_io_tensor_rd_0_data_bits_7_5),
		.io_tensor_rd_0_data_bits_7_6(tensorLoad_io_tensor_rd_0_data_bits_7_6),
		.io_tensor_rd_0_data_bits_7_7(tensorLoad_io_tensor_rd_0_data_bits_7_7),
		.io_tensor_rd_0_data_bits_7_8(tensorLoad_io_tensor_rd_0_data_bits_7_8),
		.io_tensor_rd_0_data_bits_7_9(tensorLoad_io_tensor_rd_0_data_bits_7_9),
		.io_tensor_rd_0_data_bits_7_10(tensorLoad_io_tensor_rd_0_data_bits_7_10),
		.io_tensor_rd_0_data_bits_7_11(tensorLoad_io_tensor_rd_0_data_bits_7_11),
		.io_tensor_rd_0_data_bits_7_12(tensorLoad_io_tensor_rd_0_data_bits_7_12),
		.io_tensor_rd_0_data_bits_7_13(tensorLoad_io_tensor_rd_0_data_bits_7_13),
		.io_tensor_rd_0_data_bits_7_14(tensorLoad_io_tensor_rd_0_data_bits_7_14),
		.io_tensor_rd_0_data_bits_7_15(tensorLoad_io_tensor_rd_0_data_bits_7_15),
		.io_tensor_rd_0_data_bits_8_0(tensorLoad_io_tensor_rd_0_data_bits_8_0),
		.io_tensor_rd_0_data_bits_8_1(tensorLoad_io_tensor_rd_0_data_bits_8_1),
		.io_tensor_rd_0_data_bits_8_2(tensorLoad_io_tensor_rd_0_data_bits_8_2),
		.io_tensor_rd_0_data_bits_8_3(tensorLoad_io_tensor_rd_0_data_bits_8_3),
		.io_tensor_rd_0_data_bits_8_4(tensorLoad_io_tensor_rd_0_data_bits_8_4),
		.io_tensor_rd_0_data_bits_8_5(tensorLoad_io_tensor_rd_0_data_bits_8_5),
		.io_tensor_rd_0_data_bits_8_6(tensorLoad_io_tensor_rd_0_data_bits_8_6),
		.io_tensor_rd_0_data_bits_8_7(tensorLoad_io_tensor_rd_0_data_bits_8_7),
		.io_tensor_rd_0_data_bits_8_8(tensorLoad_io_tensor_rd_0_data_bits_8_8),
		.io_tensor_rd_0_data_bits_8_9(tensorLoad_io_tensor_rd_0_data_bits_8_9),
		.io_tensor_rd_0_data_bits_8_10(tensorLoad_io_tensor_rd_0_data_bits_8_10),
		.io_tensor_rd_0_data_bits_8_11(tensorLoad_io_tensor_rd_0_data_bits_8_11),
		.io_tensor_rd_0_data_bits_8_12(tensorLoad_io_tensor_rd_0_data_bits_8_12),
		.io_tensor_rd_0_data_bits_8_13(tensorLoad_io_tensor_rd_0_data_bits_8_13),
		.io_tensor_rd_0_data_bits_8_14(tensorLoad_io_tensor_rd_0_data_bits_8_14),
		.io_tensor_rd_0_data_bits_8_15(tensorLoad_io_tensor_rd_0_data_bits_8_15),
		.io_tensor_rd_0_data_bits_9_0(tensorLoad_io_tensor_rd_0_data_bits_9_0),
		.io_tensor_rd_0_data_bits_9_1(tensorLoad_io_tensor_rd_0_data_bits_9_1),
		.io_tensor_rd_0_data_bits_9_2(tensorLoad_io_tensor_rd_0_data_bits_9_2),
		.io_tensor_rd_0_data_bits_9_3(tensorLoad_io_tensor_rd_0_data_bits_9_3),
		.io_tensor_rd_0_data_bits_9_4(tensorLoad_io_tensor_rd_0_data_bits_9_4),
		.io_tensor_rd_0_data_bits_9_5(tensorLoad_io_tensor_rd_0_data_bits_9_5),
		.io_tensor_rd_0_data_bits_9_6(tensorLoad_io_tensor_rd_0_data_bits_9_6),
		.io_tensor_rd_0_data_bits_9_7(tensorLoad_io_tensor_rd_0_data_bits_9_7),
		.io_tensor_rd_0_data_bits_9_8(tensorLoad_io_tensor_rd_0_data_bits_9_8),
		.io_tensor_rd_0_data_bits_9_9(tensorLoad_io_tensor_rd_0_data_bits_9_9),
		.io_tensor_rd_0_data_bits_9_10(tensorLoad_io_tensor_rd_0_data_bits_9_10),
		.io_tensor_rd_0_data_bits_9_11(tensorLoad_io_tensor_rd_0_data_bits_9_11),
		.io_tensor_rd_0_data_bits_9_12(tensorLoad_io_tensor_rd_0_data_bits_9_12),
		.io_tensor_rd_0_data_bits_9_13(tensorLoad_io_tensor_rd_0_data_bits_9_13),
		.io_tensor_rd_0_data_bits_9_14(tensorLoad_io_tensor_rd_0_data_bits_9_14),
		.io_tensor_rd_0_data_bits_9_15(tensorLoad_io_tensor_rd_0_data_bits_9_15),
		.io_tensor_rd_0_data_bits_10_0(tensorLoad_io_tensor_rd_0_data_bits_10_0),
		.io_tensor_rd_0_data_bits_10_1(tensorLoad_io_tensor_rd_0_data_bits_10_1),
		.io_tensor_rd_0_data_bits_10_2(tensorLoad_io_tensor_rd_0_data_bits_10_2),
		.io_tensor_rd_0_data_bits_10_3(tensorLoad_io_tensor_rd_0_data_bits_10_3),
		.io_tensor_rd_0_data_bits_10_4(tensorLoad_io_tensor_rd_0_data_bits_10_4),
		.io_tensor_rd_0_data_bits_10_5(tensorLoad_io_tensor_rd_0_data_bits_10_5),
		.io_tensor_rd_0_data_bits_10_6(tensorLoad_io_tensor_rd_0_data_bits_10_6),
		.io_tensor_rd_0_data_bits_10_7(tensorLoad_io_tensor_rd_0_data_bits_10_7),
		.io_tensor_rd_0_data_bits_10_8(tensorLoad_io_tensor_rd_0_data_bits_10_8),
		.io_tensor_rd_0_data_bits_10_9(tensorLoad_io_tensor_rd_0_data_bits_10_9),
		.io_tensor_rd_0_data_bits_10_10(tensorLoad_io_tensor_rd_0_data_bits_10_10),
		.io_tensor_rd_0_data_bits_10_11(tensorLoad_io_tensor_rd_0_data_bits_10_11),
		.io_tensor_rd_0_data_bits_10_12(tensorLoad_io_tensor_rd_0_data_bits_10_12),
		.io_tensor_rd_0_data_bits_10_13(tensorLoad_io_tensor_rd_0_data_bits_10_13),
		.io_tensor_rd_0_data_bits_10_14(tensorLoad_io_tensor_rd_0_data_bits_10_14),
		.io_tensor_rd_0_data_bits_10_15(tensorLoad_io_tensor_rd_0_data_bits_10_15),
		.io_tensor_rd_0_data_bits_11_0(tensorLoad_io_tensor_rd_0_data_bits_11_0),
		.io_tensor_rd_0_data_bits_11_1(tensorLoad_io_tensor_rd_0_data_bits_11_1),
		.io_tensor_rd_0_data_bits_11_2(tensorLoad_io_tensor_rd_0_data_bits_11_2),
		.io_tensor_rd_0_data_bits_11_3(tensorLoad_io_tensor_rd_0_data_bits_11_3),
		.io_tensor_rd_0_data_bits_11_4(tensorLoad_io_tensor_rd_0_data_bits_11_4),
		.io_tensor_rd_0_data_bits_11_5(tensorLoad_io_tensor_rd_0_data_bits_11_5),
		.io_tensor_rd_0_data_bits_11_6(tensorLoad_io_tensor_rd_0_data_bits_11_6),
		.io_tensor_rd_0_data_bits_11_7(tensorLoad_io_tensor_rd_0_data_bits_11_7),
		.io_tensor_rd_0_data_bits_11_8(tensorLoad_io_tensor_rd_0_data_bits_11_8),
		.io_tensor_rd_0_data_bits_11_9(tensorLoad_io_tensor_rd_0_data_bits_11_9),
		.io_tensor_rd_0_data_bits_11_10(tensorLoad_io_tensor_rd_0_data_bits_11_10),
		.io_tensor_rd_0_data_bits_11_11(tensorLoad_io_tensor_rd_0_data_bits_11_11),
		.io_tensor_rd_0_data_bits_11_12(tensorLoad_io_tensor_rd_0_data_bits_11_12),
		.io_tensor_rd_0_data_bits_11_13(tensorLoad_io_tensor_rd_0_data_bits_11_13),
		.io_tensor_rd_0_data_bits_11_14(tensorLoad_io_tensor_rd_0_data_bits_11_14),
		.io_tensor_rd_0_data_bits_11_15(tensorLoad_io_tensor_rd_0_data_bits_11_15),
		.io_tensor_rd_0_data_bits_12_0(tensorLoad_io_tensor_rd_0_data_bits_12_0),
		.io_tensor_rd_0_data_bits_12_1(tensorLoad_io_tensor_rd_0_data_bits_12_1),
		.io_tensor_rd_0_data_bits_12_2(tensorLoad_io_tensor_rd_0_data_bits_12_2),
		.io_tensor_rd_0_data_bits_12_3(tensorLoad_io_tensor_rd_0_data_bits_12_3),
		.io_tensor_rd_0_data_bits_12_4(tensorLoad_io_tensor_rd_0_data_bits_12_4),
		.io_tensor_rd_0_data_bits_12_5(tensorLoad_io_tensor_rd_0_data_bits_12_5),
		.io_tensor_rd_0_data_bits_12_6(tensorLoad_io_tensor_rd_0_data_bits_12_6),
		.io_tensor_rd_0_data_bits_12_7(tensorLoad_io_tensor_rd_0_data_bits_12_7),
		.io_tensor_rd_0_data_bits_12_8(tensorLoad_io_tensor_rd_0_data_bits_12_8),
		.io_tensor_rd_0_data_bits_12_9(tensorLoad_io_tensor_rd_0_data_bits_12_9),
		.io_tensor_rd_0_data_bits_12_10(tensorLoad_io_tensor_rd_0_data_bits_12_10),
		.io_tensor_rd_0_data_bits_12_11(tensorLoad_io_tensor_rd_0_data_bits_12_11),
		.io_tensor_rd_0_data_bits_12_12(tensorLoad_io_tensor_rd_0_data_bits_12_12),
		.io_tensor_rd_0_data_bits_12_13(tensorLoad_io_tensor_rd_0_data_bits_12_13),
		.io_tensor_rd_0_data_bits_12_14(tensorLoad_io_tensor_rd_0_data_bits_12_14),
		.io_tensor_rd_0_data_bits_12_15(tensorLoad_io_tensor_rd_0_data_bits_12_15),
		.io_tensor_rd_0_data_bits_13_0(tensorLoad_io_tensor_rd_0_data_bits_13_0),
		.io_tensor_rd_0_data_bits_13_1(tensorLoad_io_tensor_rd_0_data_bits_13_1),
		.io_tensor_rd_0_data_bits_13_2(tensorLoad_io_tensor_rd_0_data_bits_13_2),
		.io_tensor_rd_0_data_bits_13_3(tensorLoad_io_tensor_rd_0_data_bits_13_3),
		.io_tensor_rd_0_data_bits_13_4(tensorLoad_io_tensor_rd_0_data_bits_13_4),
		.io_tensor_rd_0_data_bits_13_5(tensorLoad_io_tensor_rd_0_data_bits_13_5),
		.io_tensor_rd_0_data_bits_13_6(tensorLoad_io_tensor_rd_0_data_bits_13_6),
		.io_tensor_rd_0_data_bits_13_7(tensorLoad_io_tensor_rd_0_data_bits_13_7),
		.io_tensor_rd_0_data_bits_13_8(tensorLoad_io_tensor_rd_0_data_bits_13_8),
		.io_tensor_rd_0_data_bits_13_9(tensorLoad_io_tensor_rd_0_data_bits_13_9),
		.io_tensor_rd_0_data_bits_13_10(tensorLoad_io_tensor_rd_0_data_bits_13_10),
		.io_tensor_rd_0_data_bits_13_11(tensorLoad_io_tensor_rd_0_data_bits_13_11),
		.io_tensor_rd_0_data_bits_13_12(tensorLoad_io_tensor_rd_0_data_bits_13_12),
		.io_tensor_rd_0_data_bits_13_13(tensorLoad_io_tensor_rd_0_data_bits_13_13),
		.io_tensor_rd_0_data_bits_13_14(tensorLoad_io_tensor_rd_0_data_bits_13_14),
		.io_tensor_rd_0_data_bits_13_15(tensorLoad_io_tensor_rd_0_data_bits_13_15),
		.io_tensor_rd_0_data_bits_14_0(tensorLoad_io_tensor_rd_0_data_bits_14_0),
		.io_tensor_rd_0_data_bits_14_1(tensorLoad_io_tensor_rd_0_data_bits_14_1),
		.io_tensor_rd_0_data_bits_14_2(tensorLoad_io_tensor_rd_0_data_bits_14_2),
		.io_tensor_rd_0_data_bits_14_3(tensorLoad_io_tensor_rd_0_data_bits_14_3),
		.io_tensor_rd_0_data_bits_14_4(tensorLoad_io_tensor_rd_0_data_bits_14_4),
		.io_tensor_rd_0_data_bits_14_5(tensorLoad_io_tensor_rd_0_data_bits_14_5),
		.io_tensor_rd_0_data_bits_14_6(tensorLoad_io_tensor_rd_0_data_bits_14_6),
		.io_tensor_rd_0_data_bits_14_7(tensorLoad_io_tensor_rd_0_data_bits_14_7),
		.io_tensor_rd_0_data_bits_14_8(tensorLoad_io_tensor_rd_0_data_bits_14_8),
		.io_tensor_rd_0_data_bits_14_9(tensorLoad_io_tensor_rd_0_data_bits_14_9),
		.io_tensor_rd_0_data_bits_14_10(tensorLoad_io_tensor_rd_0_data_bits_14_10),
		.io_tensor_rd_0_data_bits_14_11(tensorLoad_io_tensor_rd_0_data_bits_14_11),
		.io_tensor_rd_0_data_bits_14_12(tensorLoad_io_tensor_rd_0_data_bits_14_12),
		.io_tensor_rd_0_data_bits_14_13(tensorLoad_io_tensor_rd_0_data_bits_14_13),
		.io_tensor_rd_0_data_bits_14_14(tensorLoad_io_tensor_rd_0_data_bits_14_14),
		.io_tensor_rd_0_data_bits_14_15(tensorLoad_io_tensor_rd_0_data_bits_14_15),
		.io_tensor_rd_0_data_bits_15_0(tensorLoad_io_tensor_rd_0_data_bits_15_0),
		.io_tensor_rd_0_data_bits_15_1(tensorLoad_io_tensor_rd_0_data_bits_15_1),
		.io_tensor_rd_0_data_bits_15_2(tensorLoad_io_tensor_rd_0_data_bits_15_2),
		.io_tensor_rd_0_data_bits_15_3(tensorLoad_io_tensor_rd_0_data_bits_15_3),
		.io_tensor_rd_0_data_bits_15_4(tensorLoad_io_tensor_rd_0_data_bits_15_4),
		.io_tensor_rd_0_data_bits_15_5(tensorLoad_io_tensor_rd_0_data_bits_15_5),
		.io_tensor_rd_0_data_bits_15_6(tensorLoad_io_tensor_rd_0_data_bits_15_6),
		.io_tensor_rd_0_data_bits_15_7(tensorLoad_io_tensor_rd_0_data_bits_15_7),
		.io_tensor_rd_0_data_bits_15_8(tensorLoad_io_tensor_rd_0_data_bits_15_8),
		.io_tensor_rd_0_data_bits_15_9(tensorLoad_io_tensor_rd_0_data_bits_15_9),
		.io_tensor_rd_0_data_bits_15_10(tensorLoad_io_tensor_rd_0_data_bits_15_10),
		.io_tensor_rd_0_data_bits_15_11(tensorLoad_io_tensor_rd_0_data_bits_15_11),
		.io_tensor_rd_0_data_bits_15_12(tensorLoad_io_tensor_rd_0_data_bits_15_12),
		.io_tensor_rd_0_data_bits_15_13(tensorLoad_io_tensor_rd_0_data_bits_15_13),
		.io_tensor_rd_0_data_bits_15_14(tensorLoad_io_tensor_rd_0_data_bits_15_14),
		.io_tensor_rd_0_data_bits_15_15(tensorLoad_io_tensor_rd_0_data_bits_15_15)
	);
	assign io_done = tensorLoad_io_done;
	assign io_vme_rd_cmd_valid = tensorLoad_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = tensorLoad_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = tensorLoad_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = tensorLoad_io_vme_rd_cmd_bits_tag;
	assign io_tensor_rd_0_data_valid = tensorLoad_io_tensor_rd_0_data_valid;
	assign io_tensor_rd_0_data_bits_0_0 = tensorLoad_io_tensor_rd_0_data_bits_0_0;
	assign io_tensor_rd_0_data_bits_0_1 = tensorLoad_io_tensor_rd_0_data_bits_0_1;
	assign io_tensor_rd_0_data_bits_0_2 = tensorLoad_io_tensor_rd_0_data_bits_0_2;
	assign io_tensor_rd_0_data_bits_0_3 = tensorLoad_io_tensor_rd_0_data_bits_0_3;
	assign io_tensor_rd_0_data_bits_0_4 = tensorLoad_io_tensor_rd_0_data_bits_0_4;
	assign io_tensor_rd_0_data_bits_0_5 = tensorLoad_io_tensor_rd_0_data_bits_0_5;
	assign io_tensor_rd_0_data_bits_0_6 = tensorLoad_io_tensor_rd_0_data_bits_0_6;
	assign io_tensor_rd_0_data_bits_0_7 = tensorLoad_io_tensor_rd_0_data_bits_0_7;
	assign io_tensor_rd_0_data_bits_0_8 = tensorLoad_io_tensor_rd_0_data_bits_0_8;
	assign io_tensor_rd_0_data_bits_0_9 = tensorLoad_io_tensor_rd_0_data_bits_0_9;
	assign io_tensor_rd_0_data_bits_0_10 = tensorLoad_io_tensor_rd_0_data_bits_0_10;
	assign io_tensor_rd_0_data_bits_0_11 = tensorLoad_io_tensor_rd_0_data_bits_0_11;
	assign io_tensor_rd_0_data_bits_0_12 = tensorLoad_io_tensor_rd_0_data_bits_0_12;
	assign io_tensor_rd_0_data_bits_0_13 = tensorLoad_io_tensor_rd_0_data_bits_0_13;
	assign io_tensor_rd_0_data_bits_0_14 = tensorLoad_io_tensor_rd_0_data_bits_0_14;
	assign io_tensor_rd_0_data_bits_0_15 = tensorLoad_io_tensor_rd_0_data_bits_0_15;
	assign io_tensor_rd_0_data_bits_1_0 = tensorLoad_io_tensor_rd_0_data_bits_1_0;
	assign io_tensor_rd_0_data_bits_1_1 = tensorLoad_io_tensor_rd_0_data_bits_1_1;
	assign io_tensor_rd_0_data_bits_1_2 = tensorLoad_io_tensor_rd_0_data_bits_1_2;
	assign io_tensor_rd_0_data_bits_1_3 = tensorLoad_io_tensor_rd_0_data_bits_1_3;
	assign io_tensor_rd_0_data_bits_1_4 = tensorLoad_io_tensor_rd_0_data_bits_1_4;
	assign io_tensor_rd_0_data_bits_1_5 = tensorLoad_io_tensor_rd_0_data_bits_1_5;
	assign io_tensor_rd_0_data_bits_1_6 = tensorLoad_io_tensor_rd_0_data_bits_1_6;
	assign io_tensor_rd_0_data_bits_1_7 = tensorLoad_io_tensor_rd_0_data_bits_1_7;
	assign io_tensor_rd_0_data_bits_1_8 = tensorLoad_io_tensor_rd_0_data_bits_1_8;
	assign io_tensor_rd_0_data_bits_1_9 = tensorLoad_io_tensor_rd_0_data_bits_1_9;
	assign io_tensor_rd_0_data_bits_1_10 = tensorLoad_io_tensor_rd_0_data_bits_1_10;
	assign io_tensor_rd_0_data_bits_1_11 = tensorLoad_io_tensor_rd_0_data_bits_1_11;
	assign io_tensor_rd_0_data_bits_1_12 = tensorLoad_io_tensor_rd_0_data_bits_1_12;
	assign io_tensor_rd_0_data_bits_1_13 = tensorLoad_io_tensor_rd_0_data_bits_1_13;
	assign io_tensor_rd_0_data_bits_1_14 = tensorLoad_io_tensor_rd_0_data_bits_1_14;
	assign io_tensor_rd_0_data_bits_1_15 = tensorLoad_io_tensor_rd_0_data_bits_1_15;
	assign io_tensor_rd_0_data_bits_2_0 = tensorLoad_io_tensor_rd_0_data_bits_2_0;
	assign io_tensor_rd_0_data_bits_2_1 = tensorLoad_io_tensor_rd_0_data_bits_2_1;
	assign io_tensor_rd_0_data_bits_2_2 = tensorLoad_io_tensor_rd_0_data_bits_2_2;
	assign io_tensor_rd_0_data_bits_2_3 = tensorLoad_io_tensor_rd_0_data_bits_2_3;
	assign io_tensor_rd_0_data_bits_2_4 = tensorLoad_io_tensor_rd_0_data_bits_2_4;
	assign io_tensor_rd_0_data_bits_2_5 = tensorLoad_io_tensor_rd_0_data_bits_2_5;
	assign io_tensor_rd_0_data_bits_2_6 = tensorLoad_io_tensor_rd_0_data_bits_2_6;
	assign io_tensor_rd_0_data_bits_2_7 = tensorLoad_io_tensor_rd_0_data_bits_2_7;
	assign io_tensor_rd_0_data_bits_2_8 = tensorLoad_io_tensor_rd_0_data_bits_2_8;
	assign io_tensor_rd_0_data_bits_2_9 = tensorLoad_io_tensor_rd_0_data_bits_2_9;
	assign io_tensor_rd_0_data_bits_2_10 = tensorLoad_io_tensor_rd_0_data_bits_2_10;
	assign io_tensor_rd_0_data_bits_2_11 = tensorLoad_io_tensor_rd_0_data_bits_2_11;
	assign io_tensor_rd_0_data_bits_2_12 = tensorLoad_io_tensor_rd_0_data_bits_2_12;
	assign io_tensor_rd_0_data_bits_2_13 = tensorLoad_io_tensor_rd_0_data_bits_2_13;
	assign io_tensor_rd_0_data_bits_2_14 = tensorLoad_io_tensor_rd_0_data_bits_2_14;
	assign io_tensor_rd_0_data_bits_2_15 = tensorLoad_io_tensor_rd_0_data_bits_2_15;
	assign io_tensor_rd_0_data_bits_3_0 = tensorLoad_io_tensor_rd_0_data_bits_3_0;
	assign io_tensor_rd_0_data_bits_3_1 = tensorLoad_io_tensor_rd_0_data_bits_3_1;
	assign io_tensor_rd_0_data_bits_3_2 = tensorLoad_io_tensor_rd_0_data_bits_3_2;
	assign io_tensor_rd_0_data_bits_3_3 = tensorLoad_io_tensor_rd_0_data_bits_3_3;
	assign io_tensor_rd_0_data_bits_3_4 = tensorLoad_io_tensor_rd_0_data_bits_3_4;
	assign io_tensor_rd_0_data_bits_3_5 = tensorLoad_io_tensor_rd_0_data_bits_3_5;
	assign io_tensor_rd_0_data_bits_3_6 = tensorLoad_io_tensor_rd_0_data_bits_3_6;
	assign io_tensor_rd_0_data_bits_3_7 = tensorLoad_io_tensor_rd_0_data_bits_3_7;
	assign io_tensor_rd_0_data_bits_3_8 = tensorLoad_io_tensor_rd_0_data_bits_3_8;
	assign io_tensor_rd_0_data_bits_3_9 = tensorLoad_io_tensor_rd_0_data_bits_3_9;
	assign io_tensor_rd_0_data_bits_3_10 = tensorLoad_io_tensor_rd_0_data_bits_3_10;
	assign io_tensor_rd_0_data_bits_3_11 = tensorLoad_io_tensor_rd_0_data_bits_3_11;
	assign io_tensor_rd_0_data_bits_3_12 = tensorLoad_io_tensor_rd_0_data_bits_3_12;
	assign io_tensor_rd_0_data_bits_3_13 = tensorLoad_io_tensor_rd_0_data_bits_3_13;
	assign io_tensor_rd_0_data_bits_3_14 = tensorLoad_io_tensor_rd_0_data_bits_3_14;
	assign io_tensor_rd_0_data_bits_3_15 = tensorLoad_io_tensor_rd_0_data_bits_3_15;
	assign io_tensor_rd_0_data_bits_4_0 = tensorLoad_io_tensor_rd_0_data_bits_4_0;
	assign io_tensor_rd_0_data_bits_4_1 = tensorLoad_io_tensor_rd_0_data_bits_4_1;
	assign io_tensor_rd_0_data_bits_4_2 = tensorLoad_io_tensor_rd_0_data_bits_4_2;
	assign io_tensor_rd_0_data_bits_4_3 = tensorLoad_io_tensor_rd_0_data_bits_4_3;
	assign io_tensor_rd_0_data_bits_4_4 = tensorLoad_io_tensor_rd_0_data_bits_4_4;
	assign io_tensor_rd_0_data_bits_4_5 = tensorLoad_io_tensor_rd_0_data_bits_4_5;
	assign io_tensor_rd_0_data_bits_4_6 = tensorLoad_io_tensor_rd_0_data_bits_4_6;
	assign io_tensor_rd_0_data_bits_4_7 = tensorLoad_io_tensor_rd_0_data_bits_4_7;
	assign io_tensor_rd_0_data_bits_4_8 = tensorLoad_io_tensor_rd_0_data_bits_4_8;
	assign io_tensor_rd_0_data_bits_4_9 = tensorLoad_io_tensor_rd_0_data_bits_4_9;
	assign io_tensor_rd_0_data_bits_4_10 = tensorLoad_io_tensor_rd_0_data_bits_4_10;
	assign io_tensor_rd_0_data_bits_4_11 = tensorLoad_io_tensor_rd_0_data_bits_4_11;
	assign io_tensor_rd_0_data_bits_4_12 = tensorLoad_io_tensor_rd_0_data_bits_4_12;
	assign io_tensor_rd_0_data_bits_4_13 = tensorLoad_io_tensor_rd_0_data_bits_4_13;
	assign io_tensor_rd_0_data_bits_4_14 = tensorLoad_io_tensor_rd_0_data_bits_4_14;
	assign io_tensor_rd_0_data_bits_4_15 = tensorLoad_io_tensor_rd_0_data_bits_4_15;
	assign io_tensor_rd_0_data_bits_5_0 = tensorLoad_io_tensor_rd_0_data_bits_5_0;
	assign io_tensor_rd_0_data_bits_5_1 = tensorLoad_io_tensor_rd_0_data_bits_5_1;
	assign io_tensor_rd_0_data_bits_5_2 = tensorLoad_io_tensor_rd_0_data_bits_5_2;
	assign io_tensor_rd_0_data_bits_5_3 = tensorLoad_io_tensor_rd_0_data_bits_5_3;
	assign io_tensor_rd_0_data_bits_5_4 = tensorLoad_io_tensor_rd_0_data_bits_5_4;
	assign io_tensor_rd_0_data_bits_5_5 = tensorLoad_io_tensor_rd_0_data_bits_5_5;
	assign io_tensor_rd_0_data_bits_5_6 = tensorLoad_io_tensor_rd_0_data_bits_5_6;
	assign io_tensor_rd_0_data_bits_5_7 = tensorLoad_io_tensor_rd_0_data_bits_5_7;
	assign io_tensor_rd_0_data_bits_5_8 = tensorLoad_io_tensor_rd_0_data_bits_5_8;
	assign io_tensor_rd_0_data_bits_5_9 = tensorLoad_io_tensor_rd_0_data_bits_5_9;
	assign io_tensor_rd_0_data_bits_5_10 = tensorLoad_io_tensor_rd_0_data_bits_5_10;
	assign io_tensor_rd_0_data_bits_5_11 = tensorLoad_io_tensor_rd_0_data_bits_5_11;
	assign io_tensor_rd_0_data_bits_5_12 = tensorLoad_io_tensor_rd_0_data_bits_5_12;
	assign io_tensor_rd_0_data_bits_5_13 = tensorLoad_io_tensor_rd_0_data_bits_5_13;
	assign io_tensor_rd_0_data_bits_5_14 = tensorLoad_io_tensor_rd_0_data_bits_5_14;
	assign io_tensor_rd_0_data_bits_5_15 = tensorLoad_io_tensor_rd_0_data_bits_5_15;
	assign io_tensor_rd_0_data_bits_6_0 = tensorLoad_io_tensor_rd_0_data_bits_6_0;
	assign io_tensor_rd_0_data_bits_6_1 = tensorLoad_io_tensor_rd_0_data_bits_6_1;
	assign io_tensor_rd_0_data_bits_6_2 = tensorLoad_io_tensor_rd_0_data_bits_6_2;
	assign io_tensor_rd_0_data_bits_6_3 = tensorLoad_io_tensor_rd_0_data_bits_6_3;
	assign io_tensor_rd_0_data_bits_6_4 = tensorLoad_io_tensor_rd_0_data_bits_6_4;
	assign io_tensor_rd_0_data_bits_6_5 = tensorLoad_io_tensor_rd_0_data_bits_6_5;
	assign io_tensor_rd_0_data_bits_6_6 = tensorLoad_io_tensor_rd_0_data_bits_6_6;
	assign io_tensor_rd_0_data_bits_6_7 = tensorLoad_io_tensor_rd_0_data_bits_6_7;
	assign io_tensor_rd_0_data_bits_6_8 = tensorLoad_io_tensor_rd_0_data_bits_6_8;
	assign io_tensor_rd_0_data_bits_6_9 = tensorLoad_io_tensor_rd_0_data_bits_6_9;
	assign io_tensor_rd_0_data_bits_6_10 = tensorLoad_io_tensor_rd_0_data_bits_6_10;
	assign io_tensor_rd_0_data_bits_6_11 = tensorLoad_io_tensor_rd_0_data_bits_6_11;
	assign io_tensor_rd_0_data_bits_6_12 = tensorLoad_io_tensor_rd_0_data_bits_6_12;
	assign io_tensor_rd_0_data_bits_6_13 = tensorLoad_io_tensor_rd_0_data_bits_6_13;
	assign io_tensor_rd_0_data_bits_6_14 = tensorLoad_io_tensor_rd_0_data_bits_6_14;
	assign io_tensor_rd_0_data_bits_6_15 = tensorLoad_io_tensor_rd_0_data_bits_6_15;
	assign io_tensor_rd_0_data_bits_7_0 = tensorLoad_io_tensor_rd_0_data_bits_7_0;
	assign io_tensor_rd_0_data_bits_7_1 = tensorLoad_io_tensor_rd_0_data_bits_7_1;
	assign io_tensor_rd_0_data_bits_7_2 = tensorLoad_io_tensor_rd_0_data_bits_7_2;
	assign io_tensor_rd_0_data_bits_7_3 = tensorLoad_io_tensor_rd_0_data_bits_7_3;
	assign io_tensor_rd_0_data_bits_7_4 = tensorLoad_io_tensor_rd_0_data_bits_7_4;
	assign io_tensor_rd_0_data_bits_7_5 = tensorLoad_io_tensor_rd_0_data_bits_7_5;
	assign io_tensor_rd_0_data_bits_7_6 = tensorLoad_io_tensor_rd_0_data_bits_7_6;
	assign io_tensor_rd_0_data_bits_7_7 = tensorLoad_io_tensor_rd_0_data_bits_7_7;
	assign io_tensor_rd_0_data_bits_7_8 = tensorLoad_io_tensor_rd_0_data_bits_7_8;
	assign io_tensor_rd_0_data_bits_7_9 = tensorLoad_io_tensor_rd_0_data_bits_7_9;
	assign io_tensor_rd_0_data_bits_7_10 = tensorLoad_io_tensor_rd_0_data_bits_7_10;
	assign io_tensor_rd_0_data_bits_7_11 = tensorLoad_io_tensor_rd_0_data_bits_7_11;
	assign io_tensor_rd_0_data_bits_7_12 = tensorLoad_io_tensor_rd_0_data_bits_7_12;
	assign io_tensor_rd_0_data_bits_7_13 = tensorLoad_io_tensor_rd_0_data_bits_7_13;
	assign io_tensor_rd_0_data_bits_7_14 = tensorLoad_io_tensor_rd_0_data_bits_7_14;
	assign io_tensor_rd_0_data_bits_7_15 = tensorLoad_io_tensor_rd_0_data_bits_7_15;
	assign io_tensor_rd_0_data_bits_8_0 = tensorLoad_io_tensor_rd_0_data_bits_8_0;
	assign io_tensor_rd_0_data_bits_8_1 = tensorLoad_io_tensor_rd_0_data_bits_8_1;
	assign io_tensor_rd_0_data_bits_8_2 = tensorLoad_io_tensor_rd_0_data_bits_8_2;
	assign io_tensor_rd_0_data_bits_8_3 = tensorLoad_io_tensor_rd_0_data_bits_8_3;
	assign io_tensor_rd_0_data_bits_8_4 = tensorLoad_io_tensor_rd_0_data_bits_8_4;
	assign io_tensor_rd_0_data_bits_8_5 = tensorLoad_io_tensor_rd_0_data_bits_8_5;
	assign io_tensor_rd_0_data_bits_8_6 = tensorLoad_io_tensor_rd_0_data_bits_8_6;
	assign io_tensor_rd_0_data_bits_8_7 = tensorLoad_io_tensor_rd_0_data_bits_8_7;
	assign io_tensor_rd_0_data_bits_8_8 = tensorLoad_io_tensor_rd_0_data_bits_8_8;
	assign io_tensor_rd_0_data_bits_8_9 = tensorLoad_io_tensor_rd_0_data_bits_8_9;
	assign io_tensor_rd_0_data_bits_8_10 = tensorLoad_io_tensor_rd_0_data_bits_8_10;
	assign io_tensor_rd_0_data_bits_8_11 = tensorLoad_io_tensor_rd_0_data_bits_8_11;
	assign io_tensor_rd_0_data_bits_8_12 = tensorLoad_io_tensor_rd_0_data_bits_8_12;
	assign io_tensor_rd_0_data_bits_8_13 = tensorLoad_io_tensor_rd_0_data_bits_8_13;
	assign io_tensor_rd_0_data_bits_8_14 = tensorLoad_io_tensor_rd_0_data_bits_8_14;
	assign io_tensor_rd_0_data_bits_8_15 = tensorLoad_io_tensor_rd_0_data_bits_8_15;
	assign io_tensor_rd_0_data_bits_9_0 = tensorLoad_io_tensor_rd_0_data_bits_9_0;
	assign io_tensor_rd_0_data_bits_9_1 = tensorLoad_io_tensor_rd_0_data_bits_9_1;
	assign io_tensor_rd_0_data_bits_9_2 = tensorLoad_io_tensor_rd_0_data_bits_9_2;
	assign io_tensor_rd_0_data_bits_9_3 = tensorLoad_io_tensor_rd_0_data_bits_9_3;
	assign io_tensor_rd_0_data_bits_9_4 = tensorLoad_io_tensor_rd_0_data_bits_9_4;
	assign io_tensor_rd_0_data_bits_9_5 = tensorLoad_io_tensor_rd_0_data_bits_9_5;
	assign io_tensor_rd_0_data_bits_9_6 = tensorLoad_io_tensor_rd_0_data_bits_9_6;
	assign io_tensor_rd_0_data_bits_9_7 = tensorLoad_io_tensor_rd_0_data_bits_9_7;
	assign io_tensor_rd_0_data_bits_9_8 = tensorLoad_io_tensor_rd_0_data_bits_9_8;
	assign io_tensor_rd_0_data_bits_9_9 = tensorLoad_io_tensor_rd_0_data_bits_9_9;
	assign io_tensor_rd_0_data_bits_9_10 = tensorLoad_io_tensor_rd_0_data_bits_9_10;
	assign io_tensor_rd_0_data_bits_9_11 = tensorLoad_io_tensor_rd_0_data_bits_9_11;
	assign io_tensor_rd_0_data_bits_9_12 = tensorLoad_io_tensor_rd_0_data_bits_9_12;
	assign io_tensor_rd_0_data_bits_9_13 = tensorLoad_io_tensor_rd_0_data_bits_9_13;
	assign io_tensor_rd_0_data_bits_9_14 = tensorLoad_io_tensor_rd_0_data_bits_9_14;
	assign io_tensor_rd_0_data_bits_9_15 = tensorLoad_io_tensor_rd_0_data_bits_9_15;
	assign io_tensor_rd_0_data_bits_10_0 = tensorLoad_io_tensor_rd_0_data_bits_10_0;
	assign io_tensor_rd_0_data_bits_10_1 = tensorLoad_io_tensor_rd_0_data_bits_10_1;
	assign io_tensor_rd_0_data_bits_10_2 = tensorLoad_io_tensor_rd_0_data_bits_10_2;
	assign io_tensor_rd_0_data_bits_10_3 = tensorLoad_io_tensor_rd_0_data_bits_10_3;
	assign io_tensor_rd_0_data_bits_10_4 = tensorLoad_io_tensor_rd_0_data_bits_10_4;
	assign io_tensor_rd_0_data_bits_10_5 = tensorLoad_io_tensor_rd_0_data_bits_10_5;
	assign io_tensor_rd_0_data_bits_10_6 = tensorLoad_io_tensor_rd_0_data_bits_10_6;
	assign io_tensor_rd_0_data_bits_10_7 = tensorLoad_io_tensor_rd_0_data_bits_10_7;
	assign io_tensor_rd_0_data_bits_10_8 = tensorLoad_io_tensor_rd_0_data_bits_10_8;
	assign io_tensor_rd_0_data_bits_10_9 = tensorLoad_io_tensor_rd_0_data_bits_10_9;
	assign io_tensor_rd_0_data_bits_10_10 = tensorLoad_io_tensor_rd_0_data_bits_10_10;
	assign io_tensor_rd_0_data_bits_10_11 = tensorLoad_io_tensor_rd_0_data_bits_10_11;
	assign io_tensor_rd_0_data_bits_10_12 = tensorLoad_io_tensor_rd_0_data_bits_10_12;
	assign io_tensor_rd_0_data_bits_10_13 = tensorLoad_io_tensor_rd_0_data_bits_10_13;
	assign io_tensor_rd_0_data_bits_10_14 = tensorLoad_io_tensor_rd_0_data_bits_10_14;
	assign io_tensor_rd_0_data_bits_10_15 = tensorLoad_io_tensor_rd_0_data_bits_10_15;
	assign io_tensor_rd_0_data_bits_11_0 = tensorLoad_io_tensor_rd_0_data_bits_11_0;
	assign io_tensor_rd_0_data_bits_11_1 = tensorLoad_io_tensor_rd_0_data_bits_11_1;
	assign io_tensor_rd_0_data_bits_11_2 = tensorLoad_io_tensor_rd_0_data_bits_11_2;
	assign io_tensor_rd_0_data_bits_11_3 = tensorLoad_io_tensor_rd_0_data_bits_11_3;
	assign io_tensor_rd_0_data_bits_11_4 = tensorLoad_io_tensor_rd_0_data_bits_11_4;
	assign io_tensor_rd_0_data_bits_11_5 = tensorLoad_io_tensor_rd_0_data_bits_11_5;
	assign io_tensor_rd_0_data_bits_11_6 = tensorLoad_io_tensor_rd_0_data_bits_11_6;
	assign io_tensor_rd_0_data_bits_11_7 = tensorLoad_io_tensor_rd_0_data_bits_11_7;
	assign io_tensor_rd_0_data_bits_11_8 = tensorLoad_io_tensor_rd_0_data_bits_11_8;
	assign io_tensor_rd_0_data_bits_11_9 = tensorLoad_io_tensor_rd_0_data_bits_11_9;
	assign io_tensor_rd_0_data_bits_11_10 = tensorLoad_io_tensor_rd_0_data_bits_11_10;
	assign io_tensor_rd_0_data_bits_11_11 = tensorLoad_io_tensor_rd_0_data_bits_11_11;
	assign io_tensor_rd_0_data_bits_11_12 = tensorLoad_io_tensor_rd_0_data_bits_11_12;
	assign io_tensor_rd_0_data_bits_11_13 = tensorLoad_io_tensor_rd_0_data_bits_11_13;
	assign io_tensor_rd_0_data_bits_11_14 = tensorLoad_io_tensor_rd_0_data_bits_11_14;
	assign io_tensor_rd_0_data_bits_11_15 = tensorLoad_io_tensor_rd_0_data_bits_11_15;
	assign io_tensor_rd_0_data_bits_12_0 = tensorLoad_io_tensor_rd_0_data_bits_12_0;
	assign io_tensor_rd_0_data_bits_12_1 = tensorLoad_io_tensor_rd_0_data_bits_12_1;
	assign io_tensor_rd_0_data_bits_12_2 = tensorLoad_io_tensor_rd_0_data_bits_12_2;
	assign io_tensor_rd_0_data_bits_12_3 = tensorLoad_io_tensor_rd_0_data_bits_12_3;
	assign io_tensor_rd_0_data_bits_12_4 = tensorLoad_io_tensor_rd_0_data_bits_12_4;
	assign io_tensor_rd_0_data_bits_12_5 = tensorLoad_io_tensor_rd_0_data_bits_12_5;
	assign io_tensor_rd_0_data_bits_12_6 = tensorLoad_io_tensor_rd_0_data_bits_12_6;
	assign io_tensor_rd_0_data_bits_12_7 = tensorLoad_io_tensor_rd_0_data_bits_12_7;
	assign io_tensor_rd_0_data_bits_12_8 = tensorLoad_io_tensor_rd_0_data_bits_12_8;
	assign io_tensor_rd_0_data_bits_12_9 = tensorLoad_io_tensor_rd_0_data_bits_12_9;
	assign io_tensor_rd_0_data_bits_12_10 = tensorLoad_io_tensor_rd_0_data_bits_12_10;
	assign io_tensor_rd_0_data_bits_12_11 = tensorLoad_io_tensor_rd_0_data_bits_12_11;
	assign io_tensor_rd_0_data_bits_12_12 = tensorLoad_io_tensor_rd_0_data_bits_12_12;
	assign io_tensor_rd_0_data_bits_12_13 = tensorLoad_io_tensor_rd_0_data_bits_12_13;
	assign io_tensor_rd_0_data_bits_12_14 = tensorLoad_io_tensor_rd_0_data_bits_12_14;
	assign io_tensor_rd_0_data_bits_12_15 = tensorLoad_io_tensor_rd_0_data_bits_12_15;
	assign io_tensor_rd_0_data_bits_13_0 = tensorLoad_io_tensor_rd_0_data_bits_13_0;
	assign io_tensor_rd_0_data_bits_13_1 = tensorLoad_io_tensor_rd_0_data_bits_13_1;
	assign io_tensor_rd_0_data_bits_13_2 = tensorLoad_io_tensor_rd_0_data_bits_13_2;
	assign io_tensor_rd_0_data_bits_13_3 = tensorLoad_io_tensor_rd_0_data_bits_13_3;
	assign io_tensor_rd_0_data_bits_13_4 = tensorLoad_io_tensor_rd_0_data_bits_13_4;
	assign io_tensor_rd_0_data_bits_13_5 = tensorLoad_io_tensor_rd_0_data_bits_13_5;
	assign io_tensor_rd_0_data_bits_13_6 = tensorLoad_io_tensor_rd_0_data_bits_13_6;
	assign io_tensor_rd_0_data_bits_13_7 = tensorLoad_io_tensor_rd_0_data_bits_13_7;
	assign io_tensor_rd_0_data_bits_13_8 = tensorLoad_io_tensor_rd_0_data_bits_13_8;
	assign io_tensor_rd_0_data_bits_13_9 = tensorLoad_io_tensor_rd_0_data_bits_13_9;
	assign io_tensor_rd_0_data_bits_13_10 = tensorLoad_io_tensor_rd_0_data_bits_13_10;
	assign io_tensor_rd_0_data_bits_13_11 = tensorLoad_io_tensor_rd_0_data_bits_13_11;
	assign io_tensor_rd_0_data_bits_13_12 = tensorLoad_io_tensor_rd_0_data_bits_13_12;
	assign io_tensor_rd_0_data_bits_13_13 = tensorLoad_io_tensor_rd_0_data_bits_13_13;
	assign io_tensor_rd_0_data_bits_13_14 = tensorLoad_io_tensor_rd_0_data_bits_13_14;
	assign io_tensor_rd_0_data_bits_13_15 = tensorLoad_io_tensor_rd_0_data_bits_13_15;
	assign io_tensor_rd_0_data_bits_14_0 = tensorLoad_io_tensor_rd_0_data_bits_14_0;
	assign io_tensor_rd_0_data_bits_14_1 = tensorLoad_io_tensor_rd_0_data_bits_14_1;
	assign io_tensor_rd_0_data_bits_14_2 = tensorLoad_io_tensor_rd_0_data_bits_14_2;
	assign io_tensor_rd_0_data_bits_14_3 = tensorLoad_io_tensor_rd_0_data_bits_14_3;
	assign io_tensor_rd_0_data_bits_14_4 = tensorLoad_io_tensor_rd_0_data_bits_14_4;
	assign io_tensor_rd_0_data_bits_14_5 = tensorLoad_io_tensor_rd_0_data_bits_14_5;
	assign io_tensor_rd_0_data_bits_14_6 = tensorLoad_io_tensor_rd_0_data_bits_14_6;
	assign io_tensor_rd_0_data_bits_14_7 = tensorLoad_io_tensor_rd_0_data_bits_14_7;
	assign io_tensor_rd_0_data_bits_14_8 = tensorLoad_io_tensor_rd_0_data_bits_14_8;
	assign io_tensor_rd_0_data_bits_14_9 = tensorLoad_io_tensor_rd_0_data_bits_14_9;
	assign io_tensor_rd_0_data_bits_14_10 = tensorLoad_io_tensor_rd_0_data_bits_14_10;
	assign io_tensor_rd_0_data_bits_14_11 = tensorLoad_io_tensor_rd_0_data_bits_14_11;
	assign io_tensor_rd_0_data_bits_14_12 = tensorLoad_io_tensor_rd_0_data_bits_14_12;
	assign io_tensor_rd_0_data_bits_14_13 = tensorLoad_io_tensor_rd_0_data_bits_14_13;
	assign io_tensor_rd_0_data_bits_14_14 = tensorLoad_io_tensor_rd_0_data_bits_14_14;
	assign io_tensor_rd_0_data_bits_14_15 = tensorLoad_io_tensor_rd_0_data_bits_14_15;
	assign io_tensor_rd_0_data_bits_15_0 = tensorLoad_io_tensor_rd_0_data_bits_15_0;
	assign io_tensor_rd_0_data_bits_15_1 = tensorLoad_io_tensor_rd_0_data_bits_15_1;
	assign io_tensor_rd_0_data_bits_15_2 = tensorLoad_io_tensor_rd_0_data_bits_15_2;
	assign io_tensor_rd_0_data_bits_15_3 = tensorLoad_io_tensor_rd_0_data_bits_15_3;
	assign io_tensor_rd_0_data_bits_15_4 = tensorLoad_io_tensor_rd_0_data_bits_15_4;
	assign io_tensor_rd_0_data_bits_15_5 = tensorLoad_io_tensor_rd_0_data_bits_15_5;
	assign io_tensor_rd_0_data_bits_15_6 = tensorLoad_io_tensor_rd_0_data_bits_15_6;
	assign io_tensor_rd_0_data_bits_15_7 = tensorLoad_io_tensor_rd_0_data_bits_15_7;
	assign io_tensor_rd_0_data_bits_15_8 = tensorLoad_io_tensor_rd_0_data_bits_15_8;
	assign io_tensor_rd_0_data_bits_15_9 = tensorLoad_io_tensor_rd_0_data_bits_15_9;
	assign io_tensor_rd_0_data_bits_15_10 = tensorLoad_io_tensor_rd_0_data_bits_15_10;
	assign io_tensor_rd_0_data_bits_15_11 = tensorLoad_io_tensor_rd_0_data_bits_15_11;
	assign io_tensor_rd_0_data_bits_15_12 = tensorLoad_io_tensor_rd_0_data_bits_15_12;
	assign io_tensor_rd_0_data_bits_15_13 = tensorLoad_io_tensor_rd_0_data_bits_15_13;
	assign io_tensor_rd_0_data_bits_15_14 = tensorLoad_io_tensor_rd_0_data_bits_15_14;
	assign io_tensor_rd_0_data_bits_15_15 = tensorLoad_io_tensor_rd_0_data_bits_15_15;
	assign tensorLoad_clock = clk;
	assign tensorLoad_reset = rst;
	assign tensorLoad_io_start = io_start;
	assign tensorLoad_io_inst = io_inst;
	assign tensorLoad_io_baddr = io_baddr;
	assign tensorLoad_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign tensorLoad_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign tensorLoad_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign tensorLoad_io_vme_rd_data_bits_tag = io_vme_rd_data_bits_tag;
	assign tensorLoad_io_tensor_rd_0_idx_valid = io_tensor_rd_0_idx_valid;
	assign tensorLoad_io_tensor_rd_0_idx_bits = io_tensor_rd_0_idx_bits;
endmodule
module Load (
	clk,
	rst,
	io_i_post,
	io_o_post,
	io_inst_ready,
	io_inst_valid,
	io_inst_bits,
	io_inp_baddr,
	io_wgt_baddr,
	io_vme_rd_0_cmd_ready,
	io_vme_rd_0_cmd_valid,
	io_vme_rd_0_cmd_bits_addr,
	io_vme_rd_0_cmd_bits_len,
	io_vme_rd_0_cmd_bits_tag,
	io_vme_rd_0_data_valid,
	io_vme_rd_0_data_bits_data,
	io_vme_rd_0_data_bits_tag,
	io_vme_rd_1_cmd_ready,
	io_vme_rd_1_cmd_valid,
	io_vme_rd_1_cmd_bits_addr,
	io_vme_rd_1_cmd_bits_len,
	io_vme_rd_1_cmd_bits_tag,
	io_vme_rd_1_data_valid,
	io_vme_rd_1_data_bits_data,
	io_vme_rd_1_data_bits_tag,
	io_inp_rd_0_idx_valid,
	io_inp_rd_0_idx_bits,
	io_inp_rd_0_data_valid,
	io_inp_rd_0_data_bits_0_0,
	io_inp_rd_0_data_bits_0_1,
	io_inp_rd_0_data_bits_0_2,
	io_inp_rd_0_data_bits_0_3,
	io_inp_rd_0_data_bits_0_4,
	io_inp_rd_0_data_bits_0_5,
	io_inp_rd_0_data_bits_0_6,
	io_inp_rd_0_data_bits_0_7,
	io_inp_rd_0_data_bits_0_8,
	io_inp_rd_0_data_bits_0_9,
	io_inp_rd_0_data_bits_0_10,
	io_inp_rd_0_data_bits_0_11,
	io_inp_rd_0_data_bits_0_12,
	io_inp_rd_0_data_bits_0_13,
	io_inp_rd_0_data_bits_0_14,
	io_inp_rd_0_data_bits_0_15,
	io_wgt_rd_0_idx_valid,
	io_wgt_rd_0_idx_bits,
	io_wgt_rd_0_data_valid,
	io_wgt_rd_0_data_bits_0_0,
	io_wgt_rd_0_data_bits_0_1,
	io_wgt_rd_0_data_bits_0_2,
	io_wgt_rd_0_data_bits_0_3,
	io_wgt_rd_0_data_bits_0_4,
	io_wgt_rd_0_data_bits_0_5,
	io_wgt_rd_0_data_bits_0_6,
	io_wgt_rd_0_data_bits_0_7,
	io_wgt_rd_0_data_bits_0_8,
	io_wgt_rd_0_data_bits_0_9,
	io_wgt_rd_0_data_bits_0_10,
	io_wgt_rd_0_data_bits_0_11,
	io_wgt_rd_0_data_bits_0_12,
	io_wgt_rd_0_data_bits_0_13,
	io_wgt_rd_0_data_bits_0_14,
	io_wgt_rd_0_data_bits_0_15,
	io_wgt_rd_0_data_bits_1_0,
	io_wgt_rd_0_data_bits_1_1,
	io_wgt_rd_0_data_bits_1_2,
	io_wgt_rd_0_data_bits_1_3,
	io_wgt_rd_0_data_bits_1_4,
	io_wgt_rd_0_data_bits_1_5,
	io_wgt_rd_0_data_bits_1_6,
	io_wgt_rd_0_data_bits_1_7,
	io_wgt_rd_0_data_bits_1_8,
	io_wgt_rd_0_data_bits_1_9,
	io_wgt_rd_0_data_bits_1_10,
	io_wgt_rd_0_data_bits_1_11,
	io_wgt_rd_0_data_bits_1_12,
	io_wgt_rd_0_data_bits_1_13,
	io_wgt_rd_0_data_bits_1_14,
	io_wgt_rd_0_data_bits_1_15,
	io_wgt_rd_0_data_bits_2_0,
	io_wgt_rd_0_data_bits_2_1,
	io_wgt_rd_0_data_bits_2_2,
	io_wgt_rd_0_data_bits_2_3,
	io_wgt_rd_0_data_bits_2_4,
	io_wgt_rd_0_data_bits_2_5,
	io_wgt_rd_0_data_bits_2_6,
	io_wgt_rd_0_data_bits_2_7,
	io_wgt_rd_0_data_bits_2_8,
	io_wgt_rd_0_data_bits_2_9,
	io_wgt_rd_0_data_bits_2_10,
	io_wgt_rd_0_data_bits_2_11,
	io_wgt_rd_0_data_bits_2_12,
	io_wgt_rd_0_data_bits_2_13,
	io_wgt_rd_0_data_bits_2_14,
	io_wgt_rd_0_data_bits_2_15,
	io_wgt_rd_0_data_bits_3_0,
	io_wgt_rd_0_data_bits_3_1,
	io_wgt_rd_0_data_bits_3_2,
	io_wgt_rd_0_data_bits_3_3,
	io_wgt_rd_0_data_bits_3_4,
	io_wgt_rd_0_data_bits_3_5,
	io_wgt_rd_0_data_bits_3_6,
	io_wgt_rd_0_data_bits_3_7,
	io_wgt_rd_0_data_bits_3_8,
	io_wgt_rd_0_data_bits_3_9,
	io_wgt_rd_0_data_bits_3_10,
	io_wgt_rd_0_data_bits_3_11,
	io_wgt_rd_0_data_bits_3_12,
	io_wgt_rd_0_data_bits_3_13,
	io_wgt_rd_0_data_bits_3_14,
	io_wgt_rd_0_data_bits_3_15,
	io_wgt_rd_0_data_bits_4_0,
	io_wgt_rd_0_data_bits_4_1,
	io_wgt_rd_0_data_bits_4_2,
	io_wgt_rd_0_data_bits_4_3,
	io_wgt_rd_0_data_bits_4_4,
	io_wgt_rd_0_data_bits_4_5,
	io_wgt_rd_0_data_bits_4_6,
	io_wgt_rd_0_data_bits_4_7,
	io_wgt_rd_0_data_bits_4_8,
	io_wgt_rd_0_data_bits_4_9,
	io_wgt_rd_0_data_bits_4_10,
	io_wgt_rd_0_data_bits_4_11,
	io_wgt_rd_0_data_bits_4_12,
	io_wgt_rd_0_data_bits_4_13,
	io_wgt_rd_0_data_bits_4_14,
	io_wgt_rd_0_data_bits_4_15,
	io_wgt_rd_0_data_bits_5_0,
	io_wgt_rd_0_data_bits_5_1,
	io_wgt_rd_0_data_bits_5_2,
	io_wgt_rd_0_data_bits_5_3,
	io_wgt_rd_0_data_bits_5_4,
	io_wgt_rd_0_data_bits_5_5,
	io_wgt_rd_0_data_bits_5_6,
	io_wgt_rd_0_data_bits_5_7,
	io_wgt_rd_0_data_bits_5_8,
	io_wgt_rd_0_data_bits_5_9,
	io_wgt_rd_0_data_bits_5_10,
	io_wgt_rd_0_data_bits_5_11,
	io_wgt_rd_0_data_bits_5_12,
	io_wgt_rd_0_data_bits_5_13,
	io_wgt_rd_0_data_bits_5_14,
	io_wgt_rd_0_data_bits_5_15,
	io_wgt_rd_0_data_bits_6_0,
	io_wgt_rd_0_data_bits_6_1,
	io_wgt_rd_0_data_bits_6_2,
	io_wgt_rd_0_data_bits_6_3,
	io_wgt_rd_0_data_bits_6_4,
	io_wgt_rd_0_data_bits_6_5,
	io_wgt_rd_0_data_bits_6_6,
	io_wgt_rd_0_data_bits_6_7,
	io_wgt_rd_0_data_bits_6_8,
	io_wgt_rd_0_data_bits_6_9,
	io_wgt_rd_0_data_bits_6_10,
	io_wgt_rd_0_data_bits_6_11,
	io_wgt_rd_0_data_bits_6_12,
	io_wgt_rd_0_data_bits_6_13,
	io_wgt_rd_0_data_bits_6_14,
	io_wgt_rd_0_data_bits_6_15,
	io_wgt_rd_0_data_bits_7_0,
	io_wgt_rd_0_data_bits_7_1,
	io_wgt_rd_0_data_bits_7_2,
	io_wgt_rd_0_data_bits_7_3,
	io_wgt_rd_0_data_bits_7_4,
	io_wgt_rd_0_data_bits_7_5,
	io_wgt_rd_0_data_bits_7_6,
	io_wgt_rd_0_data_bits_7_7,
	io_wgt_rd_0_data_bits_7_8,
	io_wgt_rd_0_data_bits_7_9,
	io_wgt_rd_0_data_bits_7_10,
	io_wgt_rd_0_data_bits_7_11,
	io_wgt_rd_0_data_bits_7_12,
	io_wgt_rd_0_data_bits_7_13,
	io_wgt_rd_0_data_bits_7_14,
	io_wgt_rd_0_data_bits_7_15,
	io_wgt_rd_0_data_bits_8_0,
	io_wgt_rd_0_data_bits_8_1,
	io_wgt_rd_0_data_bits_8_2,
	io_wgt_rd_0_data_bits_8_3,
	io_wgt_rd_0_data_bits_8_4,
	io_wgt_rd_0_data_bits_8_5,
	io_wgt_rd_0_data_bits_8_6,
	io_wgt_rd_0_data_bits_8_7,
	io_wgt_rd_0_data_bits_8_8,
	io_wgt_rd_0_data_bits_8_9,
	io_wgt_rd_0_data_bits_8_10,
	io_wgt_rd_0_data_bits_8_11,
	io_wgt_rd_0_data_bits_8_12,
	io_wgt_rd_0_data_bits_8_13,
	io_wgt_rd_0_data_bits_8_14,
	io_wgt_rd_0_data_bits_8_15,
	io_wgt_rd_0_data_bits_9_0,
	io_wgt_rd_0_data_bits_9_1,
	io_wgt_rd_0_data_bits_9_2,
	io_wgt_rd_0_data_bits_9_3,
	io_wgt_rd_0_data_bits_9_4,
	io_wgt_rd_0_data_bits_9_5,
	io_wgt_rd_0_data_bits_9_6,
	io_wgt_rd_0_data_bits_9_7,
	io_wgt_rd_0_data_bits_9_8,
	io_wgt_rd_0_data_bits_9_9,
	io_wgt_rd_0_data_bits_9_10,
	io_wgt_rd_0_data_bits_9_11,
	io_wgt_rd_0_data_bits_9_12,
	io_wgt_rd_0_data_bits_9_13,
	io_wgt_rd_0_data_bits_9_14,
	io_wgt_rd_0_data_bits_9_15,
	io_wgt_rd_0_data_bits_10_0,
	io_wgt_rd_0_data_bits_10_1,
	io_wgt_rd_0_data_bits_10_2,
	io_wgt_rd_0_data_bits_10_3,
	io_wgt_rd_0_data_bits_10_4,
	io_wgt_rd_0_data_bits_10_5,
	io_wgt_rd_0_data_bits_10_6,
	io_wgt_rd_0_data_bits_10_7,
	io_wgt_rd_0_data_bits_10_8,
	io_wgt_rd_0_data_bits_10_9,
	io_wgt_rd_0_data_bits_10_10,
	io_wgt_rd_0_data_bits_10_11,
	io_wgt_rd_0_data_bits_10_12,
	io_wgt_rd_0_data_bits_10_13,
	io_wgt_rd_0_data_bits_10_14,
	io_wgt_rd_0_data_bits_10_15,
	io_wgt_rd_0_data_bits_11_0,
	io_wgt_rd_0_data_bits_11_1,
	io_wgt_rd_0_data_bits_11_2,
	io_wgt_rd_0_data_bits_11_3,
	io_wgt_rd_0_data_bits_11_4,
	io_wgt_rd_0_data_bits_11_5,
	io_wgt_rd_0_data_bits_11_6,
	io_wgt_rd_0_data_bits_11_7,
	io_wgt_rd_0_data_bits_11_8,
	io_wgt_rd_0_data_bits_11_9,
	io_wgt_rd_0_data_bits_11_10,
	io_wgt_rd_0_data_bits_11_11,
	io_wgt_rd_0_data_bits_11_12,
	io_wgt_rd_0_data_bits_11_13,
	io_wgt_rd_0_data_bits_11_14,
	io_wgt_rd_0_data_bits_11_15,
	io_wgt_rd_0_data_bits_12_0,
	io_wgt_rd_0_data_bits_12_1,
	io_wgt_rd_0_data_bits_12_2,
	io_wgt_rd_0_data_bits_12_3,
	io_wgt_rd_0_data_bits_12_4,
	io_wgt_rd_0_data_bits_12_5,
	io_wgt_rd_0_data_bits_12_6,
	io_wgt_rd_0_data_bits_12_7,
	io_wgt_rd_0_data_bits_12_8,
	io_wgt_rd_0_data_bits_12_9,
	io_wgt_rd_0_data_bits_12_10,
	io_wgt_rd_0_data_bits_12_11,
	io_wgt_rd_0_data_bits_12_12,
	io_wgt_rd_0_data_bits_12_13,
	io_wgt_rd_0_data_bits_12_14,
	io_wgt_rd_0_data_bits_12_15,
	io_wgt_rd_0_data_bits_13_0,
	io_wgt_rd_0_data_bits_13_1,
	io_wgt_rd_0_data_bits_13_2,
	io_wgt_rd_0_data_bits_13_3,
	io_wgt_rd_0_data_bits_13_4,
	io_wgt_rd_0_data_bits_13_5,
	io_wgt_rd_0_data_bits_13_6,
	io_wgt_rd_0_data_bits_13_7,
	io_wgt_rd_0_data_bits_13_8,
	io_wgt_rd_0_data_bits_13_9,
	io_wgt_rd_0_data_bits_13_10,
	io_wgt_rd_0_data_bits_13_11,
	io_wgt_rd_0_data_bits_13_12,
	io_wgt_rd_0_data_bits_13_13,
	io_wgt_rd_0_data_bits_13_14,
	io_wgt_rd_0_data_bits_13_15,
	io_wgt_rd_0_data_bits_14_0,
	io_wgt_rd_0_data_bits_14_1,
	io_wgt_rd_0_data_bits_14_2,
	io_wgt_rd_0_data_bits_14_3,
	io_wgt_rd_0_data_bits_14_4,
	io_wgt_rd_0_data_bits_14_5,
	io_wgt_rd_0_data_bits_14_6,
	io_wgt_rd_0_data_bits_14_7,
	io_wgt_rd_0_data_bits_14_8,
	io_wgt_rd_0_data_bits_14_9,
	io_wgt_rd_0_data_bits_14_10,
	io_wgt_rd_0_data_bits_14_11,
	io_wgt_rd_0_data_bits_14_12,
	io_wgt_rd_0_data_bits_14_13,
	io_wgt_rd_0_data_bits_14_14,
	io_wgt_rd_0_data_bits_14_15,
	io_wgt_rd_0_data_bits_15_0,
	io_wgt_rd_0_data_bits_15_1,
	io_wgt_rd_0_data_bits_15_2,
	io_wgt_rd_0_data_bits_15_3,
	io_wgt_rd_0_data_bits_15_4,
	io_wgt_rd_0_data_bits_15_5,
	io_wgt_rd_0_data_bits_15_6,
	io_wgt_rd_0_data_bits_15_7,
	io_wgt_rd_0_data_bits_15_8,
	io_wgt_rd_0_data_bits_15_9,
	io_wgt_rd_0_data_bits_15_10,
	io_wgt_rd_0_data_bits_15_11,
	io_wgt_rd_0_data_bits_15_12,
	io_wgt_rd_0_data_bits_15_13,
	io_wgt_rd_0_data_bits_15_14,
	io_wgt_rd_0_data_bits_15_15
);
	input clk;
	input rst;
	input io_i_post;
	output wire io_o_post;
	output wire io_inst_ready;
	input io_inst_valid;
	input [127:0] io_inst_bits;
	input [63:0] io_inp_baddr;
	input [63:0] io_wgt_baddr;
	input io_vme_rd_0_cmd_ready;
	output wire io_vme_rd_0_cmd_valid;
	output wire [63:0] io_vme_rd_0_cmd_bits_addr;
	output wire [7:0] io_vme_rd_0_cmd_bits_len;
	output wire [20:0] io_vme_rd_0_cmd_bits_tag;
	input io_vme_rd_0_data_valid;
	input [63:0] io_vme_rd_0_data_bits_data;
	input [20:0] io_vme_rd_0_data_bits_tag;
	input io_vme_rd_1_cmd_ready;
	output wire io_vme_rd_1_cmd_valid;
	output wire [63:0] io_vme_rd_1_cmd_bits_addr;
	output wire [7:0] io_vme_rd_1_cmd_bits_len;
	output wire [20:0] io_vme_rd_1_cmd_bits_tag;
	input io_vme_rd_1_data_valid;
	input [63:0] io_vme_rd_1_data_bits_data;
	input [20:0] io_vme_rd_1_data_bits_tag;
	input io_inp_rd_0_idx_valid;
	input [10:0] io_inp_rd_0_idx_bits;
	output wire io_inp_rd_0_data_valid;
	output wire [7:0] io_inp_rd_0_data_bits_0_0;
	output wire [7:0] io_inp_rd_0_data_bits_0_1;
	output wire [7:0] io_inp_rd_0_data_bits_0_2;
	output wire [7:0] io_inp_rd_0_data_bits_0_3;
	output wire [7:0] io_inp_rd_0_data_bits_0_4;
	output wire [7:0] io_inp_rd_0_data_bits_0_5;
	output wire [7:0] io_inp_rd_0_data_bits_0_6;
	output wire [7:0] io_inp_rd_0_data_bits_0_7;
	output wire [7:0] io_inp_rd_0_data_bits_0_8;
	output wire [7:0] io_inp_rd_0_data_bits_0_9;
	output wire [7:0] io_inp_rd_0_data_bits_0_10;
	output wire [7:0] io_inp_rd_0_data_bits_0_11;
	output wire [7:0] io_inp_rd_0_data_bits_0_12;
	output wire [7:0] io_inp_rd_0_data_bits_0_13;
	output wire [7:0] io_inp_rd_0_data_bits_0_14;
	output wire [7:0] io_inp_rd_0_data_bits_0_15;
	input io_wgt_rd_0_idx_valid;
	input [9:0] io_wgt_rd_0_idx_bits;
	output wire io_wgt_rd_0_data_valid;
	output wire [7:0] io_wgt_rd_0_data_bits_0_0;
	output wire [7:0] io_wgt_rd_0_data_bits_0_1;
	output wire [7:0] io_wgt_rd_0_data_bits_0_2;
	output wire [7:0] io_wgt_rd_0_data_bits_0_3;
	output wire [7:0] io_wgt_rd_0_data_bits_0_4;
	output wire [7:0] io_wgt_rd_0_data_bits_0_5;
	output wire [7:0] io_wgt_rd_0_data_bits_0_6;
	output wire [7:0] io_wgt_rd_0_data_bits_0_7;
	output wire [7:0] io_wgt_rd_0_data_bits_0_8;
	output wire [7:0] io_wgt_rd_0_data_bits_0_9;
	output wire [7:0] io_wgt_rd_0_data_bits_0_10;
	output wire [7:0] io_wgt_rd_0_data_bits_0_11;
	output wire [7:0] io_wgt_rd_0_data_bits_0_12;
	output wire [7:0] io_wgt_rd_0_data_bits_0_13;
	output wire [7:0] io_wgt_rd_0_data_bits_0_14;
	output wire [7:0] io_wgt_rd_0_data_bits_0_15;
	output wire [7:0] io_wgt_rd_0_data_bits_1_0;
	output wire [7:0] io_wgt_rd_0_data_bits_1_1;
	output wire [7:0] io_wgt_rd_0_data_bits_1_2;
	output wire [7:0] io_wgt_rd_0_data_bits_1_3;
	output wire [7:0] io_wgt_rd_0_data_bits_1_4;
	output wire [7:0] io_wgt_rd_0_data_bits_1_5;
	output wire [7:0] io_wgt_rd_0_data_bits_1_6;
	output wire [7:0] io_wgt_rd_0_data_bits_1_7;
	output wire [7:0] io_wgt_rd_0_data_bits_1_8;
	output wire [7:0] io_wgt_rd_0_data_bits_1_9;
	output wire [7:0] io_wgt_rd_0_data_bits_1_10;
	output wire [7:0] io_wgt_rd_0_data_bits_1_11;
	output wire [7:0] io_wgt_rd_0_data_bits_1_12;
	output wire [7:0] io_wgt_rd_0_data_bits_1_13;
	output wire [7:0] io_wgt_rd_0_data_bits_1_14;
	output wire [7:0] io_wgt_rd_0_data_bits_1_15;
	output wire [7:0] io_wgt_rd_0_data_bits_2_0;
	output wire [7:0] io_wgt_rd_0_data_bits_2_1;
	output wire [7:0] io_wgt_rd_0_data_bits_2_2;
	output wire [7:0] io_wgt_rd_0_data_bits_2_3;
	output wire [7:0] io_wgt_rd_0_data_bits_2_4;
	output wire [7:0] io_wgt_rd_0_data_bits_2_5;
	output wire [7:0] io_wgt_rd_0_data_bits_2_6;
	output wire [7:0] io_wgt_rd_0_data_bits_2_7;
	output wire [7:0] io_wgt_rd_0_data_bits_2_8;
	output wire [7:0] io_wgt_rd_0_data_bits_2_9;
	output wire [7:0] io_wgt_rd_0_data_bits_2_10;
	output wire [7:0] io_wgt_rd_0_data_bits_2_11;
	output wire [7:0] io_wgt_rd_0_data_bits_2_12;
	output wire [7:0] io_wgt_rd_0_data_bits_2_13;
	output wire [7:0] io_wgt_rd_0_data_bits_2_14;
	output wire [7:0] io_wgt_rd_0_data_bits_2_15;
	output wire [7:0] io_wgt_rd_0_data_bits_3_0;
	output wire [7:0] io_wgt_rd_0_data_bits_3_1;
	output wire [7:0] io_wgt_rd_0_data_bits_3_2;
	output wire [7:0] io_wgt_rd_0_data_bits_3_3;
	output wire [7:0] io_wgt_rd_0_data_bits_3_4;
	output wire [7:0] io_wgt_rd_0_data_bits_3_5;
	output wire [7:0] io_wgt_rd_0_data_bits_3_6;
	output wire [7:0] io_wgt_rd_0_data_bits_3_7;
	output wire [7:0] io_wgt_rd_0_data_bits_3_8;
	output wire [7:0] io_wgt_rd_0_data_bits_3_9;
	output wire [7:0] io_wgt_rd_0_data_bits_3_10;
	output wire [7:0] io_wgt_rd_0_data_bits_3_11;
	output wire [7:0] io_wgt_rd_0_data_bits_3_12;
	output wire [7:0] io_wgt_rd_0_data_bits_3_13;
	output wire [7:0] io_wgt_rd_0_data_bits_3_14;
	output wire [7:0] io_wgt_rd_0_data_bits_3_15;
	output wire [7:0] io_wgt_rd_0_data_bits_4_0;
	output wire [7:0] io_wgt_rd_0_data_bits_4_1;
	output wire [7:0] io_wgt_rd_0_data_bits_4_2;
	output wire [7:0] io_wgt_rd_0_data_bits_4_3;
	output wire [7:0] io_wgt_rd_0_data_bits_4_4;
	output wire [7:0] io_wgt_rd_0_data_bits_4_5;
	output wire [7:0] io_wgt_rd_0_data_bits_4_6;
	output wire [7:0] io_wgt_rd_0_data_bits_4_7;
	output wire [7:0] io_wgt_rd_0_data_bits_4_8;
	output wire [7:0] io_wgt_rd_0_data_bits_4_9;
	output wire [7:0] io_wgt_rd_0_data_bits_4_10;
	output wire [7:0] io_wgt_rd_0_data_bits_4_11;
	output wire [7:0] io_wgt_rd_0_data_bits_4_12;
	output wire [7:0] io_wgt_rd_0_data_bits_4_13;
	output wire [7:0] io_wgt_rd_0_data_bits_4_14;
	output wire [7:0] io_wgt_rd_0_data_bits_4_15;
	output wire [7:0] io_wgt_rd_0_data_bits_5_0;
	output wire [7:0] io_wgt_rd_0_data_bits_5_1;
	output wire [7:0] io_wgt_rd_0_data_bits_5_2;
	output wire [7:0] io_wgt_rd_0_data_bits_5_3;
	output wire [7:0] io_wgt_rd_0_data_bits_5_4;
	output wire [7:0] io_wgt_rd_0_data_bits_5_5;
	output wire [7:0] io_wgt_rd_0_data_bits_5_6;
	output wire [7:0] io_wgt_rd_0_data_bits_5_7;
	output wire [7:0] io_wgt_rd_0_data_bits_5_8;
	output wire [7:0] io_wgt_rd_0_data_bits_5_9;
	output wire [7:0] io_wgt_rd_0_data_bits_5_10;
	output wire [7:0] io_wgt_rd_0_data_bits_5_11;
	output wire [7:0] io_wgt_rd_0_data_bits_5_12;
	output wire [7:0] io_wgt_rd_0_data_bits_5_13;
	output wire [7:0] io_wgt_rd_0_data_bits_5_14;
	output wire [7:0] io_wgt_rd_0_data_bits_5_15;
	output wire [7:0] io_wgt_rd_0_data_bits_6_0;
	output wire [7:0] io_wgt_rd_0_data_bits_6_1;
	output wire [7:0] io_wgt_rd_0_data_bits_6_2;
	output wire [7:0] io_wgt_rd_0_data_bits_6_3;
	output wire [7:0] io_wgt_rd_0_data_bits_6_4;
	output wire [7:0] io_wgt_rd_0_data_bits_6_5;
	output wire [7:0] io_wgt_rd_0_data_bits_6_6;
	output wire [7:0] io_wgt_rd_0_data_bits_6_7;
	output wire [7:0] io_wgt_rd_0_data_bits_6_8;
	output wire [7:0] io_wgt_rd_0_data_bits_6_9;
	output wire [7:0] io_wgt_rd_0_data_bits_6_10;
	output wire [7:0] io_wgt_rd_0_data_bits_6_11;
	output wire [7:0] io_wgt_rd_0_data_bits_6_12;
	output wire [7:0] io_wgt_rd_0_data_bits_6_13;
	output wire [7:0] io_wgt_rd_0_data_bits_6_14;
	output wire [7:0] io_wgt_rd_0_data_bits_6_15;
	output wire [7:0] io_wgt_rd_0_data_bits_7_0;
	output wire [7:0] io_wgt_rd_0_data_bits_7_1;
	output wire [7:0] io_wgt_rd_0_data_bits_7_2;
	output wire [7:0] io_wgt_rd_0_data_bits_7_3;
	output wire [7:0] io_wgt_rd_0_data_bits_7_4;
	output wire [7:0] io_wgt_rd_0_data_bits_7_5;
	output wire [7:0] io_wgt_rd_0_data_bits_7_6;
	output wire [7:0] io_wgt_rd_0_data_bits_7_7;
	output wire [7:0] io_wgt_rd_0_data_bits_7_8;
	output wire [7:0] io_wgt_rd_0_data_bits_7_9;
	output wire [7:0] io_wgt_rd_0_data_bits_7_10;
	output wire [7:0] io_wgt_rd_0_data_bits_7_11;
	output wire [7:0] io_wgt_rd_0_data_bits_7_12;
	output wire [7:0] io_wgt_rd_0_data_bits_7_13;
	output wire [7:0] io_wgt_rd_0_data_bits_7_14;
	output wire [7:0] io_wgt_rd_0_data_bits_7_15;
	output wire [7:0] io_wgt_rd_0_data_bits_8_0;
	output wire [7:0] io_wgt_rd_0_data_bits_8_1;
	output wire [7:0] io_wgt_rd_0_data_bits_8_2;
	output wire [7:0] io_wgt_rd_0_data_bits_8_3;
	output wire [7:0] io_wgt_rd_0_data_bits_8_4;
	output wire [7:0] io_wgt_rd_0_data_bits_8_5;
	output wire [7:0] io_wgt_rd_0_data_bits_8_6;
	output wire [7:0] io_wgt_rd_0_data_bits_8_7;
	output wire [7:0] io_wgt_rd_0_data_bits_8_8;
	output wire [7:0] io_wgt_rd_0_data_bits_8_9;
	output wire [7:0] io_wgt_rd_0_data_bits_8_10;
	output wire [7:0] io_wgt_rd_0_data_bits_8_11;
	output wire [7:0] io_wgt_rd_0_data_bits_8_12;
	output wire [7:0] io_wgt_rd_0_data_bits_8_13;
	output wire [7:0] io_wgt_rd_0_data_bits_8_14;
	output wire [7:0] io_wgt_rd_0_data_bits_8_15;
	output wire [7:0] io_wgt_rd_0_data_bits_9_0;
	output wire [7:0] io_wgt_rd_0_data_bits_9_1;
	output wire [7:0] io_wgt_rd_0_data_bits_9_2;
	output wire [7:0] io_wgt_rd_0_data_bits_9_3;
	output wire [7:0] io_wgt_rd_0_data_bits_9_4;
	output wire [7:0] io_wgt_rd_0_data_bits_9_5;
	output wire [7:0] io_wgt_rd_0_data_bits_9_6;
	output wire [7:0] io_wgt_rd_0_data_bits_9_7;
	output wire [7:0] io_wgt_rd_0_data_bits_9_8;
	output wire [7:0] io_wgt_rd_0_data_bits_9_9;
	output wire [7:0] io_wgt_rd_0_data_bits_9_10;
	output wire [7:0] io_wgt_rd_0_data_bits_9_11;
	output wire [7:0] io_wgt_rd_0_data_bits_9_12;
	output wire [7:0] io_wgt_rd_0_data_bits_9_13;
	output wire [7:0] io_wgt_rd_0_data_bits_9_14;
	output wire [7:0] io_wgt_rd_0_data_bits_9_15;
	output wire [7:0] io_wgt_rd_0_data_bits_10_0;
	output wire [7:0] io_wgt_rd_0_data_bits_10_1;
	output wire [7:0] io_wgt_rd_0_data_bits_10_2;
	output wire [7:0] io_wgt_rd_0_data_bits_10_3;
	output wire [7:0] io_wgt_rd_0_data_bits_10_4;
	output wire [7:0] io_wgt_rd_0_data_bits_10_5;
	output wire [7:0] io_wgt_rd_0_data_bits_10_6;
	output wire [7:0] io_wgt_rd_0_data_bits_10_7;
	output wire [7:0] io_wgt_rd_0_data_bits_10_8;
	output wire [7:0] io_wgt_rd_0_data_bits_10_9;
	output wire [7:0] io_wgt_rd_0_data_bits_10_10;
	output wire [7:0] io_wgt_rd_0_data_bits_10_11;
	output wire [7:0] io_wgt_rd_0_data_bits_10_12;
	output wire [7:0] io_wgt_rd_0_data_bits_10_13;
	output wire [7:0] io_wgt_rd_0_data_bits_10_14;
	output wire [7:0] io_wgt_rd_0_data_bits_10_15;
	output wire [7:0] io_wgt_rd_0_data_bits_11_0;
	output wire [7:0] io_wgt_rd_0_data_bits_11_1;
	output wire [7:0] io_wgt_rd_0_data_bits_11_2;
	output wire [7:0] io_wgt_rd_0_data_bits_11_3;
	output wire [7:0] io_wgt_rd_0_data_bits_11_4;
	output wire [7:0] io_wgt_rd_0_data_bits_11_5;
	output wire [7:0] io_wgt_rd_0_data_bits_11_6;
	output wire [7:0] io_wgt_rd_0_data_bits_11_7;
	output wire [7:0] io_wgt_rd_0_data_bits_11_8;
	output wire [7:0] io_wgt_rd_0_data_bits_11_9;
	output wire [7:0] io_wgt_rd_0_data_bits_11_10;
	output wire [7:0] io_wgt_rd_0_data_bits_11_11;
	output wire [7:0] io_wgt_rd_0_data_bits_11_12;
	output wire [7:0] io_wgt_rd_0_data_bits_11_13;
	output wire [7:0] io_wgt_rd_0_data_bits_11_14;
	output wire [7:0] io_wgt_rd_0_data_bits_11_15;
	output wire [7:0] io_wgt_rd_0_data_bits_12_0;
	output wire [7:0] io_wgt_rd_0_data_bits_12_1;
	output wire [7:0] io_wgt_rd_0_data_bits_12_2;
	output wire [7:0] io_wgt_rd_0_data_bits_12_3;
	output wire [7:0] io_wgt_rd_0_data_bits_12_4;
	output wire [7:0] io_wgt_rd_0_data_bits_12_5;
	output wire [7:0] io_wgt_rd_0_data_bits_12_6;
	output wire [7:0] io_wgt_rd_0_data_bits_12_7;
	output wire [7:0] io_wgt_rd_0_data_bits_12_8;
	output wire [7:0] io_wgt_rd_0_data_bits_12_9;
	output wire [7:0] io_wgt_rd_0_data_bits_12_10;
	output wire [7:0] io_wgt_rd_0_data_bits_12_11;
	output wire [7:0] io_wgt_rd_0_data_bits_12_12;
	output wire [7:0] io_wgt_rd_0_data_bits_12_13;
	output wire [7:0] io_wgt_rd_0_data_bits_12_14;
	output wire [7:0] io_wgt_rd_0_data_bits_12_15;
	output wire [7:0] io_wgt_rd_0_data_bits_13_0;
	output wire [7:0] io_wgt_rd_0_data_bits_13_1;
	output wire [7:0] io_wgt_rd_0_data_bits_13_2;
	output wire [7:0] io_wgt_rd_0_data_bits_13_3;
	output wire [7:0] io_wgt_rd_0_data_bits_13_4;
	output wire [7:0] io_wgt_rd_0_data_bits_13_5;
	output wire [7:0] io_wgt_rd_0_data_bits_13_6;
	output wire [7:0] io_wgt_rd_0_data_bits_13_7;
	output wire [7:0] io_wgt_rd_0_data_bits_13_8;
	output wire [7:0] io_wgt_rd_0_data_bits_13_9;
	output wire [7:0] io_wgt_rd_0_data_bits_13_10;
	output wire [7:0] io_wgt_rd_0_data_bits_13_11;
	output wire [7:0] io_wgt_rd_0_data_bits_13_12;
	output wire [7:0] io_wgt_rd_0_data_bits_13_13;
	output wire [7:0] io_wgt_rd_0_data_bits_13_14;
	output wire [7:0] io_wgt_rd_0_data_bits_13_15;
	output wire [7:0] io_wgt_rd_0_data_bits_14_0;
	output wire [7:0] io_wgt_rd_0_data_bits_14_1;
	output wire [7:0] io_wgt_rd_0_data_bits_14_2;
	output wire [7:0] io_wgt_rd_0_data_bits_14_3;
	output wire [7:0] io_wgt_rd_0_data_bits_14_4;
	output wire [7:0] io_wgt_rd_0_data_bits_14_5;
	output wire [7:0] io_wgt_rd_0_data_bits_14_6;
	output wire [7:0] io_wgt_rd_0_data_bits_14_7;
	output wire [7:0] io_wgt_rd_0_data_bits_14_8;
	output wire [7:0] io_wgt_rd_0_data_bits_14_9;
	output wire [7:0] io_wgt_rd_0_data_bits_14_10;
	output wire [7:0] io_wgt_rd_0_data_bits_14_11;
	output wire [7:0] io_wgt_rd_0_data_bits_14_12;
	output wire [7:0] io_wgt_rd_0_data_bits_14_13;
	output wire [7:0] io_wgt_rd_0_data_bits_14_14;
	output wire [7:0] io_wgt_rd_0_data_bits_14_15;
	output wire [7:0] io_wgt_rd_0_data_bits_15_0;
	output wire [7:0] io_wgt_rd_0_data_bits_15_1;
	output wire [7:0] io_wgt_rd_0_data_bits_15_2;
	output wire [7:0] io_wgt_rd_0_data_bits_15_3;
	output wire [7:0] io_wgt_rd_0_data_bits_15_4;
	output wire [7:0] io_wgt_rd_0_data_bits_15_5;
	output wire [7:0] io_wgt_rd_0_data_bits_15_6;
	output wire [7:0] io_wgt_rd_0_data_bits_15_7;
	output wire [7:0] io_wgt_rd_0_data_bits_15_8;
	output wire [7:0] io_wgt_rd_0_data_bits_15_9;
	output wire [7:0] io_wgt_rd_0_data_bits_15_10;
	output wire [7:0] io_wgt_rd_0_data_bits_15_11;
	output wire [7:0] io_wgt_rd_0_data_bits_15_12;
	output wire [7:0] io_wgt_rd_0_data_bits_15_13;
	output wire [7:0] io_wgt_rd_0_data_bits_15_14;
	output wire [7:0] io_wgt_rd_0_data_bits_15_15;
	wire s_clock;
	wire s_reset;
	wire s_io_spost;
	wire s_io_swait;
	wire s_io_sready;
	wire inst_q_clock;
	wire inst_q_reset;
	wire inst_q_io_enq_ready;
	wire inst_q_io_enq_valid;
	wire [127:0] inst_q_io_enq_bits;
	wire inst_q_io_deq_ready;
	wire inst_q_io_deq_valid;
	wire [127:0] inst_q_io_deq_bits;
	wire [127:0] dec_io_inst;
	wire dec_io_push_next;
	wire dec_io_pop_next;
	wire dec_io_isInput;
	wire dec_io_isWeight;
	wire dec_io_isSync;
	wire tensorLoad_0_clock;
	wire tensorLoad_0_reset;
	wire tensorLoad_0_io_start;
	wire tensorLoad_0_io_done;
	wire [127:0] tensorLoad_0_io_inst;
	wire [63:0] tensorLoad_0_io_baddr;
	wire tensorLoad_0_io_vme_rd_cmd_ready;
	wire tensorLoad_0_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_0_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_0_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_0_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_0_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_0_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_0_io_vme_rd_data_bits_tag;
	wire tensorLoad_0_io_tensor_rd_0_idx_valid;
	wire [10:0] tensorLoad_0_io_tensor_rd_0_idx_bits;
	wire tensorLoad_0_io_tensor_rd_0_data_valid;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_0;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_1;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_2;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_3;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_4;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_5;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_6;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_7;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_8;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_9;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_10;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_11;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_12;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_13;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_14;
	wire [7:0] tensorLoad_0_io_tensor_rd_0_data_bits_0_15;
	wire tensorLoad_1_clock;
	wire tensorLoad_1_reset;
	wire tensorLoad_1_io_start;
	wire tensorLoad_1_io_done;
	wire [127:0] tensorLoad_1_io_inst;
	wire [63:0] tensorLoad_1_io_baddr;
	wire tensorLoad_1_io_vme_rd_cmd_ready;
	wire tensorLoad_1_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_1_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_1_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_1_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_1_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_1_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_1_io_vme_rd_data_bits_tag;
	wire tensorLoad_1_io_tensor_rd_0_idx_valid;
	wire [9:0] tensorLoad_1_io_tensor_rd_0_idx_bits;
	wire tensorLoad_1_io_tensor_rd_0_data_valid;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_0_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_1_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_2_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_3_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_4_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_5_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_6_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_7_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_8_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_9_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_10_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_11_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_12_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_13_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_14_15;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_0;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_1;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_2;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_3;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_4;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_5;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_6;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_7;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_8;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_9;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_10;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_11;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_12;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_13;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_14;
	wire [7:0] tensorLoad_1_io_tensor_rd_0_data_bits_15_15;
	reg [1:0] state;
	wire _start_T = (dec_io_pop_next ? s_io_sready : 1'h1);
	wire start = inst_q_io_deq_valid & _start_T;
	wire done = (dec_io_isInput ? tensorLoad_0_io_done : tensorLoad_1_io_done);
	wire [1:0] _GEN_0 = (dec_io_isInput | dec_io_isWeight ? 2'h2 : state);
	wire [1:0] _GEN_3 = (done ? 2'h0 : state);
	wire _inst_q_io_deq_ready_T_3 = ((state == 2'h2) & done) | (state == 2'h1);
	wire _tensorLoad_0_io_start_T_1 = (state == 2'h0) & start;
	Semaphore s(
		.clk(s_clock),
		.rst(s_reset),
		.io_spost(s_io_spost),
		.io_swait(s_io_swait),
		.io_sready(s_io_sready)
	);
	Queue_6 inst_q(
		.clk(inst_q_clock),
		.rst(inst_q_reset),
		.io_enq_ready(inst_q_io_enq_ready),
		.io_enq_valid(inst_q_io_enq_valid),
		.io_enq_bits(inst_q_io_enq_bits),
		.io_deq_ready(inst_q_io_deq_ready),
		.io_deq_valid(inst_q_io_deq_valid),
		.io_deq_bits(inst_q_io_deq_bits)
	);
	LoadDecode dec(
		.io_inst(dec_io_inst),
		.io_push_next(dec_io_push_next),
		.io_pop_next(dec_io_pop_next),
		.io_isInput(dec_io_isInput),
		.io_isWeight(dec_io_isWeight),
		.io_isSync(dec_io_isSync)
	);
	TensorLoadInp tensorLoad_0(
		.clk(tensorLoad_0_clock),
		.rst(tensorLoad_0_reset),
		.io_start(tensorLoad_0_io_start),
		.io_done(tensorLoad_0_io_done),
		.io_inst(tensorLoad_0_io_inst),
		.io_baddr(tensorLoad_0_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_0_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_0_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_0_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_0_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_0_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_valid(tensorLoad_0_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_0_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_0_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorLoad_0_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_0_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_0_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_0_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorLoad_0_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorLoad_0_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorLoad_0_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorLoad_0_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorLoad_0_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorLoad_0_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorLoad_0_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorLoad_0_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorLoad_0_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorLoad_0_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorLoad_0_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorLoad_0_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorLoad_0_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorLoad_0_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorLoad_0_io_tensor_rd_0_data_bits_0_15)
	);
	TensorLoadWgt tensorLoad_1(
		.clk(tensorLoad_1_clock),
		.rst(tensorLoad_1_reset),
		.io_start(tensorLoad_1_io_start),
		.io_done(tensorLoad_1_io_done),
		.io_inst(tensorLoad_1_io_inst),
		.io_baddr(tensorLoad_1_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_1_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_1_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_1_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_1_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_1_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_valid(tensorLoad_1_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_1_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_1_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorLoad_1_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_1_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_1_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_1_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorLoad_1_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorLoad_1_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorLoad_1_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorLoad_1_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorLoad_1_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorLoad_1_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorLoad_1_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorLoad_1_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorLoad_1_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorLoad_1_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorLoad_1_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorLoad_1_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorLoad_1_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorLoad_1_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorLoad_1_io_tensor_rd_0_data_bits_0_15),
		.io_tensor_rd_0_data_bits_1_0(tensorLoad_1_io_tensor_rd_0_data_bits_1_0),
		.io_tensor_rd_0_data_bits_1_1(tensorLoad_1_io_tensor_rd_0_data_bits_1_1),
		.io_tensor_rd_0_data_bits_1_2(tensorLoad_1_io_tensor_rd_0_data_bits_1_2),
		.io_tensor_rd_0_data_bits_1_3(tensorLoad_1_io_tensor_rd_0_data_bits_1_3),
		.io_tensor_rd_0_data_bits_1_4(tensorLoad_1_io_tensor_rd_0_data_bits_1_4),
		.io_tensor_rd_0_data_bits_1_5(tensorLoad_1_io_tensor_rd_0_data_bits_1_5),
		.io_tensor_rd_0_data_bits_1_6(tensorLoad_1_io_tensor_rd_0_data_bits_1_6),
		.io_tensor_rd_0_data_bits_1_7(tensorLoad_1_io_tensor_rd_0_data_bits_1_7),
		.io_tensor_rd_0_data_bits_1_8(tensorLoad_1_io_tensor_rd_0_data_bits_1_8),
		.io_tensor_rd_0_data_bits_1_9(tensorLoad_1_io_tensor_rd_0_data_bits_1_9),
		.io_tensor_rd_0_data_bits_1_10(tensorLoad_1_io_tensor_rd_0_data_bits_1_10),
		.io_tensor_rd_0_data_bits_1_11(tensorLoad_1_io_tensor_rd_0_data_bits_1_11),
		.io_tensor_rd_0_data_bits_1_12(tensorLoad_1_io_tensor_rd_0_data_bits_1_12),
		.io_tensor_rd_0_data_bits_1_13(tensorLoad_1_io_tensor_rd_0_data_bits_1_13),
		.io_tensor_rd_0_data_bits_1_14(tensorLoad_1_io_tensor_rd_0_data_bits_1_14),
		.io_tensor_rd_0_data_bits_1_15(tensorLoad_1_io_tensor_rd_0_data_bits_1_15),
		.io_tensor_rd_0_data_bits_2_0(tensorLoad_1_io_tensor_rd_0_data_bits_2_0),
		.io_tensor_rd_0_data_bits_2_1(tensorLoad_1_io_tensor_rd_0_data_bits_2_1),
		.io_tensor_rd_0_data_bits_2_2(tensorLoad_1_io_tensor_rd_0_data_bits_2_2),
		.io_tensor_rd_0_data_bits_2_3(tensorLoad_1_io_tensor_rd_0_data_bits_2_3),
		.io_tensor_rd_0_data_bits_2_4(tensorLoad_1_io_tensor_rd_0_data_bits_2_4),
		.io_tensor_rd_0_data_bits_2_5(tensorLoad_1_io_tensor_rd_0_data_bits_2_5),
		.io_tensor_rd_0_data_bits_2_6(tensorLoad_1_io_tensor_rd_0_data_bits_2_6),
		.io_tensor_rd_0_data_bits_2_7(tensorLoad_1_io_tensor_rd_0_data_bits_2_7),
		.io_tensor_rd_0_data_bits_2_8(tensorLoad_1_io_tensor_rd_0_data_bits_2_8),
		.io_tensor_rd_0_data_bits_2_9(tensorLoad_1_io_tensor_rd_0_data_bits_2_9),
		.io_tensor_rd_0_data_bits_2_10(tensorLoad_1_io_tensor_rd_0_data_bits_2_10),
		.io_tensor_rd_0_data_bits_2_11(tensorLoad_1_io_tensor_rd_0_data_bits_2_11),
		.io_tensor_rd_0_data_bits_2_12(tensorLoad_1_io_tensor_rd_0_data_bits_2_12),
		.io_tensor_rd_0_data_bits_2_13(tensorLoad_1_io_tensor_rd_0_data_bits_2_13),
		.io_tensor_rd_0_data_bits_2_14(tensorLoad_1_io_tensor_rd_0_data_bits_2_14),
		.io_tensor_rd_0_data_bits_2_15(tensorLoad_1_io_tensor_rd_0_data_bits_2_15),
		.io_tensor_rd_0_data_bits_3_0(tensorLoad_1_io_tensor_rd_0_data_bits_3_0),
		.io_tensor_rd_0_data_bits_3_1(tensorLoad_1_io_tensor_rd_0_data_bits_3_1),
		.io_tensor_rd_0_data_bits_3_2(tensorLoad_1_io_tensor_rd_0_data_bits_3_2),
		.io_tensor_rd_0_data_bits_3_3(tensorLoad_1_io_tensor_rd_0_data_bits_3_3),
		.io_tensor_rd_0_data_bits_3_4(tensorLoad_1_io_tensor_rd_0_data_bits_3_4),
		.io_tensor_rd_0_data_bits_3_5(tensorLoad_1_io_tensor_rd_0_data_bits_3_5),
		.io_tensor_rd_0_data_bits_3_6(tensorLoad_1_io_tensor_rd_0_data_bits_3_6),
		.io_tensor_rd_0_data_bits_3_7(tensorLoad_1_io_tensor_rd_0_data_bits_3_7),
		.io_tensor_rd_0_data_bits_3_8(tensorLoad_1_io_tensor_rd_0_data_bits_3_8),
		.io_tensor_rd_0_data_bits_3_9(tensorLoad_1_io_tensor_rd_0_data_bits_3_9),
		.io_tensor_rd_0_data_bits_3_10(tensorLoad_1_io_tensor_rd_0_data_bits_3_10),
		.io_tensor_rd_0_data_bits_3_11(tensorLoad_1_io_tensor_rd_0_data_bits_3_11),
		.io_tensor_rd_0_data_bits_3_12(tensorLoad_1_io_tensor_rd_0_data_bits_3_12),
		.io_tensor_rd_0_data_bits_3_13(tensorLoad_1_io_tensor_rd_0_data_bits_3_13),
		.io_tensor_rd_0_data_bits_3_14(tensorLoad_1_io_tensor_rd_0_data_bits_3_14),
		.io_tensor_rd_0_data_bits_3_15(tensorLoad_1_io_tensor_rd_0_data_bits_3_15),
		.io_tensor_rd_0_data_bits_4_0(tensorLoad_1_io_tensor_rd_0_data_bits_4_0),
		.io_tensor_rd_0_data_bits_4_1(tensorLoad_1_io_tensor_rd_0_data_bits_4_1),
		.io_tensor_rd_0_data_bits_4_2(tensorLoad_1_io_tensor_rd_0_data_bits_4_2),
		.io_tensor_rd_0_data_bits_4_3(tensorLoad_1_io_tensor_rd_0_data_bits_4_3),
		.io_tensor_rd_0_data_bits_4_4(tensorLoad_1_io_tensor_rd_0_data_bits_4_4),
		.io_tensor_rd_0_data_bits_4_5(tensorLoad_1_io_tensor_rd_0_data_bits_4_5),
		.io_tensor_rd_0_data_bits_4_6(tensorLoad_1_io_tensor_rd_0_data_bits_4_6),
		.io_tensor_rd_0_data_bits_4_7(tensorLoad_1_io_tensor_rd_0_data_bits_4_7),
		.io_tensor_rd_0_data_bits_4_8(tensorLoad_1_io_tensor_rd_0_data_bits_4_8),
		.io_tensor_rd_0_data_bits_4_9(tensorLoad_1_io_tensor_rd_0_data_bits_4_9),
		.io_tensor_rd_0_data_bits_4_10(tensorLoad_1_io_tensor_rd_0_data_bits_4_10),
		.io_tensor_rd_0_data_bits_4_11(tensorLoad_1_io_tensor_rd_0_data_bits_4_11),
		.io_tensor_rd_0_data_bits_4_12(tensorLoad_1_io_tensor_rd_0_data_bits_4_12),
		.io_tensor_rd_0_data_bits_4_13(tensorLoad_1_io_tensor_rd_0_data_bits_4_13),
		.io_tensor_rd_0_data_bits_4_14(tensorLoad_1_io_tensor_rd_0_data_bits_4_14),
		.io_tensor_rd_0_data_bits_4_15(tensorLoad_1_io_tensor_rd_0_data_bits_4_15),
		.io_tensor_rd_0_data_bits_5_0(tensorLoad_1_io_tensor_rd_0_data_bits_5_0),
		.io_tensor_rd_0_data_bits_5_1(tensorLoad_1_io_tensor_rd_0_data_bits_5_1),
		.io_tensor_rd_0_data_bits_5_2(tensorLoad_1_io_tensor_rd_0_data_bits_5_2),
		.io_tensor_rd_0_data_bits_5_3(tensorLoad_1_io_tensor_rd_0_data_bits_5_3),
		.io_tensor_rd_0_data_bits_5_4(tensorLoad_1_io_tensor_rd_0_data_bits_5_4),
		.io_tensor_rd_0_data_bits_5_5(tensorLoad_1_io_tensor_rd_0_data_bits_5_5),
		.io_tensor_rd_0_data_bits_5_6(tensorLoad_1_io_tensor_rd_0_data_bits_5_6),
		.io_tensor_rd_0_data_bits_5_7(tensorLoad_1_io_tensor_rd_0_data_bits_5_7),
		.io_tensor_rd_0_data_bits_5_8(tensorLoad_1_io_tensor_rd_0_data_bits_5_8),
		.io_tensor_rd_0_data_bits_5_9(tensorLoad_1_io_tensor_rd_0_data_bits_5_9),
		.io_tensor_rd_0_data_bits_5_10(tensorLoad_1_io_tensor_rd_0_data_bits_5_10),
		.io_tensor_rd_0_data_bits_5_11(tensorLoad_1_io_tensor_rd_0_data_bits_5_11),
		.io_tensor_rd_0_data_bits_5_12(tensorLoad_1_io_tensor_rd_0_data_bits_5_12),
		.io_tensor_rd_0_data_bits_5_13(tensorLoad_1_io_tensor_rd_0_data_bits_5_13),
		.io_tensor_rd_0_data_bits_5_14(tensorLoad_1_io_tensor_rd_0_data_bits_5_14),
		.io_tensor_rd_0_data_bits_5_15(tensorLoad_1_io_tensor_rd_0_data_bits_5_15),
		.io_tensor_rd_0_data_bits_6_0(tensorLoad_1_io_tensor_rd_0_data_bits_6_0),
		.io_tensor_rd_0_data_bits_6_1(tensorLoad_1_io_tensor_rd_0_data_bits_6_1),
		.io_tensor_rd_0_data_bits_6_2(tensorLoad_1_io_tensor_rd_0_data_bits_6_2),
		.io_tensor_rd_0_data_bits_6_3(tensorLoad_1_io_tensor_rd_0_data_bits_6_3),
		.io_tensor_rd_0_data_bits_6_4(tensorLoad_1_io_tensor_rd_0_data_bits_6_4),
		.io_tensor_rd_0_data_bits_6_5(tensorLoad_1_io_tensor_rd_0_data_bits_6_5),
		.io_tensor_rd_0_data_bits_6_6(tensorLoad_1_io_tensor_rd_0_data_bits_6_6),
		.io_tensor_rd_0_data_bits_6_7(tensorLoad_1_io_tensor_rd_0_data_bits_6_7),
		.io_tensor_rd_0_data_bits_6_8(tensorLoad_1_io_tensor_rd_0_data_bits_6_8),
		.io_tensor_rd_0_data_bits_6_9(tensorLoad_1_io_tensor_rd_0_data_bits_6_9),
		.io_tensor_rd_0_data_bits_6_10(tensorLoad_1_io_tensor_rd_0_data_bits_6_10),
		.io_tensor_rd_0_data_bits_6_11(tensorLoad_1_io_tensor_rd_0_data_bits_6_11),
		.io_tensor_rd_0_data_bits_6_12(tensorLoad_1_io_tensor_rd_0_data_bits_6_12),
		.io_tensor_rd_0_data_bits_6_13(tensorLoad_1_io_tensor_rd_0_data_bits_6_13),
		.io_tensor_rd_0_data_bits_6_14(tensorLoad_1_io_tensor_rd_0_data_bits_6_14),
		.io_tensor_rd_0_data_bits_6_15(tensorLoad_1_io_tensor_rd_0_data_bits_6_15),
		.io_tensor_rd_0_data_bits_7_0(tensorLoad_1_io_tensor_rd_0_data_bits_7_0),
		.io_tensor_rd_0_data_bits_7_1(tensorLoad_1_io_tensor_rd_0_data_bits_7_1),
		.io_tensor_rd_0_data_bits_7_2(tensorLoad_1_io_tensor_rd_0_data_bits_7_2),
		.io_tensor_rd_0_data_bits_7_3(tensorLoad_1_io_tensor_rd_0_data_bits_7_3),
		.io_tensor_rd_0_data_bits_7_4(tensorLoad_1_io_tensor_rd_0_data_bits_7_4),
		.io_tensor_rd_0_data_bits_7_5(tensorLoad_1_io_tensor_rd_0_data_bits_7_5),
		.io_tensor_rd_0_data_bits_7_6(tensorLoad_1_io_tensor_rd_0_data_bits_7_6),
		.io_tensor_rd_0_data_bits_7_7(tensorLoad_1_io_tensor_rd_0_data_bits_7_7),
		.io_tensor_rd_0_data_bits_7_8(tensorLoad_1_io_tensor_rd_0_data_bits_7_8),
		.io_tensor_rd_0_data_bits_7_9(tensorLoad_1_io_tensor_rd_0_data_bits_7_9),
		.io_tensor_rd_0_data_bits_7_10(tensorLoad_1_io_tensor_rd_0_data_bits_7_10),
		.io_tensor_rd_0_data_bits_7_11(tensorLoad_1_io_tensor_rd_0_data_bits_7_11),
		.io_tensor_rd_0_data_bits_7_12(tensorLoad_1_io_tensor_rd_0_data_bits_7_12),
		.io_tensor_rd_0_data_bits_7_13(tensorLoad_1_io_tensor_rd_0_data_bits_7_13),
		.io_tensor_rd_0_data_bits_7_14(tensorLoad_1_io_tensor_rd_0_data_bits_7_14),
		.io_tensor_rd_0_data_bits_7_15(tensorLoad_1_io_tensor_rd_0_data_bits_7_15),
		.io_tensor_rd_0_data_bits_8_0(tensorLoad_1_io_tensor_rd_0_data_bits_8_0),
		.io_tensor_rd_0_data_bits_8_1(tensorLoad_1_io_tensor_rd_0_data_bits_8_1),
		.io_tensor_rd_0_data_bits_8_2(tensorLoad_1_io_tensor_rd_0_data_bits_8_2),
		.io_tensor_rd_0_data_bits_8_3(tensorLoad_1_io_tensor_rd_0_data_bits_8_3),
		.io_tensor_rd_0_data_bits_8_4(tensorLoad_1_io_tensor_rd_0_data_bits_8_4),
		.io_tensor_rd_0_data_bits_8_5(tensorLoad_1_io_tensor_rd_0_data_bits_8_5),
		.io_tensor_rd_0_data_bits_8_6(tensorLoad_1_io_tensor_rd_0_data_bits_8_6),
		.io_tensor_rd_0_data_bits_8_7(tensorLoad_1_io_tensor_rd_0_data_bits_8_7),
		.io_tensor_rd_0_data_bits_8_8(tensorLoad_1_io_tensor_rd_0_data_bits_8_8),
		.io_tensor_rd_0_data_bits_8_9(tensorLoad_1_io_tensor_rd_0_data_bits_8_9),
		.io_tensor_rd_0_data_bits_8_10(tensorLoad_1_io_tensor_rd_0_data_bits_8_10),
		.io_tensor_rd_0_data_bits_8_11(tensorLoad_1_io_tensor_rd_0_data_bits_8_11),
		.io_tensor_rd_0_data_bits_8_12(tensorLoad_1_io_tensor_rd_0_data_bits_8_12),
		.io_tensor_rd_0_data_bits_8_13(tensorLoad_1_io_tensor_rd_0_data_bits_8_13),
		.io_tensor_rd_0_data_bits_8_14(tensorLoad_1_io_tensor_rd_0_data_bits_8_14),
		.io_tensor_rd_0_data_bits_8_15(tensorLoad_1_io_tensor_rd_0_data_bits_8_15),
		.io_tensor_rd_0_data_bits_9_0(tensorLoad_1_io_tensor_rd_0_data_bits_9_0),
		.io_tensor_rd_0_data_bits_9_1(tensorLoad_1_io_tensor_rd_0_data_bits_9_1),
		.io_tensor_rd_0_data_bits_9_2(tensorLoad_1_io_tensor_rd_0_data_bits_9_2),
		.io_tensor_rd_0_data_bits_9_3(tensorLoad_1_io_tensor_rd_0_data_bits_9_3),
		.io_tensor_rd_0_data_bits_9_4(tensorLoad_1_io_tensor_rd_0_data_bits_9_4),
		.io_tensor_rd_0_data_bits_9_5(tensorLoad_1_io_tensor_rd_0_data_bits_9_5),
		.io_tensor_rd_0_data_bits_9_6(tensorLoad_1_io_tensor_rd_0_data_bits_9_6),
		.io_tensor_rd_0_data_bits_9_7(tensorLoad_1_io_tensor_rd_0_data_bits_9_7),
		.io_tensor_rd_0_data_bits_9_8(tensorLoad_1_io_tensor_rd_0_data_bits_9_8),
		.io_tensor_rd_0_data_bits_9_9(tensorLoad_1_io_tensor_rd_0_data_bits_9_9),
		.io_tensor_rd_0_data_bits_9_10(tensorLoad_1_io_tensor_rd_0_data_bits_9_10),
		.io_tensor_rd_0_data_bits_9_11(tensorLoad_1_io_tensor_rd_0_data_bits_9_11),
		.io_tensor_rd_0_data_bits_9_12(tensorLoad_1_io_tensor_rd_0_data_bits_9_12),
		.io_tensor_rd_0_data_bits_9_13(tensorLoad_1_io_tensor_rd_0_data_bits_9_13),
		.io_tensor_rd_0_data_bits_9_14(tensorLoad_1_io_tensor_rd_0_data_bits_9_14),
		.io_tensor_rd_0_data_bits_9_15(tensorLoad_1_io_tensor_rd_0_data_bits_9_15),
		.io_tensor_rd_0_data_bits_10_0(tensorLoad_1_io_tensor_rd_0_data_bits_10_0),
		.io_tensor_rd_0_data_bits_10_1(tensorLoad_1_io_tensor_rd_0_data_bits_10_1),
		.io_tensor_rd_0_data_bits_10_2(tensorLoad_1_io_tensor_rd_0_data_bits_10_2),
		.io_tensor_rd_0_data_bits_10_3(tensorLoad_1_io_tensor_rd_0_data_bits_10_3),
		.io_tensor_rd_0_data_bits_10_4(tensorLoad_1_io_tensor_rd_0_data_bits_10_4),
		.io_tensor_rd_0_data_bits_10_5(tensorLoad_1_io_tensor_rd_0_data_bits_10_5),
		.io_tensor_rd_0_data_bits_10_6(tensorLoad_1_io_tensor_rd_0_data_bits_10_6),
		.io_tensor_rd_0_data_bits_10_7(tensorLoad_1_io_tensor_rd_0_data_bits_10_7),
		.io_tensor_rd_0_data_bits_10_8(tensorLoad_1_io_tensor_rd_0_data_bits_10_8),
		.io_tensor_rd_0_data_bits_10_9(tensorLoad_1_io_tensor_rd_0_data_bits_10_9),
		.io_tensor_rd_0_data_bits_10_10(tensorLoad_1_io_tensor_rd_0_data_bits_10_10),
		.io_tensor_rd_0_data_bits_10_11(tensorLoad_1_io_tensor_rd_0_data_bits_10_11),
		.io_tensor_rd_0_data_bits_10_12(tensorLoad_1_io_tensor_rd_0_data_bits_10_12),
		.io_tensor_rd_0_data_bits_10_13(tensorLoad_1_io_tensor_rd_0_data_bits_10_13),
		.io_tensor_rd_0_data_bits_10_14(tensorLoad_1_io_tensor_rd_0_data_bits_10_14),
		.io_tensor_rd_0_data_bits_10_15(tensorLoad_1_io_tensor_rd_0_data_bits_10_15),
		.io_tensor_rd_0_data_bits_11_0(tensorLoad_1_io_tensor_rd_0_data_bits_11_0),
		.io_tensor_rd_0_data_bits_11_1(tensorLoad_1_io_tensor_rd_0_data_bits_11_1),
		.io_tensor_rd_0_data_bits_11_2(tensorLoad_1_io_tensor_rd_0_data_bits_11_2),
		.io_tensor_rd_0_data_bits_11_3(tensorLoad_1_io_tensor_rd_0_data_bits_11_3),
		.io_tensor_rd_0_data_bits_11_4(tensorLoad_1_io_tensor_rd_0_data_bits_11_4),
		.io_tensor_rd_0_data_bits_11_5(tensorLoad_1_io_tensor_rd_0_data_bits_11_5),
		.io_tensor_rd_0_data_bits_11_6(tensorLoad_1_io_tensor_rd_0_data_bits_11_6),
		.io_tensor_rd_0_data_bits_11_7(tensorLoad_1_io_tensor_rd_0_data_bits_11_7),
		.io_tensor_rd_0_data_bits_11_8(tensorLoad_1_io_tensor_rd_0_data_bits_11_8),
		.io_tensor_rd_0_data_bits_11_9(tensorLoad_1_io_tensor_rd_0_data_bits_11_9),
		.io_tensor_rd_0_data_bits_11_10(tensorLoad_1_io_tensor_rd_0_data_bits_11_10),
		.io_tensor_rd_0_data_bits_11_11(tensorLoad_1_io_tensor_rd_0_data_bits_11_11),
		.io_tensor_rd_0_data_bits_11_12(tensorLoad_1_io_tensor_rd_0_data_bits_11_12),
		.io_tensor_rd_0_data_bits_11_13(tensorLoad_1_io_tensor_rd_0_data_bits_11_13),
		.io_tensor_rd_0_data_bits_11_14(tensorLoad_1_io_tensor_rd_0_data_bits_11_14),
		.io_tensor_rd_0_data_bits_11_15(tensorLoad_1_io_tensor_rd_0_data_bits_11_15),
		.io_tensor_rd_0_data_bits_12_0(tensorLoad_1_io_tensor_rd_0_data_bits_12_0),
		.io_tensor_rd_0_data_bits_12_1(tensorLoad_1_io_tensor_rd_0_data_bits_12_1),
		.io_tensor_rd_0_data_bits_12_2(tensorLoad_1_io_tensor_rd_0_data_bits_12_2),
		.io_tensor_rd_0_data_bits_12_3(tensorLoad_1_io_tensor_rd_0_data_bits_12_3),
		.io_tensor_rd_0_data_bits_12_4(tensorLoad_1_io_tensor_rd_0_data_bits_12_4),
		.io_tensor_rd_0_data_bits_12_5(tensorLoad_1_io_tensor_rd_0_data_bits_12_5),
		.io_tensor_rd_0_data_bits_12_6(tensorLoad_1_io_tensor_rd_0_data_bits_12_6),
		.io_tensor_rd_0_data_bits_12_7(tensorLoad_1_io_tensor_rd_0_data_bits_12_7),
		.io_tensor_rd_0_data_bits_12_8(tensorLoad_1_io_tensor_rd_0_data_bits_12_8),
		.io_tensor_rd_0_data_bits_12_9(tensorLoad_1_io_tensor_rd_0_data_bits_12_9),
		.io_tensor_rd_0_data_bits_12_10(tensorLoad_1_io_tensor_rd_0_data_bits_12_10),
		.io_tensor_rd_0_data_bits_12_11(tensorLoad_1_io_tensor_rd_0_data_bits_12_11),
		.io_tensor_rd_0_data_bits_12_12(tensorLoad_1_io_tensor_rd_0_data_bits_12_12),
		.io_tensor_rd_0_data_bits_12_13(tensorLoad_1_io_tensor_rd_0_data_bits_12_13),
		.io_tensor_rd_0_data_bits_12_14(tensorLoad_1_io_tensor_rd_0_data_bits_12_14),
		.io_tensor_rd_0_data_bits_12_15(tensorLoad_1_io_tensor_rd_0_data_bits_12_15),
		.io_tensor_rd_0_data_bits_13_0(tensorLoad_1_io_tensor_rd_0_data_bits_13_0),
		.io_tensor_rd_0_data_bits_13_1(tensorLoad_1_io_tensor_rd_0_data_bits_13_1),
		.io_tensor_rd_0_data_bits_13_2(tensorLoad_1_io_tensor_rd_0_data_bits_13_2),
		.io_tensor_rd_0_data_bits_13_3(tensorLoad_1_io_tensor_rd_0_data_bits_13_3),
		.io_tensor_rd_0_data_bits_13_4(tensorLoad_1_io_tensor_rd_0_data_bits_13_4),
		.io_tensor_rd_0_data_bits_13_5(tensorLoad_1_io_tensor_rd_0_data_bits_13_5),
		.io_tensor_rd_0_data_bits_13_6(tensorLoad_1_io_tensor_rd_0_data_bits_13_6),
		.io_tensor_rd_0_data_bits_13_7(tensorLoad_1_io_tensor_rd_0_data_bits_13_7),
		.io_tensor_rd_0_data_bits_13_8(tensorLoad_1_io_tensor_rd_0_data_bits_13_8),
		.io_tensor_rd_0_data_bits_13_9(tensorLoad_1_io_tensor_rd_0_data_bits_13_9),
		.io_tensor_rd_0_data_bits_13_10(tensorLoad_1_io_tensor_rd_0_data_bits_13_10),
		.io_tensor_rd_0_data_bits_13_11(tensorLoad_1_io_tensor_rd_0_data_bits_13_11),
		.io_tensor_rd_0_data_bits_13_12(tensorLoad_1_io_tensor_rd_0_data_bits_13_12),
		.io_tensor_rd_0_data_bits_13_13(tensorLoad_1_io_tensor_rd_0_data_bits_13_13),
		.io_tensor_rd_0_data_bits_13_14(tensorLoad_1_io_tensor_rd_0_data_bits_13_14),
		.io_tensor_rd_0_data_bits_13_15(tensorLoad_1_io_tensor_rd_0_data_bits_13_15),
		.io_tensor_rd_0_data_bits_14_0(tensorLoad_1_io_tensor_rd_0_data_bits_14_0),
		.io_tensor_rd_0_data_bits_14_1(tensorLoad_1_io_tensor_rd_0_data_bits_14_1),
		.io_tensor_rd_0_data_bits_14_2(tensorLoad_1_io_tensor_rd_0_data_bits_14_2),
		.io_tensor_rd_0_data_bits_14_3(tensorLoad_1_io_tensor_rd_0_data_bits_14_3),
		.io_tensor_rd_0_data_bits_14_4(tensorLoad_1_io_tensor_rd_0_data_bits_14_4),
		.io_tensor_rd_0_data_bits_14_5(tensorLoad_1_io_tensor_rd_0_data_bits_14_5),
		.io_tensor_rd_0_data_bits_14_6(tensorLoad_1_io_tensor_rd_0_data_bits_14_6),
		.io_tensor_rd_0_data_bits_14_7(tensorLoad_1_io_tensor_rd_0_data_bits_14_7),
		.io_tensor_rd_0_data_bits_14_8(tensorLoad_1_io_tensor_rd_0_data_bits_14_8),
		.io_tensor_rd_0_data_bits_14_9(tensorLoad_1_io_tensor_rd_0_data_bits_14_9),
		.io_tensor_rd_0_data_bits_14_10(tensorLoad_1_io_tensor_rd_0_data_bits_14_10),
		.io_tensor_rd_0_data_bits_14_11(tensorLoad_1_io_tensor_rd_0_data_bits_14_11),
		.io_tensor_rd_0_data_bits_14_12(tensorLoad_1_io_tensor_rd_0_data_bits_14_12),
		.io_tensor_rd_0_data_bits_14_13(tensorLoad_1_io_tensor_rd_0_data_bits_14_13),
		.io_tensor_rd_0_data_bits_14_14(tensorLoad_1_io_tensor_rd_0_data_bits_14_14),
		.io_tensor_rd_0_data_bits_14_15(tensorLoad_1_io_tensor_rd_0_data_bits_14_15),
		.io_tensor_rd_0_data_bits_15_0(tensorLoad_1_io_tensor_rd_0_data_bits_15_0),
		.io_tensor_rd_0_data_bits_15_1(tensorLoad_1_io_tensor_rd_0_data_bits_15_1),
		.io_tensor_rd_0_data_bits_15_2(tensorLoad_1_io_tensor_rd_0_data_bits_15_2),
		.io_tensor_rd_0_data_bits_15_3(tensorLoad_1_io_tensor_rd_0_data_bits_15_3),
		.io_tensor_rd_0_data_bits_15_4(tensorLoad_1_io_tensor_rd_0_data_bits_15_4),
		.io_tensor_rd_0_data_bits_15_5(tensorLoad_1_io_tensor_rd_0_data_bits_15_5),
		.io_tensor_rd_0_data_bits_15_6(tensorLoad_1_io_tensor_rd_0_data_bits_15_6),
		.io_tensor_rd_0_data_bits_15_7(tensorLoad_1_io_tensor_rd_0_data_bits_15_7),
		.io_tensor_rd_0_data_bits_15_8(tensorLoad_1_io_tensor_rd_0_data_bits_15_8),
		.io_tensor_rd_0_data_bits_15_9(tensorLoad_1_io_tensor_rd_0_data_bits_15_9),
		.io_tensor_rd_0_data_bits_15_10(tensorLoad_1_io_tensor_rd_0_data_bits_15_10),
		.io_tensor_rd_0_data_bits_15_11(tensorLoad_1_io_tensor_rd_0_data_bits_15_11),
		.io_tensor_rd_0_data_bits_15_12(tensorLoad_1_io_tensor_rd_0_data_bits_15_12),
		.io_tensor_rd_0_data_bits_15_13(tensorLoad_1_io_tensor_rd_0_data_bits_15_13),
		.io_tensor_rd_0_data_bits_15_14(tensorLoad_1_io_tensor_rd_0_data_bits_15_14),
		.io_tensor_rd_0_data_bits_15_15(tensorLoad_1_io_tensor_rd_0_data_bits_15_15)
	);
	assign io_o_post = dec_io_push_next & _inst_q_io_deq_ready_T_3;
	assign io_inst_ready = inst_q_io_enq_ready;
	assign io_vme_rd_0_cmd_valid = tensorLoad_0_io_vme_rd_cmd_valid;
	assign io_vme_rd_0_cmd_bits_addr = tensorLoad_0_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_0_cmd_bits_len = tensorLoad_0_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_0_cmd_bits_tag = tensorLoad_0_io_vme_rd_cmd_bits_tag;
	assign io_vme_rd_1_cmd_valid = tensorLoad_1_io_vme_rd_cmd_valid;
	assign io_vme_rd_1_cmd_bits_addr = tensorLoad_1_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_1_cmd_bits_len = tensorLoad_1_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_1_cmd_bits_tag = tensorLoad_1_io_vme_rd_cmd_bits_tag;
	assign io_inp_rd_0_data_valid = tensorLoad_0_io_tensor_rd_0_data_valid;
	assign io_inp_rd_0_data_bits_0_0 = tensorLoad_0_io_tensor_rd_0_data_bits_0_0;
	assign io_inp_rd_0_data_bits_0_1 = tensorLoad_0_io_tensor_rd_0_data_bits_0_1;
	assign io_inp_rd_0_data_bits_0_2 = tensorLoad_0_io_tensor_rd_0_data_bits_0_2;
	assign io_inp_rd_0_data_bits_0_3 = tensorLoad_0_io_tensor_rd_0_data_bits_0_3;
	assign io_inp_rd_0_data_bits_0_4 = tensorLoad_0_io_tensor_rd_0_data_bits_0_4;
	assign io_inp_rd_0_data_bits_0_5 = tensorLoad_0_io_tensor_rd_0_data_bits_0_5;
	assign io_inp_rd_0_data_bits_0_6 = tensorLoad_0_io_tensor_rd_0_data_bits_0_6;
	assign io_inp_rd_0_data_bits_0_7 = tensorLoad_0_io_tensor_rd_0_data_bits_0_7;
	assign io_inp_rd_0_data_bits_0_8 = tensorLoad_0_io_tensor_rd_0_data_bits_0_8;
	assign io_inp_rd_0_data_bits_0_9 = tensorLoad_0_io_tensor_rd_0_data_bits_0_9;
	assign io_inp_rd_0_data_bits_0_10 = tensorLoad_0_io_tensor_rd_0_data_bits_0_10;
	assign io_inp_rd_0_data_bits_0_11 = tensorLoad_0_io_tensor_rd_0_data_bits_0_11;
	assign io_inp_rd_0_data_bits_0_12 = tensorLoad_0_io_tensor_rd_0_data_bits_0_12;
	assign io_inp_rd_0_data_bits_0_13 = tensorLoad_0_io_tensor_rd_0_data_bits_0_13;
	assign io_inp_rd_0_data_bits_0_14 = tensorLoad_0_io_tensor_rd_0_data_bits_0_14;
	assign io_inp_rd_0_data_bits_0_15 = tensorLoad_0_io_tensor_rd_0_data_bits_0_15;
	assign io_wgt_rd_0_data_valid = tensorLoad_1_io_tensor_rd_0_data_valid;
	assign io_wgt_rd_0_data_bits_0_0 = tensorLoad_1_io_tensor_rd_0_data_bits_0_0;
	assign io_wgt_rd_0_data_bits_0_1 = tensorLoad_1_io_tensor_rd_0_data_bits_0_1;
	assign io_wgt_rd_0_data_bits_0_2 = tensorLoad_1_io_tensor_rd_0_data_bits_0_2;
	assign io_wgt_rd_0_data_bits_0_3 = tensorLoad_1_io_tensor_rd_0_data_bits_0_3;
	assign io_wgt_rd_0_data_bits_0_4 = tensorLoad_1_io_tensor_rd_0_data_bits_0_4;
	assign io_wgt_rd_0_data_bits_0_5 = tensorLoad_1_io_tensor_rd_0_data_bits_0_5;
	assign io_wgt_rd_0_data_bits_0_6 = tensorLoad_1_io_tensor_rd_0_data_bits_0_6;
	assign io_wgt_rd_0_data_bits_0_7 = tensorLoad_1_io_tensor_rd_0_data_bits_0_7;
	assign io_wgt_rd_0_data_bits_0_8 = tensorLoad_1_io_tensor_rd_0_data_bits_0_8;
	assign io_wgt_rd_0_data_bits_0_9 = tensorLoad_1_io_tensor_rd_0_data_bits_0_9;
	assign io_wgt_rd_0_data_bits_0_10 = tensorLoad_1_io_tensor_rd_0_data_bits_0_10;
	assign io_wgt_rd_0_data_bits_0_11 = tensorLoad_1_io_tensor_rd_0_data_bits_0_11;
	assign io_wgt_rd_0_data_bits_0_12 = tensorLoad_1_io_tensor_rd_0_data_bits_0_12;
	assign io_wgt_rd_0_data_bits_0_13 = tensorLoad_1_io_tensor_rd_0_data_bits_0_13;
	assign io_wgt_rd_0_data_bits_0_14 = tensorLoad_1_io_tensor_rd_0_data_bits_0_14;
	assign io_wgt_rd_0_data_bits_0_15 = tensorLoad_1_io_tensor_rd_0_data_bits_0_15;
	assign io_wgt_rd_0_data_bits_1_0 = tensorLoad_1_io_tensor_rd_0_data_bits_1_0;
	assign io_wgt_rd_0_data_bits_1_1 = tensorLoad_1_io_tensor_rd_0_data_bits_1_1;
	assign io_wgt_rd_0_data_bits_1_2 = tensorLoad_1_io_tensor_rd_0_data_bits_1_2;
	assign io_wgt_rd_0_data_bits_1_3 = tensorLoad_1_io_tensor_rd_0_data_bits_1_3;
	assign io_wgt_rd_0_data_bits_1_4 = tensorLoad_1_io_tensor_rd_0_data_bits_1_4;
	assign io_wgt_rd_0_data_bits_1_5 = tensorLoad_1_io_tensor_rd_0_data_bits_1_5;
	assign io_wgt_rd_0_data_bits_1_6 = tensorLoad_1_io_tensor_rd_0_data_bits_1_6;
	assign io_wgt_rd_0_data_bits_1_7 = tensorLoad_1_io_tensor_rd_0_data_bits_1_7;
	assign io_wgt_rd_0_data_bits_1_8 = tensorLoad_1_io_tensor_rd_0_data_bits_1_8;
	assign io_wgt_rd_0_data_bits_1_9 = tensorLoad_1_io_tensor_rd_0_data_bits_1_9;
	assign io_wgt_rd_0_data_bits_1_10 = tensorLoad_1_io_tensor_rd_0_data_bits_1_10;
	assign io_wgt_rd_0_data_bits_1_11 = tensorLoad_1_io_tensor_rd_0_data_bits_1_11;
	assign io_wgt_rd_0_data_bits_1_12 = tensorLoad_1_io_tensor_rd_0_data_bits_1_12;
	assign io_wgt_rd_0_data_bits_1_13 = tensorLoad_1_io_tensor_rd_0_data_bits_1_13;
	assign io_wgt_rd_0_data_bits_1_14 = tensorLoad_1_io_tensor_rd_0_data_bits_1_14;
	assign io_wgt_rd_0_data_bits_1_15 = tensorLoad_1_io_tensor_rd_0_data_bits_1_15;
	assign io_wgt_rd_0_data_bits_2_0 = tensorLoad_1_io_tensor_rd_0_data_bits_2_0;
	assign io_wgt_rd_0_data_bits_2_1 = tensorLoad_1_io_tensor_rd_0_data_bits_2_1;
	assign io_wgt_rd_0_data_bits_2_2 = tensorLoad_1_io_tensor_rd_0_data_bits_2_2;
	assign io_wgt_rd_0_data_bits_2_3 = tensorLoad_1_io_tensor_rd_0_data_bits_2_3;
	assign io_wgt_rd_0_data_bits_2_4 = tensorLoad_1_io_tensor_rd_0_data_bits_2_4;
	assign io_wgt_rd_0_data_bits_2_5 = tensorLoad_1_io_tensor_rd_0_data_bits_2_5;
	assign io_wgt_rd_0_data_bits_2_6 = tensorLoad_1_io_tensor_rd_0_data_bits_2_6;
	assign io_wgt_rd_0_data_bits_2_7 = tensorLoad_1_io_tensor_rd_0_data_bits_2_7;
	assign io_wgt_rd_0_data_bits_2_8 = tensorLoad_1_io_tensor_rd_0_data_bits_2_8;
	assign io_wgt_rd_0_data_bits_2_9 = tensorLoad_1_io_tensor_rd_0_data_bits_2_9;
	assign io_wgt_rd_0_data_bits_2_10 = tensorLoad_1_io_tensor_rd_0_data_bits_2_10;
	assign io_wgt_rd_0_data_bits_2_11 = tensorLoad_1_io_tensor_rd_0_data_bits_2_11;
	assign io_wgt_rd_0_data_bits_2_12 = tensorLoad_1_io_tensor_rd_0_data_bits_2_12;
	assign io_wgt_rd_0_data_bits_2_13 = tensorLoad_1_io_tensor_rd_0_data_bits_2_13;
	assign io_wgt_rd_0_data_bits_2_14 = tensorLoad_1_io_tensor_rd_0_data_bits_2_14;
	assign io_wgt_rd_0_data_bits_2_15 = tensorLoad_1_io_tensor_rd_0_data_bits_2_15;
	assign io_wgt_rd_0_data_bits_3_0 = tensorLoad_1_io_tensor_rd_0_data_bits_3_0;
	assign io_wgt_rd_0_data_bits_3_1 = tensorLoad_1_io_tensor_rd_0_data_bits_3_1;
	assign io_wgt_rd_0_data_bits_3_2 = tensorLoad_1_io_tensor_rd_0_data_bits_3_2;
	assign io_wgt_rd_0_data_bits_3_3 = tensorLoad_1_io_tensor_rd_0_data_bits_3_3;
	assign io_wgt_rd_0_data_bits_3_4 = tensorLoad_1_io_tensor_rd_0_data_bits_3_4;
	assign io_wgt_rd_0_data_bits_3_5 = tensorLoad_1_io_tensor_rd_0_data_bits_3_5;
	assign io_wgt_rd_0_data_bits_3_6 = tensorLoad_1_io_tensor_rd_0_data_bits_3_6;
	assign io_wgt_rd_0_data_bits_3_7 = tensorLoad_1_io_tensor_rd_0_data_bits_3_7;
	assign io_wgt_rd_0_data_bits_3_8 = tensorLoad_1_io_tensor_rd_0_data_bits_3_8;
	assign io_wgt_rd_0_data_bits_3_9 = tensorLoad_1_io_tensor_rd_0_data_bits_3_9;
	assign io_wgt_rd_0_data_bits_3_10 = tensorLoad_1_io_tensor_rd_0_data_bits_3_10;
	assign io_wgt_rd_0_data_bits_3_11 = tensorLoad_1_io_tensor_rd_0_data_bits_3_11;
	assign io_wgt_rd_0_data_bits_3_12 = tensorLoad_1_io_tensor_rd_0_data_bits_3_12;
	assign io_wgt_rd_0_data_bits_3_13 = tensorLoad_1_io_tensor_rd_0_data_bits_3_13;
	assign io_wgt_rd_0_data_bits_3_14 = tensorLoad_1_io_tensor_rd_0_data_bits_3_14;
	assign io_wgt_rd_0_data_bits_3_15 = tensorLoad_1_io_tensor_rd_0_data_bits_3_15;
	assign io_wgt_rd_0_data_bits_4_0 = tensorLoad_1_io_tensor_rd_0_data_bits_4_0;
	assign io_wgt_rd_0_data_bits_4_1 = tensorLoad_1_io_tensor_rd_0_data_bits_4_1;
	assign io_wgt_rd_0_data_bits_4_2 = tensorLoad_1_io_tensor_rd_0_data_bits_4_2;
	assign io_wgt_rd_0_data_bits_4_3 = tensorLoad_1_io_tensor_rd_0_data_bits_4_3;
	assign io_wgt_rd_0_data_bits_4_4 = tensorLoad_1_io_tensor_rd_0_data_bits_4_4;
	assign io_wgt_rd_0_data_bits_4_5 = tensorLoad_1_io_tensor_rd_0_data_bits_4_5;
	assign io_wgt_rd_0_data_bits_4_6 = tensorLoad_1_io_tensor_rd_0_data_bits_4_6;
	assign io_wgt_rd_0_data_bits_4_7 = tensorLoad_1_io_tensor_rd_0_data_bits_4_7;
	assign io_wgt_rd_0_data_bits_4_8 = tensorLoad_1_io_tensor_rd_0_data_bits_4_8;
	assign io_wgt_rd_0_data_bits_4_9 = tensorLoad_1_io_tensor_rd_0_data_bits_4_9;
	assign io_wgt_rd_0_data_bits_4_10 = tensorLoad_1_io_tensor_rd_0_data_bits_4_10;
	assign io_wgt_rd_0_data_bits_4_11 = tensorLoad_1_io_tensor_rd_0_data_bits_4_11;
	assign io_wgt_rd_0_data_bits_4_12 = tensorLoad_1_io_tensor_rd_0_data_bits_4_12;
	assign io_wgt_rd_0_data_bits_4_13 = tensorLoad_1_io_tensor_rd_0_data_bits_4_13;
	assign io_wgt_rd_0_data_bits_4_14 = tensorLoad_1_io_tensor_rd_0_data_bits_4_14;
	assign io_wgt_rd_0_data_bits_4_15 = tensorLoad_1_io_tensor_rd_0_data_bits_4_15;
	assign io_wgt_rd_0_data_bits_5_0 = tensorLoad_1_io_tensor_rd_0_data_bits_5_0;
	assign io_wgt_rd_0_data_bits_5_1 = tensorLoad_1_io_tensor_rd_0_data_bits_5_1;
	assign io_wgt_rd_0_data_bits_5_2 = tensorLoad_1_io_tensor_rd_0_data_bits_5_2;
	assign io_wgt_rd_0_data_bits_5_3 = tensorLoad_1_io_tensor_rd_0_data_bits_5_3;
	assign io_wgt_rd_0_data_bits_5_4 = tensorLoad_1_io_tensor_rd_0_data_bits_5_4;
	assign io_wgt_rd_0_data_bits_5_5 = tensorLoad_1_io_tensor_rd_0_data_bits_5_5;
	assign io_wgt_rd_0_data_bits_5_6 = tensorLoad_1_io_tensor_rd_0_data_bits_5_6;
	assign io_wgt_rd_0_data_bits_5_7 = tensorLoad_1_io_tensor_rd_0_data_bits_5_7;
	assign io_wgt_rd_0_data_bits_5_8 = tensorLoad_1_io_tensor_rd_0_data_bits_5_8;
	assign io_wgt_rd_0_data_bits_5_9 = tensorLoad_1_io_tensor_rd_0_data_bits_5_9;
	assign io_wgt_rd_0_data_bits_5_10 = tensorLoad_1_io_tensor_rd_0_data_bits_5_10;
	assign io_wgt_rd_0_data_bits_5_11 = tensorLoad_1_io_tensor_rd_0_data_bits_5_11;
	assign io_wgt_rd_0_data_bits_5_12 = tensorLoad_1_io_tensor_rd_0_data_bits_5_12;
	assign io_wgt_rd_0_data_bits_5_13 = tensorLoad_1_io_tensor_rd_0_data_bits_5_13;
	assign io_wgt_rd_0_data_bits_5_14 = tensorLoad_1_io_tensor_rd_0_data_bits_5_14;
	assign io_wgt_rd_0_data_bits_5_15 = tensorLoad_1_io_tensor_rd_0_data_bits_5_15;
	assign io_wgt_rd_0_data_bits_6_0 = tensorLoad_1_io_tensor_rd_0_data_bits_6_0;
	assign io_wgt_rd_0_data_bits_6_1 = tensorLoad_1_io_tensor_rd_0_data_bits_6_1;
	assign io_wgt_rd_0_data_bits_6_2 = tensorLoad_1_io_tensor_rd_0_data_bits_6_2;
	assign io_wgt_rd_0_data_bits_6_3 = tensorLoad_1_io_tensor_rd_0_data_bits_6_3;
	assign io_wgt_rd_0_data_bits_6_4 = tensorLoad_1_io_tensor_rd_0_data_bits_6_4;
	assign io_wgt_rd_0_data_bits_6_5 = tensorLoad_1_io_tensor_rd_0_data_bits_6_5;
	assign io_wgt_rd_0_data_bits_6_6 = tensorLoad_1_io_tensor_rd_0_data_bits_6_6;
	assign io_wgt_rd_0_data_bits_6_7 = tensorLoad_1_io_tensor_rd_0_data_bits_6_7;
	assign io_wgt_rd_0_data_bits_6_8 = tensorLoad_1_io_tensor_rd_0_data_bits_6_8;
	assign io_wgt_rd_0_data_bits_6_9 = tensorLoad_1_io_tensor_rd_0_data_bits_6_9;
	assign io_wgt_rd_0_data_bits_6_10 = tensorLoad_1_io_tensor_rd_0_data_bits_6_10;
	assign io_wgt_rd_0_data_bits_6_11 = tensorLoad_1_io_tensor_rd_0_data_bits_6_11;
	assign io_wgt_rd_0_data_bits_6_12 = tensorLoad_1_io_tensor_rd_0_data_bits_6_12;
	assign io_wgt_rd_0_data_bits_6_13 = tensorLoad_1_io_tensor_rd_0_data_bits_6_13;
	assign io_wgt_rd_0_data_bits_6_14 = tensorLoad_1_io_tensor_rd_0_data_bits_6_14;
	assign io_wgt_rd_0_data_bits_6_15 = tensorLoad_1_io_tensor_rd_0_data_bits_6_15;
	assign io_wgt_rd_0_data_bits_7_0 = tensorLoad_1_io_tensor_rd_0_data_bits_7_0;
	assign io_wgt_rd_0_data_bits_7_1 = tensorLoad_1_io_tensor_rd_0_data_bits_7_1;
	assign io_wgt_rd_0_data_bits_7_2 = tensorLoad_1_io_tensor_rd_0_data_bits_7_2;
	assign io_wgt_rd_0_data_bits_7_3 = tensorLoad_1_io_tensor_rd_0_data_bits_7_3;
	assign io_wgt_rd_0_data_bits_7_4 = tensorLoad_1_io_tensor_rd_0_data_bits_7_4;
	assign io_wgt_rd_0_data_bits_7_5 = tensorLoad_1_io_tensor_rd_0_data_bits_7_5;
	assign io_wgt_rd_0_data_bits_7_6 = tensorLoad_1_io_tensor_rd_0_data_bits_7_6;
	assign io_wgt_rd_0_data_bits_7_7 = tensorLoad_1_io_tensor_rd_0_data_bits_7_7;
	assign io_wgt_rd_0_data_bits_7_8 = tensorLoad_1_io_tensor_rd_0_data_bits_7_8;
	assign io_wgt_rd_0_data_bits_7_9 = tensorLoad_1_io_tensor_rd_0_data_bits_7_9;
	assign io_wgt_rd_0_data_bits_7_10 = tensorLoad_1_io_tensor_rd_0_data_bits_7_10;
	assign io_wgt_rd_0_data_bits_7_11 = tensorLoad_1_io_tensor_rd_0_data_bits_7_11;
	assign io_wgt_rd_0_data_bits_7_12 = tensorLoad_1_io_tensor_rd_0_data_bits_7_12;
	assign io_wgt_rd_0_data_bits_7_13 = tensorLoad_1_io_tensor_rd_0_data_bits_7_13;
	assign io_wgt_rd_0_data_bits_7_14 = tensorLoad_1_io_tensor_rd_0_data_bits_7_14;
	assign io_wgt_rd_0_data_bits_7_15 = tensorLoad_1_io_tensor_rd_0_data_bits_7_15;
	assign io_wgt_rd_0_data_bits_8_0 = tensorLoad_1_io_tensor_rd_0_data_bits_8_0;
	assign io_wgt_rd_0_data_bits_8_1 = tensorLoad_1_io_tensor_rd_0_data_bits_8_1;
	assign io_wgt_rd_0_data_bits_8_2 = tensorLoad_1_io_tensor_rd_0_data_bits_8_2;
	assign io_wgt_rd_0_data_bits_8_3 = tensorLoad_1_io_tensor_rd_0_data_bits_8_3;
	assign io_wgt_rd_0_data_bits_8_4 = tensorLoad_1_io_tensor_rd_0_data_bits_8_4;
	assign io_wgt_rd_0_data_bits_8_5 = tensorLoad_1_io_tensor_rd_0_data_bits_8_5;
	assign io_wgt_rd_0_data_bits_8_6 = tensorLoad_1_io_tensor_rd_0_data_bits_8_6;
	assign io_wgt_rd_0_data_bits_8_7 = tensorLoad_1_io_tensor_rd_0_data_bits_8_7;
	assign io_wgt_rd_0_data_bits_8_8 = tensorLoad_1_io_tensor_rd_0_data_bits_8_8;
	assign io_wgt_rd_0_data_bits_8_9 = tensorLoad_1_io_tensor_rd_0_data_bits_8_9;
	assign io_wgt_rd_0_data_bits_8_10 = tensorLoad_1_io_tensor_rd_0_data_bits_8_10;
	assign io_wgt_rd_0_data_bits_8_11 = tensorLoad_1_io_tensor_rd_0_data_bits_8_11;
	assign io_wgt_rd_0_data_bits_8_12 = tensorLoad_1_io_tensor_rd_0_data_bits_8_12;
	assign io_wgt_rd_0_data_bits_8_13 = tensorLoad_1_io_tensor_rd_0_data_bits_8_13;
	assign io_wgt_rd_0_data_bits_8_14 = tensorLoad_1_io_tensor_rd_0_data_bits_8_14;
	assign io_wgt_rd_0_data_bits_8_15 = tensorLoad_1_io_tensor_rd_0_data_bits_8_15;
	assign io_wgt_rd_0_data_bits_9_0 = tensorLoad_1_io_tensor_rd_0_data_bits_9_0;
	assign io_wgt_rd_0_data_bits_9_1 = tensorLoad_1_io_tensor_rd_0_data_bits_9_1;
	assign io_wgt_rd_0_data_bits_9_2 = tensorLoad_1_io_tensor_rd_0_data_bits_9_2;
	assign io_wgt_rd_0_data_bits_9_3 = tensorLoad_1_io_tensor_rd_0_data_bits_9_3;
	assign io_wgt_rd_0_data_bits_9_4 = tensorLoad_1_io_tensor_rd_0_data_bits_9_4;
	assign io_wgt_rd_0_data_bits_9_5 = tensorLoad_1_io_tensor_rd_0_data_bits_9_5;
	assign io_wgt_rd_0_data_bits_9_6 = tensorLoad_1_io_tensor_rd_0_data_bits_9_6;
	assign io_wgt_rd_0_data_bits_9_7 = tensorLoad_1_io_tensor_rd_0_data_bits_9_7;
	assign io_wgt_rd_0_data_bits_9_8 = tensorLoad_1_io_tensor_rd_0_data_bits_9_8;
	assign io_wgt_rd_0_data_bits_9_9 = tensorLoad_1_io_tensor_rd_0_data_bits_9_9;
	assign io_wgt_rd_0_data_bits_9_10 = tensorLoad_1_io_tensor_rd_0_data_bits_9_10;
	assign io_wgt_rd_0_data_bits_9_11 = tensorLoad_1_io_tensor_rd_0_data_bits_9_11;
	assign io_wgt_rd_0_data_bits_9_12 = tensorLoad_1_io_tensor_rd_0_data_bits_9_12;
	assign io_wgt_rd_0_data_bits_9_13 = tensorLoad_1_io_tensor_rd_0_data_bits_9_13;
	assign io_wgt_rd_0_data_bits_9_14 = tensorLoad_1_io_tensor_rd_0_data_bits_9_14;
	assign io_wgt_rd_0_data_bits_9_15 = tensorLoad_1_io_tensor_rd_0_data_bits_9_15;
	assign io_wgt_rd_0_data_bits_10_0 = tensorLoad_1_io_tensor_rd_0_data_bits_10_0;
	assign io_wgt_rd_0_data_bits_10_1 = tensorLoad_1_io_tensor_rd_0_data_bits_10_1;
	assign io_wgt_rd_0_data_bits_10_2 = tensorLoad_1_io_tensor_rd_0_data_bits_10_2;
	assign io_wgt_rd_0_data_bits_10_3 = tensorLoad_1_io_tensor_rd_0_data_bits_10_3;
	assign io_wgt_rd_0_data_bits_10_4 = tensorLoad_1_io_tensor_rd_0_data_bits_10_4;
	assign io_wgt_rd_0_data_bits_10_5 = tensorLoad_1_io_tensor_rd_0_data_bits_10_5;
	assign io_wgt_rd_0_data_bits_10_6 = tensorLoad_1_io_tensor_rd_0_data_bits_10_6;
	assign io_wgt_rd_0_data_bits_10_7 = tensorLoad_1_io_tensor_rd_0_data_bits_10_7;
	assign io_wgt_rd_0_data_bits_10_8 = tensorLoad_1_io_tensor_rd_0_data_bits_10_8;
	assign io_wgt_rd_0_data_bits_10_9 = tensorLoad_1_io_tensor_rd_0_data_bits_10_9;
	assign io_wgt_rd_0_data_bits_10_10 = tensorLoad_1_io_tensor_rd_0_data_bits_10_10;
	assign io_wgt_rd_0_data_bits_10_11 = tensorLoad_1_io_tensor_rd_0_data_bits_10_11;
	assign io_wgt_rd_0_data_bits_10_12 = tensorLoad_1_io_tensor_rd_0_data_bits_10_12;
	assign io_wgt_rd_0_data_bits_10_13 = tensorLoad_1_io_tensor_rd_0_data_bits_10_13;
	assign io_wgt_rd_0_data_bits_10_14 = tensorLoad_1_io_tensor_rd_0_data_bits_10_14;
	assign io_wgt_rd_0_data_bits_10_15 = tensorLoad_1_io_tensor_rd_0_data_bits_10_15;
	assign io_wgt_rd_0_data_bits_11_0 = tensorLoad_1_io_tensor_rd_0_data_bits_11_0;
	assign io_wgt_rd_0_data_bits_11_1 = tensorLoad_1_io_tensor_rd_0_data_bits_11_1;
	assign io_wgt_rd_0_data_bits_11_2 = tensorLoad_1_io_tensor_rd_0_data_bits_11_2;
	assign io_wgt_rd_0_data_bits_11_3 = tensorLoad_1_io_tensor_rd_0_data_bits_11_3;
	assign io_wgt_rd_0_data_bits_11_4 = tensorLoad_1_io_tensor_rd_0_data_bits_11_4;
	assign io_wgt_rd_0_data_bits_11_5 = tensorLoad_1_io_tensor_rd_0_data_bits_11_5;
	assign io_wgt_rd_0_data_bits_11_6 = tensorLoad_1_io_tensor_rd_0_data_bits_11_6;
	assign io_wgt_rd_0_data_bits_11_7 = tensorLoad_1_io_tensor_rd_0_data_bits_11_7;
	assign io_wgt_rd_0_data_bits_11_8 = tensorLoad_1_io_tensor_rd_0_data_bits_11_8;
	assign io_wgt_rd_0_data_bits_11_9 = tensorLoad_1_io_tensor_rd_0_data_bits_11_9;
	assign io_wgt_rd_0_data_bits_11_10 = tensorLoad_1_io_tensor_rd_0_data_bits_11_10;
	assign io_wgt_rd_0_data_bits_11_11 = tensorLoad_1_io_tensor_rd_0_data_bits_11_11;
	assign io_wgt_rd_0_data_bits_11_12 = tensorLoad_1_io_tensor_rd_0_data_bits_11_12;
	assign io_wgt_rd_0_data_bits_11_13 = tensorLoad_1_io_tensor_rd_0_data_bits_11_13;
	assign io_wgt_rd_0_data_bits_11_14 = tensorLoad_1_io_tensor_rd_0_data_bits_11_14;
	assign io_wgt_rd_0_data_bits_11_15 = tensorLoad_1_io_tensor_rd_0_data_bits_11_15;
	assign io_wgt_rd_0_data_bits_12_0 = tensorLoad_1_io_tensor_rd_0_data_bits_12_0;
	assign io_wgt_rd_0_data_bits_12_1 = tensorLoad_1_io_tensor_rd_0_data_bits_12_1;
	assign io_wgt_rd_0_data_bits_12_2 = tensorLoad_1_io_tensor_rd_0_data_bits_12_2;
	assign io_wgt_rd_0_data_bits_12_3 = tensorLoad_1_io_tensor_rd_0_data_bits_12_3;
	assign io_wgt_rd_0_data_bits_12_4 = tensorLoad_1_io_tensor_rd_0_data_bits_12_4;
	assign io_wgt_rd_0_data_bits_12_5 = tensorLoad_1_io_tensor_rd_0_data_bits_12_5;
	assign io_wgt_rd_0_data_bits_12_6 = tensorLoad_1_io_tensor_rd_0_data_bits_12_6;
	assign io_wgt_rd_0_data_bits_12_7 = tensorLoad_1_io_tensor_rd_0_data_bits_12_7;
	assign io_wgt_rd_0_data_bits_12_8 = tensorLoad_1_io_tensor_rd_0_data_bits_12_8;
	assign io_wgt_rd_0_data_bits_12_9 = tensorLoad_1_io_tensor_rd_0_data_bits_12_9;
	assign io_wgt_rd_0_data_bits_12_10 = tensorLoad_1_io_tensor_rd_0_data_bits_12_10;
	assign io_wgt_rd_0_data_bits_12_11 = tensorLoad_1_io_tensor_rd_0_data_bits_12_11;
	assign io_wgt_rd_0_data_bits_12_12 = tensorLoad_1_io_tensor_rd_0_data_bits_12_12;
	assign io_wgt_rd_0_data_bits_12_13 = tensorLoad_1_io_tensor_rd_0_data_bits_12_13;
	assign io_wgt_rd_0_data_bits_12_14 = tensorLoad_1_io_tensor_rd_0_data_bits_12_14;
	assign io_wgt_rd_0_data_bits_12_15 = tensorLoad_1_io_tensor_rd_0_data_bits_12_15;
	assign io_wgt_rd_0_data_bits_13_0 = tensorLoad_1_io_tensor_rd_0_data_bits_13_0;
	assign io_wgt_rd_0_data_bits_13_1 = tensorLoad_1_io_tensor_rd_0_data_bits_13_1;
	assign io_wgt_rd_0_data_bits_13_2 = tensorLoad_1_io_tensor_rd_0_data_bits_13_2;
	assign io_wgt_rd_0_data_bits_13_3 = tensorLoad_1_io_tensor_rd_0_data_bits_13_3;
	assign io_wgt_rd_0_data_bits_13_4 = tensorLoad_1_io_tensor_rd_0_data_bits_13_4;
	assign io_wgt_rd_0_data_bits_13_5 = tensorLoad_1_io_tensor_rd_0_data_bits_13_5;
	assign io_wgt_rd_0_data_bits_13_6 = tensorLoad_1_io_tensor_rd_0_data_bits_13_6;
	assign io_wgt_rd_0_data_bits_13_7 = tensorLoad_1_io_tensor_rd_0_data_bits_13_7;
	assign io_wgt_rd_0_data_bits_13_8 = tensorLoad_1_io_tensor_rd_0_data_bits_13_8;
	assign io_wgt_rd_0_data_bits_13_9 = tensorLoad_1_io_tensor_rd_0_data_bits_13_9;
	assign io_wgt_rd_0_data_bits_13_10 = tensorLoad_1_io_tensor_rd_0_data_bits_13_10;
	assign io_wgt_rd_0_data_bits_13_11 = tensorLoad_1_io_tensor_rd_0_data_bits_13_11;
	assign io_wgt_rd_0_data_bits_13_12 = tensorLoad_1_io_tensor_rd_0_data_bits_13_12;
	assign io_wgt_rd_0_data_bits_13_13 = tensorLoad_1_io_tensor_rd_0_data_bits_13_13;
	assign io_wgt_rd_0_data_bits_13_14 = tensorLoad_1_io_tensor_rd_0_data_bits_13_14;
	assign io_wgt_rd_0_data_bits_13_15 = tensorLoad_1_io_tensor_rd_0_data_bits_13_15;
	assign io_wgt_rd_0_data_bits_14_0 = tensorLoad_1_io_tensor_rd_0_data_bits_14_0;
	assign io_wgt_rd_0_data_bits_14_1 = tensorLoad_1_io_tensor_rd_0_data_bits_14_1;
	assign io_wgt_rd_0_data_bits_14_2 = tensorLoad_1_io_tensor_rd_0_data_bits_14_2;
	assign io_wgt_rd_0_data_bits_14_3 = tensorLoad_1_io_tensor_rd_0_data_bits_14_3;
	assign io_wgt_rd_0_data_bits_14_4 = tensorLoad_1_io_tensor_rd_0_data_bits_14_4;
	assign io_wgt_rd_0_data_bits_14_5 = tensorLoad_1_io_tensor_rd_0_data_bits_14_5;
	assign io_wgt_rd_0_data_bits_14_6 = tensorLoad_1_io_tensor_rd_0_data_bits_14_6;
	assign io_wgt_rd_0_data_bits_14_7 = tensorLoad_1_io_tensor_rd_0_data_bits_14_7;
	assign io_wgt_rd_0_data_bits_14_8 = tensorLoad_1_io_tensor_rd_0_data_bits_14_8;
	assign io_wgt_rd_0_data_bits_14_9 = tensorLoad_1_io_tensor_rd_0_data_bits_14_9;
	assign io_wgt_rd_0_data_bits_14_10 = tensorLoad_1_io_tensor_rd_0_data_bits_14_10;
	assign io_wgt_rd_0_data_bits_14_11 = tensorLoad_1_io_tensor_rd_0_data_bits_14_11;
	assign io_wgt_rd_0_data_bits_14_12 = tensorLoad_1_io_tensor_rd_0_data_bits_14_12;
	assign io_wgt_rd_0_data_bits_14_13 = tensorLoad_1_io_tensor_rd_0_data_bits_14_13;
	assign io_wgt_rd_0_data_bits_14_14 = tensorLoad_1_io_tensor_rd_0_data_bits_14_14;
	assign io_wgt_rd_0_data_bits_14_15 = tensorLoad_1_io_tensor_rd_0_data_bits_14_15;
	assign io_wgt_rd_0_data_bits_15_0 = tensorLoad_1_io_tensor_rd_0_data_bits_15_0;
	assign io_wgt_rd_0_data_bits_15_1 = tensorLoad_1_io_tensor_rd_0_data_bits_15_1;
	assign io_wgt_rd_0_data_bits_15_2 = tensorLoad_1_io_tensor_rd_0_data_bits_15_2;
	assign io_wgt_rd_0_data_bits_15_3 = tensorLoad_1_io_tensor_rd_0_data_bits_15_3;
	assign io_wgt_rd_0_data_bits_15_4 = tensorLoad_1_io_tensor_rd_0_data_bits_15_4;
	assign io_wgt_rd_0_data_bits_15_5 = tensorLoad_1_io_tensor_rd_0_data_bits_15_5;
	assign io_wgt_rd_0_data_bits_15_6 = tensorLoad_1_io_tensor_rd_0_data_bits_15_6;
	assign io_wgt_rd_0_data_bits_15_7 = tensorLoad_1_io_tensor_rd_0_data_bits_15_7;
	assign io_wgt_rd_0_data_bits_15_8 = tensorLoad_1_io_tensor_rd_0_data_bits_15_8;
	assign io_wgt_rd_0_data_bits_15_9 = tensorLoad_1_io_tensor_rd_0_data_bits_15_9;
	assign io_wgt_rd_0_data_bits_15_10 = tensorLoad_1_io_tensor_rd_0_data_bits_15_10;
	assign io_wgt_rd_0_data_bits_15_11 = tensorLoad_1_io_tensor_rd_0_data_bits_15_11;
	assign io_wgt_rd_0_data_bits_15_12 = tensorLoad_1_io_tensor_rd_0_data_bits_15_12;
	assign io_wgt_rd_0_data_bits_15_13 = tensorLoad_1_io_tensor_rd_0_data_bits_15_13;
	assign io_wgt_rd_0_data_bits_15_14 = tensorLoad_1_io_tensor_rd_0_data_bits_15_14;
	assign io_wgt_rd_0_data_bits_15_15 = tensorLoad_1_io_tensor_rd_0_data_bits_15_15;
	assign s_clock = clk;
	assign s_reset = rst;
	assign s_io_spost = io_i_post;
	assign s_io_swait = dec_io_pop_next & _tensorLoad_0_io_start_T_1;
	assign inst_q_clock = clk;
	assign inst_q_reset = rst;
	assign inst_q_io_enq_valid = io_inst_valid;
	assign inst_q_io_enq_bits = io_inst_bits;
	assign inst_q_io_deq_ready = ((state == 2'h2) & done) | (state == 2'h1);
	assign dec_io_inst = inst_q_io_deq_bits;
	assign tensorLoad_0_clock = clk;
	assign tensorLoad_0_reset = rst;
	assign tensorLoad_0_io_start = ((state == 2'h0) & start) & dec_io_isInput;
	assign tensorLoad_0_io_inst = inst_q_io_deq_bits;
	assign tensorLoad_0_io_baddr = io_inp_baddr;
	assign tensorLoad_0_io_vme_rd_cmd_ready = io_vme_rd_0_cmd_ready;
	assign tensorLoad_0_io_vme_rd_data_valid = io_vme_rd_0_data_valid;
	assign tensorLoad_0_io_vme_rd_data_bits_data = io_vme_rd_0_data_bits_data;
	assign tensorLoad_0_io_vme_rd_data_bits_tag = io_vme_rd_0_data_bits_tag;
	assign tensorLoad_0_io_tensor_rd_0_idx_valid = io_inp_rd_0_idx_valid;
	assign tensorLoad_0_io_tensor_rd_0_idx_bits = io_inp_rd_0_idx_bits;
	assign tensorLoad_1_clock = clk;
	assign tensorLoad_1_reset = rst;
	assign tensorLoad_1_io_start = ((state == 2'h0) & start) & dec_io_isWeight;
	assign tensorLoad_1_io_inst = inst_q_io_deq_bits;
	assign tensorLoad_1_io_baddr = io_wgt_baddr;
	assign tensorLoad_1_io_vme_rd_cmd_ready = io_vme_rd_1_cmd_ready;
	assign tensorLoad_1_io_vme_rd_data_valid = io_vme_rd_1_data_valid;
	assign tensorLoad_1_io_vme_rd_data_bits_data = io_vme_rd_1_data_bits_data;
	assign tensorLoad_1_io_vme_rd_data_bits_tag = io_vme_rd_1_data_bits_tag;
	assign tensorLoad_1_io_tensor_rd_0_idx_valid = io_wgt_rd_0_idx_valid;
	assign tensorLoad_1_io_tensor_rd_0_idx_bits = io_wgt_rd_0_idx_bits;
	always @(posedge clk)
		if (rst)
			state <= 2'h0;
		else if (2'h0 == state) begin
			if (start) begin
				if (dec_io_isSync)
					state <= 2'h1;
				else
					state <= _GEN_0;
			end
		end
		else if (2'h1 == state)
			state <= 2'h0;
		else if (2'h2 == state)
			state <= _GEN_3;
endmodule
module GenVMECmdWide (
	clk,
	rst,
	io_start,
	io_isBusy,
	io_updateState,
	io_baddr,
	io_vmeCmd_valid,
	io_vmeCmd_bits_addr,
	io_vmeCmd_bits_len,
	io_vmeCmd_bits_tag,
	io_readLen,
	io_done,
	io_ysize,
	io_xsize,
	io_xstride,
	io_dram_offset,
	io_sram_offset,
	io_xpad_0,
	io_xpad_1,
	io_ypad_0
);
	input clk;
	input rst;
	input io_start;
	input io_isBusy;
	input io_updateState;
	input [63:0] io_baddr;
	output wire io_vmeCmd_valid;
	output wire [63:0] io_vmeCmd_bits_addr;
	output wire [7:0] io_vmeCmd_bits_len;
	output wire [20:0] io_vmeCmd_bits_tag;
	output wire [8:0] io_readLen;
	output wire io_done;
	input [15:0] io_ysize;
	input [15:0] io_xsize;
	input [15:0] io_xstride;
	input [31:0] io_dram_offset;
	input [15:0] io_sram_offset;
	input [3:0] io_xpad_0;
	input [3:0] io_xpad_1;
	input [3:0] io_ypad_0;
	reg [15:0] dramLineIdx;
	wire [15:0] _dramLineIdx_T_1 = dramLineIdx + 16'h0001;
	reg [14:0] clReadIdx;
	wire [17:0] rdLineBytes = {io_xsize, 2'h0};
	reg [63:0] rdLineElemBeginAddr;
	wire [63:0] _GEN_0 = rdLineElemBeginAddr % 64'h0000000000000008;
	wire [3:0] rd1stPulseOffsetBytes = _GEN_0[3:0];
	wire [17:0] _GEN_30 = {14'd0, rd1stPulseOffsetBytes};
	wire [17:0] _rdLineClNb_T_1 = rdLineBytes + _GEN_30;
	wire [17:0] _GEN_1 = _rdLineClNb_T_1 % 18'h00008;
	wire [3:0] _rdLineClNb_T_2 = _GEN_1[3:0];
	wire [14:0] rdLineClNbTmp = _rdLineClNb_T_1[17:3];
	wire [14:0] _rdLineClNb_T_5 = rdLineClNbTmp + 15'h0001;
	wire [14:0] rdLineClNb = (_rdLineClNb_T_2 == 4'h0 ? rdLineClNbTmp : _rdLineClNb_T_5);
	wire newReadRow = clReadIdx == 15'h0000;
	wire [14:0] clRemained = rdLineClNb - clReadIdx;
	wire [63:0] rdLineClBeginAddr = rdLineElemBeginAddr & 64'hfffffffffffffff8;
	wire [63:0] _GEN_2 = rdLineClBeginAddr % 64'h0000000000000800;
	wire [11:0] _rdLen1stMaxTransBytes_T = _GEN_2[11:0];
	wire [11:0] rdLen1stMaxTransBytes = 12'h800 - _rdLen1stMaxTransBytes_T;
	wire [8:0] rdLen1stMaxTransClNb = rdLen1stMaxTransBytes[11:3];
	wire [14:0] _GEN_32 = {6'd0, rdLen1stMaxTransClNb};
	wire [14:0] _GEN_16 = (clRemained < _GEN_32 ? clRemained : {6'd0, rdLen1stMaxTransClNb});
	wire [14:0] _GEN_17 = (clRemained < 15'h0100 ? clRemained : 15'h0100);
	wire [14:0] _GEN_18 = (newReadRow ? _GEN_16 : _GEN_17);
	wire [8:0] rdLen = _GEN_18[8:0];
	wire [14:0] _GEN_33 = {6'd0, rdLen};
	wire [14:0] _T_28 = rdLineClNb - _GEN_33;
	wire _T_29 = clReadIdx == _T_28;
	wire [15:0] _T_31 = io_ysize - 16'h0001;
	wire stride = ((clReadIdx == _T_28) & (dramLineIdx != _T_31)) & io_updateState;
	wire [33:0] _dramInitialAddr_T = {io_dram_offset, 2'h0};
	wire [63:0] dramInitialAddr = {30'd0, _dramInitialAddr_T};
	wire [63:0] xferElemInitAddr = io_baddr | dramInitialAddr;
	wire [63:0] xferClInitAddr = xferElemInitAddr & 64'hfffffffffffffff8;
	wire [17:0] _nextLineBeginElemAddr_T = {io_xstride, 2'h0};
	wire [63:0] _GEN_34 = {46'd0, _nextLineBeginElemAddr_T};
	wire [63:0] nextLineBeginElemAddr = rdLineElemBeginAddr + _GEN_34;
	wire [63:0] nextLineBeginClAddr = nextLineBeginElemAddr & 64'hfffffffffffffff8;
	reg [63:0] rdLineAddr;
	wire [11:0] _rdLineAddr_T = {rdLen, 3'h0};
	wire [63:0] _GEN_35 = {52'd0, _rdLineAddr_T};
	wire [63:0] _rdLineAddr_T_2 = rdLineAddr + _GEN_35;
	wire _T_3 = ~rst;
	wire [63:0] _GEN_36 = {46'd0, rdLineBytes};
	wire [63:0] _rdLastPulseBytes_T_1 = rdLineElemBeginAddr + _GEN_36;
	wire [63:0] _GEN_3 = _rdLastPulseBytes_T_1 % 64'h0000000000000008;
	wire [3:0] rdLastPulseBytes = _GEN_3[3:0];
	wire [1:0] rdLastPulseTensNb = (rdLastPulseBytes[3:2] == 2'h0 ? 2'h2 : rdLastPulseBytes[3:2]);
	reg [10:0] rdCmdStartIdx;
	reg commandsDone;
	wire [14:0] nextClIdx = clReadIdx + _GEN_33;
	wire _GEN_7 = ((nextClIdx == rdLineClNb) & (dramLineIdx == _T_31)) | commandsDone;
	wire _GEN_9 = (io_updateState ? _GEN_7 : commandsDone);
	wire _GEN_11 = (io_start | stride ? 1'h0 : _GEN_9);
	wire [1:0] rdCmd1stPluseOffsetTensNb = (newReadRow ? rd1stPulseOffsetBytes[3:2] : 2'h0);
	wire [1:0] rdCmdLastPluseTensNb = (_T_29 ? rdLastPulseTensNb : 2'h2);
	wire [15:0] _GEN_40 = {12'd0, io_xpad_0};
	wire [15:0] _totalWidth_T_1 = io_xsize + _GEN_40;
	wire [15:0] _GEN_41 = {12'd0, io_xpad_1};
	wire [15:0] totalWidth = _totalWidth_T_1 + _GEN_41;
	reg [19:0] currentRowIdx;
	wire [19:0] _GEN_42 = {16'd0, io_ypad_0};
	wire [15:0] _GEN_43 = {12'd0, io_ypad_0};
	wire [15:0] _rdCmdStartIdxValid_T_2 = io_ysize + _GEN_43;
	wire [19:0] _GEN_44 = {4'd0, _rdCmdStartIdxValid_T_2};
	wire _rdCmdStartIdxValid_T_3 = currentRowIdx < _GEN_44;
	wire _rdCmdStartIdxValid_T_4 = (currentRowIdx >= _GEN_42) & _rdCmdStartIdxValid_T_3;
	wire _rdCmdStartIdxValid_T_5 = _rdCmdStartIdxValid_T_4 & io_isBusy;
	wire _rdCmdStartIdxValid_T_6 = ~commandsDone;
	wire rdCmdStartIdxValid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	wire [15:0] _rdCmdStartIdx_T_1 = io_sram_offset + _GEN_40;
	wire [15:0] _GEN_47 = {5'd0, rdCmdStartIdx};
	wire [15:0] _rdCmdStartIdx_T_3 = _GEN_47 + totalWidth;
	wire [19:0] _currentRowIdx_T_1 = currentRowIdx + 20'h00001;
	wire [15:0] _GEN_19 = (io_isBusy & ((currentRowIdx < _GEN_42) | stride) ? _rdCmdStartIdx_T_3 : {5'd0, rdCmdStartIdx});
	wire [15:0] _GEN_22 = (io_start ? _rdCmdStartIdx_T_1 : _GEN_19);
	wire startIssueCmdRead = newReadRow & rdCmdStartIdxValid;
	reg [10:0] rdCmdDestElemIdxNext;
	wire [9:0] _rdCmdTransactionTensNb_T = {rdLen, 1'h0};
	wire [9:0] _GEN_48 = {8'd0, rdCmd1stPluseOffsetTensNb};
	wire [9:0] rdCmdTransactionTensNb = _rdCmdTransactionTensNb_T - _GEN_48;
	wire [10:0] _GEN_49 = {1'd0, rdCmdTransactionTensNb};
	wire [10:0] _rdCmdDestElemIdxNext_T_1 = rdCmdStartIdx + _GEN_49;
	wire [10:0] _rdCmdDestElemIdxNext_T_3 = rdCmdDestElemIdxNext + _GEN_49;
	wire [10:0] _GEN_25 = (startIssueCmdRead ? rdCmdStartIdx : rdCmdDestElemIdxNext);
	wire [10:0] rdCmdDestElemIdx = (rdCmdStartIdxValid ? _GEN_25 : rdCmdDestElemIdxNext);
	wire [8:0] _io_vmeCmd_bits_len_T_1 = rdLen - 9'h001;
	wire [63:0] _GEN_4 = rdLineAddr % 64'h0000000000000800;
	wire [11:0] _T_49 = _GEN_4[11:0];
	wire [11:0] _T_51 = 12'h800 - _T_49;
	wire [14:0] _io_vmeCmd_bits_tag_T_1 = {rdCmdDestElemIdx, rdCmd1stPluseOffsetTensNb, rdCmdLastPluseTensNb};
	assign io_vmeCmd_valid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	assign io_vmeCmd_bits_addr = rdLineAddr;
	assign io_vmeCmd_bits_len = _io_vmeCmd_bits_len_T_1[7:0];
	assign io_vmeCmd_bits_tag = {6'd0, _io_vmeCmd_bits_tag_T_1};
	assign io_readLen = _GEN_18[8:0];
	assign io_done = commandsDone;
	always @(posedge clk) begin
		if (io_start)
			dramLineIdx <= 16'h0000;
		else if (stride)
			dramLineIdx <= _dramLineIdx_T_1;
		if (io_start | stride)
			clReadIdx <= 15'h0000;
		else if (io_updateState)
			clReadIdx <= nextClIdx;
		if (io_start)
			rdLineElemBeginAddr <= xferElemInitAddr;
		else if (stride)
			rdLineElemBeginAddr <= nextLineBeginElemAddr;
		if (io_start)
			rdLineAddr <= xferClInitAddr;
		else if (io_updateState) begin
			if (stride)
				rdLineAddr <= nextLineBeginClAddr;
			else
				rdLineAddr <= _rdLineAddr_T_2;
		end
		rdCmdStartIdx <= _GEN_22[10:0];
		commandsDone <= rst | _GEN_11;
		if (io_start)
			currentRowIdx <= 20'h00000;
		else if (io_isBusy & ((currentRowIdx < _GEN_42) | stride))
			currentRowIdx <= _currentRowIdx_T_1;
		if (rdCmdStartIdxValid) begin
			if (startIssueCmdRead)
				rdCmdDestElemIdxNext <= _rdCmdDestElemIdxNext_T_1;
			else if (io_updateState)
				rdCmdDestElemIdxNext <= _rdCmdDestElemIdxNext_T_3;
		end
		if (~rst & ~(rd1stPulseOffsetBytes[3:2] <= 2'h2))
			$fwrite(32'h80000002, "Assertion failed: -F- Expecting the number of tensors to skip in CL\n    at TensorLoadWideVME.scala:563 assert(rd1stPulseOffsetBytes >> log2Ceil(elemBytes) <= tp.clSizeRatio.U,\n");
		if (_T_3 & ~(rdLastPulseBytes[3:2] <= 2'h2))
			$fwrite(32'h80000002, "Assertion failed: -F- Expecting the number of active tensors in CL\n    at TensorLoadWideVME.scala:574 assert(rdLastPulseBytes >> log2Ceil(elemBytes) <= (clBytes/elemBytes).U,\n");
		if (_T_3 & ~(~io_isBusy | (rdLineClNb >= clReadIdx)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadWideVME.scala:641 assert(!io.isBusy || rdLineClNb >= clReadIdx)// define how many cachelines to read at this cycle\n");
		if (_T_3 & ~(~io_vmeCmd_valid | (_rdLineAddr_T <= _T_51)))
			$fwrite(32'h80000002, "Assertion failed: -F- uop DRAM page alignment failure. DRAM address + len overlaps mp.lenBits*memBlockSize alignment %x %x\n    at TensorLoadWideVME.scala:717 assert(!io.vmeCmd.valid || ((rdLen << log2Ceil(clBytes)) <= maxTrBytes - rdLineAddr %% maxTrBytes),\n", rdLineAddr, rdLen);
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_3)
			;
		if (_T_3)
			;
		if (_T_3)
			;
	end
endmodule
module GenVMECmdWideTL (
	clk,
	rst,
	io_start,
	io_isBusy,
	io_inst,
	io_baddr,
	io_vmeCmd_ready,
	io_vmeCmd_valid,
	io_vmeCmd_bits_addr,
	io_vmeCmd_bits_len,
	io_vmeCmd_bits_tag,
	io_readLen,
	io_done
);
	input clk;
	input rst;
	input io_start;
	input io_isBusy;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vmeCmd_ready;
	output wire io_vmeCmd_valid;
	output wire [63:0] io_vmeCmd_bits_addr;
	output wire [7:0] io_vmeCmd_bits_len;
	output wire [20:0] io_vmeCmd_bits_tag;
	output wire [8:0] io_readLen;
	output wire io_done;
	wire cmdGen_clock;
	wire cmdGen_reset;
	wire cmdGen_io_start;
	wire cmdGen_io_isBusy;
	wire cmdGen_io_updateState;
	wire [63:0] cmdGen_io_baddr;
	wire cmdGen_io_vmeCmd_valid;
	wire [63:0] cmdGen_io_vmeCmd_bits_addr;
	wire [7:0] cmdGen_io_vmeCmd_bits_len;
	wire [20:0] cmdGen_io_vmeCmd_bits_tag;
	wire [8:0] cmdGen_io_readLen;
	wire cmdGen_io_done;
	wire [15:0] cmdGen_io_ysize;
	wire [15:0] cmdGen_io_xsize;
	wire [15:0] cmdGen_io_xstride;
	wire [31:0] cmdGen_io_dram_offset;
	wire [15:0] cmdGen_io_sram_offset;
	wire [3:0] cmdGen_io_xpad_0;
	wire [3:0] cmdGen_io_xpad_1;
	wire [3:0] cmdGen_io_ypad_0;
	GenVMECmdWide cmdGen(
		.clk(cmdGen_clock),
		.rst(cmdGen_reset),
		.io_start(cmdGen_io_start),
		.io_isBusy(cmdGen_io_isBusy),
		.io_updateState(cmdGen_io_updateState),
		.io_baddr(cmdGen_io_baddr),
		.io_vmeCmd_valid(cmdGen_io_vmeCmd_valid),
		.io_vmeCmd_bits_addr(cmdGen_io_vmeCmd_bits_addr),
		.io_vmeCmd_bits_len(cmdGen_io_vmeCmd_bits_len),
		.io_vmeCmd_bits_tag(cmdGen_io_vmeCmd_bits_tag),
		.io_readLen(cmdGen_io_readLen),
		.io_done(cmdGen_io_done),
		.io_ysize(cmdGen_io_ysize),
		.io_xsize(cmdGen_io_xsize),
		.io_xstride(cmdGen_io_xstride),
		.io_dram_offset(cmdGen_io_dram_offset),
		.io_sram_offset(cmdGen_io_sram_offset),
		.io_xpad_0(cmdGen_io_xpad_0),
		.io_xpad_1(cmdGen_io_xpad_1),
		.io_ypad_0(cmdGen_io_ypad_0)
	);
	assign io_vmeCmd_valid = cmdGen_io_vmeCmd_valid;
	assign io_vmeCmd_bits_addr = cmdGen_io_vmeCmd_bits_addr;
	assign io_vmeCmd_bits_len = cmdGen_io_vmeCmd_bits_len;
	assign io_vmeCmd_bits_tag = cmdGen_io_vmeCmd_bits_tag;
	assign io_readLen = cmdGen_io_readLen;
	assign io_done = cmdGen_io_done;
	assign cmdGen_clock = clk;
	assign cmdGen_reset = rst;
	assign cmdGen_io_start = io_start;
	assign cmdGen_io_isBusy = io_isBusy;
	assign cmdGen_io_updateState = io_vmeCmd_ready & io_vmeCmd_valid;
	assign cmdGen_io_baddr = io_baddr;
	assign cmdGen_io_ysize = io_inst[79:64];
	assign cmdGen_io_xsize = io_inst[95:80];
	assign cmdGen_io_xstride = io_inst[111:96];
	assign cmdGen_io_dram_offset = io_inst[57:26];
	assign cmdGen_io_sram_offset = io_inst[25:10];
	assign cmdGen_io_xpad_0 = io_inst[123:120];
	assign cmdGen_io_xpad_1 = io_inst[127:124];
	assign cmdGen_io_ypad_0 = io_inst[115:112];
endmodule
module ReadVMEDataWide (
	clk,
	rst,
	io_start,
	io_vmeData_ready,
	io_vmeData_valid,
	io_vmeData_bits_data,
	io_vmeData_bits_tag,
	io_vmeData_bits_last,
	io_destIdx_0,
	io_destIdx_1,
	io_destData_0,
	io_destData_1,
	io_destMask_0,
	io_destMask_1
);
	input clk;
	input rst;
	input io_start;
	output wire io_vmeData_ready;
	input io_vmeData_valid;
	input [63:0] io_vmeData_bits_data;
	input [20:0] io_vmeData_bits_tag;
	input io_vmeData_bits_last;
	output wire [10:0] io_destIdx_0;
	output wire [10:0] io_destIdx_1;
	output wire [31:0] io_destData_0;
	output wire [31:0] io_destData_1;
	output wire io_destMask_0;
	output wire io_destMask_1;
	reg [20:0] vmeTagDecodeLast;
	wire [16:0] rdDataElemIdx = io_vmeData_bits_tag[20:4];
	wire [1:0] rdFstOffsetNb = io_vmeData_bits_tag[3:2];
	wire [1:0] rdLstNb = io_vmeData_bits_tag[1:0];
	wire [1:0] _wrMask1st_T_1 = 2'h2 - rdFstOffsetNb;
	wire _wrMask1st_T_2 = 2'h0 < _wrMask1st_T_1;
	wire _wrMask1st_T_5 = 2'h1 < _wrMask1st_T_1;
	wire [1:0] _wrMask1st_T_6 = {_wrMask1st_T_5, _wrMask1st_T_2};
	wire [1:0] wrMask1st = {_wrMask1st_T_6[0], _wrMask1st_T_6[1]};
	wire _wrMaskLast_T = 2'h0 < rdLstNb;
	wire _wrMaskLast_T_1 = 2'h1 < rdLstNb;
	wire [1:0] wrMaskLast = {_wrMaskLast_T_1, _wrMaskLast_T};
	reg [10:0] rdDataElemDestIdxNext;
	wire _T_1 = io_vmeData_ready & io_vmeData_valid;
	reg vmeTagDecodeLastValidNext;
	wire _T_3 = io_vmeData_bits_tag != vmeTagDecodeLast;
	wire _T_4 = vmeTagDecodeLastValidNext & _T_3;
	wire _T_5 = ~vmeTagDecodeLastValidNext | _T_4;
	wire [16:0] _GEN_4 = (_T_5 ? rdDataElemIdx : {6'd0, rdDataElemDestIdxNext});
	wire [10:0] rdDataElemDestIdx = _GEN_4[10:0];
	wire [9:0] rdDataClDestIdx = rdDataElemDestIdx[10:1];
	wire [10:0] _GEN_1 = rdDataElemDestIdx % 11'h002;
	wire [1:0] rdDataDestElemOffset = _GEN_1[1:0];
	wire _GEN_0 = _T_1 | vmeTagDecodeLastValidNext;
	wire isFirstPulse = _T_1 & _T_5;
	wire _wmaskSel_T = isFirstPulse & io_vmeData_bits_last;
	wire [1:0] _wmaskSel_T_1 = wrMask1st & wrMaskLast;
	wire [1:0] _wmaskSel_T_2 = (io_vmeData_bits_last ? wrMaskLast : 2'h3);
	wire [1:0] _wmaskSel_T_3 = (isFirstPulse ? wrMask1st : _wmaskSel_T_2);
	wire [1:0] wmaskSel = (_wmaskSel_T ? _wmaskSel_T_1 : _wmaskSel_T_3);
	wire [1:0] wmask = (_T_1 ? wmaskSel : 2'h0);
	wire [1:0] _rdDataElemDestIdxNext_T_2 = wmask[0] + wmask[1];
	wire [16:0] _GEN_10 = {15'd0, _rdDataElemDestIdxNext_T_2};
	wire [16:0] _rdDataElemDestIdxNext_T_5 = rdDataElemIdx + _GEN_10;
	wire [10:0] _GEN_11 = {9'd0, _rdDataElemDestIdxNext_T_2};
	wire [10:0] _rdDataElemDestIdxNext_T_11 = rdDataElemDestIdxNext + _GEN_11;
	wire [16:0] _GEN_5 = (_T_5 ? _rdDataElemDestIdxNext_T_5 : {6'd0, _rdDataElemDestIdxNext_T_11});
	wire [16:0] _GEN_9 = (_T_1 ? _GEN_5 : {6'd0, rdDataElemDestIdxNext});
	wire [31:0] srcData_0 = io_vmeData_bits_data[31:0];
	wire [31:0] srcData_1 = io_vmeData_bits_data[63:32];
	wire [1:0] _srcOffset_0_T = (isFirstPulse ? rdFstOffsetNb : 2'h0);
	wire [2:0] _srcOffset_0_T_1 = {1'd0, _srcOffset_0_T};
	wire [1:0] srcOffset_0 = _srcOffset_0_T_1[1:0];
	wire [1:0] _srcIdx_0_T_1 = srcOffset_0 - rdDataDestElemOffset;
	wire srcIdx_0 = _srcIdx_0_T_1[0];
	wire [1:0] srcIdxOH = 2'h1 << srcIdx_0;
	wire [31:0] _io_destData_0_T_2 = (srcIdxOH[0] ? srcData_0 : 32'h00000000);
	wire [31:0] _io_destData_0_T_3 = (srcIdxOH[1] ? srcData_1 : 32'h00000000);
	wire [1:0] _io_destMask_0_T = srcIdxOH & wmask;
	wire incrIdx = (srcOffset_0 >= rdDataDestElemOffset ? 1'h0 : 1'h1);
	wire [9:0] _GEN_12 = {9'd0, incrIdx};
	wire [9:0] _io_destIdx_0_T_1 = rdDataClDestIdx + _GEN_12;
	wire [1:0] srcOffset_1 = 2'h1 + _srcOffset_0_T;
	wire [1:0] _srcIdx_1_T_1 = srcOffset_1 - rdDataDestElemOffset;
	wire srcIdx_1 = _srcIdx_1_T_1[0];
	wire [1:0] srcIdxOH_1 = 2'h1 << srcIdx_1;
	wire [31:0] _io_destData_1_T_2 = (srcIdxOH_1[0] ? srcData_0 : 32'h00000000);
	wire [31:0] _io_destData_1_T_3 = (srcIdxOH_1[1] ? srcData_1 : 32'h00000000);
	wire [1:0] _io_destMask_1_T = srcIdxOH_1 & wmask;
	wire incrIdx_1 = (srcOffset_1 >= rdDataDestElemOffset ? 1'h0 : 1'h1);
	wire [9:0] _GEN_13 = {9'd0, incrIdx_1};
	wire [9:0] _io_destIdx_1_T_1 = rdDataClDestIdx + _GEN_13;
	assign io_vmeData_ready = 1'h1;
	assign io_destIdx_0 = {1'd0, _io_destIdx_0_T_1};
	assign io_destIdx_1 = {1'd0, _io_destIdx_1_T_1};
	assign io_destData_0 = _io_destData_0_T_2 | _io_destData_0_T_3;
	assign io_destData_1 = _io_destData_1_T_2 | _io_destData_1_T_3;
	assign io_destMask_0 = |_io_destMask_0_T;
	assign io_destMask_1 = |_io_destMask_1_T;
	always @(posedge clk) begin
		if (_T_1) begin
			if (_T_5)
				vmeTagDecodeLast <= io_vmeData_bits_tag;
		end
		rdDataElemDestIdxNext <= _GEN_9[10:0];
		if (rst)
			vmeTagDecodeLastValidNext <= 1'h0;
		else if (io_start)
			vmeTagDecodeLastValidNext <= 1'h0;
		else
			vmeTagDecodeLastValidNext <= _GEN_0;
		if (~rst & ~(~io_vmeData_valid | (rdLstNb > 2'h0)))
			$fwrite(32'h80000002, "Assertion failed: -F- Expecting some elements to read\n    at TensorLoadWideVME.scala:367 assert(!io.vmeData.valid || readNb > 0.U,\"-F- Expecting some elements to read\")\n");
	end
	always @(posedge clk)
		if (~rst)
			;
endmodule
module TensorLoadWideVME (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_vme_rd_data_bits_last,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_vme_rd_data_bits_last;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [31:0] io_tensor_rd_0_data_bits_0_0;
	wire vmeCmd_clock;
	wire vmeCmd_reset;
	wire vmeCmd_io_start;
	wire vmeCmd_io_isBusy;
	wire [127:0] vmeCmd_io_inst;
	wire [63:0] vmeCmd_io_baddr;
	wire vmeCmd_io_vmeCmd_ready;
	wire vmeCmd_io_vmeCmd_valid;
	wire [63:0] vmeCmd_io_vmeCmd_bits_addr;
	wire [7:0] vmeCmd_io_vmeCmd_bits_len;
	wire [20:0] vmeCmd_io_vmeCmd_bits_tag;
	wire [8:0] vmeCmd_io_readLen;
	wire vmeCmd_io_done;
	wire readData_clock;
	wire readData_reset;
	wire readData_io_start;
	wire readData_io_vmeData_ready;
	wire readData_io_vmeData_valid;
	wire [63:0] readData_io_vmeData_bits_data;
	wire [20:0] readData_io_vmeData_bits_tag;
	wire readData_io_vmeData_bits_last;
	wire [10:0] readData_io_destIdx_0;
	wire [10:0] readData_io_destIdx_1;
	wire [31:0] readData_io_destData_0;
	wire [31:0] readData_io_destData_1;
	wire readData_io_destMask_0;
	wire readData_io_destMask_1;
	wire fillPadding_clock;
	wire fillPadding_reset;
	wire fillPadding_io_canWriteMem;
	wire [127:0] fillPadding_io_inst;
	wire fillPadding_io_tensorIdx_valid;
	wire [10:0] fillPadding_io_tensorIdx_bits;
	wire fillPadding_io_start;
	wire fillPadding_io_done;
	reg [31:0] tensorFile_0 [0:1023];
	wire tensorFile_0_rdataVec_MPORT_en;
	wire [9:0] tensorFile_0_rdataVec_MPORT_addr;
	wire [31:0] tensorFile_0_rdataVec_MPORT_data;
	wire [31:0] tensorFile_0_MPORT_data;
	wire [9:0] tensorFile_0_MPORT_addr;
	wire tensorFile_0_MPORT_mask;
	wire tensorFile_0_MPORT_en;
	reg tensorFile_0_rdataVec_MPORT_en_pipe_0;
	reg [9:0] tensorFile_0_rdataVec_MPORT_addr_pipe_0;
	reg [31:0] tensorFile_1 [0:1023];
	wire tensorFile_1_rdataVec_MPORT_1_en;
	wire [9:0] tensorFile_1_rdataVec_MPORT_1_addr;
	wire [31:0] tensorFile_1_rdataVec_MPORT_1_data;
	wire [31:0] tensorFile_1_MPORT_1_data;
	wire [9:0] tensorFile_1_MPORT_1_addr;
	wire tensorFile_1_MPORT_1_mask;
	wire tensorFile_1_MPORT_1_en;
	reg tensorFile_1_rdataVec_MPORT_1_en_pipe_0;
	reg [9:0] tensorFile_1_rdataVec_MPORT_1_addr_pipe_0;
	reg state;
	reg [10:0] clInFlight;
	wire loadDone = ((clInFlight == 11'h000) & vmeCmd_io_done) & state;
	wire localDone = loadDone & fillPadding_io_done;
	wire _GEN_0 = (localDone ? 1'h0 : state);
	wire _GEN_1 = io_start | _GEN_0;
	wire vmeDataFirePipe = io_vme_rd_data_valid & io_vme_rd_data_ready;
	wire _T = io_vme_rd_cmd_ready & io_vme_rd_cmd_valid;
	wire _T_1 = state & _T;
	wire _T_3 = (state & _T) & ~vmeDataFirePipe;
	wire [10:0] _GEN_26 = {2'd0, vmeCmd_io_readLen};
	wire [10:0] _clInFlight_T_1 = clInFlight + _GEN_26;
	wire _T_6 = _T_1 & vmeDataFirePipe;
	wire [10:0] _clInFlight_T_5 = _clInFlight_T_1 - 11'h001;
	wire _T_10 = (state & ~_T) & vmeDataFirePipe;
	wire _T_13 = ~rst;
	wire [10:0] _clInFlight_T_7 = clInFlight - 11'h001;
	wire [9:0] zpDestIdx = fillPadding_io_tensorIdx_bits[10:1];
	wire [1:0] zpDestMask = 2'h1 << fillPadding_io_tensorIdx_bits[0];
	wire _wmask_0_T = ~state;
	wire _wmask_0_T_3 = vmeDataFirePipe & readData_io_destMask_0;
	wire _wmask_0_T_4 = (fillPadding_io_tensorIdx_valid ? zpDestMask[0] : _wmask_0_T_3);
	wire _wmask_1_T_3 = vmeDataFirePipe & readData_io_destMask_1;
	wire _wmask_1_T_4 = (fillPadding_io_tensorIdx_valid ? zpDestMask[1] : _wmask_1_T_3);
	wire [31:0] _wdata_0_WIRE_2 = readData_io_destData_0;
	wire [31:0] _wdata_0_T_2 = (fillPadding_io_tensorIdx_valid ? 32'h00000000 : _wdata_0_WIRE_2);
	wire [31:0] _wdata_1_WIRE_2 = readData_io_destData_1;
	wire [31:0] _wdata_1_T_2 = (fillPadding_io_tensorIdx_valid ? 32'h00000000 : _wdata_1_WIRE_2);
	wire [10:0] _widx_0_T_1 = (fillPadding_io_tensorIdx_valid ? {1'd0, zpDestIdx} : readData_io_destIdx_0);
	wire [10:0] widx_0 = (_wmask_0_T ? 11'h000 : _widx_0_T_1);
	wire [10:0] _widx_1_T_1 = (fillPadding_io_tensorIdx_valid ? {1'd0, zpDestIdx} : readData_io_destIdx_1);
	wire [10:0] widx_1 = (_wmask_0_T ? 11'h000 : _widx_1_T_1);
	wire [1:0] _rMask_T_1 = 2'h1 << io_tensor_rd_0_idx_bits[0];
	wire [1:0] rMask = (io_tensor_rd_0_idx_valid ? _rMask_T_1 : 2'h0);
	reg [1:0] rdata_r;
	wire [31:0] _rdataVec_WIRE_2_0 = tensorFile_0_rdataVec_MPORT_data;
	wire [31:0] _rdata_T_2 = (rdata_r[0] ? _rdataVec_WIRE_2_0 : 32'h00000000);
	wire [31:0] _rdataVec_WIRE_5_0 = tensorFile_1_rdataVec_MPORT_1_data;
	wire [31:0] _rdata_T_3 = (rdata_r[1] ? _rdataVec_WIRE_5_0 : 32'h00000000);
	reg rvalid;
	GenVMECmdWideTL vmeCmd(
		.clk(vmeCmd_clock),
		.rst(vmeCmd_reset),
		.io_start(vmeCmd_io_start),
		.io_isBusy(vmeCmd_io_isBusy),
		.io_inst(vmeCmd_io_inst),
		.io_baddr(vmeCmd_io_baddr),
		.io_vmeCmd_ready(vmeCmd_io_vmeCmd_ready),
		.io_vmeCmd_valid(vmeCmd_io_vmeCmd_valid),
		.io_vmeCmd_bits_addr(vmeCmd_io_vmeCmd_bits_addr),
		.io_vmeCmd_bits_len(vmeCmd_io_vmeCmd_bits_len),
		.io_vmeCmd_bits_tag(vmeCmd_io_vmeCmd_bits_tag),
		.io_readLen(vmeCmd_io_readLen),
		.io_done(vmeCmd_io_done)
	);
	ReadVMEDataWide readData(
		.clk(readData_clock),
		.rst(readData_reset),
		.io_start(readData_io_start),
		.io_vmeData_ready(readData_io_vmeData_ready),
		.io_vmeData_valid(readData_io_vmeData_valid),
		.io_vmeData_bits_data(readData_io_vmeData_bits_data),
		.io_vmeData_bits_tag(readData_io_vmeData_bits_tag),
		.io_vmeData_bits_last(readData_io_vmeData_bits_last),
		.io_destIdx_0(readData_io_destIdx_0),
		.io_destIdx_1(readData_io_destIdx_1),
		.io_destData_0(readData_io_destData_0),
		.io_destData_1(readData_io_destData_1),
		.io_destMask_0(readData_io_destMask_0),
		.io_destMask_1(readData_io_destMask_1)
	);
	ZeroPadding fillPadding(
		.clk(fillPadding_clock),
		.rst(fillPadding_reset),
		.io_canWriteMem(fillPadding_io_canWriteMem),
		.io_inst(fillPadding_io_inst),
		.io_tensorIdx_valid(fillPadding_io_tensorIdx_valid),
		.io_tensorIdx_bits(fillPadding_io_tensorIdx_bits),
		.io_start(fillPadding_io_start),
		.io_done(fillPadding_io_done)
	);
	assign tensorFile_0_rdataVec_MPORT_en = tensorFile_0_rdataVec_MPORT_en_pipe_0;
	assign tensorFile_0_rdataVec_MPORT_addr = tensorFile_0_rdataVec_MPORT_addr_pipe_0;
	assign tensorFile_0_rdataVec_MPORT_data = tensorFile_0[tensorFile_0_rdataVec_MPORT_addr];
	assign tensorFile_0_MPORT_data = (_wmask_0_T ? 32'h00000000 : _wdata_0_T_2);
	assign tensorFile_0_MPORT_addr = widx_0[9:0];
	assign tensorFile_0_MPORT_mask = 1'h1;
	assign tensorFile_0_MPORT_en = (_wmask_0_T ? 1'h0 : _wmask_0_T_4);
	assign tensorFile_1_rdataVec_MPORT_1_en = tensorFile_1_rdataVec_MPORT_1_en_pipe_0;
	assign tensorFile_1_rdataVec_MPORT_1_addr = tensorFile_1_rdataVec_MPORT_1_addr_pipe_0;
	assign tensorFile_1_rdataVec_MPORT_1_data = tensorFile_1[tensorFile_1_rdataVec_MPORT_1_addr];
	assign tensorFile_1_MPORT_1_data = (_wmask_0_T ? 32'h00000000 : _wdata_1_T_2);
	assign tensorFile_1_MPORT_1_addr = widx_1[9:0];
	assign tensorFile_1_MPORT_1_mask = 1'h1;
	assign tensorFile_1_MPORT_1_en = (_wmask_0_T ? 1'h0 : _wmask_1_T_4);
	assign io_done = loadDone & fillPadding_io_done;
	assign io_vme_rd_cmd_valid = vmeCmd_io_vmeCmd_valid;
	assign io_vme_rd_cmd_bits_addr = vmeCmd_io_vmeCmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = vmeCmd_io_vmeCmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = vmeCmd_io_vmeCmd_bits_tag;
	assign io_vme_rd_data_ready = 1'h1;
	assign io_tensor_rd_0_data_valid = rvalid;
	assign io_tensor_rd_0_data_bits_0_0 = _rdata_T_2 | _rdata_T_3;
	assign vmeCmd_clock = clk;
	assign vmeCmd_reset = rst;
	assign vmeCmd_io_start = io_start;
	assign vmeCmd_io_isBusy = state;
	assign vmeCmd_io_inst = io_inst;
	assign vmeCmd_io_baddr = io_baddr;
	assign vmeCmd_io_vmeCmd_ready = io_vme_rd_cmd_ready;
	assign readData_clock = clk;
	assign readData_reset = rst;
	assign readData_io_start = io_start;
	assign readData_io_vmeData_valid = io_vme_rd_data_valid;
	assign readData_io_vmeData_bits_data = io_vme_rd_data_bits_data;
	assign readData_io_vmeData_bits_tag = io_vme_rd_data_bits_tag;
	assign readData_io_vmeData_bits_last = io_vme_rd_data_bits_last;
	assign fillPadding_clock = clk;
	assign fillPadding_reset = rst;
	assign fillPadding_io_canWriteMem = ~vmeDataFirePipe;
	assign fillPadding_io_inst = io_inst;
	assign fillPadding_io_start = io_start;
	always @(posedge clk) begin
		if (tensorFile_0_MPORT_en & tensorFile_0_MPORT_mask)
			tensorFile_0[tensorFile_0_MPORT_addr] <= tensorFile_0_MPORT_data;
		tensorFile_0_rdataVec_MPORT_en_pipe_0 <= rMask[0];
		if (rMask[0])
			tensorFile_0_rdataVec_MPORT_addr_pipe_0 <= io_tensor_rd_0_idx_bits[10:1];
		if (tensorFile_1_MPORT_1_en & tensorFile_1_MPORT_1_mask)
			tensorFile_1[tensorFile_1_MPORT_1_addr] <= tensorFile_1_MPORT_1_data;
		tensorFile_1_rdataVec_MPORT_1_en_pipe_0 <= rMask[1];
		if (rMask[1])
			tensorFile_1_rdataVec_MPORT_1_addr_pipe_0 <= io_tensor_rd_0_idx_bits[10:1];
		if (rst)
			state <= 1'h0;
		else
			state <= _GEN_1;
		if (io_start)
			clInFlight <= 11'h000;
		else if ((state & _T) & ~vmeDataFirePipe)
			clInFlight <= _clInFlight_T_1;
		else if (_T_1 & vmeDataFirePipe)
			clInFlight <= _clInFlight_T_5;
		else if ((state & ~_T) & vmeDataFirePipe)
			clInFlight <= _clInFlight_T_7;
		if (io_tensor_rd_0_idx_valid)
			rdata_r <= _rMask_T_1;
		else
			rdata_r <= 2'h0;
		if (rst)
			rvalid <= 1'h0;
		else
			rvalid <= io_tensor_rd_0_idx_valid;
		if (((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst) & ~(clInFlight > 11'h000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadWideVME.scala:140 assert(clInFlight > 0.U)\n");
	end
	always @(posedge clk) begin
		if ((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst)
			;
		if (_T_13)
			;
	end
endmodule
module TensorLoadUop (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_vme_rd_data_bits_last,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_vme_rd_data_bits_last;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [31:0] io_tensor_rd_0_data_bits_0_0;
	wire tensorLoad_clock;
	wire tensorLoad_reset;
	wire tensorLoad_io_start;
	wire tensorLoad_io_done;
	wire [127:0] tensorLoad_io_inst;
	wire [63:0] tensorLoad_io_baddr;
	wire tensorLoad_io_vme_rd_cmd_ready;
	wire tensorLoad_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_io_vme_rd_data_ready;
	wire tensorLoad_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_io_vme_rd_data_bits_tag;
	wire tensorLoad_io_vme_rd_data_bits_last;
	wire tensorLoad_io_tensor_rd_0_idx_valid;
	wire [10:0] tensorLoad_io_tensor_rd_0_idx_bits;
	wire tensorLoad_io_tensor_rd_0_data_valid;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_0;
	TensorLoadWideVME tensorLoad(
		.clk(tensorLoad_clock),
		.rst(tensorLoad_reset),
		.io_start(tensorLoad_io_start),
		.io_done(tensorLoad_io_done),
		.io_inst(tensorLoad_io_inst),
		.io_baddr(tensorLoad_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_ready(tensorLoad_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(tensorLoad_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_io_vme_rd_data_bits_tag),
		.io_vme_rd_data_bits_last(tensorLoad_io_vme_rd_data_bits_last),
		.io_tensor_rd_0_idx_valid(tensorLoad_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_io_tensor_rd_0_data_bits_0_0)
	);
	assign io_done = tensorLoad_io_done;
	assign io_vme_rd_cmd_valid = tensorLoad_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = tensorLoad_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = tensorLoad_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = tensorLoad_io_vme_rd_cmd_bits_tag;
	assign io_tensor_rd_0_data_valid = tensorLoad_io_tensor_rd_0_data_valid;
	assign io_tensor_rd_0_data_bits_0_0 = tensorLoad_io_tensor_rd_0_data_bits_0_0;
	assign tensorLoad_clock = clk;
	assign tensorLoad_reset = rst;
	assign tensorLoad_io_start = io_start;
	assign tensorLoad_io_inst = io_inst;
	assign tensorLoad_io_baddr = io_baddr;
	assign tensorLoad_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign tensorLoad_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign tensorLoad_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign tensorLoad_io_vme_rd_data_bits_tag = io_vme_rd_data_bits_tag;
	assign tensorLoad_io_vme_rd_data_bits_last = io_vme_rd_data_bits_last;
	assign tensorLoad_io_tensor_rd_0_idx_valid = io_tensor_rd_0_idx_valid;
	assign tensorLoad_io_tensor_rd_0_idx_bits = io_tensor_rd_0_idx_bits;
endmodule
module LoadUopTop (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_vme_rd_data_bits_last,
	io_uop_idx_valid,
	io_uop_idx_bits,
	io_uop_data_valid,
	io_uop_data_bits_u2,
	io_uop_data_bits_u1,
	io_uop_data_bits_u0
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_vme_rd_data_bits_last;
	input io_uop_idx_valid;
	input [10:0] io_uop_idx_bits;
	output wire io_uop_data_valid;
	output wire [9:0] io_uop_data_bits_u2;
	output wire [10:0] io_uop_data_bits_u1;
	output wire [10:0] io_uop_data_bits_u0;
	wire loadUop_clock;
	wire loadUop_reset;
	wire loadUop_io_start;
	wire loadUop_io_done;
	wire [127:0] loadUop_io_inst;
	wire [63:0] loadUop_io_baddr;
	wire loadUop_io_vme_rd_cmd_ready;
	wire loadUop_io_vme_rd_cmd_valid;
	wire [63:0] loadUop_io_vme_rd_cmd_bits_addr;
	wire [7:0] loadUop_io_vme_rd_cmd_bits_len;
	wire [20:0] loadUop_io_vme_rd_cmd_bits_tag;
	wire loadUop_io_vme_rd_data_valid;
	wire [63:0] loadUop_io_vme_rd_data_bits_data;
	wire [20:0] loadUop_io_vme_rd_data_bits_tag;
	wire loadUop_io_vme_rd_data_bits_last;
	wire loadUop_io_tensor_rd_0_idx_valid;
	wire [10:0] loadUop_io_tensor_rd_0_idx_bits;
	wire loadUop_io_tensor_rd_0_data_valid;
	wire [31:0] loadUop_io_tensor_rd_0_data_bits_0_0;
	wire [31:0] _io_uop_data_bits_WIRE_1 = loadUop_io_tensor_rd_0_data_bits_0_0;
	TensorLoadUop loadUop(
		.clk(loadUop_clock),
		.rst(loadUop_reset),
		.io_start(loadUop_io_start),
		.io_done(loadUop_io_done),
		.io_inst(loadUop_io_inst),
		.io_baddr(loadUop_io_baddr),
		.io_vme_rd_cmd_ready(loadUop_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(loadUop_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(loadUop_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(loadUop_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(loadUop_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_valid(loadUop_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(loadUop_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(loadUop_io_vme_rd_data_bits_tag),
		.io_vme_rd_data_bits_last(loadUop_io_vme_rd_data_bits_last),
		.io_tensor_rd_0_idx_valid(loadUop_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(loadUop_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(loadUop_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(loadUop_io_tensor_rd_0_data_bits_0_0)
	);
	assign io_done = loadUop_io_done;
	assign io_vme_rd_cmd_valid = loadUop_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = loadUop_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = loadUop_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = loadUop_io_vme_rd_cmd_bits_tag;
	assign io_uop_data_valid = loadUop_io_tensor_rd_0_data_valid;
	assign io_uop_data_bits_u2 = _io_uop_data_bits_WIRE_1[31:22];
	assign io_uop_data_bits_u1 = _io_uop_data_bits_WIRE_1[21:11];
	assign io_uop_data_bits_u0 = _io_uop_data_bits_WIRE_1[10:0];
	assign loadUop_clock = clk;
	assign loadUop_reset = rst;
	assign loadUop_io_start = io_start;
	assign loadUop_io_inst = io_inst;
	assign loadUop_io_baddr = io_baddr;
	assign loadUop_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign loadUop_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign loadUop_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign loadUop_io_vme_rd_data_bits_tag = io_vme_rd_data_bits_tag;
	assign loadUop_io_vme_rd_data_bits_last = io_vme_rd_data_bits_last;
	assign loadUop_io_tensor_rd_0_idx_valid = io_uop_idx_valid;
	assign loadUop_io_tensor_rd_0_idx_bits = io_uop_idx_bits;
endmodule
module GenVMECmd_2 (
	clk,
	rst,
	io_start,
	io_isBusy,
	io_inst,
	io_baddr,
	io_vmeCmd_ready,
	io_vmeCmd_valid,
	io_vmeCmd_bits_addr,
	io_vmeCmd_bits_len,
	io_vmeCmd_bits_tag,
	io_readLen,
	io_done
);
	input clk;
	input rst;
	input io_start;
	input io_isBusy;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vmeCmd_ready;
	output wire io_vmeCmd_valid;
	output wire [63:0] io_vmeCmd_bits_addr;
	output wire [7:0] io_vmeCmd_bits_len;
	output wire [20:0] io_vmeCmd_bits_tag;
	output wire [8:0] io_readLen;
	output wire io_done;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [31:0] dec_dram_offset = io_inst[57:26];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [15:0] dec_xstride = io_inst[111:96];
	wire [3:0] dec_ypad_0 = io_inst[115:112];
	wire [3:0] dec_xpad_0 = io_inst[123:120];
	wire [3:0] dec_xpad_1 = io_inst[127:124];
	reg [63:0] rdCmdExtAddr;
	wire [37:0] _xfer_init_addr_T = {dec_dram_offset, 6'h00};
	wire [37:0] _xfer_init_addr_T_1 = 38'h00ffffffff & _xfer_init_addr_T;
	wire [63:0] _GEN_31 = {26'd0, _xfer_init_addr_T_1};
	wire [63:0] xfer_init_addr = io_baddr | _GEN_31;
	wire [63:0] _GEN_0 = rdCmdExtAddr % 64'h0000000000000800;
	wire [11:0] _firstMaxTransfer_T = _GEN_0[11:0];
	wire [11:0] _firstMaxTransfer_T_2 = 12'h800 - _firstMaxTransfer_T;
	wire [8:0] firstMaxTransfer = _firstMaxTransfer_T_2[11:3];
	reg [10:0] rdCmdStartIdx;
	reg commandsDone;
	wire [18:0] blocksReadSize = {dec_xsize, 3'h0};
	reg [18:0] blocksReadNb;
	reg [63:0] rdCmdExtAddrRowBegin;
	reg newReadRow;
	reg [15:0] srcRowIdx;
	wire [15:0] _srcRowIdx_T_1 = srcRowIdx + 16'h0001;
	wire [18:0] blocksRemained = blocksReadSize - blocksReadNb;
	wire [18:0] _GEN_32 = {10'd0, firstMaxTransfer};
	wire [18:0] _GEN_8 = (blocksRemained < _GEN_32 ? blocksRemained : {10'd0, firstMaxTransfer});
	wire [18:0] _GEN_9 = (blocksRemained < 19'h00100 ? blocksRemained : 19'h00100);
	wire [18:0] _GEN_10 = (newReadRow ? _GEN_8 : _GEN_9);
	wire [8:0] readLen = _GEN_10[8:0];
	wire [18:0] _GEN_33 = {10'd0, readLen};
	wire [18:0] _T_8 = blocksReadSize - _GEN_33;
	wire [15:0] _T_11 = dec_ysize - 16'h0001;
	wire _T_14 = io_vmeCmd_ready & io_vmeCmd_valid;
	wire stride = ((blocksReadNb == _T_8) & (srcRowIdx != _T_11)) & _T_14;
	wire [18:0] nextBlRNb = blocksReadNb + _GEN_33;
	wire _GEN_2 = ((nextBlRNb == blocksReadSize) & (srcRowIdx == _T_11)) | commandsDone;
	wire _GEN_4 = (_T_14 ? _GEN_2 : commandsDone);
	wire _GEN_6 = (io_start | stride ? 1'h0 : _GEN_4);
	wire _T_20 = ~rst;
	wire [15:0] _GEN_35 = {12'd0, dec_xpad_0};
	wire [15:0] _totalWidth_T_1 = dec_xsize + _GEN_35;
	wire [15:0] _GEN_36 = {12'd0, dec_xpad_1};
	wire [15:0] totalWidth = _totalWidth_T_1 + _GEN_36;
	reg [19:0] currentRowIdx;
	wire [19:0] _GEN_37 = {16'd0, dec_ypad_0};
	wire [15:0] _GEN_38 = {12'd0, dec_ypad_0};
	wire [15:0] _rdCmdStartIdxValid_T_2 = dec_ysize + _GEN_38;
	wire [19:0] _GEN_39 = {4'd0, _rdCmdStartIdxValid_T_2};
	wire _rdCmdStartIdxValid_T_3 = currentRowIdx < _GEN_39;
	wire _rdCmdStartIdxValid_T_4 = (currentRowIdx >= _GEN_37) & _rdCmdStartIdxValid_T_3;
	wire _rdCmdStartIdxValid_T_5 = _rdCmdStartIdxValid_T_4 & io_isBusy;
	wire _rdCmdStartIdxValid_T_6 = ~commandsDone;
	wire rdCmdStartIdxValid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	wire [15:0] _rdCmdStartIdx_T_1 = dec_sram_offset + _GEN_35;
	wire [15:0] _GEN_42 = {5'd0, rdCmdStartIdx};
	wire [15:0] _rdCmdStartIdx_T_3 = _GEN_42 + totalWidth;
	wire [19:0] _currentRowIdx_T_1 = currentRowIdx + 20'h00001;
	wire [15:0] _GEN_11 = (io_isBusy & ((currentRowIdx < _GEN_37) | stride) ? _rdCmdStartIdx_T_3 : {5'd0, rdCmdStartIdx});
	wire [15:0] _GEN_14 = (io_start ? _rdCmdStartIdx_T_1 : _GEN_11);
	wire startIssueCmdRead = (blocksReadNb == 19'h00000) & rdCmdStartIdxValid;
	wire [21:0] _memRow_T = {dec_xstride, 6'h00};
	wire [63:0] _GEN_43 = {42'd0, _memRow_T};
	wire [63:0] memRow = rdCmdExtAddrRowBegin + _GEN_43;
	wire [11:0] _rdCmdExtAddr_T = {readLen, 3'h0};
	wire [63:0] _GEN_44 = {52'd0, _rdCmdExtAddr_T};
	wire [63:0] _rdCmdExtAddr_T_2 = rdCmdExtAddr + _GEN_44;
	wire _GEN_21 = (_T_14 ? stride : newReadRow);
	reg [13:0] rdCmdDestBlockIdxNext;
	wire [13:0] _rdCmdDestBlockIdx_T = {rdCmdStartIdx, 3'h0};
	wire [13:0] _GEN_26 = (startIssueCmdRead ? _rdCmdDestBlockIdx_T : rdCmdDestBlockIdxNext);
	wire [13:0] rdCmdDestBlockIdx = (rdCmdStartIdxValid ? _GEN_26 : rdCmdDestBlockIdxNext);
	wire [13:0] _GEN_45 = {5'd0, readLen};
	wire [13:0] _rdCmdDestBlockIdxNext_T_1 = rdCmdDestBlockIdx + _GEN_45;
	wire [13:0] _rdCmdDestBlockIdxNext_T_3 = rdCmdDestBlockIdxNext + _GEN_45;
	wire [8:0] _io_vmeCmd_bits_len_T_1 = readLen - 9'h001;
	assign io_vmeCmd_valid = _rdCmdStartIdxValid_T_5 & _rdCmdStartIdxValid_T_6;
	assign io_vmeCmd_bits_addr = rdCmdExtAddr;
	assign io_vmeCmd_bits_len = _io_vmeCmd_bits_len_T_1[7:0];
	assign io_vmeCmd_bits_tag = {7'd0, rdCmdDestBlockIdx};
	assign io_readLen = _GEN_10[8:0];
	assign io_done = commandsDone;
	always @(posedge clk) begin
		if (io_start)
			rdCmdExtAddr <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddr <= memRow;
			else
				rdCmdExtAddr <= _rdCmdExtAddr_T_2;
		end
		rdCmdStartIdx <= _GEN_14[10:0];
		commandsDone <= rst | _GEN_6;
		if (io_start | stride)
			blocksReadNb <= 19'h00000;
		else if (_T_14)
			blocksReadNb <= nextBlRNb;
		if (io_start)
			rdCmdExtAddrRowBegin <= xfer_init_addr;
		else if (_T_14) begin
			if (stride)
				rdCmdExtAddrRowBegin <= memRow;
		end
		newReadRow <= io_start | _GEN_21;
		if (io_start)
			srcRowIdx <= 16'h0000;
		else if (stride)
			srcRowIdx <= _srcRowIdx_T_1;
		if (io_start)
			currentRowIdx <= 20'h00000;
		else if (io_isBusy & ((currentRowIdx < _GEN_37) | stride))
			currentRowIdx <= _currentRowIdx_T_1;
		if (rdCmdStartIdxValid) begin
			if (startIssueCmdRead)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_1;
			else if (_T_14)
				rdCmdDestBlockIdxNext <= _rdCmdDestBlockIdxNext_T_3;
		end
		if (~rst & ~(~io_isBusy | (blocksReadSize >= blocksReadNb)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:627 assert(!io.isBusy || blocksReadSize >= blocksReadNb)// define how many block to read at this cycle\n");
		if (_T_20 & ~(~io_vmeCmd_valid | (_rdCmdExtAddr_T <= _firstMaxTransfer_T_2)))
			$fwrite(32'h80000002, "Assertion failed: -F- acc DRAM page alignment failure. DRAM address + len overlaps mp.lenBits*memBlockSize alignment %x %x\n    at TensorLoadNarrowVME.scala:733 assert(!io.vmeCmd.valid || ((readLen << log2Ceil(mp.dataBits/8)) <= (maxTrBytes - rdCmdExtAddr %% maxTrBytes)),\n", rdCmdExtAddr, readLen);
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_20)
			;
	end
endmodule
module ReadVMEData_2 (
	clk,
	rst,
	io_start,
	io_vmeData_ready,
	io_vmeData_valid,
	io_vmeData_bits_tag,
	io_idx,
	io_col
);
	input clk;
	input rst;
	input io_start;
	output wire io_vmeData_ready;
	input io_vmeData_valid;
	input [20:0] io_vmeData_bits_tag;
	output wire [10:0] io_idx;
	output wire [2:0] io_col;
	reg [20:0] vmeTagDecodeLast;
	wire [17:0] rdDataIdx = io_vmeData_bits_tag[20:3];
	wire [2:0] rdDataCol = io_vmeData_bits_tag[2:0];
	reg [2:0] rdDataDestColNext;
	reg [15:0] rdDataDestIdxNext;
	reg vmeTagDecodeLastValidNext;
	wire _T = io_vmeData_ready & io_vmeData_valid;
	wire _GEN_0 = _T | vmeTagDecodeLastValidNext;
	wire _T_3 = io_vmeData_bits_tag != vmeTagDecodeLast;
	wire _T_4 = vmeTagDecodeLastValidNext & _T_3;
	wire _T_5 = ~vmeTagDecodeLastValidNext | _T_4;
	wire [2:0] _rdDataDestColNext_T_1 = rdDataCol + 3'h1;
	wire [2:0] _rdDataDestColNext_T_3 = rdDataDestColNext + 3'h1;
	wire [2:0] rdDataDestCol = (_T_5 ? rdDataCol : rdDataDestColNext);
	wire [15:0] _rdDataDestIdxNext_T_1 = rdDataDestIdxNext + 16'h0001;
	wire [15:0] _GEN_2 = (rdDataDestCol == 3'h7 ? _rdDataDestIdxNext_T_1 : rdDataDestIdxNext);
	wire [17:0] _GEN_5 = (_T_5 ? rdDataIdx : {2'd0, rdDataDestIdxNext});
	wire [17:0] _GEN_7 = (_T_5 ? rdDataIdx : {2'd0, _GEN_2});
	wire [17:0] _GEN_12 = (_T ? _GEN_7 : {2'd0, rdDataDestIdxNext});
	wire [15:0] rdDataDestIdx = _GEN_5[15:0];
	assign io_vmeData_ready = 1'h1;
	assign io_idx = rdDataDestIdx[10:0];
	assign io_col = (_T_5 ? rdDataCol : rdDataDestColNext);
	always @(posedge clk) begin
		if (_T) begin
			if (_T_5)
				vmeTagDecodeLast <= io_vmeData_bits_tag;
		end
		if (_T) begin
			if (_T_5)
				rdDataDestColNext <= _rdDataDestColNext_T_1;
			else
				rdDataDestColNext <= _rdDataDestColNext_T_3;
		end
		rdDataDestIdxNext <= _GEN_12[15:0];
		if (rst)
			vmeTagDecodeLastValidNext <= 1'h0;
		else if (io_start)
			vmeTagDecodeLastValidNext <= 1'h0;
		else
			vmeTagDecodeLastValidNext <= _GEN_0;
	end
endmodule
module TensorLoadNarrowVME_2 (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_ready,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15,
	io_tensor_wr_0_valid,
	io_tensor_wr_0_bits_idx,
	io_tensor_wr_0_bits_data_0_0,
	io_tensor_wr_0_bits_data_0_1,
	io_tensor_wr_0_bits_data_0_2,
	io_tensor_wr_0_bits_data_0_3,
	io_tensor_wr_0_bits_data_0_4,
	io_tensor_wr_0_bits_data_0_5,
	io_tensor_wr_0_bits_data_0_6,
	io_tensor_wr_0_bits_data_0_7,
	io_tensor_wr_0_bits_data_0_8,
	io_tensor_wr_0_bits_data_0_9,
	io_tensor_wr_0_bits_data_0_10,
	io_tensor_wr_0_bits_data_0_11,
	io_tensor_wr_0_bits_data_0_12,
	io_tensor_wr_0_bits_data_0_13,
	io_tensor_wr_0_bits_data_0_14,
	io_tensor_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	output wire io_vme_rd_data_ready;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [31:0] io_tensor_rd_0_data_bits_0_0;
	output wire [31:0] io_tensor_rd_0_data_bits_0_1;
	output wire [31:0] io_tensor_rd_0_data_bits_0_2;
	output wire [31:0] io_tensor_rd_0_data_bits_0_3;
	output wire [31:0] io_tensor_rd_0_data_bits_0_4;
	output wire [31:0] io_tensor_rd_0_data_bits_0_5;
	output wire [31:0] io_tensor_rd_0_data_bits_0_6;
	output wire [31:0] io_tensor_rd_0_data_bits_0_7;
	output wire [31:0] io_tensor_rd_0_data_bits_0_8;
	output wire [31:0] io_tensor_rd_0_data_bits_0_9;
	output wire [31:0] io_tensor_rd_0_data_bits_0_10;
	output wire [31:0] io_tensor_rd_0_data_bits_0_11;
	output wire [31:0] io_tensor_rd_0_data_bits_0_12;
	output wire [31:0] io_tensor_rd_0_data_bits_0_13;
	output wire [31:0] io_tensor_rd_0_data_bits_0_14;
	output wire [31:0] io_tensor_rd_0_data_bits_0_15;
	input io_tensor_wr_0_valid;
	input [10:0] io_tensor_wr_0_bits_idx;
	input [31:0] io_tensor_wr_0_bits_data_0_0;
	input [31:0] io_tensor_wr_0_bits_data_0_1;
	input [31:0] io_tensor_wr_0_bits_data_0_2;
	input [31:0] io_tensor_wr_0_bits_data_0_3;
	input [31:0] io_tensor_wr_0_bits_data_0_4;
	input [31:0] io_tensor_wr_0_bits_data_0_5;
	input [31:0] io_tensor_wr_0_bits_data_0_6;
	input [31:0] io_tensor_wr_0_bits_data_0_7;
	input [31:0] io_tensor_wr_0_bits_data_0_8;
	input [31:0] io_tensor_wr_0_bits_data_0_9;
	input [31:0] io_tensor_wr_0_bits_data_0_10;
	input [31:0] io_tensor_wr_0_bits_data_0_11;
	input [31:0] io_tensor_wr_0_bits_data_0_12;
	input [31:0] io_tensor_wr_0_bits_data_0_13;
	input [31:0] io_tensor_wr_0_bits_data_0_14;
	input [31:0] io_tensor_wr_0_bits_data_0_15;
	wire vmeCmd_clock;
	wire vmeCmd_reset;
	wire vmeCmd_io_start;
	wire vmeCmd_io_isBusy;
	wire [127:0] vmeCmd_io_inst;
	wire [63:0] vmeCmd_io_baddr;
	wire vmeCmd_io_vmeCmd_ready;
	wire vmeCmd_io_vmeCmd_valid;
	wire [63:0] vmeCmd_io_vmeCmd_bits_addr;
	wire [7:0] vmeCmd_io_vmeCmd_bits_len;
	wire [20:0] vmeCmd_io_vmeCmd_bits_tag;
	wire [8:0] vmeCmd_io_readLen;
	wire vmeCmd_io_done;
	wire readData_clock;
	wire readData_reset;
	wire readData_io_start;
	wire readData_io_vmeData_ready;
	wire readData_io_vmeData_valid;
	wire [20:0] readData_io_vmeData_bits_tag;
	wire [10:0] readData_io_idx;
	wire [2:0] readData_io_col;
	wire fillPadding_clock;
	wire fillPadding_reset;
	wire fillPadding_io_canWriteMem;
	wire [127:0] fillPadding_io_inst;
	wire fillPadding_io_tensorIdx_valid;
	wire [10:0] fillPadding_io_tensorIdx_bits;
	wire fillPadding_io_start;
	wire fillPadding_io_done;
	reg [63:0] tensorFile_0 [0:2047];
	wire tensorFile_0_MPORT_8_en;
	wire [10:0] tensorFile_0_MPORT_8_addr;
	wire [63:0] tensorFile_0_MPORT_8_data;
	wire [63:0] tensorFile_0_MPORT_data;
	wire [10:0] tensorFile_0_MPORT_addr;
	wire tensorFile_0_MPORT_mask;
	wire tensorFile_0_MPORT_en;
	reg tensorFile_0_MPORT_8_en_pipe_0;
	reg [10:0] tensorFile_0_MPORT_8_addr_pipe_0;
	reg [63:0] tensorFile_1 [0:2047];
	wire tensorFile_1_MPORT_9_en;
	wire [10:0] tensorFile_1_MPORT_9_addr;
	wire [63:0] tensorFile_1_MPORT_9_data;
	wire [63:0] tensorFile_1_MPORT_1_data;
	wire [10:0] tensorFile_1_MPORT_1_addr;
	wire tensorFile_1_MPORT_1_mask;
	wire tensorFile_1_MPORT_1_en;
	reg tensorFile_1_MPORT_9_en_pipe_0;
	reg [10:0] tensorFile_1_MPORT_9_addr_pipe_0;
	reg [63:0] tensorFile_2 [0:2047];
	wire tensorFile_2_MPORT_10_en;
	wire [10:0] tensorFile_2_MPORT_10_addr;
	wire [63:0] tensorFile_2_MPORT_10_data;
	wire [63:0] tensorFile_2_MPORT_2_data;
	wire [10:0] tensorFile_2_MPORT_2_addr;
	wire tensorFile_2_MPORT_2_mask;
	wire tensorFile_2_MPORT_2_en;
	reg tensorFile_2_MPORT_10_en_pipe_0;
	reg [10:0] tensorFile_2_MPORT_10_addr_pipe_0;
	reg [63:0] tensorFile_3 [0:2047];
	wire tensorFile_3_MPORT_11_en;
	wire [10:0] tensorFile_3_MPORT_11_addr;
	wire [63:0] tensorFile_3_MPORT_11_data;
	wire [63:0] tensorFile_3_MPORT_3_data;
	wire [10:0] tensorFile_3_MPORT_3_addr;
	wire tensorFile_3_MPORT_3_mask;
	wire tensorFile_3_MPORT_3_en;
	reg tensorFile_3_MPORT_11_en_pipe_0;
	reg [10:0] tensorFile_3_MPORT_11_addr_pipe_0;
	reg [63:0] tensorFile_4 [0:2047];
	wire tensorFile_4_MPORT_12_en;
	wire [10:0] tensorFile_4_MPORT_12_addr;
	wire [63:0] tensorFile_4_MPORT_12_data;
	wire [63:0] tensorFile_4_MPORT_4_data;
	wire [10:0] tensorFile_4_MPORT_4_addr;
	wire tensorFile_4_MPORT_4_mask;
	wire tensorFile_4_MPORT_4_en;
	reg tensorFile_4_MPORT_12_en_pipe_0;
	reg [10:0] tensorFile_4_MPORT_12_addr_pipe_0;
	reg [63:0] tensorFile_5 [0:2047];
	wire tensorFile_5_MPORT_13_en;
	wire [10:0] tensorFile_5_MPORT_13_addr;
	wire [63:0] tensorFile_5_MPORT_13_data;
	wire [63:0] tensorFile_5_MPORT_5_data;
	wire [10:0] tensorFile_5_MPORT_5_addr;
	wire tensorFile_5_MPORT_5_mask;
	wire tensorFile_5_MPORT_5_en;
	reg tensorFile_5_MPORT_13_en_pipe_0;
	reg [10:0] tensorFile_5_MPORT_13_addr_pipe_0;
	reg [63:0] tensorFile_6 [0:2047];
	wire tensorFile_6_MPORT_14_en;
	wire [10:0] tensorFile_6_MPORT_14_addr;
	wire [63:0] tensorFile_6_MPORT_14_data;
	wire [63:0] tensorFile_6_MPORT_6_data;
	wire [10:0] tensorFile_6_MPORT_6_addr;
	wire tensorFile_6_MPORT_6_mask;
	wire tensorFile_6_MPORT_6_en;
	reg tensorFile_6_MPORT_14_en_pipe_0;
	reg [10:0] tensorFile_6_MPORT_14_addr_pipe_0;
	reg [63:0] tensorFile_7 [0:2047];
	wire tensorFile_7_MPORT_15_en;
	wire [10:0] tensorFile_7_MPORT_15_addr;
	wire [63:0] tensorFile_7_MPORT_15_data;
	wire [63:0] tensorFile_7_MPORT_7_data;
	wire [10:0] tensorFile_7_MPORT_7_addr;
	wire tensorFile_7_MPORT_7_mask;
	wire tensorFile_7_MPORT_7_en;
	reg tensorFile_7_MPORT_15_en_pipe_0;
	reg [10:0] tensorFile_7_MPORT_15_addr_pipe_0;
	reg state;
	reg [13:0] blocksInFlight;
	wire loadDone = ((blocksInFlight == 14'h0000) & vmeCmd_io_done) & state;
	wire localDone = loadDone & fillPadding_io_done;
	wire _GEN_0 = (localDone ? 1'h0 : state);
	wire _GEN_1 = io_start | _GEN_0;
	reg [63:0] vmeDataBitsPipe_data;
	reg [20:0] vmeDataBitsPipe_tag;
	reg vmeDataValidPipe;
	reg vmeDataReadyPipe;
	wire vmeDataFirePipe = vmeDataValidPipe & vmeDataReadyPipe;
	wire _T = io_vme_rd_cmd_ready & io_vme_rd_cmd_valid;
	wire _T_1 = state & _T;
	wire _T_3 = (state & _T) & ~vmeDataFirePipe;
	wire [13:0] _GEN_58 = {5'd0, vmeCmd_io_readLen};
	wire [13:0] _blocksInFlight_T_1 = blocksInFlight + _GEN_58;
	wire _T_6 = _T_1 & vmeDataFirePipe;
	wire [13:0] _blocksInFlight_T_5 = _blocksInFlight_T_1 - 14'h0001;
	wire _T_10 = (state & ~_T) & vmeDataFirePipe;
	wire _T_13 = ~rst;
	wire [13:0] _blocksInFlight_T_7 = blocksInFlight - 14'h0001;
	reg [127:0] fillPadding_io_inst_REG;
	reg fillPadding_io_start_REG;
	wire [10:0] waddrTensInstrTmp = (fillPadding_io_tensorIdx_valid ? fillPadding_io_tensorIdx_bits : readData_io_idx);
	wire [87:0] _waddrDirect_T = {io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx, io_tensor_wr_0_bits_idx};
	wire [10:0] waddrDirect_0 = _waddrDirect_T[10:0];
	wire [10:0] waddrDirect_1 = _waddrDirect_T[21:11];
	wire [10:0] waddrDirect_2 = _waddrDirect_T[32:22];
	wire [10:0] waddrDirect_3 = _waddrDirect_T[43:33];
	wire [10:0] waddrDirect_4 = _waddrDirect_T[54:44];
	wire [10:0] waddrDirect_5 = _waddrDirect_T[65:55];
	wire [10:0] waddrDirect_6 = _waddrDirect_T[76:66];
	wire [10:0] waddrDirect_7 = _waddrDirect_T[87:77];
	wire _waddr_0_T = ~state;
	wire wenTensInstr_0 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h0) & vmeDataFirePipe);
	wire wenTensInstr_1 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h1) & vmeDataFirePipe);
	wire wenTensInstr_2 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h2) & vmeDataFirePipe);
	wire wenTensInstr_3 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h3) & vmeDataFirePipe);
	wire wenTensInstr_4 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h4) & vmeDataFirePipe);
	wire wenTensInstr_5 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h5) & vmeDataFirePipe);
	wire wenTensInstr_6 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h6) & vmeDataFirePipe);
	wire wenTensInstr_7 = fillPadding_io_tensorIdx_valid | ((readData_io_col == 3'h7) & vmeDataFirePipe);
	wire [63:0] wdataTensInstr_0 = (fillPadding_io_tensorIdx_valid ? 64'h0000000000000000 : vmeDataBitsPipe_data);
	wire [255:0] wdataDirect_lo = {io_tensor_wr_0_bits_data_0_7, io_tensor_wr_0_bits_data_0_6, io_tensor_wr_0_bits_data_0_5, io_tensor_wr_0_bits_data_0_4, io_tensor_wr_0_bits_data_0_3, io_tensor_wr_0_bits_data_0_2, io_tensor_wr_0_bits_data_0_1, io_tensor_wr_0_bits_data_0_0};
	wire [511:0] _wdataDirect_T = {io_tensor_wr_0_bits_data_0_15, io_tensor_wr_0_bits_data_0_14, io_tensor_wr_0_bits_data_0_13, io_tensor_wr_0_bits_data_0_12, io_tensor_wr_0_bits_data_0_11, io_tensor_wr_0_bits_data_0_10, io_tensor_wr_0_bits_data_0_9, io_tensor_wr_0_bits_data_0_8, wdataDirect_lo};
	wire [63:0] wdataDirect_0 = _wdataDirect_T[63:0];
	reg rvalid;
	wire [63:0] _WIRE_8_1 = tensorFile_1_MPORT_9_data;
	wire [63:0] _WIRE_8_0 = tensorFile_0_MPORT_8_data;
	wire [63:0] _WIRE_8_3 = tensorFile_3_MPORT_11_data;
	wire [63:0] _WIRE_8_2 = tensorFile_2_MPORT_10_data;
	wire [63:0] _WIRE_8_5 = tensorFile_5_MPORT_13_data;
	wire [63:0] _WIRE_8_4 = tensorFile_4_MPORT_12_data;
	wire [63:0] _WIRE_8_7 = tensorFile_7_MPORT_15_data;
	wire [63:0] _WIRE_8_6 = tensorFile_6_MPORT_14_data;
	wire [511:0] _T_36 = {_WIRE_8_7, _WIRE_8_6, _WIRE_8_5, _WIRE_8_4, _WIRE_8_3, _WIRE_8_2, _WIRE_8_1, _WIRE_8_0};
	GenVMECmd_2 vmeCmd(
		.clk(vmeCmd_clock),
		.rst(vmeCmd_reset),
		.io_start(vmeCmd_io_start),
		.io_isBusy(vmeCmd_io_isBusy),
		.io_inst(vmeCmd_io_inst),
		.io_baddr(vmeCmd_io_baddr),
		.io_vmeCmd_ready(vmeCmd_io_vmeCmd_ready),
		.io_vmeCmd_valid(vmeCmd_io_vmeCmd_valid),
		.io_vmeCmd_bits_addr(vmeCmd_io_vmeCmd_bits_addr),
		.io_vmeCmd_bits_len(vmeCmd_io_vmeCmd_bits_len),
		.io_vmeCmd_bits_tag(vmeCmd_io_vmeCmd_bits_tag),
		.io_readLen(vmeCmd_io_readLen),
		.io_done(vmeCmd_io_done)
	);
	ReadVMEData_2 readData(
		.clk(readData_clock),
		.rst(readData_reset),
		.io_start(readData_io_start),
		.io_vmeData_ready(readData_io_vmeData_ready),
		.io_vmeData_valid(readData_io_vmeData_valid),
		.io_vmeData_bits_tag(readData_io_vmeData_bits_tag),
		.io_idx(readData_io_idx),
		.io_col(readData_io_col)
	);
	ZeroPadding fillPadding(
		.clk(fillPadding_clock),
		.rst(fillPadding_reset),
		.io_canWriteMem(fillPadding_io_canWriteMem),
		.io_inst(fillPadding_io_inst),
		.io_tensorIdx_valid(fillPadding_io_tensorIdx_valid),
		.io_tensorIdx_bits(fillPadding_io_tensorIdx_bits),
		.io_start(fillPadding_io_start),
		.io_done(fillPadding_io_done)
	);
	assign tensorFile_0_MPORT_8_en = tensorFile_0_MPORT_8_en_pipe_0;
	assign tensorFile_0_MPORT_8_addr = tensorFile_0_MPORT_8_addr_pipe_0;
	assign tensorFile_0_MPORT_8_data = tensorFile_0[tensorFile_0_MPORT_8_addr];
	assign tensorFile_0_MPORT_data = (_waddr_0_T ? wdataDirect_0 : wdataTensInstr_0);
	assign tensorFile_0_MPORT_addr = (_waddr_0_T ? waddrDirect_0 : waddrTensInstrTmp);
	assign tensorFile_0_MPORT_mask = 1'h1;
	assign tensorFile_0_MPORT_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_0);
	assign tensorFile_1_MPORT_9_en = tensorFile_1_MPORT_9_en_pipe_0;
	assign tensorFile_1_MPORT_9_addr = tensorFile_1_MPORT_9_addr_pipe_0;
	assign tensorFile_1_MPORT_9_data = tensorFile_1[tensorFile_1_MPORT_9_addr];
	assign tensorFile_1_MPORT_1_data = (_waddr_0_T ? _wdataDirect_T[127:64] : wdataTensInstr_0);
	assign tensorFile_1_MPORT_1_addr = (_waddr_0_T ? waddrDirect_1 : waddrTensInstrTmp);
	assign tensorFile_1_MPORT_1_mask = 1'h1;
	assign tensorFile_1_MPORT_1_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_1);
	assign tensorFile_2_MPORT_10_en = tensorFile_2_MPORT_10_en_pipe_0;
	assign tensorFile_2_MPORT_10_addr = tensorFile_2_MPORT_10_addr_pipe_0;
	assign tensorFile_2_MPORT_10_data = tensorFile_2[tensorFile_2_MPORT_10_addr];
	assign tensorFile_2_MPORT_2_data = (_waddr_0_T ? _wdataDirect_T[191:128] : wdataTensInstr_0);
	assign tensorFile_2_MPORT_2_addr = (_waddr_0_T ? waddrDirect_2 : waddrTensInstrTmp);
	assign tensorFile_2_MPORT_2_mask = 1'h1;
	assign tensorFile_2_MPORT_2_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_2);
	assign tensorFile_3_MPORT_11_en = tensorFile_3_MPORT_11_en_pipe_0;
	assign tensorFile_3_MPORT_11_addr = tensorFile_3_MPORT_11_addr_pipe_0;
	assign tensorFile_3_MPORT_11_data = tensorFile_3[tensorFile_3_MPORT_11_addr];
	assign tensorFile_3_MPORT_3_data = (_waddr_0_T ? _wdataDirect_T[255:192] : wdataTensInstr_0);
	assign tensorFile_3_MPORT_3_addr = (_waddr_0_T ? waddrDirect_3 : waddrTensInstrTmp);
	assign tensorFile_3_MPORT_3_mask = 1'h1;
	assign tensorFile_3_MPORT_3_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_3);
	assign tensorFile_4_MPORT_12_en = tensorFile_4_MPORT_12_en_pipe_0;
	assign tensorFile_4_MPORT_12_addr = tensorFile_4_MPORT_12_addr_pipe_0;
	assign tensorFile_4_MPORT_12_data = tensorFile_4[tensorFile_4_MPORT_12_addr];
	assign tensorFile_4_MPORT_4_data = (_waddr_0_T ? _wdataDirect_T[319:256] : wdataTensInstr_0);
	assign tensorFile_4_MPORT_4_addr = (_waddr_0_T ? waddrDirect_4 : waddrTensInstrTmp);
	assign tensorFile_4_MPORT_4_mask = 1'h1;
	assign tensorFile_4_MPORT_4_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_4);
	assign tensorFile_5_MPORT_13_en = tensorFile_5_MPORT_13_en_pipe_0;
	assign tensorFile_5_MPORT_13_addr = tensorFile_5_MPORT_13_addr_pipe_0;
	assign tensorFile_5_MPORT_13_data = tensorFile_5[tensorFile_5_MPORT_13_addr];
	assign tensorFile_5_MPORT_5_data = (_waddr_0_T ? _wdataDirect_T[383:320] : wdataTensInstr_0);
	assign tensorFile_5_MPORT_5_addr = (_waddr_0_T ? waddrDirect_5 : waddrTensInstrTmp);
	assign tensorFile_5_MPORT_5_mask = 1'h1;
	assign tensorFile_5_MPORT_5_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_5);
	assign tensorFile_6_MPORT_14_en = tensorFile_6_MPORT_14_en_pipe_0;
	assign tensorFile_6_MPORT_14_addr = tensorFile_6_MPORT_14_addr_pipe_0;
	assign tensorFile_6_MPORT_14_data = tensorFile_6[tensorFile_6_MPORT_14_addr];
	assign tensorFile_6_MPORT_6_data = (_waddr_0_T ? _wdataDirect_T[447:384] : wdataTensInstr_0);
	assign tensorFile_6_MPORT_6_addr = (_waddr_0_T ? waddrDirect_6 : waddrTensInstrTmp);
	assign tensorFile_6_MPORT_6_mask = 1'h1;
	assign tensorFile_6_MPORT_6_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_6);
	assign tensorFile_7_MPORT_15_en = tensorFile_7_MPORT_15_en_pipe_0;
	assign tensorFile_7_MPORT_15_addr = tensorFile_7_MPORT_15_addr_pipe_0;
	assign tensorFile_7_MPORT_15_data = tensorFile_7[tensorFile_7_MPORT_15_addr];
	assign tensorFile_7_MPORT_7_data = (_waddr_0_T ? _wdataDirect_T[511:448] : wdataTensInstr_0);
	assign tensorFile_7_MPORT_7_addr = (_waddr_0_T ? waddrDirect_7 : waddrTensInstrTmp);
	assign tensorFile_7_MPORT_7_mask = 1'h1;
	assign tensorFile_7_MPORT_7_en = (_waddr_0_T ? io_tensor_wr_0_valid : wenTensInstr_7);
	assign io_done = loadDone & fillPadding_io_done;
	assign io_vme_rd_cmd_valid = vmeCmd_io_vmeCmd_valid;
	assign io_vme_rd_cmd_bits_addr = vmeCmd_io_vmeCmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = vmeCmd_io_vmeCmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = vmeCmd_io_vmeCmd_bits_tag;
	assign io_vme_rd_data_ready = 1'h1;
	assign io_tensor_rd_0_data_valid = rvalid;
	assign io_tensor_rd_0_data_bits_0_0 = _T_36[31:0];
	assign io_tensor_rd_0_data_bits_0_1 = _T_36[63:32];
	assign io_tensor_rd_0_data_bits_0_2 = _T_36[95:64];
	assign io_tensor_rd_0_data_bits_0_3 = _T_36[127:96];
	assign io_tensor_rd_0_data_bits_0_4 = _T_36[159:128];
	assign io_tensor_rd_0_data_bits_0_5 = _T_36[191:160];
	assign io_tensor_rd_0_data_bits_0_6 = _T_36[223:192];
	assign io_tensor_rd_0_data_bits_0_7 = _T_36[255:224];
	assign io_tensor_rd_0_data_bits_0_8 = _T_36[287:256];
	assign io_tensor_rd_0_data_bits_0_9 = _T_36[319:288];
	assign io_tensor_rd_0_data_bits_0_10 = _T_36[351:320];
	assign io_tensor_rd_0_data_bits_0_11 = _T_36[383:352];
	assign io_tensor_rd_0_data_bits_0_12 = _T_36[415:384];
	assign io_tensor_rd_0_data_bits_0_13 = _T_36[447:416];
	assign io_tensor_rd_0_data_bits_0_14 = _T_36[479:448];
	assign io_tensor_rd_0_data_bits_0_15 = _T_36[511:480];
	assign vmeCmd_clock = clk;
	assign vmeCmd_reset = rst;
	assign vmeCmd_io_start = io_start;
	assign vmeCmd_io_isBusy = state;
	assign vmeCmd_io_inst = io_inst;
	assign vmeCmd_io_baddr = io_baddr;
	assign vmeCmd_io_vmeCmd_ready = io_vme_rd_cmd_ready;
	assign readData_clock = clk;
	assign readData_reset = rst;
	assign readData_io_start = io_start;
	assign readData_io_vmeData_valid = vmeDataValidPipe;
	assign readData_io_vmeData_bits_tag = vmeDataBitsPipe_tag;
	assign fillPadding_clock = clk;
	assign fillPadding_reset = rst;
	assign fillPadding_io_canWriteMem = ~vmeDataFirePipe;
	assign fillPadding_io_inst = fillPadding_io_inst_REG;
	assign fillPadding_io_start = fillPadding_io_start_REG;
	always @(posedge clk) begin
		if (tensorFile_0_MPORT_en & tensorFile_0_MPORT_mask)
			tensorFile_0[tensorFile_0_MPORT_addr] <= tensorFile_0_MPORT_data;
		tensorFile_0_MPORT_8_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_0_MPORT_8_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_1_MPORT_1_en & tensorFile_1_MPORT_1_mask)
			tensorFile_1[tensorFile_1_MPORT_1_addr] <= tensorFile_1_MPORT_1_data;
		tensorFile_1_MPORT_9_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_1_MPORT_9_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_2_MPORT_2_en & tensorFile_2_MPORT_2_mask)
			tensorFile_2[tensorFile_2_MPORT_2_addr] <= tensorFile_2_MPORT_2_data;
		tensorFile_2_MPORT_10_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_2_MPORT_10_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_3_MPORT_3_en & tensorFile_3_MPORT_3_mask)
			tensorFile_3[tensorFile_3_MPORT_3_addr] <= tensorFile_3_MPORT_3_data;
		tensorFile_3_MPORT_11_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_3_MPORT_11_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_4_MPORT_4_en & tensorFile_4_MPORT_4_mask)
			tensorFile_4[tensorFile_4_MPORT_4_addr] <= tensorFile_4_MPORT_4_data;
		tensorFile_4_MPORT_12_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_4_MPORT_12_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_5_MPORT_5_en & tensorFile_5_MPORT_5_mask)
			tensorFile_5[tensorFile_5_MPORT_5_addr] <= tensorFile_5_MPORT_5_data;
		tensorFile_5_MPORT_13_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_5_MPORT_13_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_6_MPORT_6_en & tensorFile_6_MPORT_6_mask)
			tensorFile_6[tensorFile_6_MPORT_6_addr] <= tensorFile_6_MPORT_6_data;
		tensorFile_6_MPORT_14_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_6_MPORT_14_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (tensorFile_7_MPORT_7_en & tensorFile_7_MPORT_7_mask)
			tensorFile_7[tensorFile_7_MPORT_7_addr] <= tensorFile_7_MPORT_7_data;
		tensorFile_7_MPORT_15_en_pipe_0 <= io_tensor_rd_0_idx_valid;
		if (io_tensor_rd_0_idx_valid)
			tensorFile_7_MPORT_15_addr_pipe_0 <= io_tensor_rd_0_idx_bits;
		if (rst)
			state <= 1'h0;
		else
			state <= _GEN_1;
		if (io_start)
			blocksInFlight <= 14'h0000;
		else if ((state & _T) & ~vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_1;
		else if (_T_1 & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_5;
		else if ((state & ~_T) & vmeDataFirePipe)
			blocksInFlight <= _blocksInFlight_T_7;
		vmeDataBitsPipe_data <= io_vme_rd_data_bits_data;
		vmeDataBitsPipe_tag <= io_vme_rd_data_bits_tag;
		if (rst)
			vmeDataValidPipe <= 1'h0;
		else
			vmeDataValidPipe <= io_vme_rd_data_valid;
		if (rst)
			vmeDataReadyPipe <= 1'h0;
		else
			vmeDataReadyPipe <= io_vme_rd_data_ready;
		fillPadding_io_inst_REG <= io_inst;
		if (rst)
			fillPadding_io_start_REG <= 1'h0;
		else
			fillPadding_io_start_REG <= io_start;
		if (rst)
			rvalid <= 1'h0;
		else
			rvalid <= io_tensor_rd_0_idx_valid;
		if (((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst) & ~(blocksInFlight > 14'h0000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorLoadNarrowVME.scala:95 assert(blocksInFlight > 0.U)\n");
	end
	always @(posedge clk) begin
		if ((((~io_start & ~_T_3) & ~_T_6) & _T_10) & ~rst)
			;
		if (_T_13)
			;
	end
endmodule
module TensorLoadAcc (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_rd_cmd_ready,
	io_vme_rd_cmd_valid,
	io_vme_rd_cmd_bits_addr,
	io_vme_rd_cmd_bits_len,
	io_vme_rd_cmd_bits_tag,
	io_vme_rd_data_valid,
	io_vme_rd_data_bits_data,
	io_vme_rd_data_bits_tag,
	io_tensor_rd_0_idx_valid,
	io_tensor_rd_0_idx_bits,
	io_tensor_rd_0_data_valid,
	io_tensor_rd_0_data_bits_0_0,
	io_tensor_rd_0_data_bits_0_1,
	io_tensor_rd_0_data_bits_0_2,
	io_tensor_rd_0_data_bits_0_3,
	io_tensor_rd_0_data_bits_0_4,
	io_tensor_rd_0_data_bits_0_5,
	io_tensor_rd_0_data_bits_0_6,
	io_tensor_rd_0_data_bits_0_7,
	io_tensor_rd_0_data_bits_0_8,
	io_tensor_rd_0_data_bits_0_9,
	io_tensor_rd_0_data_bits_0_10,
	io_tensor_rd_0_data_bits_0_11,
	io_tensor_rd_0_data_bits_0_12,
	io_tensor_rd_0_data_bits_0_13,
	io_tensor_rd_0_data_bits_0_14,
	io_tensor_rd_0_data_bits_0_15,
	io_tensor_wr_0_valid,
	io_tensor_wr_0_bits_idx,
	io_tensor_wr_0_bits_data_0_0,
	io_tensor_wr_0_bits_data_0_1,
	io_tensor_wr_0_bits_data_0_2,
	io_tensor_wr_0_bits_data_0_3,
	io_tensor_wr_0_bits_data_0_4,
	io_tensor_wr_0_bits_data_0_5,
	io_tensor_wr_0_bits_data_0_6,
	io_tensor_wr_0_bits_data_0_7,
	io_tensor_wr_0_bits_data_0_8,
	io_tensor_wr_0_bits_data_0_9,
	io_tensor_wr_0_bits_data_0_10,
	io_tensor_wr_0_bits_data_0_11,
	io_tensor_wr_0_bits_data_0_12,
	io_tensor_wr_0_bits_data_0_13,
	io_tensor_wr_0_bits_data_0_14,
	io_tensor_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_rd_cmd_ready;
	output wire io_vme_rd_cmd_valid;
	output wire [63:0] io_vme_rd_cmd_bits_addr;
	output wire [7:0] io_vme_rd_cmd_bits_len;
	output wire [20:0] io_vme_rd_cmd_bits_tag;
	input io_vme_rd_data_valid;
	input [63:0] io_vme_rd_data_bits_data;
	input [20:0] io_vme_rd_data_bits_tag;
	input io_tensor_rd_0_idx_valid;
	input [10:0] io_tensor_rd_0_idx_bits;
	output wire io_tensor_rd_0_data_valid;
	output wire [31:0] io_tensor_rd_0_data_bits_0_0;
	output wire [31:0] io_tensor_rd_0_data_bits_0_1;
	output wire [31:0] io_tensor_rd_0_data_bits_0_2;
	output wire [31:0] io_tensor_rd_0_data_bits_0_3;
	output wire [31:0] io_tensor_rd_0_data_bits_0_4;
	output wire [31:0] io_tensor_rd_0_data_bits_0_5;
	output wire [31:0] io_tensor_rd_0_data_bits_0_6;
	output wire [31:0] io_tensor_rd_0_data_bits_0_7;
	output wire [31:0] io_tensor_rd_0_data_bits_0_8;
	output wire [31:0] io_tensor_rd_0_data_bits_0_9;
	output wire [31:0] io_tensor_rd_0_data_bits_0_10;
	output wire [31:0] io_tensor_rd_0_data_bits_0_11;
	output wire [31:0] io_tensor_rd_0_data_bits_0_12;
	output wire [31:0] io_tensor_rd_0_data_bits_0_13;
	output wire [31:0] io_tensor_rd_0_data_bits_0_14;
	output wire [31:0] io_tensor_rd_0_data_bits_0_15;
	input io_tensor_wr_0_valid;
	input [10:0] io_tensor_wr_0_bits_idx;
	input [31:0] io_tensor_wr_0_bits_data_0_0;
	input [31:0] io_tensor_wr_0_bits_data_0_1;
	input [31:0] io_tensor_wr_0_bits_data_0_2;
	input [31:0] io_tensor_wr_0_bits_data_0_3;
	input [31:0] io_tensor_wr_0_bits_data_0_4;
	input [31:0] io_tensor_wr_0_bits_data_0_5;
	input [31:0] io_tensor_wr_0_bits_data_0_6;
	input [31:0] io_tensor_wr_0_bits_data_0_7;
	input [31:0] io_tensor_wr_0_bits_data_0_8;
	input [31:0] io_tensor_wr_0_bits_data_0_9;
	input [31:0] io_tensor_wr_0_bits_data_0_10;
	input [31:0] io_tensor_wr_0_bits_data_0_11;
	input [31:0] io_tensor_wr_0_bits_data_0_12;
	input [31:0] io_tensor_wr_0_bits_data_0_13;
	input [31:0] io_tensor_wr_0_bits_data_0_14;
	input [31:0] io_tensor_wr_0_bits_data_0_15;
	wire tensorLoad_clock;
	wire tensorLoad_reset;
	wire tensorLoad_io_start;
	wire tensorLoad_io_done;
	wire [127:0] tensorLoad_io_inst;
	wire [63:0] tensorLoad_io_baddr;
	wire tensorLoad_io_vme_rd_cmd_ready;
	wire tensorLoad_io_vme_rd_cmd_valid;
	wire [63:0] tensorLoad_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorLoad_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorLoad_io_vme_rd_cmd_bits_tag;
	wire tensorLoad_io_vme_rd_data_ready;
	wire tensorLoad_io_vme_rd_data_valid;
	wire [63:0] tensorLoad_io_vme_rd_data_bits_data;
	wire [20:0] tensorLoad_io_vme_rd_data_bits_tag;
	wire tensorLoad_io_tensor_rd_0_idx_valid;
	wire [10:0] tensorLoad_io_tensor_rd_0_idx_bits;
	wire tensorLoad_io_tensor_rd_0_data_valid;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_0;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_1;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_2;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_3;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_4;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_5;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_6;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_7;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_8;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_9;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_10;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_11;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_12;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_13;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_14;
	wire [31:0] tensorLoad_io_tensor_rd_0_data_bits_0_15;
	wire tensorLoad_io_tensor_wr_0_valid;
	wire [10:0] tensorLoad_io_tensor_wr_0_bits_idx;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_0;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_1;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_2;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_3;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_4;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_5;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_6;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_7;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_8;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_9;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_10;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_11;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_12;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_13;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_14;
	wire [31:0] tensorLoad_io_tensor_wr_0_bits_data_0_15;
	TensorLoadNarrowVME_2 tensorLoad(
		.clk(tensorLoad_clock),
		.rst(tensorLoad_reset),
		.io_start(tensorLoad_io_start),
		.io_done(tensorLoad_io_done),
		.io_inst(tensorLoad_io_inst),
		.io_baddr(tensorLoad_io_baddr),
		.io_vme_rd_cmd_ready(tensorLoad_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorLoad_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorLoad_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorLoad_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorLoad_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_ready(tensorLoad_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(tensorLoad_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorLoad_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorLoad_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorLoad_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorLoad_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorLoad_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorLoad_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorLoad_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorLoad_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorLoad_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorLoad_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorLoad_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorLoad_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorLoad_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorLoad_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorLoad_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorLoad_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorLoad_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorLoad_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorLoad_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorLoad_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorLoad_io_tensor_rd_0_data_bits_0_15),
		.io_tensor_wr_0_valid(tensorLoad_io_tensor_wr_0_valid),
		.io_tensor_wr_0_bits_idx(tensorLoad_io_tensor_wr_0_bits_idx),
		.io_tensor_wr_0_bits_data_0_0(tensorLoad_io_tensor_wr_0_bits_data_0_0),
		.io_tensor_wr_0_bits_data_0_1(tensorLoad_io_tensor_wr_0_bits_data_0_1),
		.io_tensor_wr_0_bits_data_0_2(tensorLoad_io_tensor_wr_0_bits_data_0_2),
		.io_tensor_wr_0_bits_data_0_3(tensorLoad_io_tensor_wr_0_bits_data_0_3),
		.io_tensor_wr_0_bits_data_0_4(tensorLoad_io_tensor_wr_0_bits_data_0_4),
		.io_tensor_wr_0_bits_data_0_5(tensorLoad_io_tensor_wr_0_bits_data_0_5),
		.io_tensor_wr_0_bits_data_0_6(tensorLoad_io_tensor_wr_0_bits_data_0_6),
		.io_tensor_wr_0_bits_data_0_7(tensorLoad_io_tensor_wr_0_bits_data_0_7),
		.io_tensor_wr_0_bits_data_0_8(tensorLoad_io_tensor_wr_0_bits_data_0_8),
		.io_tensor_wr_0_bits_data_0_9(tensorLoad_io_tensor_wr_0_bits_data_0_9),
		.io_tensor_wr_0_bits_data_0_10(tensorLoad_io_tensor_wr_0_bits_data_0_10),
		.io_tensor_wr_0_bits_data_0_11(tensorLoad_io_tensor_wr_0_bits_data_0_11),
		.io_tensor_wr_0_bits_data_0_12(tensorLoad_io_tensor_wr_0_bits_data_0_12),
		.io_tensor_wr_0_bits_data_0_13(tensorLoad_io_tensor_wr_0_bits_data_0_13),
		.io_tensor_wr_0_bits_data_0_14(tensorLoad_io_tensor_wr_0_bits_data_0_14),
		.io_tensor_wr_0_bits_data_0_15(tensorLoad_io_tensor_wr_0_bits_data_0_15)
	);
	assign io_done = tensorLoad_io_done;
	assign io_vme_rd_cmd_valid = tensorLoad_io_vme_rd_cmd_valid;
	assign io_vme_rd_cmd_bits_addr = tensorLoad_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_cmd_bits_len = tensorLoad_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_cmd_bits_tag = tensorLoad_io_vme_rd_cmd_bits_tag;
	assign io_tensor_rd_0_data_valid = tensorLoad_io_tensor_rd_0_data_valid;
	assign io_tensor_rd_0_data_bits_0_0 = tensorLoad_io_tensor_rd_0_data_bits_0_0;
	assign io_tensor_rd_0_data_bits_0_1 = tensorLoad_io_tensor_rd_0_data_bits_0_1;
	assign io_tensor_rd_0_data_bits_0_2 = tensorLoad_io_tensor_rd_0_data_bits_0_2;
	assign io_tensor_rd_0_data_bits_0_3 = tensorLoad_io_tensor_rd_0_data_bits_0_3;
	assign io_tensor_rd_0_data_bits_0_4 = tensorLoad_io_tensor_rd_0_data_bits_0_4;
	assign io_tensor_rd_0_data_bits_0_5 = tensorLoad_io_tensor_rd_0_data_bits_0_5;
	assign io_tensor_rd_0_data_bits_0_6 = tensorLoad_io_tensor_rd_0_data_bits_0_6;
	assign io_tensor_rd_0_data_bits_0_7 = tensorLoad_io_tensor_rd_0_data_bits_0_7;
	assign io_tensor_rd_0_data_bits_0_8 = tensorLoad_io_tensor_rd_0_data_bits_0_8;
	assign io_tensor_rd_0_data_bits_0_9 = tensorLoad_io_tensor_rd_0_data_bits_0_9;
	assign io_tensor_rd_0_data_bits_0_10 = tensorLoad_io_tensor_rd_0_data_bits_0_10;
	assign io_tensor_rd_0_data_bits_0_11 = tensorLoad_io_tensor_rd_0_data_bits_0_11;
	assign io_tensor_rd_0_data_bits_0_12 = tensorLoad_io_tensor_rd_0_data_bits_0_12;
	assign io_tensor_rd_0_data_bits_0_13 = tensorLoad_io_tensor_rd_0_data_bits_0_13;
	assign io_tensor_rd_0_data_bits_0_14 = tensorLoad_io_tensor_rd_0_data_bits_0_14;
	assign io_tensor_rd_0_data_bits_0_15 = tensorLoad_io_tensor_rd_0_data_bits_0_15;
	assign tensorLoad_clock = clk;
	assign tensorLoad_reset = rst;
	assign tensorLoad_io_start = io_start;
	assign tensorLoad_io_inst = io_inst;
	assign tensorLoad_io_baddr = io_baddr;
	assign tensorLoad_io_vme_rd_cmd_ready = io_vme_rd_cmd_ready;
	assign tensorLoad_io_vme_rd_data_valid = io_vme_rd_data_valid;
	assign tensorLoad_io_vme_rd_data_bits_data = io_vme_rd_data_bits_data;
	assign tensorLoad_io_vme_rd_data_bits_tag = io_vme_rd_data_bits_tag;
	assign tensorLoad_io_tensor_rd_0_idx_valid = io_tensor_rd_0_idx_valid;
	assign tensorLoad_io_tensor_rd_0_idx_bits = io_tensor_rd_0_idx_bits;
	assign tensorLoad_io_tensor_wr_0_valid = io_tensor_wr_0_valid;
	assign tensorLoad_io_tensor_wr_0_bits_idx = io_tensor_wr_0_bits_idx;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_0 = io_tensor_wr_0_bits_data_0_0;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_1 = io_tensor_wr_0_bits_data_0_1;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_2 = io_tensor_wr_0_bits_data_0_2;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_3 = io_tensor_wr_0_bits_data_0_3;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_4 = io_tensor_wr_0_bits_data_0_4;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_5 = io_tensor_wr_0_bits_data_0_5;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_6 = io_tensor_wr_0_bits_data_0_6;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_7 = io_tensor_wr_0_bits_data_0_7;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_8 = io_tensor_wr_0_bits_data_0_8;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_9 = io_tensor_wr_0_bits_data_0_9;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_10 = io_tensor_wr_0_bits_data_0_10;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_11 = io_tensor_wr_0_bits_data_0_11;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_12 = io_tensor_wr_0_bits_data_0_12;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_13 = io_tensor_wr_0_bits_data_0_13;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_14 = io_tensor_wr_0_bits_data_0_14;
	assign tensorLoad_io_tensor_wr_0_bits_data_0_15 = io_tensor_wr_0_bits_data_0_15;
endmodule
module TensorGemmIndexGenerator (
	clk,
	rst,
	io_start,
	io_last,
	io_dec_wgt_1,
	io_dec_wgt_0,
	io_dec_inp_1,
	io_dec_inp_0,
	io_dec_acc_1,
	io_dec_acc_0,
	io_dec_lp_1,
	io_dec_lp_0,
	io_dec_uop_end,
	io_dec_uop_begin,
	io_acc_i,
	io_inp_i,
	io_wgt_i,
	io_uop_idx,
	io_valid
);
	input clk;
	input rst;
	input io_start;
	output wire io_last;
	input [9:0] io_dec_wgt_1;
	input [9:0] io_dec_wgt_0;
	input [10:0] io_dec_inp_1;
	input [10:0] io_dec_inp_0;
	input [10:0] io_dec_acc_1;
	input [10:0] io_dec_acc_0;
	input [13:0] io_dec_lp_1;
	input [13:0] io_dec_lp_0;
	input [13:0] io_dec_uop_end;
	input [12:0] io_dec_uop_begin;
	output wire [10:0] io_acc_i;
	output wire [10:0] io_inp_i;
	output wire [9:0] io_wgt_i;
	output wire [10:0] io_uop_idx;
	output wire io_valid;
	reg running;
	wire _T = ~running;
	wire _GEN_0 = (io_last ? 1'h0 : running);
	wire _GEN_1 = (~running & io_start) | _GEN_0;
	reg [13:0] cnt_i;
	reg [10:0] acc_i;
	reg [10:0] inp_i;
	reg [9:0] wgt_i;
	reg [13:0] cnt_o;
	reg [10:0] acc_o;
	reg [10:0] inp_o;
	reg [9:0] wgt_o;
	reg [13:0] uop_idx;
	wire [13:0] _T_4 = io_dec_uop_end - 14'h0001;
	wire [13:0] _uop_idx_T_1 = uop_idx + 14'h0001;
	wire [13:0] _T_7 = io_dec_lp_1 - 14'h0001;
	wire [13:0] _cnt_i_T_1 = cnt_i + 14'h0001;
	wire [10:0] _acc_i_T_1 = acc_i + io_dec_acc_1;
	wire [10:0] _inp_i_T_1 = inp_i + io_dec_inp_1;
	wire [9:0] _wgt_i_T_1 = wgt_i + io_dec_wgt_1;
	wire [13:0] _T_10 = io_dec_lp_0 - 14'h0001;
	wire [10:0] acc_tmp = acc_o + io_dec_acc_0;
	wire [10:0] inp_tmp = inp_o + io_dec_inp_0;
	wire [9:0] wgt_tmp = wgt_o + io_dec_wgt_0;
	wire [13:0] _cnt_o_T_1 = cnt_o + 14'h0001;
	wire _GEN_10 = (cnt_o != _T_10 ? 1'h0 : 1'h1);
	wire _GEN_19 = (cnt_i != _T_7 ? 1'h0 : _GEN_10);
	wire _GEN_29 = (uop_idx != _T_4 ? 1'h0 : _GEN_19);
	assign io_last = (_T ? 1'h0 : _GEN_29);
	assign io_acc_i = acc_i;
	assign io_inp_i = inp_i;
	assign io_wgt_i = wgt_i;
	assign io_uop_idx = uop_idx[10:0];
	assign io_valid = running;
	always @(posedge clk) begin
		if (rst)
			running <= 1'h0;
		else
			running <= _GEN_1;
		if (_T)
			cnt_i <= 14'h0000;
		else if (uop_idx == _T_4) begin
			if (cnt_i != _T_7)
				cnt_i <= _cnt_i_T_1;
			else if (cnt_o != _T_10)
				cnt_i <= 14'h0000;
		end
		if (_T)
			acc_i <= 11'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i != _T_7)
				acc_i <= _acc_i_T_1;
			else if (cnt_o != _T_10)
				acc_i <= acc_tmp;
		end
		if (_T)
			inp_i <= 11'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i != _T_7)
				inp_i <= _inp_i_T_1;
			else if (cnt_o != _T_10)
				inp_i <= inp_tmp;
		end
		if (_T)
			wgt_i <= 10'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i != _T_7)
				wgt_i <= _wgt_i_T_1;
			else if (cnt_o != _T_10)
				wgt_i <= wgt_tmp;
		end
		if (_T)
			cnt_o <= 14'h0000;
		else if (uop_idx == _T_4) begin
			if (cnt_i == _T_7) begin
				if (cnt_o != _T_10)
					cnt_o <= _cnt_o_T_1;
			end
		end
		if (_T)
			acc_o <= 11'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i == _T_7) begin
				if (cnt_o != _T_10)
					acc_o <= acc_tmp;
			end
		end
		if (_T)
			inp_o <= 11'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i == _T_7) begin
				if (cnt_o != _T_10)
					inp_o <= inp_tmp;
			end
		end
		if (_T)
			wgt_o <= 10'h000;
		else if (uop_idx == _T_4) begin
			if (cnt_i == _T_7) begin
				if (cnt_o != _T_10)
					wgt_o <= wgt_tmp;
			end
		end
		if (_T)
			uop_idx <= {1'd0, io_dec_uop_begin};
		else if (uop_idx != _T_4)
			uop_idx <= _uop_idx_T_1;
		else
			uop_idx <= {1'd0, io_dec_uop_begin};
	end
endmodule
module Pipe (
	clk,
	rst,
	io_enq_valid,
	io_enq_bits,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	input io_enq_valid;
	input io_enq_bits;
	output wire io_deq_valid;
	output wire io_deq_bits;
	reg io_deq_v;
	reg io_deq_b;
	reg io_deq_outPipe_valid;
	reg io_deq_outPipe_bits;
	reg io_deq_outPipe_valid_1;
	reg io_deq_outPipe_bits_1;
	assign io_deq_valid = io_deq_outPipe_valid_1;
	assign io_deq_bits = io_deq_outPipe_bits_1;
	always @(posedge clk) begin
		if (rst)
			io_deq_v <= 1'h0;
		else
			io_deq_v <= io_enq_valid;
		if (io_enq_valid)
			io_deq_b <= io_enq_bits;
		if (rst)
			io_deq_outPipe_valid <= 1'h0;
		else
			io_deq_outPipe_valid <= io_deq_v;
		if (io_deq_v)
			io_deq_outPipe_bits <= io_deq_b;
		if (rst)
			io_deq_outPipe_valid_1 <= 1'h0;
		else
			io_deq_outPipe_valid_1 <= io_deq_outPipe_valid;
		if (io_deq_outPipe_valid)
			io_deq_outPipe_bits_1 <= io_deq_outPipe_bits;
	end
endmodule
module Pipe_1 (
	clk,
	rst,
	io_enq_valid,
	io_enq_bits,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	input io_enq_valid;
	input [10:0] io_enq_bits;
	output wire io_deq_valid;
	output wire [10:0] io_deq_bits;
	reg io_deq_v;
	reg [10:0] io_deq_b;
	assign io_deq_valid = io_deq_v;
	assign io_deq_bits = io_deq_b;
	always @(posedge clk) begin
		if (rst)
			io_deq_v <= 1'h0;
		else
			io_deq_v <= io_enq_valid;
		if (io_enq_valid)
			io_deq_b <= io_enq_bits;
	end
endmodule
module Pipe_2 (
	clk,
	rst,
	io_enq_valid,
	io_enq_bits,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	input io_enq_valid;
	input [10:0] io_enq_bits;
	output wire io_deq_valid;
	output wire [10:0] io_deq_bits;
	reg io_deq_v;
	reg [10:0] io_deq_b;
	reg io_deq_outPipe_valid;
	reg [10:0] io_deq_outPipe_bits;
	assign io_deq_valid = io_deq_outPipe_valid;
	assign io_deq_bits = io_deq_outPipe_bits;
	always @(posedge clk) begin
		if (rst)
			io_deq_v <= 1'h0;
		else
			io_deq_v <= io_enq_valid;
		if (io_enq_valid)
			io_deq_b <= io_enq_bits;
		if (rst)
			io_deq_outPipe_valid <= 1'h0;
		else
			io_deq_outPipe_valid <= io_deq_v;
		if (io_deq_v)
			io_deq_outPipe_bits <= io_deq_b;
	end
endmodule
module MAC (
	clk,
	io_a,
	io_b,
	io_y
);
	input clk;
	input [7:0] io_a;
	input [7:0] io_b;
	output wire [16:0] io_y;
	reg [7:0] rA;
	reg [7:0] rB;
	wire [15:0] mult = $signed(rA) * $signed(rB);
	assign io_y = {mult[15], mult};
	always @(posedge clk) begin
		rA <= io_a;
		rB <= io_b;
	end
endmodule
module Adder (
	io_a,
	io_b,
	io_y
);
	input [16:0] io_a;
	input [16:0] io_b;
	output wire [17:0] io_y;
	assign io_y = $signed(io_a) + $signed(io_b);
endmodule
module Adder_8 (
	io_a,
	io_b,
	io_y
);
	input [17:0] io_a;
	input [17:0] io_b;
	output wire [18:0] io_y;
	assign io_y = $signed(io_a) + $signed(io_b);
endmodule
module PipeAdder (
	clk,
	io_a,
	io_b,
	io_y
);
	input clk;
	input [18:0] io_a;
	input [18:0] io_b;
	output wire [19:0] io_y;
	reg [18:0] rA;
	reg [18:0] rB;
	assign io_y = $signed(rA) + $signed(rB);
	always @(posedge clk) begin
		rA <= io_a;
		rB <= io_b;
	end
endmodule
module Adder_12 (
	io_a,
	io_b,
	io_y
);
	input [19:0] io_a;
	input [19:0] io_b;
	output wire [20:0] io_y;
	assign io_y = $signed(io_a) + $signed(io_b);
endmodule
module DotProduct (
	clk,
	io_a_0,
	io_a_1,
	io_a_2,
	io_a_3,
	io_a_4,
	io_a_5,
	io_a_6,
	io_a_7,
	io_a_8,
	io_a_9,
	io_a_10,
	io_a_11,
	io_a_12,
	io_a_13,
	io_a_14,
	io_a_15,
	io_b_0,
	io_b_1,
	io_b_2,
	io_b_3,
	io_b_4,
	io_b_5,
	io_b_6,
	io_b_7,
	io_b_8,
	io_b_9,
	io_b_10,
	io_b_11,
	io_b_12,
	io_b_13,
	io_b_14,
	io_b_15,
	io_y
);
	input clk;
	input [7:0] io_a_0;
	input [7:0] io_a_1;
	input [7:0] io_a_2;
	input [7:0] io_a_3;
	input [7:0] io_a_4;
	input [7:0] io_a_5;
	input [7:0] io_a_6;
	input [7:0] io_a_7;
	input [7:0] io_a_8;
	input [7:0] io_a_9;
	input [7:0] io_a_10;
	input [7:0] io_a_11;
	input [7:0] io_a_12;
	input [7:0] io_a_13;
	input [7:0] io_a_14;
	input [7:0] io_a_15;
	input [7:0] io_b_0;
	input [7:0] io_b_1;
	input [7:0] io_b_2;
	input [7:0] io_b_3;
	input [7:0] io_b_4;
	input [7:0] io_b_5;
	input [7:0] io_b_6;
	input [7:0] io_b_7;
	input [7:0] io_b_8;
	input [7:0] io_b_9;
	input [7:0] io_b_10;
	input [7:0] io_b_11;
	input [7:0] io_b_12;
	input [7:0] io_b_13;
	input [7:0] io_b_14;
	input [7:0] io_b_15;
	output wire [20:0] io_y;
	wire m_0_clock;
	wire [7:0] m_0_io_a;
	wire [7:0] m_0_io_b;
	wire [16:0] m_0_io_y;
	wire m_1_clock;
	wire [7:0] m_1_io_a;
	wire [7:0] m_1_io_b;
	wire [16:0] m_1_io_y;
	wire m_2_clock;
	wire [7:0] m_2_io_a;
	wire [7:0] m_2_io_b;
	wire [16:0] m_2_io_y;
	wire m_3_clock;
	wire [7:0] m_3_io_a;
	wire [7:0] m_3_io_b;
	wire [16:0] m_3_io_y;
	wire m_4_clock;
	wire [7:0] m_4_io_a;
	wire [7:0] m_4_io_b;
	wire [16:0] m_4_io_y;
	wire m_5_clock;
	wire [7:0] m_5_io_a;
	wire [7:0] m_5_io_b;
	wire [16:0] m_5_io_y;
	wire m_6_clock;
	wire [7:0] m_6_io_a;
	wire [7:0] m_6_io_b;
	wire [16:0] m_6_io_y;
	wire m_7_clock;
	wire [7:0] m_7_io_a;
	wire [7:0] m_7_io_b;
	wire [16:0] m_7_io_y;
	wire m_8_clock;
	wire [7:0] m_8_io_a;
	wire [7:0] m_8_io_b;
	wire [16:0] m_8_io_y;
	wire m_9_clock;
	wire [7:0] m_9_io_a;
	wire [7:0] m_9_io_b;
	wire [16:0] m_9_io_y;
	wire m_10_clock;
	wire [7:0] m_10_io_a;
	wire [7:0] m_10_io_b;
	wire [16:0] m_10_io_y;
	wire m_11_clock;
	wire [7:0] m_11_io_a;
	wire [7:0] m_11_io_b;
	wire [16:0] m_11_io_y;
	wire m_12_clock;
	wire [7:0] m_12_io_a;
	wire [7:0] m_12_io_b;
	wire [16:0] m_12_io_y;
	wire m_13_clock;
	wire [7:0] m_13_io_a;
	wire [7:0] m_13_io_b;
	wire [16:0] m_13_io_y;
	wire m_14_clock;
	wire [7:0] m_14_io_a;
	wire [7:0] m_14_io_b;
	wire [16:0] m_14_io_y;
	wire m_15_clock;
	wire [7:0] m_15_io_a;
	wire [7:0] m_15_io_b;
	wire [16:0] m_15_io_y;
	wire [16:0] a_0_0_io_a;
	wire [16:0] a_0_0_io_b;
	wire [17:0] a_0_0_io_y;
	wire [16:0] a_0_1_io_a;
	wire [16:0] a_0_1_io_b;
	wire [17:0] a_0_1_io_y;
	wire [16:0] a_0_2_io_a;
	wire [16:0] a_0_2_io_b;
	wire [17:0] a_0_2_io_y;
	wire [16:0] a_0_3_io_a;
	wire [16:0] a_0_3_io_b;
	wire [17:0] a_0_3_io_y;
	wire [16:0] a_0_4_io_a;
	wire [16:0] a_0_4_io_b;
	wire [17:0] a_0_4_io_y;
	wire [16:0] a_0_5_io_a;
	wire [16:0] a_0_5_io_b;
	wire [17:0] a_0_5_io_y;
	wire [16:0] a_0_6_io_a;
	wire [16:0] a_0_6_io_b;
	wire [17:0] a_0_6_io_y;
	wire [16:0] a_0_7_io_a;
	wire [16:0] a_0_7_io_b;
	wire [17:0] a_0_7_io_y;
	wire [17:0] a_1_0_io_a;
	wire [17:0] a_1_0_io_b;
	wire [18:0] a_1_0_io_y;
	wire [17:0] a_1_1_io_a;
	wire [17:0] a_1_1_io_b;
	wire [18:0] a_1_1_io_y;
	wire [17:0] a_1_2_io_a;
	wire [17:0] a_1_2_io_b;
	wire [18:0] a_1_2_io_y;
	wire [17:0] a_1_3_io_a;
	wire [17:0] a_1_3_io_b;
	wire [18:0] a_1_3_io_y;
	wire a_2_0_clock;
	wire [18:0] a_2_0_io_a;
	wire [18:0] a_2_0_io_b;
	wire [19:0] a_2_0_io_y;
	wire a_2_1_clock;
	wire [18:0] a_2_1_io_a;
	wire [18:0] a_2_1_io_b;
	wire [19:0] a_2_1_io_y;
	wire [19:0] a_3_0_io_a;
	wire [19:0] a_3_0_io_b;
	wire [20:0] a_3_0_io_y;
	MAC m_0(
		.clk(m_0_clock),
		.io_a(m_0_io_a),
		.io_b(m_0_io_b),
		.io_y(m_0_io_y)
	);
	MAC m_1(
		.clk(m_1_clock),
		.io_a(m_1_io_a),
		.io_b(m_1_io_b),
		.io_y(m_1_io_y)
	);
	MAC m_2(
		.clk(m_2_clock),
		.io_a(m_2_io_a),
		.io_b(m_2_io_b),
		.io_y(m_2_io_y)
	);
	MAC m_3(
		.clk(m_3_clock),
		.io_a(m_3_io_a),
		.io_b(m_3_io_b),
		.io_y(m_3_io_y)
	);
	MAC m_4(
		.clk(m_4_clock),
		.io_a(m_4_io_a),
		.io_b(m_4_io_b),
		.io_y(m_4_io_y)
	);
	MAC m_5(
		.clk(m_5_clock),
		.io_a(m_5_io_a),
		.io_b(m_5_io_b),
		.io_y(m_5_io_y)
	);
	MAC m_6(
		.clk(m_6_clock),
		.io_a(m_6_io_a),
		.io_b(m_6_io_b),
		.io_y(m_6_io_y)
	);
	MAC m_7(
		.clk(m_7_clock),
		.io_a(m_7_io_a),
		.io_b(m_7_io_b),
		.io_y(m_7_io_y)
	);
	MAC m_8(
		.clk(m_8_clock),
		.io_a(m_8_io_a),
		.io_b(m_8_io_b),
		.io_y(m_8_io_y)
	);
	MAC m_9(
		.clk(m_9_clock),
		.io_a(m_9_io_a),
		.io_b(m_9_io_b),
		.io_y(m_9_io_y)
	);
	MAC m_10(
		.clk(m_10_clock),
		.io_a(m_10_io_a),
		.io_b(m_10_io_b),
		.io_y(m_10_io_y)
	);
	MAC m_11(
		.clk(m_11_clock),
		.io_a(m_11_io_a),
		.io_b(m_11_io_b),
		.io_y(m_11_io_y)
	);
	MAC m_12(
		.clk(m_12_clock),
		.io_a(m_12_io_a),
		.io_b(m_12_io_b),
		.io_y(m_12_io_y)
	);
	MAC m_13(
		.clk(m_13_clock),
		.io_a(m_13_io_a),
		.io_b(m_13_io_b),
		.io_y(m_13_io_y)
	);
	MAC m_14(
		.clk(m_14_clock),
		.io_a(m_14_io_a),
		.io_b(m_14_io_b),
		.io_y(m_14_io_y)
	);
	MAC m_15(
		.clk(m_15_clock),
		.io_a(m_15_io_a),
		.io_b(m_15_io_b),
		.io_y(m_15_io_y)
	);
	Adder a_0_0(
		.io_a(a_0_0_io_a),
		.io_b(a_0_0_io_b),
		.io_y(a_0_0_io_y)
	);
	Adder a_0_1(
		.io_a(a_0_1_io_a),
		.io_b(a_0_1_io_b),
		.io_y(a_0_1_io_y)
	);
	Adder a_0_2(
		.io_a(a_0_2_io_a),
		.io_b(a_0_2_io_b),
		.io_y(a_0_2_io_y)
	);
	Adder a_0_3(
		.io_a(a_0_3_io_a),
		.io_b(a_0_3_io_b),
		.io_y(a_0_3_io_y)
	);
	Adder a_0_4(
		.io_a(a_0_4_io_a),
		.io_b(a_0_4_io_b),
		.io_y(a_0_4_io_y)
	);
	Adder a_0_5(
		.io_a(a_0_5_io_a),
		.io_b(a_0_5_io_b),
		.io_y(a_0_5_io_y)
	);
	Adder a_0_6(
		.io_a(a_0_6_io_a),
		.io_b(a_0_6_io_b),
		.io_y(a_0_6_io_y)
	);
	Adder a_0_7(
		.io_a(a_0_7_io_a),
		.io_b(a_0_7_io_b),
		.io_y(a_0_7_io_y)
	);
	Adder_8 a_1_0(
		.io_a(a_1_0_io_a),
		.io_b(a_1_0_io_b),
		.io_y(a_1_0_io_y)
	);
	Adder_8 a_1_1(
		.io_a(a_1_1_io_a),
		.io_b(a_1_1_io_b),
		.io_y(a_1_1_io_y)
	);
	Adder_8 a_1_2(
		.io_a(a_1_2_io_a),
		.io_b(a_1_2_io_b),
		.io_y(a_1_2_io_y)
	);
	Adder_8 a_1_3(
		.io_a(a_1_3_io_a),
		.io_b(a_1_3_io_b),
		.io_y(a_1_3_io_y)
	);
	PipeAdder a_2_0(
		.clk(a_2_0_clock),
		.io_a(a_2_0_io_a),
		.io_b(a_2_0_io_b),
		.io_y(a_2_0_io_y)
	);
	PipeAdder a_2_1(
		.clk(a_2_1_clock),
		.io_a(a_2_1_io_a),
		.io_b(a_2_1_io_b),
		.io_y(a_2_1_io_y)
	);
	Adder_12 a_3_0(
		.io_a(a_3_0_io_a),
		.io_b(a_3_0_io_b),
		.io_y(a_3_0_io_y)
	);
	assign io_y = a_3_0_io_y;
	assign m_0_clock = clk;
	assign m_0_io_a = io_a_0;
	assign m_0_io_b = io_b_0;
	assign m_1_clock = clk;
	assign m_1_io_a = io_a_1;
	assign m_1_io_b = io_b_1;
	assign m_2_clock = clk;
	assign m_2_io_a = io_a_2;
	assign m_2_io_b = io_b_2;
	assign m_3_clock = clk;
	assign m_3_io_a = io_a_3;
	assign m_3_io_b = io_b_3;
	assign m_4_clock = clk;
	assign m_4_io_a = io_a_4;
	assign m_4_io_b = io_b_4;
	assign m_5_clock = clk;
	assign m_5_io_a = io_a_5;
	assign m_5_io_b = io_b_5;
	assign m_6_clock = clk;
	assign m_6_io_a = io_a_6;
	assign m_6_io_b = io_b_6;
	assign m_7_clock = clk;
	assign m_7_io_a = io_a_7;
	assign m_7_io_b = io_b_7;
	assign m_8_clock = clk;
	assign m_8_io_a = io_a_8;
	assign m_8_io_b = io_b_8;
	assign m_9_clock = clk;
	assign m_9_io_a = io_a_9;
	assign m_9_io_b = io_b_9;
	assign m_10_clock = clk;
	assign m_10_io_a = io_a_10;
	assign m_10_io_b = io_b_10;
	assign m_11_clock = clk;
	assign m_11_io_a = io_a_11;
	assign m_11_io_b = io_b_11;
	assign m_12_clock = clk;
	assign m_12_io_a = io_a_12;
	assign m_12_io_b = io_b_12;
	assign m_13_clock = clk;
	assign m_13_io_a = io_a_13;
	assign m_13_io_b = io_b_13;
	assign m_14_clock = clk;
	assign m_14_io_a = io_a_14;
	assign m_14_io_b = io_b_14;
	assign m_15_clock = clk;
	assign m_15_io_a = io_a_15;
	assign m_15_io_b = io_b_15;
	assign a_0_0_io_a = m_0_io_y;
	assign a_0_0_io_b = m_1_io_y;
	assign a_0_1_io_a = m_2_io_y;
	assign a_0_1_io_b = m_3_io_y;
	assign a_0_2_io_a = m_4_io_y;
	assign a_0_2_io_b = m_5_io_y;
	assign a_0_3_io_a = m_6_io_y;
	assign a_0_3_io_b = m_7_io_y;
	assign a_0_4_io_a = m_8_io_y;
	assign a_0_4_io_b = m_9_io_y;
	assign a_0_5_io_a = m_10_io_y;
	assign a_0_5_io_b = m_11_io_y;
	assign a_0_6_io_a = m_12_io_y;
	assign a_0_6_io_b = m_13_io_y;
	assign a_0_7_io_a = m_14_io_y;
	assign a_0_7_io_b = m_15_io_y;
	assign a_1_0_io_a = a_0_0_io_y;
	assign a_1_0_io_b = a_0_1_io_y;
	assign a_1_1_io_a = a_0_2_io_y;
	assign a_1_1_io_b = a_0_3_io_y;
	assign a_1_2_io_a = a_0_4_io_y;
	assign a_1_2_io_b = a_0_5_io_y;
	assign a_1_3_io_a = a_0_6_io_y;
	assign a_1_3_io_b = a_0_7_io_y;
	assign a_2_0_clock = clk;
	assign a_2_0_io_a = a_1_0_io_y;
	assign a_2_0_io_b = a_1_1_io_y;
	assign a_2_1_clock = clk;
	assign a_2_1_io_a = a_1_2_io_y;
	assign a_2_1_io_b = a_1_3_io_y;
	assign a_3_0_io_a = a_2_0_io_y;
	assign a_3_0_io_b = a_2_1_io_y;
endmodule
module MatrixVectorMultiplicationBypass (
	clk,
	io_valid_reset,
	io_inp_data_bits_0_0,
	io_inp_data_bits_0_1,
	io_inp_data_bits_0_2,
	io_inp_data_bits_0_3,
	io_inp_data_bits_0_4,
	io_inp_data_bits_0_5,
	io_inp_data_bits_0_6,
	io_inp_data_bits_0_7,
	io_inp_data_bits_0_8,
	io_inp_data_bits_0_9,
	io_inp_data_bits_0_10,
	io_inp_data_bits_0_11,
	io_inp_data_bits_0_12,
	io_inp_data_bits_0_13,
	io_inp_data_bits_0_14,
	io_inp_data_bits_0_15,
	io_wgt_data_bits_0_0,
	io_wgt_data_bits_0_1,
	io_wgt_data_bits_0_2,
	io_wgt_data_bits_0_3,
	io_wgt_data_bits_0_4,
	io_wgt_data_bits_0_5,
	io_wgt_data_bits_0_6,
	io_wgt_data_bits_0_7,
	io_wgt_data_bits_0_8,
	io_wgt_data_bits_0_9,
	io_wgt_data_bits_0_10,
	io_wgt_data_bits_0_11,
	io_wgt_data_bits_0_12,
	io_wgt_data_bits_0_13,
	io_wgt_data_bits_0_14,
	io_wgt_data_bits_0_15,
	io_wgt_data_bits_1_0,
	io_wgt_data_bits_1_1,
	io_wgt_data_bits_1_2,
	io_wgt_data_bits_1_3,
	io_wgt_data_bits_1_4,
	io_wgt_data_bits_1_5,
	io_wgt_data_bits_1_6,
	io_wgt_data_bits_1_7,
	io_wgt_data_bits_1_8,
	io_wgt_data_bits_1_9,
	io_wgt_data_bits_1_10,
	io_wgt_data_bits_1_11,
	io_wgt_data_bits_1_12,
	io_wgt_data_bits_1_13,
	io_wgt_data_bits_1_14,
	io_wgt_data_bits_1_15,
	io_wgt_data_bits_2_0,
	io_wgt_data_bits_2_1,
	io_wgt_data_bits_2_2,
	io_wgt_data_bits_2_3,
	io_wgt_data_bits_2_4,
	io_wgt_data_bits_2_5,
	io_wgt_data_bits_2_6,
	io_wgt_data_bits_2_7,
	io_wgt_data_bits_2_8,
	io_wgt_data_bits_2_9,
	io_wgt_data_bits_2_10,
	io_wgt_data_bits_2_11,
	io_wgt_data_bits_2_12,
	io_wgt_data_bits_2_13,
	io_wgt_data_bits_2_14,
	io_wgt_data_bits_2_15,
	io_wgt_data_bits_3_0,
	io_wgt_data_bits_3_1,
	io_wgt_data_bits_3_2,
	io_wgt_data_bits_3_3,
	io_wgt_data_bits_3_4,
	io_wgt_data_bits_3_5,
	io_wgt_data_bits_3_6,
	io_wgt_data_bits_3_7,
	io_wgt_data_bits_3_8,
	io_wgt_data_bits_3_9,
	io_wgt_data_bits_3_10,
	io_wgt_data_bits_3_11,
	io_wgt_data_bits_3_12,
	io_wgt_data_bits_3_13,
	io_wgt_data_bits_3_14,
	io_wgt_data_bits_3_15,
	io_wgt_data_bits_4_0,
	io_wgt_data_bits_4_1,
	io_wgt_data_bits_4_2,
	io_wgt_data_bits_4_3,
	io_wgt_data_bits_4_4,
	io_wgt_data_bits_4_5,
	io_wgt_data_bits_4_6,
	io_wgt_data_bits_4_7,
	io_wgt_data_bits_4_8,
	io_wgt_data_bits_4_9,
	io_wgt_data_bits_4_10,
	io_wgt_data_bits_4_11,
	io_wgt_data_bits_4_12,
	io_wgt_data_bits_4_13,
	io_wgt_data_bits_4_14,
	io_wgt_data_bits_4_15,
	io_wgt_data_bits_5_0,
	io_wgt_data_bits_5_1,
	io_wgt_data_bits_5_2,
	io_wgt_data_bits_5_3,
	io_wgt_data_bits_5_4,
	io_wgt_data_bits_5_5,
	io_wgt_data_bits_5_6,
	io_wgt_data_bits_5_7,
	io_wgt_data_bits_5_8,
	io_wgt_data_bits_5_9,
	io_wgt_data_bits_5_10,
	io_wgt_data_bits_5_11,
	io_wgt_data_bits_5_12,
	io_wgt_data_bits_5_13,
	io_wgt_data_bits_5_14,
	io_wgt_data_bits_5_15,
	io_wgt_data_bits_6_0,
	io_wgt_data_bits_6_1,
	io_wgt_data_bits_6_2,
	io_wgt_data_bits_6_3,
	io_wgt_data_bits_6_4,
	io_wgt_data_bits_6_5,
	io_wgt_data_bits_6_6,
	io_wgt_data_bits_6_7,
	io_wgt_data_bits_6_8,
	io_wgt_data_bits_6_9,
	io_wgt_data_bits_6_10,
	io_wgt_data_bits_6_11,
	io_wgt_data_bits_6_12,
	io_wgt_data_bits_6_13,
	io_wgt_data_bits_6_14,
	io_wgt_data_bits_6_15,
	io_wgt_data_bits_7_0,
	io_wgt_data_bits_7_1,
	io_wgt_data_bits_7_2,
	io_wgt_data_bits_7_3,
	io_wgt_data_bits_7_4,
	io_wgt_data_bits_7_5,
	io_wgt_data_bits_7_6,
	io_wgt_data_bits_7_7,
	io_wgt_data_bits_7_8,
	io_wgt_data_bits_7_9,
	io_wgt_data_bits_7_10,
	io_wgt_data_bits_7_11,
	io_wgt_data_bits_7_12,
	io_wgt_data_bits_7_13,
	io_wgt_data_bits_7_14,
	io_wgt_data_bits_7_15,
	io_wgt_data_bits_8_0,
	io_wgt_data_bits_8_1,
	io_wgt_data_bits_8_2,
	io_wgt_data_bits_8_3,
	io_wgt_data_bits_8_4,
	io_wgt_data_bits_8_5,
	io_wgt_data_bits_8_6,
	io_wgt_data_bits_8_7,
	io_wgt_data_bits_8_8,
	io_wgt_data_bits_8_9,
	io_wgt_data_bits_8_10,
	io_wgt_data_bits_8_11,
	io_wgt_data_bits_8_12,
	io_wgt_data_bits_8_13,
	io_wgt_data_bits_8_14,
	io_wgt_data_bits_8_15,
	io_wgt_data_bits_9_0,
	io_wgt_data_bits_9_1,
	io_wgt_data_bits_9_2,
	io_wgt_data_bits_9_3,
	io_wgt_data_bits_9_4,
	io_wgt_data_bits_9_5,
	io_wgt_data_bits_9_6,
	io_wgt_data_bits_9_7,
	io_wgt_data_bits_9_8,
	io_wgt_data_bits_9_9,
	io_wgt_data_bits_9_10,
	io_wgt_data_bits_9_11,
	io_wgt_data_bits_9_12,
	io_wgt_data_bits_9_13,
	io_wgt_data_bits_9_14,
	io_wgt_data_bits_9_15,
	io_wgt_data_bits_10_0,
	io_wgt_data_bits_10_1,
	io_wgt_data_bits_10_2,
	io_wgt_data_bits_10_3,
	io_wgt_data_bits_10_4,
	io_wgt_data_bits_10_5,
	io_wgt_data_bits_10_6,
	io_wgt_data_bits_10_7,
	io_wgt_data_bits_10_8,
	io_wgt_data_bits_10_9,
	io_wgt_data_bits_10_10,
	io_wgt_data_bits_10_11,
	io_wgt_data_bits_10_12,
	io_wgt_data_bits_10_13,
	io_wgt_data_bits_10_14,
	io_wgt_data_bits_10_15,
	io_wgt_data_bits_11_0,
	io_wgt_data_bits_11_1,
	io_wgt_data_bits_11_2,
	io_wgt_data_bits_11_3,
	io_wgt_data_bits_11_4,
	io_wgt_data_bits_11_5,
	io_wgt_data_bits_11_6,
	io_wgt_data_bits_11_7,
	io_wgt_data_bits_11_8,
	io_wgt_data_bits_11_9,
	io_wgt_data_bits_11_10,
	io_wgt_data_bits_11_11,
	io_wgt_data_bits_11_12,
	io_wgt_data_bits_11_13,
	io_wgt_data_bits_11_14,
	io_wgt_data_bits_11_15,
	io_wgt_data_bits_12_0,
	io_wgt_data_bits_12_1,
	io_wgt_data_bits_12_2,
	io_wgt_data_bits_12_3,
	io_wgt_data_bits_12_4,
	io_wgt_data_bits_12_5,
	io_wgt_data_bits_12_6,
	io_wgt_data_bits_12_7,
	io_wgt_data_bits_12_8,
	io_wgt_data_bits_12_9,
	io_wgt_data_bits_12_10,
	io_wgt_data_bits_12_11,
	io_wgt_data_bits_12_12,
	io_wgt_data_bits_12_13,
	io_wgt_data_bits_12_14,
	io_wgt_data_bits_12_15,
	io_wgt_data_bits_13_0,
	io_wgt_data_bits_13_1,
	io_wgt_data_bits_13_2,
	io_wgt_data_bits_13_3,
	io_wgt_data_bits_13_4,
	io_wgt_data_bits_13_5,
	io_wgt_data_bits_13_6,
	io_wgt_data_bits_13_7,
	io_wgt_data_bits_13_8,
	io_wgt_data_bits_13_9,
	io_wgt_data_bits_13_10,
	io_wgt_data_bits_13_11,
	io_wgt_data_bits_13_12,
	io_wgt_data_bits_13_13,
	io_wgt_data_bits_13_14,
	io_wgt_data_bits_13_15,
	io_wgt_data_bits_14_0,
	io_wgt_data_bits_14_1,
	io_wgt_data_bits_14_2,
	io_wgt_data_bits_14_3,
	io_wgt_data_bits_14_4,
	io_wgt_data_bits_14_5,
	io_wgt_data_bits_14_6,
	io_wgt_data_bits_14_7,
	io_wgt_data_bits_14_8,
	io_wgt_data_bits_14_9,
	io_wgt_data_bits_14_10,
	io_wgt_data_bits_14_11,
	io_wgt_data_bits_14_12,
	io_wgt_data_bits_14_13,
	io_wgt_data_bits_14_14,
	io_wgt_data_bits_14_15,
	io_wgt_data_bits_15_0,
	io_wgt_data_bits_15_1,
	io_wgt_data_bits_15_2,
	io_wgt_data_bits_15_3,
	io_wgt_data_bits_15_4,
	io_wgt_data_bits_15_5,
	io_wgt_data_bits_15_6,
	io_wgt_data_bits_15_7,
	io_wgt_data_bits_15_8,
	io_wgt_data_bits_15_9,
	io_wgt_data_bits_15_10,
	io_wgt_data_bits_15_11,
	io_wgt_data_bits_15_12,
	io_wgt_data_bits_15_13,
	io_wgt_data_bits_15_14,
	io_wgt_data_bits_15_15,
	io_acc_i_data_valid,
	io_acc_i_data_bits_0_0,
	io_acc_i_data_bits_0_1,
	io_acc_i_data_bits_0_2,
	io_acc_i_data_bits_0_3,
	io_acc_i_data_bits_0_4,
	io_acc_i_data_bits_0_5,
	io_acc_i_data_bits_0_6,
	io_acc_i_data_bits_0_7,
	io_acc_i_data_bits_0_8,
	io_acc_i_data_bits_0_9,
	io_acc_i_data_bits_0_10,
	io_acc_i_data_bits_0_11,
	io_acc_i_data_bits_0_12,
	io_acc_i_data_bits_0_13,
	io_acc_i_data_bits_0_14,
	io_acc_i_data_bits_0_15,
	io_acc_o_data_valid,
	io_acc_o_data_bits_0_0,
	io_acc_o_data_bits_0_1,
	io_acc_o_data_bits_0_2,
	io_acc_o_data_bits_0_3,
	io_acc_o_data_bits_0_4,
	io_acc_o_data_bits_0_5,
	io_acc_o_data_bits_0_6,
	io_acc_o_data_bits_0_7,
	io_acc_o_data_bits_0_8,
	io_acc_o_data_bits_0_9,
	io_acc_o_data_bits_0_10,
	io_acc_o_data_bits_0_11,
	io_acc_o_data_bits_0_12,
	io_acc_o_data_bits_0_13,
	io_acc_o_data_bits_0_14,
	io_acc_o_data_bits_0_15,
	io_out_data_valid,
	io_out_data_bits_0_0,
	io_out_data_bits_0_1,
	io_out_data_bits_0_2,
	io_out_data_bits_0_3,
	io_out_data_bits_0_4,
	io_out_data_bits_0_5,
	io_out_data_bits_0_6,
	io_out_data_bits_0_7,
	io_out_data_bits_0_8,
	io_out_data_bits_0_9,
	io_out_data_bits_0_10,
	io_out_data_bits_0_11,
	io_out_data_bits_0_12,
	io_out_data_bits_0_13,
	io_out_data_bits_0_14,
	io_out_data_bits_0_15,
	io_bypass_cond
);
	input clk;
	input io_valid_reset;
	input [7:0] io_inp_data_bits_0_0;
	input [7:0] io_inp_data_bits_0_1;
	input [7:0] io_inp_data_bits_0_2;
	input [7:0] io_inp_data_bits_0_3;
	input [7:0] io_inp_data_bits_0_4;
	input [7:0] io_inp_data_bits_0_5;
	input [7:0] io_inp_data_bits_0_6;
	input [7:0] io_inp_data_bits_0_7;
	input [7:0] io_inp_data_bits_0_8;
	input [7:0] io_inp_data_bits_0_9;
	input [7:0] io_inp_data_bits_0_10;
	input [7:0] io_inp_data_bits_0_11;
	input [7:0] io_inp_data_bits_0_12;
	input [7:0] io_inp_data_bits_0_13;
	input [7:0] io_inp_data_bits_0_14;
	input [7:0] io_inp_data_bits_0_15;
	input [7:0] io_wgt_data_bits_0_0;
	input [7:0] io_wgt_data_bits_0_1;
	input [7:0] io_wgt_data_bits_0_2;
	input [7:0] io_wgt_data_bits_0_3;
	input [7:0] io_wgt_data_bits_0_4;
	input [7:0] io_wgt_data_bits_0_5;
	input [7:0] io_wgt_data_bits_0_6;
	input [7:0] io_wgt_data_bits_0_7;
	input [7:0] io_wgt_data_bits_0_8;
	input [7:0] io_wgt_data_bits_0_9;
	input [7:0] io_wgt_data_bits_0_10;
	input [7:0] io_wgt_data_bits_0_11;
	input [7:0] io_wgt_data_bits_0_12;
	input [7:0] io_wgt_data_bits_0_13;
	input [7:0] io_wgt_data_bits_0_14;
	input [7:0] io_wgt_data_bits_0_15;
	input [7:0] io_wgt_data_bits_1_0;
	input [7:0] io_wgt_data_bits_1_1;
	input [7:0] io_wgt_data_bits_1_2;
	input [7:0] io_wgt_data_bits_1_3;
	input [7:0] io_wgt_data_bits_1_4;
	input [7:0] io_wgt_data_bits_1_5;
	input [7:0] io_wgt_data_bits_1_6;
	input [7:0] io_wgt_data_bits_1_7;
	input [7:0] io_wgt_data_bits_1_8;
	input [7:0] io_wgt_data_bits_1_9;
	input [7:0] io_wgt_data_bits_1_10;
	input [7:0] io_wgt_data_bits_1_11;
	input [7:0] io_wgt_data_bits_1_12;
	input [7:0] io_wgt_data_bits_1_13;
	input [7:0] io_wgt_data_bits_1_14;
	input [7:0] io_wgt_data_bits_1_15;
	input [7:0] io_wgt_data_bits_2_0;
	input [7:0] io_wgt_data_bits_2_1;
	input [7:0] io_wgt_data_bits_2_2;
	input [7:0] io_wgt_data_bits_2_3;
	input [7:0] io_wgt_data_bits_2_4;
	input [7:0] io_wgt_data_bits_2_5;
	input [7:0] io_wgt_data_bits_2_6;
	input [7:0] io_wgt_data_bits_2_7;
	input [7:0] io_wgt_data_bits_2_8;
	input [7:0] io_wgt_data_bits_2_9;
	input [7:0] io_wgt_data_bits_2_10;
	input [7:0] io_wgt_data_bits_2_11;
	input [7:0] io_wgt_data_bits_2_12;
	input [7:0] io_wgt_data_bits_2_13;
	input [7:0] io_wgt_data_bits_2_14;
	input [7:0] io_wgt_data_bits_2_15;
	input [7:0] io_wgt_data_bits_3_0;
	input [7:0] io_wgt_data_bits_3_1;
	input [7:0] io_wgt_data_bits_3_2;
	input [7:0] io_wgt_data_bits_3_3;
	input [7:0] io_wgt_data_bits_3_4;
	input [7:0] io_wgt_data_bits_3_5;
	input [7:0] io_wgt_data_bits_3_6;
	input [7:0] io_wgt_data_bits_3_7;
	input [7:0] io_wgt_data_bits_3_8;
	input [7:0] io_wgt_data_bits_3_9;
	input [7:0] io_wgt_data_bits_3_10;
	input [7:0] io_wgt_data_bits_3_11;
	input [7:0] io_wgt_data_bits_3_12;
	input [7:0] io_wgt_data_bits_3_13;
	input [7:0] io_wgt_data_bits_3_14;
	input [7:0] io_wgt_data_bits_3_15;
	input [7:0] io_wgt_data_bits_4_0;
	input [7:0] io_wgt_data_bits_4_1;
	input [7:0] io_wgt_data_bits_4_2;
	input [7:0] io_wgt_data_bits_4_3;
	input [7:0] io_wgt_data_bits_4_4;
	input [7:0] io_wgt_data_bits_4_5;
	input [7:0] io_wgt_data_bits_4_6;
	input [7:0] io_wgt_data_bits_4_7;
	input [7:0] io_wgt_data_bits_4_8;
	input [7:0] io_wgt_data_bits_4_9;
	input [7:0] io_wgt_data_bits_4_10;
	input [7:0] io_wgt_data_bits_4_11;
	input [7:0] io_wgt_data_bits_4_12;
	input [7:0] io_wgt_data_bits_4_13;
	input [7:0] io_wgt_data_bits_4_14;
	input [7:0] io_wgt_data_bits_4_15;
	input [7:0] io_wgt_data_bits_5_0;
	input [7:0] io_wgt_data_bits_5_1;
	input [7:0] io_wgt_data_bits_5_2;
	input [7:0] io_wgt_data_bits_5_3;
	input [7:0] io_wgt_data_bits_5_4;
	input [7:0] io_wgt_data_bits_5_5;
	input [7:0] io_wgt_data_bits_5_6;
	input [7:0] io_wgt_data_bits_5_7;
	input [7:0] io_wgt_data_bits_5_8;
	input [7:0] io_wgt_data_bits_5_9;
	input [7:0] io_wgt_data_bits_5_10;
	input [7:0] io_wgt_data_bits_5_11;
	input [7:0] io_wgt_data_bits_5_12;
	input [7:0] io_wgt_data_bits_5_13;
	input [7:0] io_wgt_data_bits_5_14;
	input [7:0] io_wgt_data_bits_5_15;
	input [7:0] io_wgt_data_bits_6_0;
	input [7:0] io_wgt_data_bits_6_1;
	input [7:0] io_wgt_data_bits_6_2;
	input [7:0] io_wgt_data_bits_6_3;
	input [7:0] io_wgt_data_bits_6_4;
	input [7:0] io_wgt_data_bits_6_5;
	input [7:0] io_wgt_data_bits_6_6;
	input [7:0] io_wgt_data_bits_6_7;
	input [7:0] io_wgt_data_bits_6_8;
	input [7:0] io_wgt_data_bits_6_9;
	input [7:0] io_wgt_data_bits_6_10;
	input [7:0] io_wgt_data_bits_6_11;
	input [7:0] io_wgt_data_bits_6_12;
	input [7:0] io_wgt_data_bits_6_13;
	input [7:0] io_wgt_data_bits_6_14;
	input [7:0] io_wgt_data_bits_6_15;
	input [7:0] io_wgt_data_bits_7_0;
	input [7:0] io_wgt_data_bits_7_1;
	input [7:0] io_wgt_data_bits_7_2;
	input [7:0] io_wgt_data_bits_7_3;
	input [7:0] io_wgt_data_bits_7_4;
	input [7:0] io_wgt_data_bits_7_5;
	input [7:0] io_wgt_data_bits_7_6;
	input [7:0] io_wgt_data_bits_7_7;
	input [7:0] io_wgt_data_bits_7_8;
	input [7:0] io_wgt_data_bits_7_9;
	input [7:0] io_wgt_data_bits_7_10;
	input [7:0] io_wgt_data_bits_7_11;
	input [7:0] io_wgt_data_bits_7_12;
	input [7:0] io_wgt_data_bits_7_13;
	input [7:0] io_wgt_data_bits_7_14;
	input [7:0] io_wgt_data_bits_7_15;
	input [7:0] io_wgt_data_bits_8_0;
	input [7:0] io_wgt_data_bits_8_1;
	input [7:0] io_wgt_data_bits_8_2;
	input [7:0] io_wgt_data_bits_8_3;
	input [7:0] io_wgt_data_bits_8_4;
	input [7:0] io_wgt_data_bits_8_5;
	input [7:0] io_wgt_data_bits_8_6;
	input [7:0] io_wgt_data_bits_8_7;
	input [7:0] io_wgt_data_bits_8_8;
	input [7:0] io_wgt_data_bits_8_9;
	input [7:0] io_wgt_data_bits_8_10;
	input [7:0] io_wgt_data_bits_8_11;
	input [7:0] io_wgt_data_bits_8_12;
	input [7:0] io_wgt_data_bits_8_13;
	input [7:0] io_wgt_data_bits_8_14;
	input [7:0] io_wgt_data_bits_8_15;
	input [7:0] io_wgt_data_bits_9_0;
	input [7:0] io_wgt_data_bits_9_1;
	input [7:0] io_wgt_data_bits_9_2;
	input [7:0] io_wgt_data_bits_9_3;
	input [7:0] io_wgt_data_bits_9_4;
	input [7:0] io_wgt_data_bits_9_5;
	input [7:0] io_wgt_data_bits_9_6;
	input [7:0] io_wgt_data_bits_9_7;
	input [7:0] io_wgt_data_bits_9_8;
	input [7:0] io_wgt_data_bits_9_9;
	input [7:0] io_wgt_data_bits_9_10;
	input [7:0] io_wgt_data_bits_9_11;
	input [7:0] io_wgt_data_bits_9_12;
	input [7:0] io_wgt_data_bits_9_13;
	input [7:0] io_wgt_data_bits_9_14;
	input [7:0] io_wgt_data_bits_9_15;
	input [7:0] io_wgt_data_bits_10_0;
	input [7:0] io_wgt_data_bits_10_1;
	input [7:0] io_wgt_data_bits_10_2;
	input [7:0] io_wgt_data_bits_10_3;
	input [7:0] io_wgt_data_bits_10_4;
	input [7:0] io_wgt_data_bits_10_5;
	input [7:0] io_wgt_data_bits_10_6;
	input [7:0] io_wgt_data_bits_10_7;
	input [7:0] io_wgt_data_bits_10_8;
	input [7:0] io_wgt_data_bits_10_9;
	input [7:0] io_wgt_data_bits_10_10;
	input [7:0] io_wgt_data_bits_10_11;
	input [7:0] io_wgt_data_bits_10_12;
	input [7:0] io_wgt_data_bits_10_13;
	input [7:0] io_wgt_data_bits_10_14;
	input [7:0] io_wgt_data_bits_10_15;
	input [7:0] io_wgt_data_bits_11_0;
	input [7:0] io_wgt_data_bits_11_1;
	input [7:0] io_wgt_data_bits_11_2;
	input [7:0] io_wgt_data_bits_11_3;
	input [7:0] io_wgt_data_bits_11_4;
	input [7:0] io_wgt_data_bits_11_5;
	input [7:0] io_wgt_data_bits_11_6;
	input [7:0] io_wgt_data_bits_11_7;
	input [7:0] io_wgt_data_bits_11_8;
	input [7:0] io_wgt_data_bits_11_9;
	input [7:0] io_wgt_data_bits_11_10;
	input [7:0] io_wgt_data_bits_11_11;
	input [7:0] io_wgt_data_bits_11_12;
	input [7:0] io_wgt_data_bits_11_13;
	input [7:0] io_wgt_data_bits_11_14;
	input [7:0] io_wgt_data_bits_11_15;
	input [7:0] io_wgt_data_bits_12_0;
	input [7:0] io_wgt_data_bits_12_1;
	input [7:0] io_wgt_data_bits_12_2;
	input [7:0] io_wgt_data_bits_12_3;
	input [7:0] io_wgt_data_bits_12_4;
	input [7:0] io_wgt_data_bits_12_5;
	input [7:0] io_wgt_data_bits_12_6;
	input [7:0] io_wgt_data_bits_12_7;
	input [7:0] io_wgt_data_bits_12_8;
	input [7:0] io_wgt_data_bits_12_9;
	input [7:0] io_wgt_data_bits_12_10;
	input [7:0] io_wgt_data_bits_12_11;
	input [7:0] io_wgt_data_bits_12_12;
	input [7:0] io_wgt_data_bits_12_13;
	input [7:0] io_wgt_data_bits_12_14;
	input [7:0] io_wgt_data_bits_12_15;
	input [7:0] io_wgt_data_bits_13_0;
	input [7:0] io_wgt_data_bits_13_1;
	input [7:0] io_wgt_data_bits_13_2;
	input [7:0] io_wgt_data_bits_13_3;
	input [7:0] io_wgt_data_bits_13_4;
	input [7:0] io_wgt_data_bits_13_5;
	input [7:0] io_wgt_data_bits_13_6;
	input [7:0] io_wgt_data_bits_13_7;
	input [7:0] io_wgt_data_bits_13_8;
	input [7:0] io_wgt_data_bits_13_9;
	input [7:0] io_wgt_data_bits_13_10;
	input [7:0] io_wgt_data_bits_13_11;
	input [7:0] io_wgt_data_bits_13_12;
	input [7:0] io_wgt_data_bits_13_13;
	input [7:0] io_wgt_data_bits_13_14;
	input [7:0] io_wgt_data_bits_13_15;
	input [7:0] io_wgt_data_bits_14_0;
	input [7:0] io_wgt_data_bits_14_1;
	input [7:0] io_wgt_data_bits_14_2;
	input [7:0] io_wgt_data_bits_14_3;
	input [7:0] io_wgt_data_bits_14_4;
	input [7:0] io_wgt_data_bits_14_5;
	input [7:0] io_wgt_data_bits_14_6;
	input [7:0] io_wgt_data_bits_14_7;
	input [7:0] io_wgt_data_bits_14_8;
	input [7:0] io_wgt_data_bits_14_9;
	input [7:0] io_wgt_data_bits_14_10;
	input [7:0] io_wgt_data_bits_14_11;
	input [7:0] io_wgt_data_bits_14_12;
	input [7:0] io_wgt_data_bits_14_13;
	input [7:0] io_wgt_data_bits_14_14;
	input [7:0] io_wgt_data_bits_14_15;
	input [7:0] io_wgt_data_bits_15_0;
	input [7:0] io_wgt_data_bits_15_1;
	input [7:0] io_wgt_data_bits_15_2;
	input [7:0] io_wgt_data_bits_15_3;
	input [7:0] io_wgt_data_bits_15_4;
	input [7:0] io_wgt_data_bits_15_5;
	input [7:0] io_wgt_data_bits_15_6;
	input [7:0] io_wgt_data_bits_15_7;
	input [7:0] io_wgt_data_bits_15_8;
	input [7:0] io_wgt_data_bits_15_9;
	input [7:0] io_wgt_data_bits_15_10;
	input [7:0] io_wgt_data_bits_15_11;
	input [7:0] io_wgt_data_bits_15_12;
	input [7:0] io_wgt_data_bits_15_13;
	input [7:0] io_wgt_data_bits_15_14;
	input [7:0] io_wgt_data_bits_15_15;
	input io_acc_i_data_valid;
	input [31:0] io_acc_i_data_bits_0_0;
	input [31:0] io_acc_i_data_bits_0_1;
	input [31:0] io_acc_i_data_bits_0_2;
	input [31:0] io_acc_i_data_bits_0_3;
	input [31:0] io_acc_i_data_bits_0_4;
	input [31:0] io_acc_i_data_bits_0_5;
	input [31:0] io_acc_i_data_bits_0_6;
	input [31:0] io_acc_i_data_bits_0_7;
	input [31:0] io_acc_i_data_bits_0_8;
	input [31:0] io_acc_i_data_bits_0_9;
	input [31:0] io_acc_i_data_bits_0_10;
	input [31:0] io_acc_i_data_bits_0_11;
	input [31:0] io_acc_i_data_bits_0_12;
	input [31:0] io_acc_i_data_bits_0_13;
	input [31:0] io_acc_i_data_bits_0_14;
	input [31:0] io_acc_i_data_bits_0_15;
	output wire io_acc_o_data_valid;
	output wire [31:0] io_acc_o_data_bits_0_0;
	output wire [31:0] io_acc_o_data_bits_0_1;
	output wire [31:0] io_acc_o_data_bits_0_2;
	output wire [31:0] io_acc_o_data_bits_0_3;
	output wire [31:0] io_acc_o_data_bits_0_4;
	output wire [31:0] io_acc_o_data_bits_0_5;
	output wire [31:0] io_acc_o_data_bits_0_6;
	output wire [31:0] io_acc_o_data_bits_0_7;
	output wire [31:0] io_acc_o_data_bits_0_8;
	output wire [31:0] io_acc_o_data_bits_0_9;
	output wire [31:0] io_acc_o_data_bits_0_10;
	output wire [31:0] io_acc_o_data_bits_0_11;
	output wire [31:0] io_acc_o_data_bits_0_12;
	output wire [31:0] io_acc_o_data_bits_0_13;
	output wire [31:0] io_acc_o_data_bits_0_14;
	output wire [31:0] io_acc_o_data_bits_0_15;
	output wire io_out_data_valid;
	output wire [7:0] io_out_data_bits_0_0;
	output wire [7:0] io_out_data_bits_0_1;
	output wire [7:0] io_out_data_bits_0_2;
	output wire [7:0] io_out_data_bits_0_3;
	output wire [7:0] io_out_data_bits_0_4;
	output wire [7:0] io_out_data_bits_0_5;
	output wire [7:0] io_out_data_bits_0_6;
	output wire [7:0] io_out_data_bits_0_7;
	output wire [7:0] io_out_data_bits_0_8;
	output wire [7:0] io_out_data_bits_0_9;
	output wire [7:0] io_out_data_bits_0_10;
	output wire [7:0] io_out_data_bits_0_11;
	output wire [7:0] io_out_data_bits_0_12;
	output wire [7:0] io_out_data_bits_0_13;
	output wire [7:0] io_out_data_bits_0_14;
	output wire [7:0] io_out_data_bits_0_15;
	input io_bypass_cond;
	wire dot_0_0_clock;
	wire [7:0] dot_0_0_io_a_0;
	wire [7:0] dot_0_0_io_a_1;
	wire [7:0] dot_0_0_io_a_2;
	wire [7:0] dot_0_0_io_a_3;
	wire [7:0] dot_0_0_io_a_4;
	wire [7:0] dot_0_0_io_a_5;
	wire [7:0] dot_0_0_io_a_6;
	wire [7:0] dot_0_0_io_a_7;
	wire [7:0] dot_0_0_io_a_8;
	wire [7:0] dot_0_0_io_a_9;
	wire [7:0] dot_0_0_io_a_10;
	wire [7:0] dot_0_0_io_a_11;
	wire [7:0] dot_0_0_io_a_12;
	wire [7:0] dot_0_0_io_a_13;
	wire [7:0] dot_0_0_io_a_14;
	wire [7:0] dot_0_0_io_a_15;
	wire [7:0] dot_0_0_io_b_0;
	wire [7:0] dot_0_0_io_b_1;
	wire [7:0] dot_0_0_io_b_2;
	wire [7:0] dot_0_0_io_b_3;
	wire [7:0] dot_0_0_io_b_4;
	wire [7:0] dot_0_0_io_b_5;
	wire [7:0] dot_0_0_io_b_6;
	wire [7:0] dot_0_0_io_b_7;
	wire [7:0] dot_0_0_io_b_8;
	wire [7:0] dot_0_0_io_b_9;
	wire [7:0] dot_0_0_io_b_10;
	wire [7:0] dot_0_0_io_b_11;
	wire [7:0] dot_0_0_io_b_12;
	wire [7:0] dot_0_0_io_b_13;
	wire [7:0] dot_0_0_io_b_14;
	wire [7:0] dot_0_0_io_b_15;
	wire [20:0] dot_0_0_io_y;
	wire dot_0_1_clock;
	wire [7:0] dot_0_1_io_a_0;
	wire [7:0] dot_0_1_io_a_1;
	wire [7:0] dot_0_1_io_a_2;
	wire [7:0] dot_0_1_io_a_3;
	wire [7:0] dot_0_1_io_a_4;
	wire [7:0] dot_0_1_io_a_5;
	wire [7:0] dot_0_1_io_a_6;
	wire [7:0] dot_0_1_io_a_7;
	wire [7:0] dot_0_1_io_a_8;
	wire [7:0] dot_0_1_io_a_9;
	wire [7:0] dot_0_1_io_a_10;
	wire [7:0] dot_0_1_io_a_11;
	wire [7:0] dot_0_1_io_a_12;
	wire [7:0] dot_0_1_io_a_13;
	wire [7:0] dot_0_1_io_a_14;
	wire [7:0] dot_0_1_io_a_15;
	wire [7:0] dot_0_1_io_b_0;
	wire [7:0] dot_0_1_io_b_1;
	wire [7:0] dot_0_1_io_b_2;
	wire [7:0] dot_0_1_io_b_3;
	wire [7:0] dot_0_1_io_b_4;
	wire [7:0] dot_0_1_io_b_5;
	wire [7:0] dot_0_1_io_b_6;
	wire [7:0] dot_0_1_io_b_7;
	wire [7:0] dot_0_1_io_b_8;
	wire [7:0] dot_0_1_io_b_9;
	wire [7:0] dot_0_1_io_b_10;
	wire [7:0] dot_0_1_io_b_11;
	wire [7:0] dot_0_1_io_b_12;
	wire [7:0] dot_0_1_io_b_13;
	wire [7:0] dot_0_1_io_b_14;
	wire [7:0] dot_0_1_io_b_15;
	wire [20:0] dot_0_1_io_y;
	wire dot_0_2_clock;
	wire [7:0] dot_0_2_io_a_0;
	wire [7:0] dot_0_2_io_a_1;
	wire [7:0] dot_0_2_io_a_2;
	wire [7:0] dot_0_2_io_a_3;
	wire [7:0] dot_0_2_io_a_4;
	wire [7:0] dot_0_2_io_a_5;
	wire [7:0] dot_0_2_io_a_6;
	wire [7:0] dot_0_2_io_a_7;
	wire [7:0] dot_0_2_io_a_8;
	wire [7:0] dot_0_2_io_a_9;
	wire [7:0] dot_0_2_io_a_10;
	wire [7:0] dot_0_2_io_a_11;
	wire [7:0] dot_0_2_io_a_12;
	wire [7:0] dot_0_2_io_a_13;
	wire [7:0] dot_0_2_io_a_14;
	wire [7:0] dot_0_2_io_a_15;
	wire [7:0] dot_0_2_io_b_0;
	wire [7:0] dot_0_2_io_b_1;
	wire [7:0] dot_0_2_io_b_2;
	wire [7:0] dot_0_2_io_b_3;
	wire [7:0] dot_0_2_io_b_4;
	wire [7:0] dot_0_2_io_b_5;
	wire [7:0] dot_0_2_io_b_6;
	wire [7:0] dot_0_2_io_b_7;
	wire [7:0] dot_0_2_io_b_8;
	wire [7:0] dot_0_2_io_b_9;
	wire [7:0] dot_0_2_io_b_10;
	wire [7:0] dot_0_2_io_b_11;
	wire [7:0] dot_0_2_io_b_12;
	wire [7:0] dot_0_2_io_b_13;
	wire [7:0] dot_0_2_io_b_14;
	wire [7:0] dot_0_2_io_b_15;
	wire [20:0] dot_0_2_io_y;
	wire dot_0_3_clock;
	wire [7:0] dot_0_3_io_a_0;
	wire [7:0] dot_0_3_io_a_1;
	wire [7:0] dot_0_3_io_a_2;
	wire [7:0] dot_0_3_io_a_3;
	wire [7:0] dot_0_3_io_a_4;
	wire [7:0] dot_0_3_io_a_5;
	wire [7:0] dot_0_3_io_a_6;
	wire [7:0] dot_0_3_io_a_7;
	wire [7:0] dot_0_3_io_a_8;
	wire [7:0] dot_0_3_io_a_9;
	wire [7:0] dot_0_3_io_a_10;
	wire [7:0] dot_0_3_io_a_11;
	wire [7:0] dot_0_3_io_a_12;
	wire [7:0] dot_0_3_io_a_13;
	wire [7:0] dot_0_3_io_a_14;
	wire [7:0] dot_0_3_io_a_15;
	wire [7:0] dot_0_3_io_b_0;
	wire [7:0] dot_0_3_io_b_1;
	wire [7:0] dot_0_3_io_b_2;
	wire [7:0] dot_0_3_io_b_3;
	wire [7:0] dot_0_3_io_b_4;
	wire [7:0] dot_0_3_io_b_5;
	wire [7:0] dot_0_3_io_b_6;
	wire [7:0] dot_0_3_io_b_7;
	wire [7:0] dot_0_3_io_b_8;
	wire [7:0] dot_0_3_io_b_9;
	wire [7:0] dot_0_3_io_b_10;
	wire [7:0] dot_0_3_io_b_11;
	wire [7:0] dot_0_3_io_b_12;
	wire [7:0] dot_0_3_io_b_13;
	wire [7:0] dot_0_3_io_b_14;
	wire [7:0] dot_0_3_io_b_15;
	wire [20:0] dot_0_3_io_y;
	wire dot_0_4_clock;
	wire [7:0] dot_0_4_io_a_0;
	wire [7:0] dot_0_4_io_a_1;
	wire [7:0] dot_0_4_io_a_2;
	wire [7:0] dot_0_4_io_a_3;
	wire [7:0] dot_0_4_io_a_4;
	wire [7:0] dot_0_4_io_a_5;
	wire [7:0] dot_0_4_io_a_6;
	wire [7:0] dot_0_4_io_a_7;
	wire [7:0] dot_0_4_io_a_8;
	wire [7:0] dot_0_4_io_a_9;
	wire [7:0] dot_0_4_io_a_10;
	wire [7:0] dot_0_4_io_a_11;
	wire [7:0] dot_0_4_io_a_12;
	wire [7:0] dot_0_4_io_a_13;
	wire [7:0] dot_0_4_io_a_14;
	wire [7:0] dot_0_4_io_a_15;
	wire [7:0] dot_0_4_io_b_0;
	wire [7:0] dot_0_4_io_b_1;
	wire [7:0] dot_0_4_io_b_2;
	wire [7:0] dot_0_4_io_b_3;
	wire [7:0] dot_0_4_io_b_4;
	wire [7:0] dot_0_4_io_b_5;
	wire [7:0] dot_0_4_io_b_6;
	wire [7:0] dot_0_4_io_b_7;
	wire [7:0] dot_0_4_io_b_8;
	wire [7:0] dot_0_4_io_b_9;
	wire [7:0] dot_0_4_io_b_10;
	wire [7:0] dot_0_4_io_b_11;
	wire [7:0] dot_0_4_io_b_12;
	wire [7:0] dot_0_4_io_b_13;
	wire [7:0] dot_0_4_io_b_14;
	wire [7:0] dot_0_4_io_b_15;
	wire [20:0] dot_0_4_io_y;
	wire dot_0_5_clock;
	wire [7:0] dot_0_5_io_a_0;
	wire [7:0] dot_0_5_io_a_1;
	wire [7:0] dot_0_5_io_a_2;
	wire [7:0] dot_0_5_io_a_3;
	wire [7:0] dot_0_5_io_a_4;
	wire [7:0] dot_0_5_io_a_5;
	wire [7:0] dot_0_5_io_a_6;
	wire [7:0] dot_0_5_io_a_7;
	wire [7:0] dot_0_5_io_a_8;
	wire [7:0] dot_0_5_io_a_9;
	wire [7:0] dot_0_5_io_a_10;
	wire [7:0] dot_0_5_io_a_11;
	wire [7:0] dot_0_5_io_a_12;
	wire [7:0] dot_0_5_io_a_13;
	wire [7:0] dot_0_5_io_a_14;
	wire [7:0] dot_0_5_io_a_15;
	wire [7:0] dot_0_5_io_b_0;
	wire [7:0] dot_0_5_io_b_1;
	wire [7:0] dot_0_5_io_b_2;
	wire [7:0] dot_0_5_io_b_3;
	wire [7:0] dot_0_5_io_b_4;
	wire [7:0] dot_0_5_io_b_5;
	wire [7:0] dot_0_5_io_b_6;
	wire [7:0] dot_0_5_io_b_7;
	wire [7:0] dot_0_5_io_b_8;
	wire [7:0] dot_0_5_io_b_9;
	wire [7:0] dot_0_5_io_b_10;
	wire [7:0] dot_0_5_io_b_11;
	wire [7:0] dot_0_5_io_b_12;
	wire [7:0] dot_0_5_io_b_13;
	wire [7:0] dot_0_5_io_b_14;
	wire [7:0] dot_0_5_io_b_15;
	wire [20:0] dot_0_5_io_y;
	wire dot_0_6_clock;
	wire [7:0] dot_0_6_io_a_0;
	wire [7:0] dot_0_6_io_a_1;
	wire [7:0] dot_0_6_io_a_2;
	wire [7:0] dot_0_6_io_a_3;
	wire [7:0] dot_0_6_io_a_4;
	wire [7:0] dot_0_6_io_a_5;
	wire [7:0] dot_0_6_io_a_6;
	wire [7:0] dot_0_6_io_a_7;
	wire [7:0] dot_0_6_io_a_8;
	wire [7:0] dot_0_6_io_a_9;
	wire [7:0] dot_0_6_io_a_10;
	wire [7:0] dot_0_6_io_a_11;
	wire [7:0] dot_0_6_io_a_12;
	wire [7:0] dot_0_6_io_a_13;
	wire [7:0] dot_0_6_io_a_14;
	wire [7:0] dot_0_6_io_a_15;
	wire [7:0] dot_0_6_io_b_0;
	wire [7:0] dot_0_6_io_b_1;
	wire [7:0] dot_0_6_io_b_2;
	wire [7:0] dot_0_6_io_b_3;
	wire [7:0] dot_0_6_io_b_4;
	wire [7:0] dot_0_6_io_b_5;
	wire [7:0] dot_0_6_io_b_6;
	wire [7:0] dot_0_6_io_b_7;
	wire [7:0] dot_0_6_io_b_8;
	wire [7:0] dot_0_6_io_b_9;
	wire [7:0] dot_0_6_io_b_10;
	wire [7:0] dot_0_6_io_b_11;
	wire [7:0] dot_0_6_io_b_12;
	wire [7:0] dot_0_6_io_b_13;
	wire [7:0] dot_0_6_io_b_14;
	wire [7:0] dot_0_6_io_b_15;
	wire [20:0] dot_0_6_io_y;
	wire dot_0_7_clock;
	wire [7:0] dot_0_7_io_a_0;
	wire [7:0] dot_0_7_io_a_1;
	wire [7:0] dot_0_7_io_a_2;
	wire [7:0] dot_0_7_io_a_3;
	wire [7:0] dot_0_7_io_a_4;
	wire [7:0] dot_0_7_io_a_5;
	wire [7:0] dot_0_7_io_a_6;
	wire [7:0] dot_0_7_io_a_7;
	wire [7:0] dot_0_7_io_a_8;
	wire [7:0] dot_0_7_io_a_9;
	wire [7:0] dot_0_7_io_a_10;
	wire [7:0] dot_0_7_io_a_11;
	wire [7:0] dot_0_7_io_a_12;
	wire [7:0] dot_0_7_io_a_13;
	wire [7:0] dot_0_7_io_a_14;
	wire [7:0] dot_0_7_io_a_15;
	wire [7:0] dot_0_7_io_b_0;
	wire [7:0] dot_0_7_io_b_1;
	wire [7:0] dot_0_7_io_b_2;
	wire [7:0] dot_0_7_io_b_3;
	wire [7:0] dot_0_7_io_b_4;
	wire [7:0] dot_0_7_io_b_5;
	wire [7:0] dot_0_7_io_b_6;
	wire [7:0] dot_0_7_io_b_7;
	wire [7:0] dot_0_7_io_b_8;
	wire [7:0] dot_0_7_io_b_9;
	wire [7:0] dot_0_7_io_b_10;
	wire [7:0] dot_0_7_io_b_11;
	wire [7:0] dot_0_7_io_b_12;
	wire [7:0] dot_0_7_io_b_13;
	wire [7:0] dot_0_7_io_b_14;
	wire [7:0] dot_0_7_io_b_15;
	wire [20:0] dot_0_7_io_y;
	wire dot_0_8_clock;
	wire [7:0] dot_0_8_io_a_0;
	wire [7:0] dot_0_8_io_a_1;
	wire [7:0] dot_0_8_io_a_2;
	wire [7:0] dot_0_8_io_a_3;
	wire [7:0] dot_0_8_io_a_4;
	wire [7:0] dot_0_8_io_a_5;
	wire [7:0] dot_0_8_io_a_6;
	wire [7:0] dot_0_8_io_a_7;
	wire [7:0] dot_0_8_io_a_8;
	wire [7:0] dot_0_8_io_a_9;
	wire [7:0] dot_0_8_io_a_10;
	wire [7:0] dot_0_8_io_a_11;
	wire [7:0] dot_0_8_io_a_12;
	wire [7:0] dot_0_8_io_a_13;
	wire [7:0] dot_0_8_io_a_14;
	wire [7:0] dot_0_8_io_a_15;
	wire [7:0] dot_0_8_io_b_0;
	wire [7:0] dot_0_8_io_b_1;
	wire [7:0] dot_0_8_io_b_2;
	wire [7:0] dot_0_8_io_b_3;
	wire [7:0] dot_0_8_io_b_4;
	wire [7:0] dot_0_8_io_b_5;
	wire [7:0] dot_0_8_io_b_6;
	wire [7:0] dot_0_8_io_b_7;
	wire [7:0] dot_0_8_io_b_8;
	wire [7:0] dot_0_8_io_b_9;
	wire [7:0] dot_0_8_io_b_10;
	wire [7:0] dot_0_8_io_b_11;
	wire [7:0] dot_0_8_io_b_12;
	wire [7:0] dot_0_8_io_b_13;
	wire [7:0] dot_0_8_io_b_14;
	wire [7:0] dot_0_8_io_b_15;
	wire [20:0] dot_0_8_io_y;
	wire dot_0_9_clock;
	wire [7:0] dot_0_9_io_a_0;
	wire [7:0] dot_0_9_io_a_1;
	wire [7:0] dot_0_9_io_a_2;
	wire [7:0] dot_0_9_io_a_3;
	wire [7:0] dot_0_9_io_a_4;
	wire [7:0] dot_0_9_io_a_5;
	wire [7:0] dot_0_9_io_a_6;
	wire [7:0] dot_0_9_io_a_7;
	wire [7:0] dot_0_9_io_a_8;
	wire [7:0] dot_0_9_io_a_9;
	wire [7:0] dot_0_9_io_a_10;
	wire [7:0] dot_0_9_io_a_11;
	wire [7:0] dot_0_9_io_a_12;
	wire [7:0] dot_0_9_io_a_13;
	wire [7:0] dot_0_9_io_a_14;
	wire [7:0] dot_0_9_io_a_15;
	wire [7:0] dot_0_9_io_b_0;
	wire [7:0] dot_0_9_io_b_1;
	wire [7:0] dot_0_9_io_b_2;
	wire [7:0] dot_0_9_io_b_3;
	wire [7:0] dot_0_9_io_b_4;
	wire [7:0] dot_0_9_io_b_5;
	wire [7:0] dot_0_9_io_b_6;
	wire [7:0] dot_0_9_io_b_7;
	wire [7:0] dot_0_9_io_b_8;
	wire [7:0] dot_0_9_io_b_9;
	wire [7:0] dot_0_9_io_b_10;
	wire [7:0] dot_0_9_io_b_11;
	wire [7:0] dot_0_9_io_b_12;
	wire [7:0] dot_0_9_io_b_13;
	wire [7:0] dot_0_9_io_b_14;
	wire [7:0] dot_0_9_io_b_15;
	wire [20:0] dot_0_9_io_y;
	wire dot_0_10_clock;
	wire [7:0] dot_0_10_io_a_0;
	wire [7:0] dot_0_10_io_a_1;
	wire [7:0] dot_0_10_io_a_2;
	wire [7:0] dot_0_10_io_a_3;
	wire [7:0] dot_0_10_io_a_4;
	wire [7:0] dot_0_10_io_a_5;
	wire [7:0] dot_0_10_io_a_6;
	wire [7:0] dot_0_10_io_a_7;
	wire [7:0] dot_0_10_io_a_8;
	wire [7:0] dot_0_10_io_a_9;
	wire [7:0] dot_0_10_io_a_10;
	wire [7:0] dot_0_10_io_a_11;
	wire [7:0] dot_0_10_io_a_12;
	wire [7:0] dot_0_10_io_a_13;
	wire [7:0] dot_0_10_io_a_14;
	wire [7:0] dot_0_10_io_a_15;
	wire [7:0] dot_0_10_io_b_0;
	wire [7:0] dot_0_10_io_b_1;
	wire [7:0] dot_0_10_io_b_2;
	wire [7:0] dot_0_10_io_b_3;
	wire [7:0] dot_0_10_io_b_4;
	wire [7:0] dot_0_10_io_b_5;
	wire [7:0] dot_0_10_io_b_6;
	wire [7:0] dot_0_10_io_b_7;
	wire [7:0] dot_0_10_io_b_8;
	wire [7:0] dot_0_10_io_b_9;
	wire [7:0] dot_0_10_io_b_10;
	wire [7:0] dot_0_10_io_b_11;
	wire [7:0] dot_0_10_io_b_12;
	wire [7:0] dot_0_10_io_b_13;
	wire [7:0] dot_0_10_io_b_14;
	wire [7:0] dot_0_10_io_b_15;
	wire [20:0] dot_0_10_io_y;
	wire dot_0_11_clock;
	wire [7:0] dot_0_11_io_a_0;
	wire [7:0] dot_0_11_io_a_1;
	wire [7:0] dot_0_11_io_a_2;
	wire [7:0] dot_0_11_io_a_3;
	wire [7:0] dot_0_11_io_a_4;
	wire [7:0] dot_0_11_io_a_5;
	wire [7:0] dot_0_11_io_a_6;
	wire [7:0] dot_0_11_io_a_7;
	wire [7:0] dot_0_11_io_a_8;
	wire [7:0] dot_0_11_io_a_9;
	wire [7:0] dot_0_11_io_a_10;
	wire [7:0] dot_0_11_io_a_11;
	wire [7:0] dot_0_11_io_a_12;
	wire [7:0] dot_0_11_io_a_13;
	wire [7:0] dot_0_11_io_a_14;
	wire [7:0] dot_0_11_io_a_15;
	wire [7:0] dot_0_11_io_b_0;
	wire [7:0] dot_0_11_io_b_1;
	wire [7:0] dot_0_11_io_b_2;
	wire [7:0] dot_0_11_io_b_3;
	wire [7:0] dot_0_11_io_b_4;
	wire [7:0] dot_0_11_io_b_5;
	wire [7:0] dot_0_11_io_b_6;
	wire [7:0] dot_0_11_io_b_7;
	wire [7:0] dot_0_11_io_b_8;
	wire [7:0] dot_0_11_io_b_9;
	wire [7:0] dot_0_11_io_b_10;
	wire [7:0] dot_0_11_io_b_11;
	wire [7:0] dot_0_11_io_b_12;
	wire [7:0] dot_0_11_io_b_13;
	wire [7:0] dot_0_11_io_b_14;
	wire [7:0] dot_0_11_io_b_15;
	wire [20:0] dot_0_11_io_y;
	wire dot_0_12_clock;
	wire [7:0] dot_0_12_io_a_0;
	wire [7:0] dot_0_12_io_a_1;
	wire [7:0] dot_0_12_io_a_2;
	wire [7:0] dot_0_12_io_a_3;
	wire [7:0] dot_0_12_io_a_4;
	wire [7:0] dot_0_12_io_a_5;
	wire [7:0] dot_0_12_io_a_6;
	wire [7:0] dot_0_12_io_a_7;
	wire [7:0] dot_0_12_io_a_8;
	wire [7:0] dot_0_12_io_a_9;
	wire [7:0] dot_0_12_io_a_10;
	wire [7:0] dot_0_12_io_a_11;
	wire [7:0] dot_0_12_io_a_12;
	wire [7:0] dot_0_12_io_a_13;
	wire [7:0] dot_0_12_io_a_14;
	wire [7:0] dot_0_12_io_a_15;
	wire [7:0] dot_0_12_io_b_0;
	wire [7:0] dot_0_12_io_b_1;
	wire [7:0] dot_0_12_io_b_2;
	wire [7:0] dot_0_12_io_b_3;
	wire [7:0] dot_0_12_io_b_4;
	wire [7:0] dot_0_12_io_b_5;
	wire [7:0] dot_0_12_io_b_6;
	wire [7:0] dot_0_12_io_b_7;
	wire [7:0] dot_0_12_io_b_8;
	wire [7:0] dot_0_12_io_b_9;
	wire [7:0] dot_0_12_io_b_10;
	wire [7:0] dot_0_12_io_b_11;
	wire [7:0] dot_0_12_io_b_12;
	wire [7:0] dot_0_12_io_b_13;
	wire [7:0] dot_0_12_io_b_14;
	wire [7:0] dot_0_12_io_b_15;
	wire [20:0] dot_0_12_io_y;
	wire dot_0_13_clock;
	wire [7:0] dot_0_13_io_a_0;
	wire [7:0] dot_0_13_io_a_1;
	wire [7:0] dot_0_13_io_a_2;
	wire [7:0] dot_0_13_io_a_3;
	wire [7:0] dot_0_13_io_a_4;
	wire [7:0] dot_0_13_io_a_5;
	wire [7:0] dot_0_13_io_a_6;
	wire [7:0] dot_0_13_io_a_7;
	wire [7:0] dot_0_13_io_a_8;
	wire [7:0] dot_0_13_io_a_9;
	wire [7:0] dot_0_13_io_a_10;
	wire [7:0] dot_0_13_io_a_11;
	wire [7:0] dot_0_13_io_a_12;
	wire [7:0] dot_0_13_io_a_13;
	wire [7:0] dot_0_13_io_a_14;
	wire [7:0] dot_0_13_io_a_15;
	wire [7:0] dot_0_13_io_b_0;
	wire [7:0] dot_0_13_io_b_1;
	wire [7:0] dot_0_13_io_b_2;
	wire [7:0] dot_0_13_io_b_3;
	wire [7:0] dot_0_13_io_b_4;
	wire [7:0] dot_0_13_io_b_5;
	wire [7:0] dot_0_13_io_b_6;
	wire [7:0] dot_0_13_io_b_7;
	wire [7:0] dot_0_13_io_b_8;
	wire [7:0] dot_0_13_io_b_9;
	wire [7:0] dot_0_13_io_b_10;
	wire [7:0] dot_0_13_io_b_11;
	wire [7:0] dot_0_13_io_b_12;
	wire [7:0] dot_0_13_io_b_13;
	wire [7:0] dot_0_13_io_b_14;
	wire [7:0] dot_0_13_io_b_15;
	wire [20:0] dot_0_13_io_y;
	wire dot_0_14_clock;
	wire [7:0] dot_0_14_io_a_0;
	wire [7:0] dot_0_14_io_a_1;
	wire [7:0] dot_0_14_io_a_2;
	wire [7:0] dot_0_14_io_a_3;
	wire [7:0] dot_0_14_io_a_4;
	wire [7:0] dot_0_14_io_a_5;
	wire [7:0] dot_0_14_io_a_6;
	wire [7:0] dot_0_14_io_a_7;
	wire [7:0] dot_0_14_io_a_8;
	wire [7:0] dot_0_14_io_a_9;
	wire [7:0] dot_0_14_io_a_10;
	wire [7:0] dot_0_14_io_a_11;
	wire [7:0] dot_0_14_io_a_12;
	wire [7:0] dot_0_14_io_a_13;
	wire [7:0] dot_0_14_io_a_14;
	wire [7:0] dot_0_14_io_a_15;
	wire [7:0] dot_0_14_io_b_0;
	wire [7:0] dot_0_14_io_b_1;
	wire [7:0] dot_0_14_io_b_2;
	wire [7:0] dot_0_14_io_b_3;
	wire [7:0] dot_0_14_io_b_4;
	wire [7:0] dot_0_14_io_b_5;
	wire [7:0] dot_0_14_io_b_6;
	wire [7:0] dot_0_14_io_b_7;
	wire [7:0] dot_0_14_io_b_8;
	wire [7:0] dot_0_14_io_b_9;
	wire [7:0] dot_0_14_io_b_10;
	wire [7:0] dot_0_14_io_b_11;
	wire [7:0] dot_0_14_io_b_12;
	wire [7:0] dot_0_14_io_b_13;
	wire [7:0] dot_0_14_io_b_14;
	wire [7:0] dot_0_14_io_b_15;
	wire [20:0] dot_0_14_io_y;
	wire dot_0_15_clock;
	wire [7:0] dot_0_15_io_a_0;
	wire [7:0] dot_0_15_io_a_1;
	wire [7:0] dot_0_15_io_a_2;
	wire [7:0] dot_0_15_io_a_3;
	wire [7:0] dot_0_15_io_a_4;
	wire [7:0] dot_0_15_io_a_5;
	wire [7:0] dot_0_15_io_a_6;
	wire [7:0] dot_0_15_io_a_7;
	wire [7:0] dot_0_15_io_a_8;
	wire [7:0] dot_0_15_io_a_9;
	wire [7:0] dot_0_15_io_a_10;
	wire [7:0] dot_0_15_io_a_11;
	wire [7:0] dot_0_15_io_a_12;
	wire [7:0] dot_0_15_io_a_13;
	wire [7:0] dot_0_15_io_a_14;
	wire [7:0] dot_0_15_io_a_15;
	wire [7:0] dot_0_15_io_b_0;
	wire [7:0] dot_0_15_io_b_1;
	wire [7:0] dot_0_15_io_b_2;
	wire [7:0] dot_0_15_io_b_3;
	wire [7:0] dot_0_15_io_b_4;
	wire [7:0] dot_0_15_io_b_5;
	wire [7:0] dot_0_15_io_b_6;
	wire [7:0] dot_0_15_io_b_7;
	wire [7:0] dot_0_15_io_b_8;
	wire [7:0] dot_0_15_io_b_9;
	wire [7:0] dot_0_15_io_b_10;
	wire [7:0] dot_0_15_io_b_11;
	wire [7:0] dot_0_15_io_b_12;
	wire [7:0] dot_0_15_io_b_13;
	wire [7:0] dot_0_15_io_b_14;
	wire [7:0] dot_0_15_io_b_15;
	wire [20:0] dot_0_15_io_y;
	reg [31:0] last_acc_write_0_0;
	reg [31:0] last_acc_write_0_1;
	reg [31:0] last_acc_write_0_2;
	reg [31:0] last_acc_write_0_3;
	reg [31:0] last_acc_write_0_4;
	reg [31:0] last_acc_write_0_5;
	reg [31:0] last_acc_write_0_6;
	reg [31:0] last_acc_write_0_7;
	reg [31:0] last_acc_write_0_8;
	reg [31:0] last_acc_write_0_9;
	reg [31:0] last_acc_write_0_10;
	reg [31:0] last_acc_write_0_11;
	reg [31:0] last_acc_write_0_12;
	reg [31:0] last_acc_write_0_13;
	reg [31:0] last_acc_write_0_14;
	reg [31:0] last_acc_write_0_15;
	wire [31:0] byp = (io_bypass_cond ? $signed(last_acc_write_0_0) : $signed(io_acc_i_data_bits_0_0));
	wire [31:0] _GEN_0 = {{11 {dot_0_0_io_y[20]}}, dot_0_0_io_y};
	wire [31:0] add_0_0 = $signed(byp) + $signed(_GEN_0);
	wire [31:0] _io_out_data_bits_0_0_T = $signed(byp) + $signed(_GEN_0);
	wire [31:0] byp_1 = (io_bypass_cond ? $signed(last_acc_write_0_1) : $signed(io_acc_i_data_bits_0_1));
	wire [31:0] _GEN_1 = {{11 {dot_0_1_io_y[20]}}, dot_0_1_io_y};
	wire [31:0] add_0_1 = $signed(byp_1) + $signed(_GEN_1);
	wire [31:0] _io_out_data_bits_0_1_T = $signed(byp_1) + $signed(_GEN_1);
	wire [31:0] byp_2 = (io_bypass_cond ? $signed(last_acc_write_0_2) : $signed(io_acc_i_data_bits_0_2));
	wire [31:0] _GEN_2 = {{11 {dot_0_2_io_y[20]}}, dot_0_2_io_y};
	wire [31:0] add_0_2 = $signed(byp_2) + $signed(_GEN_2);
	wire [31:0] _io_out_data_bits_0_2_T = $signed(byp_2) + $signed(_GEN_2);
	wire [31:0] byp_3 = (io_bypass_cond ? $signed(last_acc_write_0_3) : $signed(io_acc_i_data_bits_0_3));
	wire [31:0] _GEN_3 = {{11 {dot_0_3_io_y[20]}}, dot_0_3_io_y};
	wire [31:0] add_0_3 = $signed(byp_3) + $signed(_GEN_3);
	wire [31:0] _io_out_data_bits_0_3_T = $signed(byp_3) + $signed(_GEN_3);
	wire [31:0] byp_4 = (io_bypass_cond ? $signed(last_acc_write_0_4) : $signed(io_acc_i_data_bits_0_4));
	wire [31:0] _GEN_4 = {{11 {dot_0_4_io_y[20]}}, dot_0_4_io_y};
	wire [31:0] add_0_4 = $signed(byp_4) + $signed(_GEN_4);
	wire [31:0] _io_out_data_bits_0_4_T = $signed(byp_4) + $signed(_GEN_4);
	wire [31:0] byp_5 = (io_bypass_cond ? $signed(last_acc_write_0_5) : $signed(io_acc_i_data_bits_0_5));
	wire [31:0] _GEN_5 = {{11 {dot_0_5_io_y[20]}}, dot_0_5_io_y};
	wire [31:0] add_0_5 = $signed(byp_5) + $signed(_GEN_5);
	wire [31:0] _io_out_data_bits_0_5_T = $signed(byp_5) + $signed(_GEN_5);
	wire [31:0] byp_6 = (io_bypass_cond ? $signed(last_acc_write_0_6) : $signed(io_acc_i_data_bits_0_6));
	wire [31:0] _GEN_6 = {{11 {dot_0_6_io_y[20]}}, dot_0_6_io_y};
	wire [31:0] add_0_6 = $signed(byp_6) + $signed(_GEN_6);
	wire [31:0] _io_out_data_bits_0_6_T = $signed(byp_6) + $signed(_GEN_6);
	wire [31:0] byp_7 = (io_bypass_cond ? $signed(last_acc_write_0_7) : $signed(io_acc_i_data_bits_0_7));
	wire [31:0] _GEN_7 = {{11 {dot_0_7_io_y[20]}}, dot_0_7_io_y};
	wire [31:0] add_0_7 = $signed(byp_7) + $signed(_GEN_7);
	wire [31:0] _io_out_data_bits_0_7_T = $signed(byp_7) + $signed(_GEN_7);
	wire [31:0] byp_8 = (io_bypass_cond ? $signed(last_acc_write_0_8) : $signed(io_acc_i_data_bits_0_8));
	wire [31:0] _GEN_8 = {{11 {dot_0_8_io_y[20]}}, dot_0_8_io_y};
	wire [31:0] add_0_8 = $signed(byp_8) + $signed(_GEN_8);
	wire [31:0] _io_out_data_bits_0_8_T = $signed(byp_8) + $signed(_GEN_8);
	wire [31:0] byp_9 = (io_bypass_cond ? $signed(last_acc_write_0_9) : $signed(io_acc_i_data_bits_0_9));
	wire [31:0] _GEN_9 = {{11 {dot_0_9_io_y[20]}}, dot_0_9_io_y};
	wire [31:0] add_0_9 = $signed(byp_9) + $signed(_GEN_9);
	wire [31:0] _io_out_data_bits_0_9_T = $signed(byp_9) + $signed(_GEN_9);
	wire [31:0] byp_10 = (io_bypass_cond ? $signed(last_acc_write_0_10) : $signed(io_acc_i_data_bits_0_10));
	wire [31:0] _GEN_10 = {{11 {dot_0_10_io_y[20]}}, dot_0_10_io_y};
	wire [31:0] add_0_10 = $signed(byp_10) + $signed(_GEN_10);
	wire [31:0] _io_out_data_bits_0_10_T = $signed(byp_10) + $signed(_GEN_10);
	wire [31:0] byp_11 = (io_bypass_cond ? $signed(last_acc_write_0_11) : $signed(io_acc_i_data_bits_0_11));
	wire [31:0] _GEN_11 = {{11 {dot_0_11_io_y[20]}}, dot_0_11_io_y};
	wire [31:0] add_0_11 = $signed(byp_11) + $signed(_GEN_11);
	wire [31:0] _io_out_data_bits_0_11_T = $signed(byp_11) + $signed(_GEN_11);
	wire [31:0] byp_12 = (io_bypass_cond ? $signed(last_acc_write_0_12) : $signed(io_acc_i_data_bits_0_12));
	wire [31:0] _GEN_12 = {{11 {dot_0_12_io_y[20]}}, dot_0_12_io_y};
	wire [31:0] add_0_12 = $signed(byp_12) + $signed(_GEN_12);
	wire [31:0] _io_out_data_bits_0_12_T = $signed(byp_12) + $signed(_GEN_12);
	wire [31:0] byp_13 = (io_bypass_cond ? $signed(last_acc_write_0_13) : $signed(io_acc_i_data_bits_0_13));
	wire [31:0] _GEN_13 = {{11 {dot_0_13_io_y[20]}}, dot_0_13_io_y};
	wire [31:0] add_0_13 = $signed(byp_13) + $signed(_GEN_13);
	wire [31:0] _io_out_data_bits_0_13_T = $signed(byp_13) + $signed(_GEN_13);
	wire [31:0] byp_14 = (io_bypass_cond ? $signed(last_acc_write_0_14) : $signed(io_acc_i_data_bits_0_14));
	wire [31:0] _GEN_14 = {{11 {dot_0_14_io_y[20]}}, dot_0_14_io_y};
	wire [31:0] add_0_14 = $signed(byp_14) + $signed(_GEN_14);
	wire [31:0] _io_out_data_bits_0_14_T = $signed(byp_14) + $signed(_GEN_14);
	wire [31:0] byp_15 = (io_bypass_cond ? $signed(last_acc_write_0_15) : $signed(io_acc_i_data_bits_0_15));
	wire [31:0] _GEN_15 = {{11 {dot_0_15_io_y[20]}}, dot_0_15_io_y};
	wire [31:0] add_0_15 = $signed(byp_15) + $signed(_GEN_15);
	wire [31:0] _io_out_data_bits_0_15_T = $signed(byp_15) + $signed(_GEN_15);
	DotProduct dot_0_0(
		.clk(dot_0_0_clock),
		.io_a_0(dot_0_0_io_a_0),
		.io_a_1(dot_0_0_io_a_1),
		.io_a_2(dot_0_0_io_a_2),
		.io_a_3(dot_0_0_io_a_3),
		.io_a_4(dot_0_0_io_a_4),
		.io_a_5(dot_0_0_io_a_5),
		.io_a_6(dot_0_0_io_a_6),
		.io_a_7(dot_0_0_io_a_7),
		.io_a_8(dot_0_0_io_a_8),
		.io_a_9(dot_0_0_io_a_9),
		.io_a_10(dot_0_0_io_a_10),
		.io_a_11(dot_0_0_io_a_11),
		.io_a_12(dot_0_0_io_a_12),
		.io_a_13(dot_0_0_io_a_13),
		.io_a_14(dot_0_0_io_a_14),
		.io_a_15(dot_0_0_io_a_15),
		.io_b_0(dot_0_0_io_b_0),
		.io_b_1(dot_0_0_io_b_1),
		.io_b_2(dot_0_0_io_b_2),
		.io_b_3(dot_0_0_io_b_3),
		.io_b_4(dot_0_0_io_b_4),
		.io_b_5(dot_0_0_io_b_5),
		.io_b_6(dot_0_0_io_b_6),
		.io_b_7(dot_0_0_io_b_7),
		.io_b_8(dot_0_0_io_b_8),
		.io_b_9(dot_0_0_io_b_9),
		.io_b_10(dot_0_0_io_b_10),
		.io_b_11(dot_0_0_io_b_11),
		.io_b_12(dot_0_0_io_b_12),
		.io_b_13(dot_0_0_io_b_13),
		.io_b_14(dot_0_0_io_b_14),
		.io_b_15(dot_0_0_io_b_15),
		.io_y(dot_0_0_io_y)
	);
	DotProduct dot_0_1(
		.clk(dot_0_1_clock),
		.io_a_0(dot_0_1_io_a_0),
		.io_a_1(dot_0_1_io_a_1),
		.io_a_2(dot_0_1_io_a_2),
		.io_a_3(dot_0_1_io_a_3),
		.io_a_4(dot_0_1_io_a_4),
		.io_a_5(dot_0_1_io_a_5),
		.io_a_6(dot_0_1_io_a_6),
		.io_a_7(dot_0_1_io_a_7),
		.io_a_8(dot_0_1_io_a_8),
		.io_a_9(dot_0_1_io_a_9),
		.io_a_10(dot_0_1_io_a_10),
		.io_a_11(dot_0_1_io_a_11),
		.io_a_12(dot_0_1_io_a_12),
		.io_a_13(dot_0_1_io_a_13),
		.io_a_14(dot_0_1_io_a_14),
		.io_a_15(dot_0_1_io_a_15),
		.io_b_0(dot_0_1_io_b_0),
		.io_b_1(dot_0_1_io_b_1),
		.io_b_2(dot_0_1_io_b_2),
		.io_b_3(dot_0_1_io_b_3),
		.io_b_4(dot_0_1_io_b_4),
		.io_b_5(dot_0_1_io_b_5),
		.io_b_6(dot_0_1_io_b_6),
		.io_b_7(dot_0_1_io_b_7),
		.io_b_8(dot_0_1_io_b_8),
		.io_b_9(dot_0_1_io_b_9),
		.io_b_10(dot_0_1_io_b_10),
		.io_b_11(dot_0_1_io_b_11),
		.io_b_12(dot_0_1_io_b_12),
		.io_b_13(dot_0_1_io_b_13),
		.io_b_14(dot_0_1_io_b_14),
		.io_b_15(dot_0_1_io_b_15),
		.io_y(dot_0_1_io_y)
	);
	DotProduct dot_0_2(
		.clk(dot_0_2_clock),
		.io_a_0(dot_0_2_io_a_0),
		.io_a_1(dot_0_2_io_a_1),
		.io_a_2(dot_0_2_io_a_2),
		.io_a_3(dot_0_2_io_a_3),
		.io_a_4(dot_0_2_io_a_4),
		.io_a_5(dot_0_2_io_a_5),
		.io_a_6(dot_0_2_io_a_6),
		.io_a_7(dot_0_2_io_a_7),
		.io_a_8(dot_0_2_io_a_8),
		.io_a_9(dot_0_2_io_a_9),
		.io_a_10(dot_0_2_io_a_10),
		.io_a_11(dot_0_2_io_a_11),
		.io_a_12(dot_0_2_io_a_12),
		.io_a_13(dot_0_2_io_a_13),
		.io_a_14(dot_0_2_io_a_14),
		.io_a_15(dot_0_2_io_a_15),
		.io_b_0(dot_0_2_io_b_0),
		.io_b_1(dot_0_2_io_b_1),
		.io_b_2(dot_0_2_io_b_2),
		.io_b_3(dot_0_2_io_b_3),
		.io_b_4(dot_0_2_io_b_4),
		.io_b_5(dot_0_2_io_b_5),
		.io_b_6(dot_0_2_io_b_6),
		.io_b_7(dot_0_2_io_b_7),
		.io_b_8(dot_0_2_io_b_8),
		.io_b_9(dot_0_2_io_b_9),
		.io_b_10(dot_0_2_io_b_10),
		.io_b_11(dot_0_2_io_b_11),
		.io_b_12(dot_0_2_io_b_12),
		.io_b_13(dot_0_2_io_b_13),
		.io_b_14(dot_0_2_io_b_14),
		.io_b_15(dot_0_2_io_b_15),
		.io_y(dot_0_2_io_y)
	);
	DotProduct dot_0_3(
		.clk(dot_0_3_clock),
		.io_a_0(dot_0_3_io_a_0),
		.io_a_1(dot_0_3_io_a_1),
		.io_a_2(dot_0_3_io_a_2),
		.io_a_3(dot_0_3_io_a_3),
		.io_a_4(dot_0_3_io_a_4),
		.io_a_5(dot_0_3_io_a_5),
		.io_a_6(dot_0_3_io_a_6),
		.io_a_7(dot_0_3_io_a_7),
		.io_a_8(dot_0_3_io_a_8),
		.io_a_9(dot_0_3_io_a_9),
		.io_a_10(dot_0_3_io_a_10),
		.io_a_11(dot_0_3_io_a_11),
		.io_a_12(dot_0_3_io_a_12),
		.io_a_13(dot_0_3_io_a_13),
		.io_a_14(dot_0_3_io_a_14),
		.io_a_15(dot_0_3_io_a_15),
		.io_b_0(dot_0_3_io_b_0),
		.io_b_1(dot_0_3_io_b_1),
		.io_b_2(dot_0_3_io_b_2),
		.io_b_3(dot_0_3_io_b_3),
		.io_b_4(dot_0_3_io_b_4),
		.io_b_5(dot_0_3_io_b_5),
		.io_b_6(dot_0_3_io_b_6),
		.io_b_7(dot_0_3_io_b_7),
		.io_b_8(dot_0_3_io_b_8),
		.io_b_9(dot_0_3_io_b_9),
		.io_b_10(dot_0_3_io_b_10),
		.io_b_11(dot_0_3_io_b_11),
		.io_b_12(dot_0_3_io_b_12),
		.io_b_13(dot_0_3_io_b_13),
		.io_b_14(dot_0_3_io_b_14),
		.io_b_15(dot_0_3_io_b_15),
		.io_y(dot_0_3_io_y)
	);
	DotProduct dot_0_4(
		.clk(dot_0_4_clock),
		.io_a_0(dot_0_4_io_a_0),
		.io_a_1(dot_0_4_io_a_1),
		.io_a_2(dot_0_4_io_a_2),
		.io_a_3(dot_0_4_io_a_3),
		.io_a_4(dot_0_4_io_a_4),
		.io_a_5(dot_0_4_io_a_5),
		.io_a_6(dot_0_4_io_a_6),
		.io_a_7(dot_0_4_io_a_7),
		.io_a_8(dot_0_4_io_a_8),
		.io_a_9(dot_0_4_io_a_9),
		.io_a_10(dot_0_4_io_a_10),
		.io_a_11(dot_0_4_io_a_11),
		.io_a_12(dot_0_4_io_a_12),
		.io_a_13(dot_0_4_io_a_13),
		.io_a_14(dot_0_4_io_a_14),
		.io_a_15(dot_0_4_io_a_15),
		.io_b_0(dot_0_4_io_b_0),
		.io_b_1(dot_0_4_io_b_1),
		.io_b_2(dot_0_4_io_b_2),
		.io_b_3(dot_0_4_io_b_3),
		.io_b_4(dot_0_4_io_b_4),
		.io_b_5(dot_0_4_io_b_5),
		.io_b_6(dot_0_4_io_b_6),
		.io_b_7(dot_0_4_io_b_7),
		.io_b_8(dot_0_4_io_b_8),
		.io_b_9(dot_0_4_io_b_9),
		.io_b_10(dot_0_4_io_b_10),
		.io_b_11(dot_0_4_io_b_11),
		.io_b_12(dot_0_4_io_b_12),
		.io_b_13(dot_0_4_io_b_13),
		.io_b_14(dot_0_4_io_b_14),
		.io_b_15(dot_0_4_io_b_15),
		.io_y(dot_0_4_io_y)
	);
	DotProduct dot_0_5(
		.clk(dot_0_5_clock),
		.io_a_0(dot_0_5_io_a_0),
		.io_a_1(dot_0_5_io_a_1),
		.io_a_2(dot_0_5_io_a_2),
		.io_a_3(dot_0_5_io_a_3),
		.io_a_4(dot_0_5_io_a_4),
		.io_a_5(dot_0_5_io_a_5),
		.io_a_6(dot_0_5_io_a_6),
		.io_a_7(dot_0_5_io_a_7),
		.io_a_8(dot_0_5_io_a_8),
		.io_a_9(dot_0_5_io_a_9),
		.io_a_10(dot_0_5_io_a_10),
		.io_a_11(dot_0_5_io_a_11),
		.io_a_12(dot_0_5_io_a_12),
		.io_a_13(dot_0_5_io_a_13),
		.io_a_14(dot_0_5_io_a_14),
		.io_a_15(dot_0_5_io_a_15),
		.io_b_0(dot_0_5_io_b_0),
		.io_b_1(dot_0_5_io_b_1),
		.io_b_2(dot_0_5_io_b_2),
		.io_b_3(dot_0_5_io_b_3),
		.io_b_4(dot_0_5_io_b_4),
		.io_b_5(dot_0_5_io_b_5),
		.io_b_6(dot_0_5_io_b_6),
		.io_b_7(dot_0_5_io_b_7),
		.io_b_8(dot_0_5_io_b_8),
		.io_b_9(dot_0_5_io_b_9),
		.io_b_10(dot_0_5_io_b_10),
		.io_b_11(dot_0_5_io_b_11),
		.io_b_12(dot_0_5_io_b_12),
		.io_b_13(dot_0_5_io_b_13),
		.io_b_14(dot_0_5_io_b_14),
		.io_b_15(dot_0_5_io_b_15),
		.io_y(dot_0_5_io_y)
	);
	DotProduct dot_0_6(
		.clk(dot_0_6_clock),
		.io_a_0(dot_0_6_io_a_0),
		.io_a_1(dot_0_6_io_a_1),
		.io_a_2(dot_0_6_io_a_2),
		.io_a_3(dot_0_6_io_a_3),
		.io_a_4(dot_0_6_io_a_4),
		.io_a_5(dot_0_6_io_a_5),
		.io_a_6(dot_0_6_io_a_6),
		.io_a_7(dot_0_6_io_a_7),
		.io_a_8(dot_0_6_io_a_8),
		.io_a_9(dot_0_6_io_a_9),
		.io_a_10(dot_0_6_io_a_10),
		.io_a_11(dot_0_6_io_a_11),
		.io_a_12(dot_0_6_io_a_12),
		.io_a_13(dot_0_6_io_a_13),
		.io_a_14(dot_0_6_io_a_14),
		.io_a_15(dot_0_6_io_a_15),
		.io_b_0(dot_0_6_io_b_0),
		.io_b_1(dot_0_6_io_b_1),
		.io_b_2(dot_0_6_io_b_2),
		.io_b_3(dot_0_6_io_b_3),
		.io_b_4(dot_0_6_io_b_4),
		.io_b_5(dot_0_6_io_b_5),
		.io_b_6(dot_0_6_io_b_6),
		.io_b_7(dot_0_6_io_b_7),
		.io_b_8(dot_0_6_io_b_8),
		.io_b_9(dot_0_6_io_b_9),
		.io_b_10(dot_0_6_io_b_10),
		.io_b_11(dot_0_6_io_b_11),
		.io_b_12(dot_0_6_io_b_12),
		.io_b_13(dot_0_6_io_b_13),
		.io_b_14(dot_0_6_io_b_14),
		.io_b_15(dot_0_6_io_b_15),
		.io_y(dot_0_6_io_y)
	);
	DotProduct dot_0_7(
		.clk(dot_0_7_clock),
		.io_a_0(dot_0_7_io_a_0),
		.io_a_1(dot_0_7_io_a_1),
		.io_a_2(dot_0_7_io_a_2),
		.io_a_3(dot_0_7_io_a_3),
		.io_a_4(dot_0_7_io_a_4),
		.io_a_5(dot_0_7_io_a_5),
		.io_a_6(dot_0_7_io_a_6),
		.io_a_7(dot_0_7_io_a_7),
		.io_a_8(dot_0_7_io_a_8),
		.io_a_9(dot_0_7_io_a_9),
		.io_a_10(dot_0_7_io_a_10),
		.io_a_11(dot_0_7_io_a_11),
		.io_a_12(dot_0_7_io_a_12),
		.io_a_13(dot_0_7_io_a_13),
		.io_a_14(dot_0_7_io_a_14),
		.io_a_15(dot_0_7_io_a_15),
		.io_b_0(dot_0_7_io_b_0),
		.io_b_1(dot_0_7_io_b_1),
		.io_b_2(dot_0_7_io_b_2),
		.io_b_3(dot_0_7_io_b_3),
		.io_b_4(dot_0_7_io_b_4),
		.io_b_5(dot_0_7_io_b_5),
		.io_b_6(dot_0_7_io_b_6),
		.io_b_7(dot_0_7_io_b_7),
		.io_b_8(dot_0_7_io_b_8),
		.io_b_9(dot_0_7_io_b_9),
		.io_b_10(dot_0_7_io_b_10),
		.io_b_11(dot_0_7_io_b_11),
		.io_b_12(dot_0_7_io_b_12),
		.io_b_13(dot_0_7_io_b_13),
		.io_b_14(dot_0_7_io_b_14),
		.io_b_15(dot_0_7_io_b_15),
		.io_y(dot_0_7_io_y)
	);
	DotProduct dot_0_8(
		.clk(dot_0_8_clock),
		.io_a_0(dot_0_8_io_a_0),
		.io_a_1(dot_0_8_io_a_1),
		.io_a_2(dot_0_8_io_a_2),
		.io_a_3(dot_0_8_io_a_3),
		.io_a_4(dot_0_8_io_a_4),
		.io_a_5(dot_0_8_io_a_5),
		.io_a_6(dot_0_8_io_a_6),
		.io_a_7(dot_0_8_io_a_7),
		.io_a_8(dot_0_8_io_a_8),
		.io_a_9(dot_0_8_io_a_9),
		.io_a_10(dot_0_8_io_a_10),
		.io_a_11(dot_0_8_io_a_11),
		.io_a_12(dot_0_8_io_a_12),
		.io_a_13(dot_0_8_io_a_13),
		.io_a_14(dot_0_8_io_a_14),
		.io_a_15(dot_0_8_io_a_15),
		.io_b_0(dot_0_8_io_b_0),
		.io_b_1(dot_0_8_io_b_1),
		.io_b_2(dot_0_8_io_b_2),
		.io_b_3(dot_0_8_io_b_3),
		.io_b_4(dot_0_8_io_b_4),
		.io_b_5(dot_0_8_io_b_5),
		.io_b_6(dot_0_8_io_b_6),
		.io_b_7(dot_0_8_io_b_7),
		.io_b_8(dot_0_8_io_b_8),
		.io_b_9(dot_0_8_io_b_9),
		.io_b_10(dot_0_8_io_b_10),
		.io_b_11(dot_0_8_io_b_11),
		.io_b_12(dot_0_8_io_b_12),
		.io_b_13(dot_0_8_io_b_13),
		.io_b_14(dot_0_8_io_b_14),
		.io_b_15(dot_0_8_io_b_15),
		.io_y(dot_0_8_io_y)
	);
	DotProduct dot_0_9(
		.clk(dot_0_9_clock),
		.io_a_0(dot_0_9_io_a_0),
		.io_a_1(dot_0_9_io_a_1),
		.io_a_2(dot_0_9_io_a_2),
		.io_a_3(dot_0_9_io_a_3),
		.io_a_4(dot_0_9_io_a_4),
		.io_a_5(dot_0_9_io_a_5),
		.io_a_6(dot_0_9_io_a_6),
		.io_a_7(dot_0_9_io_a_7),
		.io_a_8(dot_0_9_io_a_8),
		.io_a_9(dot_0_9_io_a_9),
		.io_a_10(dot_0_9_io_a_10),
		.io_a_11(dot_0_9_io_a_11),
		.io_a_12(dot_0_9_io_a_12),
		.io_a_13(dot_0_9_io_a_13),
		.io_a_14(dot_0_9_io_a_14),
		.io_a_15(dot_0_9_io_a_15),
		.io_b_0(dot_0_9_io_b_0),
		.io_b_1(dot_0_9_io_b_1),
		.io_b_2(dot_0_9_io_b_2),
		.io_b_3(dot_0_9_io_b_3),
		.io_b_4(dot_0_9_io_b_4),
		.io_b_5(dot_0_9_io_b_5),
		.io_b_6(dot_0_9_io_b_6),
		.io_b_7(dot_0_9_io_b_7),
		.io_b_8(dot_0_9_io_b_8),
		.io_b_9(dot_0_9_io_b_9),
		.io_b_10(dot_0_9_io_b_10),
		.io_b_11(dot_0_9_io_b_11),
		.io_b_12(dot_0_9_io_b_12),
		.io_b_13(dot_0_9_io_b_13),
		.io_b_14(dot_0_9_io_b_14),
		.io_b_15(dot_0_9_io_b_15),
		.io_y(dot_0_9_io_y)
	);
	DotProduct dot_0_10(
		.clk(dot_0_10_clock),
		.io_a_0(dot_0_10_io_a_0),
		.io_a_1(dot_0_10_io_a_1),
		.io_a_2(dot_0_10_io_a_2),
		.io_a_3(dot_0_10_io_a_3),
		.io_a_4(dot_0_10_io_a_4),
		.io_a_5(dot_0_10_io_a_5),
		.io_a_6(dot_0_10_io_a_6),
		.io_a_7(dot_0_10_io_a_7),
		.io_a_8(dot_0_10_io_a_8),
		.io_a_9(dot_0_10_io_a_9),
		.io_a_10(dot_0_10_io_a_10),
		.io_a_11(dot_0_10_io_a_11),
		.io_a_12(dot_0_10_io_a_12),
		.io_a_13(dot_0_10_io_a_13),
		.io_a_14(dot_0_10_io_a_14),
		.io_a_15(dot_0_10_io_a_15),
		.io_b_0(dot_0_10_io_b_0),
		.io_b_1(dot_0_10_io_b_1),
		.io_b_2(dot_0_10_io_b_2),
		.io_b_3(dot_0_10_io_b_3),
		.io_b_4(dot_0_10_io_b_4),
		.io_b_5(dot_0_10_io_b_5),
		.io_b_6(dot_0_10_io_b_6),
		.io_b_7(dot_0_10_io_b_7),
		.io_b_8(dot_0_10_io_b_8),
		.io_b_9(dot_0_10_io_b_9),
		.io_b_10(dot_0_10_io_b_10),
		.io_b_11(dot_0_10_io_b_11),
		.io_b_12(dot_0_10_io_b_12),
		.io_b_13(dot_0_10_io_b_13),
		.io_b_14(dot_0_10_io_b_14),
		.io_b_15(dot_0_10_io_b_15),
		.io_y(dot_0_10_io_y)
	);
	DotProduct dot_0_11(
		.clk(dot_0_11_clock),
		.io_a_0(dot_0_11_io_a_0),
		.io_a_1(dot_0_11_io_a_1),
		.io_a_2(dot_0_11_io_a_2),
		.io_a_3(dot_0_11_io_a_3),
		.io_a_4(dot_0_11_io_a_4),
		.io_a_5(dot_0_11_io_a_5),
		.io_a_6(dot_0_11_io_a_6),
		.io_a_7(dot_0_11_io_a_7),
		.io_a_8(dot_0_11_io_a_8),
		.io_a_9(dot_0_11_io_a_9),
		.io_a_10(dot_0_11_io_a_10),
		.io_a_11(dot_0_11_io_a_11),
		.io_a_12(dot_0_11_io_a_12),
		.io_a_13(dot_0_11_io_a_13),
		.io_a_14(dot_0_11_io_a_14),
		.io_a_15(dot_0_11_io_a_15),
		.io_b_0(dot_0_11_io_b_0),
		.io_b_1(dot_0_11_io_b_1),
		.io_b_2(dot_0_11_io_b_2),
		.io_b_3(dot_0_11_io_b_3),
		.io_b_4(dot_0_11_io_b_4),
		.io_b_5(dot_0_11_io_b_5),
		.io_b_6(dot_0_11_io_b_6),
		.io_b_7(dot_0_11_io_b_7),
		.io_b_8(dot_0_11_io_b_8),
		.io_b_9(dot_0_11_io_b_9),
		.io_b_10(dot_0_11_io_b_10),
		.io_b_11(dot_0_11_io_b_11),
		.io_b_12(dot_0_11_io_b_12),
		.io_b_13(dot_0_11_io_b_13),
		.io_b_14(dot_0_11_io_b_14),
		.io_b_15(dot_0_11_io_b_15),
		.io_y(dot_0_11_io_y)
	);
	DotProduct dot_0_12(
		.clk(dot_0_12_clock),
		.io_a_0(dot_0_12_io_a_0),
		.io_a_1(dot_0_12_io_a_1),
		.io_a_2(dot_0_12_io_a_2),
		.io_a_3(dot_0_12_io_a_3),
		.io_a_4(dot_0_12_io_a_4),
		.io_a_5(dot_0_12_io_a_5),
		.io_a_6(dot_0_12_io_a_6),
		.io_a_7(dot_0_12_io_a_7),
		.io_a_8(dot_0_12_io_a_8),
		.io_a_9(dot_0_12_io_a_9),
		.io_a_10(dot_0_12_io_a_10),
		.io_a_11(dot_0_12_io_a_11),
		.io_a_12(dot_0_12_io_a_12),
		.io_a_13(dot_0_12_io_a_13),
		.io_a_14(dot_0_12_io_a_14),
		.io_a_15(dot_0_12_io_a_15),
		.io_b_0(dot_0_12_io_b_0),
		.io_b_1(dot_0_12_io_b_1),
		.io_b_2(dot_0_12_io_b_2),
		.io_b_3(dot_0_12_io_b_3),
		.io_b_4(dot_0_12_io_b_4),
		.io_b_5(dot_0_12_io_b_5),
		.io_b_6(dot_0_12_io_b_6),
		.io_b_7(dot_0_12_io_b_7),
		.io_b_8(dot_0_12_io_b_8),
		.io_b_9(dot_0_12_io_b_9),
		.io_b_10(dot_0_12_io_b_10),
		.io_b_11(dot_0_12_io_b_11),
		.io_b_12(dot_0_12_io_b_12),
		.io_b_13(dot_0_12_io_b_13),
		.io_b_14(dot_0_12_io_b_14),
		.io_b_15(dot_0_12_io_b_15),
		.io_y(dot_0_12_io_y)
	);
	DotProduct dot_0_13(
		.clk(dot_0_13_clock),
		.io_a_0(dot_0_13_io_a_0),
		.io_a_1(dot_0_13_io_a_1),
		.io_a_2(dot_0_13_io_a_2),
		.io_a_3(dot_0_13_io_a_3),
		.io_a_4(dot_0_13_io_a_4),
		.io_a_5(dot_0_13_io_a_5),
		.io_a_6(dot_0_13_io_a_6),
		.io_a_7(dot_0_13_io_a_7),
		.io_a_8(dot_0_13_io_a_8),
		.io_a_9(dot_0_13_io_a_9),
		.io_a_10(dot_0_13_io_a_10),
		.io_a_11(dot_0_13_io_a_11),
		.io_a_12(dot_0_13_io_a_12),
		.io_a_13(dot_0_13_io_a_13),
		.io_a_14(dot_0_13_io_a_14),
		.io_a_15(dot_0_13_io_a_15),
		.io_b_0(dot_0_13_io_b_0),
		.io_b_1(dot_0_13_io_b_1),
		.io_b_2(dot_0_13_io_b_2),
		.io_b_3(dot_0_13_io_b_3),
		.io_b_4(dot_0_13_io_b_4),
		.io_b_5(dot_0_13_io_b_5),
		.io_b_6(dot_0_13_io_b_6),
		.io_b_7(dot_0_13_io_b_7),
		.io_b_8(dot_0_13_io_b_8),
		.io_b_9(dot_0_13_io_b_9),
		.io_b_10(dot_0_13_io_b_10),
		.io_b_11(dot_0_13_io_b_11),
		.io_b_12(dot_0_13_io_b_12),
		.io_b_13(dot_0_13_io_b_13),
		.io_b_14(dot_0_13_io_b_14),
		.io_b_15(dot_0_13_io_b_15),
		.io_y(dot_0_13_io_y)
	);
	DotProduct dot_0_14(
		.clk(dot_0_14_clock),
		.io_a_0(dot_0_14_io_a_0),
		.io_a_1(dot_0_14_io_a_1),
		.io_a_2(dot_0_14_io_a_2),
		.io_a_3(dot_0_14_io_a_3),
		.io_a_4(dot_0_14_io_a_4),
		.io_a_5(dot_0_14_io_a_5),
		.io_a_6(dot_0_14_io_a_6),
		.io_a_7(dot_0_14_io_a_7),
		.io_a_8(dot_0_14_io_a_8),
		.io_a_9(dot_0_14_io_a_9),
		.io_a_10(dot_0_14_io_a_10),
		.io_a_11(dot_0_14_io_a_11),
		.io_a_12(dot_0_14_io_a_12),
		.io_a_13(dot_0_14_io_a_13),
		.io_a_14(dot_0_14_io_a_14),
		.io_a_15(dot_0_14_io_a_15),
		.io_b_0(dot_0_14_io_b_0),
		.io_b_1(dot_0_14_io_b_1),
		.io_b_2(dot_0_14_io_b_2),
		.io_b_3(dot_0_14_io_b_3),
		.io_b_4(dot_0_14_io_b_4),
		.io_b_5(dot_0_14_io_b_5),
		.io_b_6(dot_0_14_io_b_6),
		.io_b_7(dot_0_14_io_b_7),
		.io_b_8(dot_0_14_io_b_8),
		.io_b_9(dot_0_14_io_b_9),
		.io_b_10(dot_0_14_io_b_10),
		.io_b_11(dot_0_14_io_b_11),
		.io_b_12(dot_0_14_io_b_12),
		.io_b_13(dot_0_14_io_b_13),
		.io_b_14(dot_0_14_io_b_14),
		.io_b_15(dot_0_14_io_b_15),
		.io_y(dot_0_14_io_y)
	);
	DotProduct dot_0_15(
		.clk(dot_0_15_clock),
		.io_a_0(dot_0_15_io_a_0),
		.io_a_1(dot_0_15_io_a_1),
		.io_a_2(dot_0_15_io_a_2),
		.io_a_3(dot_0_15_io_a_3),
		.io_a_4(dot_0_15_io_a_4),
		.io_a_5(dot_0_15_io_a_5),
		.io_a_6(dot_0_15_io_a_6),
		.io_a_7(dot_0_15_io_a_7),
		.io_a_8(dot_0_15_io_a_8),
		.io_a_9(dot_0_15_io_a_9),
		.io_a_10(dot_0_15_io_a_10),
		.io_a_11(dot_0_15_io_a_11),
		.io_a_12(dot_0_15_io_a_12),
		.io_a_13(dot_0_15_io_a_13),
		.io_a_14(dot_0_15_io_a_14),
		.io_a_15(dot_0_15_io_a_15),
		.io_b_0(dot_0_15_io_b_0),
		.io_b_1(dot_0_15_io_b_1),
		.io_b_2(dot_0_15_io_b_2),
		.io_b_3(dot_0_15_io_b_3),
		.io_b_4(dot_0_15_io_b_4),
		.io_b_5(dot_0_15_io_b_5),
		.io_b_6(dot_0_15_io_b_6),
		.io_b_7(dot_0_15_io_b_7),
		.io_b_8(dot_0_15_io_b_8),
		.io_b_9(dot_0_15_io_b_9),
		.io_b_10(dot_0_15_io_b_10),
		.io_b_11(dot_0_15_io_b_11),
		.io_b_12(dot_0_15_io_b_12),
		.io_b_13(dot_0_15_io_b_13),
		.io_b_14(dot_0_15_io_b_14),
		.io_b_15(dot_0_15_io_b_15),
		.io_y(dot_0_15_io_y)
	);
	assign io_acc_o_data_valid = io_acc_i_data_valid | io_valid_reset;
	assign io_acc_o_data_bits_0_0 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_0));
	assign io_acc_o_data_bits_0_1 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_1));
	assign io_acc_o_data_bits_0_2 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_2));
	assign io_acc_o_data_bits_0_3 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_3));
	assign io_acc_o_data_bits_0_4 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_4));
	assign io_acc_o_data_bits_0_5 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_5));
	assign io_acc_o_data_bits_0_6 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_6));
	assign io_acc_o_data_bits_0_7 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_7));
	assign io_acc_o_data_bits_0_8 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_8));
	assign io_acc_o_data_bits_0_9 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_9));
	assign io_acc_o_data_bits_0_10 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_10));
	assign io_acc_o_data_bits_0_11 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_11));
	assign io_acc_o_data_bits_0_12 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_12));
	assign io_acc_o_data_bits_0_13 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_13));
	assign io_acc_o_data_bits_0_14 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_14));
	assign io_acc_o_data_bits_0_15 = (io_valid_reset ? $signed(32'sh00000000) : $signed(add_0_15));
	assign io_out_data_valid = io_acc_i_data_valid & ~io_valid_reset;
	assign io_out_data_bits_0_0 = _io_out_data_bits_0_0_T[7:0];
	assign io_out_data_bits_0_1 = _io_out_data_bits_0_1_T[7:0];
	assign io_out_data_bits_0_2 = _io_out_data_bits_0_2_T[7:0];
	assign io_out_data_bits_0_3 = _io_out_data_bits_0_3_T[7:0];
	assign io_out_data_bits_0_4 = _io_out_data_bits_0_4_T[7:0];
	assign io_out_data_bits_0_5 = _io_out_data_bits_0_5_T[7:0];
	assign io_out_data_bits_0_6 = _io_out_data_bits_0_6_T[7:0];
	assign io_out_data_bits_0_7 = _io_out_data_bits_0_7_T[7:0];
	assign io_out_data_bits_0_8 = _io_out_data_bits_0_8_T[7:0];
	assign io_out_data_bits_0_9 = _io_out_data_bits_0_9_T[7:0];
	assign io_out_data_bits_0_10 = _io_out_data_bits_0_10_T[7:0];
	assign io_out_data_bits_0_11 = _io_out_data_bits_0_11_T[7:0];
	assign io_out_data_bits_0_12 = _io_out_data_bits_0_12_T[7:0];
	assign io_out_data_bits_0_13 = _io_out_data_bits_0_13_T[7:0];
	assign io_out_data_bits_0_14 = _io_out_data_bits_0_14_T[7:0];
	assign io_out_data_bits_0_15 = _io_out_data_bits_0_15_T[7:0];
	assign dot_0_0_clock = clk;
	assign dot_0_0_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_0_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_0_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_0_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_0_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_0_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_0_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_0_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_0_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_0_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_0_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_0_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_0_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_0_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_0_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_0_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_0_io_b_0 = io_wgt_data_bits_0_0;
	assign dot_0_0_io_b_1 = io_wgt_data_bits_0_1;
	assign dot_0_0_io_b_2 = io_wgt_data_bits_0_2;
	assign dot_0_0_io_b_3 = io_wgt_data_bits_0_3;
	assign dot_0_0_io_b_4 = io_wgt_data_bits_0_4;
	assign dot_0_0_io_b_5 = io_wgt_data_bits_0_5;
	assign dot_0_0_io_b_6 = io_wgt_data_bits_0_6;
	assign dot_0_0_io_b_7 = io_wgt_data_bits_0_7;
	assign dot_0_0_io_b_8 = io_wgt_data_bits_0_8;
	assign dot_0_0_io_b_9 = io_wgt_data_bits_0_9;
	assign dot_0_0_io_b_10 = io_wgt_data_bits_0_10;
	assign dot_0_0_io_b_11 = io_wgt_data_bits_0_11;
	assign dot_0_0_io_b_12 = io_wgt_data_bits_0_12;
	assign dot_0_0_io_b_13 = io_wgt_data_bits_0_13;
	assign dot_0_0_io_b_14 = io_wgt_data_bits_0_14;
	assign dot_0_0_io_b_15 = io_wgt_data_bits_0_15;
	assign dot_0_1_clock = clk;
	assign dot_0_1_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_1_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_1_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_1_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_1_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_1_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_1_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_1_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_1_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_1_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_1_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_1_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_1_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_1_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_1_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_1_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_1_io_b_0 = io_wgt_data_bits_1_0;
	assign dot_0_1_io_b_1 = io_wgt_data_bits_1_1;
	assign dot_0_1_io_b_2 = io_wgt_data_bits_1_2;
	assign dot_0_1_io_b_3 = io_wgt_data_bits_1_3;
	assign dot_0_1_io_b_4 = io_wgt_data_bits_1_4;
	assign dot_0_1_io_b_5 = io_wgt_data_bits_1_5;
	assign dot_0_1_io_b_6 = io_wgt_data_bits_1_6;
	assign dot_0_1_io_b_7 = io_wgt_data_bits_1_7;
	assign dot_0_1_io_b_8 = io_wgt_data_bits_1_8;
	assign dot_0_1_io_b_9 = io_wgt_data_bits_1_9;
	assign dot_0_1_io_b_10 = io_wgt_data_bits_1_10;
	assign dot_0_1_io_b_11 = io_wgt_data_bits_1_11;
	assign dot_0_1_io_b_12 = io_wgt_data_bits_1_12;
	assign dot_0_1_io_b_13 = io_wgt_data_bits_1_13;
	assign dot_0_1_io_b_14 = io_wgt_data_bits_1_14;
	assign dot_0_1_io_b_15 = io_wgt_data_bits_1_15;
	assign dot_0_2_clock = clk;
	assign dot_0_2_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_2_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_2_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_2_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_2_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_2_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_2_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_2_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_2_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_2_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_2_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_2_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_2_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_2_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_2_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_2_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_2_io_b_0 = io_wgt_data_bits_2_0;
	assign dot_0_2_io_b_1 = io_wgt_data_bits_2_1;
	assign dot_0_2_io_b_2 = io_wgt_data_bits_2_2;
	assign dot_0_2_io_b_3 = io_wgt_data_bits_2_3;
	assign dot_0_2_io_b_4 = io_wgt_data_bits_2_4;
	assign dot_0_2_io_b_5 = io_wgt_data_bits_2_5;
	assign dot_0_2_io_b_6 = io_wgt_data_bits_2_6;
	assign dot_0_2_io_b_7 = io_wgt_data_bits_2_7;
	assign dot_0_2_io_b_8 = io_wgt_data_bits_2_8;
	assign dot_0_2_io_b_9 = io_wgt_data_bits_2_9;
	assign dot_0_2_io_b_10 = io_wgt_data_bits_2_10;
	assign dot_0_2_io_b_11 = io_wgt_data_bits_2_11;
	assign dot_0_2_io_b_12 = io_wgt_data_bits_2_12;
	assign dot_0_2_io_b_13 = io_wgt_data_bits_2_13;
	assign dot_0_2_io_b_14 = io_wgt_data_bits_2_14;
	assign dot_0_2_io_b_15 = io_wgt_data_bits_2_15;
	assign dot_0_3_clock = clk;
	assign dot_0_3_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_3_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_3_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_3_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_3_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_3_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_3_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_3_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_3_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_3_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_3_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_3_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_3_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_3_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_3_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_3_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_3_io_b_0 = io_wgt_data_bits_3_0;
	assign dot_0_3_io_b_1 = io_wgt_data_bits_3_1;
	assign dot_0_3_io_b_2 = io_wgt_data_bits_3_2;
	assign dot_0_3_io_b_3 = io_wgt_data_bits_3_3;
	assign dot_0_3_io_b_4 = io_wgt_data_bits_3_4;
	assign dot_0_3_io_b_5 = io_wgt_data_bits_3_5;
	assign dot_0_3_io_b_6 = io_wgt_data_bits_3_6;
	assign dot_0_3_io_b_7 = io_wgt_data_bits_3_7;
	assign dot_0_3_io_b_8 = io_wgt_data_bits_3_8;
	assign dot_0_3_io_b_9 = io_wgt_data_bits_3_9;
	assign dot_0_3_io_b_10 = io_wgt_data_bits_3_10;
	assign dot_0_3_io_b_11 = io_wgt_data_bits_3_11;
	assign dot_0_3_io_b_12 = io_wgt_data_bits_3_12;
	assign dot_0_3_io_b_13 = io_wgt_data_bits_3_13;
	assign dot_0_3_io_b_14 = io_wgt_data_bits_3_14;
	assign dot_0_3_io_b_15 = io_wgt_data_bits_3_15;
	assign dot_0_4_clock = clk;
	assign dot_0_4_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_4_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_4_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_4_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_4_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_4_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_4_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_4_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_4_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_4_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_4_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_4_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_4_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_4_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_4_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_4_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_4_io_b_0 = io_wgt_data_bits_4_0;
	assign dot_0_4_io_b_1 = io_wgt_data_bits_4_1;
	assign dot_0_4_io_b_2 = io_wgt_data_bits_4_2;
	assign dot_0_4_io_b_3 = io_wgt_data_bits_4_3;
	assign dot_0_4_io_b_4 = io_wgt_data_bits_4_4;
	assign dot_0_4_io_b_5 = io_wgt_data_bits_4_5;
	assign dot_0_4_io_b_6 = io_wgt_data_bits_4_6;
	assign dot_0_4_io_b_7 = io_wgt_data_bits_4_7;
	assign dot_0_4_io_b_8 = io_wgt_data_bits_4_8;
	assign dot_0_4_io_b_9 = io_wgt_data_bits_4_9;
	assign dot_0_4_io_b_10 = io_wgt_data_bits_4_10;
	assign dot_0_4_io_b_11 = io_wgt_data_bits_4_11;
	assign dot_0_4_io_b_12 = io_wgt_data_bits_4_12;
	assign dot_0_4_io_b_13 = io_wgt_data_bits_4_13;
	assign dot_0_4_io_b_14 = io_wgt_data_bits_4_14;
	assign dot_0_4_io_b_15 = io_wgt_data_bits_4_15;
	assign dot_0_5_clock = clk;
	assign dot_0_5_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_5_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_5_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_5_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_5_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_5_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_5_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_5_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_5_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_5_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_5_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_5_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_5_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_5_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_5_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_5_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_5_io_b_0 = io_wgt_data_bits_5_0;
	assign dot_0_5_io_b_1 = io_wgt_data_bits_5_1;
	assign dot_0_5_io_b_2 = io_wgt_data_bits_5_2;
	assign dot_0_5_io_b_3 = io_wgt_data_bits_5_3;
	assign dot_0_5_io_b_4 = io_wgt_data_bits_5_4;
	assign dot_0_5_io_b_5 = io_wgt_data_bits_5_5;
	assign dot_0_5_io_b_6 = io_wgt_data_bits_5_6;
	assign dot_0_5_io_b_7 = io_wgt_data_bits_5_7;
	assign dot_0_5_io_b_8 = io_wgt_data_bits_5_8;
	assign dot_0_5_io_b_9 = io_wgt_data_bits_5_9;
	assign dot_0_5_io_b_10 = io_wgt_data_bits_5_10;
	assign dot_0_5_io_b_11 = io_wgt_data_bits_5_11;
	assign dot_0_5_io_b_12 = io_wgt_data_bits_5_12;
	assign dot_0_5_io_b_13 = io_wgt_data_bits_5_13;
	assign dot_0_5_io_b_14 = io_wgt_data_bits_5_14;
	assign dot_0_5_io_b_15 = io_wgt_data_bits_5_15;
	assign dot_0_6_clock = clk;
	assign dot_0_6_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_6_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_6_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_6_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_6_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_6_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_6_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_6_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_6_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_6_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_6_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_6_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_6_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_6_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_6_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_6_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_6_io_b_0 = io_wgt_data_bits_6_0;
	assign dot_0_6_io_b_1 = io_wgt_data_bits_6_1;
	assign dot_0_6_io_b_2 = io_wgt_data_bits_6_2;
	assign dot_0_6_io_b_3 = io_wgt_data_bits_6_3;
	assign dot_0_6_io_b_4 = io_wgt_data_bits_6_4;
	assign dot_0_6_io_b_5 = io_wgt_data_bits_6_5;
	assign dot_0_6_io_b_6 = io_wgt_data_bits_6_6;
	assign dot_0_6_io_b_7 = io_wgt_data_bits_6_7;
	assign dot_0_6_io_b_8 = io_wgt_data_bits_6_8;
	assign dot_0_6_io_b_9 = io_wgt_data_bits_6_9;
	assign dot_0_6_io_b_10 = io_wgt_data_bits_6_10;
	assign dot_0_6_io_b_11 = io_wgt_data_bits_6_11;
	assign dot_0_6_io_b_12 = io_wgt_data_bits_6_12;
	assign dot_0_6_io_b_13 = io_wgt_data_bits_6_13;
	assign dot_0_6_io_b_14 = io_wgt_data_bits_6_14;
	assign dot_0_6_io_b_15 = io_wgt_data_bits_6_15;
	assign dot_0_7_clock = clk;
	assign dot_0_7_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_7_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_7_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_7_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_7_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_7_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_7_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_7_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_7_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_7_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_7_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_7_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_7_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_7_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_7_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_7_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_7_io_b_0 = io_wgt_data_bits_7_0;
	assign dot_0_7_io_b_1 = io_wgt_data_bits_7_1;
	assign dot_0_7_io_b_2 = io_wgt_data_bits_7_2;
	assign dot_0_7_io_b_3 = io_wgt_data_bits_7_3;
	assign dot_0_7_io_b_4 = io_wgt_data_bits_7_4;
	assign dot_0_7_io_b_5 = io_wgt_data_bits_7_5;
	assign dot_0_7_io_b_6 = io_wgt_data_bits_7_6;
	assign dot_0_7_io_b_7 = io_wgt_data_bits_7_7;
	assign dot_0_7_io_b_8 = io_wgt_data_bits_7_8;
	assign dot_0_7_io_b_9 = io_wgt_data_bits_7_9;
	assign dot_0_7_io_b_10 = io_wgt_data_bits_7_10;
	assign dot_0_7_io_b_11 = io_wgt_data_bits_7_11;
	assign dot_0_7_io_b_12 = io_wgt_data_bits_7_12;
	assign dot_0_7_io_b_13 = io_wgt_data_bits_7_13;
	assign dot_0_7_io_b_14 = io_wgt_data_bits_7_14;
	assign dot_0_7_io_b_15 = io_wgt_data_bits_7_15;
	assign dot_0_8_clock = clk;
	assign dot_0_8_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_8_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_8_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_8_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_8_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_8_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_8_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_8_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_8_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_8_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_8_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_8_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_8_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_8_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_8_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_8_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_8_io_b_0 = io_wgt_data_bits_8_0;
	assign dot_0_8_io_b_1 = io_wgt_data_bits_8_1;
	assign dot_0_8_io_b_2 = io_wgt_data_bits_8_2;
	assign dot_0_8_io_b_3 = io_wgt_data_bits_8_3;
	assign dot_0_8_io_b_4 = io_wgt_data_bits_8_4;
	assign dot_0_8_io_b_5 = io_wgt_data_bits_8_5;
	assign dot_0_8_io_b_6 = io_wgt_data_bits_8_6;
	assign dot_0_8_io_b_7 = io_wgt_data_bits_8_7;
	assign dot_0_8_io_b_8 = io_wgt_data_bits_8_8;
	assign dot_0_8_io_b_9 = io_wgt_data_bits_8_9;
	assign dot_0_8_io_b_10 = io_wgt_data_bits_8_10;
	assign dot_0_8_io_b_11 = io_wgt_data_bits_8_11;
	assign dot_0_8_io_b_12 = io_wgt_data_bits_8_12;
	assign dot_0_8_io_b_13 = io_wgt_data_bits_8_13;
	assign dot_0_8_io_b_14 = io_wgt_data_bits_8_14;
	assign dot_0_8_io_b_15 = io_wgt_data_bits_8_15;
	assign dot_0_9_clock = clk;
	assign dot_0_9_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_9_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_9_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_9_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_9_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_9_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_9_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_9_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_9_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_9_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_9_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_9_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_9_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_9_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_9_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_9_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_9_io_b_0 = io_wgt_data_bits_9_0;
	assign dot_0_9_io_b_1 = io_wgt_data_bits_9_1;
	assign dot_0_9_io_b_2 = io_wgt_data_bits_9_2;
	assign dot_0_9_io_b_3 = io_wgt_data_bits_9_3;
	assign dot_0_9_io_b_4 = io_wgt_data_bits_9_4;
	assign dot_0_9_io_b_5 = io_wgt_data_bits_9_5;
	assign dot_0_9_io_b_6 = io_wgt_data_bits_9_6;
	assign dot_0_9_io_b_7 = io_wgt_data_bits_9_7;
	assign dot_0_9_io_b_8 = io_wgt_data_bits_9_8;
	assign dot_0_9_io_b_9 = io_wgt_data_bits_9_9;
	assign dot_0_9_io_b_10 = io_wgt_data_bits_9_10;
	assign dot_0_9_io_b_11 = io_wgt_data_bits_9_11;
	assign dot_0_9_io_b_12 = io_wgt_data_bits_9_12;
	assign dot_0_9_io_b_13 = io_wgt_data_bits_9_13;
	assign dot_0_9_io_b_14 = io_wgt_data_bits_9_14;
	assign dot_0_9_io_b_15 = io_wgt_data_bits_9_15;
	assign dot_0_10_clock = clk;
	assign dot_0_10_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_10_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_10_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_10_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_10_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_10_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_10_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_10_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_10_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_10_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_10_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_10_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_10_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_10_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_10_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_10_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_10_io_b_0 = io_wgt_data_bits_10_0;
	assign dot_0_10_io_b_1 = io_wgt_data_bits_10_1;
	assign dot_0_10_io_b_2 = io_wgt_data_bits_10_2;
	assign dot_0_10_io_b_3 = io_wgt_data_bits_10_3;
	assign dot_0_10_io_b_4 = io_wgt_data_bits_10_4;
	assign dot_0_10_io_b_5 = io_wgt_data_bits_10_5;
	assign dot_0_10_io_b_6 = io_wgt_data_bits_10_6;
	assign dot_0_10_io_b_7 = io_wgt_data_bits_10_7;
	assign dot_0_10_io_b_8 = io_wgt_data_bits_10_8;
	assign dot_0_10_io_b_9 = io_wgt_data_bits_10_9;
	assign dot_0_10_io_b_10 = io_wgt_data_bits_10_10;
	assign dot_0_10_io_b_11 = io_wgt_data_bits_10_11;
	assign dot_0_10_io_b_12 = io_wgt_data_bits_10_12;
	assign dot_0_10_io_b_13 = io_wgt_data_bits_10_13;
	assign dot_0_10_io_b_14 = io_wgt_data_bits_10_14;
	assign dot_0_10_io_b_15 = io_wgt_data_bits_10_15;
	assign dot_0_11_clock = clk;
	assign dot_0_11_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_11_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_11_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_11_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_11_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_11_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_11_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_11_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_11_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_11_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_11_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_11_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_11_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_11_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_11_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_11_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_11_io_b_0 = io_wgt_data_bits_11_0;
	assign dot_0_11_io_b_1 = io_wgt_data_bits_11_1;
	assign dot_0_11_io_b_2 = io_wgt_data_bits_11_2;
	assign dot_0_11_io_b_3 = io_wgt_data_bits_11_3;
	assign dot_0_11_io_b_4 = io_wgt_data_bits_11_4;
	assign dot_0_11_io_b_5 = io_wgt_data_bits_11_5;
	assign dot_0_11_io_b_6 = io_wgt_data_bits_11_6;
	assign dot_0_11_io_b_7 = io_wgt_data_bits_11_7;
	assign dot_0_11_io_b_8 = io_wgt_data_bits_11_8;
	assign dot_0_11_io_b_9 = io_wgt_data_bits_11_9;
	assign dot_0_11_io_b_10 = io_wgt_data_bits_11_10;
	assign dot_0_11_io_b_11 = io_wgt_data_bits_11_11;
	assign dot_0_11_io_b_12 = io_wgt_data_bits_11_12;
	assign dot_0_11_io_b_13 = io_wgt_data_bits_11_13;
	assign dot_0_11_io_b_14 = io_wgt_data_bits_11_14;
	assign dot_0_11_io_b_15 = io_wgt_data_bits_11_15;
	assign dot_0_12_clock = clk;
	assign dot_0_12_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_12_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_12_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_12_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_12_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_12_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_12_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_12_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_12_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_12_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_12_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_12_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_12_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_12_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_12_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_12_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_12_io_b_0 = io_wgt_data_bits_12_0;
	assign dot_0_12_io_b_1 = io_wgt_data_bits_12_1;
	assign dot_0_12_io_b_2 = io_wgt_data_bits_12_2;
	assign dot_0_12_io_b_3 = io_wgt_data_bits_12_3;
	assign dot_0_12_io_b_4 = io_wgt_data_bits_12_4;
	assign dot_0_12_io_b_5 = io_wgt_data_bits_12_5;
	assign dot_0_12_io_b_6 = io_wgt_data_bits_12_6;
	assign dot_0_12_io_b_7 = io_wgt_data_bits_12_7;
	assign dot_0_12_io_b_8 = io_wgt_data_bits_12_8;
	assign dot_0_12_io_b_9 = io_wgt_data_bits_12_9;
	assign dot_0_12_io_b_10 = io_wgt_data_bits_12_10;
	assign dot_0_12_io_b_11 = io_wgt_data_bits_12_11;
	assign dot_0_12_io_b_12 = io_wgt_data_bits_12_12;
	assign dot_0_12_io_b_13 = io_wgt_data_bits_12_13;
	assign dot_0_12_io_b_14 = io_wgt_data_bits_12_14;
	assign dot_0_12_io_b_15 = io_wgt_data_bits_12_15;
	assign dot_0_13_clock = clk;
	assign dot_0_13_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_13_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_13_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_13_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_13_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_13_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_13_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_13_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_13_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_13_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_13_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_13_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_13_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_13_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_13_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_13_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_13_io_b_0 = io_wgt_data_bits_13_0;
	assign dot_0_13_io_b_1 = io_wgt_data_bits_13_1;
	assign dot_0_13_io_b_2 = io_wgt_data_bits_13_2;
	assign dot_0_13_io_b_3 = io_wgt_data_bits_13_3;
	assign dot_0_13_io_b_4 = io_wgt_data_bits_13_4;
	assign dot_0_13_io_b_5 = io_wgt_data_bits_13_5;
	assign dot_0_13_io_b_6 = io_wgt_data_bits_13_6;
	assign dot_0_13_io_b_7 = io_wgt_data_bits_13_7;
	assign dot_0_13_io_b_8 = io_wgt_data_bits_13_8;
	assign dot_0_13_io_b_9 = io_wgt_data_bits_13_9;
	assign dot_0_13_io_b_10 = io_wgt_data_bits_13_10;
	assign dot_0_13_io_b_11 = io_wgt_data_bits_13_11;
	assign dot_0_13_io_b_12 = io_wgt_data_bits_13_12;
	assign dot_0_13_io_b_13 = io_wgt_data_bits_13_13;
	assign dot_0_13_io_b_14 = io_wgt_data_bits_13_14;
	assign dot_0_13_io_b_15 = io_wgt_data_bits_13_15;
	assign dot_0_14_clock = clk;
	assign dot_0_14_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_14_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_14_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_14_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_14_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_14_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_14_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_14_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_14_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_14_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_14_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_14_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_14_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_14_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_14_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_14_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_14_io_b_0 = io_wgt_data_bits_14_0;
	assign dot_0_14_io_b_1 = io_wgt_data_bits_14_1;
	assign dot_0_14_io_b_2 = io_wgt_data_bits_14_2;
	assign dot_0_14_io_b_3 = io_wgt_data_bits_14_3;
	assign dot_0_14_io_b_4 = io_wgt_data_bits_14_4;
	assign dot_0_14_io_b_5 = io_wgt_data_bits_14_5;
	assign dot_0_14_io_b_6 = io_wgt_data_bits_14_6;
	assign dot_0_14_io_b_7 = io_wgt_data_bits_14_7;
	assign dot_0_14_io_b_8 = io_wgt_data_bits_14_8;
	assign dot_0_14_io_b_9 = io_wgt_data_bits_14_9;
	assign dot_0_14_io_b_10 = io_wgt_data_bits_14_10;
	assign dot_0_14_io_b_11 = io_wgt_data_bits_14_11;
	assign dot_0_14_io_b_12 = io_wgt_data_bits_14_12;
	assign dot_0_14_io_b_13 = io_wgt_data_bits_14_13;
	assign dot_0_14_io_b_14 = io_wgt_data_bits_14_14;
	assign dot_0_14_io_b_15 = io_wgt_data_bits_14_15;
	assign dot_0_15_clock = clk;
	assign dot_0_15_io_a_0 = io_inp_data_bits_0_0;
	assign dot_0_15_io_a_1 = io_inp_data_bits_0_1;
	assign dot_0_15_io_a_2 = io_inp_data_bits_0_2;
	assign dot_0_15_io_a_3 = io_inp_data_bits_0_3;
	assign dot_0_15_io_a_4 = io_inp_data_bits_0_4;
	assign dot_0_15_io_a_5 = io_inp_data_bits_0_5;
	assign dot_0_15_io_a_6 = io_inp_data_bits_0_6;
	assign dot_0_15_io_a_7 = io_inp_data_bits_0_7;
	assign dot_0_15_io_a_8 = io_inp_data_bits_0_8;
	assign dot_0_15_io_a_9 = io_inp_data_bits_0_9;
	assign dot_0_15_io_a_10 = io_inp_data_bits_0_10;
	assign dot_0_15_io_a_11 = io_inp_data_bits_0_11;
	assign dot_0_15_io_a_12 = io_inp_data_bits_0_12;
	assign dot_0_15_io_a_13 = io_inp_data_bits_0_13;
	assign dot_0_15_io_a_14 = io_inp_data_bits_0_14;
	assign dot_0_15_io_a_15 = io_inp_data_bits_0_15;
	assign dot_0_15_io_b_0 = io_wgt_data_bits_15_0;
	assign dot_0_15_io_b_1 = io_wgt_data_bits_15_1;
	assign dot_0_15_io_b_2 = io_wgt_data_bits_15_2;
	assign dot_0_15_io_b_3 = io_wgt_data_bits_15_3;
	assign dot_0_15_io_b_4 = io_wgt_data_bits_15_4;
	assign dot_0_15_io_b_5 = io_wgt_data_bits_15_5;
	assign dot_0_15_io_b_6 = io_wgt_data_bits_15_6;
	assign dot_0_15_io_b_7 = io_wgt_data_bits_15_7;
	assign dot_0_15_io_b_8 = io_wgt_data_bits_15_8;
	assign dot_0_15_io_b_9 = io_wgt_data_bits_15_9;
	assign dot_0_15_io_b_10 = io_wgt_data_bits_15_10;
	assign dot_0_15_io_b_11 = io_wgt_data_bits_15_11;
	assign dot_0_15_io_b_12 = io_wgt_data_bits_15_12;
	assign dot_0_15_io_b_13 = io_wgt_data_bits_15_13;
	assign dot_0_15_io_b_14 = io_wgt_data_bits_15_14;
	assign dot_0_15_io_b_15 = io_wgt_data_bits_15_15;
	always @(posedge clk) begin
		if (io_valid_reset)
			last_acc_write_0_0 <= 32'sh00000000;
		else
			last_acc_write_0_0 <= add_0_0;
		if (io_valid_reset)
			last_acc_write_0_1 <= 32'sh00000000;
		else
			last_acc_write_0_1 <= add_0_1;
		if (io_valid_reset)
			last_acc_write_0_2 <= 32'sh00000000;
		else
			last_acc_write_0_2 <= add_0_2;
		if (io_valid_reset)
			last_acc_write_0_3 <= 32'sh00000000;
		else
			last_acc_write_0_3 <= add_0_3;
		if (io_valid_reset)
			last_acc_write_0_4 <= 32'sh00000000;
		else
			last_acc_write_0_4 <= add_0_4;
		if (io_valid_reset)
			last_acc_write_0_5 <= 32'sh00000000;
		else
			last_acc_write_0_5 <= add_0_5;
		if (io_valid_reset)
			last_acc_write_0_6 <= 32'sh00000000;
		else
			last_acc_write_0_6 <= add_0_6;
		if (io_valid_reset)
			last_acc_write_0_7 <= 32'sh00000000;
		else
			last_acc_write_0_7 <= add_0_7;
		if (io_valid_reset)
			last_acc_write_0_8 <= 32'sh00000000;
		else
			last_acc_write_0_8 <= add_0_8;
		if (io_valid_reset)
			last_acc_write_0_9 <= 32'sh00000000;
		else
			last_acc_write_0_9 <= add_0_9;
		if (io_valid_reset)
			last_acc_write_0_10 <= 32'sh00000000;
		else
			last_acc_write_0_10 <= add_0_10;
		if (io_valid_reset)
			last_acc_write_0_11 <= 32'sh00000000;
		else
			last_acc_write_0_11 <= add_0_11;
		if (io_valid_reset)
			last_acc_write_0_12 <= 32'sh00000000;
		else
			last_acc_write_0_12 <= add_0_12;
		if (io_valid_reset)
			last_acc_write_0_13 <= 32'sh00000000;
		else
			last_acc_write_0_13 <= add_0_13;
		if (io_valid_reset)
			last_acc_write_0_14 <= 32'sh00000000;
		else
			last_acc_write_0_14 <= add_0_14;
		if (io_valid_reset)
			last_acc_write_0_15 <= 32'sh00000000;
		else
			last_acc_write_0_15 <= add_0_15;
	end
endmodule
module TensorGemm (
	clk,
	rst,
	io_start,
	io_done,
	io_dec_wgt_1,
	io_dec_wgt_0,
	io_dec_inp_1,
	io_dec_inp_0,
	io_dec_acc_1,
	io_dec_acc_0,
	io_dec_empty_0,
	io_dec_lp_1,
	io_dec_lp_0,
	io_dec_uop_end,
	io_dec_uop_begin,
	io_dec_reset,
	io_dec_push_next,
	io_dec_push_prev,
	io_dec_pop_next,
	io_dec_pop_prev,
	io_dec_op,
	io_uop_idx_valid,
	io_uop_idx_bits,
	io_uop_data_valid,
	io_uop_data_bits_u2,
	io_uop_data_bits_u1,
	io_uop_data_bits_u0,
	io_inp_rd_0_idx_valid,
	io_inp_rd_0_idx_bits,
	io_inp_rd_0_data_valid,
	io_inp_rd_0_data_bits_0_0,
	io_inp_rd_0_data_bits_0_1,
	io_inp_rd_0_data_bits_0_2,
	io_inp_rd_0_data_bits_0_3,
	io_inp_rd_0_data_bits_0_4,
	io_inp_rd_0_data_bits_0_5,
	io_inp_rd_0_data_bits_0_6,
	io_inp_rd_0_data_bits_0_7,
	io_inp_rd_0_data_bits_0_8,
	io_inp_rd_0_data_bits_0_9,
	io_inp_rd_0_data_bits_0_10,
	io_inp_rd_0_data_bits_0_11,
	io_inp_rd_0_data_bits_0_12,
	io_inp_rd_0_data_bits_0_13,
	io_inp_rd_0_data_bits_0_14,
	io_inp_rd_0_data_bits_0_15,
	io_wgt_rd_0_idx_valid,
	io_wgt_rd_0_idx_bits,
	io_wgt_rd_0_data_valid,
	io_wgt_rd_0_data_bits_0_0,
	io_wgt_rd_0_data_bits_0_1,
	io_wgt_rd_0_data_bits_0_2,
	io_wgt_rd_0_data_bits_0_3,
	io_wgt_rd_0_data_bits_0_4,
	io_wgt_rd_0_data_bits_0_5,
	io_wgt_rd_0_data_bits_0_6,
	io_wgt_rd_0_data_bits_0_7,
	io_wgt_rd_0_data_bits_0_8,
	io_wgt_rd_0_data_bits_0_9,
	io_wgt_rd_0_data_bits_0_10,
	io_wgt_rd_0_data_bits_0_11,
	io_wgt_rd_0_data_bits_0_12,
	io_wgt_rd_0_data_bits_0_13,
	io_wgt_rd_0_data_bits_0_14,
	io_wgt_rd_0_data_bits_0_15,
	io_wgt_rd_0_data_bits_1_0,
	io_wgt_rd_0_data_bits_1_1,
	io_wgt_rd_0_data_bits_1_2,
	io_wgt_rd_0_data_bits_1_3,
	io_wgt_rd_0_data_bits_1_4,
	io_wgt_rd_0_data_bits_1_5,
	io_wgt_rd_0_data_bits_1_6,
	io_wgt_rd_0_data_bits_1_7,
	io_wgt_rd_0_data_bits_1_8,
	io_wgt_rd_0_data_bits_1_9,
	io_wgt_rd_0_data_bits_1_10,
	io_wgt_rd_0_data_bits_1_11,
	io_wgt_rd_0_data_bits_1_12,
	io_wgt_rd_0_data_bits_1_13,
	io_wgt_rd_0_data_bits_1_14,
	io_wgt_rd_0_data_bits_1_15,
	io_wgt_rd_0_data_bits_2_0,
	io_wgt_rd_0_data_bits_2_1,
	io_wgt_rd_0_data_bits_2_2,
	io_wgt_rd_0_data_bits_2_3,
	io_wgt_rd_0_data_bits_2_4,
	io_wgt_rd_0_data_bits_2_5,
	io_wgt_rd_0_data_bits_2_6,
	io_wgt_rd_0_data_bits_2_7,
	io_wgt_rd_0_data_bits_2_8,
	io_wgt_rd_0_data_bits_2_9,
	io_wgt_rd_0_data_bits_2_10,
	io_wgt_rd_0_data_bits_2_11,
	io_wgt_rd_0_data_bits_2_12,
	io_wgt_rd_0_data_bits_2_13,
	io_wgt_rd_0_data_bits_2_14,
	io_wgt_rd_0_data_bits_2_15,
	io_wgt_rd_0_data_bits_3_0,
	io_wgt_rd_0_data_bits_3_1,
	io_wgt_rd_0_data_bits_3_2,
	io_wgt_rd_0_data_bits_3_3,
	io_wgt_rd_0_data_bits_3_4,
	io_wgt_rd_0_data_bits_3_5,
	io_wgt_rd_0_data_bits_3_6,
	io_wgt_rd_0_data_bits_3_7,
	io_wgt_rd_0_data_bits_3_8,
	io_wgt_rd_0_data_bits_3_9,
	io_wgt_rd_0_data_bits_3_10,
	io_wgt_rd_0_data_bits_3_11,
	io_wgt_rd_0_data_bits_3_12,
	io_wgt_rd_0_data_bits_3_13,
	io_wgt_rd_0_data_bits_3_14,
	io_wgt_rd_0_data_bits_3_15,
	io_wgt_rd_0_data_bits_4_0,
	io_wgt_rd_0_data_bits_4_1,
	io_wgt_rd_0_data_bits_4_2,
	io_wgt_rd_0_data_bits_4_3,
	io_wgt_rd_0_data_bits_4_4,
	io_wgt_rd_0_data_bits_4_5,
	io_wgt_rd_0_data_bits_4_6,
	io_wgt_rd_0_data_bits_4_7,
	io_wgt_rd_0_data_bits_4_8,
	io_wgt_rd_0_data_bits_4_9,
	io_wgt_rd_0_data_bits_4_10,
	io_wgt_rd_0_data_bits_4_11,
	io_wgt_rd_0_data_bits_4_12,
	io_wgt_rd_0_data_bits_4_13,
	io_wgt_rd_0_data_bits_4_14,
	io_wgt_rd_0_data_bits_4_15,
	io_wgt_rd_0_data_bits_5_0,
	io_wgt_rd_0_data_bits_5_1,
	io_wgt_rd_0_data_bits_5_2,
	io_wgt_rd_0_data_bits_5_3,
	io_wgt_rd_0_data_bits_5_4,
	io_wgt_rd_0_data_bits_5_5,
	io_wgt_rd_0_data_bits_5_6,
	io_wgt_rd_0_data_bits_5_7,
	io_wgt_rd_0_data_bits_5_8,
	io_wgt_rd_0_data_bits_5_9,
	io_wgt_rd_0_data_bits_5_10,
	io_wgt_rd_0_data_bits_5_11,
	io_wgt_rd_0_data_bits_5_12,
	io_wgt_rd_0_data_bits_5_13,
	io_wgt_rd_0_data_bits_5_14,
	io_wgt_rd_0_data_bits_5_15,
	io_wgt_rd_0_data_bits_6_0,
	io_wgt_rd_0_data_bits_6_1,
	io_wgt_rd_0_data_bits_6_2,
	io_wgt_rd_0_data_bits_6_3,
	io_wgt_rd_0_data_bits_6_4,
	io_wgt_rd_0_data_bits_6_5,
	io_wgt_rd_0_data_bits_6_6,
	io_wgt_rd_0_data_bits_6_7,
	io_wgt_rd_0_data_bits_6_8,
	io_wgt_rd_0_data_bits_6_9,
	io_wgt_rd_0_data_bits_6_10,
	io_wgt_rd_0_data_bits_6_11,
	io_wgt_rd_0_data_bits_6_12,
	io_wgt_rd_0_data_bits_6_13,
	io_wgt_rd_0_data_bits_6_14,
	io_wgt_rd_0_data_bits_6_15,
	io_wgt_rd_0_data_bits_7_0,
	io_wgt_rd_0_data_bits_7_1,
	io_wgt_rd_0_data_bits_7_2,
	io_wgt_rd_0_data_bits_7_3,
	io_wgt_rd_0_data_bits_7_4,
	io_wgt_rd_0_data_bits_7_5,
	io_wgt_rd_0_data_bits_7_6,
	io_wgt_rd_0_data_bits_7_7,
	io_wgt_rd_0_data_bits_7_8,
	io_wgt_rd_0_data_bits_7_9,
	io_wgt_rd_0_data_bits_7_10,
	io_wgt_rd_0_data_bits_7_11,
	io_wgt_rd_0_data_bits_7_12,
	io_wgt_rd_0_data_bits_7_13,
	io_wgt_rd_0_data_bits_7_14,
	io_wgt_rd_0_data_bits_7_15,
	io_wgt_rd_0_data_bits_8_0,
	io_wgt_rd_0_data_bits_8_1,
	io_wgt_rd_0_data_bits_8_2,
	io_wgt_rd_0_data_bits_8_3,
	io_wgt_rd_0_data_bits_8_4,
	io_wgt_rd_0_data_bits_8_5,
	io_wgt_rd_0_data_bits_8_6,
	io_wgt_rd_0_data_bits_8_7,
	io_wgt_rd_0_data_bits_8_8,
	io_wgt_rd_0_data_bits_8_9,
	io_wgt_rd_0_data_bits_8_10,
	io_wgt_rd_0_data_bits_8_11,
	io_wgt_rd_0_data_bits_8_12,
	io_wgt_rd_0_data_bits_8_13,
	io_wgt_rd_0_data_bits_8_14,
	io_wgt_rd_0_data_bits_8_15,
	io_wgt_rd_0_data_bits_9_0,
	io_wgt_rd_0_data_bits_9_1,
	io_wgt_rd_0_data_bits_9_2,
	io_wgt_rd_0_data_bits_9_3,
	io_wgt_rd_0_data_bits_9_4,
	io_wgt_rd_0_data_bits_9_5,
	io_wgt_rd_0_data_bits_9_6,
	io_wgt_rd_0_data_bits_9_7,
	io_wgt_rd_0_data_bits_9_8,
	io_wgt_rd_0_data_bits_9_9,
	io_wgt_rd_0_data_bits_9_10,
	io_wgt_rd_0_data_bits_9_11,
	io_wgt_rd_0_data_bits_9_12,
	io_wgt_rd_0_data_bits_9_13,
	io_wgt_rd_0_data_bits_9_14,
	io_wgt_rd_0_data_bits_9_15,
	io_wgt_rd_0_data_bits_10_0,
	io_wgt_rd_0_data_bits_10_1,
	io_wgt_rd_0_data_bits_10_2,
	io_wgt_rd_0_data_bits_10_3,
	io_wgt_rd_0_data_bits_10_4,
	io_wgt_rd_0_data_bits_10_5,
	io_wgt_rd_0_data_bits_10_6,
	io_wgt_rd_0_data_bits_10_7,
	io_wgt_rd_0_data_bits_10_8,
	io_wgt_rd_0_data_bits_10_9,
	io_wgt_rd_0_data_bits_10_10,
	io_wgt_rd_0_data_bits_10_11,
	io_wgt_rd_0_data_bits_10_12,
	io_wgt_rd_0_data_bits_10_13,
	io_wgt_rd_0_data_bits_10_14,
	io_wgt_rd_0_data_bits_10_15,
	io_wgt_rd_0_data_bits_11_0,
	io_wgt_rd_0_data_bits_11_1,
	io_wgt_rd_0_data_bits_11_2,
	io_wgt_rd_0_data_bits_11_3,
	io_wgt_rd_0_data_bits_11_4,
	io_wgt_rd_0_data_bits_11_5,
	io_wgt_rd_0_data_bits_11_6,
	io_wgt_rd_0_data_bits_11_7,
	io_wgt_rd_0_data_bits_11_8,
	io_wgt_rd_0_data_bits_11_9,
	io_wgt_rd_0_data_bits_11_10,
	io_wgt_rd_0_data_bits_11_11,
	io_wgt_rd_0_data_bits_11_12,
	io_wgt_rd_0_data_bits_11_13,
	io_wgt_rd_0_data_bits_11_14,
	io_wgt_rd_0_data_bits_11_15,
	io_wgt_rd_0_data_bits_12_0,
	io_wgt_rd_0_data_bits_12_1,
	io_wgt_rd_0_data_bits_12_2,
	io_wgt_rd_0_data_bits_12_3,
	io_wgt_rd_0_data_bits_12_4,
	io_wgt_rd_0_data_bits_12_5,
	io_wgt_rd_0_data_bits_12_6,
	io_wgt_rd_0_data_bits_12_7,
	io_wgt_rd_0_data_bits_12_8,
	io_wgt_rd_0_data_bits_12_9,
	io_wgt_rd_0_data_bits_12_10,
	io_wgt_rd_0_data_bits_12_11,
	io_wgt_rd_0_data_bits_12_12,
	io_wgt_rd_0_data_bits_12_13,
	io_wgt_rd_0_data_bits_12_14,
	io_wgt_rd_0_data_bits_12_15,
	io_wgt_rd_0_data_bits_13_0,
	io_wgt_rd_0_data_bits_13_1,
	io_wgt_rd_0_data_bits_13_2,
	io_wgt_rd_0_data_bits_13_3,
	io_wgt_rd_0_data_bits_13_4,
	io_wgt_rd_0_data_bits_13_5,
	io_wgt_rd_0_data_bits_13_6,
	io_wgt_rd_0_data_bits_13_7,
	io_wgt_rd_0_data_bits_13_8,
	io_wgt_rd_0_data_bits_13_9,
	io_wgt_rd_0_data_bits_13_10,
	io_wgt_rd_0_data_bits_13_11,
	io_wgt_rd_0_data_bits_13_12,
	io_wgt_rd_0_data_bits_13_13,
	io_wgt_rd_0_data_bits_13_14,
	io_wgt_rd_0_data_bits_13_15,
	io_wgt_rd_0_data_bits_14_0,
	io_wgt_rd_0_data_bits_14_1,
	io_wgt_rd_0_data_bits_14_2,
	io_wgt_rd_0_data_bits_14_3,
	io_wgt_rd_0_data_bits_14_4,
	io_wgt_rd_0_data_bits_14_5,
	io_wgt_rd_0_data_bits_14_6,
	io_wgt_rd_0_data_bits_14_7,
	io_wgt_rd_0_data_bits_14_8,
	io_wgt_rd_0_data_bits_14_9,
	io_wgt_rd_0_data_bits_14_10,
	io_wgt_rd_0_data_bits_14_11,
	io_wgt_rd_0_data_bits_14_12,
	io_wgt_rd_0_data_bits_14_13,
	io_wgt_rd_0_data_bits_14_14,
	io_wgt_rd_0_data_bits_14_15,
	io_wgt_rd_0_data_bits_15_0,
	io_wgt_rd_0_data_bits_15_1,
	io_wgt_rd_0_data_bits_15_2,
	io_wgt_rd_0_data_bits_15_3,
	io_wgt_rd_0_data_bits_15_4,
	io_wgt_rd_0_data_bits_15_5,
	io_wgt_rd_0_data_bits_15_6,
	io_wgt_rd_0_data_bits_15_7,
	io_wgt_rd_0_data_bits_15_8,
	io_wgt_rd_0_data_bits_15_9,
	io_wgt_rd_0_data_bits_15_10,
	io_wgt_rd_0_data_bits_15_11,
	io_wgt_rd_0_data_bits_15_12,
	io_wgt_rd_0_data_bits_15_13,
	io_wgt_rd_0_data_bits_15_14,
	io_wgt_rd_0_data_bits_15_15,
	io_acc_rd_0_idx_valid,
	io_acc_rd_0_idx_bits,
	io_acc_rd_0_data_valid,
	io_acc_rd_0_data_bits_0_0,
	io_acc_rd_0_data_bits_0_1,
	io_acc_rd_0_data_bits_0_2,
	io_acc_rd_0_data_bits_0_3,
	io_acc_rd_0_data_bits_0_4,
	io_acc_rd_0_data_bits_0_5,
	io_acc_rd_0_data_bits_0_6,
	io_acc_rd_0_data_bits_0_7,
	io_acc_rd_0_data_bits_0_8,
	io_acc_rd_0_data_bits_0_9,
	io_acc_rd_0_data_bits_0_10,
	io_acc_rd_0_data_bits_0_11,
	io_acc_rd_0_data_bits_0_12,
	io_acc_rd_0_data_bits_0_13,
	io_acc_rd_0_data_bits_0_14,
	io_acc_rd_0_data_bits_0_15,
	io_acc_wr_0_valid,
	io_acc_wr_0_bits_idx,
	io_acc_wr_0_bits_data_0_0,
	io_acc_wr_0_bits_data_0_1,
	io_acc_wr_0_bits_data_0_2,
	io_acc_wr_0_bits_data_0_3,
	io_acc_wr_0_bits_data_0_4,
	io_acc_wr_0_bits_data_0_5,
	io_acc_wr_0_bits_data_0_6,
	io_acc_wr_0_bits_data_0_7,
	io_acc_wr_0_bits_data_0_8,
	io_acc_wr_0_bits_data_0_9,
	io_acc_wr_0_bits_data_0_10,
	io_acc_wr_0_bits_data_0_11,
	io_acc_wr_0_bits_data_0_12,
	io_acc_wr_0_bits_data_0_13,
	io_acc_wr_0_bits_data_0_14,
	io_acc_wr_0_bits_data_0_15,
	io_out_rd_0_data_valid,
	io_out_wr_0_valid,
	io_out_wr_0_bits_idx,
	io_out_wr_0_bits_data_0_0,
	io_out_wr_0_bits_data_0_1,
	io_out_wr_0_bits_data_0_2,
	io_out_wr_0_bits_data_0_3,
	io_out_wr_0_bits_data_0_4,
	io_out_wr_0_bits_data_0_5,
	io_out_wr_0_bits_data_0_6,
	io_out_wr_0_bits_data_0_7,
	io_out_wr_0_bits_data_0_8,
	io_out_wr_0_bits_data_0_9,
	io_out_wr_0_bits_data_0_10,
	io_out_wr_0_bits_data_0_11,
	io_out_wr_0_bits_data_0_12,
	io_out_wr_0_bits_data_0_13,
	io_out_wr_0_bits_data_0_14,
	io_out_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [9:0] io_dec_wgt_1;
	input [9:0] io_dec_wgt_0;
	input [10:0] io_dec_inp_1;
	input [10:0] io_dec_inp_0;
	input [10:0] io_dec_acc_1;
	input [10:0] io_dec_acc_0;
	input io_dec_empty_0;
	input [13:0] io_dec_lp_1;
	input [13:0] io_dec_lp_0;
	input [13:0] io_dec_uop_end;
	input [12:0] io_dec_uop_begin;
	input io_dec_reset;
	input io_dec_push_next;
	input io_dec_push_prev;
	input io_dec_pop_next;
	input io_dec_pop_prev;
	input [2:0] io_dec_op;
	output wire io_uop_idx_valid;
	output wire [10:0] io_uop_idx_bits;
	input io_uop_data_valid;
	input [9:0] io_uop_data_bits_u2;
	input [10:0] io_uop_data_bits_u1;
	input [10:0] io_uop_data_bits_u0;
	output wire io_inp_rd_0_idx_valid;
	output wire [10:0] io_inp_rd_0_idx_bits;
	input io_inp_rd_0_data_valid;
	input [7:0] io_inp_rd_0_data_bits_0_0;
	input [7:0] io_inp_rd_0_data_bits_0_1;
	input [7:0] io_inp_rd_0_data_bits_0_2;
	input [7:0] io_inp_rd_0_data_bits_0_3;
	input [7:0] io_inp_rd_0_data_bits_0_4;
	input [7:0] io_inp_rd_0_data_bits_0_5;
	input [7:0] io_inp_rd_0_data_bits_0_6;
	input [7:0] io_inp_rd_0_data_bits_0_7;
	input [7:0] io_inp_rd_0_data_bits_0_8;
	input [7:0] io_inp_rd_0_data_bits_0_9;
	input [7:0] io_inp_rd_0_data_bits_0_10;
	input [7:0] io_inp_rd_0_data_bits_0_11;
	input [7:0] io_inp_rd_0_data_bits_0_12;
	input [7:0] io_inp_rd_0_data_bits_0_13;
	input [7:0] io_inp_rd_0_data_bits_0_14;
	input [7:0] io_inp_rd_0_data_bits_0_15;
	output wire io_wgt_rd_0_idx_valid;
	output wire [9:0] io_wgt_rd_0_idx_bits;
	input io_wgt_rd_0_data_valid;
	input [7:0] io_wgt_rd_0_data_bits_0_0;
	input [7:0] io_wgt_rd_0_data_bits_0_1;
	input [7:0] io_wgt_rd_0_data_bits_0_2;
	input [7:0] io_wgt_rd_0_data_bits_0_3;
	input [7:0] io_wgt_rd_0_data_bits_0_4;
	input [7:0] io_wgt_rd_0_data_bits_0_5;
	input [7:0] io_wgt_rd_0_data_bits_0_6;
	input [7:0] io_wgt_rd_0_data_bits_0_7;
	input [7:0] io_wgt_rd_0_data_bits_0_8;
	input [7:0] io_wgt_rd_0_data_bits_0_9;
	input [7:0] io_wgt_rd_0_data_bits_0_10;
	input [7:0] io_wgt_rd_0_data_bits_0_11;
	input [7:0] io_wgt_rd_0_data_bits_0_12;
	input [7:0] io_wgt_rd_0_data_bits_0_13;
	input [7:0] io_wgt_rd_0_data_bits_0_14;
	input [7:0] io_wgt_rd_0_data_bits_0_15;
	input [7:0] io_wgt_rd_0_data_bits_1_0;
	input [7:0] io_wgt_rd_0_data_bits_1_1;
	input [7:0] io_wgt_rd_0_data_bits_1_2;
	input [7:0] io_wgt_rd_0_data_bits_1_3;
	input [7:0] io_wgt_rd_0_data_bits_1_4;
	input [7:0] io_wgt_rd_0_data_bits_1_5;
	input [7:0] io_wgt_rd_0_data_bits_1_6;
	input [7:0] io_wgt_rd_0_data_bits_1_7;
	input [7:0] io_wgt_rd_0_data_bits_1_8;
	input [7:0] io_wgt_rd_0_data_bits_1_9;
	input [7:0] io_wgt_rd_0_data_bits_1_10;
	input [7:0] io_wgt_rd_0_data_bits_1_11;
	input [7:0] io_wgt_rd_0_data_bits_1_12;
	input [7:0] io_wgt_rd_0_data_bits_1_13;
	input [7:0] io_wgt_rd_0_data_bits_1_14;
	input [7:0] io_wgt_rd_0_data_bits_1_15;
	input [7:0] io_wgt_rd_0_data_bits_2_0;
	input [7:0] io_wgt_rd_0_data_bits_2_1;
	input [7:0] io_wgt_rd_0_data_bits_2_2;
	input [7:0] io_wgt_rd_0_data_bits_2_3;
	input [7:0] io_wgt_rd_0_data_bits_2_4;
	input [7:0] io_wgt_rd_0_data_bits_2_5;
	input [7:0] io_wgt_rd_0_data_bits_2_6;
	input [7:0] io_wgt_rd_0_data_bits_2_7;
	input [7:0] io_wgt_rd_0_data_bits_2_8;
	input [7:0] io_wgt_rd_0_data_bits_2_9;
	input [7:0] io_wgt_rd_0_data_bits_2_10;
	input [7:0] io_wgt_rd_0_data_bits_2_11;
	input [7:0] io_wgt_rd_0_data_bits_2_12;
	input [7:0] io_wgt_rd_0_data_bits_2_13;
	input [7:0] io_wgt_rd_0_data_bits_2_14;
	input [7:0] io_wgt_rd_0_data_bits_2_15;
	input [7:0] io_wgt_rd_0_data_bits_3_0;
	input [7:0] io_wgt_rd_0_data_bits_3_1;
	input [7:0] io_wgt_rd_0_data_bits_3_2;
	input [7:0] io_wgt_rd_0_data_bits_3_3;
	input [7:0] io_wgt_rd_0_data_bits_3_4;
	input [7:0] io_wgt_rd_0_data_bits_3_5;
	input [7:0] io_wgt_rd_0_data_bits_3_6;
	input [7:0] io_wgt_rd_0_data_bits_3_7;
	input [7:0] io_wgt_rd_0_data_bits_3_8;
	input [7:0] io_wgt_rd_0_data_bits_3_9;
	input [7:0] io_wgt_rd_0_data_bits_3_10;
	input [7:0] io_wgt_rd_0_data_bits_3_11;
	input [7:0] io_wgt_rd_0_data_bits_3_12;
	input [7:0] io_wgt_rd_0_data_bits_3_13;
	input [7:0] io_wgt_rd_0_data_bits_3_14;
	input [7:0] io_wgt_rd_0_data_bits_3_15;
	input [7:0] io_wgt_rd_0_data_bits_4_0;
	input [7:0] io_wgt_rd_0_data_bits_4_1;
	input [7:0] io_wgt_rd_0_data_bits_4_2;
	input [7:0] io_wgt_rd_0_data_bits_4_3;
	input [7:0] io_wgt_rd_0_data_bits_4_4;
	input [7:0] io_wgt_rd_0_data_bits_4_5;
	input [7:0] io_wgt_rd_0_data_bits_4_6;
	input [7:0] io_wgt_rd_0_data_bits_4_7;
	input [7:0] io_wgt_rd_0_data_bits_4_8;
	input [7:0] io_wgt_rd_0_data_bits_4_9;
	input [7:0] io_wgt_rd_0_data_bits_4_10;
	input [7:0] io_wgt_rd_0_data_bits_4_11;
	input [7:0] io_wgt_rd_0_data_bits_4_12;
	input [7:0] io_wgt_rd_0_data_bits_4_13;
	input [7:0] io_wgt_rd_0_data_bits_4_14;
	input [7:0] io_wgt_rd_0_data_bits_4_15;
	input [7:0] io_wgt_rd_0_data_bits_5_0;
	input [7:0] io_wgt_rd_0_data_bits_5_1;
	input [7:0] io_wgt_rd_0_data_bits_5_2;
	input [7:0] io_wgt_rd_0_data_bits_5_3;
	input [7:0] io_wgt_rd_0_data_bits_5_4;
	input [7:0] io_wgt_rd_0_data_bits_5_5;
	input [7:0] io_wgt_rd_0_data_bits_5_6;
	input [7:0] io_wgt_rd_0_data_bits_5_7;
	input [7:0] io_wgt_rd_0_data_bits_5_8;
	input [7:0] io_wgt_rd_0_data_bits_5_9;
	input [7:0] io_wgt_rd_0_data_bits_5_10;
	input [7:0] io_wgt_rd_0_data_bits_5_11;
	input [7:0] io_wgt_rd_0_data_bits_5_12;
	input [7:0] io_wgt_rd_0_data_bits_5_13;
	input [7:0] io_wgt_rd_0_data_bits_5_14;
	input [7:0] io_wgt_rd_0_data_bits_5_15;
	input [7:0] io_wgt_rd_0_data_bits_6_0;
	input [7:0] io_wgt_rd_0_data_bits_6_1;
	input [7:0] io_wgt_rd_0_data_bits_6_2;
	input [7:0] io_wgt_rd_0_data_bits_6_3;
	input [7:0] io_wgt_rd_0_data_bits_6_4;
	input [7:0] io_wgt_rd_0_data_bits_6_5;
	input [7:0] io_wgt_rd_0_data_bits_6_6;
	input [7:0] io_wgt_rd_0_data_bits_6_7;
	input [7:0] io_wgt_rd_0_data_bits_6_8;
	input [7:0] io_wgt_rd_0_data_bits_6_9;
	input [7:0] io_wgt_rd_0_data_bits_6_10;
	input [7:0] io_wgt_rd_0_data_bits_6_11;
	input [7:0] io_wgt_rd_0_data_bits_6_12;
	input [7:0] io_wgt_rd_0_data_bits_6_13;
	input [7:0] io_wgt_rd_0_data_bits_6_14;
	input [7:0] io_wgt_rd_0_data_bits_6_15;
	input [7:0] io_wgt_rd_0_data_bits_7_0;
	input [7:0] io_wgt_rd_0_data_bits_7_1;
	input [7:0] io_wgt_rd_0_data_bits_7_2;
	input [7:0] io_wgt_rd_0_data_bits_7_3;
	input [7:0] io_wgt_rd_0_data_bits_7_4;
	input [7:0] io_wgt_rd_0_data_bits_7_5;
	input [7:0] io_wgt_rd_0_data_bits_7_6;
	input [7:0] io_wgt_rd_0_data_bits_7_7;
	input [7:0] io_wgt_rd_0_data_bits_7_8;
	input [7:0] io_wgt_rd_0_data_bits_7_9;
	input [7:0] io_wgt_rd_0_data_bits_7_10;
	input [7:0] io_wgt_rd_0_data_bits_7_11;
	input [7:0] io_wgt_rd_0_data_bits_7_12;
	input [7:0] io_wgt_rd_0_data_bits_7_13;
	input [7:0] io_wgt_rd_0_data_bits_7_14;
	input [7:0] io_wgt_rd_0_data_bits_7_15;
	input [7:0] io_wgt_rd_0_data_bits_8_0;
	input [7:0] io_wgt_rd_0_data_bits_8_1;
	input [7:0] io_wgt_rd_0_data_bits_8_2;
	input [7:0] io_wgt_rd_0_data_bits_8_3;
	input [7:0] io_wgt_rd_0_data_bits_8_4;
	input [7:0] io_wgt_rd_0_data_bits_8_5;
	input [7:0] io_wgt_rd_0_data_bits_8_6;
	input [7:0] io_wgt_rd_0_data_bits_8_7;
	input [7:0] io_wgt_rd_0_data_bits_8_8;
	input [7:0] io_wgt_rd_0_data_bits_8_9;
	input [7:0] io_wgt_rd_0_data_bits_8_10;
	input [7:0] io_wgt_rd_0_data_bits_8_11;
	input [7:0] io_wgt_rd_0_data_bits_8_12;
	input [7:0] io_wgt_rd_0_data_bits_8_13;
	input [7:0] io_wgt_rd_0_data_bits_8_14;
	input [7:0] io_wgt_rd_0_data_bits_8_15;
	input [7:0] io_wgt_rd_0_data_bits_9_0;
	input [7:0] io_wgt_rd_0_data_bits_9_1;
	input [7:0] io_wgt_rd_0_data_bits_9_2;
	input [7:0] io_wgt_rd_0_data_bits_9_3;
	input [7:0] io_wgt_rd_0_data_bits_9_4;
	input [7:0] io_wgt_rd_0_data_bits_9_5;
	input [7:0] io_wgt_rd_0_data_bits_9_6;
	input [7:0] io_wgt_rd_0_data_bits_9_7;
	input [7:0] io_wgt_rd_0_data_bits_9_8;
	input [7:0] io_wgt_rd_0_data_bits_9_9;
	input [7:0] io_wgt_rd_0_data_bits_9_10;
	input [7:0] io_wgt_rd_0_data_bits_9_11;
	input [7:0] io_wgt_rd_0_data_bits_9_12;
	input [7:0] io_wgt_rd_0_data_bits_9_13;
	input [7:0] io_wgt_rd_0_data_bits_9_14;
	input [7:0] io_wgt_rd_0_data_bits_9_15;
	input [7:0] io_wgt_rd_0_data_bits_10_0;
	input [7:0] io_wgt_rd_0_data_bits_10_1;
	input [7:0] io_wgt_rd_0_data_bits_10_2;
	input [7:0] io_wgt_rd_0_data_bits_10_3;
	input [7:0] io_wgt_rd_0_data_bits_10_4;
	input [7:0] io_wgt_rd_0_data_bits_10_5;
	input [7:0] io_wgt_rd_0_data_bits_10_6;
	input [7:0] io_wgt_rd_0_data_bits_10_7;
	input [7:0] io_wgt_rd_0_data_bits_10_8;
	input [7:0] io_wgt_rd_0_data_bits_10_9;
	input [7:0] io_wgt_rd_0_data_bits_10_10;
	input [7:0] io_wgt_rd_0_data_bits_10_11;
	input [7:0] io_wgt_rd_0_data_bits_10_12;
	input [7:0] io_wgt_rd_0_data_bits_10_13;
	input [7:0] io_wgt_rd_0_data_bits_10_14;
	input [7:0] io_wgt_rd_0_data_bits_10_15;
	input [7:0] io_wgt_rd_0_data_bits_11_0;
	input [7:0] io_wgt_rd_0_data_bits_11_1;
	input [7:0] io_wgt_rd_0_data_bits_11_2;
	input [7:0] io_wgt_rd_0_data_bits_11_3;
	input [7:0] io_wgt_rd_0_data_bits_11_4;
	input [7:0] io_wgt_rd_0_data_bits_11_5;
	input [7:0] io_wgt_rd_0_data_bits_11_6;
	input [7:0] io_wgt_rd_0_data_bits_11_7;
	input [7:0] io_wgt_rd_0_data_bits_11_8;
	input [7:0] io_wgt_rd_0_data_bits_11_9;
	input [7:0] io_wgt_rd_0_data_bits_11_10;
	input [7:0] io_wgt_rd_0_data_bits_11_11;
	input [7:0] io_wgt_rd_0_data_bits_11_12;
	input [7:0] io_wgt_rd_0_data_bits_11_13;
	input [7:0] io_wgt_rd_0_data_bits_11_14;
	input [7:0] io_wgt_rd_0_data_bits_11_15;
	input [7:0] io_wgt_rd_0_data_bits_12_0;
	input [7:0] io_wgt_rd_0_data_bits_12_1;
	input [7:0] io_wgt_rd_0_data_bits_12_2;
	input [7:0] io_wgt_rd_0_data_bits_12_3;
	input [7:0] io_wgt_rd_0_data_bits_12_4;
	input [7:0] io_wgt_rd_0_data_bits_12_5;
	input [7:0] io_wgt_rd_0_data_bits_12_6;
	input [7:0] io_wgt_rd_0_data_bits_12_7;
	input [7:0] io_wgt_rd_0_data_bits_12_8;
	input [7:0] io_wgt_rd_0_data_bits_12_9;
	input [7:0] io_wgt_rd_0_data_bits_12_10;
	input [7:0] io_wgt_rd_0_data_bits_12_11;
	input [7:0] io_wgt_rd_0_data_bits_12_12;
	input [7:0] io_wgt_rd_0_data_bits_12_13;
	input [7:0] io_wgt_rd_0_data_bits_12_14;
	input [7:0] io_wgt_rd_0_data_bits_12_15;
	input [7:0] io_wgt_rd_0_data_bits_13_0;
	input [7:0] io_wgt_rd_0_data_bits_13_1;
	input [7:0] io_wgt_rd_0_data_bits_13_2;
	input [7:0] io_wgt_rd_0_data_bits_13_3;
	input [7:0] io_wgt_rd_0_data_bits_13_4;
	input [7:0] io_wgt_rd_0_data_bits_13_5;
	input [7:0] io_wgt_rd_0_data_bits_13_6;
	input [7:0] io_wgt_rd_0_data_bits_13_7;
	input [7:0] io_wgt_rd_0_data_bits_13_8;
	input [7:0] io_wgt_rd_0_data_bits_13_9;
	input [7:0] io_wgt_rd_0_data_bits_13_10;
	input [7:0] io_wgt_rd_0_data_bits_13_11;
	input [7:0] io_wgt_rd_0_data_bits_13_12;
	input [7:0] io_wgt_rd_0_data_bits_13_13;
	input [7:0] io_wgt_rd_0_data_bits_13_14;
	input [7:0] io_wgt_rd_0_data_bits_13_15;
	input [7:0] io_wgt_rd_0_data_bits_14_0;
	input [7:0] io_wgt_rd_0_data_bits_14_1;
	input [7:0] io_wgt_rd_0_data_bits_14_2;
	input [7:0] io_wgt_rd_0_data_bits_14_3;
	input [7:0] io_wgt_rd_0_data_bits_14_4;
	input [7:0] io_wgt_rd_0_data_bits_14_5;
	input [7:0] io_wgt_rd_0_data_bits_14_6;
	input [7:0] io_wgt_rd_0_data_bits_14_7;
	input [7:0] io_wgt_rd_0_data_bits_14_8;
	input [7:0] io_wgt_rd_0_data_bits_14_9;
	input [7:0] io_wgt_rd_0_data_bits_14_10;
	input [7:0] io_wgt_rd_0_data_bits_14_11;
	input [7:0] io_wgt_rd_0_data_bits_14_12;
	input [7:0] io_wgt_rd_0_data_bits_14_13;
	input [7:0] io_wgt_rd_0_data_bits_14_14;
	input [7:0] io_wgt_rd_0_data_bits_14_15;
	input [7:0] io_wgt_rd_0_data_bits_15_0;
	input [7:0] io_wgt_rd_0_data_bits_15_1;
	input [7:0] io_wgt_rd_0_data_bits_15_2;
	input [7:0] io_wgt_rd_0_data_bits_15_3;
	input [7:0] io_wgt_rd_0_data_bits_15_4;
	input [7:0] io_wgt_rd_0_data_bits_15_5;
	input [7:0] io_wgt_rd_0_data_bits_15_6;
	input [7:0] io_wgt_rd_0_data_bits_15_7;
	input [7:0] io_wgt_rd_0_data_bits_15_8;
	input [7:0] io_wgt_rd_0_data_bits_15_9;
	input [7:0] io_wgt_rd_0_data_bits_15_10;
	input [7:0] io_wgt_rd_0_data_bits_15_11;
	input [7:0] io_wgt_rd_0_data_bits_15_12;
	input [7:0] io_wgt_rd_0_data_bits_15_13;
	input [7:0] io_wgt_rd_0_data_bits_15_14;
	input [7:0] io_wgt_rd_0_data_bits_15_15;
	output wire io_acc_rd_0_idx_valid;
	output wire [10:0] io_acc_rd_0_idx_bits;
	input io_acc_rd_0_data_valid;
	input [31:0] io_acc_rd_0_data_bits_0_0;
	input [31:0] io_acc_rd_0_data_bits_0_1;
	input [31:0] io_acc_rd_0_data_bits_0_2;
	input [31:0] io_acc_rd_0_data_bits_0_3;
	input [31:0] io_acc_rd_0_data_bits_0_4;
	input [31:0] io_acc_rd_0_data_bits_0_5;
	input [31:0] io_acc_rd_0_data_bits_0_6;
	input [31:0] io_acc_rd_0_data_bits_0_7;
	input [31:0] io_acc_rd_0_data_bits_0_8;
	input [31:0] io_acc_rd_0_data_bits_0_9;
	input [31:0] io_acc_rd_0_data_bits_0_10;
	input [31:0] io_acc_rd_0_data_bits_0_11;
	input [31:0] io_acc_rd_0_data_bits_0_12;
	input [31:0] io_acc_rd_0_data_bits_0_13;
	input [31:0] io_acc_rd_0_data_bits_0_14;
	input [31:0] io_acc_rd_0_data_bits_0_15;
	output wire io_acc_wr_0_valid;
	output wire [10:0] io_acc_wr_0_bits_idx;
	output wire [31:0] io_acc_wr_0_bits_data_0_0;
	output wire [31:0] io_acc_wr_0_bits_data_0_1;
	output wire [31:0] io_acc_wr_0_bits_data_0_2;
	output wire [31:0] io_acc_wr_0_bits_data_0_3;
	output wire [31:0] io_acc_wr_0_bits_data_0_4;
	output wire [31:0] io_acc_wr_0_bits_data_0_5;
	output wire [31:0] io_acc_wr_0_bits_data_0_6;
	output wire [31:0] io_acc_wr_0_bits_data_0_7;
	output wire [31:0] io_acc_wr_0_bits_data_0_8;
	output wire [31:0] io_acc_wr_0_bits_data_0_9;
	output wire [31:0] io_acc_wr_0_bits_data_0_10;
	output wire [31:0] io_acc_wr_0_bits_data_0_11;
	output wire [31:0] io_acc_wr_0_bits_data_0_12;
	output wire [31:0] io_acc_wr_0_bits_data_0_13;
	output wire [31:0] io_acc_wr_0_bits_data_0_14;
	output wire [31:0] io_acc_wr_0_bits_data_0_15;
	input io_out_rd_0_data_valid;
	output wire io_out_wr_0_valid;
	output wire [10:0] io_out_wr_0_bits_idx;
	output wire [7:0] io_out_wr_0_bits_data_0_0;
	output wire [7:0] io_out_wr_0_bits_data_0_1;
	output wire [7:0] io_out_wr_0_bits_data_0_2;
	output wire [7:0] io_out_wr_0_bits_data_0_3;
	output wire [7:0] io_out_wr_0_bits_data_0_4;
	output wire [7:0] io_out_wr_0_bits_data_0_5;
	output wire [7:0] io_out_wr_0_bits_data_0_6;
	output wire [7:0] io_out_wr_0_bits_data_0_7;
	output wire [7:0] io_out_wr_0_bits_data_0_8;
	output wire [7:0] io_out_wr_0_bits_data_0_9;
	output wire [7:0] io_out_wr_0_bits_data_0_10;
	output wire [7:0] io_out_wr_0_bits_data_0_11;
	output wire [7:0] io_out_wr_0_bits_data_0_12;
	output wire [7:0] io_out_wr_0_bits_data_0_13;
	output wire [7:0] io_out_wr_0_bits_data_0_14;
	output wire [7:0] io_out_wr_0_bits_data_0_15;
	wire m_clock;
	wire m_reset;
	wire m_io_start;
	wire m_io_last;
	wire [9:0] m_io_dec_wgt_1;
	wire [9:0] m_io_dec_wgt_0;
	wire [10:0] m_io_dec_inp_1;
	wire [10:0] m_io_dec_inp_0;
	wire [10:0] m_io_dec_acc_1;
	wire [10:0] m_io_dec_acc_0;
	wire [13:0] m_io_dec_lp_1;
	wire [13:0] m_io_dec_lp_0;
	wire [13:0] m_io_dec_uop_end;
	wire [12:0] m_io_dec_uop_begin;
	wire [10:0] m_io_acc_i;
	wire [10:0] m_io_inp_i;
	wire [9:0] m_io_wgt_i;
	wire [10:0] m_io_uop_idx;
	wire m_io_valid;
	wire reset_pipe_clock;
	wire reset_pipe_reset;
	wire reset_pipe_io_enq_valid;
	wire reset_pipe_io_enq_bits;
	wire reset_pipe_io_deq_valid;
	wire reset_pipe_io_deq_bits;
	wire acc_idx_pipe_clock;
	wire acc_idx_pipe_reset;
	wire acc_idx_pipe_io_enq_valid;
	wire [10:0] acc_idx_pipe_io_enq_bits;
	wire acc_idx_pipe_io_deq_valid;
	wire [10:0] acc_idx_pipe_io_deq_bits;
	wire wrpipe0_clock;
	wire wrpipe0_reset;
	wire wrpipe0_io_enq_valid;
	wire [10:0] wrpipe0_io_enq_bits;
	wire wrpipe0_io_deq_valid;
	wire [10:0] wrpipe0_io_deq_bits;
	wire wrpipeNs_clock;
	wire wrpipeNs_reset;
	wire wrpipeNs_io_enq_valid;
	wire [10:0] wrpipeNs_io_enq_bits;
	wire wrpipeNs_io_deq_valid;
	wire [10:0] wrpipeNs_io_deq_bits;
	wire wrpipe_0_clock;
	wire wrpipe_0_reset;
	wire wrpipe_0_io_enq_valid;
	wire [10:0] wrpipe_0_io_enq_bits;
	wire wrpipe_0_io_deq_valid;
	wire [10:0] wrpipe_0_io_deq_bits;
	wire mvc_0_clock;
	wire mvc_0_io_valid_reset;
	wire [7:0] mvc_0_io_inp_data_bits_0_0;
	wire [7:0] mvc_0_io_inp_data_bits_0_1;
	wire [7:0] mvc_0_io_inp_data_bits_0_2;
	wire [7:0] mvc_0_io_inp_data_bits_0_3;
	wire [7:0] mvc_0_io_inp_data_bits_0_4;
	wire [7:0] mvc_0_io_inp_data_bits_0_5;
	wire [7:0] mvc_0_io_inp_data_bits_0_6;
	wire [7:0] mvc_0_io_inp_data_bits_0_7;
	wire [7:0] mvc_0_io_inp_data_bits_0_8;
	wire [7:0] mvc_0_io_inp_data_bits_0_9;
	wire [7:0] mvc_0_io_inp_data_bits_0_10;
	wire [7:0] mvc_0_io_inp_data_bits_0_11;
	wire [7:0] mvc_0_io_inp_data_bits_0_12;
	wire [7:0] mvc_0_io_inp_data_bits_0_13;
	wire [7:0] mvc_0_io_inp_data_bits_0_14;
	wire [7:0] mvc_0_io_inp_data_bits_0_15;
	wire [7:0] mvc_0_io_wgt_data_bits_0_0;
	wire [7:0] mvc_0_io_wgt_data_bits_0_1;
	wire [7:0] mvc_0_io_wgt_data_bits_0_2;
	wire [7:0] mvc_0_io_wgt_data_bits_0_3;
	wire [7:0] mvc_0_io_wgt_data_bits_0_4;
	wire [7:0] mvc_0_io_wgt_data_bits_0_5;
	wire [7:0] mvc_0_io_wgt_data_bits_0_6;
	wire [7:0] mvc_0_io_wgt_data_bits_0_7;
	wire [7:0] mvc_0_io_wgt_data_bits_0_8;
	wire [7:0] mvc_0_io_wgt_data_bits_0_9;
	wire [7:0] mvc_0_io_wgt_data_bits_0_10;
	wire [7:0] mvc_0_io_wgt_data_bits_0_11;
	wire [7:0] mvc_0_io_wgt_data_bits_0_12;
	wire [7:0] mvc_0_io_wgt_data_bits_0_13;
	wire [7:0] mvc_0_io_wgt_data_bits_0_14;
	wire [7:0] mvc_0_io_wgt_data_bits_0_15;
	wire [7:0] mvc_0_io_wgt_data_bits_1_0;
	wire [7:0] mvc_0_io_wgt_data_bits_1_1;
	wire [7:0] mvc_0_io_wgt_data_bits_1_2;
	wire [7:0] mvc_0_io_wgt_data_bits_1_3;
	wire [7:0] mvc_0_io_wgt_data_bits_1_4;
	wire [7:0] mvc_0_io_wgt_data_bits_1_5;
	wire [7:0] mvc_0_io_wgt_data_bits_1_6;
	wire [7:0] mvc_0_io_wgt_data_bits_1_7;
	wire [7:0] mvc_0_io_wgt_data_bits_1_8;
	wire [7:0] mvc_0_io_wgt_data_bits_1_9;
	wire [7:0] mvc_0_io_wgt_data_bits_1_10;
	wire [7:0] mvc_0_io_wgt_data_bits_1_11;
	wire [7:0] mvc_0_io_wgt_data_bits_1_12;
	wire [7:0] mvc_0_io_wgt_data_bits_1_13;
	wire [7:0] mvc_0_io_wgt_data_bits_1_14;
	wire [7:0] mvc_0_io_wgt_data_bits_1_15;
	wire [7:0] mvc_0_io_wgt_data_bits_2_0;
	wire [7:0] mvc_0_io_wgt_data_bits_2_1;
	wire [7:0] mvc_0_io_wgt_data_bits_2_2;
	wire [7:0] mvc_0_io_wgt_data_bits_2_3;
	wire [7:0] mvc_0_io_wgt_data_bits_2_4;
	wire [7:0] mvc_0_io_wgt_data_bits_2_5;
	wire [7:0] mvc_0_io_wgt_data_bits_2_6;
	wire [7:0] mvc_0_io_wgt_data_bits_2_7;
	wire [7:0] mvc_0_io_wgt_data_bits_2_8;
	wire [7:0] mvc_0_io_wgt_data_bits_2_9;
	wire [7:0] mvc_0_io_wgt_data_bits_2_10;
	wire [7:0] mvc_0_io_wgt_data_bits_2_11;
	wire [7:0] mvc_0_io_wgt_data_bits_2_12;
	wire [7:0] mvc_0_io_wgt_data_bits_2_13;
	wire [7:0] mvc_0_io_wgt_data_bits_2_14;
	wire [7:0] mvc_0_io_wgt_data_bits_2_15;
	wire [7:0] mvc_0_io_wgt_data_bits_3_0;
	wire [7:0] mvc_0_io_wgt_data_bits_3_1;
	wire [7:0] mvc_0_io_wgt_data_bits_3_2;
	wire [7:0] mvc_0_io_wgt_data_bits_3_3;
	wire [7:0] mvc_0_io_wgt_data_bits_3_4;
	wire [7:0] mvc_0_io_wgt_data_bits_3_5;
	wire [7:0] mvc_0_io_wgt_data_bits_3_6;
	wire [7:0] mvc_0_io_wgt_data_bits_3_7;
	wire [7:0] mvc_0_io_wgt_data_bits_3_8;
	wire [7:0] mvc_0_io_wgt_data_bits_3_9;
	wire [7:0] mvc_0_io_wgt_data_bits_3_10;
	wire [7:0] mvc_0_io_wgt_data_bits_3_11;
	wire [7:0] mvc_0_io_wgt_data_bits_3_12;
	wire [7:0] mvc_0_io_wgt_data_bits_3_13;
	wire [7:0] mvc_0_io_wgt_data_bits_3_14;
	wire [7:0] mvc_0_io_wgt_data_bits_3_15;
	wire [7:0] mvc_0_io_wgt_data_bits_4_0;
	wire [7:0] mvc_0_io_wgt_data_bits_4_1;
	wire [7:0] mvc_0_io_wgt_data_bits_4_2;
	wire [7:0] mvc_0_io_wgt_data_bits_4_3;
	wire [7:0] mvc_0_io_wgt_data_bits_4_4;
	wire [7:0] mvc_0_io_wgt_data_bits_4_5;
	wire [7:0] mvc_0_io_wgt_data_bits_4_6;
	wire [7:0] mvc_0_io_wgt_data_bits_4_7;
	wire [7:0] mvc_0_io_wgt_data_bits_4_8;
	wire [7:0] mvc_0_io_wgt_data_bits_4_9;
	wire [7:0] mvc_0_io_wgt_data_bits_4_10;
	wire [7:0] mvc_0_io_wgt_data_bits_4_11;
	wire [7:0] mvc_0_io_wgt_data_bits_4_12;
	wire [7:0] mvc_0_io_wgt_data_bits_4_13;
	wire [7:0] mvc_0_io_wgt_data_bits_4_14;
	wire [7:0] mvc_0_io_wgt_data_bits_4_15;
	wire [7:0] mvc_0_io_wgt_data_bits_5_0;
	wire [7:0] mvc_0_io_wgt_data_bits_5_1;
	wire [7:0] mvc_0_io_wgt_data_bits_5_2;
	wire [7:0] mvc_0_io_wgt_data_bits_5_3;
	wire [7:0] mvc_0_io_wgt_data_bits_5_4;
	wire [7:0] mvc_0_io_wgt_data_bits_5_5;
	wire [7:0] mvc_0_io_wgt_data_bits_5_6;
	wire [7:0] mvc_0_io_wgt_data_bits_5_7;
	wire [7:0] mvc_0_io_wgt_data_bits_5_8;
	wire [7:0] mvc_0_io_wgt_data_bits_5_9;
	wire [7:0] mvc_0_io_wgt_data_bits_5_10;
	wire [7:0] mvc_0_io_wgt_data_bits_5_11;
	wire [7:0] mvc_0_io_wgt_data_bits_5_12;
	wire [7:0] mvc_0_io_wgt_data_bits_5_13;
	wire [7:0] mvc_0_io_wgt_data_bits_5_14;
	wire [7:0] mvc_0_io_wgt_data_bits_5_15;
	wire [7:0] mvc_0_io_wgt_data_bits_6_0;
	wire [7:0] mvc_0_io_wgt_data_bits_6_1;
	wire [7:0] mvc_0_io_wgt_data_bits_6_2;
	wire [7:0] mvc_0_io_wgt_data_bits_6_3;
	wire [7:0] mvc_0_io_wgt_data_bits_6_4;
	wire [7:0] mvc_0_io_wgt_data_bits_6_5;
	wire [7:0] mvc_0_io_wgt_data_bits_6_6;
	wire [7:0] mvc_0_io_wgt_data_bits_6_7;
	wire [7:0] mvc_0_io_wgt_data_bits_6_8;
	wire [7:0] mvc_0_io_wgt_data_bits_6_9;
	wire [7:0] mvc_0_io_wgt_data_bits_6_10;
	wire [7:0] mvc_0_io_wgt_data_bits_6_11;
	wire [7:0] mvc_0_io_wgt_data_bits_6_12;
	wire [7:0] mvc_0_io_wgt_data_bits_6_13;
	wire [7:0] mvc_0_io_wgt_data_bits_6_14;
	wire [7:0] mvc_0_io_wgt_data_bits_6_15;
	wire [7:0] mvc_0_io_wgt_data_bits_7_0;
	wire [7:0] mvc_0_io_wgt_data_bits_7_1;
	wire [7:0] mvc_0_io_wgt_data_bits_7_2;
	wire [7:0] mvc_0_io_wgt_data_bits_7_3;
	wire [7:0] mvc_0_io_wgt_data_bits_7_4;
	wire [7:0] mvc_0_io_wgt_data_bits_7_5;
	wire [7:0] mvc_0_io_wgt_data_bits_7_6;
	wire [7:0] mvc_0_io_wgt_data_bits_7_7;
	wire [7:0] mvc_0_io_wgt_data_bits_7_8;
	wire [7:0] mvc_0_io_wgt_data_bits_7_9;
	wire [7:0] mvc_0_io_wgt_data_bits_7_10;
	wire [7:0] mvc_0_io_wgt_data_bits_7_11;
	wire [7:0] mvc_0_io_wgt_data_bits_7_12;
	wire [7:0] mvc_0_io_wgt_data_bits_7_13;
	wire [7:0] mvc_0_io_wgt_data_bits_7_14;
	wire [7:0] mvc_0_io_wgt_data_bits_7_15;
	wire [7:0] mvc_0_io_wgt_data_bits_8_0;
	wire [7:0] mvc_0_io_wgt_data_bits_8_1;
	wire [7:0] mvc_0_io_wgt_data_bits_8_2;
	wire [7:0] mvc_0_io_wgt_data_bits_8_3;
	wire [7:0] mvc_0_io_wgt_data_bits_8_4;
	wire [7:0] mvc_0_io_wgt_data_bits_8_5;
	wire [7:0] mvc_0_io_wgt_data_bits_8_6;
	wire [7:0] mvc_0_io_wgt_data_bits_8_7;
	wire [7:0] mvc_0_io_wgt_data_bits_8_8;
	wire [7:0] mvc_0_io_wgt_data_bits_8_9;
	wire [7:0] mvc_0_io_wgt_data_bits_8_10;
	wire [7:0] mvc_0_io_wgt_data_bits_8_11;
	wire [7:0] mvc_0_io_wgt_data_bits_8_12;
	wire [7:0] mvc_0_io_wgt_data_bits_8_13;
	wire [7:0] mvc_0_io_wgt_data_bits_8_14;
	wire [7:0] mvc_0_io_wgt_data_bits_8_15;
	wire [7:0] mvc_0_io_wgt_data_bits_9_0;
	wire [7:0] mvc_0_io_wgt_data_bits_9_1;
	wire [7:0] mvc_0_io_wgt_data_bits_9_2;
	wire [7:0] mvc_0_io_wgt_data_bits_9_3;
	wire [7:0] mvc_0_io_wgt_data_bits_9_4;
	wire [7:0] mvc_0_io_wgt_data_bits_9_5;
	wire [7:0] mvc_0_io_wgt_data_bits_9_6;
	wire [7:0] mvc_0_io_wgt_data_bits_9_7;
	wire [7:0] mvc_0_io_wgt_data_bits_9_8;
	wire [7:0] mvc_0_io_wgt_data_bits_9_9;
	wire [7:0] mvc_0_io_wgt_data_bits_9_10;
	wire [7:0] mvc_0_io_wgt_data_bits_9_11;
	wire [7:0] mvc_0_io_wgt_data_bits_9_12;
	wire [7:0] mvc_0_io_wgt_data_bits_9_13;
	wire [7:0] mvc_0_io_wgt_data_bits_9_14;
	wire [7:0] mvc_0_io_wgt_data_bits_9_15;
	wire [7:0] mvc_0_io_wgt_data_bits_10_0;
	wire [7:0] mvc_0_io_wgt_data_bits_10_1;
	wire [7:0] mvc_0_io_wgt_data_bits_10_2;
	wire [7:0] mvc_0_io_wgt_data_bits_10_3;
	wire [7:0] mvc_0_io_wgt_data_bits_10_4;
	wire [7:0] mvc_0_io_wgt_data_bits_10_5;
	wire [7:0] mvc_0_io_wgt_data_bits_10_6;
	wire [7:0] mvc_0_io_wgt_data_bits_10_7;
	wire [7:0] mvc_0_io_wgt_data_bits_10_8;
	wire [7:0] mvc_0_io_wgt_data_bits_10_9;
	wire [7:0] mvc_0_io_wgt_data_bits_10_10;
	wire [7:0] mvc_0_io_wgt_data_bits_10_11;
	wire [7:0] mvc_0_io_wgt_data_bits_10_12;
	wire [7:0] mvc_0_io_wgt_data_bits_10_13;
	wire [7:0] mvc_0_io_wgt_data_bits_10_14;
	wire [7:0] mvc_0_io_wgt_data_bits_10_15;
	wire [7:0] mvc_0_io_wgt_data_bits_11_0;
	wire [7:0] mvc_0_io_wgt_data_bits_11_1;
	wire [7:0] mvc_0_io_wgt_data_bits_11_2;
	wire [7:0] mvc_0_io_wgt_data_bits_11_3;
	wire [7:0] mvc_0_io_wgt_data_bits_11_4;
	wire [7:0] mvc_0_io_wgt_data_bits_11_5;
	wire [7:0] mvc_0_io_wgt_data_bits_11_6;
	wire [7:0] mvc_0_io_wgt_data_bits_11_7;
	wire [7:0] mvc_0_io_wgt_data_bits_11_8;
	wire [7:0] mvc_0_io_wgt_data_bits_11_9;
	wire [7:0] mvc_0_io_wgt_data_bits_11_10;
	wire [7:0] mvc_0_io_wgt_data_bits_11_11;
	wire [7:0] mvc_0_io_wgt_data_bits_11_12;
	wire [7:0] mvc_0_io_wgt_data_bits_11_13;
	wire [7:0] mvc_0_io_wgt_data_bits_11_14;
	wire [7:0] mvc_0_io_wgt_data_bits_11_15;
	wire [7:0] mvc_0_io_wgt_data_bits_12_0;
	wire [7:0] mvc_0_io_wgt_data_bits_12_1;
	wire [7:0] mvc_0_io_wgt_data_bits_12_2;
	wire [7:0] mvc_0_io_wgt_data_bits_12_3;
	wire [7:0] mvc_0_io_wgt_data_bits_12_4;
	wire [7:0] mvc_0_io_wgt_data_bits_12_5;
	wire [7:0] mvc_0_io_wgt_data_bits_12_6;
	wire [7:0] mvc_0_io_wgt_data_bits_12_7;
	wire [7:0] mvc_0_io_wgt_data_bits_12_8;
	wire [7:0] mvc_0_io_wgt_data_bits_12_9;
	wire [7:0] mvc_0_io_wgt_data_bits_12_10;
	wire [7:0] mvc_0_io_wgt_data_bits_12_11;
	wire [7:0] mvc_0_io_wgt_data_bits_12_12;
	wire [7:0] mvc_0_io_wgt_data_bits_12_13;
	wire [7:0] mvc_0_io_wgt_data_bits_12_14;
	wire [7:0] mvc_0_io_wgt_data_bits_12_15;
	wire [7:0] mvc_0_io_wgt_data_bits_13_0;
	wire [7:0] mvc_0_io_wgt_data_bits_13_1;
	wire [7:0] mvc_0_io_wgt_data_bits_13_2;
	wire [7:0] mvc_0_io_wgt_data_bits_13_3;
	wire [7:0] mvc_0_io_wgt_data_bits_13_4;
	wire [7:0] mvc_0_io_wgt_data_bits_13_5;
	wire [7:0] mvc_0_io_wgt_data_bits_13_6;
	wire [7:0] mvc_0_io_wgt_data_bits_13_7;
	wire [7:0] mvc_0_io_wgt_data_bits_13_8;
	wire [7:0] mvc_0_io_wgt_data_bits_13_9;
	wire [7:0] mvc_0_io_wgt_data_bits_13_10;
	wire [7:0] mvc_0_io_wgt_data_bits_13_11;
	wire [7:0] mvc_0_io_wgt_data_bits_13_12;
	wire [7:0] mvc_0_io_wgt_data_bits_13_13;
	wire [7:0] mvc_0_io_wgt_data_bits_13_14;
	wire [7:0] mvc_0_io_wgt_data_bits_13_15;
	wire [7:0] mvc_0_io_wgt_data_bits_14_0;
	wire [7:0] mvc_0_io_wgt_data_bits_14_1;
	wire [7:0] mvc_0_io_wgt_data_bits_14_2;
	wire [7:0] mvc_0_io_wgt_data_bits_14_3;
	wire [7:0] mvc_0_io_wgt_data_bits_14_4;
	wire [7:0] mvc_0_io_wgt_data_bits_14_5;
	wire [7:0] mvc_0_io_wgt_data_bits_14_6;
	wire [7:0] mvc_0_io_wgt_data_bits_14_7;
	wire [7:0] mvc_0_io_wgt_data_bits_14_8;
	wire [7:0] mvc_0_io_wgt_data_bits_14_9;
	wire [7:0] mvc_0_io_wgt_data_bits_14_10;
	wire [7:0] mvc_0_io_wgt_data_bits_14_11;
	wire [7:0] mvc_0_io_wgt_data_bits_14_12;
	wire [7:0] mvc_0_io_wgt_data_bits_14_13;
	wire [7:0] mvc_0_io_wgt_data_bits_14_14;
	wire [7:0] mvc_0_io_wgt_data_bits_14_15;
	wire [7:0] mvc_0_io_wgt_data_bits_15_0;
	wire [7:0] mvc_0_io_wgt_data_bits_15_1;
	wire [7:0] mvc_0_io_wgt_data_bits_15_2;
	wire [7:0] mvc_0_io_wgt_data_bits_15_3;
	wire [7:0] mvc_0_io_wgt_data_bits_15_4;
	wire [7:0] mvc_0_io_wgt_data_bits_15_5;
	wire [7:0] mvc_0_io_wgt_data_bits_15_6;
	wire [7:0] mvc_0_io_wgt_data_bits_15_7;
	wire [7:0] mvc_0_io_wgt_data_bits_15_8;
	wire [7:0] mvc_0_io_wgt_data_bits_15_9;
	wire [7:0] mvc_0_io_wgt_data_bits_15_10;
	wire [7:0] mvc_0_io_wgt_data_bits_15_11;
	wire [7:0] mvc_0_io_wgt_data_bits_15_12;
	wire [7:0] mvc_0_io_wgt_data_bits_15_13;
	wire [7:0] mvc_0_io_wgt_data_bits_15_14;
	wire [7:0] mvc_0_io_wgt_data_bits_15_15;
	wire mvc_0_io_acc_i_data_valid;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_0;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_1;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_2;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_3;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_4;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_5;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_6;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_7;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_8;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_9;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_10;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_11;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_12;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_13;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_14;
	wire [31:0] mvc_0_io_acc_i_data_bits_0_15;
	wire mvc_0_io_acc_o_data_valid;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_0;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_1;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_2;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_3;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_4;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_5;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_6;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_7;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_8;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_9;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_10;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_11;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_12;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_13;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_14;
	wire [31:0] mvc_0_io_acc_o_data_bits_0_15;
	wire mvc_0_io_out_data_valid;
	wire [7:0] mvc_0_io_out_data_bits_0_0;
	wire [7:0] mvc_0_io_out_data_bits_0_1;
	wire [7:0] mvc_0_io_out_data_bits_0_2;
	wire [7:0] mvc_0_io_out_data_bits_0_3;
	wire [7:0] mvc_0_io_out_data_bits_0_4;
	wire [7:0] mvc_0_io_out_data_bits_0_5;
	wire [7:0] mvc_0_io_out_data_bits_0_6;
	wire [7:0] mvc_0_io_out_data_bits_0_7;
	wire [7:0] mvc_0_io_out_data_bits_0_8;
	wire [7:0] mvc_0_io_out_data_bits_0_9;
	wire [7:0] mvc_0_io_out_data_bits_0_10;
	wire [7:0] mvc_0_io_out_data_bits_0_11;
	wire [7:0] mvc_0_io_out_data_bits_0_12;
	wire [7:0] mvc_0_io_out_data_bits_0_13;
	wire [7:0] mvc_0_io_out_data_bits_0_14;
	wire [7:0] mvc_0_io_out_data_bits_0_15;
	wire mvc_0_io_bypass_cond;
	wire wrpipe2_clock;
	wire wrpipe2_reset;
	wire wrpipe2_io_enq_valid;
	wire [10:0] wrpipe2_io_enq_bits;
	wire wrpipe2_io_deq_valid;
	wire [10:0] wrpipe2_io_deq_bits;
	reg delayed_valid;
	wire _GEN_0 = m_io_valid;
	reg [10:0] delayed_acc_i;
	reg [10:0] delayed_inp_i;
	reg [9:0] delayed_wgt_i;
	reg [1:0] state;
	reg [3:0] inflight;
	reg [9:0] capture_dec_wgt_1;
	reg [9:0] capture_dec_wgt_0;
	reg [10:0] capture_dec_inp_1;
	reg [10:0] capture_dec_inp_0;
	reg [10:0] capture_dec_acc_1;
	reg [10:0] capture_dec_acc_0;
	reg capture_dec_empty_0;
	reg [13:0] capture_dec_lp_1;
	reg [13:0] capture_dec_lp_0;
	reg [13:0] capture_dec_uop_end;
	reg [12:0] capture_dec_uop_begin;
	reg capture_dec_reset;
	reg capture_dec_push_next;
	reg capture_dec_push_prev;
	reg capture_dec_pop_next;
	reg capture_dec_pop_prev;
	reg [2:0] capture_dec_op;
	wire _T = state == 2'h0;
	wire _T_5 = inflight == 4'h0;
	wire _T_6 = (state == 2'h2) & (inflight == 4'h0);
	wire _GEN_7 = ((state == 2'h1) & m_io_last ? 1'h0 : _T_6);
	wire [34:0] lo = {capture_dec_uop_end, capture_dec_uop_begin, capture_dec_reset, capture_dec_push_next, capture_dec_push_prev, capture_dec_pop_next, capture_dec_pop_prev, capture_dec_op};
	wire [127:0] _T_8 = {capture_dec_wgt_1, capture_dec_wgt_0, capture_dec_inp_1, capture_dec_inp_0, capture_dec_acc_1, capture_dec_acc_0, capture_dec_empty_0, capture_dec_lp_1, capture_dec_lp_0, lo};
	wire [34:0] lo_1 = {io_dec_uop_end, io_dec_uop_begin, io_dec_reset, io_dec_push_next, io_dec_push_prev, io_dec_pop_next, io_dec_pop_prev, io_dec_op};
	wire [127:0] _T_9 = {io_dec_wgt_1, io_dec_wgt_0, io_dec_inp_1, io_dec_inp_0, io_dec_acc_1, io_dec_acc_0, io_dec_empty_0, io_dec_lp_1, io_dec_lp_0, lo_1};
	wire _T_10 = _T_8 == _T_9;
	wire _T_13 = ~rst;
	reg delayed_uop_valid;
	reg io_acc_rd_0_idx_valid_REG;
	reg [10:0] io_acc_rd_0_idx_bits_REG;
	wire _T_39 = m_io_valid & wrpipeNs_io_deq_valid;
	wire [3:0] _inflight_T_1 = inflight + 4'h1;
	wire [3:0] _inflight_T_3 = inflight - 4'h1;
	wire [3:0] _GEN_27 = (wrpipeNs_io_deq_valid ? _inflight_T_3 : inflight);
	reg mvc_0_io_valid_reset_REG;
	wire _GEN_31 = ~_T_39;
	TensorGemmIndexGenerator m(
		.clk(m_clock),
		.rst(m_reset),
		.io_start(m_io_start),
		.io_last(m_io_last),
		.io_dec_wgt_1(m_io_dec_wgt_1),
		.io_dec_wgt_0(m_io_dec_wgt_0),
		.io_dec_inp_1(m_io_dec_inp_1),
		.io_dec_inp_0(m_io_dec_inp_0),
		.io_dec_acc_1(m_io_dec_acc_1),
		.io_dec_acc_0(m_io_dec_acc_0),
		.io_dec_lp_1(m_io_dec_lp_1),
		.io_dec_lp_0(m_io_dec_lp_0),
		.io_dec_uop_end(m_io_dec_uop_end),
		.io_dec_uop_begin(m_io_dec_uop_begin),
		.io_acc_i(m_io_acc_i),
		.io_inp_i(m_io_inp_i),
		.io_wgt_i(m_io_wgt_i),
		.io_uop_idx(m_io_uop_idx),
		.io_valid(m_io_valid)
	);
	Pipe reset_pipe(
		.clk(reset_pipe_clock),
		.rst(reset_pipe_reset),
		.io_enq_valid(reset_pipe_io_enq_valid),
		.io_enq_bits(reset_pipe_io_enq_bits),
		.io_deq_valid(reset_pipe_io_deq_valid),
		.io_deq_bits(reset_pipe_io_deq_bits)
	);
	Pipe_1 acc_idx_pipe(
		.clk(acc_idx_pipe_clock),
		.rst(acc_idx_pipe_reset),
		.io_enq_valid(acc_idx_pipe_io_enq_valid),
		.io_enq_bits(acc_idx_pipe_io_enq_bits),
		.io_deq_valid(acc_idx_pipe_io_deq_valid),
		.io_deq_bits(acc_idx_pipe_io_deq_bits)
	);
	Pipe_2 wrpipe0(
		.clk(wrpipe0_clock),
		.rst(wrpipe0_reset),
		.io_enq_valid(wrpipe0_io_enq_valid),
		.io_enq_bits(wrpipe0_io_enq_bits),
		.io_deq_valid(wrpipe0_io_deq_valid),
		.io_deq_bits(wrpipe0_io_deq_bits)
	);
	Pipe_1 wrpipeNs(
		.clk(wrpipeNs_clock),
		.rst(wrpipeNs_reset),
		.io_enq_valid(wrpipeNs_io_enq_valid),
		.io_enq_bits(wrpipeNs_io_enq_bits),
		.io_deq_valid(wrpipeNs_io_deq_valid),
		.io_deq_bits(wrpipeNs_io_deq_bits)
	);
	Pipe_1 wrpipe_0(
		.clk(wrpipe_0_clock),
		.rst(wrpipe_0_reset),
		.io_enq_valid(wrpipe_0_io_enq_valid),
		.io_enq_bits(wrpipe_0_io_enq_bits),
		.io_deq_valid(wrpipe_0_io_deq_valid),
		.io_deq_bits(wrpipe_0_io_deq_bits)
	);
	MatrixVectorMultiplicationBypass mvc_0(
		.clk(mvc_0_clock),
		.io_valid_reset(mvc_0_io_valid_reset),
		.io_inp_data_bits_0_0(mvc_0_io_inp_data_bits_0_0),
		.io_inp_data_bits_0_1(mvc_0_io_inp_data_bits_0_1),
		.io_inp_data_bits_0_2(mvc_0_io_inp_data_bits_0_2),
		.io_inp_data_bits_0_3(mvc_0_io_inp_data_bits_0_3),
		.io_inp_data_bits_0_4(mvc_0_io_inp_data_bits_0_4),
		.io_inp_data_bits_0_5(mvc_0_io_inp_data_bits_0_5),
		.io_inp_data_bits_0_6(mvc_0_io_inp_data_bits_0_6),
		.io_inp_data_bits_0_7(mvc_0_io_inp_data_bits_0_7),
		.io_inp_data_bits_0_8(mvc_0_io_inp_data_bits_0_8),
		.io_inp_data_bits_0_9(mvc_0_io_inp_data_bits_0_9),
		.io_inp_data_bits_0_10(mvc_0_io_inp_data_bits_0_10),
		.io_inp_data_bits_0_11(mvc_0_io_inp_data_bits_0_11),
		.io_inp_data_bits_0_12(mvc_0_io_inp_data_bits_0_12),
		.io_inp_data_bits_0_13(mvc_0_io_inp_data_bits_0_13),
		.io_inp_data_bits_0_14(mvc_0_io_inp_data_bits_0_14),
		.io_inp_data_bits_0_15(mvc_0_io_inp_data_bits_0_15),
		.io_wgt_data_bits_0_0(mvc_0_io_wgt_data_bits_0_0),
		.io_wgt_data_bits_0_1(mvc_0_io_wgt_data_bits_0_1),
		.io_wgt_data_bits_0_2(mvc_0_io_wgt_data_bits_0_2),
		.io_wgt_data_bits_0_3(mvc_0_io_wgt_data_bits_0_3),
		.io_wgt_data_bits_0_4(mvc_0_io_wgt_data_bits_0_4),
		.io_wgt_data_bits_0_5(mvc_0_io_wgt_data_bits_0_5),
		.io_wgt_data_bits_0_6(mvc_0_io_wgt_data_bits_0_6),
		.io_wgt_data_bits_0_7(mvc_0_io_wgt_data_bits_0_7),
		.io_wgt_data_bits_0_8(mvc_0_io_wgt_data_bits_0_8),
		.io_wgt_data_bits_0_9(mvc_0_io_wgt_data_bits_0_9),
		.io_wgt_data_bits_0_10(mvc_0_io_wgt_data_bits_0_10),
		.io_wgt_data_bits_0_11(mvc_0_io_wgt_data_bits_0_11),
		.io_wgt_data_bits_0_12(mvc_0_io_wgt_data_bits_0_12),
		.io_wgt_data_bits_0_13(mvc_0_io_wgt_data_bits_0_13),
		.io_wgt_data_bits_0_14(mvc_0_io_wgt_data_bits_0_14),
		.io_wgt_data_bits_0_15(mvc_0_io_wgt_data_bits_0_15),
		.io_wgt_data_bits_1_0(mvc_0_io_wgt_data_bits_1_0),
		.io_wgt_data_bits_1_1(mvc_0_io_wgt_data_bits_1_1),
		.io_wgt_data_bits_1_2(mvc_0_io_wgt_data_bits_1_2),
		.io_wgt_data_bits_1_3(mvc_0_io_wgt_data_bits_1_3),
		.io_wgt_data_bits_1_4(mvc_0_io_wgt_data_bits_1_4),
		.io_wgt_data_bits_1_5(mvc_0_io_wgt_data_bits_1_5),
		.io_wgt_data_bits_1_6(mvc_0_io_wgt_data_bits_1_6),
		.io_wgt_data_bits_1_7(mvc_0_io_wgt_data_bits_1_7),
		.io_wgt_data_bits_1_8(mvc_0_io_wgt_data_bits_1_8),
		.io_wgt_data_bits_1_9(mvc_0_io_wgt_data_bits_1_9),
		.io_wgt_data_bits_1_10(mvc_0_io_wgt_data_bits_1_10),
		.io_wgt_data_bits_1_11(mvc_0_io_wgt_data_bits_1_11),
		.io_wgt_data_bits_1_12(mvc_0_io_wgt_data_bits_1_12),
		.io_wgt_data_bits_1_13(mvc_0_io_wgt_data_bits_1_13),
		.io_wgt_data_bits_1_14(mvc_0_io_wgt_data_bits_1_14),
		.io_wgt_data_bits_1_15(mvc_0_io_wgt_data_bits_1_15),
		.io_wgt_data_bits_2_0(mvc_0_io_wgt_data_bits_2_0),
		.io_wgt_data_bits_2_1(mvc_0_io_wgt_data_bits_2_1),
		.io_wgt_data_bits_2_2(mvc_0_io_wgt_data_bits_2_2),
		.io_wgt_data_bits_2_3(mvc_0_io_wgt_data_bits_2_3),
		.io_wgt_data_bits_2_4(mvc_0_io_wgt_data_bits_2_4),
		.io_wgt_data_bits_2_5(mvc_0_io_wgt_data_bits_2_5),
		.io_wgt_data_bits_2_6(mvc_0_io_wgt_data_bits_2_6),
		.io_wgt_data_bits_2_7(mvc_0_io_wgt_data_bits_2_7),
		.io_wgt_data_bits_2_8(mvc_0_io_wgt_data_bits_2_8),
		.io_wgt_data_bits_2_9(mvc_0_io_wgt_data_bits_2_9),
		.io_wgt_data_bits_2_10(mvc_0_io_wgt_data_bits_2_10),
		.io_wgt_data_bits_2_11(mvc_0_io_wgt_data_bits_2_11),
		.io_wgt_data_bits_2_12(mvc_0_io_wgt_data_bits_2_12),
		.io_wgt_data_bits_2_13(mvc_0_io_wgt_data_bits_2_13),
		.io_wgt_data_bits_2_14(mvc_0_io_wgt_data_bits_2_14),
		.io_wgt_data_bits_2_15(mvc_0_io_wgt_data_bits_2_15),
		.io_wgt_data_bits_3_0(mvc_0_io_wgt_data_bits_3_0),
		.io_wgt_data_bits_3_1(mvc_0_io_wgt_data_bits_3_1),
		.io_wgt_data_bits_3_2(mvc_0_io_wgt_data_bits_3_2),
		.io_wgt_data_bits_3_3(mvc_0_io_wgt_data_bits_3_3),
		.io_wgt_data_bits_3_4(mvc_0_io_wgt_data_bits_3_4),
		.io_wgt_data_bits_3_5(mvc_0_io_wgt_data_bits_3_5),
		.io_wgt_data_bits_3_6(mvc_0_io_wgt_data_bits_3_6),
		.io_wgt_data_bits_3_7(mvc_0_io_wgt_data_bits_3_7),
		.io_wgt_data_bits_3_8(mvc_0_io_wgt_data_bits_3_8),
		.io_wgt_data_bits_3_9(mvc_0_io_wgt_data_bits_3_9),
		.io_wgt_data_bits_3_10(mvc_0_io_wgt_data_bits_3_10),
		.io_wgt_data_bits_3_11(mvc_0_io_wgt_data_bits_3_11),
		.io_wgt_data_bits_3_12(mvc_0_io_wgt_data_bits_3_12),
		.io_wgt_data_bits_3_13(mvc_0_io_wgt_data_bits_3_13),
		.io_wgt_data_bits_3_14(mvc_0_io_wgt_data_bits_3_14),
		.io_wgt_data_bits_3_15(mvc_0_io_wgt_data_bits_3_15),
		.io_wgt_data_bits_4_0(mvc_0_io_wgt_data_bits_4_0),
		.io_wgt_data_bits_4_1(mvc_0_io_wgt_data_bits_4_1),
		.io_wgt_data_bits_4_2(mvc_0_io_wgt_data_bits_4_2),
		.io_wgt_data_bits_4_3(mvc_0_io_wgt_data_bits_4_3),
		.io_wgt_data_bits_4_4(mvc_0_io_wgt_data_bits_4_4),
		.io_wgt_data_bits_4_5(mvc_0_io_wgt_data_bits_4_5),
		.io_wgt_data_bits_4_6(mvc_0_io_wgt_data_bits_4_6),
		.io_wgt_data_bits_4_7(mvc_0_io_wgt_data_bits_4_7),
		.io_wgt_data_bits_4_8(mvc_0_io_wgt_data_bits_4_8),
		.io_wgt_data_bits_4_9(mvc_0_io_wgt_data_bits_4_9),
		.io_wgt_data_bits_4_10(mvc_0_io_wgt_data_bits_4_10),
		.io_wgt_data_bits_4_11(mvc_0_io_wgt_data_bits_4_11),
		.io_wgt_data_bits_4_12(mvc_0_io_wgt_data_bits_4_12),
		.io_wgt_data_bits_4_13(mvc_0_io_wgt_data_bits_4_13),
		.io_wgt_data_bits_4_14(mvc_0_io_wgt_data_bits_4_14),
		.io_wgt_data_bits_4_15(mvc_0_io_wgt_data_bits_4_15),
		.io_wgt_data_bits_5_0(mvc_0_io_wgt_data_bits_5_0),
		.io_wgt_data_bits_5_1(mvc_0_io_wgt_data_bits_5_1),
		.io_wgt_data_bits_5_2(mvc_0_io_wgt_data_bits_5_2),
		.io_wgt_data_bits_5_3(mvc_0_io_wgt_data_bits_5_3),
		.io_wgt_data_bits_5_4(mvc_0_io_wgt_data_bits_5_4),
		.io_wgt_data_bits_5_5(mvc_0_io_wgt_data_bits_5_5),
		.io_wgt_data_bits_5_6(mvc_0_io_wgt_data_bits_5_6),
		.io_wgt_data_bits_5_7(mvc_0_io_wgt_data_bits_5_7),
		.io_wgt_data_bits_5_8(mvc_0_io_wgt_data_bits_5_8),
		.io_wgt_data_bits_5_9(mvc_0_io_wgt_data_bits_5_9),
		.io_wgt_data_bits_5_10(mvc_0_io_wgt_data_bits_5_10),
		.io_wgt_data_bits_5_11(mvc_0_io_wgt_data_bits_5_11),
		.io_wgt_data_bits_5_12(mvc_0_io_wgt_data_bits_5_12),
		.io_wgt_data_bits_5_13(mvc_0_io_wgt_data_bits_5_13),
		.io_wgt_data_bits_5_14(mvc_0_io_wgt_data_bits_5_14),
		.io_wgt_data_bits_5_15(mvc_0_io_wgt_data_bits_5_15),
		.io_wgt_data_bits_6_0(mvc_0_io_wgt_data_bits_6_0),
		.io_wgt_data_bits_6_1(mvc_0_io_wgt_data_bits_6_1),
		.io_wgt_data_bits_6_2(mvc_0_io_wgt_data_bits_6_2),
		.io_wgt_data_bits_6_3(mvc_0_io_wgt_data_bits_6_3),
		.io_wgt_data_bits_6_4(mvc_0_io_wgt_data_bits_6_4),
		.io_wgt_data_bits_6_5(mvc_0_io_wgt_data_bits_6_5),
		.io_wgt_data_bits_6_6(mvc_0_io_wgt_data_bits_6_6),
		.io_wgt_data_bits_6_7(mvc_0_io_wgt_data_bits_6_7),
		.io_wgt_data_bits_6_8(mvc_0_io_wgt_data_bits_6_8),
		.io_wgt_data_bits_6_9(mvc_0_io_wgt_data_bits_6_9),
		.io_wgt_data_bits_6_10(mvc_0_io_wgt_data_bits_6_10),
		.io_wgt_data_bits_6_11(mvc_0_io_wgt_data_bits_6_11),
		.io_wgt_data_bits_6_12(mvc_0_io_wgt_data_bits_6_12),
		.io_wgt_data_bits_6_13(mvc_0_io_wgt_data_bits_6_13),
		.io_wgt_data_bits_6_14(mvc_0_io_wgt_data_bits_6_14),
		.io_wgt_data_bits_6_15(mvc_0_io_wgt_data_bits_6_15),
		.io_wgt_data_bits_7_0(mvc_0_io_wgt_data_bits_7_0),
		.io_wgt_data_bits_7_1(mvc_0_io_wgt_data_bits_7_1),
		.io_wgt_data_bits_7_2(mvc_0_io_wgt_data_bits_7_2),
		.io_wgt_data_bits_7_3(mvc_0_io_wgt_data_bits_7_3),
		.io_wgt_data_bits_7_4(mvc_0_io_wgt_data_bits_7_4),
		.io_wgt_data_bits_7_5(mvc_0_io_wgt_data_bits_7_5),
		.io_wgt_data_bits_7_6(mvc_0_io_wgt_data_bits_7_6),
		.io_wgt_data_bits_7_7(mvc_0_io_wgt_data_bits_7_7),
		.io_wgt_data_bits_7_8(mvc_0_io_wgt_data_bits_7_8),
		.io_wgt_data_bits_7_9(mvc_0_io_wgt_data_bits_7_9),
		.io_wgt_data_bits_7_10(mvc_0_io_wgt_data_bits_7_10),
		.io_wgt_data_bits_7_11(mvc_0_io_wgt_data_bits_7_11),
		.io_wgt_data_bits_7_12(mvc_0_io_wgt_data_bits_7_12),
		.io_wgt_data_bits_7_13(mvc_0_io_wgt_data_bits_7_13),
		.io_wgt_data_bits_7_14(mvc_0_io_wgt_data_bits_7_14),
		.io_wgt_data_bits_7_15(mvc_0_io_wgt_data_bits_7_15),
		.io_wgt_data_bits_8_0(mvc_0_io_wgt_data_bits_8_0),
		.io_wgt_data_bits_8_1(mvc_0_io_wgt_data_bits_8_1),
		.io_wgt_data_bits_8_2(mvc_0_io_wgt_data_bits_8_2),
		.io_wgt_data_bits_8_3(mvc_0_io_wgt_data_bits_8_3),
		.io_wgt_data_bits_8_4(mvc_0_io_wgt_data_bits_8_4),
		.io_wgt_data_bits_8_5(mvc_0_io_wgt_data_bits_8_5),
		.io_wgt_data_bits_8_6(mvc_0_io_wgt_data_bits_8_6),
		.io_wgt_data_bits_8_7(mvc_0_io_wgt_data_bits_8_7),
		.io_wgt_data_bits_8_8(mvc_0_io_wgt_data_bits_8_8),
		.io_wgt_data_bits_8_9(mvc_0_io_wgt_data_bits_8_9),
		.io_wgt_data_bits_8_10(mvc_0_io_wgt_data_bits_8_10),
		.io_wgt_data_bits_8_11(mvc_0_io_wgt_data_bits_8_11),
		.io_wgt_data_bits_8_12(mvc_0_io_wgt_data_bits_8_12),
		.io_wgt_data_bits_8_13(mvc_0_io_wgt_data_bits_8_13),
		.io_wgt_data_bits_8_14(mvc_0_io_wgt_data_bits_8_14),
		.io_wgt_data_bits_8_15(mvc_0_io_wgt_data_bits_8_15),
		.io_wgt_data_bits_9_0(mvc_0_io_wgt_data_bits_9_0),
		.io_wgt_data_bits_9_1(mvc_0_io_wgt_data_bits_9_1),
		.io_wgt_data_bits_9_2(mvc_0_io_wgt_data_bits_9_2),
		.io_wgt_data_bits_9_3(mvc_0_io_wgt_data_bits_9_3),
		.io_wgt_data_bits_9_4(mvc_0_io_wgt_data_bits_9_4),
		.io_wgt_data_bits_9_5(mvc_0_io_wgt_data_bits_9_5),
		.io_wgt_data_bits_9_6(mvc_0_io_wgt_data_bits_9_6),
		.io_wgt_data_bits_9_7(mvc_0_io_wgt_data_bits_9_7),
		.io_wgt_data_bits_9_8(mvc_0_io_wgt_data_bits_9_8),
		.io_wgt_data_bits_9_9(mvc_0_io_wgt_data_bits_9_9),
		.io_wgt_data_bits_9_10(mvc_0_io_wgt_data_bits_9_10),
		.io_wgt_data_bits_9_11(mvc_0_io_wgt_data_bits_9_11),
		.io_wgt_data_bits_9_12(mvc_0_io_wgt_data_bits_9_12),
		.io_wgt_data_bits_9_13(mvc_0_io_wgt_data_bits_9_13),
		.io_wgt_data_bits_9_14(mvc_0_io_wgt_data_bits_9_14),
		.io_wgt_data_bits_9_15(mvc_0_io_wgt_data_bits_9_15),
		.io_wgt_data_bits_10_0(mvc_0_io_wgt_data_bits_10_0),
		.io_wgt_data_bits_10_1(mvc_0_io_wgt_data_bits_10_1),
		.io_wgt_data_bits_10_2(mvc_0_io_wgt_data_bits_10_2),
		.io_wgt_data_bits_10_3(mvc_0_io_wgt_data_bits_10_3),
		.io_wgt_data_bits_10_4(mvc_0_io_wgt_data_bits_10_4),
		.io_wgt_data_bits_10_5(mvc_0_io_wgt_data_bits_10_5),
		.io_wgt_data_bits_10_6(mvc_0_io_wgt_data_bits_10_6),
		.io_wgt_data_bits_10_7(mvc_0_io_wgt_data_bits_10_7),
		.io_wgt_data_bits_10_8(mvc_0_io_wgt_data_bits_10_8),
		.io_wgt_data_bits_10_9(mvc_0_io_wgt_data_bits_10_9),
		.io_wgt_data_bits_10_10(mvc_0_io_wgt_data_bits_10_10),
		.io_wgt_data_bits_10_11(mvc_0_io_wgt_data_bits_10_11),
		.io_wgt_data_bits_10_12(mvc_0_io_wgt_data_bits_10_12),
		.io_wgt_data_bits_10_13(mvc_0_io_wgt_data_bits_10_13),
		.io_wgt_data_bits_10_14(mvc_0_io_wgt_data_bits_10_14),
		.io_wgt_data_bits_10_15(mvc_0_io_wgt_data_bits_10_15),
		.io_wgt_data_bits_11_0(mvc_0_io_wgt_data_bits_11_0),
		.io_wgt_data_bits_11_1(mvc_0_io_wgt_data_bits_11_1),
		.io_wgt_data_bits_11_2(mvc_0_io_wgt_data_bits_11_2),
		.io_wgt_data_bits_11_3(mvc_0_io_wgt_data_bits_11_3),
		.io_wgt_data_bits_11_4(mvc_0_io_wgt_data_bits_11_4),
		.io_wgt_data_bits_11_5(mvc_0_io_wgt_data_bits_11_5),
		.io_wgt_data_bits_11_6(mvc_0_io_wgt_data_bits_11_6),
		.io_wgt_data_bits_11_7(mvc_0_io_wgt_data_bits_11_7),
		.io_wgt_data_bits_11_8(mvc_0_io_wgt_data_bits_11_8),
		.io_wgt_data_bits_11_9(mvc_0_io_wgt_data_bits_11_9),
		.io_wgt_data_bits_11_10(mvc_0_io_wgt_data_bits_11_10),
		.io_wgt_data_bits_11_11(mvc_0_io_wgt_data_bits_11_11),
		.io_wgt_data_bits_11_12(mvc_0_io_wgt_data_bits_11_12),
		.io_wgt_data_bits_11_13(mvc_0_io_wgt_data_bits_11_13),
		.io_wgt_data_bits_11_14(mvc_0_io_wgt_data_bits_11_14),
		.io_wgt_data_bits_11_15(mvc_0_io_wgt_data_bits_11_15),
		.io_wgt_data_bits_12_0(mvc_0_io_wgt_data_bits_12_0),
		.io_wgt_data_bits_12_1(mvc_0_io_wgt_data_bits_12_1),
		.io_wgt_data_bits_12_2(mvc_0_io_wgt_data_bits_12_2),
		.io_wgt_data_bits_12_3(mvc_0_io_wgt_data_bits_12_3),
		.io_wgt_data_bits_12_4(mvc_0_io_wgt_data_bits_12_4),
		.io_wgt_data_bits_12_5(mvc_0_io_wgt_data_bits_12_5),
		.io_wgt_data_bits_12_6(mvc_0_io_wgt_data_bits_12_6),
		.io_wgt_data_bits_12_7(mvc_0_io_wgt_data_bits_12_7),
		.io_wgt_data_bits_12_8(mvc_0_io_wgt_data_bits_12_8),
		.io_wgt_data_bits_12_9(mvc_0_io_wgt_data_bits_12_9),
		.io_wgt_data_bits_12_10(mvc_0_io_wgt_data_bits_12_10),
		.io_wgt_data_bits_12_11(mvc_0_io_wgt_data_bits_12_11),
		.io_wgt_data_bits_12_12(mvc_0_io_wgt_data_bits_12_12),
		.io_wgt_data_bits_12_13(mvc_0_io_wgt_data_bits_12_13),
		.io_wgt_data_bits_12_14(mvc_0_io_wgt_data_bits_12_14),
		.io_wgt_data_bits_12_15(mvc_0_io_wgt_data_bits_12_15),
		.io_wgt_data_bits_13_0(mvc_0_io_wgt_data_bits_13_0),
		.io_wgt_data_bits_13_1(mvc_0_io_wgt_data_bits_13_1),
		.io_wgt_data_bits_13_2(mvc_0_io_wgt_data_bits_13_2),
		.io_wgt_data_bits_13_3(mvc_0_io_wgt_data_bits_13_3),
		.io_wgt_data_bits_13_4(mvc_0_io_wgt_data_bits_13_4),
		.io_wgt_data_bits_13_5(mvc_0_io_wgt_data_bits_13_5),
		.io_wgt_data_bits_13_6(mvc_0_io_wgt_data_bits_13_6),
		.io_wgt_data_bits_13_7(mvc_0_io_wgt_data_bits_13_7),
		.io_wgt_data_bits_13_8(mvc_0_io_wgt_data_bits_13_8),
		.io_wgt_data_bits_13_9(mvc_0_io_wgt_data_bits_13_9),
		.io_wgt_data_bits_13_10(mvc_0_io_wgt_data_bits_13_10),
		.io_wgt_data_bits_13_11(mvc_0_io_wgt_data_bits_13_11),
		.io_wgt_data_bits_13_12(mvc_0_io_wgt_data_bits_13_12),
		.io_wgt_data_bits_13_13(mvc_0_io_wgt_data_bits_13_13),
		.io_wgt_data_bits_13_14(mvc_0_io_wgt_data_bits_13_14),
		.io_wgt_data_bits_13_15(mvc_0_io_wgt_data_bits_13_15),
		.io_wgt_data_bits_14_0(mvc_0_io_wgt_data_bits_14_0),
		.io_wgt_data_bits_14_1(mvc_0_io_wgt_data_bits_14_1),
		.io_wgt_data_bits_14_2(mvc_0_io_wgt_data_bits_14_2),
		.io_wgt_data_bits_14_3(mvc_0_io_wgt_data_bits_14_3),
		.io_wgt_data_bits_14_4(mvc_0_io_wgt_data_bits_14_4),
		.io_wgt_data_bits_14_5(mvc_0_io_wgt_data_bits_14_5),
		.io_wgt_data_bits_14_6(mvc_0_io_wgt_data_bits_14_6),
		.io_wgt_data_bits_14_7(mvc_0_io_wgt_data_bits_14_7),
		.io_wgt_data_bits_14_8(mvc_0_io_wgt_data_bits_14_8),
		.io_wgt_data_bits_14_9(mvc_0_io_wgt_data_bits_14_9),
		.io_wgt_data_bits_14_10(mvc_0_io_wgt_data_bits_14_10),
		.io_wgt_data_bits_14_11(mvc_0_io_wgt_data_bits_14_11),
		.io_wgt_data_bits_14_12(mvc_0_io_wgt_data_bits_14_12),
		.io_wgt_data_bits_14_13(mvc_0_io_wgt_data_bits_14_13),
		.io_wgt_data_bits_14_14(mvc_0_io_wgt_data_bits_14_14),
		.io_wgt_data_bits_14_15(mvc_0_io_wgt_data_bits_14_15),
		.io_wgt_data_bits_15_0(mvc_0_io_wgt_data_bits_15_0),
		.io_wgt_data_bits_15_1(mvc_0_io_wgt_data_bits_15_1),
		.io_wgt_data_bits_15_2(mvc_0_io_wgt_data_bits_15_2),
		.io_wgt_data_bits_15_3(mvc_0_io_wgt_data_bits_15_3),
		.io_wgt_data_bits_15_4(mvc_0_io_wgt_data_bits_15_4),
		.io_wgt_data_bits_15_5(mvc_0_io_wgt_data_bits_15_5),
		.io_wgt_data_bits_15_6(mvc_0_io_wgt_data_bits_15_6),
		.io_wgt_data_bits_15_7(mvc_0_io_wgt_data_bits_15_7),
		.io_wgt_data_bits_15_8(mvc_0_io_wgt_data_bits_15_8),
		.io_wgt_data_bits_15_9(mvc_0_io_wgt_data_bits_15_9),
		.io_wgt_data_bits_15_10(mvc_0_io_wgt_data_bits_15_10),
		.io_wgt_data_bits_15_11(mvc_0_io_wgt_data_bits_15_11),
		.io_wgt_data_bits_15_12(mvc_0_io_wgt_data_bits_15_12),
		.io_wgt_data_bits_15_13(mvc_0_io_wgt_data_bits_15_13),
		.io_wgt_data_bits_15_14(mvc_0_io_wgt_data_bits_15_14),
		.io_wgt_data_bits_15_15(mvc_0_io_wgt_data_bits_15_15),
		.io_acc_i_data_valid(mvc_0_io_acc_i_data_valid),
		.io_acc_i_data_bits_0_0(mvc_0_io_acc_i_data_bits_0_0),
		.io_acc_i_data_bits_0_1(mvc_0_io_acc_i_data_bits_0_1),
		.io_acc_i_data_bits_0_2(mvc_0_io_acc_i_data_bits_0_2),
		.io_acc_i_data_bits_0_3(mvc_0_io_acc_i_data_bits_0_3),
		.io_acc_i_data_bits_0_4(mvc_0_io_acc_i_data_bits_0_4),
		.io_acc_i_data_bits_0_5(mvc_0_io_acc_i_data_bits_0_5),
		.io_acc_i_data_bits_0_6(mvc_0_io_acc_i_data_bits_0_6),
		.io_acc_i_data_bits_0_7(mvc_0_io_acc_i_data_bits_0_7),
		.io_acc_i_data_bits_0_8(mvc_0_io_acc_i_data_bits_0_8),
		.io_acc_i_data_bits_0_9(mvc_0_io_acc_i_data_bits_0_9),
		.io_acc_i_data_bits_0_10(mvc_0_io_acc_i_data_bits_0_10),
		.io_acc_i_data_bits_0_11(mvc_0_io_acc_i_data_bits_0_11),
		.io_acc_i_data_bits_0_12(mvc_0_io_acc_i_data_bits_0_12),
		.io_acc_i_data_bits_0_13(mvc_0_io_acc_i_data_bits_0_13),
		.io_acc_i_data_bits_0_14(mvc_0_io_acc_i_data_bits_0_14),
		.io_acc_i_data_bits_0_15(mvc_0_io_acc_i_data_bits_0_15),
		.io_acc_o_data_valid(mvc_0_io_acc_o_data_valid),
		.io_acc_o_data_bits_0_0(mvc_0_io_acc_o_data_bits_0_0),
		.io_acc_o_data_bits_0_1(mvc_0_io_acc_o_data_bits_0_1),
		.io_acc_o_data_bits_0_2(mvc_0_io_acc_o_data_bits_0_2),
		.io_acc_o_data_bits_0_3(mvc_0_io_acc_o_data_bits_0_3),
		.io_acc_o_data_bits_0_4(mvc_0_io_acc_o_data_bits_0_4),
		.io_acc_o_data_bits_0_5(mvc_0_io_acc_o_data_bits_0_5),
		.io_acc_o_data_bits_0_6(mvc_0_io_acc_o_data_bits_0_6),
		.io_acc_o_data_bits_0_7(mvc_0_io_acc_o_data_bits_0_7),
		.io_acc_o_data_bits_0_8(mvc_0_io_acc_o_data_bits_0_8),
		.io_acc_o_data_bits_0_9(mvc_0_io_acc_o_data_bits_0_9),
		.io_acc_o_data_bits_0_10(mvc_0_io_acc_o_data_bits_0_10),
		.io_acc_o_data_bits_0_11(mvc_0_io_acc_o_data_bits_0_11),
		.io_acc_o_data_bits_0_12(mvc_0_io_acc_o_data_bits_0_12),
		.io_acc_o_data_bits_0_13(mvc_0_io_acc_o_data_bits_0_13),
		.io_acc_o_data_bits_0_14(mvc_0_io_acc_o_data_bits_0_14),
		.io_acc_o_data_bits_0_15(mvc_0_io_acc_o_data_bits_0_15),
		.io_out_data_valid(mvc_0_io_out_data_valid),
		.io_out_data_bits_0_0(mvc_0_io_out_data_bits_0_0),
		.io_out_data_bits_0_1(mvc_0_io_out_data_bits_0_1),
		.io_out_data_bits_0_2(mvc_0_io_out_data_bits_0_2),
		.io_out_data_bits_0_3(mvc_0_io_out_data_bits_0_3),
		.io_out_data_bits_0_4(mvc_0_io_out_data_bits_0_4),
		.io_out_data_bits_0_5(mvc_0_io_out_data_bits_0_5),
		.io_out_data_bits_0_6(mvc_0_io_out_data_bits_0_6),
		.io_out_data_bits_0_7(mvc_0_io_out_data_bits_0_7),
		.io_out_data_bits_0_8(mvc_0_io_out_data_bits_0_8),
		.io_out_data_bits_0_9(mvc_0_io_out_data_bits_0_9),
		.io_out_data_bits_0_10(mvc_0_io_out_data_bits_0_10),
		.io_out_data_bits_0_11(mvc_0_io_out_data_bits_0_11),
		.io_out_data_bits_0_12(mvc_0_io_out_data_bits_0_12),
		.io_out_data_bits_0_13(mvc_0_io_out_data_bits_0_13),
		.io_out_data_bits_0_14(mvc_0_io_out_data_bits_0_14),
		.io_out_data_bits_0_15(mvc_0_io_out_data_bits_0_15),
		.io_bypass_cond(mvc_0_io_bypass_cond)
	);
	Pipe_1 wrpipe2(
		.clk(wrpipe2_clock),
		.rst(wrpipe2_reset),
		.io_enq_valid(wrpipe2_io_enq_valid),
		.io_enq_bits(wrpipe2_io_enq_bits),
		.io_deq_valid(wrpipe2_io_deq_valid),
		.io_deq_bits(wrpipe2_io_deq_bits)
	);
	assign io_done = ((state == 2'h0) & io_start ? 1'h0 : _GEN_7);
	assign io_uop_idx_valid = m_io_valid;
	assign io_uop_idx_bits = m_io_uop_idx;
	assign io_inp_rd_0_idx_valid = delayed_valid;
	assign io_inp_rd_0_idx_bits = io_uop_data_bits_u1 + delayed_inp_i;
	assign io_wgt_rd_0_idx_valid = delayed_valid;
	assign io_wgt_rd_0_idx_bits = io_uop_data_bits_u2 + delayed_wgt_i;
	assign io_acc_rd_0_idx_valid = io_acc_rd_0_idx_valid_REG;
	assign io_acc_rd_0_idx_bits = io_acc_rd_0_idx_bits_REG;
	assign io_acc_wr_0_valid = wrpipe_0_io_deq_valid;
	assign io_acc_wr_0_bits_idx = wrpipe_0_io_deq_bits;
	assign io_acc_wr_0_bits_data_0_0 = mvc_0_io_acc_o_data_bits_0_0;
	assign io_acc_wr_0_bits_data_0_1 = mvc_0_io_acc_o_data_bits_0_1;
	assign io_acc_wr_0_bits_data_0_2 = mvc_0_io_acc_o_data_bits_0_2;
	assign io_acc_wr_0_bits_data_0_3 = mvc_0_io_acc_o_data_bits_0_3;
	assign io_acc_wr_0_bits_data_0_4 = mvc_0_io_acc_o_data_bits_0_4;
	assign io_acc_wr_0_bits_data_0_5 = mvc_0_io_acc_o_data_bits_0_5;
	assign io_acc_wr_0_bits_data_0_6 = mvc_0_io_acc_o_data_bits_0_6;
	assign io_acc_wr_0_bits_data_0_7 = mvc_0_io_acc_o_data_bits_0_7;
	assign io_acc_wr_0_bits_data_0_8 = mvc_0_io_acc_o_data_bits_0_8;
	assign io_acc_wr_0_bits_data_0_9 = mvc_0_io_acc_o_data_bits_0_9;
	assign io_acc_wr_0_bits_data_0_10 = mvc_0_io_acc_o_data_bits_0_10;
	assign io_acc_wr_0_bits_data_0_11 = mvc_0_io_acc_o_data_bits_0_11;
	assign io_acc_wr_0_bits_data_0_12 = mvc_0_io_acc_o_data_bits_0_12;
	assign io_acc_wr_0_bits_data_0_13 = mvc_0_io_acc_o_data_bits_0_13;
	assign io_acc_wr_0_bits_data_0_14 = mvc_0_io_acc_o_data_bits_0_14;
	assign io_acc_wr_0_bits_data_0_15 = mvc_0_io_acc_o_data_bits_0_15;
	assign io_out_wr_0_valid = wrpipeNs_io_deq_valid & mvc_0_io_out_data_valid;
	assign io_out_wr_0_bits_idx = wrpipeNs_io_deq_bits;
	assign io_out_wr_0_bits_data_0_0 = mvc_0_io_out_data_bits_0_0;
	assign io_out_wr_0_bits_data_0_1 = mvc_0_io_out_data_bits_0_1;
	assign io_out_wr_0_bits_data_0_2 = mvc_0_io_out_data_bits_0_2;
	assign io_out_wr_0_bits_data_0_3 = mvc_0_io_out_data_bits_0_3;
	assign io_out_wr_0_bits_data_0_4 = mvc_0_io_out_data_bits_0_4;
	assign io_out_wr_0_bits_data_0_5 = mvc_0_io_out_data_bits_0_5;
	assign io_out_wr_0_bits_data_0_6 = mvc_0_io_out_data_bits_0_6;
	assign io_out_wr_0_bits_data_0_7 = mvc_0_io_out_data_bits_0_7;
	assign io_out_wr_0_bits_data_0_8 = mvc_0_io_out_data_bits_0_8;
	assign io_out_wr_0_bits_data_0_9 = mvc_0_io_out_data_bits_0_9;
	assign io_out_wr_0_bits_data_0_10 = mvc_0_io_out_data_bits_0_10;
	assign io_out_wr_0_bits_data_0_11 = mvc_0_io_out_data_bits_0_11;
	assign io_out_wr_0_bits_data_0_12 = mvc_0_io_out_data_bits_0_12;
	assign io_out_wr_0_bits_data_0_13 = mvc_0_io_out_data_bits_0_13;
	assign io_out_wr_0_bits_data_0_14 = mvc_0_io_out_data_bits_0_14;
	assign io_out_wr_0_bits_data_0_15 = mvc_0_io_out_data_bits_0_15;
	assign m_clock = clk;
	assign m_reset = rst;
	assign m_io_start = io_start;
	assign m_io_dec_wgt_1 = io_dec_wgt_1;
	assign m_io_dec_wgt_0 = io_dec_wgt_0;
	assign m_io_dec_inp_1 = io_dec_inp_1;
	assign m_io_dec_inp_0 = io_dec_inp_0;
	assign m_io_dec_acc_1 = io_dec_acc_1;
	assign m_io_dec_acc_0 = io_dec_acc_0;
	assign m_io_dec_lp_1 = io_dec_lp_1;
	assign m_io_dec_lp_0 = io_dec_lp_0;
	assign m_io_dec_uop_end = io_dec_uop_end;
	assign m_io_dec_uop_begin = io_dec_uop_begin;
	assign reset_pipe_clock = clk;
	assign reset_pipe_reset = rst;
	assign reset_pipe_io_enq_valid = m_io_valid;
	assign reset_pipe_io_enq_bits = capture_dec_reset;
	assign acc_idx_pipe_clock = clk;
	assign acc_idx_pipe_reset = rst;
	assign acc_idx_pipe_io_enq_valid = delayed_valid;
	assign acc_idx_pipe_io_enq_bits = io_uop_data_bits_u0 + delayed_acc_i;
	assign wrpipe0_clock = clk;
	assign wrpipe0_reset = rst;
	assign wrpipe0_io_enq_valid = delayed_valid;
	assign wrpipe0_io_enq_bits = io_uop_data_bits_u0 + delayed_acc_i;
	assign wrpipeNs_clock = clk;
	assign wrpipeNs_reset = rst;
	assign wrpipeNs_io_enq_valid = wrpipe0_io_deq_valid;
	assign wrpipeNs_io_enq_bits = wrpipe0_io_deq_bits;
	assign wrpipe_0_clock = clk;
	assign wrpipe_0_reset = rst;
	assign wrpipe_0_io_enq_valid = wrpipe0_io_deq_valid;
	assign wrpipe_0_io_enq_bits = wrpipe0_io_deq_bits;
	assign mvc_0_clock = clk;
	assign mvc_0_io_valid_reset = mvc_0_io_valid_reset_REG;
	assign mvc_0_io_inp_data_bits_0_0 = io_inp_rd_0_data_bits_0_0;
	assign mvc_0_io_inp_data_bits_0_1 = io_inp_rd_0_data_bits_0_1;
	assign mvc_0_io_inp_data_bits_0_2 = io_inp_rd_0_data_bits_0_2;
	assign mvc_0_io_inp_data_bits_0_3 = io_inp_rd_0_data_bits_0_3;
	assign mvc_0_io_inp_data_bits_0_4 = io_inp_rd_0_data_bits_0_4;
	assign mvc_0_io_inp_data_bits_0_5 = io_inp_rd_0_data_bits_0_5;
	assign mvc_0_io_inp_data_bits_0_6 = io_inp_rd_0_data_bits_0_6;
	assign mvc_0_io_inp_data_bits_0_7 = io_inp_rd_0_data_bits_0_7;
	assign mvc_0_io_inp_data_bits_0_8 = io_inp_rd_0_data_bits_0_8;
	assign mvc_0_io_inp_data_bits_0_9 = io_inp_rd_0_data_bits_0_9;
	assign mvc_0_io_inp_data_bits_0_10 = io_inp_rd_0_data_bits_0_10;
	assign mvc_0_io_inp_data_bits_0_11 = io_inp_rd_0_data_bits_0_11;
	assign mvc_0_io_inp_data_bits_0_12 = io_inp_rd_0_data_bits_0_12;
	assign mvc_0_io_inp_data_bits_0_13 = io_inp_rd_0_data_bits_0_13;
	assign mvc_0_io_inp_data_bits_0_14 = io_inp_rd_0_data_bits_0_14;
	assign mvc_0_io_inp_data_bits_0_15 = io_inp_rd_0_data_bits_0_15;
	assign mvc_0_io_wgt_data_bits_0_0 = io_wgt_rd_0_data_bits_0_0;
	assign mvc_0_io_wgt_data_bits_0_1 = io_wgt_rd_0_data_bits_0_1;
	assign mvc_0_io_wgt_data_bits_0_2 = io_wgt_rd_0_data_bits_0_2;
	assign mvc_0_io_wgt_data_bits_0_3 = io_wgt_rd_0_data_bits_0_3;
	assign mvc_0_io_wgt_data_bits_0_4 = io_wgt_rd_0_data_bits_0_4;
	assign mvc_0_io_wgt_data_bits_0_5 = io_wgt_rd_0_data_bits_0_5;
	assign mvc_0_io_wgt_data_bits_0_6 = io_wgt_rd_0_data_bits_0_6;
	assign mvc_0_io_wgt_data_bits_0_7 = io_wgt_rd_0_data_bits_0_7;
	assign mvc_0_io_wgt_data_bits_0_8 = io_wgt_rd_0_data_bits_0_8;
	assign mvc_0_io_wgt_data_bits_0_9 = io_wgt_rd_0_data_bits_0_9;
	assign mvc_0_io_wgt_data_bits_0_10 = io_wgt_rd_0_data_bits_0_10;
	assign mvc_0_io_wgt_data_bits_0_11 = io_wgt_rd_0_data_bits_0_11;
	assign mvc_0_io_wgt_data_bits_0_12 = io_wgt_rd_0_data_bits_0_12;
	assign mvc_0_io_wgt_data_bits_0_13 = io_wgt_rd_0_data_bits_0_13;
	assign mvc_0_io_wgt_data_bits_0_14 = io_wgt_rd_0_data_bits_0_14;
	assign mvc_0_io_wgt_data_bits_0_15 = io_wgt_rd_0_data_bits_0_15;
	assign mvc_0_io_wgt_data_bits_1_0 = io_wgt_rd_0_data_bits_1_0;
	assign mvc_0_io_wgt_data_bits_1_1 = io_wgt_rd_0_data_bits_1_1;
	assign mvc_0_io_wgt_data_bits_1_2 = io_wgt_rd_0_data_bits_1_2;
	assign mvc_0_io_wgt_data_bits_1_3 = io_wgt_rd_0_data_bits_1_3;
	assign mvc_0_io_wgt_data_bits_1_4 = io_wgt_rd_0_data_bits_1_4;
	assign mvc_0_io_wgt_data_bits_1_5 = io_wgt_rd_0_data_bits_1_5;
	assign mvc_0_io_wgt_data_bits_1_6 = io_wgt_rd_0_data_bits_1_6;
	assign mvc_0_io_wgt_data_bits_1_7 = io_wgt_rd_0_data_bits_1_7;
	assign mvc_0_io_wgt_data_bits_1_8 = io_wgt_rd_0_data_bits_1_8;
	assign mvc_0_io_wgt_data_bits_1_9 = io_wgt_rd_0_data_bits_1_9;
	assign mvc_0_io_wgt_data_bits_1_10 = io_wgt_rd_0_data_bits_1_10;
	assign mvc_0_io_wgt_data_bits_1_11 = io_wgt_rd_0_data_bits_1_11;
	assign mvc_0_io_wgt_data_bits_1_12 = io_wgt_rd_0_data_bits_1_12;
	assign mvc_0_io_wgt_data_bits_1_13 = io_wgt_rd_0_data_bits_1_13;
	assign mvc_0_io_wgt_data_bits_1_14 = io_wgt_rd_0_data_bits_1_14;
	assign mvc_0_io_wgt_data_bits_1_15 = io_wgt_rd_0_data_bits_1_15;
	assign mvc_0_io_wgt_data_bits_2_0 = io_wgt_rd_0_data_bits_2_0;
	assign mvc_0_io_wgt_data_bits_2_1 = io_wgt_rd_0_data_bits_2_1;
	assign mvc_0_io_wgt_data_bits_2_2 = io_wgt_rd_0_data_bits_2_2;
	assign mvc_0_io_wgt_data_bits_2_3 = io_wgt_rd_0_data_bits_2_3;
	assign mvc_0_io_wgt_data_bits_2_4 = io_wgt_rd_0_data_bits_2_4;
	assign mvc_0_io_wgt_data_bits_2_5 = io_wgt_rd_0_data_bits_2_5;
	assign mvc_0_io_wgt_data_bits_2_6 = io_wgt_rd_0_data_bits_2_6;
	assign mvc_0_io_wgt_data_bits_2_7 = io_wgt_rd_0_data_bits_2_7;
	assign mvc_0_io_wgt_data_bits_2_8 = io_wgt_rd_0_data_bits_2_8;
	assign mvc_0_io_wgt_data_bits_2_9 = io_wgt_rd_0_data_bits_2_9;
	assign mvc_0_io_wgt_data_bits_2_10 = io_wgt_rd_0_data_bits_2_10;
	assign mvc_0_io_wgt_data_bits_2_11 = io_wgt_rd_0_data_bits_2_11;
	assign mvc_0_io_wgt_data_bits_2_12 = io_wgt_rd_0_data_bits_2_12;
	assign mvc_0_io_wgt_data_bits_2_13 = io_wgt_rd_0_data_bits_2_13;
	assign mvc_0_io_wgt_data_bits_2_14 = io_wgt_rd_0_data_bits_2_14;
	assign mvc_0_io_wgt_data_bits_2_15 = io_wgt_rd_0_data_bits_2_15;
	assign mvc_0_io_wgt_data_bits_3_0 = io_wgt_rd_0_data_bits_3_0;
	assign mvc_0_io_wgt_data_bits_3_1 = io_wgt_rd_0_data_bits_3_1;
	assign mvc_0_io_wgt_data_bits_3_2 = io_wgt_rd_0_data_bits_3_2;
	assign mvc_0_io_wgt_data_bits_3_3 = io_wgt_rd_0_data_bits_3_3;
	assign mvc_0_io_wgt_data_bits_3_4 = io_wgt_rd_0_data_bits_3_4;
	assign mvc_0_io_wgt_data_bits_3_5 = io_wgt_rd_0_data_bits_3_5;
	assign mvc_0_io_wgt_data_bits_3_6 = io_wgt_rd_0_data_bits_3_6;
	assign mvc_0_io_wgt_data_bits_3_7 = io_wgt_rd_0_data_bits_3_7;
	assign mvc_0_io_wgt_data_bits_3_8 = io_wgt_rd_0_data_bits_3_8;
	assign mvc_0_io_wgt_data_bits_3_9 = io_wgt_rd_0_data_bits_3_9;
	assign mvc_0_io_wgt_data_bits_3_10 = io_wgt_rd_0_data_bits_3_10;
	assign mvc_0_io_wgt_data_bits_3_11 = io_wgt_rd_0_data_bits_3_11;
	assign mvc_0_io_wgt_data_bits_3_12 = io_wgt_rd_0_data_bits_3_12;
	assign mvc_0_io_wgt_data_bits_3_13 = io_wgt_rd_0_data_bits_3_13;
	assign mvc_0_io_wgt_data_bits_3_14 = io_wgt_rd_0_data_bits_3_14;
	assign mvc_0_io_wgt_data_bits_3_15 = io_wgt_rd_0_data_bits_3_15;
	assign mvc_0_io_wgt_data_bits_4_0 = io_wgt_rd_0_data_bits_4_0;
	assign mvc_0_io_wgt_data_bits_4_1 = io_wgt_rd_0_data_bits_4_1;
	assign mvc_0_io_wgt_data_bits_4_2 = io_wgt_rd_0_data_bits_4_2;
	assign mvc_0_io_wgt_data_bits_4_3 = io_wgt_rd_0_data_bits_4_3;
	assign mvc_0_io_wgt_data_bits_4_4 = io_wgt_rd_0_data_bits_4_4;
	assign mvc_0_io_wgt_data_bits_4_5 = io_wgt_rd_0_data_bits_4_5;
	assign mvc_0_io_wgt_data_bits_4_6 = io_wgt_rd_0_data_bits_4_6;
	assign mvc_0_io_wgt_data_bits_4_7 = io_wgt_rd_0_data_bits_4_7;
	assign mvc_0_io_wgt_data_bits_4_8 = io_wgt_rd_0_data_bits_4_8;
	assign mvc_0_io_wgt_data_bits_4_9 = io_wgt_rd_0_data_bits_4_9;
	assign mvc_0_io_wgt_data_bits_4_10 = io_wgt_rd_0_data_bits_4_10;
	assign mvc_0_io_wgt_data_bits_4_11 = io_wgt_rd_0_data_bits_4_11;
	assign mvc_0_io_wgt_data_bits_4_12 = io_wgt_rd_0_data_bits_4_12;
	assign mvc_0_io_wgt_data_bits_4_13 = io_wgt_rd_0_data_bits_4_13;
	assign mvc_0_io_wgt_data_bits_4_14 = io_wgt_rd_0_data_bits_4_14;
	assign mvc_0_io_wgt_data_bits_4_15 = io_wgt_rd_0_data_bits_4_15;
	assign mvc_0_io_wgt_data_bits_5_0 = io_wgt_rd_0_data_bits_5_0;
	assign mvc_0_io_wgt_data_bits_5_1 = io_wgt_rd_0_data_bits_5_1;
	assign mvc_0_io_wgt_data_bits_5_2 = io_wgt_rd_0_data_bits_5_2;
	assign mvc_0_io_wgt_data_bits_5_3 = io_wgt_rd_0_data_bits_5_3;
	assign mvc_0_io_wgt_data_bits_5_4 = io_wgt_rd_0_data_bits_5_4;
	assign mvc_0_io_wgt_data_bits_5_5 = io_wgt_rd_0_data_bits_5_5;
	assign mvc_0_io_wgt_data_bits_5_6 = io_wgt_rd_0_data_bits_5_6;
	assign mvc_0_io_wgt_data_bits_5_7 = io_wgt_rd_0_data_bits_5_7;
	assign mvc_0_io_wgt_data_bits_5_8 = io_wgt_rd_0_data_bits_5_8;
	assign mvc_0_io_wgt_data_bits_5_9 = io_wgt_rd_0_data_bits_5_9;
	assign mvc_0_io_wgt_data_bits_5_10 = io_wgt_rd_0_data_bits_5_10;
	assign mvc_0_io_wgt_data_bits_5_11 = io_wgt_rd_0_data_bits_5_11;
	assign mvc_0_io_wgt_data_bits_5_12 = io_wgt_rd_0_data_bits_5_12;
	assign mvc_0_io_wgt_data_bits_5_13 = io_wgt_rd_0_data_bits_5_13;
	assign mvc_0_io_wgt_data_bits_5_14 = io_wgt_rd_0_data_bits_5_14;
	assign mvc_0_io_wgt_data_bits_5_15 = io_wgt_rd_0_data_bits_5_15;
	assign mvc_0_io_wgt_data_bits_6_0 = io_wgt_rd_0_data_bits_6_0;
	assign mvc_0_io_wgt_data_bits_6_1 = io_wgt_rd_0_data_bits_6_1;
	assign mvc_0_io_wgt_data_bits_6_2 = io_wgt_rd_0_data_bits_6_2;
	assign mvc_0_io_wgt_data_bits_6_3 = io_wgt_rd_0_data_bits_6_3;
	assign mvc_0_io_wgt_data_bits_6_4 = io_wgt_rd_0_data_bits_6_4;
	assign mvc_0_io_wgt_data_bits_6_5 = io_wgt_rd_0_data_bits_6_5;
	assign mvc_0_io_wgt_data_bits_6_6 = io_wgt_rd_0_data_bits_6_6;
	assign mvc_0_io_wgt_data_bits_6_7 = io_wgt_rd_0_data_bits_6_7;
	assign mvc_0_io_wgt_data_bits_6_8 = io_wgt_rd_0_data_bits_6_8;
	assign mvc_0_io_wgt_data_bits_6_9 = io_wgt_rd_0_data_bits_6_9;
	assign mvc_0_io_wgt_data_bits_6_10 = io_wgt_rd_0_data_bits_6_10;
	assign mvc_0_io_wgt_data_bits_6_11 = io_wgt_rd_0_data_bits_6_11;
	assign mvc_0_io_wgt_data_bits_6_12 = io_wgt_rd_0_data_bits_6_12;
	assign mvc_0_io_wgt_data_bits_6_13 = io_wgt_rd_0_data_bits_6_13;
	assign mvc_0_io_wgt_data_bits_6_14 = io_wgt_rd_0_data_bits_6_14;
	assign mvc_0_io_wgt_data_bits_6_15 = io_wgt_rd_0_data_bits_6_15;
	assign mvc_0_io_wgt_data_bits_7_0 = io_wgt_rd_0_data_bits_7_0;
	assign mvc_0_io_wgt_data_bits_7_1 = io_wgt_rd_0_data_bits_7_1;
	assign mvc_0_io_wgt_data_bits_7_2 = io_wgt_rd_0_data_bits_7_2;
	assign mvc_0_io_wgt_data_bits_7_3 = io_wgt_rd_0_data_bits_7_3;
	assign mvc_0_io_wgt_data_bits_7_4 = io_wgt_rd_0_data_bits_7_4;
	assign mvc_0_io_wgt_data_bits_7_5 = io_wgt_rd_0_data_bits_7_5;
	assign mvc_0_io_wgt_data_bits_7_6 = io_wgt_rd_0_data_bits_7_6;
	assign mvc_0_io_wgt_data_bits_7_7 = io_wgt_rd_0_data_bits_7_7;
	assign mvc_0_io_wgt_data_bits_7_8 = io_wgt_rd_0_data_bits_7_8;
	assign mvc_0_io_wgt_data_bits_7_9 = io_wgt_rd_0_data_bits_7_9;
	assign mvc_0_io_wgt_data_bits_7_10 = io_wgt_rd_0_data_bits_7_10;
	assign mvc_0_io_wgt_data_bits_7_11 = io_wgt_rd_0_data_bits_7_11;
	assign mvc_0_io_wgt_data_bits_7_12 = io_wgt_rd_0_data_bits_7_12;
	assign mvc_0_io_wgt_data_bits_7_13 = io_wgt_rd_0_data_bits_7_13;
	assign mvc_0_io_wgt_data_bits_7_14 = io_wgt_rd_0_data_bits_7_14;
	assign mvc_0_io_wgt_data_bits_7_15 = io_wgt_rd_0_data_bits_7_15;
	assign mvc_0_io_wgt_data_bits_8_0 = io_wgt_rd_0_data_bits_8_0;
	assign mvc_0_io_wgt_data_bits_8_1 = io_wgt_rd_0_data_bits_8_1;
	assign mvc_0_io_wgt_data_bits_8_2 = io_wgt_rd_0_data_bits_8_2;
	assign mvc_0_io_wgt_data_bits_8_3 = io_wgt_rd_0_data_bits_8_3;
	assign mvc_0_io_wgt_data_bits_8_4 = io_wgt_rd_0_data_bits_8_4;
	assign mvc_0_io_wgt_data_bits_8_5 = io_wgt_rd_0_data_bits_8_5;
	assign mvc_0_io_wgt_data_bits_8_6 = io_wgt_rd_0_data_bits_8_6;
	assign mvc_0_io_wgt_data_bits_8_7 = io_wgt_rd_0_data_bits_8_7;
	assign mvc_0_io_wgt_data_bits_8_8 = io_wgt_rd_0_data_bits_8_8;
	assign mvc_0_io_wgt_data_bits_8_9 = io_wgt_rd_0_data_bits_8_9;
	assign mvc_0_io_wgt_data_bits_8_10 = io_wgt_rd_0_data_bits_8_10;
	assign mvc_0_io_wgt_data_bits_8_11 = io_wgt_rd_0_data_bits_8_11;
	assign mvc_0_io_wgt_data_bits_8_12 = io_wgt_rd_0_data_bits_8_12;
	assign mvc_0_io_wgt_data_bits_8_13 = io_wgt_rd_0_data_bits_8_13;
	assign mvc_0_io_wgt_data_bits_8_14 = io_wgt_rd_0_data_bits_8_14;
	assign mvc_0_io_wgt_data_bits_8_15 = io_wgt_rd_0_data_bits_8_15;
	assign mvc_0_io_wgt_data_bits_9_0 = io_wgt_rd_0_data_bits_9_0;
	assign mvc_0_io_wgt_data_bits_9_1 = io_wgt_rd_0_data_bits_9_1;
	assign mvc_0_io_wgt_data_bits_9_2 = io_wgt_rd_0_data_bits_9_2;
	assign mvc_0_io_wgt_data_bits_9_3 = io_wgt_rd_0_data_bits_9_3;
	assign mvc_0_io_wgt_data_bits_9_4 = io_wgt_rd_0_data_bits_9_4;
	assign mvc_0_io_wgt_data_bits_9_5 = io_wgt_rd_0_data_bits_9_5;
	assign mvc_0_io_wgt_data_bits_9_6 = io_wgt_rd_0_data_bits_9_6;
	assign mvc_0_io_wgt_data_bits_9_7 = io_wgt_rd_0_data_bits_9_7;
	assign mvc_0_io_wgt_data_bits_9_8 = io_wgt_rd_0_data_bits_9_8;
	assign mvc_0_io_wgt_data_bits_9_9 = io_wgt_rd_0_data_bits_9_9;
	assign mvc_0_io_wgt_data_bits_9_10 = io_wgt_rd_0_data_bits_9_10;
	assign mvc_0_io_wgt_data_bits_9_11 = io_wgt_rd_0_data_bits_9_11;
	assign mvc_0_io_wgt_data_bits_9_12 = io_wgt_rd_0_data_bits_9_12;
	assign mvc_0_io_wgt_data_bits_9_13 = io_wgt_rd_0_data_bits_9_13;
	assign mvc_0_io_wgt_data_bits_9_14 = io_wgt_rd_0_data_bits_9_14;
	assign mvc_0_io_wgt_data_bits_9_15 = io_wgt_rd_0_data_bits_9_15;
	assign mvc_0_io_wgt_data_bits_10_0 = io_wgt_rd_0_data_bits_10_0;
	assign mvc_0_io_wgt_data_bits_10_1 = io_wgt_rd_0_data_bits_10_1;
	assign mvc_0_io_wgt_data_bits_10_2 = io_wgt_rd_0_data_bits_10_2;
	assign mvc_0_io_wgt_data_bits_10_3 = io_wgt_rd_0_data_bits_10_3;
	assign mvc_0_io_wgt_data_bits_10_4 = io_wgt_rd_0_data_bits_10_4;
	assign mvc_0_io_wgt_data_bits_10_5 = io_wgt_rd_0_data_bits_10_5;
	assign mvc_0_io_wgt_data_bits_10_6 = io_wgt_rd_0_data_bits_10_6;
	assign mvc_0_io_wgt_data_bits_10_7 = io_wgt_rd_0_data_bits_10_7;
	assign mvc_0_io_wgt_data_bits_10_8 = io_wgt_rd_0_data_bits_10_8;
	assign mvc_0_io_wgt_data_bits_10_9 = io_wgt_rd_0_data_bits_10_9;
	assign mvc_0_io_wgt_data_bits_10_10 = io_wgt_rd_0_data_bits_10_10;
	assign mvc_0_io_wgt_data_bits_10_11 = io_wgt_rd_0_data_bits_10_11;
	assign mvc_0_io_wgt_data_bits_10_12 = io_wgt_rd_0_data_bits_10_12;
	assign mvc_0_io_wgt_data_bits_10_13 = io_wgt_rd_0_data_bits_10_13;
	assign mvc_0_io_wgt_data_bits_10_14 = io_wgt_rd_0_data_bits_10_14;
	assign mvc_0_io_wgt_data_bits_10_15 = io_wgt_rd_0_data_bits_10_15;
	assign mvc_0_io_wgt_data_bits_11_0 = io_wgt_rd_0_data_bits_11_0;
	assign mvc_0_io_wgt_data_bits_11_1 = io_wgt_rd_0_data_bits_11_1;
	assign mvc_0_io_wgt_data_bits_11_2 = io_wgt_rd_0_data_bits_11_2;
	assign mvc_0_io_wgt_data_bits_11_3 = io_wgt_rd_0_data_bits_11_3;
	assign mvc_0_io_wgt_data_bits_11_4 = io_wgt_rd_0_data_bits_11_4;
	assign mvc_0_io_wgt_data_bits_11_5 = io_wgt_rd_0_data_bits_11_5;
	assign mvc_0_io_wgt_data_bits_11_6 = io_wgt_rd_0_data_bits_11_6;
	assign mvc_0_io_wgt_data_bits_11_7 = io_wgt_rd_0_data_bits_11_7;
	assign mvc_0_io_wgt_data_bits_11_8 = io_wgt_rd_0_data_bits_11_8;
	assign mvc_0_io_wgt_data_bits_11_9 = io_wgt_rd_0_data_bits_11_9;
	assign mvc_0_io_wgt_data_bits_11_10 = io_wgt_rd_0_data_bits_11_10;
	assign mvc_0_io_wgt_data_bits_11_11 = io_wgt_rd_0_data_bits_11_11;
	assign mvc_0_io_wgt_data_bits_11_12 = io_wgt_rd_0_data_bits_11_12;
	assign mvc_0_io_wgt_data_bits_11_13 = io_wgt_rd_0_data_bits_11_13;
	assign mvc_0_io_wgt_data_bits_11_14 = io_wgt_rd_0_data_bits_11_14;
	assign mvc_0_io_wgt_data_bits_11_15 = io_wgt_rd_0_data_bits_11_15;
	assign mvc_0_io_wgt_data_bits_12_0 = io_wgt_rd_0_data_bits_12_0;
	assign mvc_0_io_wgt_data_bits_12_1 = io_wgt_rd_0_data_bits_12_1;
	assign mvc_0_io_wgt_data_bits_12_2 = io_wgt_rd_0_data_bits_12_2;
	assign mvc_0_io_wgt_data_bits_12_3 = io_wgt_rd_0_data_bits_12_3;
	assign mvc_0_io_wgt_data_bits_12_4 = io_wgt_rd_0_data_bits_12_4;
	assign mvc_0_io_wgt_data_bits_12_5 = io_wgt_rd_0_data_bits_12_5;
	assign mvc_0_io_wgt_data_bits_12_6 = io_wgt_rd_0_data_bits_12_6;
	assign mvc_0_io_wgt_data_bits_12_7 = io_wgt_rd_0_data_bits_12_7;
	assign mvc_0_io_wgt_data_bits_12_8 = io_wgt_rd_0_data_bits_12_8;
	assign mvc_0_io_wgt_data_bits_12_9 = io_wgt_rd_0_data_bits_12_9;
	assign mvc_0_io_wgt_data_bits_12_10 = io_wgt_rd_0_data_bits_12_10;
	assign mvc_0_io_wgt_data_bits_12_11 = io_wgt_rd_0_data_bits_12_11;
	assign mvc_0_io_wgt_data_bits_12_12 = io_wgt_rd_0_data_bits_12_12;
	assign mvc_0_io_wgt_data_bits_12_13 = io_wgt_rd_0_data_bits_12_13;
	assign mvc_0_io_wgt_data_bits_12_14 = io_wgt_rd_0_data_bits_12_14;
	assign mvc_0_io_wgt_data_bits_12_15 = io_wgt_rd_0_data_bits_12_15;
	assign mvc_0_io_wgt_data_bits_13_0 = io_wgt_rd_0_data_bits_13_0;
	assign mvc_0_io_wgt_data_bits_13_1 = io_wgt_rd_0_data_bits_13_1;
	assign mvc_0_io_wgt_data_bits_13_2 = io_wgt_rd_0_data_bits_13_2;
	assign mvc_0_io_wgt_data_bits_13_3 = io_wgt_rd_0_data_bits_13_3;
	assign mvc_0_io_wgt_data_bits_13_4 = io_wgt_rd_0_data_bits_13_4;
	assign mvc_0_io_wgt_data_bits_13_5 = io_wgt_rd_0_data_bits_13_5;
	assign mvc_0_io_wgt_data_bits_13_6 = io_wgt_rd_0_data_bits_13_6;
	assign mvc_0_io_wgt_data_bits_13_7 = io_wgt_rd_0_data_bits_13_7;
	assign mvc_0_io_wgt_data_bits_13_8 = io_wgt_rd_0_data_bits_13_8;
	assign mvc_0_io_wgt_data_bits_13_9 = io_wgt_rd_0_data_bits_13_9;
	assign mvc_0_io_wgt_data_bits_13_10 = io_wgt_rd_0_data_bits_13_10;
	assign mvc_0_io_wgt_data_bits_13_11 = io_wgt_rd_0_data_bits_13_11;
	assign mvc_0_io_wgt_data_bits_13_12 = io_wgt_rd_0_data_bits_13_12;
	assign mvc_0_io_wgt_data_bits_13_13 = io_wgt_rd_0_data_bits_13_13;
	assign mvc_0_io_wgt_data_bits_13_14 = io_wgt_rd_0_data_bits_13_14;
	assign mvc_0_io_wgt_data_bits_13_15 = io_wgt_rd_0_data_bits_13_15;
	assign mvc_0_io_wgt_data_bits_14_0 = io_wgt_rd_0_data_bits_14_0;
	assign mvc_0_io_wgt_data_bits_14_1 = io_wgt_rd_0_data_bits_14_1;
	assign mvc_0_io_wgt_data_bits_14_2 = io_wgt_rd_0_data_bits_14_2;
	assign mvc_0_io_wgt_data_bits_14_3 = io_wgt_rd_0_data_bits_14_3;
	assign mvc_0_io_wgt_data_bits_14_4 = io_wgt_rd_0_data_bits_14_4;
	assign mvc_0_io_wgt_data_bits_14_5 = io_wgt_rd_0_data_bits_14_5;
	assign mvc_0_io_wgt_data_bits_14_6 = io_wgt_rd_0_data_bits_14_6;
	assign mvc_0_io_wgt_data_bits_14_7 = io_wgt_rd_0_data_bits_14_7;
	assign mvc_0_io_wgt_data_bits_14_8 = io_wgt_rd_0_data_bits_14_8;
	assign mvc_0_io_wgt_data_bits_14_9 = io_wgt_rd_0_data_bits_14_9;
	assign mvc_0_io_wgt_data_bits_14_10 = io_wgt_rd_0_data_bits_14_10;
	assign mvc_0_io_wgt_data_bits_14_11 = io_wgt_rd_0_data_bits_14_11;
	assign mvc_0_io_wgt_data_bits_14_12 = io_wgt_rd_0_data_bits_14_12;
	assign mvc_0_io_wgt_data_bits_14_13 = io_wgt_rd_0_data_bits_14_13;
	assign mvc_0_io_wgt_data_bits_14_14 = io_wgt_rd_0_data_bits_14_14;
	assign mvc_0_io_wgt_data_bits_14_15 = io_wgt_rd_0_data_bits_14_15;
	assign mvc_0_io_wgt_data_bits_15_0 = io_wgt_rd_0_data_bits_15_0;
	assign mvc_0_io_wgt_data_bits_15_1 = io_wgt_rd_0_data_bits_15_1;
	assign mvc_0_io_wgt_data_bits_15_2 = io_wgt_rd_0_data_bits_15_2;
	assign mvc_0_io_wgt_data_bits_15_3 = io_wgt_rd_0_data_bits_15_3;
	assign mvc_0_io_wgt_data_bits_15_4 = io_wgt_rd_0_data_bits_15_4;
	assign mvc_0_io_wgt_data_bits_15_5 = io_wgt_rd_0_data_bits_15_5;
	assign mvc_0_io_wgt_data_bits_15_6 = io_wgt_rd_0_data_bits_15_6;
	assign mvc_0_io_wgt_data_bits_15_7 = io_wgt_rd_0_data_bits_15_7;
	assign mvc_0_io_wgt_data_bits_15_8 = io_wgt_rd_0_data_bits_15_8;
	assign mvc_0_io_wgt_data_bits_15_9 = io_wgt_rd_0_data_bits_15_9;
	assign mvc_0_io_wgt_data_bits_15_10 = io_wgt_rd_0_data_bits_15_10;
	assign mvc_0_io_wgt_data_bits_15_11 = io_wgt_rd_0_data_bits_15_11;
	assign mvc_0_io_wgt_data_bits_15_12 = io_wgt_rd_0_data_bits_15_12;
	assign mvc_0_io_wgt_data_bits_15_13 = io_wgt_rd_0_data_bits_15_13;
	assign mvc_0_io_wgt_data_bits_15_14 = io_wgt_rd_0_data_bits_15_14;
	assign mvc_0_io_wgt_data_bits_15_15 = io_wgt_rd_0_data_bits_15_15;
	assign mvc_0_io_acc_i_data_valid = io_acc_rd_0_data_valid;
	assign mvc_0_io_acc_i_data_bits_0_0 = io_acc_rd_0_data_bits_0_0;
	assign mvc_0_io_acc_i_data_bits_0_1 = io_acc_rd_0_data_bits_0_1;
	assign mvc_0_io_acc_i_data_bits_0_2 = io_acc_rd_0_data_bits_0_2;
	assign mvc_0_io_acc_i_data_bits_0_3 = io_acc_rd_0_data_bits_0_3;
	assign mvc_0_io_acc_i_data_bits_0_4 = io_acc_rd_0_data_bits_0_4;
	assign mvc_0_io_acc_i_data_bits_0_5 = io_acc_rd_0_data_bits_0_5;
	assign mvc_0_io_acc_i_data_bits_0_6 = io_acc_rd_0_data_bits_0_6;
	assign mvc_0_io_acc_i_data_bits_0_7 = io_acc_rd_0_data_bits_0_7;
	assign mvc_0_io_acc_i_data_bits_0_8 = io_acc_rd_0_data_bits_0_8;
	assign mvc_0_io_acc_i_data_bits_0_9 = io_acc_rd_0_data_bits_0_9;
	assign mvc_0_io_acc_i_data_bits_0_10 = io_acc_rd_0_data_bits_0_10;
	assign mvc_0_io_acc_i_data_bits_0_11 = io_acc_rd_0_data_bits_0_11;
	assign mvc_0_io_acc_i_data_bits_0_12 = io_acc_rd_0_data_bits_0_12;
	assign mvc_0_io_acc_i_data_bits_0_13 = io_acc_rd_0_data_bits_0_13;
	assign mvc_0_io_acc_i_data_bits_0_14 = io_acc_rd_0_data_bits_0_14;
	assign mvc_0_io_acc_i_data_bits_0_15 = io_acc_rd_0_data_bits_0_15;
	assign mvc_0_io_bypass_cond = ((wrpipe_0_io_deq_bits == wrpipe2_io_deq_bits) & wrpipe_0_io_deq_valid) & wrpipe2_io_deq_valid;
	assign wrpipe2_clock = clk;
	assign wrpipe2_reset = rst;
	assign wrpipe2_io_enq_valid = wrpipe_0_io_deq_valid;
	assign wrpipe2_io_enq_bits = wrpipe_0_io_deq_bits;
	always @(posedge clk) begin
		if (rst)
			delayed_valid <= 1'h0;
		else
			delayed_valid <= _GEN_0;
		delayed_acc_i <= m_io_acc_i;
		delayed_inp_i <= m_io_inp_i;
		delayed_wgt_i <= m_io_wgt_i;
		if (rst)
			state <= 2'h0;
		else if ((state == 2'h0) & io_start)
			state <= 2'h1;
		else if ((state == 2'h1) & m_io_last)
			state <= 2'h2;
		else if ((state == 2'h2) & (inflight == 4'h0))
			state <= 2'h0;
		if (rst)
			inflight <= 4'h0;
		else if (_T)
			inflight <= 4'h0;
		else if (!(m_io_valid & wrpipeNs_io_deq_valid)) begin
			if (m_io_valid)
				inflight <= _inflight_T_1;
			else
				inflight <= _GEN_27;
		end
		if ((state == 2'h0) & io_start)
			capture_dec_wgt_1 <= io_dec_wgt_1;
		if ((state == 2'h0) & io_start)
			capture_dec_wgt_0 <= io_dec_wgt_0;
		if ((state == 2'h0) & io_start)
			capture_dec_inp_1 <= io_dec_inp_1;
		if ((state == 2'h0) & io_start)
			capture_dec_inp_0 <= io_dec_inp_0;
		if ((state == 2'h0) & io_start)
			capture_dec_acc_1 <= io_dec_acc_1;
		if ((state == 2'h0) & io_start)
			capture_dec_acc_0 <= io_dec_acc_0;
		if ((state == 2'h0) & io_start)
			capture_dec_empty_0 <= io_dec_empty_0;
		if ((state == 2'h0) & io_start)
			capture_dec_lp_1 <= io_dec_lp_1;
		if ((state == 2'h0) & io_start)
			capture_dec_lp_0 <= io_dec_lp_0;
		if ((state == 2'h0) & io_start)
			capture_dec_uop_end <= io_dec_uop_end;
		if ((state == 2'h0) & io_start)
			capture_dec_uop_begin <= io_dec_uop_begin;
		if ((state == 2'h0) & io_start)
			capture_dec_reset <= io_dec_reset;
		if ((state == 2'h0) & io_start)
			capture_dec_push_next <= io_dec_push_next;
		if ((state == 2'h0) & io_start)
			capture_dec_push_prev <= io_dec_push_prev;
		if ((state == 2'h0) & io_start)
			capture_dec_pop_next <= io_dec_pop_next;
		if ((state == 2'h0) & io_start)
			capture_dec_pop_prev <= io_dec_pop_prev;
		if ((state == 2'h0) & io_start)
			capture_dec_op <= io_dec_op;
		if (rst)
			delayed_uop_valid <= 1'h0;
		else
			delayed_uop_valid <= delayed_valid;
		if (rst)
			io_acc_rd_0_idx_valid_REG <= 1'h0;
		else
			io_acc_rd_0_idx_valid_REG <= acc_idx_pipe_io_deq_valid;
		io_acc_rd_0_idx_bits_REG <= acc_idx_pipe_io_deq_bits;
		if (rst)
			mvc_0_io_valid_reset_REG <= 1'h0;
		else
			mvc_0_io_valid_reset_REG <= reset_pipe_io_deq_bits & reset_pipe_io_deq_valid;
		if (~rst & ~((state != 2'h1) | (_T_8 == _T_9)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:585 assert(state =/= sRun  || capture_dec.asUInt === io.dec.asUInt)\n");
		if (_T_13 & ~((state != 2'h2) | _T_10))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:586 assert(state =/= sWait || capture_dec.asUInt === io.dec.asUInt)\n");
		if (_T_13 & ~(io_uop_data_valid == delayed_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:596 assert(delayedUopData.valid === delayed_valid)\n");
		if (_T_13 & ~(io_inp_rd_0_data_valid == delayed_uop_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:621 assert(io.inp.rd(0).data.valid === delayed_uop_valid)\n");
		if (_T_13 & ~(io_wgt_rd_0_data_valid == delayed_uop_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:630 assert(io.wgt.rd(idx).data.valid === ShiftRegister(delayed_uop_valid, scratchpadReadLatency))\n");
		if (_T_13 & ~(io_acc_rd_0_data_valid == wrpipe_0_io_deq_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:651 assert(io.acc.rd(idx).data.valid === wrpipe(idx).io.deq.valid)\n");
		if (((~_T_39 & m_io_valid) & _T_13) & ~(inflight != 4'hf))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:656 assert(inflight =/= ((1<<inflightBits)-1).U)\n");
		if ((((_GEN_31 & ~m_io_valid) & wrpipeNs_io_deq_valid) & _T_13) & ~(inflight != 4'h0))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:659 assert(inflight =/= 0.U)\n");
		if ((_T & _T_13) & ~_T_5)
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:663 assert(inflight === 0.U)\n");
		if (_T_13 & ~(mvc_0_io_acc_o_data_valid == (wrpipe_0_io_deq_valid | mvc_0_io_valid_reset)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorGemm.scala:704 assert(mvc(idx1).io.acc_o.data.valid === (wrpipe(idx1).io.deq.valid | mvc(idx1).io.valid_reset))\n");
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_13)
			;
		if (_T_13)
			;
		if (_T_13)
			;
		if (_T_13)
			;
		if (_T_13)
			;
		if ((~_T_39 & m_io_valid) & _T_13)
			;
		if (((_GEN_31 & ~m_io_valid) & wrpipeNs_io_deq_valid) & _T_13)
			;
		if (_T & _T_13)
			;
		if (_T_13)
			;
	end
endmodule
module TensorAluIndexGenerator (
	clk,
	rst,
	io_start,
	io_last,
	io_dec_alu_use_imm,
	io_dec_src_1,
	io_dec_src_0,
	io_dec_dst_1,
	io_dec_dst_0,
	io_dec_lp_1,
	io_dec_lp_0,
	io_dec_uop_end,
	io_dec_uop_begin,
	io_valid,
	io_src_valid,
	io_dst_idx,
	io_src_idx,
	io_uop_idx
);
	input clk;
	input rst;
	input io_start;
	output wire io_last;
	input io_dec_alu_use_imm;
	input [10:0] io_dec_src_1;
	input [10:0] io_dec_src_0;
	input [10:0] io_dec_dst_1;
	input [10:0] io_dec_dst_0;
	input [13:0] io_dec_lp_1;
	input [13:0] io_dec_lp_0;
	input [13:0] io_dec_uop_end;
	input [12:0] io_dec_uop_begin;
	output wire io_valid;
	output wire io_src_valid;
	output wire [10:0] io_dst_idx;
	output wire [10:0] io_src_idx;
	output wire [10:0] io_uop_idx;
	reg running;
	reg stutter;
	wire advance = io_dec_alu_use_imm | stutter;
	wire _T = ~running;
	wire _T_2 = ~advance;
	wire _GEN_0 = (io_last ? 1'h0 : running);
	wire _GEN_1 = (running & advance ? _GEN_0 : running);
	wire _GEN_2 = (running & advance ? 1'h0 : stutter);
	wire _GEN_3 = (running & ~advance) | _GEN_2;
	wire _GEN_4 = (running & ~advance ? running : _GEN_1);
	wire _GEN_5 = (~running & io_start) | _GEN_4;
	reg [13:0] cnt_i;
	reg [10:0] dst_i;
	reg [10:0] src_i;
	reg [13:0] cnt_o;
	reg [10:0] dst_o;
	reg [10:0] src_o;
	reg [13:0] uop_idx;
	wire [13:0] _T_7 = io_dec_uop_end - 14'h0001;
	wire [13:0] _uop_idx_T_1 = uop_idx + 14'h0001;
	wire [13:0] _T_10 = io_dec_lp_1 - 14'h0001;
	wire [13:0] _cnt_i_T_1 = cnt_i + 14'h0001;
	wire [10:0] _dst_i_T_1 = dst_i + io_dec_dst_1;
	wire [10:0] _src_i_T_1 = src_i + io_dec_src_1;
	wire [13:0] _T_13 = io_dec_lp_0 - 14'h0001;
	wire [10:0] dst_tmp = dst_o + io_dec_dst_0;
	wire [10:0] src_tmp = src_o + io_dec_src_0;
	wire [13:0] _cnt_o_T_1 = cnt_o + 14'h0001;
	wire [13:0] _GEN_7 = (cnt_o != _T_13 ? _cnt_o_T_1 : cnt_o);
	wire [10:0] _GEN_8 = (cnt_o != _T_13 ? dst_tmp : dst_o);
	wire [10:0] _GEN_9 = (cnt_o != _T_13 ? src_tmp : src_o);
	wire [13:0] _GEN_10 = (cnt_o != _T_13 ? 14'h0000 : cnt_i);
	wire [10:0] _GEN_11 = (cnt_o != _T_13 ? dst_tmp : dst_i);
	wire [10:0] _GEN_12 = (cnt_o != _T_13 ? src_tmp : src_i);
	wire _GEN_13 = (cnt_o != _T_13 ? 1'h0 : 1'h1);
	wire _GEN_20 = (cnt_i != _T_10 ? 1'h0 : _GEN_13);
	wire _GEN_28 = (uop_idx != _T_7 ? 1'h0 : _GEN_20);
	wire _GEN_36 = advance & _GEN_28;
	assign io_last = (_T ? 1'h0 : _GEN_36);
	assign io_valid = running & advance;
	assign io_src_valid = running & _T_2;
	assign io_dst_idx = dst_i;
	assign io_src_idx = src_i;
	assign io_uop_idx = uop_idx[10:0];
	always @(posedge clk) begin
		if (rst)
			running <= 1'h0;
		else
			running <= _GEN_5;
		if (rst)
			stutter <= 1'h0;
		else if (!(~running & io_start))
			stutter <= _GEN_3;
		if (_T)
			cnt_i <= 14'h0000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i != _T_10)
					cnt_i <= _cnt_i_T_1;
				else
					cnt_i <= _GEN_10;
			end
		end
		if (_T)
			dst_i <= 11'h000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i != _T_10)
					dst_i <= _dst_i_T_1;
				else
					dst_i <= _GEN_11;
			end
		end
		if (_T)
			src_i <= 11'h000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i != _T_10)
					src_i <= _src_i_T_1;
				else
					src_i <= _GEN_12;
			end
		end
		if (_T)
			cnt_o <= 14'h0000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i == _T_10)
					cnt_o <= _GEN_7;
			end
		end
		if (_T)
			dst_o <= 11'h000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i == _T_10)
					dst_o <= _GEN_8;
			end
		end
		if (_T)
			src_o <= 11'h000;
		else if (advance) begin
			if (uop_idx == _T_7) begin
				if (cnt_i == _T_10)
					src_o <= _GEN_9;
			end
		end
		if (_T)
			uop_idx <= {1'd0, io_dec_uop_begin};
		else if (advance) begin
			if (uop_idx != _T_7)
				uop_idx <= _uop_idx_T_1;
			else
				uop_idx <= {1'd0, io_dec_uop_begin};
		end
	end
endmodule
module Alu (
	io_opcode,
	io_a,
	io_b,
	io_y
);
	input [2:0] io_opcode;
	input [31:0] io_a;
	input [31:0] io_b;
	output wire [31:0] io_y;
	wire [31:0] ub = io_b;
	wire [4:0] _m_T_1 = ~ub[4:0];
	wire [4:0] m = _m_T_1 + 5'h01;
	wire [31:0] fop_0 = ($signed(io_a) < $signed(io_b) ? $signed(io_a) : $signed(io_b));
	wire [31:0] fop_1 = ($signed(io_a) < $signed(io_b) ? $signed(io_b) : $signed(io_a));
	wire [31:0] fop_2 = $signed(io_a) + $signed(io_b);
	wire [31:0] fop_3 = $signed(io_a) >>> ub[4:0];
	wire [62:0] _GEN_1 = {{31 {io_a[31]}}, io_a};
	wire [62:0] fop_4 = $signed(_GEN_1) << m;
	wire [31:0] _io_y_T_1 = (3'h0 == io_opcode ? $signed(fop_0) : $signed(io_a));
	wire [31:0] _io_y_T_3 = (3'h1 == io_opcode ? $signed(fop_1) : $signed(_io_y_T_1));
	wire [31:0] _io_y_T_5 = (3'h2 == io_opcode ? $signed(fop_2) : $signed(_io_y_T_3));
	wire [31:0] _io_y_T_7 = (3'h3 == io_opcode ? $signed(fop_3) : $signed(_io_y_T_5));
	wire [62:0] _io_y_T_9 = (3'h4 == io_opcode ? $signed(fop_4) : $signed({{31 {_io_y_T_7[31]}}, _io_y_T_7}));
	assign io_y = _io_y_T_9[31:0];
endmodule
module AluReg (
	clk,
	io_opcode,
	io_a_valid,
	io_a_bits,
	io_b_valid,
	io_b_bits,
	io_y_valid,
	io_y_bits
);
	input clk;
	input [2:0] io_opcode;
	input io_a_valid;
	input [31:0] io_a_bits;
	input io_b_valid;
	input [31:0] io_b_bits;
	output wire io_y_valid;
	output wire [31:0] io_y_bits;
	wire [2:0] alu_io_opcode;
	wire [31:0] alu_io_a;
	wire [31:0] alu_io_b;
	wire [31:0] alu_io_y;
	reg [31:0] rA;
	reg [31:0] rB;
	reg valid;
	Alu alu(
		.io_opcode(alu_io_opcode),
		.io_a(alu_io_a),
		.io_b(alu_io_b),
		.io_y(alu_io_y)
	);
	assign io_y_valid = valid;
	assign io_y_bits = alu_io_y;
	assign alu_io_opcode = io_opcode;
	assign alu_io_a = rA;
	assign alu_io_b = rB;
	always @(posedge clk) begin
		if (io_a_valid)
			rA <= io_a_bits;
		if (io_b_valid)
			rB <= io_b_bits;
		valid <= io_b_valid;
	end
endmodule
module AluVector (
	clk,
	io_opcode,
	io_acc_a_data_valid,
	io_acc_a_data_bits_0_0,
	io_acc_a_data_bits_0_1,
	io_acc_a_data_bits_0_2,
	io_acc_a_data_bits_0_3,
	io_acc_a_data_bits_0_4,
	io_acc_a_data_bits_0_5,
	io_acc_a_data_bits_0_6,
	io_acc_a_data_bits_0_7,
	io_acc_a_data_bits_0_8,
	io_acc_a_data_bits_0_9,
	io_acc_a_data_bits_0_10,
	io_acc_a_data_bits_0_11,
	io_acc_a_data_bits_0_12,
	io_acc_a_data_bits_0_13,
	io_acc_a_data_bits_0_14,
	io_acc_a_data_bits_0_15,
	io_acc_b_data_valid,
	io_acc_b_data_bits_0_0,
	io_acc_b_data_bits_0_1,
	io_acc_b_data_bits_0_2,
	io_acc_b_data_bits_0_3,
	io_acc_b_data_bits_0_4,
	io_acc_b_data_bits_0_5,
	io_acc_b_data_bits_0_6,
	io_acc_b_data_bits_0_7,
	io_acc_b_data_bits_0_8,
	io_acc_b_data_bits_0_9,
	io_acc_b_data_bits_0_10,
	io_acc_b_data_bits_0_11,
	io_acc_b_data_bits_0_12,
	io_acc_b_data_bits_0_13,
	io_acc_b_data_bits_0_14,
	io_acc_b_data_bits_0_15,
	io_acc_y_data_valid,
	io_acc_y_data_bits_0_0,
	io_acc_y_data_bits_0_1,
	io_acc_y_data_bits_0_2,
	io_acc_y_data_bits_0_3,
	io_acc_y_data_bits_0_4,
	io_acc_y_data_bits_0_5,
	io_acc_y_data_bits_0_6,
	io_acc_y_data_bits_0_7,
	io_acc_y_data_bits_0_8,
	io_acc_y_data_bits_0_9,
	io_acc_y_data_bits_0_10,
	io_acc_y_data_bits_0_11,
	io_acc_y_data_bits_0_12,
	io_acc_y_data_bits_0_13,
	io_acc_y_data_bits_0_14,
	io_acc_y_data_bits_0_15,
	io_out_data_valid,
	io_out_data_bits_0_0,
	io_out_data_bits_0_1,
	io_out_data_bits_0_2,
	io_out_data_bits_0_3,
	io_out_data_bits_0_4,
	io_out_data_bits_0_5,
	io_out_data_bits_0_6,
	io_out_data_bits_0_7,
	io_out_data_bits_0_8,
	io_out_data_bits_0_9,
	io_out_data_bits_0_10,
	io_out_data_bits_0_11,
	io_out_data_bits_0_12,
	io_out_data_bits_0_13,
	io_out_data_bits_0_14,
	io_out_data_bits_0_15
);
	input clk;
	input [2:0] io_opcode;
	input io_acc_a_data_valid;
	input [31:0] io_acc_a_data_bits_0_0;
	input [31:0] io_acc_a_data_bits_0_1;
	input [31:0] io_acc_a_data_bits_0_2;
	input [31:0] io_acc_a_data_bits_0_3;
	input [31:0] io_acc_a_data_bits_0_4;
	input [31:0] io_acc_a_data_bits_0_5;
	input [31:0] io_acc_a_data_bits_0_6;
	input [31:0] io_acc_a_data_bits_0_7;
	input [31:0] io_acc_a_data_bits_0_8;
	input [31:0] io_acc_a_data_bits_0_9;
	input [31:0] io_acc_a_data_bits_0_10;
	input [31:0] io_acc_a_data_bits_0_11;
	input [31:0] io_acc_a_data_bits_0_12;
	input [31:0] io_acc_a_data_bits_0_13;
	input [31:0] io_acc_a_data_bits_0_14;
	input [31:0] io_acc_a_data_bits_0_15;
	input io_acc_b_data_valid;
	input [31:0] io_acc_b_data_bits_0_0;
	input [31:0] io_acc_b_data_bits_0_1;
	input [31:0] io_acc_b_data_bits_0_2;
	input [31:0] io_acc_b_data_bits_0_3;
	input [31:0] io_acc_b_data_bits_0_4;
	input [31:0] io_acc_b_data_bits_0_5;
	input [31:0] io_acc_b_data_bits_0_6;
	input [31:0] io_acc_b_data_bits_0_7;
	input [31:0] io_acc_b_data_bits_0_8;
	input [31:0] io_acc_b_data_bits_0_9;
	input [31:0] io_acc_b_data_bits_0_10;
	input [31:0] io_acc_b_data_bits_0_11;
	input [31:0] io_acc_b_data_bits_0_12;
	input [31:0] io_acc_b_data_bits_0_13;
	input [31:0] io_acc_b_data_bits_0_14;
	input [31:0] io_acc_b_data_bits_0_15;
	output wire io_acc_y_data_valid;
	output wire [31:0] io_acc_y_data_bits_0_0;
	output wire [31:0] io_acc_y_data_bits_0_1;
	output wire [31:0] io_acc_y_data_bits_0_2;
	output wire [31:0] io_acc_y_data_bits_0_3;
	output wire [31:0] io_acc_y_data_bits_0_4;
	output wire [31:0] io_acc_y_data_bits_0_5;
	output wire [31:0] io_acc_y_data_bits_0_6;
	output wire [31:0] io_acc_y_data_bits_0_7;
	output wire [31:0] io_acc_y_data_bits_0_8;
	output wire [31:0] io_acc_y_data_bits_0_9;
	output wire [31:0] io_acc_y_data_bits_0_10;
	output wire [31:0] io_acc_y_data_bits_0_11;
	output wire [31:0] io_acc_y_data_bits_0_12;
	output wire [31:0] io_acc_y_data_bits_0_13;
	output wire [31:0] io_acc_y_data_bits_0_14;
	output wire [31:0] io_acc_y_data_bits_0_15;
	output wire io_out_data_valid;
	output wire [7:0] io_out_data_bits_0_0;
	output wire [7:0] io_out_data_bits_0_1;
	output wire [7:0] io_out_data_bits_0_2;
	output wire [7:0] io_out_data_bits_0_3;
	output wire [7:0] io_out_data_bits_0_4;
	output wire [7:0] io_out_data_bits_0_5;
	output wire [7:0] io_out_data_bits_0_6;
	output wire [7:0] io_out_data_bits_0_7;
	output wire [7:0] io_out_data_bits_0_8;
	output wire [7:0] io_out_data_bits_0_9;
	output wire [7:0] io_out_data_bits_0_10;
	output wire [7:0] io_out_data_bits_0_11;
	output wire [7:0] io_out_data_bits_0_12;
	output wire [7:0] io_out_data_bits_0_13;
	output wire [7:0] io_out_data_bits_0_14;
	output wire [7:0] io_out_data_bits_0_15;
	wire f_0_clock;
	wire [2:0] f_0_io_opcode;
	wire f_0_io_a_valid;
	wire [31:0] f_0_io_a_bits;
	wire f_0_io_b_valid;
	wire [31:0] f_0_io_b_bits;
	wire f_0_io_y_valid;
	wire [31:0] f_0_io_y_bits;
	wire f_1_clock;
	wire [2:0] f_1_io_opcode;
	wire f_1_io_a_valid;
	wire [31:0] f_1_io_a_bits;
	wire f_1_io_b_valid;
	wire [31:0] f_1_io_b_bits;
	wire f_1_io_y_valid;
	wire [31:0] f_1_io_y_bits;
	wire f_2_clock;
	wire [2:0] f_2_io_opcode;
	wire f_2_io_a_valid;
	wire [31:0] f_2_io_a_bits;
	wire f_2_io_b_valid;
	wire [31:0] f_2_io_b_bits;
	wire f_2_io_y_valid;
	wire [31:0] f_2_io_y_bits;
	wire f_3_clock;
	wire [2:0] f_3_io_opcode;
	wire f_3_io_a_valid;
	wire [31:0] f_3_io_a_bits;
	wire f_3_io_b_valid;
	wire [31:0] f_3_io_b_bits;
	wire f_3_io_y_valid;
	wire [31:0] f_3_io_y_bits;
	wire f_4_clock;
	wire [2:0] f_4_io_opcode;
	wire f_4_io_a_valid;
	wire [31:0] f_4_io_a_bits;
	wire f_4_io_b_valid;
	wire [31:0] f_4_io_b_bits;
	wire f_4_io_y_valid;
	wire [31:0] f_4_io_y_bits;
	wire f_5_clock;
	wire [2:0] f_5_io_opcode;
	wire f_5_io_a_valid;
	wire [31:0] f_5_io_a_bits;
	wire f_5_io_b_valid;
	wire [31:0] f_5_io_b_bits;
	wire f_5_io_y_valid;
	wire [31:0] f_5_io_y_bits;
	wire f_6_clock;
	wire [2:0] f_6_io_opcode;
	wire f_6_io_a_valid;
	wire [31:0] f_6_io_a_bits;
	wire f_6_io_b_valid;
	wire [31:0] f_6_io_b_bits;
	wire f_6_io_y_valid;
	wire [31:0] f_6_io_y_bits;
	wire f_7_clock;
	wire [2:0] f_7_io_opcode;
	wire f_7_io_a_valid;
	wire [31:0] f_7_io_a_bits;
	wire f_7_io_b_valid;
	wire [31:0] f_7_io_b_bits;
	wire f_7_io_y_valid;
	wire [31:0] f_7_io_y_bits;
	wire f_8_clock;
	wire [2:0] f_8_io_opcode;
	wire f_8_io_a_valid;
	wire [31:0] f_8_io_a_bits;
	wire f_8_io_b_valid;
	wire [31:0] f_8_io_b_bits;
	wire f_8_io_y_valid;
	wire [31:0] f_8_io_y_bits;
	wire f_9_clock;
	wire [2:0] f_9_io_opcode;
	wire f_9_io_a_valid;
	wire [31:0] f_9_io_a_bits;
	wire f_9_io_b_valid;
	wire [31:0] f_9_io_b_bits;
	wire f_9_io_y_valid;
	wire [31:0] f_9_io_y_bits;
	wire f_10_clock;
	wire [2:0] f_10_io_opcode;
	wire f_10_io_a_valid;
	wire [31:0] f_10_io_a_bits;
	wire f_10_io_b_valid;
	wire [31:0] f_10_io_b_bits;
	wire f_10_io_y_valid;
	wire [31:0] f_10_io_y_bits;
	wire f_11_clock;
	wire [2:0] f_11_io_opcode;
	wire f_11_io_a_valid;
	wire [31:0] f_11_io_a_bits;
	wire f_11_io_b_valid;
	wire [31:0] f_11_io_b_bits;
	wire f_11_io_y_valid;
	wire [31:0] f_11_io_y_bits;
	wire f_12_clock;
	wire [2:0] f_12_io_opcode;
	wire f_12_io_a_valid;
	wire [31:0] f_12_io_a_bits;
	wire f_12_io_b_valid;
	wire [31:0] f_12_io_b_bits;
	wire f_12_io_y_valid;
	wire [31:0] f_12_io_y_bits;
	wire f_13_clock;
	wire [2:0] f_13_io_opcode;
	wire f_13_io_a_valid;
	wire [31:0] f_13_io_a_bits;
	wire f_13_io_b_valid;
	wire [31:0] f_13_io_b_bits;
	wire f_13_io_y_valid;
	wire [31:0] f_13_io_y_bits;
	wire f_14_clock;
	wire [2:0] f_14_io_opcode;
	wire f_14_io_a_valid;
	wire [31:0] f_14_io_a_bits;
	wire f_14_io_b_valid;
	wire [31:0] f_14_io_b_bits;
	wire f_14_io_y_valid;
	wire [31:0] f_14_io_y_bits;
	wire f_15_clock;
	wire [2:0] f_15_io_opcode;
	wire f_15_io_a_valid;
	wire [31:0] f_15_io_a_bits;
	wire f_15_io_b_valid;
	wire [31:0] f_15_io_b_bits;
	wire f_15_io_y_valid;
	wire [31:0] f_15_io_y_bits;
	wire valid_1 = f_1_io_y_valid;
	wire valid_0 = f_0_io_y_valid;
	wire valid_3 = f_3_io_y_valid;
	wire valid_2 = f_2_io_y_valid;
	wire valid_5 = f_5_io_y_valid;
	wire valid_4 = f_4_io_y_valid;
	wire valid_7 = f_7_io_y_valid;
	wire valid_6 = f_6_io_y_valid;
	wire [7:0] io_acc_y_data_valid_lo = {valid_7, valid_6, valid_5, valid_4, valid_3, valid_2, valid_1, valid_0};
	wire valid_9 = f_9_io_y_valid;
	wire valid_8 = f_8_io_y_valid;
	wire valid_11 = f_11_io_y_valid;
	wire valid_10 = f_10_io_y_valid;
	wire valid_13 = f_13_io_y_valid;
	wire valid_12 = f_12_io_y_valid;
	wire valid_15 = f_15_io_y_valid;
	wire valid_14 = f_14_io_y_valid;
	wire [15:0] _io_acc_y_data_valid_T = {valid_15, valid_14, valid_13, valid_12, valid_11, valid_10, valid_9, valid_8, io_acc_y_data_valid_lo};
	AluReg f_0(
		.clk(f_0_clock),
		.io_opcode(f_0_io_opcode),
		.io_a_valid(f_0_io_a_valid),
		.io_a_bits(f_0_io_a_bits),
		.io_b_valid(f_0_io_b_valid),
		.io_b_bits(f_0_io_b_bits),
		.io_y_valid(f_0_io_y_valid),
		.io_y_bits(f_0_io_y_bits)
	);
	AluReg f_1(
		.clk(f_1_clock),
		.io_opcode(f_1_io_opcode),
		.io_a_valid(f_1_io_a_valid),
		.io_a_bits(f_1_io_a_bits),
		.io_b_valid(f_1_io_b_valid),
		.io_b_bits(f_1_io_b_bits),
		.io_y_valid(f_1_io_y_valid),
		.io_y_bits(f_1_io_y_bits)
	);
	AluReg f_2(
		.clk(f_2_clock),
		.io_opcode(f_2_io_opcode),
		.io_a_valid(f_2_io_a_valid),
		.io_a_bits(f_2_io_a_bits),
		.io_b_valid(f_2_io_b_valid),
		.io_b_bits(f_2_io_b_bits),
		.io_y_valid(f_2_io_y_valid),
		.io_y_bits(f_2_io_y_bits)
	);
	AluReg f_3(
		.clk(f_3_clock),
		.io_opcode(f_3_io_opcode),
		.io_a_valid(f_3_io_a_valid),
		.io_a_bits(f_3_io_a_bits),
		.io_b_valid(f_3_io_b_valid),
		.io_b_bits(f_3_io_b_bits),
		.io_y_valid(f_3_io_y_valid),
		.io_y_bits(f_3_io_y_bits)
	);
	AluReg f_4(
		.clk(f_4_clock),
		.io_opcode(f_4_io_opcode),
		.io_a_valid(f_4_io_a_valid),
		.io_a_bits(f_4_io_a_bits),
		.io_b_valid(f_4_io_b_valid),
		.io_b_bits(f_4_io_b_bits),
		.io_y_valid(f_4_io_y_valid),
		.io_y_bits(f_4_io_y_bits)
	);
	AluReg f_5(
		.clk(f_5_clock),
		.io_opcode(f_5_io_opcode),
		.io_a_valid(f_5_io_a_valid),
		.io_a_bits(f_5_io_a_bits),
		.io_b_valid(f_5_io_b_valid),
		.io_b_bits(f_5_io_b_bits),
		.io_y_valid(f_5_io_y_valid),
		.io_y_bits(f_5_io_y_bits)
	);
	AluReg f_6(
		.clk(f_6_clock),
		.io_opcode(f_6_io_opcode),
		.io_a_valid(f_6_io_a_valid),
		.io_a_bits(f_6_io_a_bits),
		.io_b_valid(f_6_io_b_valid),
		.io_b_bits(f_6_io_b_bits),
		.io_y_valid(f_6_io_y_valid),
		.io_y_bits(f_6_io_y_bits)
	);
	AluReg f_7(
		.clk(f_7_clock),
		.io_opcode(f_7_io_opcode),
		.io_a_valid(f_7_io_a_valid),
		.io_a_bits(f_7_io_a_bits),
		.io_b_valid(f_7_io_b_valid),
		.io_b_bits(f_7_io_b_bits),
		.io_y_valid(f_7_io_y_valid),
		.io_y_bits(f_7_io_y_bits)
	);
	AluReg f_8(
		.clk(f_8_clock),
		.io_opcode(f_8_io_opcode),
		.io_a_valid(f_8_io_a_valid),
		.io_a_bits(f_8_io_a_bits),
		.io_b_valid(f_8_io_b_valid),
		.io_b_bits(f_8_io_b_bits),
		.io_y_valid(f_8_io_y_valid),
		.io_y_bits(f_8_io_y_bits)
	);
	AluReg f_9(
		.clk(f_9_clock),
		.io_opcode(f_9_io_opcode),
		.io_a_valid(f_9_io_a_valid),
		.io_a_bits(f_9_io_a_bits),
		.io_b_valid(f_9_io_b_valid),
		.io_b_bits(f_9_io_b_bits),
		.io_y_valid(f_9_io_y_valid),
		.io_y_bits(f_9_io_y_bits)
	);
	AluReg f_10(
		.clk(f_10_clock),
		.io_opcode(f_10_io_opcode),
		.io_a_valid(f_10_io_a_valid),
		.io_a_bits(f_10_io_a_bits),
		.io_b_valid(f_10_io_b_valid),
		.io_b_bits(f_10_io_b_bits),
		.io_y_valid(f_10_io_y_valid),
		.io_y_bits(f_10_io_y_bits)
	);
	AluReg f_11(
		.clk(f_11_clock),
		.io_opcode(f_11_io_opcode),
		.io_a_valid(f_11_io_a_valid),
		.io_a_bits(f_11_io_a_bits),
		.io_b_valid(f_11_io_b_valid),
		.io_b_bits(f_11_io_b_bits),
		.io_y_valid(f_11_io_y_valid),
		.io_y_bits(f_11_io_y_bits)
	);
	AluReg f_12(
		.clk(f_12_clock),
		.io_opcode(f_12_io_opcode),
		.io_a_valid(f_12_io_a_valid),
		.io_a_bits(f_12_io_a_bits),
		.io_b_valid(f_12_io_b_valid),
		.io_b_bits(f_12_io_b_bits),
		.io_y_valid(f_12_io_y_valid),
		.io_y_bits(f_12_io_y_bits)
	);
	AluReg f_13(
		.clk(f_13_clock),
		.io_opcode(f_13_io_opcode),
		.io_a_valid(f_13_io_a_valid),
		.io_a_bits(f_13_io_a_bits),
		.io_b_valid(f_13_io_b_valid),
		.io_b_bits(f_13_io_b_bits),
		.io_y_valid(f_13_io_y_valid),
		.io_y_bits(f_13_io_y_bits)
	);
	AluReg f_14(
		.clk(f_14_clock),
		.io_opcode(f_14_io_opcode),
		.io_a_valid(f_14_io_a_valid),
		.io_a_bits(f_14_io_a_bits),
		.io_b_valid(f_14_io_b_valid),
		.io_b_bits(f_14_io_b_bits),
		.io_y_valid(f_14_io_y_valid),
		.io_y_bits(f_14_io_y_bits)
	);
	AluReg f_15(
		.clk(f_15_clock),
		.io_opcode(f_15_io_opcode),
		.io_a_valid(f_15_io_a_valid),
		.io_a_bits(f_15_io_a_bits),
		.io_b_valid(f_15_io_b_valid),
		.io_b_bits(f_15_io_b_bits),
		.io_y_valid(f_15_io_y_valid),
		.io_y_bits(f_15_io_y_bits)
	);
	assign io_acc_y_data_valid = &_io_acc_y_data_valid_T;
	assign io_acc_y_data_bits_0_0 = f_0_io_y_bits;
	assign io_acc_y_data_bits_0_1 = f_1_io_y_bits;
	assign io_acc_y_data_bits_0_2 = f_2_io_y_bits;
	assign io_acc_y_data_bits_0_3 = f_3_io_y_bits;
	assign io_acc_y_data_bits_0_4 = f_4_io_y_bits;
	assign io_acc_y_data_bits_0_5 = f_5_io_y_bits;
	assign io_acc_y_data_bits_0_6 = f_6_io_y_bits;
	assign io_acc_y_data_bits_0_7 = f_7_io_y_bits;
	assign io_acc_y_data_bits_0_8 = f_8_io_y_bits;
	assign io_acc_y_data_bits_0_9 = f_9_io_y_bits;
	assign io_acc_y_data_bits_0_10 = f_10_io_y_bits;
	assign io_acc_y_data_bits_0_11 = f_11_io_y_bits;
	assign io_acc_y_data_bits_0_12 = f_12_io_y_bits;
	assign io_acc_y_data_bits_0_13 = f_13_io_y_bits;
	assign io_acc_y_data_bits_0_14 = f_14_io_y_bits;
	assign io_acc_y_data_bits_0_15 = f_15_io_y_bits;
	assign io_out_data_valid = &_io_acc_y_data_valid_T;
	assign io_out_data_bits_0_0 = f_0_io_y_bits[7:0];
	assign io_out_data_bits_0_1 = f_1_io_y_bits[7:0];
	assign io_out_data_bits_0_2 = f_2_io_y_bits[7:0];
	assign io_out_data_bits_0_3 = f_3_io_y_bits[7:0];
	assign io_out_data_bits_0_4 = f_4_io_y_bits[7:0];
	assign io_out_data_bits_0_5 = f_5_io_y_bits[7:0];
	assign io_out_data_bits_0_6 = f_6_io_y_bits[7:0];
	assign io_out_data_bits_0_7 = f_7_io_y_bits[7:0];
	assign io_out_data_bits_0_8 = f_8_io_y_bits[7:0];
	assign io_out_data_bits_0_9 = f_9_io_y_bits[7:0];
	assign io_out_data_bits_0_10 = f_10_io_y_bits[7:0];
	assign io_out_data_bits_0_11 = f_11_io_y_bits[7:0];
	assign io_out_data_bits_0_12 = f_12_io_y_bits[7:0];
	assign io_out_data_bits_0_13 = f_13_io_y_bits[7:0];
	assign io_out_data_bits_0_14 = f_14_io_y_bits[7:0];
	assign io_out_data_bits_0_15 = f_15_io_y_bits[7:0];
	assign f_0_clock = clk;
	assign f_0_io_opcode = io_opcode;
	assign f_0_io_a_valid = io_acc_a_data_valid;
	assign f_0_io_a_bits = io_acc_a_data_bits_0_0;
	assign f_0_io_b_valid = io_acc_b_data_valid;
	assign f_0_io_b_bits = io_acc_b_data_bits_0_0;
	assign f_1_clock = clk;
	assign f_1_io_opcode = io_opcode;
	assign f_1_io_a_valid = io_acc_a_data_valid;
	assign f_1_io_a_bits = io_acc_a_data_bits_0_1;
	assign f_1_io_b_valid = io_acc_b_data_valid;
	assign f_1_io_b_bits = io_acc_b_data_bits_0_1;
	assign f_2_clock = clk;
	assign f_2_io_opcode = io_opcode;
	assign f_2_io_a_valid = io_acc_a_data_valid;
	assign f_2_io_a_bits = io_acc_a_data_bits_0_2;
	assign f_2_io_b_valid = io_acc_b_data_valid;
	assign f_2_io_b_bits = io_acc_b_data_bits_0_2;
	assign f_3_clock = clk;
	assign f_3_io_opcode = io_opcode;
	assign f_3_io_a_valid = io_acc_a_data_valid;
	assign f_3_io_a_bits = io_acc_a_data_bits_0_3;
	assign f_3_io_b_valid = io_acc_b_data_valid;
	assign f_3_io_b_bits = io_acc_b_data_bits_0_3;
	assign f_4_clock = clk;
	assign f_4_io_opcode = io_opcode;
	assign f_4_io_a_valid = io_acc_a_data_valid;
	assign f_4_io_a_bits = io_acc_a_data_bits_0_4;
	assign f_4_io_b_valid = io_acc_b_data_valid;
	assign f_4_io_b_bits = io_acc_b_data_bits_0_4;
	assign f_5_clock = clk;
	assign f_5_io_opcode = io_opcode;
	assign f_5_io_a_valid = io_acc_a_data_valid;
	assign f_5_io_a_bits = io_acc_a_data_bits_0_5;
	assign f_5_io_b_valid = io_acc_b_data_valid;
	assign f_5_io_b_bits = io_acc_b_data_bits_0_5;
	assign f_6_clock = clk;
	assign f_6_io_opcode = io_opcode;
	assign f_6_io_a_valid = io_acc_a_data_valid;
	assign f_6_io_a_bits = io_acc_a_data_bits_0_6;
	assign f_6_io_b_valid = io_acc_b_data_valid;
	assign f_6_io_b_bits = io_acc_b_data_bits_0_6;
	assign f_7_clock = clk;
	assign f_7_io_opcode = io_opcode;
	assign f_7_io_a_valid = io_acc_a_data_valid;
	assign f_7_io_a_bits = io_acc_a_data_bits_0_7;
	assign f_7_io_b_valid = io_acc_b_data_valid;
	assign f_7_io_b_bits = io_acc_b_data_bits_0_7;
	assign f_8_clock = clk;
	assign f_8_io_opcode = io_opcode;
	assign f_8_io_a_valid = io_acc_a_data_valid;
	assign f_8_io_a_bits = io_acc_a_data_bits_0_8;
	assign f_8_io_b_valid = io_acc_b_data_valid;
	assign f_8_io_b_bits = io_acc_b_data_bits_0_8;
	assign f_9_clock = clk;
	assign f_9_io_opcode = io_opcode;
	assign f_9_io_a_valid = io_acc_a_data_valid;
	assign f_9_io_a_bits = io_acc_a_data_bits_0_9;
	assign f_9_io_b_valid = io_acc_b_data_valid;
	assign f_9_io_b_bits = io_acc_b_data_bits_0_9;
	assign f_10_clock = clk;
	assign f_10_io_opcode = io_opcode;
	assign f_10_io_a_valid = io_acc_a_data_valid;
	assign f_10_io_a_bits = io_acc_a_data_bits_0_10;
	assign f_10_io_b_valid = io_acc_b_data_valid;
	assign f_10_io_b_bits = io_acc_b_data_bits_0_10;
	assign f_11_clock = clk;
	assign f_11_io_opcode = io_opcode;
	assign f_11_io_a_valid = io_acc_a_data_valid;
	assign f_11_io_a_bits = io_acc_a_data_bits_0_11;
	assign f_11_io_b_valid = io_acc_b_data_valid;
	assign f_11_io_b_bits = io_acc_b_data_bits_0_11;
	assign f_12_clock = clk;
	assign f_12_io_opcode = io_opcode;
	assign f_12_io_a_valid = io_acc_a_data_valid;
	assign f_12_io_a_bits = io_acc_a_data_bits_0_12;
	assign f_12_io_b_valid = io_acc_b_data_valid;
	assign f_12_io_b_bits = io_acc_b_data_bits_0_12;
	assign f_13_clock = clk;
	assign f_13_io_opcode = io_opcode;
	assign f_13_io_a_valid = io_acc_a_data_valid;
	assign f_13_io_a_bits = io_acc_a_data_bits_0_13;
	assign f_13_io_b_valid = io_acc_b_data_valid;
	assign f_13_io_b_bits = io_acc_b_data_bits_0_13;
	assign f_14_clock = clk;
	assign f_14_io_opcode = io_opcode;
	assign f_14_io_a_valid = io_acc_a_data_valid;
	assign f_14_io_a_bits = io_acc_a_data_bits_0_14;
	assign f_14_io_b_valid = io_acc_b_data_valid;
	assign f_14_io_b_bits = io_acc_b_data_bits_0_14;
	assign f_15_clock = clk;
	assign f_15_io_opcode = io_opcode;
	assign f_15_io_a_valid = io_acc_a_data_valid;
	assign f_15_io_a_bits = io_acc_a_data_bits_0_15;
	assign f_15_io_b_valid = io_acc_b_data_valid;
	assign f_15_io_b_bits = io_acc_b_data_bits_0_15;
endmodule
module TensorAlu (
	clk,
	rst,
	io_start,
	io_done,
	io_dec_alu_imm,
	io_dec_alu_use_imm,
	io_dec_alu_op,
	io_dec_src_1,
	io_dec_src_0,
	io_dec_dst_1,
	io_dec_dst_0,
	io_dec_lp_1,
	io_dec_lp_0,
	io_dec_uop_end,
	io_dec_uop_begin,
	io_uop_idx_valid,
	io_uop_idx_bits,
	io_uop_data_bits_u2,
	io_uop_data_bits_u1,
	io_uop_data_bits_u0,
	io_acc_rd_0_idx_valid,
	io_acc_rd_0_idx_bits,
	io_acc_rd_0_data_valid,
	io_acc_rd_0_data_bits_0_0,
	io_acc_rd_0_data_bits_0_1,
	io_acc_rd_0_data_bits_0_2,
	io_acc_rd_0_data_bits_0_3,
	io_acc_rd_0_data_bits_0_4,
	io_acc_rd_0_data_bits_0_5,
	io_acc_rd_0_data_bits_0_6,
	io_acc_rd_0_data_bits_0_7,
	io_acc_rd_0_data_bits_0_8,
	io_acc_rd_0_data_bits_0_9,
	io_acc_rd_0_data_bits_0_10,
	io_acc_rd_0_data_bits_0_11,
	io_acc_rd_0_data_bits_0_12,
	io_acc_rd_0_data_bits_0_13,
	io_acc_rd_0_data_bits_0_14,
	io_acc_rd_0_data_bits_0_15,
	io_acc_wr_0_valid,
	io_acc_wr_0_bits_idx,
	io_acc_wr_0_bits_data_0_0,
	io_acc_wr_0_bits_data_0_1,
	io_acc_wr_0_bits_data_0_2,
	io_acc_wr_0_bits_data_0_3,
	io_acc_wr_0_bits_data_0_4,
	io_acc_wr_0_bits_data_0_5,
	io_acc_wr_0_bits_data_0_6,
	io_acc_wr_0_bits_data_0_7,
	io_acc_wr_0_bits_data_0_8,
	io_acc_wr_0_bits_data_0_9,
	io_acc_wr_0_bits_data_0_10,
	io_acc_wr_0_bits_data_0_11,
	io_acc_wr_0_bits_data_0_12,
	io_acc_wr_0_bits_data_0_13,
	io_acc_wr_0_bits_data_0_14,
	io_acc_wr_0_bits_data_0_15,
	io_out_rd_0_data_valid,
	io_out_wr_0_valid,
	io_out_wr_0_bits_idx,
	io_out_wr_0_bits_data_0_0,
	io_out_wr_0_bits_data_0_1,
	io_out_wr_0_bits_data_0_2,
	io_out_wr_0_bits_data_0_3,
	io_out_wr_0_bits_data_0_4,
	io_out_wr_0_bits_data_0_5,
	io_out_wr_0_bits_data_0_6,
	io_out_wr_0_bits_data_0_7,
	io_out_wr_0_bits_data_0_8,
	io_out_wr_0_bits_data_0_9,
	io_out_wr_0_bits_data_0_10,
	io_out_wr_0_bits_data_0_11,
	io_out_wr_0_bits_data_0_12,
	io_out_wr_0_bits_data_0_13,
	io_out_wr_0_bits_data_0_14,
	io_out_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [15:0] io_dec_alu_imm;
	input io_dec_alu_use_imm;
	input [2:0] io_dec_alu_op;
	input [10:0] io_dec_src_1;
	input [10:0] io_dec_src_0;
	input [10:0] io_dec_dst_1;
	input [10:0] io_dec_dst_0;
	input [13:0] io_dec_lp_1;
	input [13:0] io_dec_lp_0;
	input [13:0] io_dec_uop_end;
	input [12:0] io_dec_uop_begin;
	output wire io_uop_idx_valid;
	output wire [10:0] io_uop_idx_bits;
	input [9:0] io_uop_data_bits_u2;
	input [10:0] io_uop_data_bits_u1;
	input [10:0] io_uop_data_bits_u0;
	output wire io_acc_rd_0_idx_valid;
	output wire [10:0] io_acc_rd_0_idx_bits;
	input io_acc_rd_0_data_valid;
	input [31:0] io_acc_rd_0_data_bits_0_0;
	input [31:0] io_acc_rd_0_data_bits_0_1;
	input [31:0] io_acc_rd_0_data_bits_0_2;
	input [31:0] io_acc_rd_0_data_bits_0_3;
	input [31:0] io_acc_rd_0_data_bits_0_4;
	input [31:0] io_acc_rd_0_data_bits_0_5;
	input [31:0] io_acc_rd_0_data_bits_0_6;
	input [31:0] io_acc_rd_0_data_bits_0_7;
	input [31:0] io_acc_rd_0_data_bits_0_8;
	input [31:0] io_acc_rd_0_data_bits_0_9;
	input [31:0] io_acc_rd_0_data_bits_0_10;
	input [31:0] io_acc_rd_0_data_bits_0_11;
	input [31:0] io_acc_rd_0_data_bits_0_12;
	input [31:0] io_acc_rd_0_data_bits_0_13;
	input [31:0] io_acc_rd_0_data_bits_0_14;
	input [31:0] io_acc_rd_0_data_bits_0_15;
	output wire io_acc_wr_0_valid;
	output wire [10:0] io_acc_wr_0_bits_idx;
	output wire [31:0] io_acc_wr_0_bits_data_0_0;
	output wire [31:0] io_acc_wr_0_bits_data_0_1;
	output wire [31:0] io_acc_wr_0_bits_data_0_2;
	output wire [31:0] io_acc_wr_0_bits_data_0_3;
	output wire [31:0] io_acc_wr_0_bits_data_0_4;
	output wire [31:0] io_acc_wr_0_bits_data_0_5;
	output wire [31:0] io_acc_wr_0_bits_data_0_6;
	output wire [31:0] io_acc_wr_0_bits_data_0_7;
	output wire [31:0] io_acc_wr_0_bits_data_0_8;
	output wire [31:0] io_acc_wr_0_bits_data_0_9;
	output wire [31:0] io_acc_wr_0_bits_data_0_10;
	output wire [31:0] io_acc_wr_0_bits_data_0_11;
	output wire [31:0] io_acc_wr_0_bits_data_0_12;
	output wire [31:0] io_acc_wr_0_bits_data_0_13;
	output wire [31:0] io_acc_wr_0_bits_data_0_14;
	output wire [31:0] io_acc_wr_0_bits_data_0_15;
	input io_out_rd_0_data_valid;
	output wire io_out_wr_0_valid;
	output wire [10:0] io_out_wr_0_bits_idx;
	output wire [7:0] io_out_wr_0_bits_data_0_0;
	output wire [7:0] io_out_wr_0_bits_data_0_1;
	output wire [7:0] io_out_wr_0_bits_data_0_2;
	output wire [7:0] io_out_wr_0_bits_data_0_3;
	output wire [7:0] io_out_wr_0_bits_data_0_4;
	output wire [7:0] io_out_wr_0_bits_data_0_5;
	output wire [7:0] io_out_wr_0_bits_data_0_6;
	output wire [7:0] io_out_wr_0_bits_data_0_7;
	output wire [7:0] io_out_wr_0_bits_data_0_8;
	output wire [7:0] io_out_wr_0_bits_data_0_9;
	output wire [7:0] io_out_wr_0_bits_data_0_10;
	output wire [7:0] io_out_wr_0_bits_data_0_11;
	output wire [7:0] io_out_wr_0_bits_data_0_12;
	output wire [7:0] io_out_wr_0_bits_data_0_13;
	output wire [7:0] io_out_wr_0_bits_data_0_14;
	output wire [7:0] io_out_wr_0_bits_data_0_15;
	wire index_generator_clock;
	wire index_generator_reset;
	wire index_generator_io_start;
	wire index_generator_io_last;
	wire index_generator_io_dec_alu_use_imm;
	wire [10:0] index_generator_io_dec_src_1;
	wire [10:0] index_generator_io_dec_src_0;
	wire [10:0] index_generator_io_dec_dst_1;
	wire [10:0] index_generator_io_dec_dst_0;
	wire [13:0] index_generator_io_dec_lp_1;
	wire [13:0] index_generator_io_dec_lp_0;
	wire [13:0] index_generator_io_dec_uop_end;
	wire [12:0] index_generator_io_dec_uop_begin;
	wire index_generator_io_valid;
	wire index_generator_io_src_valid;
	wire [10:0] index_generator_io_dst_idx;
	wire [10:0] index_generator_io_src_idx;
	wire [10:0] index_generator_io_uop_idx;
	wire alu_clock;
	wire [2:0] alu_io_opcode;
	wire alu_io_acc_a_data_valid;
	wire [31:0] alu_io_acc_a_data_bits_0_0;
	wire [31:0] alu_io_acc_a_data_bits_0_1;
	wire [31:0] alu_io_acc_a_data_bits_0_2;
	wire [31:0] alu_io_acc_a_data_bits_0_3;
	wire [31:0] alu_io_acc_a_data_bits_0_4;
	wire [31:0] alu_io_acc_a_data_bits_0_5;
	wire [31:0] alu_io_acc_a_data_bits_0_6;
	wire [31:0] alu_io_acc_a_data_bits_0_7;
	wire [31:0] alu_io_acc_a_data_bits_0_8;
	wire [31:0] alu_io_acc_a_data_bits_0_9;
	wire [31:0] alu_io_acc_a_data_bits_0_10;
	wire [31:0] alu_io_acc_a_data_bits_0_11;
	wire [31:0] alu_io_acc_a_data_bits_0_12;
	wire [31:0] alu_io_acc_a_data_bits_0_13;
	wire [31:0] alu_io_acc_a_data_bits_0_14;
	wire [31:0] alu_io_acc_a_data_bits_0_15;
	wire alu_io_acc_b_data_valid;
	wire [31:0] alu_io_acc_b_data_bits_0_0;
	wire [31:0] alu_io_acc_b_data_bits_0_1;
	wire [31:0] alu_io_acc_b_data_bits_0_2;
	wire [31:0] alu_io_acc_b_data_bits_0_3;
	wire [31:0] alu_io_acc_b_data_bits_0_4;
	wire [31:0] alu_io_acc_b_data_bits_0_5;
	wire [31:0] alu_io_acc_b_data_bits_0_6;
	wire [31:0] alu_io_acc_b_data_bits_0_7;
	wire [31:0] alu_io_acc_b_data_bits_0_8;
	wire [31:0] alu_io_acc_b_data_bits_0_9;
	wire [31:0] alu_io_acc_b_data_bits_0_10;
	wire [31:0] alu_io_acc_b_data_bits_0_11;
	wire [31:0] alu_io_acc_b_data_bits_0_12;
	wire [31:0] alu_io_acc_b_data_bits_0_13;
	wire [31:0] alu_io_acc_b_data_bits_0_14;
	wire [31:0] alu_io_acc_b_data_bits_0_15;
	wire alu_io_acc_y_data_valid;
	wire [31:0] alu_io_acc_y_data_bits_0_0;
	wire [31:0] alu_io_acc_y_data_bits_0_1;
	wire [31:0] alu_io_acc_y_data_bits_0_2;
	wire [31:0] alu_io_acc_y_data_bits_0_3;
	wire [31:0] alu_io_acc_y_data_bits_0_4;
	wire [31:0] alu_io_acc_y_data_bits_0_5;
	wire [31:0] alu_io_acc_y_data_bits_0_6;
	wire [31:0] alu_io_acc_y_data_bits_0_7;
	wire [31:0] alu_io_acc_y_data_bits_0_8;
	wire [31:0] alu_io_acc_y_data_bits_0_9;
	wire [31:0] alu_io_acc_y_data_bits_0_10;
	wire [31:0] alu_io_acc_y_data_bits_0_11;
	wire [31:0] alu_io_acc_y_data_bits_0_12;
	wire [31:0] alu_io_acc_y_data_bits_0_13;
	wire [31:0] alu_io_acc_y_data_bits_0_14;
	wire [31:0] alu_io_acc_y_data_bits_0_15;
	wire alu_io_out_data_valid;
	wire [7:0] alu_io_out_data_bits_0_0;
	wire [7:0] alu_io_out_data_bits_0_1;
	wire [7:0] alu_io_out_data_bits_0_2;
	wire [7:0] alu_io_out_data_bits_0_3;
	wire [7:0] alu_io_out_data_bits_0_4;
	wire [7:0] alu_io_out_data_bits_0_5;
	wire [7:0] alu_io_out_data_bits_0_6;
	wire [7:0] alu_io_out_data_bits_0_7;
	wire [7:0] alu_io_out_data_bits_0_8;
	wire [7:0] alu_io_out_data_bits_0_9;
	wire [7:0] alu_io_out_data_bits_0_10;
	wire [7:0] alu_io_out_data_bits_0_11;
	wire [7:0] alu_io_out_data_bits_0_12;
	wire [7:0] alu_io_out_data_bits_0_13;
	wire [7:0] alu_io_out_data_bits_0_14;
	wire [7:0] alu_io_out_data_bits_0_15;
	reg [1:0] state;
	reg [3:0] inflight;
	wire _T = state == 2'h0;
	wire _T_5 = inflight == 4'h0;
	wire _T_6 = (state == 2'h2) & (inflight == 4'h0);
	wire _GEN_3 = ((state == 2'h1) & index_generator_io_last ? 1'h0 : _T_6);
	reg valid_r1;
	wire _GEN_6 = index_generator_io_valid;
	reg valid_r2;
	reg valid_r3;
	reg valid_r4;
	wire _T_7 = index_generator_io_valid & valid_r4;
	wire _T_10 = ~rst;
	wire [3:0] _inflight_T_1 = inflight + 4'h1;
	wire [3:0] _inflight_T_3 = inflight - 4'h1;
	wire [3:0] _GEN_7 = (valid_r4 ? _inflight_T_3 : inflight);
	reg src_valid_r1;
	wire _GEN_11 = index_generator_io_src_valid;
	reg src_valid_r2;
	reg src_valid_r3;
	reg [10:0] dst_idx_r1;
	reg [10:0] src_idx_r1;
	wire [10:0] u2 = {1'd0, io_uop_data_bits_u2};
	wire [21:0] _src_offset_T = {u2, 11'h000};
	wire [21:0] _GEN_14 = {11'd0, io_uop_data_bits_u1};
	wire [21:0] src_offset = _src_offset_T | _GEN_14;
	reg io_acc_rd_0_idx_valid_REG;
	wire [21:0] _GEN_15 = {11'd0, src_idx_r1};
	wire [21:0] new_src_idx_r1 = _GEN_15 + src_offset;
	reg [21:0] src_idx_r2;
	reg [21:0] src_idx_r3;
	wire [10:0] new_dst_idx_r1 = dst_idx_r1 + io_uop_data_bits_u0;
	reg [10:0] dst_idx_r2;
	reg [10:0] dst_idx_r3;
	reg [10:0] dst_idx_r4;
	reg [21:0] io_acc_rd_0_idx_bits_REG;
	reg [31:0] save_src_0_0;
	reg [31:0] save_src_0_1;
	reg [31:0] save_src_0_2;
	reg [31:0] save_src_0_3;
	reg [31:0] save_src_0_4;
	reg [31:0] save_src_0_5;
	reg [31:0] save_src_0_6;
	reg [31:0] save_src_0_7;
	reg [31:0] save_src_0_8;
	reg [31:0] save_src_0_9;
	reg [31:0] save_src_0_10;
	reg [31:0] save_src_0_11;
	reg [31:0] save_src_0_12;
	reg [31:0] save_src_0_13;
	reg [31:0] save_src_0_14;
	reg [31:0] save_src_0_15;
	wire [31:0] _tensorImm_data_bits_0_0_T_1 = {16'hffff, io_dec_alu_imm};
	wire [31:0] tensorImm_data_bits_0_0 = (io_dec_alu_imm[15] ? _tensorImm_data_bits_0_0_T_1 : {16'd0, io_dec_alu_imm});
	wire isSHR = io_dec_alu_op == 3'h3;
	wire neg_shift = isSHR & io_dec_alu_imm[15];
	reg alu_io_acc_a_data_valid_REG;
	wire bypass_dst = (valid_r3 & valid_r4) & (dst_idx_r4 == dst_idx_r3);
	wire [21:0] _GEN_16 = {11'd0, dst_idx_r4};
	wire bypass_src = (src_valid_r3 & valid_r4) & (_GEN_16 == src_idx_r3);
	wire _GEN_17 = ~_T_7;
	TensorAluIndexGenerator index_generator(
		.clk(index_generator_clock),
		.rst(index_generator_reset),
		.io_start(index_generator_io_start),
		.io_last(index_generator_io_last),
		.io_dec_alu_use_imm(index_generator_io_dec_alu_use_imm),
		.io_dec_src_1(index_generator_io_dec_src_1),
		.io_dec_src_0(index_generator_io_dec_src_0),
		.io_dec_dst_1(index_generator_io_dec_dst_1),
		.io_dec_dst_0(index_generator_io_dec_dst_0),
		.io_dec_lp_1(index_generator_io_dec_lp_1),
		.io_dec_lp_0(index_generator_io_dec_lp_0),
		.io_dec_uop_end(index_generator_io_dec_uop_end),
		.io_dec_uop_begin(index_generator_io_dec_uop_begin),
		.io_valid(index_generator_io_valid),
		.io_src_valid(index_generator_io_src_valid),
		.io_dst_idx(index_generator_io_dst_idx),
		.io_src_idx(index_generator_io_src_idx),
		.io_uop_idx(index_generator_io_uop_idx)
	);
	AluVector alu(
		.clk(alu_clock),
		.io_opcode(alu_io_opcode),
		.io_acc_a_data_valid(alu_io_acc_a_data_valid),
		.io_acc_a_data_bits_0_0(alu_io_acc_a_data_bits_0_0),
		.io_acc_a_data_bits_0_1(alu_io_acc_a_data_bits_0_1),
		.io_acc_a_data_bits_0_2(alu_io_acc_a_data_bits_0_2),
		.io_acc_a_data_bits_0_3(alu_io_acc_a_data_bits_0_3),
		.io_acc_a_data_bits_0_4(alu_io_acc_a_data_bits_0_4),
		.io_acc_a_data_bits_0_5(alu_io_acc_a_data_bits_0_5),
		.io_acc_a_data_bits_0_6(alu_io_acc_a_data_bits_0_6),
		.io_acc_a_data_bits_0_7(alu_io_acc_a_data_bits_0_7),
		.io_acc_a_data_bits_0_8(alu_io_acc_a_data_bits_0_8),
		.io_acc_a_data_bits_0_9(alu_io_acc_a_data_bits_0_9),
		.io_acc_a_data_bits_0_10(alu_io_acc_a_data_bits_0_10),
		.io_acc_a_data_bits_0_11(alu_io_acc_a_data_bits_0_11),
		.io_acc_a_data_bits_0_12(alu_io_acc_a_data_bits_0_12),
		.io_acc_a_data_bits_0_13(alu_io_acc_a_data_bits_0_13),
		.io_acc_a_data_bits_0_14(alu_io_acc_a_data_bits_0_14),
		.io_acc_a_data_bits_0_15(alu_io_acc_a_data_bits_0_15),
		.io_acc_b_data_valid(alu_io_acc_b_data_valid),
		.io_acc_b_data_bits_0_0(alu_io_acc_b_data_bits_0_0),
		.io_acc_b_data_bits_0_1(alu_io_acc_b_data_bits_0_1),
		.io_acc_b_data_bits_0_2(alu_io_acc_b_data_bits_0_2),
		.io_acc_b_data_bits_0_3(alu_io_acc_b_data_bits_0_3),
		.io_acc_b_data_bits_0_4(alu_io_acc_b_data_bits_0_4),
		.io_acc_b_data_bits_0_5(alu_io_acc_b_data_bits_0_5),
		.io_acc_b_data_bits_0_6(alu_io_acc_b_data_bits_0_6),
		.io_acc_b_data_bits_0_7(alu_io_acc_b_data_bits_0_7),
		.io_acc_b_data_bits_0_8(alu_io_acc_b_data_bits_0_8),
		.io_acc_b_data_bits_0_9(alu_io_acc_b_data_bits_0_9),
		.io_acc_b_data_bits_0_10(alu_io_acc_b_data_bits_0_10),
		.io_acc_b_data_bits_0_11(alu_io_acc_b_data_bits_0_11),
		.io_acc_b_data_bits_0_12(alu_io_acc_b_data_bits_0_12),
		.io_acc_b_data_bits_0_13(alu_io_acc_b_data_bits_0_13),
		.io_acc_b_data_bits_0_14(alu_io_acc_b_data_bits_0_14),
		.io_acc_b_data_bits_0_15(alu_io_acc_b_data_bits_0_15),
		.io_acc_y_data_valid(alu_io_acc_y_data_valid),
		.io_acc_y_data_bits_0_0(alu_io_acc_y_data_bits_0_0),
		.io_acc_y_data_bits_0_1(alu_io_acc_y_data_bits_0_1),
		.io_acc_y_data_bits_0_2(alu_io_acc_y_data_bits_0_2),
		.io_acc_y_data_bits_0_3(alu_io_acc_y_data_bits_0_3),
		.io_acc_y_data_bits_0_4(alu_io_acc_y_data_bits_0_4),
		.io_acc_y_data_bits_0_5(alu_io_acc_y_data_bits_0_5),
		.io_acc_y_data_bits_0_6(alu_io_acc_y_data_bits_0_6),
		.io_acc_y_data_bits_0_7(alu_io_acc_y_data_bits_0_7),
		.io_acc_y_data_bits_0_8(alu_io_acc_y_data_bits_0_8),
		.io_acc_y_data_bits_0_9(alu_io_acc_y_data_bits_0_9),
		.io_acc_y_data_bits_0_10(alu_io_acc_y_data_bits_0_10),
		.io_acc_y_data_bits_0_11(alu_io_acc_y_data_bits_0_11),
		.io_acc_y_data_bits_0_12(alu_io_acc_y_data_bits_0_12),
		.io_acc_y_data_bits_0_13(alu_io_acc_y_data_bits_0_13),
		.io_acc_y_data_bits_0_14(alu_io_acc_y_data_bits_0_14),
		.io_acc_y_data_bits_0_15(alu_io_acc_y_data_bits_0_15),
		.io_out_data_valid(alu_io_out_data_valid),
		.io_out_data_bits_0_0(alu_io_out_data_bits_0_0),
		.io_out_data_bits_0_1(alu_io_out_data_bits_0_1),
		.io_out_data_bits_0_2(alu_io_out_data_bits_0_2),
		.io_out_data_bits_0_3(alu_io_out_data_bits_0_3),
		.io_out_data_bits_0_4(alu_io_out_data_bits_0_4),
		.io_out_data_bits_0_5(alu_io_out_data_bits_0_5),
		.io_out_data_bits_0_6(alu_io_out_data_bits_0_6),
		.io_out_data_bits_0_7(alu_io_out_data_bits_0_7),
		.io_out_data_bits_0_8(alu_io_out_data_bits_0_8),
		.io_out_data_bits_0_9(alu_io_out_data_bits_0_9),
		.io_out_data_bits_0_10(alu_io_out_data_bits_0_10),
		.io_out_data_bits_0_11(alu_io_out_data_bits_0_11),
		.io_out_data_bits_0_12(alu_io_out_data_bits_0_12),
		.io_out_data_bits_0_13(alu_io_out_data_bits_0_13),
		.io_out_data_bits_0_14(alu_io_out_data_bits_0_14),
		.io_out_data_bits_0_15(alu_io_out_data_bits_0_15)
	);
	assign io_done = ((state == 2'h0) & io_start ? 1'h0 : _GEN_3);
	assign io_uop_idx_valid = index_generator_io_valid | index_generator_io_src_valid;
	assign io_uop_idx_bits = index_generator_io_uop_idx;
	assign io_acc_rd_0_idx_valid = io_acc_rd_0_idx_valid_REG;
	assign io_acc_rd_0_idx_bits = io_acc_rd_0_idx_bits_REG[10:0];
	assign io_acc_wr_0_valid = valid_r4;
	assign io_acc_wr_0_bits_idx = dst_idx_r4;
	assign io_acc_wr_0_bits_data_0_0 = alu_io_acc_y_data_bits_0_0;
	assign io_acc_wr_0_bits_data_0_1 = alu_io_acc_y_data_bits_0_1;
	assign io_acc_wr_0_bits_data_0_2 = alu_io_acc_y_data_bits_0_2;
	assign io_acc_wr_0_bits_data_0_3 = alu_io_acc_y_data_bits_0_3;
	assign io_acc_wr_0_bits_data_0_4 = alu_io_acc_y_data_bits_0_4;
	assign io_acc_wr_0_bits_data_0_5 = alu_io_acc_y_data_bits_0_5;
	assign io_acc_wr_0_bits_data_0_6 = alu_io_acc_y_data_bits_0_6;
	assign io_acc_wr_0_bits_data_0_7 = alu_io_acc_y_data_bits_0_7;
	assign io_acc_wr_0_bits_data_0_8 = alu_io_acc_y_data_bits_0_8;
	assign io_acc_wr_0_bits_data_0_9 = alu_io_acc_y_data_bits_0_9;
	assign io_acc_wr_0_bits_data_0_10 = alu_io_acc_y_data_bits_0_10;
	assign io_acc_wr_0_bits_data_0_11 = alu_io_acc_y_data_bits_0_11;
	assign io_acc_wr_0_bits_data_0_12 = alu_io_acc_y_data_bits_0_12;
	assign io_acc_wr_0_bits_data_0_13 = alu_io_acc_y_data_bits_0_13;
	assign io_acc_wr_0_bits_data_0_14 = alu_io_acc_y_data_bits_0_14;
	assign io_acc_wr_0_bits_data_0_15 = alu_io_acc_y_data_bits_0_15;
	assign io_out_wr_0_valid = valid_r4;
	assign io_out_wr_0_bits_idx = dst_idx_r4;
	assign io_out_wr_0_bits_data_0_0 = alu_io_out_data_bits_0_0;
	assign io_out_wr_0_bits_data_0_1 = alu_io_out_data_bits_0_1;
	assign io_out_wr_0_bits_data_0_2 = alu_io_out_data_bits_0_2;
	assign io_out_wr_0_bits_data_0_3 = alu_io_out_data_bits_0_3;
	assign io_out_wr_0_bits_data_0_4 = alu_io_out_data_bits_0_4;
	assign io_out_wr_0_bits_data_0_5 = alu_io_out_data_bits_0_5;
	assign io_out_wr_0_bits_data_0_6 = alu_io_out_data_bits_0_6;
	assign io_out_wr_0_bits_data_0_7 = alu_io_out_data_bits_0_7;
	assign io_out_wr_0_bits_data_0_8 = alu_io_out_data_bits_0_8;
	assign io_out_wr_0_bits_data_0_9 = alu_io_out_data_bits_0_9;
	assign io_out_wr_0_bits_data_0_10 = alu_io_out_data_bits_0_10;
	assign io_out_wr_0_bits_data_0_11 = alu_io_out_data_bits_0_11;
	assign io_out_wr_0_bits_data_0_12 = alu_io_out_data_bits_0_12;
	assign io_out_wr_0_bits_data_0_13 = alu_io_out_data_bits_0_13;
	assign io_out_wr_0_bits_data_0_14 = alu_io_out_data_bits_0_14;
	assign io_out_wr_0_bits_data_0_15 = alu_io_out_data_bits_0_15;
	assign index_generator_clock = clk;
	assign index_generator_reset = rst;
	assign index_generator_io_start = io_start;
	assign index_generator_io_dec_alu_use_imm = io_dec_alu_use_imm;
	assign index_generator_io_dec_src_1 = io_dec_src_1;
	assign index_generator_io_dec_src_0 = io_dec_src_0;
	assign index_generator_io_dec_dst_1 = io_dec_dst_1;
	assign index_generator_io_dec_dst_0 = io_dec_dst_0;
	assign index_generator_io_dec_lp_1 = io_dec_lp_1;
	assign index_generator_io_dec_lp_0 = io_dec_lp_0;
	assign index_generator_io_dec_uop_end = io_dec_uop_end;
	assign index_generator_io_dec_uop_begin = io_dec_uop_begin;
	assign alu_clock = clk;
	assign alu_io_opcode = (neg_shift ? 3'h4 : io_dec_alu_op);
	assign alu_io_acc_a_data_valid = alu_io_acc_a_data_valid_REG;
	assign alu_io_acc_a_data_bits_0_0 = io_acc_rd_0_data_bits_0_0;
	assign alu_io_acc_a_data_bits_0_1 = io_acc_rd_0_data_bits_0_1;
	assign alu_io_acc_a_data_bits_0_2 = io_acc_rd_0_data_bits_0_2;
	assign alu_io_acc_a_data_bits_0_3 = io_acc_rd_0_data_bits_0_3;
	assign alu_io_acc_a_data_bits_0_4 = io_acc_rd_0_data_bits_0_4;
	assign alu_io_acc_a_data_bits_0_5 = io_acc_rd_0_data_bits_0_5;
	assign alu_io_acc_a_data_bits_0_6 = io_acc_rd_0_data_bits_0_6;
	assign alu_io_acc_a_data_bits_0_7 = io_acc_rd_0_data_bits_0_7;
	assign alu_io_acc_a_data_bits_0_8 = io_acc_rd_0_data_bits_0_8;
	assign alu_io_acc_a_data_bits_0_9 = io_acc_rd_0_data_bits_0_9;
	assign alu_io_acc_a_data_bits_0_10 = io_acc_rd_0_data_bits_0_10;
	assign alu_io_acc_a_data_bits_0_11 = io_acc_rd_0_data_bits_0_11;
	assign alu_io_acc_a_data_bits_0_12 = io_acc_rd_0_data_bits_0_12;
	assign alu_io_acc_a_data_bits_0_13 = io_acc_rd_0_data_bits_0_13;
	assign alu_io_acc_a_data_bits_0_14 = io_acc_rd_0_data_bits_0_14;
	assign alu_io_acc_a_data_bits_0_15 = io_acc_rd_0_data_bits_0_15;
	assign alu_io_acc_b_data_valid = valid_r3;
	assign alu_io_acc_b_data_bits_0_0 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_0);
	assign alu_io_acc_b_data_bits_0_1 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_1);
	assign alu_io_acc_b_data_bits_0_2 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_2);
	assign alu_io_acc_b_data_bits_0_3 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_3);
	assign alu_io_acc_b_data_bits_0_4 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_4);
	assign alu_io_acc_b_data_bits_0_5 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_5);
	assign alu_io_acc_b_data_bits_0_6 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_6);
	assign alu_io_acc_b_data_bits_0_7 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_7);
	assign alu_io_acc_b_data_bits_0_8 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_8);
	assign alu_io_acc_b_data_bits_0_9 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_9);
	assign alu_io_acc_b_data_bits_0_10 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_10);
	assign alu_io_acc_b_data_bits_0_11 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_11);
	assign alu_io_acc_b_data_bits_0_12 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_12);
	assign alu_io_acc_b_data_bits_0_13 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_13);
	assign alu_io_acc_b_data_bits_0_14 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_14);
	assign alu_io_acc_b_data_bits_0_15 = (io_dec_alu_use_imm ? tensorImm_data_bits_0_0 : save_src_0_15);
	always @(posedge clk) begin
		if (rst)
			state <= 2'h0;
		else if ((state == 2'h0) & io_start)
			state <= 2'h1;
		else if ((state == 2'h1) & index_generator_io_last)
			state <= 2'h2;
		else if ((state == 2'h2) & (inflight == 4'h0))
			state <= 2'h0;
		if (rst)
			inflight <= 4'h0;
		else if (_T)
			inflight <= 4'h0;
		else if (!(index_generator_io_valid & valid_r4)) begin
			if (index_generator_io_valid)
				inflight <= _inflight_T_1;
			else
				inflight <= _GEN_7;
		end
		if (rst)
			valid_r1 <= 1'h0;
		else
			valid_r1 <= _GEN_6;
		if (rst)
			valid_r2 <= 1'h0;
		else
			valid_r2 <= valid_r1;
		if (rst)
			valid_r3 <= 1'h0;
		else
			valid_r3 <= valid_r2;
		if (rst)
			valid_r4 <= 1'h0;
		else
			valid_r4 <= valid_r3;
		if (rst)
			src_valid_r1 <= 1'h0;
		else
			src_valid_r1 <= _GEN_11;
		if (rst)
			src_valid_r2 <= 1'h0;
		else
			src_valid_r2 <= src_valid_r1;
		if (rst)
			src_valid_r3 <= 1'h0;
		else
			src_valid_r3 <= src_valid_r2;
		dst_idx_r1 <= index_generator_io_dst_idx;
		src_idx_r1 <= index_generator_io_src_idx;
		io_acc_rd_0_idx_valid_REG <= valid_r1 | src_valid_r1;
		src_idx_r2 <= _GEN_15 + src_offset;
		src_idx_r3 <= src_idx_r2;
		dst_idx_r2 <= dst_idx_r1 + io_uop_data_bits_u0;
		dst_idx_r3 <= dst_idx_r2;
		dst_idx_r4 <= dst_idx_r3;
		if (src_valid_r1 | io_dec_alu_use_imm)
			io_acc_rd_0_idx_bits_REG <= new_src_idx_r1;
		else
			io_acc_rd_0_idx_bits_REG <= {11'd0, new_dst_idx_r1};
		save_src_0_0 <= io_acc_rd_0_data_bits_0_0;
		save_src_0_1 <= io_acc_rd_0_data_bits_0_1;
		save_src_0_2 <= io_acc_rd_0_data_bits_0_2;
		save_src_0_3 <= io_acc_rd_0_data_bits_0_3;
		save_src_0_4 <= io_acc_rd_0_data_bits_0_4;
		save_src_0_5 <= io_acc_rd_0_data_bits_0_5;
		save_src_0_6 <= io_acc_rd_0_data_bits_0_6;
		save_src_0_7 <= io_acc_rd_0_data_bits_0_7;
		save_src_0_8 <= io_acc_rd_0_data_bits_0_8;
		save_src_0_9 <= io_acc_rd_0_data_bits_0_9;
		save_src_0_10 <= io_acc_rd_0_data_bits_0_10;
		save_src_0_11 <= io_acc_rd_0_data_bits_0_11;
		save_src_0_12 <= io_acc_rd_0_data_bits_0_12;
		save_src_0_13 <= io_acc_rd_0_data_bits_0_13;
		save_src_0_14 <= io_acc_rd_0_data_bits_0_14;
		save_src_0_15 <= io_acc_rd_0_data_bits_0_15;
		alu_io_acc_a_data_valid_REG <= valid_r2;
		if (((~_T_7 & index_generator_io_valid) & ~rst) & ~(inflight != 4'hf))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:233 assert(inflight =/= ((1<<inflightBits)-1).U)\n");
		if ((((_GEN_17 & ~index_generator_io_valid) & valid_r4) & _T_10) & ~(inflight != 4'h0))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:236 assert(inflight =/= 0.U)\n");
		if ((_T & _T_10) & ~_T_5)
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:240 assert(inflight === 0.U)\n");
		if (_T_10 & ~(io_acc_rd_0_data_valid == (valid_r3 | src_valid_r3)))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:284 assert(io.acc.rd(idx).data.valid === (valid_r3 || src_valid_r3))\n");
		if (_T_10 & ~(~valid_r3 | io_acc_rd_0_data_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:336 assert(!valid_r3 || io.acc.rd(idx).data.valid)\n");
		if (_T_10 & ~(alu_io_acc_y_data_valid == valid_r4))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:359 assert(alu.io.acc_y.data.valid === valid_r4)\n");
		if (_T_10 & ~(alu_io_out_data_valid == valid_r4))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorAlu.scala:372 assert(alu.io.out.data.valid === valid_r4)\n");
		if (_T_10 & ~(~bypass_dst))
			$fwrite(32'h80000002, "Assertion failed: Bypass required on dst_idx read TensorAlu.dst_idx_r3: Reg[UInt] RAW with write TensorAlu.dst_idx_r4: Reg[UInt]\n\n    at TensorAlu.scala:390 assert(!bypass_dst, s\"Bypass required on dst_idx read $dst_idx_r3 RAW with write $dst_idx_r4\\n\")\n");
		if (_T_10 & ~(~bypass_src))
			$fwrite(32'h80000002, "Assertion failed: Bypass required on src_idx read TensorAlu.src_idx_r3: Reg[UInt] RAW with write TensorAlu.dst_idx_r4: Reg[UInt]\n\n    at TensorAlu.scala:391 assert(!bypass_src, s\"Bypass required on src_idx read $src_idx_r3 RAW with write $dst_idx_r4\\n\")\n");
	end
	always @(posedge clk) begin
		if ((~_T_7 & index_generator_io_valid) & ~rst)
			;
		if (((_GEN_17 & ~index_generator_io_valid) & valid_r4) & _T_10)
			;
		if (_T & _T_10)
			;
		if (_T_10)
			;
		if (_T_10)
			;
		if (_T_10)
			;
		if (_T_10)
			;
		if (_T_10)
			;
		if (_T_10)
			;
	end
endmodule
module TwoPortMem_1 (
	clk,
	io_wr_en,
	io_wr_addr,
	io_wr_data,
	io_rd_en,
	io_rd_addr,
	io_rd_data
);
	input clk;
	input io_wr_en;
	input [15:0] io_wr_addr;
	input [127:0] io_wr_data;
	input io_rd_en;
	input [15:0] io_rd_addr;
	output wire [127:0] io_rd_data;
	reg [127:0] mem [0:511];
	wire mem_io_rd_data_MPORT_en;
	wire [8:0] mem_io_rd_data_MPORT_addr;
	wire [127:0] mem_io_rd_data_MPORT_data;
	wire [127:0] mem_MPORT_data;
	wire [8:0] mem_MPORT_addr;
	wire mem_MPORT_mask;
	wire mem_MPORT_en;
	reg mem_io_rd_data_MPORT_en_pipe_0;
	reg [8:0] mem_io_rd_data_MPORT_addr_pipe_0;
	assign mem_io_rd_data_MPORT_en = mem_io_rd_data_MPORT_en_pipe_0;
	assign mem_io_rd_data_MPORT_addr = mem_io_rd_data_MPORT_addr_pipe_0;
	assign mem_io_rd_data_MPORT_data = mem[mem_io_rd_data_MPORT_addr];
	assign mem_MPORT_data = io_wr_data;
	assign mem_MPORT_addr = io_wr_addr[8:0];
	assign mem_MPORT_mask = 1'h1;
	assign mem_MPORT_en = io_wr_en;
	assign io_rd_data = mem_io_rd_data_MPORT_data;
	always @(posedge clk) begin
		if (mem_MPORT_en & mem_MPORT_mask)
			mem[mem_MPORT_addr] <= mem_MPORT_data;
		mem_io_rd_data_MPORT_en_pipe_0 <= io_rd_en;
		if (io_rd_en)
			mem_io_rd_data_MPORT_addr_pipe_0 <= io_rd_addr[8:0];
	end
endmodule
module OneCycleQueue_1 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits,
	io_count
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	output wire [9:0] io_count;
	wire ram0_clock;
	wire ram0_io_wr_en;
	wire [15:0] ram0_io_wr_addr;
	wire [127:0] ram0_io_wr_data;
	wire ram0_io_rd_en;
	wire [15:0] ram0_io_rd_addr;
	wire [127:0] ram0_io_rd_data;
	reg [8:0] value;
	reg [8:0] value_1;
	reg maybe_full;
	wire ptr_match = value == value_1;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	wire do_deq = io_deq_ready & io_deq_valid;
	wire wrap = value_1 == 9'h1ff;
	wire [8:0] _value_T_1 = value_1 + 9'h001;
	wire [8:0] _value_T_3 = value + 9'h001;
	wire _firstRead_T_1 = do_enq & (io_count == 10'h000);
	reg firstRead;
	wire _io_deq_valid_T_1 = ~firstRead;
	wire [8:0] _GEN_4 = (wrap ? 9'h000 : _value_T_1);
	wire [8:0] _GEN_5 = (do_deq ? _GEN_4 : value_1);
	wire [8:0] rdAddr = (firstRead ? value_1 : _GEN_5);
	wire [8:0] ptr_diff = value - value_1;
	wire [9:0] _io_count_T_1 = (maybe_full & ptr_match ? 10'h200 : 10'h000);
	wire [9:0] _GEN_7 = {1'd0, ptr_diff};
	TwoPortMem_1 ram0(
		.clk(ram0_clock),
		.io_wr_en(ram0_io_wr_en),
		.io_wr_addr(ram0_io_wr_addr),
		.io_wr_data(ram0_io_wr_data),
		.io_rd_en(ram0_io_rd_en),
		.io_rd_addr(ram0_io_rd_addr),
		.io_rd_data(ram0_io_rd_data)
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty & ~firstRead;
	assign io_deq_bits = ram0_io_rd_data;
	assign io_count = _io_count_T_1 | _GEN_7;
	assign ram0_clock = clk;
	assign ram0_io_wr_en = io_enq_ready & io_enq_valid;
	assign ram0_io_wr_addr = {7'd0, value};
	assign ram0_io_wr_data = io_enq_bits;
	assign ram0_io_rd_en = do_deq | firstRead;
	assign ram0_io_rd_addr = {7'd0, rdAddr};
	always @(posedge clk) begin
		if (rst)
			value <= 9'h000;
		else if (do_enq)
			value <= _value_T_3;
		if (rst)
			value_1 <= 9'h000;
		else if (do_deq)
			value_1 <= _value_T_1;
		if (rst)
			maybe_full <= 1'h0;
		else if (do_enq != do_deq)
			maybe_full <= do_enq;
		if (rst)
			firstRead <= 1'h0;
		else
			firstRead <= _firstRead_T_1;
		if (~rst & ~(_io_deq_valid_T_1 | ~do_deq))
			$fwrite(32'h80000002, "Assertion failed: -F- Cannot have deq with first read as queue output is not valid yet\n    at SyncQueue.scala:406 assert(!firstRead || !do_deq, \"-F- Cannot have deq with first read as queue output is not valid yet\")\n");
	end
	always @(posedge clk)
		if (~rst)
			;
endmodule
module SyncQueue2PortMemImpl_1 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	wire memoryQueue_clock;
	wire memoryQueue_reset;
	wire memoryQueue_io_enq_ready;
	wire memoryQueue_io_enq_valid;
	wire [127:0] memoryQueue_io_enq_bits;
	wire memoryQueue_io_deq_ready;
	wire memoryQueue_io_deq_valid;
	wire [127:0] memoryQueue_io_deq_bits;
	wire [9:0] memoryQueue_io_count;
	wire buffer_clock;
	wire buffer_reset;
	wire buffer_io_enq_ready;
	wire buffer_io_enq_valid;
	wire [127:0] buffer_io_enq_bits;
	wire buffer_io_deq_ready;
	wire buffer_io_deq_valid;
	wire [127:0] buffer_io_deq_bits;
	wire memoryQueueHasValues = memoryQueue_io_count != 10'h000;
	wire _memoryQueue_io_enq_valid_T = io_enq_ready & io_enq_valid;
	wire _countNext_T_1 = io_deq_ready & io_deq_valid;
	wire _countNext_T_2 = _memoryQueue_io_enq_valid_T | _countNext_T_1;
	reg [9:0] countNext;
	wire _T_3 = _memoryQueue_io_enq_valid_T & ~_countNext_T_1;
	wire [9:0] _count_T_1 = countNext + 10'h001;
	wire _T_11 = ~_memoryQueue_io_enq_valid_T & _countNext_T_1;
	wire [9:0] _count_T_3 = countNext - 10'h001;
	wire _T_6 = ~rst;
	OneCycleQueue_1 memoryQueue(
		.clk(memoryQueue_clock),
		.rst(memoryQueue_reset),
		.io_enq_ready(memoryQueue_io_enq_ready),
		.io_enq_valid(memoryQueue_io_enq_valid),
		.io_enq_bits(memoryQueue_io_enq_bits),
		.io_deq_ready(memoryQueue_io_deq_ready),
		.io_deq_valid(memoryQueue_io_deq_valid),
		.io_deq_bits(memoryQueue_io_deq_bits),
		.io_count(memoryQueue_io_count)
	);
	Queue_5 buffer(
		.clk(buffer_clock),
		.rst(buffer_reset),
		.io_enq_ready(buffer_io_enq_ready),
		.io_enq_valid(buffer_io_enq_valid),
		.io_enq_bits(buffer_io_enq_bits),
		.io_deq_ready(buffer_io_deq_ready),
		.io_deq_valid(buffer_io_deq_valid),
		.io_deq_bits(buffer_io_deq_bits)
	);
	assign io_enq_ready = countNext != 10'h200;
	assign io_deq_valid = countNext != 10'h000;
	assign io_deq_bits = buffer_io_deq_bits;
	assign memoryQueue_clock = clk;
	assign memoryQueue_reset = rst;
	assign memoryQueue_io_enq_valid = _memoryQueue_io_enq_valid_T & (~buffer_io_enq_ready | memoryQueueHasValues);
	assign memoryQueue_io_enq_bits = io_enq_bits;
	assign memoryQueue_io_deq_ready = buffer_io_enq_ready;
	assign buffer_clock = clk;
	assign buffer_reset = rst;
	assign buffer_io_enq_valid = (memoryQueueHasValues ? memoryQueue_io_deq_valid : io_enq_valid);
	assign buffer_io_enq_bits = (memoryQueueHasValues ? memoryQueue_io_deq_bits : io_enq_bits);
	assign buffer_io_deq_ready = io_deq_ready;
	always @(posedge clk) begin
		if (rst)
			countNext <= 10'h000;
		else if (_countNext_T_2) begin
			if (_memoryQueue_io_enq_valid_T & ~_countNext_T_1)
				countNext <= _count_T_1;
			else if (~_memoryQueue_io_enq_valid_T & _countNext_T_1)
				countNext <= _count_T_3;
		end
		if ((_T_3 & ~rst) & ~(countNext < 10'h200))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:192 assert(countNext < entries.U)\n");
		if (((~_T_3 & _T_11) & _T_6) & ~(countNext > 10'h000))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:195 assert(countNext > 0.U)\n");
		if (_T_6 & ~(io_deq_valid == buffer_io_deq_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:204 assert(io.deq.valid === buffer.io.deq.valid)\n");
		if (_T_6 & ~((io_enq_ready == buffer_io_enq_ready) | memoryQueue_io_enq_ready))
			$fwrite(32'h80000002, "Assertion failed\n    at SyncQueue.scala:205 assert(io.enq.ready === buffer.io.enq.ready || memoryQueue.io.enq.ready)\n");
	end
	always @(posedge clk) begin
		if (_T_3 & ~rst)
			;
		if ((~_T_3 & _T_11) & _T_6)
			;
		if (_T_6)
			;
		if (_T_6)
			;
	end
endmodule
module SyncQueue2PortMem_1 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	wire queue_clock;
	wire queue_reset;
	wire queue_io_enq_ready;
	wire queue_io_enq_valid;
	wire [127:0] queue_io_enq_bits;
	wire queue_io_deq_ready;
	wire queue_io_deq_valid;
	wire [127:0] queue_io_deq_bits;
	SyncQueue2PortMemImpl_1 queue(
		.clk(queue_clock),
		.rst(queue_reset),
		.io_enq_ready(queue_io_enq_ready),
		.io_enq_valid(queue_io_enq_valid),
		.io_enq_bits(queue_io_enq_bits),
		.io_deq_ready(queue_io_deq_ready),
		.io_deq_valid(queue_io_deq_valid),
		.io_deq_bits(queue_io_deq_bits)
	);
	assign io_enq_ready = queue_io_enq_ready;
	assign io_deq_valid = queue_io_deq_valid;
	assign io_deq_bits = queue_io_deq_bits;
	assign queue_clock = clk;
	assign queue_reset = rst;
	assign queue_io_enq_valid = io_enq_valid;
	assign queue_io_enq_bits = io_enq_bits;
	assign queue_io_deq_ready = io_deq_ready;
endmodule
module SyncQueue_1 (
	clk,
	rst,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits
);
	input clk;
	input rst;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits;
	wire queue_clock;
	wire queue_reset;
	wire queue_io_enq_ready;
	wire queue_io_enq_valid;
	wire [127:0] queue_io_enq_bits;
	wire queue_io_deq_ready;
	wire queue_io_deq_valid;
	wire [127:0] queue_io_deq_bits;
	SyncQueue2PortMem_1 queue(
		.clk(queue_clock),
		.rst(queue_reset),
		.io_enq_ready(queue_io_enq_ready),
		.io_enq_valid(queue_io_enq_valid),
		.io_enq_bits(queue_io_enq_bits),
		.io_deq_ready(queue_io_deq_ready),
		.io_deq_valid(queue_io_deq_valid),
		.io_deq_bits(queue_io_deq_bits)
	);
	assign io_enq_ready = queue_io_enq_ready;
	assign io_deq_valid = queue_io_deq_valid;
	assign io_deq_bits = queue_io_deq_bits;
	assign queue_clock = clk;
	assign queue_reset = rst;
	assign queue_io_enq_valid = io_enq_valid;
	assign queue_io_enq_bits = io_enq_bits;
	assign queue_io_deq_ready = io_deq_ready;
endmodule
module ComputeDecode (
	io_inst,
	io_push_next,
	io_push_prev,
	io_pop_next,
	io_pop_prev,
	io_isLoadAcc,
	io_isLoadUop,
	io_isSync,
	io_isAlu,
	io_isGemm,
	io_isFinish
);
	input [127:0] io_inst;
	output wire io_push_next;
	output wire io_push_prev;
	output wire io_pop_next;
	output wire io_pop_prev;
	output wire io_isLoadAcc;
	output wire io_isLoadUop;
	output wire io_isSync;
	output wire io_isAlu;
	output wire io_isGemm;
	output wire io_isFinish;
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [127:0] _io_isLoadAcc_T = io_inst & 128'h00000000000000000000000000000387;
	wire _io_isLoadAcc_T_1 = 128'h00000000000000000000000000000180 == _io_isLoadAcc_T;
	wire _io_isLoadAcc_T_2 = dec_xsize != 16'h0000;
	wire _io_isLoadUop_T_1 = 128'h00000000000000000000000000000000 == _io_isLoadAcc_T;
	wire [127:0] _io_isAlu_T = io_inst & 128'h00007000000000000000000000000007;
	wire [127:0] _io_isGemm_T = io_inst & 128'h00000000000000000000000000000007;
	assign io_push_next = io_inst[6];
	assign io_push_prev = io_inst[5];
	assign io_pop_next = io_inst[4];
	assign io_pop_prev = io_inst[3];
	assign io_isLoadAcc = (128'h00000000000000000000000000000180 == _io_isLoadAcc_T) & (dec_xsize != 16'h0000);
	assign io_isLoadUop = (128'h00000000000000000000000000000000 == _io_isLoadAcc_T) & _io_isLoadAcc_T_2;
	assign io_isSync = (_io_isLoadAcc_T_1 | _io_isLoadUop_T_1) & (dec_xsize == 16'h0000);
	assign io_isAlu = (((128'h00000000000000000000000000000004 == _io_isAlu_T) | (128'h00001000000000000000000000000004 == _io_isAlu_T)) | (128'h00002000000000000000000000000004 == _io_isAlu_T)) | (128'h00003000000000000000000000000004 == _io_isAlu_T);
	assign io_isGemm = 128'h00000000000000000000000000000002 == _io_isGemm_T;
	assign io_isFinish = 128'h00000000000000000000000000000003 == _io_isGemm_T;
endmodule
module Compute (
	clk,
	rst,
	io_i_post_0,
	io_i_post_1,
	io_o_post_0,
	io_o_post_1,
	io_inst_ready,
	io_inst_valid,
	io_inst_bits,
	io_uop_baddr,
	io_acc_baddr,
	io_vme_rd_0_cmd_ready,
	io_vme_rd_0_cmd_valid,
	io_vme_rd_0_cmd_bits_addr,
	io_vme_rd_0_cmd_bits_len,
	io_vme_rd_0_cmd_bits_tag,
	io_vme_rd_0_data_valid,
	io_vme_rd_0_data_bits_data,
	io_vme_rd_0_data_bits_tag,
	io_vme_rd_0_data_bits_last,
	io_vme_rd_1_cmd_ready,
	io_vme_rd_1_cmd_valid,
	io_vme_rd_1_cmd_bits_addr,
	io_vme_rd_1_cmd_bits_len,
	io_vme_rd_1_cmd_bits_tag,
	io_vme_rd_1_data_valid,
	io_vme_rd_1_data_bits_data,
	io_vme_rd_1_data_bits_tag,
	io_inp_rd_0_idx_valid,
	io_inp_rd_0_idx_bits,
	io_inp_rd_0_data_valid,
	io_inp_rd_0_data_bits_0_0,
	io_inp_rd_0_data_bits_0_1,
	io_inp_rd_0_data_bits_0_2,
	io_inp_rd_0_data_bits_0_3,
	io_inp_rd_0_data_bits_0_4,
	io_inp_rd_0_data_bits_0_5,
	io_inp_rd_0_data_bits_0_6,
	io_inp_rd_0_data_bits_0_7,
	io_inp_rd_0_data_bits_0_8,
	io_inp_rd_0_data_bits_0_9,
	io_inp_rd_0_data_bits_0_10,
	io_inp_rd_0_data_bits_0_11,
	io_inp_rd_0_data_bits_0_12,
	io_inp_rd_0_data_bits_0_13,
	io_inp_rd_0_data_bits_0_14,
	io_inp_rd_0_data_bits_0_15,
	io_wgt_rd_0_idx_valid,
	io_wgt_rd_0_idx_bits,
	io_wgt_rd_0_data_valid,
	io_wgt_rd_0_data_bits_0_0,
	io_wgt_rd_0_data_bits_0_1,
	io_wgt_rd_0_data_bits_0_2,
	io_wgt_rd_0_data_bits_0_3,
	io_wgt_rd_0_data_bits_0_4,
	io_wgt_rd_0_data_bits_0_5,
	io_wgt_rd_0_data_bits_0_6,
	io_wgt_rd_0_data_bits_0_7,
	io_wgt_rd_0_data_bits_0_8,
	io_wgt_rd_0_data_bits_0_9,
	io_wgt_rd_0_data_bits_0_10,
	io_wgt_rd_0_data_bits_0_11,
	io_wgt_rd_0_data_bits_0_12,
	io_wgt_rd_0_data_bits_0_13,
	io_wgt_rd_0_data_bits_0_14,
	io_wgt_rd_0_data_bits_0_15,
	io_wgt_rd_0_data_bits_1_0,
	io_wgt_rd_0_data_bits_1_1,
	io_wgt_rd_0_data_bits_1_2,
	io_wgt_rd_0_data_bits_1_3,
	io_wgt_rd_0_data_bits_1_4,
	io_wgt_rd_0_data_bits_1_5,
	io_wgt_rd_0_data_bits_1_6,
	io_wgt_rd_0_data_bits_1_7,
	io_wgt_rd_0_data_bits_1_8,
	io_wgt_rd_0_data_bits_1_9,
	io_wgt_rd_0_data_bits_1_10,
	io_wgt_rd_0_data_bits_1_11,
	io_wgt_rd_0_data_bits_1_12,
	io_wgt_rd_0_data_bits_1_13,
	io_wgt_rd_0_data_bits_1_14,
	io_wgt_rd_0_data_bits_1_15,
	io_wgt_rd_0_data_bits_2_0,
	io_wgt_rd_0_data_bits_2_1,
	io_wgt_rd_0_data_bits_2_2,
	io_wgt_rd_0_data_bits_2_3,
	io_wgt_rd_0_data_bits_2_4,
	io_wgt_rd_0_data_bits_2_5,
	io_wgt_rd_0_data_bits_2_6,
	io_wgt_rd_0_data_bits_2_7,
	io_wgt_rd_0_data_bits_2_8,
	io_wgt_rd_0_data_bits_2_9,
	io_wgt_rd_0_data_bits_2_10,
	io_wgt_rd_0_data_bits_2_11,
	io_wgt_rd_0_data_bits_2_12,
	io_wgt_rd_0_data_bits_2_13,
	io_wgt_rd_0_data_bits_2_14,
	io_wgt_rd_0_data_bits_2_15,
	io_wgt_rd_0_data_bits_3_0,
	io_wgt_rd_0_data_bits_3_1,
	io_wgt_rd_0_data_bits_3_2,
	io_wgt_rd_0_data_bits_3_3,
	io_wgt_rd_0_data_bits_3_4,
	io_wgt_rd_0_data_bits_3_5,
	io_wgt_rd_0_data_bits_3_6,
	io_wgt_rd_0_data_bits_3_7,
	io_wgt_rd_0_data_bits_3_8,
	io_wgt_rd_0_data_bits_3_9,
	io_wgt_rd_0_data_bits_3_10,
	io_wgt_rd_0_data_bits_3_11,
	io_wgt_rd_0_data_bits_3_12,
	io_wgt_rd_0_data_bits_3_13,
	io_wgt_rd_0_data_bits_3_14,
	io_wgt_rd_0_data_bits_3_15,
	io_wgt_rd_0_data_bits_4_0,
	io_wgt_rd_0_data_bits_4_1,
	io_wgt_rd_0_data_bits_4_2,
	io_wgt_rd_0_data_bits_4_3,
	io_wgt_rd_0_data_bits_4_4,
	io_wgt_rd_0_data_bits_4_5,
	io_wgt_rd_0_data_bits_4_6,
	io_wgt_rd_0_data_bits_4_7,
	io_wgt_rd_0_data_bits_4_8,
	io_wgt_rd_0_data_bits_4_9,
	io_wgt_rd_0_data_bits_4_10,
	io_wgt_rd_0_data_bits_4_11,
	io_wgt_rd_0_data_bits_4_12,
	io_wgt_rd_0_data_bits_4_13,
	io_wgt_rd_0_data_bits_4_14,
	io_wgt_rd_0_data_bits_4_15,
	io_wgt_rd_0_data_bits_5_0,
	io_wgt_rd_0_data_bits_5_1,
	io_wgt_rd_0_data_bits_5_2,
	io_wgt_rd_0_data_bits_5_3,
	io_wgt_rd_0_data_bits_5_4,
	io_wgt_rd_0_data_bits_5_5,
	io_wgt_rd_0_data_bits_5_6,
	io_wgt_rd_0_data_bits_5_7,
	io_wgt_rd_0_data_bits_5_8,
	io_wgt_rd_0_data_bits_5_9,
	io_wgt_rd_0_data_bits_5_10,
	io_wgt_rd_0_data_bits_5_11,
	io_wgt_rd_0_data_bits_5_12,
	io_wgt_rd_0_data_bits_5_13,
	io_wgt_rd_0_data_bits_5_14,
	io_wgt_rd_0_data_bits_5_15,
	io_wgt_rd_0_data_bits_6_0,
	io_wgt_rd_0_data_bits_6_1,
	io_wgt_rd_0_data_bits_6_2,
	io_wgt_rd_0_data_bits_6_3,
	io_wgt_rd_0_data_bits_6_4,
	io_wgt_rd_0_data_bits_6_5,
	io_wgt_rd_0_data_bits_6_6,
	io_wgt_rd_0_data_bits_6_7,
	io_wgt_rd_0_data_bits_6_8,
	io_wgt_rd_0_data_bits_6_9,
	io_wgt_rd_0_data_bits_6_10,
	io_wgt_rd_0_data_bits_6_11,
	io_wgt_rd_0_data_bits_6_12,
	io_wgt_rd_0_data_bits_6_13,
	io_wgt_rd_0_data_bits_6_14,
	io_wgt_rd_0_data_bits_6_15,
	io_wgt_rd_0_data_bits_7_0,
	io_wgt_rd_0_data_bits_7_1,
	io_wgt_rd_0_data_bits_7_2,
	io_wgt_rd_0_data_bits_7_3,
	io_wgt_rd_0_data_bits_7_4,
	io_wgt_rd_0_data_bits_7_5,
	io_wgt_rd_0_data_bits_7_6,
	io_wgt_rd_0_data_bits_7_7,
	io_wgt_rd_0_data_bits_7_8,
	io_wgt_rd_0_data_bits_7_9,
	io_wgt_rd_0_data_bits_7_10,
	io_wgt_rd_0_data_bits_7_11,
	io_wgt_rd_0_data_bits_7_12,
	io_wgt_rd_0_data_bits_7_13,
	io_wgt_rd_0_data_bits_7_14,
	io_wgt_rd_0_data_bits_7_15,
	io_wgt_rd_0_data_bits_8_0,
	io_wgt_rd_0_data_bits_8_1,
	io_wgt_rd_0_data_bits_8_2,
	io_wgt_rd_0_data_bits_8_3,
	io_wgt_rd_0_data_bits_8_4,
	io_wgt_rd_0_data_bits_8_5,
	io_wgt_rd_0_data_bits_8_6,
	io_wgt_rd_0_data_bits_8_7,
	io_wgt_rd_0_data_bits_8_8,
	io_wgt_rd_0_data_bits_8_9,
	io_wgt_rd_0_data_bits_8_10,
	io_wgt_rd_0_data_bits_8_11,
	io_wgt_rd_0_data_bits_8_12,
	io_wgt_rd_0_data_bits_8_13,
	io_wgt_rd_0_data_bits_8_14,
	io_wgt_rd_0_data_bits_8_15,
	io_wgt_rd_0_data_bits_9_0,
	io_wgt_rd_0_data_bits_9_1,
	io_wgt_rd_0_data_bits_9_2,
	io_wgt_rd_0_data_bits_9_3,
	io_wgt_rd_0_data_bits_9_4,
	io_wgt_rd_0_data_bits_9_5,
	io_wgt_rd_0_data_bits_9_6,
	io_wgt_rd_0_data_bits_9_7,
	io_wgt_rd_0_data_bits_9_8,
	io_wgt_rd_0_data_bits_9_9,
	io_wgt_rd_0_data_bits_9_10,
	io_wgt_rd_0_data_bits_9_11,
	io_wgt_rd_0_data_bits_9_12,
	io_wgt_rd_0_data_bits_9_13,
	io_wgt_rd_0_data_bits_9_14,
	io_wgt_rd_0_data_bits_9_15,
	io_wgt_rd_0_data_bits_10_0,
	io_wgt_rd_0_data_bits_10_1,
	io_wgt_rd_0_data_bits_10_2,
	io_wgt_rd_0_data_bits_10_3,
	io_wgt_rd_0_data_bits_10_4,
	io_wgt_rd_0_data_bits_10_5,
	io_wgt_rd_0_data_bits_10_6,
	io_wgt_rd_0_data_bits_10_7,
	io_wgt_rd_0_data_bits_10_8,
	io_wgt_rd_0_data_bits_10_9,
	io_wgt_rd_0_data_bits_10_10,
	io_wgt_rd_0_data_bits_10_11,
	io_wgt_rd_0_data_bits_10_12,
	io_wgt_rd_0_data_bits_10_13,
	io_wgt_rd_0_data_bits_10_14,
	io_wgt_rd_0_data_bits_10_15,
	io_wgt_rd_0_data_bits_11_0,
	io_wgt_rd_0_data_bits_11_1,
	io_wgt_rd_0_data_bits_11_2,
	io_wgt_rd_0_data_bits_11_3,
	io_wgt_rd_0_data_bits_11_4,
	io_wgt_rd_0_data_bits_11_5,
	io_wgt_rd_0_data_bits_11_6,
	io_wgt_rd_0_data_bits_11_7,
	io_wgt_rd_0_data_bits_11_8,
	io_wgt_rd_0_data_bits_11_9,
	io_wgt_rd_0_data_bits_11_10,
	io_wgt_rd_0_data_bits_11_11,
	io_wgt_rd_0_data_bits_11_12,
	io_wgt_rd_0_data_bits_11_13,
	io_wgt_rd_0_data_bits_11_14,
	io_wgt_rd_0_data_bits_11_15,
	io_wgt_rd_0_data_bits_12_0,
	io_wgt_rd_0_data_bits_12_1,
	io_wgt_rd_0_data_bits_12_2,
	io_wgt_rd_0_data_bits_12_3,
	io_wgt_rd_0_data_bits_12_4,
	io_wgt_rd_0_data_bits_12_5,
	io_wgt_rd_0_data_bits_12_6,
	io_wgt_rd_0_data_bits_12_7,
	io_wgt_rd_0_data_bits_12_8,
	io_wgt_rd_0_data_bits_12_9,
	io_wgt_rd_0_data_bits_12_10,
	io_wgt_rd_0_data_bits_12_11,
	io_wgt_rd_0_data_bits_12_12,
	io_wgt_rd_0_data_bits_12_13,
	io_wgt_rd_0_data_bits_12_14,
	io_wgt_rd_0_data_bits_12_15,
	io_wgt_rd_0_data_bits_13_0,
	io_wgt_rd_0_data_bits_13_1,
	io_wgt_rd_0_data_bits_13_2,
	io_wgt_rd_0_data_bits_13_3,
	io_wgt_rd_0_data_bits_13_4,
	io_wgt_rd_0_data_bits_13_5,
	io_wgt_rd_0_data_bits_13_6,
	io_wgt_rd_0_data_bits_13_7,
	io_wgt_rd_0_data_bits_13_8,
	io_wgt_rd_0_data_bits_13_9,
	io_wgt_rd_0_data_bits_13_10,
	io_wgt_rd_0_data_bits_13_11,
	io_wgt_rd_0_data_bits_13_12,
	io_wgt_rd_0_data_bits_13_13,
	io_wgt_rd_0_data_bits_13_14,
	io_wgt_rd_0_data_bits_13_15,
	io_wgt_rd_0_data_bits_14_0,
	io_wgt_rd_0_data_bits_14_1,
	io_wgt_rd_0_data_bits_14_2,
	io_wgt_rd_0_data_bits_14_3,
	io_wgt_rd_0_data_bits_14_4,
	io_wgt_rd_0_data_bits_14_5,
	io_wgt_rd_0_data_bits_14_6,
	io_wgt_rd_0_data_bits_14_7,
	io_wgt_rd_0_data_bits_14_8,
	io_wgt_rd_0_data_bits_14_9,
	io_wgt_rd_0_data_bits_14_10,
	io_wgt_rd_0_data_bits_14_11,
	io_wgt_rd_0_data_bits_14_12,
	io_wgt_rd_0_data_bits_14_13,
	io_wgt_rd_0_data_bits_14_14,
	io_wgt_rd_0_data_bits_14_15,
	io_wgt_rd_0_data_bits_15_0,
	io_wgt_rd_0_data_bits_15_1,
	io_wgt_rd_0_data_bits_15_2,
	io_wgt_rd_0_data_bits_15_3,
	io_wgt_rd_0_data_bits_15_4,
	io_wgt_rd_0_data_bits_15_5,
	io_wgt_rd_0_data_bits_15_6,
	io_wgt_rd_0_data_bits_15_7,
	io_wgt_rd_0_data_bits_15_8,
	io_wgt_rd_0_data_bits_15_9,
	io_wgt_rd_0_data_bits_15_10,
	io_wgt_rd_0_data_bits_15_11,
	io_wgt_rd_0_data_bits_15_12,
	io_wgt_rd_0_data_bits_15_13,
	io_wgt_rd_0_data_bits_15_14,
	io_wgt_rd_0_data_bits_15_15,
	io_out_wr_0_valid,
	io_out_wr_0_bits_idx,
	io_out_wr_0_bits_data_0_0,
	io_out_wr_0_bits_data_0_1,
	io_out_wr_0_bits_data_0_2,
	io_out_wr_0_bits_data_0_3,
	io_out_wr_0_bits_data_0_4,
	io_out_wr_0_bits_data_0_5,
	io_out_wr_0_bits_data_0_6,
	io_out_wr_0_bits_data_0_7,
	io_out_wr_0_bits_data_0_8,
	io_out_wr_0_bits_data_0_9,
	io_out_wr_0_bits_data_0_10,
	io_out_wr_0_bits_data_0_11,
	io_out_wr_0_bits_data_0_12,
	io_out_wr_0_bits_data_0_13,
	io_out_wr_0_bits_data_0_14,
	io_out_wr_0_bits_data_0_15,
	io_finish,
	io_acc_wr_event
);
	input clk;
	input rst;
	input io_i_post_0;
	input io_i_post_1;
	output wire io_o_post_0;
	output wire io_o_post_1;
	output wire io_inst_ready;
	input io_inst_valid;
	input [127:0] io_inst_bits;
	input [63:0] io_uop_baddr;
	input [63:0] io_acc_baddr;
	input io_vme_rd_0_cmd_ready;
	output wire io_vme_rd_0_cmd_valid;
	output wire [63:0] io_vme_rd_0_cmd_bits_addr;
	output wire [7:0] io_vme_rd_0_cmd_bits_len;
	output wire [20:0] io_vme_rd_0_cmd_bits_tag;
	input io_vme_rd_0_data_valid;
	input [63:0] io_vme_rd_0_data_bits_data;
	input [20:0] io_vme_rd_0_data_bits_tag;
	input io_vme_rd_0_data_bits_last;
	input io_vme_rd_1_cmd_ready;
	output wire io_vme_rd_1_cmd_valid;
	output wire [63:0] io_vme_rd_1_cmd_bits_addr;
	output wire [7:0] io_vme_rd_1_cmd_bits_len;
	output wire [20:0] io_vme_rd_1_cmd_bits_tag;
	input io_vme_rd_1_data_valid;
	input [63:0] io_vme_rd_1_data_bits_data;
	input [20:0] io_vme_rd_1_data_bits_tag;
	output wire io_inp_rd_0_idx_valid;
	output wire [10:0] io_inp_rd_0_idx_bits;
	input io_inp_rd_0_data_valid;
	input [7:0] io_inp_rd_0_data_bits_0_0;
	input [7:0] io_inp_rd_0_data_bits_0_1;
	input [7:0] io_inp_rd_0_data_bits_0_2;
	input [7:0] io_inp_rd_0_data_bits_0_3;
	input [7:0] io_inp_rd_0_data_bits_0_4;
	input [7:0] io_inp_rd_0_data_bits_0_5;
	input [7:0] io_inp_rd_0_data_bits_0_6;
	input [7:0] io_inp_rd_0_data_bits_0_7;
	input [7:0] io_inp_rd_0_data_bits_0_8;
	input [7:0] io_inp_rd_0_data_bits_0_9;
	input [7:0] io_inp_rd_0_data_bits_0_10;
	input [7:0] io_inp_rd_0_data_bits_0_11;
	input [7:0] io_inp_rd_0_data_bits_0_12;
	input [7:0] io_inp_rd_0_data_bits_0_13;
	input [7:0] io_inp_rd_0_data_bits_0_14;
	input [7:0] io_inp_rd_0_data_bits_0_15;
	output wire io_wgt_rd_0_idx_valid;
	output wire [9:0] io_wgt_rd_0_idx_bits;
	input io_wgt_rd_0_data_valid;
	input [7:0] io_wgt_rd_0_data_bits_0_0;
	input [7:0] io_wgt_rd_0_data_bits_0_1;
	input [7:0] io_wgt_rd_0_data_bits_0_2;
	input [7:0] io_wgt_rd_0_data_bits_0_3;
	input [7:0] io_wgt_rd_0_data_bits_0_4;
	input [7:0] io_wgt_rd_0_data_bits_0_5;
	input [7:0] io_wgt_rd_0_data_bits_0_6;
	input [7:0] io_wgt_rd_0_data_bits_0_7;
	input [7:0] io_wgt_rd_0_data_bits_0_8;
	input [7:0] io_wgt_rd_0_data_bits_0_9;
	input [7:0] io_wgt_rd_0_data_bits_0_10;
	input [7:0] io_wgt_rd_0_data_bits_0_11;
	input [7:0] io_wgt_rd_0_data_bits_0_12;
	input [7:0] io_wgt_rd_0_data_bits_0_13;
	input [7:0] io_wgt_rd_0_data_bits_0_14;
	input [7:0] io_wgt_rd_0_data_bits_0_15;
	input [7:0] io_wgt_rd_0_data_bits_1_0;
	input [7:0] io_wgt_rd_0_data_bits_1_1;
	input [7:0] io_wgt_rd_0_data_bits_1_2;
	input [7:0] io_wgt_rd_0_data_bits_1_3;
	input [7:0] io_wgt_rd_0_data_bits_1_4;
	input [7:0] io_wgt_rd_0_data_bits_1_5;
	input [7:0] io_wgt_rd_0_data_bits_1_6;
	input [7:0] io_wgt_rd_0_data_bits_1_7;
	input [7:0] io_wgt_rd_0_data_bits_1_8;
	input [7:0] io_wgt_rd_0_data_bits_1_9;
	input [7:0] io_wgt_rd_0_data_bits_1_10;
	input [7:0] io_wgt_rd_0_data_bits_1_11;
	input [7:0] io_wgt_rd_0_data_bits_1_12;
	input [7:0] io_wgt_rd_0_data_bits_1_13;
	input [7:0] io_wgt_rd_0_data_bits_1_14;
	input [7:0] io_wgt_rd_0_data_bits_1_15;
	input [7:0] io_wgt_rd_0_data_bits_2_0;
	input [7:0] io_wgt_rd_0_data_bits_2_1;
	input [7:0] io_wgt_rd_0_data_bits_2_2;
	input [7:0] io_wgt_rd_0_data_bits_2_3;
	input [7:0] io_wgt_rd_0_data_bits_2_4;
	input [7:0] io_wgt_rd_0_data_bits_2_5;
	input [7:0] io_wgt_rd_0_data_bits_2_6;
	input [7:0] io_wgt_rd_0_data_bits_2_7;
	input [7:0] io_wgt_rd_0_data_bits_2_8;
	input [7:0] io_wgt_rd_0_data_bits_2_9;
	input [7:0] io_wgt_rd_0_data_bits_2_10;
	input [7:0] io_wgt_rd_0_data_bits_2_11;
	input [7:0] io_wgt_rd_0_data_bits_2_12;
	input [7:0] io_wgt_rd_0_data_bits_2_13;
	input [7:0] io_wgt_rd_0_data_bits_2_14;
	input [7:0] io_wgt_rd_0_data_bits_2_15;
	input [7:0] io_wgt_rd_0_data_bits_3_0;
	input [7:0] io_wgt_rd_0_data_bits_3_1;
	input [7:0] io_wgt_rd_0_data_bits_3_2;
	input [7:0] io_wgt_rd_0_data_bits_3_3;
	input [7:0] io_wgt_rd_0_data_bits_3_4;
	input [7:0] io_wgt_rd_0_data_bits_3_5;
	input [7:0] io_wgt_rd_0_data_bits_3_6;
	input [7:0] io_wgt_rd_0_data_bits_3_7;
	input [7:0] io_wgt_rd_0_data_bits_3_8;
	input [7:0] io_wgt_rd_0_data_bits_3_9;
	input [7:0] io_wgt_rd_0_data_bits_3_10;
	input [7:0] io_wgt_rd_0_data_bits_3_11;
	input [7:0] io_wgt_rd_0_data_bits_3_12;
	input [7:0] io_wgt_rd_0_data_bits_3_13;
	input [7:0] io_wgt_rd_0_data_bits_3_14;
	input [7:0] io_wgt_rd_0_data_bits_3_15;
	input [7:0] io_wgt_rd_0_data_bits_4_0;
	input [7:0] io_wgt_rd_0_data_bits_4_1;
	input [7:0] io_wgt_rd_0_data_bits_4_2;
	input [7:0] io_wgt_rd_0_data_bits_4_3;
	input [7:0] io_wgt_rd_0_data_bits_4_4;
	input [7:0] io_wgt_rd_0_data_bits_4_5;
	input [7:0] io_wgt_rd_0_data_bits_4_6;
	input [7:0] io_wgt_rd_0_data_bits_4_7;
	input [7:0] io_wgt_rd_0_data_bits_4_8;
	input [7:0] io_wgt_rd_0_data_bits_4_9;
	input [7:0] io_wgt_rd_0_data_bits_4_10;
	input [7:0] io_wgt_rd_0_data_bits_4_11;
	input [7:0] io_wgt_rd_0_data_bits_4_12;
	input [7:0] io_wgt_rd_0_data_bits_4_13;
	input [7:0] io_wgt_rd_0_data_bits_4_14;
	input [7:0] io_wgt_rd_0_data_bits_4_15;
	input [7:0] io_wgt_rd_0_data_bits_5_0;
	input [7:0] io_wgt_rd_0_data_bits_5_1;
	input [7:0] io_wgt_rd_0_data_bits_5_2;
	input [7:0] io_wgt_rd_0_data_bits_5_3;
	input [7:0] io_wgt_rd_0_data_bits_5_4;
	input [7:0] io_wgt_rd_0_data_bits_5_5;
	input [7:0] io_wgt_rd_0_data_bits_5_6;
	input [7:0] io_wgt_rd_0_data_bits_5_7;
	input [7:0] io_wgt_rd_0_data_bits_5_8;
	input [7:0] io_wgt_rd_0_data_bits_5_9;
	input [7:0] io_wgt_rd_0_data_bits_5_10;
	input [7:0] io_wgt_rd_0_data_bits_5_11;
	input [7:0] io_wgt_rd_0_data_bits_5_12;
	input [7:0] io_wgt_rd_0_data_bits_5_13;
	input [7:0] io_wgt_rd_0_data_bits_5_14;
	input [7:0] io_wgt_rd_0_data_bits_5_15;
	input [7:0] io_wgt_rd_0_data_bits_6_0;
	input [7:0] io_wgt_rd_0_data_bits_6_1;
	input [7:0] io_wgt_rd_0_data_bits_6_2;
	input [7:0] io_wgt_rd_0_data_bits_6_3;
	input [7:0] io_wgt_rd_0_data_bits_6_4;
	input [7:0] io_wgt_rd_0_data_bits_6_5;
	input [7:0] io_wgt_rd_0_data_bits_6_6;
	input [7:0] io_wgt_rd_0_data_bits_6_7;
	input [7:0] io_wgt_rd_0_data_bits_6_8;
	input [7:0] io_wgt_rd_0_data_bits_6_9;
	input [7:0] io_wgt_rd_0_data_bits_6_10;
	input [7:0] io_wgt_rd_0_data_bits_6_11;
	input [7:0] io_wgt_rd_0_data_bits_6_12;
	input [7:0] io_wgt_rd_0_data_bits_6_13;
	input [7:0] io_wgt_rd_0_data_bits_6_14;
	input [7:0] io_wgt_rd_0_data_bits_6_15;
	input [7:0] io_wgt_rd_0_data_bits_7_0;
	input [7:0] io_wgt_rd_0_data_bits_7_1;
	input [7:0] io_wgt_rd_0_data_bits_7_2;
	input [7:0] io_wgt_rd_0_data_bits_7_3;
	input [7:0] io_wgt_rd_0_data_bits_7_4;
	input [7:0] io_wgt_rd_0_data_bits_7_5;
	input [7:0] io_wgt_rd_0_data_bits_7_6;
	input [7:0] io_wgt_rd_0_data_bits_7_7;
	input [7:0] io_wgt_rd_0_data_bits_7_8;
	input [7:0] io_wgt_rd_0_data_bits_7_9;
	input [7:0] io_wgt_rd_0_data_bits_7_10;
	input [7:0] io_wgt_rd_0_data_bits_7_11;
	input [7:0] io_wgt_rd_0_data_bits_7_12;
	input [7:0] io_wgt_rd_0_data_bits_7_13;
	input [7:0] io_wgt_rd_0_data_bits_7_14;
	input [7:0] io_wgt_rd_0_data_bits_7_15;
	input [7:0] io_wgt_rd_0_data_bits_8_0;
	input [7:0] io_wgt_rd_0_data_bits_8_1;
	input [7:0] io_wgt_rd_0_data_bits_8_2;
	input [7:0] io_wgt_rd_0_data_bits_8_3;
	input [7:0] io_wgt_rd_0_data_bits_8_4;
	input [7:0] io_wgt_rd_0_data_bits_8_5;
	input [7:0] io_wgt_rd_0_data_bits_8_6;
	input [7:0] io_wgt_rd_0_data_bits_8_7;
	input [7:0] io_wgt_rd_0_data_bits_8_8;
	input [7:0] io_wgt_rd_0_data_bits_8_9;
	input [7:0] io_wgt_rd_0_data_bits_8_10;
	input [7:0] io_wgt_rd_0_data_bits_8_11;
	input [7:0] io_wgt_rd_0_data_bits_8_12;
	input [7:0] io_wgt_rd_0_data_bits_8_13;
	input [7:0] io_wgt_rd_0_data_bits_8_14;
	input [7:0] io_wgt_rd_0_data_bits_8_15;
	input [7:0] io_wgt_rd_0_data_bits_9_0;
	input [7:0] io_wgt_rd_0_data_bits_9_1;
	input [7:0] io_wgt_rd_0_data_bits_9_2;
	input [7:0] io_wgt_rd_0_data_bits_9_3;
	input [7:0] io_wgt_rd_0_data_bits_9_4;
	input [7:0] io_wgt_rd_0_data_bits_9_5;
	input [7:0] io_wgt_rd_0_data_bits_9_6;
	input [7:0] io_wgt_rd_0_data_bits_9_7;
	input [7:0] io_wgt_rd_0_data_bits_9_8;
	input [7:0] io_wgt_rd_0_data_bits_9_9;
	input [7:0] io_wgt_rd_0_data_bits_9_10;
	input [7:0] io_wgt_rd_0_data_bits_9_11;
	input [7:0] io_wgt_rd_0_data_bits_9_12;
	input [7:0] io_wgt_rd_0_data_bits_9_13;
	input [7:0] io_wgt_rd_0_data_bits_9_14;
	input [7:0] io_wgt_rd_0_data_bits_9_15;
	input [7:0] io_wgt_rd_0_data_bits_10_0;
	input [7:0] io_wgt_rd_0_data_bits_10_1;
	input [7:0] io_wgt_rd_0_data_bits_10_2;
	input [7:0] io_wgt_rd_0_data_bits_10_3;
	input [7:0] io_wgt_rd_0_data_bits_10_4;
	input [7:0] io_wgt_rd_0_data_bits_10_5;
	input [7:0] io_wgt_rd_0_data_bits_10_6;
	input [7:0] io_wgt_rd_0_data_bits_10_7;
	input [7:0] io_wgt_rd_0_data_bits_10_8;
	input [7:0] io_wgt_rd_0_data_bits_10_9;
	input [7:0] io_wgt_rd_0_data_bits_10_10;
	input [7:0] io_wgt_rd_0_data_bits_10_11;
	input [7:0] io_wgt_rd_0_data_bits_10_12;
	input [7:0] io_wgt_rd_0_data_bits_10_13;
	input [7:0] io_wgt_rd_0_data_bits_10_14;
	input [7:0] io_wgt_rd_0_data_bits_10_15;
	input [7:0] io_wgt_rd_0_data_bits_11_0;
	input [7:0] io_wgt_rd_0_data_bits_11_1;
	input [7:0] io_wgt_rd_0_data_bits_11_2;
	input [7:0] io_wgt_rd_0_data_bits_11_3;
	input [7:0] io_wgt_rd_0_data_bits_11_4;
	input [7:0] io_wgt_rd_0_data_bits_11_5;
	input [7:0] io_wgt_rd_0_data_bits_11_6;
	input [7:0] io_wgt_rd_0_data_bits_11_7;
	input [7:0] io_wgt_rd_0_data_bits_11_8;
	input [7:0] io_wgt_rd_0_data_bits_11_9;
	input [7:0] io_wgt_rd_0_data_bits_11_10;
	input [7:0] io_wgt_rd_0_data_bits_11_11;
	input [7:0] io_wgt_rd_0_data_bits_11_12;
	input [7:0] io_wgt_rd_0_data_bits_11_13;
	input [7:0] io_wgt_rd_0_data_bits_11_14;
	input [7:0] io_wgt_rd_0_data_bits_11_15;
	input [7:0] io_wgt_rd_0_data_bits_12_0;
	input [7:0] io_wgt_rd_0_data_bits_12_1;
	input [7:0] io_wgt_rd_0_data_bits_12_2;
	input [7:0] io_wgt_rd_0_data_bits_12_3;
	input [7:0] io_wgt_rd_0_data_bits_12_4;
	input [7:0] io_wgt_rd_0_data_bits_12_5;
	input [7:0] io_wgt_rd_0_data_bits_12_6;
	input [7:0] io_wgt_rd_0_data_bits_12_7;
	input [7:0] io_wgt_rd_0_data_bits_12_8;
	input [7:0] io_wgt_rd_0_data_bits_12_9;
	input [7:0] io_wgt_rd_0_data_bits_12_10;
	input [7:0] io_wgt_rd_0_data_bits_12_11;
	input [7:0] io_wgt_rd_0_data_bits_12_12;
	input [7:0] io_wgt_rd_0_data_bits_12_13;
	input [7:0] io_wgt_rd_0_data_bits_12_14;
	input [7:0] io_wgt_rd_0_data_bits_12_15;
	input [7:0] io_wgt_rd_0_data_bits_13_0;
	input [7:0] io_wgt_rd_0_data_bits_13_1;
	input [7:0] io_wgt_rd_0_data_bits_13_2;
	input [7:0] io_wgt_rd_0_data_bits_13_3;
	input [7:0] io_wgt_rd_0_data_bits_13_4;
	input [7:0] io_wgt_rd_0_data_bits_13_5;
	input [7:0] io_wgt_rd_0_data_bits_13_6;
	input [7:0] io_wgt_rd_0_data_bits_13_7;
	input [7:0] io_wgt_rd_0_data_bits_13_8;
	input [7:0] io_wgt_rd_0_data_bits_13_9;
	input [7:0] io_wgt_rd_0_data_bits_13_10;
	input [7:0] io_wgt_rd_0_data_bits_13_11;
	input [7:0] io_wgt_rd_0_data_bits_13_12;
	input [7:0] io_wgt_rd_0_data_bits_13_13;
	input [7:0] io_wgt_rd_0_data_bits_13_14;
	input [7:0] io_wgt_rd_0_data_bits_13_15;
	input [7:0] io_wgt_rd_0_data_bits_14_0;
	input [7:0] io_wgt_rd_0_data_bits_14_1;
	input [7:0] io_wgt_rd_0_data_bits_14_2;
	input [7:0] io_wgt_rd_0_data_bits_14_3;
	input [7:0] io_wgt_rd_0_data_bits_14_4;
	input [7:0] io_wgt_rd_0_data_bits_14_5;
	input [7:0] io_wgt_rd_0_data_bits_14_6;
	input [7:0] io_wgt_rd_0_data_bits_14_7;
	input [7:0] io_wgt_rd_0_data_bits_14_8;
	input [7:0] io_wgt_rd_0_data_bits_14_9;
	input [7:0] io_wgt_rd_0_data_bits_14_10;
	input [7:0] io_wgt_rd_0_data_bits_14_11;
	input [7:0] io_wgt_rd_0_data_bits_14_12;
	input [7:0] io_wgt_rd_0_data_bits_14_13;
	input [7:0] io_wgt_rd_0_data_bits_14_14;
	input [7:0] io_wgt_rd_0_data_bits_14_15;
	input [7:0] io_wgt_rd_0_data_bits_15_0;
	input [7:0] io_wgt_rd_0_data_bits_15_1;
	input [7:0] io_wgt_rd_0_data_bits_15_2;
	input [7:0] io_wgt_rd_0_data_bits_15_3;
	input [7:0] io_wgt_rd_0_data_bits_15_4;
	input [7:0] io_wgt_rd_0_data_bits_15_5;
	input [7:0] io_wgt_rd_0_data_bits_15_6;
	input [7:0] io_wgt_rd_0_data_bits_15_7;
	input [7:0] io_wgt_rd_0_data_bits_15_8;
	input [7:0] io_wgt_rd_0_data_bits_15_9;
	input [7:0] io_wgt_rd_0_data_bits_15_10;
	input [7:0] io_wgt_rd_0_data_bits_15_11;
	input [7:0] io_wgt_rd_0_data_bits_15_12;
	input [7:0] io_wgt_rd_0_data_bits_15_13;
	input [7:0] io_wgt_rd_0_data_bits_15_14;
	input [7:0] io_wgt_rd_0_data_bits_15_15;
	output wire io_out_wr_0_valid;
	output wire [10:0] io_out_wr_0_bits_idx;
	output wire [7:0] io_out_wr_0_bits_data_0_0;
	output wire [7:0] io_out_wr_0_bits_data_0_1;
	output wire [7:0] io_out_wr_0_bits_data_0_2;
	output wire [7:0] io_out_wr_0_bits_data_0_3;
	output wire [7:0] io_out_wr_0_bits_data_0_4;
	output wire [7:0] io_out_wr_0_bits_data_0_5;
	output wire [7:0] io_out_wr_0_bits_data_0_6;
	output wire [7:0] io_out_wr_0_bits_data_0_7;
	output wire [7:0] io_out_wr_0_bits_data_0_8;
	output wire [7:0] io_out_wr_0_bits_data_0_9;
	output wire [7:0] io_out_wr_0_bits_data_0_10;
	output wire [7:0] io_out_wr_0_bits_data_0_11;
	output wire [7:0] io_out_wr_0_bits_data_0_12;
	output wire [7:0] io_out_wr_0_bits_data_0_13;
	output wire [7:0] io_out_wr_0_bits_data_0_14;
	output wire [7:0] io_out_wr_0_bits_data_0_15;
	output wire io_finish;
	output wire io_acc_wr_event;
	wire s_0_clock;
	wire s_0_reset;
	wire s_0_io_spost;
	wire s_0_io_swait;
	wire s_0_io_sready;
	wire s_1_clock;
	wire s_1_reset;
	wire s_1_io_spost;
	wire s_1_io_swait;
	wire s_1_io_sready;
	wire loadUop_clock;
	wire loadUop_reset;
	wire loadUop_io_start;
	wire loadUop_io_done;
	wire [127:0] loadUop_io_inst;
	wire [63:0] loadUop_io_baddr;
	wire loadUop_io_vme_rd_cmd_ready;
	wire loadUop_io_vme_rd_cmd_valid;
	wire [63:0] loadUop_io_vme_rd_cmd_bits_addr;
	wire [7:0] loadUop_io_vme_rd_cmd_bits_len;
	wire [20:0] loadUop_io_vme_rd_cmd_bits_tag;
	wire loadUop_io_vme_rd_data_valid;
	wire [63:0] loadUop_io_vme_rd_data_bits_data;
	wire [20:0] loadUop_io_vme_rd_data_bits_tag;
	wire loadUop_io_vme_rd_data_bits_last;
	wire loadUop_io_uop_idx_valid;
	wire [10:0] loadUop_io_uop_idx_bits;
	wire loadUop_io_uop_data_valid;
	wire [9:0] loadUop_io_uop_data_bits_u2;
	wire [10:0] loadUop_io_uop_data_bits_u1;
	wire [10:0] loadUop_io_uop_data_bits_u0;
	wire tensorAcc_clock;
	wire tensorAcc_reset;
	wire tensorAcc_io_start;
	wire tensorAcc_io_done;
	wire [127:0] tensorAcc_io_inst;
	wire [63:0] tensorAcc_io_baddr;
	wire tensorAcc_io_vme_rd_cmd_ready;
	wire tensorAcc_io_vme_rd_cmd_valid;
	wire [63:0] tensorAcc_io_vme_rd_cmd_bits_addr;
	wire [7:0] tensorAcc_io_vme_rd_cmd_bits_len;
	wire [20:0] tensorAcc_io_vme_rd_cmd_bits_tag;
	wire tensorAcc_io_vme_rd_data_valid;
	wire [63:0] tensorAcc_io_vme_rd_data_bits_data;
	wire [20:0] tensorAcc_io_vme_rd_data_bits_tag;
	wire tensorAcc_io_tensor_rd_0_idx_valid;
	wire [10:0] tensorAcc_io_tensor_rd_0_idx_bits;
	wire tensorAcc_io_tensor_rd_0_data_valid;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_0;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_1;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_2;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_3;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_4;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_5;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_6;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_7;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_8;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_9;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_10;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_11;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_12;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_13;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_14;
	wire [31:0] tensorAcc_io_tensor_rd_0_data_bits_0_15;
	wire tensorAcc_io_tensor_wr_0_valid;
	wire [10:0] tensorAcc_io_tensor_wr_0_bits_idx;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_0;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_1;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_2;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_3;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_4;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_5;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_6;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_7;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_8;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_9;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_10;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_11;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_12;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_13;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_14;
	wire [31:0] tensorAcc_io_tensor_wr_0_bits_data_0_15;
	wire tensorGemm_clock;
	wire tensorGemm_reset;
	wire tensorGemm_io_start;
	wire tensorGemm_io_done;
	wire [9:0] tensorGemm_io_dec_wgt_1;
	wire [9:0] tensorGemm_io_dec_wgt_0;
	wire [10:0] tensorGemm_io_dec_inp_1;
	wire [10:0] tensorGemm_io_dec_inp_0;
	wire [10:0] tensorGemm_io_dec_acc_1;
	wire [10:0] tensorGemm_io_dec_acc_0;
	wire tensorGemm_io_dec_empty_0;
	wire [13:0] tensorGemm_io_dec_lp_1;
	wire [13:0] tensorGemm_io_dec_lp_0;
	wire [13:0] tensorGemm_io_dec_uop_end;
	wire [12:0] tensorGemm_io_dec_uop_begin;
	wire tensorGemm_io_dec_reset;
	wire tensorGemm_io_dec_push_next;
	wire tensorGemm_io_dec_push_prev;
	wire tensorGemm_io_dec_pop_next;
	wire tensorGemm_io_dec_pop_prev;
	wire [2:0] tensorGemm_io_dec_op;
	wire tensorGemm_io_uop_idx_valid;
	wire [10:0] tensorGemm_io_uop_idx_bits;
	wire tensorGemm_io_uop_data_valid;
	wire [9:0] tensorGemm_io_uop_data_bits_u2;
	wire [10:0] tensorGemm_io_uop_data_bits_u1;
	wire [10:0] tensorGemm_io_uop_data_bits_u0;
	wire tensorGemm_io_inp_rd_0_idx_valid;
	wire [10:0] tensorGemm_io_inp_rd_0_idx_bits;
	wire tensorGemm_io_inp_rd_0_data_valid;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_0;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_1;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_2;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_3;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_4;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_5;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_6;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_7;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_8;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_9;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_10;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_11;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_12;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_13;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_14;
	wire [7:0] tensorGemm_io_inp_rd_0_data_bits_0_15;
	wire tensorGemm_io_wgt_rd_0_idx_valid;
	wire [9:0] tensorGemm_io_wgt_rd_0_idx_bits;
	wire tensorGemm_io_wgt_rd_0_data_valid;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_0_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_1_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_2_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_3_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_4_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_5_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_6_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_7_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_8_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_9_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_10_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_11_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_12_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_13_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_14_15;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_0;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_1;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_2;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_3;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_4;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_5;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_6;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_7;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_8;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_9;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_10;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_11;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_12;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_13;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_14;
	wire [7:0] tensorGemm_io_wgt_rd_0_data_bits_15_15;
	wire tensorGemm_io_acc_rd_0_idx_valid;
	wire [10:0] tensorGemm_io_acc_rd_0_idx_bits;
	wire tensorGemm_io_acc_rd_0_data_valid;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_0;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_1;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_2;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_3;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_4;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_5;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_6;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_7;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_8;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_9;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_10;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_11;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_12;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_13;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_14;
	wire [31:0] tensorGemm_io_acc_rd_0_data_bits_0_15;
	wire tensorGemm_io_acc_wr_0_valid;
	wire [10:0] tensorGemm_io_acc_wr_0_bits_idx;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_0;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_1;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_2;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_3;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_4;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_5;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_6;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_7;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_8;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_9;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_10;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_11;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_12;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_13;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_14;
	wire [31:0] tensorGemm_io_acc_wr_0_bits_data_0_15;
	wire tensorGemm_io_out_rd_0_data_valid;
	wire tensorGemm_io_out_wr_0_valid;
	wire [10:0] tensorGemm_io_out_wr_0_bits_idx;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_0;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_1;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_2;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_3;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_4;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_5;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_6;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_7;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_8;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_9;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_10;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_11;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_12;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_13;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_14;
	wire [7:0] tensorGemm_io_out_wr_0_bits_data_0_15;
	wire tensorAlu_clock;
	wire tensorAlu_reset;
	wire tensorAlu_io_start;
	wire tensorAlu_io_done;
	wire [15:0] tensorAlu_io_dec_alu_imm;
	wire tensorAlu_io_dec_alu_use_imm;
	wire [2:0] tensorAlu_io_dec_alu_op;
	wire [10:0] tensorAlu_io_dec_src_1;
	wire [10:0] tensorAlu_io_dec_src_0;
	wire [10:0] tensorAlu_io_dec_dst_1;
	wire [10:0] tensorAlu_io_dec_dst_0;
	wire [13:0] tensorAlu_io_dec_lp_1;
	wire [13:0] tensorAlu_io_dec_lp_0;
	wire [13:0] tensorAlu_io_dec_uop_end;
	wire [12:0] tensorAlu_io_dec_uop_begin;
	wire tensorAlu_io_uop_idx_valid;
	wire [10:0] tensorAlu_io_uop_idx_bits;
	wire [9:0] tensorAlu_io_uop_data_bits_u2;
	wire [10:0] tensorAlu_io_uop_data_bits_u1;
	wire [10:0] tensorAlu_io_uop_data_bits_u0;
	wire tensorAlu_io_acc_rd_0_idx_valid;
	wire [10:0] tensorAlu_io_acc_rd_0_idx_bits;
	wire tensorAlu_io_acc_rd_0_data_valid;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_0;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_1;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_2;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_3;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_4;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_5;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_6;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_7;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_8;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_9;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_10;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_11;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_12;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_13;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_14;
	wire [31:0] tensorAlu_io_acc_rd_0_data_bits_0_15;
	wire tensorAlu_io_acc_wr_0_valid;
	wire [10:0] tensorAlu_io_acc_wr_0_bits_idx;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_0;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_1;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_2;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_3;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_4;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_5;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_6;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_7;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_8;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_9;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_10;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_11;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_12;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_13;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_14;
	wire [31:0] tensorAlu_io_acc_wr_0_bits_data_0_15;
	wire tensorAlu_io_out_rd_0_data_valid;
	wire tensorAlu_io_out_wr_0_valid;
	wire [10:0] tensorAlu_io_out_wr_0_bits_idx;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_0;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_1;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_2;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_3;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_4;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_5;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_6;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_7;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_8;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_9;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_10;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_11;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_12;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_13;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_14;
	wire [7:0] tensorAlu_io_out_wr_0_bits_data_0_15;
	wire inst_q_clock;
	wire inst_q_reset;
	wire inst_q_io_enq_ready;
	wire inst_q_io_enq_valid;
	wire [127:0] inst_q_io_enq_bits;
	wire inst_q_io_deq_ready;
	wire inst_q_io_deq_valid;
	wire [127:0] inst_q_io_deq_bits;
	wire [127:0] dec_io_inst;
	wire dec_io_push_next;
	wire dec_io_push_prev;
	wire dec_io_pop_next;
	wire dec_io_pop_prev;
	wire dec_io_isLoadAcc;
	wire dec_io_isLoadUop;
	wire dec_io_isSync;
	wire dec_io_isAlu;
	wire dec_io_isGemm;
	wire dec_io_isFinish;
	reg [1:0] state;
	wire [4:0] inst_type = {dec_io_isFinish, dec_io_isAlu, dec_io_isGemm, dec_io_isLoadAcc, dec_io_isLoadUop};
	wire _sprev_T = (dec_io_pop_prev ? s_0_io_sready : 1'h1);
	wire sprev = inst_q_io_deq_valid & _sprev_T;
	wire _snext_T = (dec_io_pop_next ? s_1_io_sready : 1'h1);
	wire snext = inst_q_io_deq_valid & _snext_T;
	wire start = snext & sprev;
	wire _done_T_3 = (5'h02 == inst_type ? tensorAcc_io_done : (5'h01 == inst_type) & loadUop_io_done);
	wire _done_T_5 = (5'h04 == inst_type ? tensorGemm_io_done : _done_T_3);
	wire _done_T_7 = (5'h08 == inst_type ? tensorAlu_io_done : _done_T_5);
	wire done = (5'h10 == inst_type) | _done_T_7;
	wire [1:0] _GEN_0 = (|inst_type ? 2'h2 : state);
	wire [1:0] _GEN_3 = (done ? 2'h0 : state);
	wire _inst_q_io_deq_ready_T_1 = (state == 2'h2) & done;
	wire _inst_q_io_deq_ready_T_3 = ((state == 2'h2) & done) | (state == 2'h1);
	wire _loadUop_io_start_T_1 = (state == 2'h0) & start;
	wire _T_8 = ~rst;
	reg tensorAcc_io_tensor_rd_0_idx_REG;
	reg tensorAcc_io_tensor_wr_0_REG;
	reg tensorGemm_io_start_REG;
	wire [127:0] _tensorGemm_io_dec_WIRE_1 = inst_q_io_deq_bits;
	reg tensorGemm_io_acc_rd_0_data_valid_REG;
	reg tensorAlu_io_start_REG;
	reg tensorAlu_io_acc_rd_0_data_valid_REG;
	reg io_out_wr_0_valid_REG;
	reg io_out_wr_0_bits_idx_REG;
	reg outDataBits_0_REG;
	wire [63:0] srcGemFlat_lo = {tensorGemm_io_out_wr_0_bits_data_0_7, tensorGemm_io_out_wr_0_bits_data_0_6, tensorGemm_io_out_wr_0_bits_data_0_5, tensorGemm_io_out_wr_0_bits_data_0_4, tensorGemm_io_out_wr_0_bits_data_0_3, tensorGemm_io_out_wr_0_bits_data_0_2, tensorGemm_io_out_wr_0_bits_data_0_1, tensorGemm_io_out_wr_0_bits_data_0_0};
	wire [127:0] srcGemFlat = {tensorGemm_io_out_wr_0_bits_data_0_15, tensorGemm_io_out_wr_0_bits_data_0_14, tensorGemm_io_out_wr_0_bits_data_0_13, tensorGemm_io_out_wr_0_bits_data_0_12, tensorGemm_io_out_wr_0_bits_data_0_11, tensorGemm_io_out_wr_0_bits_data_0_10, tensorGemm_io_out_wr_0_bits_data_0_9, tensorGemm_io_out_wr_0_bits_data_0_8, srcGemFlat_lo};
	wire [63:0] srcAluFlat_lo = {tensorAlu_io_out_wr_0_bits_data_0_7, tensorAlu_io_out_wr_0_bits_data_0_6, tensorAlu_io_out_wr_0_bits_data_0_5, tensorAlu_io_out_wr_0_bits_data_0_4, tensorAlu_io_out_wr_0_bits_data_0_3, tensorAlu_io_out_wr_0_bits_data_0_2, tensorAlu_io_out_wr_0_bits_data_0_1, tensorAlu_io_out_wr_0_bits_data_0_0};
	wire [127:0] srcAluFlat = {tensorAlu_io_out_wr_0_bits_data_0_15, tensorAlu_io_out_wr_0_bits_data_0_14, tensorAlu_io_out_wr_0_bits_data_0_13, tensorAlu_io_out_wr_0_bits_data_0_12, tensorAlu_io_out_wr_0_bits_data_0_11, tensorAlu_io_out_wr_0_bits_data_0_10, tensorAlu_io_out_wr_0_bits_data_0_9, tensorAlu_io_out_wr_0_bits_data_0_8, srcAluFlat_lo};
	wire [127:0] outDataBits_0 = (outDataBits_0_REG ? srcGemFlat : srcAluFlat);
	Semaphore s_0(
		.clk(s_0_clock),
		.rst(s_0_reset),
		.io_spost(s_0_io_spost),
		.io_swait(s_0_io_swait),
		.io_sready(s_0_io_sready)
	);
	Semaphore s_1(
		.clk(s_1_clock),
		.rst(s_1_reset),
		.io_spost(s_1_io_spost),
		.io_swait(s_1_io_swait),
		.io_sready(s_1_io_sready)
	);
	LoadUopTop loadUop(
		.clk(loadUop_clock),
		.rst(loadUop_reset),
		.io_start(loadUop_io_start),
		.io_done(loadUop_io_done),
		.io_inst(loadUop_io_inst),
		.io_baddr(loadUop_io_baddr),
		.io_vme_rd_cmd_ready(loadUop_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(loadUop_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(loadUop_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(loadUop_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(loadUop_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_valid(loadUop_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(loadUop_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(loadUop_io_vme_rd_data_bits_tag),
		.io_vme_rd_data_bits_last(loadUop_io_vme_rd_data_bits_last),
		.io_uop_idx_valid(loadUop_io_uop_idx_valid),
		.io_uop_idx_bits(loadUop_io_uop_idx_bits),
		.io_uop_data_valid(loadUop_io_uop_data_valid),
		.io_uop_data_bits_u2(loadUop_io_uop_data_bits_u2),
		.io_uop_data_bits_u1(loadUop_io_uop_data_bits_u1),
		.io_uop_data_bits_u0(loadUop_io_uop_data_bits_u0)
	);
	TensorLoadAcc tensorAcc(
		.clk(tensorAcc_clock),
		.rst(tensorAcc_reset),
		.io_start(tensorAcc_io_start),
		.io_done(tensorAcc_io_done),
		.io_inst(tensorAcc_io_inst),
		.io_baddr(tensorAcc_io_baddr),
		.io_vme_rd_cmd_ready(tensorAcc_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(tensorAcc_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(tensorAcc_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(tensorAcc_io_vme_rd_cmd_bits_len),
		.io_vme_rd_cmd_bits_tag(tensorAcc_io_vme_rd_cmd_bits_tag),
		.io_vme_rd_data_valid(tensorAcc_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(tensorAcc_io_vme_rd_data_bits_data),
		.io_vme_rd_data_bits_tag(tensorAcc_io_vme_rd_data_bits_tag),
		.io_tensor_rd_0_idx_valid(tensorAcc_io_tensor_rd_0_idx_valid),
		.io_tensor_rd_0_idx_bits(tensorAcc_io_tensor_rd_0_idx_bits),
		.io_tensor_rd_0_data_valid(tensorAcc_io_tensor_rd_0_data_valid),
		.io_tensor_rd_0_data_bits_0_0(tensorAcc_io_tensor_rd_0_data_bits_0_0),
		.io_tensor_rd_0_data_bits_0_1(tensorAcc_io_tensor_rd_0_data_bits_0_1),
		.io_tensor_rd_0_data_bits_0_2(tensorAcc_io_tensor_rd_0_data_bits_0_2),
		.io_tensor_rd_0_data_bits_0_3(tensorAcc_io_tensor_rd_0_data_bits_0_3),
		.io_tensor_rd_0_data_bits_0_4(tensorAcc_io_tensor_rd_0_data_bits_0_4),
		.io_tensor_rd_0_data_bits_0_5(tensorAcc_io_tensor_rd_0_data_bits_0_5),
		.io_tensor_rd_0_data_bits_0_6(tensorAcc_io_tensor_rd_0_data_bits_0_6),
		.io_tensor_rd_0_data_bits_0_7(tensorAcc_io_tensor_rd_0_data_bits_0_7),
		.io_tensor_rd_0_data_bits_0_8(tensorAcc_io_tensor_rd_0_data_bits_0_8),
		.io_tensor_rd_0_data_bits_0_9(tensorAcc_io_tensor_rd_0_data_bits_0_9),
		.io_tensor_rd_0_data_bits_0_10(tensorAcc_io_tensor_rd_0_data_bits_0_10),
		.io_tensor_rd_0_data_bits_0_11(tensorAcc_io_tensor_rd_0_data_bits_0_11),
		.io_tensor_rd_0_data_bits_0_12(tensorAcc_io_tensor_rd_0_data_bits_0_12),
		.io_tensor_rd_0_data_bits_0_13(tensorAcc_io_tensor_rd_0_data_bits_0_13),
		.io_tensor_rd_0_data_bits_0_14(tensorAcc_io_tensor_rd_0_data_bits_0_14),
		.io_tensor_rd_0_data_bits_0_15(tensorAcc_io_tensor_rd_0_data_bits_0_15),
		.io_tensor_wr_0_valid(tensorAcc_io_tensor_wr_0_valid),
		.io_tensor_wr_0_bits_idx(tensorAcc_io_tensor_wr_0_bits_idx),
		.io_tensor_wr_0_bits_data_0_0(tensorAcc_io_tensor_wr_0_bits_data_0_0),
		.io_tensor_wr_0_bits_data_0_1(tensorAcc_io_tensor_wr_0_bits_data_0_1),
		.io_tensor_wr_0_bits_data_0_2(tensorAcc_io_tensor_wr_0_bits_data_0_2),
		.io_tensor_wr_0_bits_data_0_3(tensorAcc_io_tensor_wr_0_bits_data_0_3),
		.io_tensor_wr_0_bits_data_0_4(tensorAcc_io_tensor_wr_0_bits_data_0_4),
		.io_tensor_wr_0_bits_data_0_5(tensorAcc_io_tensor_wr_0_bits_data_0_5),
		.io_tensor_wr_0_bits_data_0_6(tensorAcc_io_tensor_wr_0_bits_data_0_6),
		.io_tensor_wr_0_bits_data_0_7(tensorAcc_io_tensor_wr_0_bits_data_0_7),
		.io_tensor_wr_0_bits_data_0_8(tensorAcc_io_tensor_wr_0_bits_data_0_8),
		.io_tensor_wr_0_bits_data_0_9(tensorAcc_io_tensor_wr_0_bits_data_0_9),
		.io_tensor_wr_0_bits_data_0_10(tensorAcc_io_tensor_wr_0_bits_data_0_10),
		.io_tensor_wr_0_bits_data_0_11(tensorAcc_io_tensor_wr_0_bits_data_0_11),
		.io_tensor_wr_0_bits_data_0_12(tensorAcc_io_tensor_wr_0_bits_data_0_12),
		.io_tensor_wr_0_bits_data_0_13(tensorAcc_io_tensor_wr_0_bits_data_0_13),
		.io_tensor_wr_0_bits_data_0_14(tensorAcc_io_tensor_wr_0_bits_data_0_14),
		.io_tensor_wr_0_bits_data_0_15(tensorAcc_io_tensor_wr_0_bits_data_0_15)
	);
	TensorGemm tensorGemm(
		.clk(tensorGemm_clock),
		.rst(tensorGemm_reset),
		.io_start(tensorGemm_io_start),
		.io_done(tensorGemm_io_done),
		.io_dec_wgt_1(tensorGemm_io_dec_wgt_1),
		.io_dec_wgt_0(tensorGemm_io_dec_wgt_0),
		.io_dec_inp_1(tensorGemm_io_dec_inp_1),
		.io_dec_inp_0(tensorGemm_io_dec_inp_0),
		.io_dec_acc_1(tensorGemm_io_dec_acc_1),
		.io_dec_acc_0(tensorGemm_io_dec_acc_0),
		.io_dec_empty_0(tensorGemm_io_dec_empty_0),
		.io_dec_lp_1(tensorGemm_io_dec_lp_1),
		.io_dec_lp_0(tensorGemm_io_dec_lp_0),
		.io_dec_uop_end(tensorGemm_io_dec_uop_end),
		.io_dec_uop_begin(tensorGemm_io_dec_uop_begin),
		.io_dec_reset(tensorGemm_io_dec_reset),
		.io_dec_push_next(tensorGemm_io_dec_push_next),
		.io_dec_push_prev(tensorGemm_io_dec_push_prev),
		.io_dec_pop_next(tensorGemm_io_dec_pop_next),
		.io_dec_pop_prev(tensorGemm_io_dec_pop_prev),
		.io_dec_op(tensorGemm_io_dec_op),
		.io_uop_idx_valid(tensorGemm_io_uop_idx_valid),
		.io_uop_idx_bits(tensorGemm_io_uop_idx_bits),
		.io_uop_data_valid(tensorGemm_io_uop_data_valid),
		.io_uop_data_bits_u2(tensorGemm_io_uop_data_bits_u2),
		.io_uop_data_bits_u1(tensorGemm_io_uop_data_bits_u1),
		.io_uop_data_bits_u0(tensorGemm_io_uop_data_bits_u0),
		.io_inp_rd_0_idx_valid(tensorGemm_io_inp_rd_0_idx_valid),
		.io_inp_rd_0_idx_bits(tensorGemm_io_inp_rd_0_idx_bits),
		.io_inp_rd_0_data_valid(tensorGemm_io_inp_rd_0_data_valid),
		.io_inp_rd_0_data_bits_0_0(tensorGemm_io_inp_rd_0_data_bits_0_0),
		.io_inp_rd_0_data_bits_0_1(tensorGemm_io_inp_rd_0_data_bits_0_1),
		.io_inp_rd_0_data_bits_0_2(tensorGemm_io_inp_rd_0_data_bits_0_2),
		.io_inp_rd_0_data_bits_0_3(tensorGemm_io_inp_rd_0_data_bits_0_3),
		.io_inp_rd_0_data_bits_0_4(tensorGemm_io_inp_rd_0_data_bits_0_4),
		.io_inp_rd_0_data_bits_0_5(tensorGemm_io_inp_rd_0_data_bits_0_5),
		.io_inp_rd_0_data_bits_0_6(tensorGemm_io_inp_rd_0_data_bits_0_6),
		.io_inp_rd_0_data_bits_0_7(tensorGemm_io_inp_rd_0_data_bits_0_7),
		.io_inp_rd_0_data_bits_0_8(tensorGemm_io_inp_rd_0_data_bits_0_8),
		.io_inp_rd_0_data_bits_0_9(tensorGemm_io_inp_rd_0_data_bits_0_9),
		.io_inp_rd_0_data_bits_0_10(tensorGemm_io_inp_rd_0_data_bits_0_10),
		.io_inp_rd_0_data_bits_0_11(tensorGemm_io_inp_rd_0_data_bits_0_11),
		.io_inp_rd_0_data_bits_0_12(tensorGemm_io_inp_rd_0_data_bits_0_12),
		.io_inp_rd_0_data_bits_0_13(tensorGemm_io_inp_rd_0_data_bits_0_13),
		.io_inp_rd_0_data_bits_0_14(tensorGemm_io_inp_rd_0_data_bits_0_14),
		.io_inp_rd_0_data_bits_0_15(tensorGemm_io_inp_rd_0_data_bits_0_15),
		.io_wgt_rd_0_idx_valid(tensorGemm_io_wgt_rd_0_idx_valid),
		.io_wgt_rd_0_idx_bits(tensorGemm_io_wgt_rd_0_idx_bits),
		.io_wgt_rd_0_data_valid(tensorGemm_io_wgt_rd_0_data_valid),
		.io_wgt_rd_0_data_bits_0_0(tensorGemm_io_wgt_rd_0_data_bits_0_0),
		.io_wgt_rd_0_data_bits_0_1(tensorGemm_io_wgt_rd_0_data_bits_0_1),
		.io_wgt_rd_0_data_bits_0_2(tensorGemm_io_wgt_rd_0_data_bits_0_2),
		.io_wgt_rd_0_data_bits_0_3(tensorGemm_io_wgt_rd_0_data_bits_0_3),
		.io_wgt_rd_0_data_bits_0_4(tensorGemm_io_wgt_rd_0_data_bits_0_4),
		.io_wgt_rd_0_data_bits_0_5(tensorGemm_io_wgt_rd_0_data_bits_0_5),
		.io_wgt_rd_0_data_bits_0_6(tensorGemm_io_wgt_rd_0_data_bits_0_6),
		.io_wgt_rd_0_data_bits_0_7(tensorGemm_io_wgt_rd_0_data_bits_0_7),
		.io_wgt_rd_0_data_bits_0_8(tensorGemm_io_wgt_rd_0_data_bits_0_8),
		.io_wgt_rd_0_data_bits_0_9(tensorGemm_io_wgt_rd_0_data_bits_0_9),
		.io_wgt_rd_0_data_bits_0_10(tensorGemm_io_wgt_rd_0_data_bits_0_10),
		.io_wgt_rd_0_data_bits_0_11(tensorGemm_io_wgt_rd_0_data_bits_0_11),
		.io_wgt_rd_0_data_bits_0_12(tensorGemm_io_wgt_rd_0_data_bits_0_12),
		.io_wgt_rd_0_data_bits_0_13(tensorGemm_io_wgt_rd_0_data_bits_0_13),
		.io_wgt_rd_0_data_bits_0_14(tensorGemm_io_wgt_rd_0_data_bits_0_14),
		.io_wgt_rd_0_data_bits_0_15(tensorGemm_io_wgt_rd_0_data_bits_0_15),
		.io_wgt_rd_0_data_bits_1_0(tensorGemm_io_wgt_rd_0_data_bits_1_0),
		.io_wgt_rd_0_data_bits_1_1(tensorGemm_io_wgt_rd_0_data_bits_1_1),
		.io_wgt_rd_0_data_bits_1_2(tensorGemm_io_wgt_rd_0_data_bits_1_2),
		.io_wgt_rd_0_data_bits_1_3(tensorGemm_io_wgt_rd_0_data_bits_1_3),
		.io_wgt_rd_0_data_bits_1_4(tensorGemm_io_wgt_rd_0_data_bits_1_4),
		.io_wgt_rd_0_data_bits_1_5(tensorGemm_io_wgt_rd_0_data_bits_1_5),
		.io_wgt_rd_0_data_bits_1_6(tensorGemm_io_wgt_rd_0_data_bits_1_6),
		.io_wgt_rd_0_data_bits_1_7(tensorGemm_io_wgt_rd_0_data_bits_1_7),
		.io_wgt_rd_0_data_bits_1_8(tensorGemm_io_wgt_rd_0_data_bits_1_8),
		.io_wgt_rd_0_data_bits_1_9(tensorGemm_io_wgt_rd_0_data_bits_1_9),
		.io_wgt_rd_0_data_bits_1_10(tensorGemm_io_wgt_rd_0_data_bits_1_10),
		.io_wgt_rd_0_data_bits_1_11(tensorGemm_io_wgt_rd_0_data_bits_1_11),
		.io_wgt_rd_0_data_bits_1_12(tensorGemm_io_wgt_rd_0_data_bits_1_12),
		.io_wgt_rd_0_data_bits_1_13(tensorGemm_io_wgt_rd_0_data_bits_1_13),
		.io_wgt_rd_0_data_bits_1_14(tensorGemm_io_wgt_rd_0_data_bits_1_14),
		.io_wgt_rd_0_data_bits_1_15(tensorGemm_io_wgt_rd_0_data_bits_1_15),
		.io_wgt_rd_0_data_bits_2_0(tensorGemm_io_wgt_rd_0_data_bits_2_0),
		.io_wgt_rd_0_data_bits_2_1(tensorGemm_io_wgt_rd_0_data_bits_2_1),
		.io_wgt_rd_0_data_bits_2_2(tensorGemm_io_wgt_rd_0_data_bits_2_2),
		.io_wgt_rd_0_data_bits_2_3(tensorGemm_io_wgt_rd_0_data_bits_2_3),
		.io_wgt_rd_0_data_bits_2_4(tensorGemm_io_wgt_rd_0_data_bits_2_4),
		.io_wgt_rd_0_data_bits_2_5(tensorGemm_io_wgt_rd_0_data_bits_2_5),
		.io_wgt_rd_0_data_bits_2_6(tensorGemm_io_wgt_rd_0_data_bits_2_6),
		.io_wgt_rd_0_data_bits_2_7(tensorGemm_io_wgt_rd_0_data_bits_2_7),
		.io_wgt_rd_0_data_bits_2_8(tensorGemm_io_wgt_rd_0_data_bits_2_8),
		.io_wgt_rd_0_data_bits_2_9(tensorGemm_io_wgt_rd_0_data_bits_2_9),
		.io_wgt_rd_0_data_bits_2_10(tensorGemm_io_wgt_rd_0_data_bits_2_10),
		.io_wgt_rd_0_data_bits_2_11(tensorGemm_io_wgt_rd_0_data_bits_2_11),
		.io_wgt_rd_0_data_bits_2_12(tensorGemm_io_wgt_rd_0_data_bits_2_12),
		.io_wgt_rd_0_data_bits_2_13(tensorGemm_io_wgt_rd_0_data_bits_2_13),
		.io_wgt_rd_0_data_bits_2_14(tensorGemm_io_wgt_rd_0_data_bits_2_14),
		.io_wgt_rd_0_data_bits_2_15(tensorGemm_io_wgt_rd_0_data_bits_2_15),
		.io_wgt_rd_0_data_bits_3_0(tensorGemm_io_wgt_rd_0_data_bits_3_0),
		.io_wgt_rd_0_data_bits_3_1(tensorGemm_io_wgt_rd_0_data_bits_3_1),
		.io_wgt_rd_0_data_bits_3_2(tensorGemm_io_wgt_rd_0_data_bits_3_2),
		.io_wgt_rd_0_data_bits_3_3(tensorGemm_io_wgt_rd_0_data_bits_3_3),
		.io_wgt_rd_0_data_bits_3_4(tensorGemm_io_wgt_rd_0_data_bits_3_4),
		.io_wgt_rd_0_data_bits_3_5(tensorGemm_io_wgt_rd_0_data_bits_3_5),
		.io_wgt_rd_0_data_bits_3_6(tensorGemm_io_wgt_rd_0_data_bits_3_6),
		.io_wgt_rd_0_data_bits_3_7(tensorGemm_io_wgt_rd_0_data_bits_3_7),
		.io_wgt_rd_0_data_bits_3_8(tensorGemm_io_wgt_rd_0_data_bits_3_8),
		.io_wgt_rd_0_data_bits_3_9(tensorGemm_io_wgt_rd_0_data_bits_3_9),
		.io_wgt_rd_0_data_bits_3_10(tensorGemm_io_wgt_rd_0_data_bits_3_10),
		.io_wgt_rd_0_data_bits_3_11(tensorGemm_io_wgt_rd_0_data_bits_3_11),
		.io_wgt_rd_0_data_bits_3_12(tensorGemm_io_wgt_rd_0_data_bits_3_12),
		.io_wgt_rd_0_data_bits_3_13(tensorGemm_io_wgt_rd_0_data_bits_3_13),
		.io_wgt_rd_0_data_bits_3_14(tensorGemm_io_wgt_rd_0_data_bits_3_14),
		.io_wgt_rd_0_data_bits_3_15(tensorGemm_io_wgt_rd_0_data_bits_3_15),
		.io_wgt_rd_0_data_bits_4_0(tensorGemm_io_wgt_rd_0_data_bits_4_0),
		.io_wgt_rd_0_data_bits_4_1(tensorGemm_io_wgt_rd_0_data_bits_4_1),
		.io_wgt_rd_0_data_bits_4_2(tensorGemm_io_wgt_rd_0_data_bits_4_2),
		.io_wgt_rd_0_data_bits_4_3(tensorGemm_io_wgt_rd_0_data_bits_4_3),
		.io_wgt_rd_0_data_bits_4_4(tensorGemm_io_wgt_rd_0_data_bits_4_4),
		.io_wgt_rd_0_data_bits_4_5(tensorGemm_io_wgt_rd_0_data_bits_4_5),
		.io_wgt_rd_0_data_bits_4_6(tensorGemm_io_wgt_rd_0_data_bits_4_6),
		.io_wgt_rd_0_data_bits_4_7(tensorGemm_io_wgt_rd_0_data_bits_4_7),
		.io_wgt_rd_0_data_bits_4_8(tensorGemm_io_wgt_rd_0_data_bits_4_8),
		.io_wgt_rd_0_data_bits_4_9(tensorGemm_io_wgt_rd_0_data_bits_4_9),
		.io_wgt_rd_0_data_bits_4_10(tensorGemm_io_wgt_rd_0_data_bits_4_10),
		.io_wgt_rd_0_data_bits_4_11(tensorGemm_io_wgt_rd_0_data_bits_4_11),
		.io_wgt_rd_0_data_bits_4_12(tensorGemm_io_wgt_rd_0_data_bits_4_12),
		.io_wgt_rd_0_data_bits_4_13(tensorGemm_io_wgt_rd_0_data_bits_4_13),
		.io_wgt_rd_0_data_bits_4_14(tensorGemm_io_wgt_rd_0_data_bits_4_14),
		.io_wgt_rd_0_data_bits_4_15(tensorGemm_io_wgt_rd_0_data_bits_4_15),
		.io_wgt_rd_0_data_bits_5_0(tensorGemm_io_wgt_rd_0_data_bits_5_0),
		.io_wgt_rd_0_data_bits_5_1(tensorGemm_io_wgt_rd_0_data_bits_5_1),
		.io_wgt_rd_0_data_bits_5_2(tensorGemm_io_wgt_rd_0_data_bits_5_2),
		.io_wgt_rd_0_data_bits_5_3(tensorGemm_io_wgt_rd_0_data_bits_5_3),
		.io_wgt_rd_0_data_bits_5_4(tensorGemm_io_wgt_rd_0_data_bits_5_4),
		.io_wgt_rd_0_data_bits_5_5(tensorGemm_io_wgt_rd_0_data_bits_5_5),
		.io_wgt_rd_0_data_bits_5_6(tensorGemm_io_wgt_rd_0_data_bits_5_6),
		.io_wgt_rd_0_data_bits_5_7(tensorGemm_io_wgt_rd_0_data_bits_5_7),
		.io_wgt_rd_0_data_bits_5_8(tensorGemm_io_wgt_rd_0_data_bits_5_8),
		.io_wgt_rd_0_data_bits_5_9(tensorGemm_io_wgt_rd_0_data_bits_5_9),
		.io_wgt_rd_0_data_bits_5_10(tensorGemm_io_wgt_rd_0_data_bits_5_10),
		.io_wgt_rd_0_data_bits_5_11(tensorGemm_io_wgt_rd_0_data_bits_5_11),
		.io_wgt_rd_0_data_bits_5_12(tensorGemm_io_wgt_rd_0_data_bits_5_12),
		.io_wgt_rd_0_data_bits_5_13(tensorGemm_io_wgt_rd_0_data_bits_5_13),
		.io_wgt_rd_0_data_bits_5_14(tensorGemm_io_wgt_rd_0_data_bits_5_14),
		.io_wgt_rd_0_data_bits_5_15(tensorGemm_io_wgt_rd_0_data_bits_5_15),
		.io_wgt_rd_0_data_bits_6_0(tensorGemm_io_wgt_rd_0_data_bits_6_0),
		.io_wgt_rd_0_data_bits_6_1(tensorGemm_io_wgt_rd_0_data_bits_6_1),
		.io_wgt_rd_0_data_bits_6_2(tensorGemm_io_wgt_rd_0_data_bits_6_2),
		.io_wgt_rd_0_data_bits_6_3(tensorGemm_io_wgt_rd_0_data_bits_6_3),
		.io_wgt_rd_0_data_bits_6_4(tensorGemm_io_wgt_rd_0_data_bits_6_4),
		.io_wgt_rd_0_data_bits_6_5(tensorGemm_io_wgt_rd_0_data_bits_6_5),
		.io_wgt_rd_0_data_bits_6_6(tensorGemm_io_wgt_rd_0_data_bits_6_6),
		.io_wgt_rd_0_data_bits_6_7(tensorGemm_io_wgt_rd_0_data_bits_6_7),
		.io_wgt_rd_0_data_bits_6_8(tensorGemm_io_wgt_rd_0_data_bits_6_8),
		.io_wgt_rd_0_data_bits_6_9(tensorGemm_io_wgt_rd_0_data_bits_6_9),
		.io_wgt_rd_0_data_bits_6_10(tensorGemm_io_wgt_rd_0_data_bits_6_10),
		.io_wgt_rd_0_data_bits_6_11(tensorGemm_io_wgt_rd_0_data_bits_6_11),
		.io_wgt_rd_0_data_bits_6_12(tensorGemm_io_wgt_rd_0_data_bits_6_12),
		.io_wgt_rd_0_data_bits_6_13(tensorGemm_io_wgt_rd_0_data_bits_6_13),
		.io_wgt_rd_0_data_bits_6_14(tensorGemm_io_wgt_rd_0_data_bits_6_14),
		.io_wgt_rd_0_data_bits_6_15(tensorGemm_io_wgt_rd_0_data_bits_6_15),
		.io_wgt_rd_0_data_bits_7_0(tensorGemm_io_wgt_rd_0_data_bits_7_0),
		.io_wgt_rd_0_data_bits_7_1(tensorGemm_io_wgt_rd_0_data_bits_7_1),
		.io_wgt_rd_0_data_bits_7_2(tensorGemm_io_wgt_rd_0_data_bits_7_2),
		.io_wgt_rd_0_data_bits_7_3(tensorGemm_io_wgt_rd_0_data_bits_7_3),
		.io_wgt_rd_0_data_bits_7_4(tensorGemm_io_wgt_rd_0_data_bits_7_4),
		.io_wgt_rd_0_data_bits_7_5(tensorGemm_io_wgt_rd_0_data_bits_7_5),
		.io_wgt_rd_0_data_bits_7_6(tensorGemm_io_wgt_rd_0_data_bits_7_6),
		.io_wgt_rd_0_data_bits_7_7(tensorGemm_io_wgt_rd_0_data_bits_7_7),
		.io_wgt_rd_0_data_bits_7_8(tensorGemm_io_wgt_rd_0_data_bits_7_8),
		.io_wgt_rd_0_data_bits_7_9(tensorGemm_io_wgt_rd_0_data_bits_7_9),
		.io_wgt_rd_0_data_bits_7_10(tensorGemm_io_wgt_rd_0_data_bits_7_10),
		.io_wgt_rd_0_data_bits_7_11(tensorGemm_io_wgt_rd_0_data_bits_7_11),
		.io_wgt_rd_0_data_bits_7_12(tensorGemm_io_wgt_rd_0_data_bits_7_12),
		.io_wgt_rd_0_data_bits_7_13(tensorGemm_io_wgt_rd_0_data_bits_7_13),
		.io_wgt_rd_0_data_bits_7_14(tensorGemm_io_wgt_rd_0_data_bits_7_14),
		.io_wgt_rd_0_data_bits_7_15(tensorGemm_io_wgt_rd_0_data_bits_7_15),
		.io_wgt_rd_0_data_bits_8_0(tensorGemm_io_wgt_rd_0_data_bits_8_0),
		.io_wgt_rd_0_data_bits_8_1(tensorGemm_io_wgt_rd_0_data_bits_8_1),
		.io_wgt_rd_0_data_bits_8_2(tensorGemm_io_wgt_rd_0_data_bits_8_2),
		.io_wgt_rd_0_data_bits_8_3(tensorGemm_io_wgt_rd_0_data_bits_8_3),
		.io_wgt_rd_0_data_bits_8_4(tensorGemm_io_wgt_rd_0_data_bits_8_4),
		.io_wgt_rd_0_data_bits_8_5(tensorGemm_io_wgt_rd_0_data_bits_8_5),
		.io_wgt_rd_0_data_bits_8_6(tensorGemm_io_wgt_rd_0_data_bits_8_6),
		.io_wgt_rd_0_data_bits_8_7(tensorGemm_io_wgt_rd_0_data_bits_8_7),
		.io_wgt_rd_0_data_bits_8_8(tensorGemm_io_wgt_rd_0_data_bits_8_8),
		.io_wgt_rd_0_data_bits_8_9(tensorGemm_io_wgt_rd_0_data_bits_8_9),
		.io_wgt_rd_0_data_bits_8_10(tensorGemm_io_wgt_rd_0_data_bits_8_10),
		.io_wgt_rd_0_data_bits_8_11(tensorGemm_io_wgt_rd_0_data_bits_8_11),
		.io_wgt_rd_0_data_bits_8_12(tensorGemm_io_wgt_rd_0_data_bits_8_12),
		.io_wgt_rd_0_data_bits_8_13(tensorGemm_io_wgt_rd_0_data_bits_8_13),
		.io_wgt_rd_0_data_bits_8_14(tensorGemm_io_wgt_rd_0_data_bits_8_14),
		.io_wgt_rd_0_data_bits_8_15(tensorGemm_io_wgt_rd_0_data_bits_8_15),
		.io_wgt_rd_0_data_bits_9_0(tensorGemm_io_wgt_rd_0_data_bits_9_0),
		.io_wgt_rd_0_data_bits_9_1(tensorGemm_io_wgt_rd_0_data_bits_9_1),
		.io_wgt_rd_0_data_bits_9_2(tensorGemm_io_wgt_rd_0_data_bits_9_2),
		.io_wgt_rd_0_data_bits_9_3(tensorGemm_io_wgt_rd_0_data_bits_9_3),
		.io_wgt_rd_0_data_bits_9_4(tensorGemm_io_wgt_rd_0_data_bits_9_4),
		.io_wgt_rd_0_data_bits_9_5(tensorGemm_io_wgt_rd_0_data_bits_9_5),
		.io_wgt_rd_0_data_bits_9_6(tensorGemm_io_wgt_rd_0_data_bits_9_6),
		.io_wgt_rd_0_data_bits_9_7(tensorGemm_io_wgt_rd_0_data_bits_9_7),
		.io_wgt_rd_0_data_bits_9_8(tensorGemm_io_wgt_rd_0_data_bits_9_8),
		.io_wgt_rd_0_data_bits_9_9(tensorGemm_io_wgt_rd_0_data_bits_9_9),
		.io_wgt_rd_0_data_bits_9_10(tensorGemm_io_wgt_rd_0_data_bits_9_10),
		.io_wgt_rd_0_data_bits_9_11(tensorGemm_io_wgt_rd_0_data_bits_9_11),
		.io_wgt_rd_0_data_bits_9_12(tensorGemm_io_wgt_rd_0_data_bits_9_12),
		.io_wgt_rd_0_data_bits_9_13(tensorGemm_io_wgt_rd_0_data_bits_9_13),
		.io_wgt_rd_0_data_bits_9_14(tensorGemm_io_wgt_rd_0_data_bits_9_14),
		.io_wgt_rd_0_data_bits_9_15(tensorGemm_io_wgt_rd_0_data_bits_9_15),
		.io_wgt_rd_0_data_bits_10_0(tensorGemm_io_wgt_rd_0_data_bits_10_0),
		.io_wgt_rd_0_data_bits_10_1(tensorGemm_io_wgt_rd_0_data_bits_10_1),
		.io_wgt_rd_0_data_bits_10_2(tensorGemm_io_wgt_rd_0_data_bits_10_2),
		.io_wgt_rd_0_data_bits_10_3(tensorGemm_io_wgt_rd_0_data_bits_10_3),
		.io_wgt_rd_0_data_bits_10_4(tensorGemm_io_wgt_rd_0_data_bits_10_4),
		.io_wgt_rd_0_data_bits_10_5(tensorGemm_io_wgt_rd_0_data_bits_10_5),
		.io_wgt_rd_0_data_bits_10_6(tensorGemm_io_wgt_rd_0_data_bits_10_6),
		.io_wgt_rd_0_data_bits_10_7(tensorGemm_io_wgt_rd_0_data_bits_10_7),
		.io_wgt_rd_0_data_bits_10_8(tensorGemm_io_wgt_rd_0_data_bits_10_8),
		.io_wgt_rd_0_data_bits_10_9(tensorGemm_io_wgt_rd_0_data_bits_10_9),
		.io_wgt_rd_0_data_bits_10_10(tensorGemm_io_wgt_rd_0_data_bits_10_10),
		.io_wgt_rd_0_data_bits_10_11(tensorGemm_io_wgt_rd_0_data_bits_10_11),
		.io_wgt_rd_0_data_bits_10_12(tensorGemm_io_wgt_rd_0_data_bits_10_12),
		.io_wgt_rd_0_data_bits_10_13(tensorGemm_io_wgt_rd_0_data_bits_10_13),
		.io_wgt_rd_0_data_bits_10_14(tensorGemm_io_wgt_rd_0_data_bits_10_14),
		.io_wgt_rd_0_data_bits_10_15(tensorGemm_io_wgt_rd_0_data_bits_10_15),
		.io_wgt_rd_0_data_bits_11_0(tensorGemm_io_wgt_rd_0_data_bits_11_0),
		.io_wgt_rd_0_data_bits_11_1(tensorGemm_io_wgt_rd_0_data_bits_11_1),
		.io_wgt_rd_0_data_bits_11_2(tensorGemm_io_wgt_rd_0_data_bits_11_2),
		.io_wgt_rd_0_data_bits_11_3(tensorGemm_io_wgt_rd_0_data_bits_11_3),
		.io_wgt_rd_0_data_bits_11_4(tensorGemm_io_wgt_rd_0_data_bits_11_4),
		.io_wgt_rd_0_data_bits_11_5(tensorGemm_io_wgt_rd_0_data_bits_11_5),
		.io_wgt_rd_0_data_bits_11_6(tensorGemm_io_wgt_rd_0_data_bits_11_6),
		.io_wgt_rd_0_data_bits_11_7(tensorGemm_io_wgt_rd_0_data_bits_11_7),
		.io_wgt_rd_0_data_bits_11_8(tensorGemm_io_wgt_rd_0_data_bits_11_8),
		.io_wgt_rd_0_data_bits_11_9(tensorGemm_io_wgt_rd_0_data_bits_11_9),
		.io_wgt_rd_0_data_bits_11_10(tensorGemm_io_wgt_rd_0_data_bits_11_10),
		.io_wgt_rd_0_data_bits_11_11(tensorGemm_io_wgt_rd_0_data_bits_11_11),
		.io_wgt_rd_0_data_bits_11_12(tensorGemm_io_wgt_rd_0_data_bits_11_12),
		.io_wgt_rd_0_data_bits_11_13(tensorGemm_io_wgt_rd_0_data_bits_11_13),
		.io_wgt_rd_0_data_bits_11_14(tensorGemm_io_wgt_rd_0_data_bits_11_14),
		.io_wgt_rd_0_data_bits_11_15(tensorGemm_io_wgt_rd_0_data_bits_11_15),
		.io_wgt_rd_0_data_bits_12_0(tensorGemm_io_wgt_rd_0_data_bits_12_0),
		.io_wgt_rd_0_data_bits_12_1(tensorGemm_io_wgt_rd_0_data_bits_12_1),
		.io_wgt_rd_0_data_bits_12_2(tensorGemm_io_wgt_rd_0_data_bits_12_2),
		.io_wgt_rd_0_data_bits_12_3(tensorGemm_io_wgt_rd_0_data_bits_12_3),
		.io_wgt_rd_0_data_bits_12_4(tensorGemm_io_wgt_rd_0_data_bits_12_4),
		.io_wgt_rd_0_data_bits_12_5(tensorGemm_io_wgt_rd_0_data_bits_12_5),
		.io_wgt_rd_0_data_bits_12_6(tensorGemm_io_wgt_rd_0_data_bits_12_6),
		.io_wgt_rd_0_data_bits_12_7(tensorGemm_io_wgt_rd_0_data_bits_12_7),
		.io_wgt_rd_0_data_bits_12_8(tensorGemm_io_wgt_rd_0_data_bits_12_8),
		.io_wgt_rd_0_data_bits_12_9(tensorGemm_io_wgt_rd_0_data_bits_12_9),
		.io_wgt_rd_0_data_bits_12_10(tensorGemm_io_wgt_rd_0_data_bits_12_10),
		.io_wgt_rd_0_data_bits_12_11(tensorGemm_io_wgt_rd_0_data_bits_12_11),
		.io_wgt_rd_0_data_bits_12_12(tensorGemm_io_wgt_rd_0_data_bits_12_12),
		.io_wgt_rd_0_data_bits_12_13(tensorGemm_io_wgt_rd_0_data_bits_12_13),
		.io_wgt_rd_0_data_bits_12_14(tensorGemm_io_wgt_rd_0_data_bits_12_14),
		.io_wgt_rd_0_data_bits_12_15(tensorGemm_io_wgt_rd_0_data_bits_12_15),
		.io_wgt_rd_0_data_bits_13_0(tensorGemm_io_wgt_rd_0_data_bits_13_0),
		.io_wgt_rd_0_data_bits_13_1(tensorGemm_io_wgt_rd_0_data_bits_13_1),
		.io_wgt_rd_0_data_bits_13_2(tensorGemm_io_wgt_rd_0_data_bits_13_2),
		.io_wgt_rd_0_data_bits_13_3(tensorGemm_io_wgt_rd_0_data_bits_13_3),
		.io_wgt_rd_0_data_bits_13_4(tensorGemm_io_wgt_rd_0_data_bits_13_4),
		.io_wgt_rd_0_data_bits_13_5(tensorGemm_io_wgt_rd_0_data_bits_13_5),
		.io_wgt_rd_0_data_bits_13_6(tensorGemm_io_wgt_rd_0_data_bits_13_6),
		.io_wgt_rd_0_data_bits_13_7(tensorGemm_io_wgt_rd_0_data_bits_13_7),
		.io_wgt_rd_0_data_bits_13_8(tensorGemm_io_wgt_rd_0_data_bits_13_8),
		.io_wgt_rd_0_data_bits_13_9(tensorGemm_io_wgt_rd_0_data_bits_13_9),
		.io_wgt_rd_0_data_bits_13_10(tensorGemm_io_wgt_rd_0_data_bits_13_10),
		.io_wgt_rd_0_data_bits_13_11(tensorGemm_io_wgt_rd_0_data_bits_13_11),
		.io_wgt_rd_0_data_bits_13_12(tensorGemm_io_wgt_rd_0_data_bits_13_12),
		.io_wgt_rd_0_data_bits_13_13(tensorGemm_io_wgt_rd_0_data_bits_13_13),
		.io_wgt_rd_0_data_bits_13_14(tensorGemm_io_wgt_rd_0_data_bits_13_14),
		.io_wgt_rd_0_data_bits_13_15(tensorGemm_io_wgt_rd_0_data_bits_13_15),
		.io_wgt_rd_0_data_bits_14_0(tensorGemm_io_wgt_rd_0_data_bits_14_0),
		.io_wgt_rd_0_data_bits_14_1(tensorGemm_io_wgt_rd_0_data_bits_14_1),
		.io_wgt_rd_0_data_bits_14_2(tensorGemm_io_wgt_rd_0_data_bits_14_2),
		.io_wgt_rd_0_data_bits_14_3(tensorGemm_io_wgt_rd_0_data_bits_14_3),
		.io_wgt_rd_0_data_bits_14_4(tensorGemm_io_wgt_rd_0_data_bits_14_4),
		.io_wgt_rd_0_data_bits_14_5(tensorGemm_io_wgt_rd_0_data_bits_14_5),
		.io_wgt_rd_0_data_bits_14_6(tensorGemm_io_wgt_rd_0_data_bits_14_6),
		.io_wgt_rd_0_data_bits_14_7(tensorGemm_io_wgt_rd_0_data_bits_14_7),
		.io_wgt_rd_0_data_bits_14_8(tensorGemm_io_wgt_rd_0_data_bits_14_8),
		.io_wgt_rd_0_data_bits_14_9(tensorGemm_io_wgt_rd_0_data_bits_14_9),
		.io_wgt_rd_0_data_bits_14_10(tensorGemm_io_wgt_rd_0_data_bits_14_10),
		.io_wgt_rd_0_data_bits_14_11(tensorGemm_io_wgt_rd_0_data_bits_14_11),
		.io_wgt_rd_0_data_bits_14_12(tensorGemm_io_wgt_rd_0_data_bits_14_12),
		.io_wgt_rd_0_data_bits_14_13(tensorGemm_io_wgt_rd_0_data_bits_14_13),
		.io_wgt_rd_0_data_bits_14_14(tensorGemm_io_wgt_rd_0_data_bits_14_14),
		.io_wgt_rd_0_data_bits_14_15(tensorGemm_io_wgt_rd_0_data_bits_14_15),
		.io_wgt_rd_0_data_bits_15_0(tensorGemm_io_wgt_rd_0_data_bits_15_0),
		.io_wgt_rd_0_data_bits_15_1(tensorGemm_io_wgt_rd_0_data_bits_15_1),
		.io_wgt_rd_0_data_bits_15_2(tensorGemm_io_wgt_rd_0_data_bits_15_2),
		.io_wgt_rd_0_data_bits_15_3(tensorGemm_io_wgt_rd_0_data_bits_15_3),
		.io_wgt_rd_0_data_bits_15_4(tensorGemm_io_wgt_rd_0_data_bits_15_4),
		.io_wgt_rd_0_data_bits_15_5(tensorGemm_io_wgt_rd_0_data_bits_15_5),
		.io_wgt_rd_0_data_bits_15_6(tensorGemm_io_wgt_rd_0_data_bits_15_6),
		.io_wgt_rd_0_data_bits_15_7(tensorGemm_io_wgt_rd_0_data_bits_15_7),
		.io_wgt_rd_0_data_bits_15_8(tensorGemm_io_wgt_rd_0_data_bits_15_8),
		.io_wgt_rd_0_data_bits_15_9(tensorGemm_io_wgt_rd_0_data_bits_15_9),
		.io_wgt_rd_0_data_bits_15_10(tensorGemm_io_wgt_rd_0_data_bits_15_10),
		.io_wgt_rd_0_data_bits_15_11(tensorGemm_io_wgt_rd_0_data_bits_15_11),
		.io_wgt_rd_0_data_bits_15_12(tensorGemm_io_wgt_rd_0_data_bits_15_12),
		.io_wgt_rd_0_data_bits_15_13(tensorGemm_io_wgt_rd_0_data_bits_15_13),
		.io_wgt_rd_0_data_bits_15_14(tensorGemm_io_wgt_rd_0_data_bits_15_14),
		.io_wgt_rd_0_data_bits_15_15(tensorGemm_io_wgt_rd_0_data_bits_15_15),
		.io_acc_rd_0_idx_valid(tensorGemm_io_acc_rd_0_idx_valid),
		.io_acc_rd_0_idx_bits(tensorGemm_io_acc_rd_0_idx_bits),
		.io_acc_rd_0_data_valid(tensorGemm_io_acc_rd_0_data_valid),
		.io_acc_rd_0_data_bits_0_0(tensorGemm_io_acc_rd_0_data_bits_0_0),
		.io_acc_rd_0_data_bits_0_1(tensorGemm_io_acc_rd_0_data_bits_0_1),
		.io_acc_rd_0_data_bits_0_2(tensorGemm_io_acc_rd_0_data_bits_0_2),
		.io_acc_rd_0_data_bits_0_3(tensorGemm_io_acc_rd_0_data_bits_0_3),
		.io_acc_rd_0_data_bits_0_4(tensorGemm_io_acc_rd_0_data_bits_0_4),
		.io_acc_rd_0_data_bits_0_5(tensorGemm_io_acc_rd_0_data_bits_0_5),
		.io_acc_rd_0_data_bits_0_6(tensorGemm_io_acc_rd_0_data_bits_0_6),
		.io_acc_rd_0_data_bits_0_7(tensorGemm_io_acc_rd_0_data_bits_0_7),
		.io_acc_rd_0_data_bits_0_8(tensorGemm_io_acc_rd_0_data_bits_0_8),
		.io_acc_rd_0_data_bits_0_9(tensorGemm_io_acc_rd_0_data_bits_0_9),
		.io_acc_rd_0_data_bits_0_10(tensorGemm_io_acc_rd_0_data_bits_0_10),
		.io_acc_rd_0_data_bits_0_11(tensorGemm_io_acc_rd_0_data_bits_0_11),
		.io_acc_rd_0_data_bits_0_12(tensorGemm_io_acc_rd_0_data_bits_0_12),
		.io_acc_rd_0_data_bits_0_13(tensorGemm_io_acc_rd_0_data_bits_0_13),
		.io_acc_rd_0_data_bits_0_14(tensorGemm_io_acc_rd_0_data_bits_0_14),
		.io_acc_rd_0_data_bits_0_15(tensorGemm_io_acc_rd_0_data_bits_0_15),
		.io_acc_wr_0_valid(tensorGemm_io_acc_wr_0_valid),
		.io_acc_wr_0_bits_idx(tensorGemm_io_acc_wr_0_bits_idx),
		.io_acc_wr_0_bits_data_0_0(tensorGemm_io_acc_wr_0_bits_data_0_0),
		.io_acc_wr_0_bits_data_0_1(tensorGemm_io_acc_wr_0_bits_data_0_1),
		.io_acc_wr_0_bits_data_0_2(tensorGemm_io_acc_wr_0_bits_data_0_2),
		.io_acc_wr_0_bits_data_0_3(tensorGemm_io_acc_wr_0_bits_data_0_3),
		.io_acc_wr_0_bits_data_0_4(tensorGemm_io_acc_wr_0_bits_data_0_4),
		.io_acc_wr_0_bits_data_0_5(tensorGemm_io_acc_wr_0_bits_data_0_5),
		.io_acc_wr_0_bits_data_0_6(tensorGemm_io_acc_wr_0_bits_data_0_6),
		.io_acc_wr_0_bits_data_0_7(tensorGemm_io_acc_wr_0_bits_data_0_7),
		.io_acc_wr_0_bits_data_0_8(tensorGemm_io_acc_wr_0_bits_data_0_8),
		.io_acc_wr_0_bits_data_0_9(tensorGemm_io_acc_wr_0_bits_data_0_9),
		.io_acc_wr_0_bits_data_0_10(tensorGemm_io_acc_wr_0_bits_data_0_10),
		.io_acc_wr_0_bits_data_0_11(tensorGemm_io_acc_wr_0_bits_data_0_11),
		.io_acc_wr_0_bits_data_0_12(tensorGemm_io_acc_wr_0_bits_data_0_12),
		.io_acc_wr_0_bits_data_0_13(tensorGemm_io_acc_wr_0_bits_data_0_13),
		.io_acc_wr_0_bits_data_0_14(tensorGemm_io_acc_wr_0_bits_data_0_14),
		.io_acc_wr_0_bits_data_0_15(tensorGemm_io_acc_wr_0_bits_data_0_15),
		.io_out_rd_0_data_valid(tensorGemm_io_out_rd_0_data_valid),
		.io_out_wr_0_valid(tensorGemm_io_out_wr_0_valid),
		.io_out_wr_0_bits_idx(tensorGemm_io_out_wr_0_bits_idx),
		.io_out_wr_0_bits_data_0_0(tensorGemm_io_out_wr_0_bits_data_0_0),
		.io_out_wr_0_bits_data_0_1(tensorGemm_io_out_wr_0_bits_data_0_1),
		.io_out_wr_0_bits_data_0_2(tensorGemm_io_out_wr_0_bits_data_0_2),
		.io_out_wr_0_bits_data_0_3(tensorGemm_io_out_wr_0_bits_data_0_3),
		.io_out_wr_0_bits_data_0_4(tensorGemm_io_out_wr_0_bits_data_0_4),
		.io_out_wr_0_bits_data_0_5(tensorGemm_io_out_wr_0_bits_data_0_5),
		.io_out_wr_0_bits_data_0_6(tensorGemm_io_out_wr_0_bits_data_0_6),
		.io_out_wr_0_bits_data_0_7(tensorGemm_io_out_wr_0_bits_data_0_7),
		.io_out_wr_0_bits_data_0_8(tensorGemm_io_out_wr_0_bits_data_0_8),
		.io_out_wr_0_bits_data_0_9(tensorGemm_io_out_wr_0_bits_data_0_9),
		.io_out_wr_0_bits_data_0_10(tensorGemm_io_out_wr_0_bits_data_0_10),
		.io_out_wr_0_bits_data_0_11(tensorGemm_io_out_wr_0_bits_data_0_11),
		.io_out_wr_0_bits_data_0_12(tensorGemm_io_out_wr_0_bits_data_0_12),
		.io_out_wr_0_bits_data_0_13(tensorGemm_io_out_wr_0_bits_data_0_13),
		.io_out_wr_0_bits_data_0_14(tensorGemm_io_out_wr_0_bits_data_0_14),
		.io_out_wr_0_bits_data_0_15(tensorGemm_io_out_wr_0_bits_data_0_15)
	);
	TensorAlu tensorAlu(
		.clk(tensorAlu_clock),
		.rst(tensorAlu_reset),
		.io_start(tensorAlu_io_start),
		.io_done(tensorAlu_io_done),
		.io_dec_alu_imm(tensorAlu_io_dec_alu_imm),
		.io_dec_alu_use_imm(tensorAlu_io_dec_alu_use_imm),
		.io_dec_alu_op(tensorAlu_io_dec_alu_op),
		.io_dec_src_1(tensorAlu_io_dec_src_1),
		.io_dec_src_0(tensorAlu_io_dec_src_0),
		.io_dec_dst_1(tensorAlu_io_dec_dst_1),
		.io_dec_dst_0(tensorAlu_io_dec_dst_0),
		.io_dec_lp_1(tensorAlu_io_dec_lp_1),
		.io_dec_lp_0(tensorAlu_io_dec_lp_0),
		.io_dec_uop_end(tensorAlu_io_dec_uop_end),
		.io_dec_uop_begin(tensorAlu_io_dec_uop_begin),
		.io_uop_idx_valid(tensorAlu_io_uop_idx_valid),
		.io_uop_idx_bits(tensorAlu_io_uop_idx_bits),
		.io_uop_data_bits_u2(tensorAlu_io_uop_data_bits_u2),
		.io_uop_data_bits_u1(tensorAlu_io_uop_data_bits_u1),
		.io_uop_data_bits_u0(tensorAlu_io_uop_data_bits_u0),
		.io_acc_rd_0_idx_valid(tensorAlu_io_acc_rd_0_idx_valid),
		.io_acc_rd_0_idx_bits(tensorAlu_io_acc_rd_0_idx_bits),
		.io_acc_rd_0_data_valid(tensorAlu_io_acc_rd_0_data_valid),
		.io_acc_rd_0_data_bits_0_0(tensorAlu_io_acc_rd_0_data_bits_0_0),
		.io_acc_rd_0_data_bits_0_1(tensorAlu_io_acc_rd_0_data_bits_0_1),
		.io_acc_rd_0_data_bits_0_2(tensorAlu_io_acc_rd_0_data_bits_0_2),
		.io_acc_rd_0_data_bits_0_3(tensorAlu_io_acc_rd_0_data_bits_0_3),
		.io_acc_rd_0_data_bits_0_4(tensorAlu_io_acc_rd_0_data_bits_0_4),
		.io_acc_rd_0_data_bits_0_5(tensorAlu_io_acc_rd_0_data_bits_0_5),
		.io_acc_rd_0_data_bits_0_6(tensorAlu_io_acc_rd_0_data_bits_0_6),
		.io_acc_rd_0_data_bits_0_7(tensorAlu_io_acc_rd_0_data_bits_0_7),
		.io_acc_rd_0_data_bits_0_8(tensorAlu_io_acc_rd_0_data_bits_0_8),
		.io_acc_rd_0_data_bits_0_9(tensorAlu_io_acc_rd_0_data_bits_0_9),
		.io_acc_rd_0_data_bits_0_10(tensorAlu_io_acc_rd_0_data_bits_0_10),
		.io_acc_rd_0_data_bits_0_11(tensorAlu_io_acc_rd_0_data_bits_0_11),
		.io_acc_rd_0_data_bits_0_12(tensorAlu_io_acc_rd_0_data_bits_0_12),
		.io_acc_rd_0_data_bits_0_13(tensorAlu_io_acc_rd_0_data_bits_0_13),
		.io_acc_rd_0_data_bits_0_14(tensorAlu_io_acc_rd_0_data_bits_0_14),
		.io_acc_rd_0_data_bits_0_15(tensorAlu_io_acc_rd_0_data_bits_0_15),
		.io_acc_wr_0_valid(tensorAlu_io_acc_wr_0_valid),
		.io_acc_wr_0_bits_idx(tensorAlu_io_acc_wr_0_bits_idx),
		.io_acc_wr_0_bits_data_0_0(tensorAlu_io_acc_wr_0_bits_data_0_0),
		.io_acc_wr_0_bits_data_0_1(tensorAlu_io_acc_wr_0_bits_data_0_1),
		.io_acc_wr_0_bits_data_0_2(tensorAlu_io_acc_wr_0_bits_data_0_2),
		.io_acc_wr_0_bits_data_0_3(tensorAlu_io_acc_wr_0_bits_data_0_3),
		.io_acc_wr_0_bits_data_0_4(tensorAlu_io_acc_wr_0_bits_data_0_4),
		.io_acc_wr_0_bits_data_0_5(tensorAlu_io_acc_wr_0_bits_data_0_5),
		.io_acc_wr_0_bits_data_0_6(tensorAlu_io_acc_wr_0_bits_data_0_6),
		.io_acc_wr_0_bits_data_0_7(tensorAlu_io_acc_wr_0_bits_data_0_7),
		.io_acc_wr_0_bits_data_0_8(tensorAlu_io_acc_wr_0_bits_data_0_8),
		.io_acc_wr_0_bits_data_0_9(tensorAlu_io_acc_wr_0_bits_data_0_9),
		.io_acc_wr_0_bits_data_0_10(tensorAlu_io_acc_wr_0_bits_data_0_10),
		.io_acc_wr_0_bits_data_0_11(tensorAlu_io_acc_wr_0_bits_data_0_11),
		.io_acc_wr_0_bits_data_0_12(tensorAlu_io_acc_wr_0_bits_data_0_12),
		.io_acc_wr_0_bits_data_0_13(tensorAlu_io_acc_wr_0_bits_data_0_13),
		.io_acc_wr_0_bits_data_0_14(tensorAlu_io_acc_wr_0_bits_data_0_14),
		.io_acc_wr_0_bits_data_0_15(tensorAlu_io_acc_wr_0_bits_data_0_15),
		.io_out_rd_0_data_valid(tensorAlu_io_out_rd_0_data_valid),
		.io_out_wr_0_valid(tensorAlu_io_out_wr_0_valid),
		.io_out_wr_0_bits_idx(tensorAlu_io_out_wr_0_bits_idx),
		.io_out_wr_0_bits_data_0_0(tensorAlu_io_out_wr_0_bits_data_0_0),
		.io_out_wr_0_bits_data_0_1(tensorAlu_io_out_wr_0_bits_data_0_1),
		.io_out_wr_0_bits_data_0_2(tensorAlu_io_out_wr_0_bits_data_0_2),
		.io_out_wr_0_bits_data_0_3(tensorAlu_io_out_wr_0_bits_data_0_3),
		.io_out_wr_0_bits_data_0_4(tensorAlu_io_out_wr_0_bits_data_0_4),
		.io_out_wr_0_bits_data_0_5(tensorAlu_io_out_wr_0_bits_data_0_5),
		.io_out_wr_0_bits_data_0_6(tensorAlu_io_out_wr_0_bits_data_0_6),
		.io_out_wr_0_bits_data_0_7(tensorAlu_io_out_wr_0_bits_data_0_7),
		.io_out_wr_0_bits_data_0_8(tensorAlu_io_out_wr_0_bits_data_0_8),
		.io_out_wr_0_bits_data_0_9(tensorAlu_io_out_wr_0_bits_data_0_9),
		.io_out_wr_0_bits_data_0_10(tensorAlu_io_out_wr_0_bits_data_0_10),
		.io_out_wr_0_bits_data_0_11(tensorAlu_io_out_wr_0_bits_data_0_11),
		.io_out_wr_0_bits_data_0_12(tensorAlu_io_out_wr_0_bits_data_0_12),
		.io_out_wr_0_bits_data_0_13(tensorAlu_io_out_wr_0_bits_data_0_13),
		.io_out_wr_0_bits_data_0_14(tensorAlu_io_out_wr_0_bits_data_0_14),
		.io_out_wr_0_bits_data_0_15(tensorAlu_io_out_wr_0_bits_data_0_15)
	);
	SyncQueue_1 inst_q(
		.clk(inst_q_clock),
		.rst(inst_q_reset),
		.io_enq_ready(inst_q_io_enq_ready),
		.io_enq_valid(inst_q_io_enq_valid),
		.io_enq_bits(inst_q_io_enq_bits),
		.io_deq_ready(inst_q_io_deq_ready),
		.io_deq_valid(inst_q_io_deq_valid),
		.io_deq_bits(inst_q_io_deq_bits)
	);
	ComputeDecode dec(
		.io_inst(dec_io_inst),
		.io_push_next(dec_io_push_next),
		.io_push_prev(dec_io_push_prev),
		.io_pop_next(dec_io_pop_next),
		.io_pop_prev(dec_io_pop_prev),
		.io_isLoadAcc(dec_io_isLoadAcc),
		.io_isLoadUop(dec_io_isLoadUop),
		.io_isSync(dec_io_isSync),
		.io_isAlu(dec_io_isAlu),
		.io_isGemm(dec_io_isGemm),
		.io_isFinish(dec_io_isFinish)
	);
	assign io_o_post_0 = dec_io_push_prev & _inst_q_io_deq_ready_T_3;
	assign io_o_post_1 = dec_io_push_next & _inst_q_io_deq_ready_T_3;
	assign io_inst_ready = inst_q_io_enq_ready;
	assign io_vme_rd_0_cmd_valid = loadUop_io_vme_rd_cmd_valid;
	assign io_vme_rd_0_cmd_bits_addr = loadUop_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_0_cmd_bits_len = loadUop_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_0_cmd_bits_tag = loadUop_io_vme_rd_cmd_bits_tag;
	assign io_vme_rd_1_cmd_valid = tensorAcc_io_vme_rd_cmd_valid;
	assign io_vme_rd_1_cmd_bits_addr = tensorAcc_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_1_cmd_bits_len = tensorAcc_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_1_cmd_bits_tag = tensorAcc_io_vme_rd_cmd_bits_tag;
	assign io_inp_rd_0_idx_valid = tensorGemm_io_inp_rd_0_idx_valid;
	assign io_inp_rd_0_idx_bits = tensorGemm_io_inp_rd_0_idx_bits;
	assign io_wgt_rd_0_idx_valid = tensorGemm_io_wgt_rd_0_idx_valid;
	assign io_wgt_rd_0_idx_bits = tensorGemm_io_wgt_rd_0_idx_bits;
	assign io_out_wr_0_valid = (io_out_wr_0_valid_REG ? tensorGemm_io_out_wr_0_valid : tensorAlu_io_out_wr_0_valid);
	assign io_out_wr_0_bits_idx = (io_out_wr_0_bits_idx_REG ? tensorGemm_io_out_wr_0_bits_idx : tensorAlu_io_out_wr_0_bits_idx);
	assign io_out_wr_0_bits_data_0_0 = outDataBits_0[7:0];
	assign io_out_wr_0_bits_data_0_1 = outDataBits_0[15:8];
	assign io_out_wr_0_bits_data_0_2 = outDataBits_0[23:16];
	assign io_out_wr_0_bits_data_0_3 = outDataBits_0[31:24];
	assign io_out_wr_0_bits_data_0_4 = outDataBits_0[39:32];
	assign io_out_wr_0_bits_data_0_5 = outDataBits_0[47:40];
	assign io_out_wr_0_bits_data_0_6 = outDataBits_0[55:48];
	assign io_out_wr_0_bits_data_0_7 = outDataBits_0[63:56];
	assign io_out_wr_0_bits_data_0_8 = outDataBits_0[71:64];
	assign io_out_wr_0_bits_data_0_9 = outDataBits_0[79:72];
	assign io_out_wr_0_bits_data_0_10 = outDataBits_0[87:80];
	assign io_out_wr_0_bits_data_0_11 = outDataBits_0[95:88];
	assign io_out_wr_0_bits_data_0_12 = outDataBits_0[103:96];
	assign io_out_wr_0_bits_data_0_13 = outDataBits_0[111:104];
	assign io_out_wr_0_bits_data_0_14 = outDataBits_0[119:112];
	assign io_out_wr_0_bits_data_0_15 = outDataBits_0[127:120];
	assign io_finish = _inst_q_io_deq_ready_T_1 & dec_io_isFinish;
	assign io_acc_wr_event = tensorAcc_io_tensor_wr_0_valid;
	assign s_0_clock = clk;
	assign s_0_reset = rst;
	assign s_0_io_spost = io_i_post_0;
	assign s_0_io_swait = dec_io_pop_prev & _loadUop_io_start_T_1;
	assign s_1_clock = clk;
	assign s_1_reset = rst;
	assign s_1_io_spost = io_i_post_1;
	assign s_1_io_swait = dec_io_pop_next & _loadUop_io_start_T_1;
	assign loadUop_clock = clk;
	assign loadUop_reset = rst;
	assign loadUop_io_start = ((state == 2'h0) & start) & dec_io_isLoadUop;
	assign loadUop_io_inst = inst_q_io_deq_bits;
	assign loadUop_io_baddr = io_uop_baddr;
	assign loadUop_io_vme_rd_cmd_ready = io_vme_rd_0_cmd_ready;
	assign loadUop_io_vme_rd_data_valid = io_vme_rd_0_data_valid;
	assign loadUop_io_vme_rd_data_bits_data = io_vme_rd_0_data_bits_data;
	assign loadUop_io_vme_rd_data_bits_tag = io_vme_rd_0_data_bits_tag;
	assign loadUop_io_vme_rd_data_bits_last = io_vme_rd_0_data_bits_last;
	assign loadUop_io_uop_idx_valid = (dec_io_isGemm ? tensorGemm_io_uop_idx_valid : tensorAlu_io_uop_idx_valid);
	assign loadUop_io_uop_idx_bits = (dec_io_isGemm ? tensorGemm_io_uop_idx_bits : tensorAlu_io_uop_idx_bits);
	assign tensorAcc_clock = clk;
	assign tensorAcc_reset = rst;
	assign tensorAcc_io_start = _loadUop_io_start_T_1 & dec_io_isLoadAcc;
	assign tensorAcc_io_inst = inst_q_io_deq_bits;
	assign tensorAcc_io_baddr = io_acc_baddr;
	assign tensorAcc_io_vme_rd_cmd_ready = io_vme_rd_1_cmd_ready;
	assign tensorAcc_io_vme_rd_data_valid = io_vme_rd_1_data_valid;
	assign tensorAcc_io_vme_rd_data_bits_data = io_vme_rd_1_data_bits_data;
	assign tensorAcc_io_vme_rd_data_bits_tag = io_vme_rd_1_data_bits_tag;
	assign tensorAcc_io_tensor_rd_0_idx_valid = (tensorAcc_io_tensor_rd_0_idx_REG ? tensorGemm_io_acc_rd_0_idx_valid : tensorAlu_io_acc_rd_0_idx_valid);
	assign tensorAcc_io_tensor_rd_0_idx_bits = (tensorAcc_io_tensor_rd_0_idx_REG ? tensorGemm_io_acc_rd_0_idx_bits : tensorAlu_io_acc_rd_0_idx_bits);
	assign tensorAcc_io_tensor_wr_0_valid = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_valid : tensorAlu_io_acc_wr_0_valid);
	assign tensorAcc_io_tensor_wr_0_bits_idx = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_idx : tensorAlu_io_acc_wr_0_bits_idx);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_0 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_0 : tensorAlu_io_acc_wr_0_bits_data_0_0);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_1 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_1 : tensorAlu_io_acc_wr_0_bits_data_0_1);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_2 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_2 : tensorAlu_io_acc_wr_0_bits_data_0_2);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_3 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_3 : tensorAlu_io_acc_wr_0_bits_data_0_3);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_4 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_4 : tensorAlu_io_acc_wr_0_bits_data_0_4);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_5 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_5 : tensorAlu_io_acc_wr_0_bits_data_0_5);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_6 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_6 : tensorAlu_io_acc_wr_0_bits_data_0_6);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_7 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_7 : tensorAlu_io_acc_wr_0_bits_data_0_7);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_8 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_8 : tensorAlu_io_acc_wr_0_bits_data_0_8);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_9 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_9 : tensorAlu_io_acc_wr_0_bits_data_0_9);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_10 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_10 : tensorAlu_io_acc_wr_0_bits_data_0_10);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_11 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_11 : tensorAlu_io_acc_wr_0_bits_data_0_11);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_12 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_12 : tensorAlu_io_acc_wr_0_bits_data_0_12);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_13 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_13 : tensorAlu_io_acc_wr_0_bits_data_0_13);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_14 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_14 : tensorAlu_io_acc_wr_0_bits_data_0_14);
	assign tensorAcc_io_tensor_wr_0_bits_data_0_15 = (tensorAcc_io_tensor_wr_0_REG ? tensorGemm_io_acc_wr_0_bits_data_0_15 : tensorAlu_io_acc_wr_0_bits_data_0_15);
	assign tensorGemm_clock = clk;
	assign tensorGemm_reset = rst;
	assign tensorGemm_io_start = tensorGemm_io_start_REG;
	assign tensorGemm_io_dec_wgt_1 = _tensorGemm_io_dec_WIRE_1[127:118];
	assign tensorGemm_io_dec_wgt_0 = _tensorGemm_io_dec_WIRE_1[117:108];
	assign tensorGemm_io_dec_inp_1 = _tensorGemm_io_dec_WIRE_1[107:97];
	assign tensorGemm_io_dec_inp_0 = _tensorGemm_io_dec_WIRE_1[96:86];
	assign tensorGemm_io_dec_acc_1 = _tensorGemm_io_dec_WIRE_1[85:75];
	assign tensorGemm_io_dec_acc_0 = _tensorGemm_io_dec_WIRE_1[74:64];
	assign tensorGemm_io_dec_empty_0 = _tensorGemm_io_dec_WIRE_1[63];
	assign tensorGemm_io_dec_lp_1 = _tensorGemm_io_dec_WIRE_1[62:49];
	assign tensorGemm_io_dec_lp_0 = _tensorGemm_io_dec_WIRE_1[48:35];
	assign tensorGemm_io_dec_uop_end = _tensorGemm_io_dec_WIRE_1[34:21];
	assign tensorGemm_io_dec_uop_begin = _tensorGemm_io_dec_WIRE_1[20:8];
	assign tensorGemm_io_dec_reset = _tensorGemm_io_dec_WIRE_1[7];
	assign tensorGemm_io_dec_push_next = _tensorGemm_io_dec_WIRE_1[6];
	assign tensorGemm_io_dec_push_prev = _tensorGemm_io_dec_WIRE_1[5];
	assign tensorGemm_io_dec_pop_next = _tensorGemm_io_dec_WIRE_1[4];
	assign tensorGemm_io_dec_pop_prev = _tensorGemm_io_dec_WIRE_1[3];
	assign tensorGemm_io_dec_op = _tensorGemm_io_dec_WIRE_1[2:0];
	assign tensorGemm_io_uop_data_valid = loadUop_io_uop_data_valid & dec_io_isGemm;
	assign tensorGemm_io_uop_data_bits_u2 = loadUop_io_uop_data_bits_u2;
	assign tensorGemm_io_uop_data_bits_u1 = loadUop_io_uop_data_bits_u1;
	assign tensorGemm_io_uop_data_bits_u0 = loadUop_io_uop_data_bits_u0;
	assign tensorGemm_io_inp_rd_0_data_valid = io_inp_rd_0_data_valid;
	assign tensorGemm_io_inp_rd_0_data_bits_0_0 = io_inp_rd_0_data_bits_0_0;
	assign tensorGemm_io_inp_rd_0_data_bits_0_1 = io_inp_rd_0_data_bits_0_1;
	assign tensorGemm_io_inp_rd_0_data_bits_0_2 = io_inp_rd_0_data_bits_0_2;
	assign tensorGemm_io_inp_rd_0_data_bits_0_3 = io_inp_rd_0_data_bits_0_3;
	assign tensorGemm_io_inp_rd_0_data_bits_0_4 = io_inp_rd_0_data_bits_0_4;
	assign tensorGemm_io_inp_rd_0_data_bits_0_5 = io_inp_rd_0_data_bits_0_5;
	assign tensorGemm_io_inp_rd_0_data_bits_0_6 = io_inp_rd_0_data_bits_0_6;
	assign tensorGemm_io_inp_rd_0_data_bits_0_7 = io_inp_rd_0_data_bits_0_7;
	assign tensorGemm_io_inp_rd_0_data_bits_0_8 = io_inp_rd_0_data_bits_0_8;
	assign tensorGemm_io_inp_rd_0_data_bits_0_9 = io_inp_rd_0_data_bits_0_9;
	assign tensorGemm_io_inp_rd_0_data_bits_0_10 = io_inp_rd_0_data_bits_0_10;
	assign tensorGemm_io_inp_rd_0_data_bits_0_11 = io_inp_rd_0_data_bits_0_11;
	assign tensorGemm_io_inp_rd_0_data_bits_0_12 = io_inp_rd_0_data_bits_0_12;
	assign tensorGemm_io_inp_rd_0_data_bits_0_13 = io_inp_rd_0_data_bits_0_13;
	assign tensorGemm_io_inp_rd_0_data_bits_0_14 = io_inp_rd_0_data_bits_0_14;
	assign tensorGemm_io_inp_rd_0_data_bits_0_15 = io_inp_rd_0_data_bits_0_15;
	assign tensorGemm_io_wgt_rd_0_data_valid = io_wgt_rd_0_data_valid;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_0 = io_wgt_rd_0_data_bits_0_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_1 = io_wgt_rd_0_data_bits_0_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_2 = io_wgt_rd_0_data_bits_0_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_3 = io_wgt_rd_0_data_bits_0_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_4 = io_wgt_rd_0_data_bits_0_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_5 = io_wgt_rd_0_data_bits_0_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_6 = io_wgt_rd_0_data_bits_0_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_7 = io_wgt_rd_0_data_bits_0_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_8 = io_wgt_rd_0_data_bits_0_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_9 = io_wgt_rd_0_data_bits_0_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_10 = io_wgt_rd_0_data_bits_0_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_11 = io_wgt_rd_0_data_bits_0_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_12 = io_wgt_rd_0_data_bits_0_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_13 = io_wgt_rd_0_data_bits_0_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_14 = io_wgt_rd_0_data_bits_0_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_0_15 = io_wgt_rd_0_data_bits_0_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_0 = io_wgt_rd_0_data_bits_1_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_1 = io_wgt_rd_0_data_bits_1_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_2 = io_wgt_rd_0_data_bits_1_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_3 = io_wgt_rd_0_data_bits_1_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_4 = io_wgt_rd_0_data_bits_1_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_5 = io_wgt_rd_0_data_bits_1_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_6 = io_wgt_rd_0_data_bits_1_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_7 = io_wgt_rd_0_data_bits_1_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_8 = io_wgt_rd_0_data_bits_1_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_9 = io_wgt_rd_0_data_bits_1_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_10 = io_wgt_rd_0_data_bits_1_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_11 = io_wgt_rd_0_data_bits_1_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_12 = io_wgt_rd_0_data_bits_1_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_13 = io_wgt_rd_0_data_bits_1_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_14 = io_wgt_rd_0_data_bits_1_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_1_15 = io_wgt_rd_0_data_bits_1_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_0 = io_wgt_rd_0_data_bits_2_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_1 = io_wgt_rd_0_data_bits_2_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_2 = io_wgt_rd_0_data_bits_2_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_3 = io_wgt_rd_0_data_bits_2_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_4 = io_wgt_rd_0_data_bits_2_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_5 = io_wgt_rd_0_data_bits_2_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_6 = io_wgt_rd_0_data_bits_2_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_7 = io_wgt_rd_0_data_bits_2_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_8 = io_wgt_rd_0_data_bits_2_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_9 = io_wgt_rd_0_data_bits_2_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_10 = io_wgt_rd_0_data_bits_2_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_11 = io_wgt_rd_0_data_bits_2_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_12 = io_wgt_rd_0_data_bits_2_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_13 = io_wgt_rd_0_data_bits_2_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_14 = io_wgt_rd_0_data_bits_2_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_2_15 = io_wgt_rd_0_data_bits_2_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_0 = io_wgt_rd_0_data_bits_3_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_1 = io_wgt_rd_0_data_bits_3_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_2 = io_wgt_rd_0_data_bits_3_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_3 = io_wgt_rd_0_data_bits_3_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_4 = io_wgt_rd_0_data_bits_3_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_5 = io_wgt_rd_0_data_bits_3_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_6 = io_wgt_rd_0_data_bits_3_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_7 = io_wgt_rd_0_data_bits_3_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_8 = io_wgt_rd_0_data_bits_3_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_9 = io_wgt_rd_0_data_bits_3_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_10 = io_wgt_rd_0_data_bits_3_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_11 = io_wgt_rd_0_data_bits_3_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_12 = io_wgt_rd_0_data_bits_3_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_13 = io_wgt_rd_0_data_bits_3_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_14 = io_wgt_rd_0_data_bits_3_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_3_15 = io_wgt_rd_0_data_bits_3_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_0 = io_wgt_rd_0_data_bits_4_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_1 = io_wgt_rd_0_data_bits_4_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_2 = io_wgt_rd_0_data_bits_4_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_3 = io_wgt_rd_0_data_bits_4_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_4 = io_wgt_rd_0_data_bits_4_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_5 = io_wgt_rd_0_data_bits_4_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_6 = io_wgt_rd_0_data_bits_4_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_7 = io_wgt_rd_0_data_bits_4_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_8 = io_wgt_rd_0_data_bits_4_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_9 = io_wgt_rd_0_data_bits_4_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_10 = io_wgt_rd_0_data_bits_4_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_11 = io_wgt_rd_0_data_bits_4_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_12 = io_wgt_rd_0_data_bits_4_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_13 = io_wgt_rd_0_data_bits_4_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_14 = io_wgt_rd_0_data_bits_4_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_4_15 = io_wgt_rd_0_data_bits_4_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_0 = io_wgt_rd_0_data_bits_5_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_1 = io_wgt_rd_0_data_bits_5_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_2 = io_wgt_rd_0_data_bits_5_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_3 = io_wgt_rd_0_data_bits_5_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_4 = io_wgt_rd_0_data_bits_5_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_5 = io_wgt_rd_0_data_bits_5_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_6 = io_wgt_rd_0_data_bits_5_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_7 = io_wgt_rd_0_data_bits_5_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_8 = io_wgt_rd_0_data_bits_5_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_9 = io_wgt_rd_0_data_bits_5_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_10 = io_wgt_rd_0_data_bits_5_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_11 = io_wgt_rd_0_data_bits_5_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_12 = io_wgt_rd_0_data_bits_5_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_13 = io_wgt_rd_0_data_bits_5_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_14 = io_wgt_rd_0_data_bits_5_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_5_15 = io_wgt_rd_0_data_bits_5_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_0 = io_wgt_rd_0_data_bits_6_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_1 = io_wgt_rd_0_data_bits_6_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_2 = io_wgt_rd_0_data_bits_6_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_3 = io_wgt_rd_0_data_bits_6_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_4 = io_wgt_rd_0_data_bits_6_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_5 = io_wgt_rd_0_data_bits_6_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_6 = io_wgt_rd_0_data_bits_6_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_7 = io_wgt_rd_0_data_bits_6_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_8 = io_wgt_rd_0_data_bits_6_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_9 = io_wgt_rd_0_data_bits_6_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_10 = io_wgt_rd_0_data_bits_6_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_11 = io_wgt_rd_0_data_bits_6_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_12 = io_wgt_rd_0_data_bits_6_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_13 = io_wgt_rd_0_data_bits_6_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_14 = io_wgt_rd_0_data_bits_6_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_6_15 = io_wgt_rd_0_data_bits_6_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_0 = io_wgt_rd_0_data_bits_7_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_1 = io_wgt_rd_0_data_bits_7_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_2 = io_wgt_rd_0_data_bits_7_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_3 = io_wgt_rd_0_data_bits_7_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_4 = io_wgt_rd_0_data_bits_7_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_5 = io_wgt_rd_0_data_bits_7_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_6 = io_wgt_rd_0_data_bits_7_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_7 = io_wgt_rd_0_data_bits_7_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_8 = io_wgt_rd_0_data_bits_7_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_9 = io_wgt_rd_0_data_bits_7_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_10 = io_wgt_rd_0_data_bits_7_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_11 = io_wgt_rd_0_data_bits_7_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_12 = io_wgt_rd_0_data_bits_7_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_13 = io_wgt_rd_0_data_bits_7_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_14 = io_wgt_rd_0_data_bits_7_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_7_15 = io_wgt_rd_0_data_bits_7_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_0 = io_wgt_rd_0_data_bits_8_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_1 = io_wgt_rd_0_data_bits_8_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_2 = io_wgt_rd_0_data_bits_8_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_3 = io_wgt_rd_0_data_bits_8_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_4 = io_wgt_rd_0_data_bits_8_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_5 = io_wgt_rd_0_data_bits_8_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_6 = io_wgt_rd_0_data_bits_8_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_7 = io_wgt_rd_0_data_bits_8_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_8 = io_wgt_rd_0_data_bits_8_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_9 = io_wgt_rd_0_data_bits_8_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_10 = io_wgt_rd_0_data_bits_8_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_11 = io_wgt_rd_0_data_bits_8_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_12 = io_wgt_rd_0_data_bits_8_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_13 = io_wgt_rd_0_data_bits_8_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_14 = io_wgt_rd_0_data_bits_8_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_8_15 = io_wgt_rd_0_data_bits_8_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_0 = io_wgt_rd_0_data_bits_9_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_1 = io_wgt_rd_0_data_bits_9_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_2 = io_wgt_rd_0_data_bits_9_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_3 = io_wgt_rd_0_data_bits_9_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_4 = io_wgt_rd_0_data_bits_9_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_5 = io_wgt_rd_0_data_bits_9_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_6 = io_wgt_rd_0_data_bits_9_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_7 = io_wgt_rd_0_data_bits_9_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_8 = io_wgt_rd_0_data_bits_9_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_9 = io_wgt_rd_0_data_bits_9_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_10 = io_wgt_rd_0_data_bits_9_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_11 = io_wgt_rd_0_data_bits_9_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_12 = io_wgt_rd_0_data_bits_9_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_13 = io_wgt_rd_0_data_bits_9_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_14 = io_wgt_rd_0_data_bits_9_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_9_15 = io_wgt_rd_0_data_bits_9_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_0 = io_wgt_rd_0_data_bits_10_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_1 = io_wgt_rd_0_data_bits_10_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_2 = io_wgt_rd_0_data_bits_10_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_3 = io_wgt_rd_0_data_bits_10_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_4 = io_wgt_rd_0_data_bits_10_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_5 = io_wgt_rd_0_data_bits_10_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_6 = io_wgt_rd_0_data_bits_10_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_7 = io_wgt_rd_0_data_bits_10_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_8 = io_wgt_rd_0_data_bits_10_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_9 = io_wgt_rd_0_data_bits_10_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_10 = io_wgt_rd_0_data_bits_10_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_11 = io_wgt_rd_0_data_bits_10_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_12 = io_wgt_rd_0_data_bits_10_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_13 = io_wgt_rd_0_data_bits_10_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_14 = io_wgt_rd_0_data_bits_10_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_10_15 = io_wgt_rd_0_data_bits_10_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_0 = io_wgt_rd_0_data_bits_11_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_1 = io_wgt_rd_0_data_bits_11_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_2 = io_wgt_rd_0_data_bits_11_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_3 = io_wgt_rd_0_data_bits_11_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_4 = io_wgt_rd_0_data_bits_11_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_5 = io_wgt_rd_0_data_bits_11_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_6 = io_wgt_rd_0_data_bits_11_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_7 = io_wgt_rd_0_data_bits_11_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_8 = io_wgt_rd_0_data_bits_11_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_9 = io_wgt_rd_0_data_bits_11_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_10 = io_wgt_rd_0_data_bits_11_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_11 = io_wgt_rd_0_data_bits_11_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_12 = io_wgt_rd_0_data_bits_11_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_13 = io_wgt_rd_0_data_bits_11_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_14 = io_wgt_rd_0_data_bits_11_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_11_15 = io_wgt_rd_0_data_bits_11_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_0 = io_wgt_rd_0_data_bits_12_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_1 = io_wgt_rd_0_data_bits_12_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_2 = io_wgt_rd_0_data_bits_12_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_3 = io_wgt_rd_0_data_bits_12_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_4 = io_wgt_rd_0_data_bits_12_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_5 = io_wgt_rd_0_data_bits_12_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_6 = io_wgt_rd_0_data_bits_12_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_7 = io_wgt_rd_0_data_bits_12_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_8 = io_wgt_rd_0_data_bits_12_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_9 = io_wgt_rd_0_data_bits_12_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_10 = io_wgt_rd_0_data_bits_12_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_11 = io_wgt_rd_0_data_bits_12_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_12 = io_wgt_rd_0_data_bits_12_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_13 = io_wgt_rd_0_data_bits_12_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_14 = io_wgt_rd_0_data_bits_12_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_12_15 = io_wgt_rd_0_data_bits_12_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_0 = io_wgt_rd_0_data_bits_13_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_1 = io_wgt_rd_0_data_bits_13_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_2 = io_wgt_rd_0_data_bits_13_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_3 = io_wgt_rd_0_data_bits_13_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_4 = io_wgt_rd_0_data_bits_13_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_5 = io_wgt_rd_0_data_bits_13_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_6 = io_wgt_rd_0_data_bits_13_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_7 = io_wgt_rd_0_data_bits_13_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_8 = io_wgt_rd_0_data_bits_13_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_9 = io_wgt_rd_0_data_bits_13_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_10 = io_wgt_rd_0_data_bits_13_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_11 = io_wgt_rd_0_data_bits_13_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_12 = io_wgt_rd_0_data_bits_13_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_13 = io_wgt_rd_0_data_bits_13_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_14 = io_wgt_rd_0_data_bits_13_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_13_15 = io_wgt_rd_0_data_bits_13_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_0 = io_wgt_rd_0_data_bits_14_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_1 = io_wgt_rd_0_data_bits_14_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_2 = io_wgt_rd_0_data_bits_14_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_3 = io_wgt_rd_0_data_bits_14_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_4 = io_wgt_rd_0_data_bits_14_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_5 = io_wgt_rd_0_data_bits_14_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_6 = io_wgt_rd_0_data_bits_14_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_7 = io_wgt_rd_0_data_bits_14_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_8 = io_wgt_rd_0_data_bits_14_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_9 = io_wgt_rd_0_data_bits_14_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_10 = io_wgt_rd_0_data_bits_14_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_11 = io_wgt_rd_0_data_bits_14_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_12 = io_wgt_rd_0_data_bits_14_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_13 = io_wgt_rd_0_data_bits_14_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_14 = io_wgt_rd_0_data_bits_14_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_14_15 = io_wgt_rd_0_data_bits_14_15;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_0 = io_wgt_rd_0_data_bits_15_0;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_1 = io_wgt_rd_0_data_bits_15_1;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_2 = io_wgt_rd_0_data_bits_15_2;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_3 = io_wgt_rd_0_data_bits_15_3;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_4 = io_wgt_rd_0_data_bits_15_4;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_5 = io_wgt_rd_0_data_bits_15_5;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_6 = io_wgt_rd_0_data_bits_15_6;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_7 = io_wgt_rd_0_data_bits_15_7;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_8 = io_wgt_rd_0_data_bits_15_8;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_9 = io_wgt_rd_0_data_bits_15_9;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_10 = io_wgt_rd_0_data_bits_15_10;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_11 = io_wgt_rd_0_data_bits_15_11;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_12 = io_wgt_rd_0_data_bits_15_12;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_13 = io_wgt_rd_0_data_bits_15_13;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_14 = io_wgt_rd_0_data_bits_15_14;
	assign tensorGemm_io_wgt_rd_0_data_bits_15_15 = io_wgt_rd_0_data_bits_15_15;
	assign tensorGemm_io_acc_rd_0_data_valid = tensorAcc_io_tensor_rd_0_data_valid & tensorGemm_io_acc_rd_0_data_valid_REG;
	assign tensorGemm_io_acc_rd_0_data_bits_0_0 = tensorAcc_io_tensor_rd_0_data_bits_0_0;
	assign tensorGemm_io_acc_rd_0_data_bits_0_1 = tensorAcc_io_tensor_rd_0_data_bits_0_1;
	assign tensorGemm_io_acc_rd_0_data_bits_0_2 = tensorAcc_io_tensor_rd_0_data_bits_0_2;
	assign tensorGemm_io_acc_rd_0_data_bits_0_3 = tensorAcc_io_tensor_rd_0_data_bits_0_3;
	assign tensorGemm_io_acc_rd_0_data_bits_0_4 = tensorAcc_io_tensor_rd_0_data_bits_0_4;
	assign tensorGemm_io_acc_rd_0_data_bits_0_5 = tensorAcc_io_tensor_rd_0_data_bits_0_5;
	assign tensorGemm_io_acc_rd_0_data_bits_0_6 = tensorAcc_io_tensor_rd_0_data_bits_0_6;
	assign tensorGemm_io_acc_rd_0_data_bits_0_7 = tensorAcc_io_tensor_rd_0_data_bits_0_7;
	assign tensorGemm_io_acc_rd_0_data_bits_0_8 = tensorAcc_io_tensor_rd_0_data_bits_0_8;
	assign tensorGemm_io_acc_rd_0_data_bits_0_9 = tensorAcc_io_tensor_rd_0_data_bits_0_9;
	assign tensorGemm_io_acc_rd_0_data_bits_0_10 = tensorAcc_io_tensor_rd_0_data_bits_0_10;
	assign tensorGemm_io_acc_rd_0_data_bits_0_11 = tensorAcc_io_tensor_rd_0_data_bits_0_11;
	assign tensorGemm_io_acc_rd_0_data_bits_0_12 = tensorAcc_io_tensor_rd_0_data_bits_0_12;
	assign tensorGemm_io_acc_rd_0_data_bits_0_13 = tensorAcc_io_tensor_rd_0_data_bits_0_13;
	assign tensorGemm_io_acc_rd_0_data_bits_0_14 = tensorAcc_io_tensor_rd_0_data_bits_0_14;
	assign tensorGemm_io_acc_rd_0_data_bits_0_15 = tensorAcc_io_tensor_rd_0_data_bits_0_15;
	assign tensorGemm_io_out_rd_0_data_valid = 1'h0;
	assign tensorAlu_clock = clk;
	assign tensorAlu_reset = rst;
	assign tensorAlu_io_start = tensorAlu_io_start_REG;
	assign tensorAlu_io_dec_alu_imm = _tensorGemm_io_dec_WIRE_1[127:112];
	assign tensorAlu_io_dec_alu_use_imm = _tensorGemm_io_dec_WIRE_1[111];
	assign tensorAlu_io_dec_alu_op = _tensorGemm_io_dec_WIRE_1[110:108];
	assign tensorAlu_io_dec_src_1 = _tensorGemm_io_dec_WIRE_1[107:97];
	assign tensorAlu_io_dec_src_0 = _tensorGemm_io_dec_WIRE_1[96:86];
	assign tensorAlu_io_dec_dst_1 = _tensorGemm_io_dec_WIRE_1[85:75];
	assign tensorAlu_io_dec_dst_0 = _tensorGemm_io_dec_WIRE_1[74:64];
	assign tensorAlu_io_dec_lp_1 = _tensorGemm_io_dec_WIRE_1[62:49];
	assign tensorAlu_io_dec_lp_0 = _tensorGemm_io_dec_WIRE_1[48:35];
	assign tensorAlu_io_dec_uop_end = _tensorGemm_io_dec_WIRE_1[34:21];
	assign tensorAlu_io_dec_uop_begin = _tensorGemm_io_dec_WIRE_1[20:8];
	assign tensorAlu_io_uop_data_bits_u2 = loadUop_io_uop_data_bits_u2;
	assign tensorAlu_io_uop_data_bits_u1 = loadUop_io_uop_data_bits_u1;
	assign tensorAlu_io_uop_data_bits_u0 = loadUop_io_uop_data_bits_u0;
	assign tensorAlu_io_acc_rd_0_data_valid = tensorAcc_io_tensor_rd_0_data_valid & tensorAlu_io_acc_rd_0_data_valid_REG;
	assign tensorAlu_io_acc_rd_0_data_bits_0_0 = tensorAcc_io_tensor_rd_0_data_bits_0_0;
	assign tensorAlu_io_acc_rd_0_data_bits_0_1 = tensorAcc_io_tensor_rd_0_data_bits_0_1;
	assign tensorAlu_io_acc_rd_0_data_bits_0_2 = tensorAcc_io_tensor_rd_0_data_bits_0_2;
	assign tensorAlu_io_acc_rd_0_data_bits_0_3 = tensorAcc_io_tensor_rd_0_data_bits_0_3;
	assign tensorAlu_io_acc_rd_0_data_bits_0_4 = tensorAcc_io_tensor_rd_0_data_bits_0_4;
	assign tensorAlu_io_acc_rd_0_data_bits_0_5 = tensorAcc_io_tensor_rd_0_data_bits_0_5;
	assign tensorAlu_io_acc_rd_0_data_bits_0_6 = tensorAcc_io_tensor_rd_0_data_bits_0_6;
	assign tensorAlu_io_acc_rd_0_data_bits_0_7 = tensorAcc_io_tensor_rd_0_data_bits_0_7;
	assign tensorAlu_io_acc_rd_0_data_bits_0_8 = tensorAcc_io_tensor_rd_0_data_bits_0_8;
	assign tensorAlu_io_acc_rd_0_data_bits_0_9 = tensorAcc_io_tensor_rd_0_data_bits_0_9;
	assign tensorAlu_io_acc_rd_0_data_bits_0_10 = tensorAcc_io_tensor_rd_0_data_bits_0_10;
	assign tensorAlu_io_acc_rd_0_data_bits_0_11 = tensorAcc_io_tensor_rd_0_data_bits_0_11;
	assign tensorAlu_io_acc_rd_0_data_bits_0_12 = tensorAcc_io_tensor_rd_0_data_bits_0_12;
	assign tensorAlu_io_acc_rd_0_data_bits_0_13 = tensorAcc_io_tensor_rd_0_data_bits_0_13;
	assign tensorAlu_io_acc_rd_0_data_bits_0_14 = tensorAcc_io_tensor_rd_0_data_bits_0_14;
	assign tensorAlu_io_acc_rd_0_data_bits_0_15 = tensorAcc_io_tensor_rd_0_data_bits_0_15;
	assign tensorAlu_io_out_rd_0_data_valid = 1'h0;
	assign inst_q_clock = clk;
	assign inst_q_reset = rst;
	assign inst_q_io_enq_valid = io_inst_valid;
	assign inst_q_io_enq_bits = io_inst_bits;
	assign inst_q_io_deq_ready = ((state == 2'h2) & done) | (state == 2'h1);
	assign dec_io_inst = inst_q_io_deq_bits;
	always @(posedge clk) begin
		if (rst)
			state <= 2'h0;
		else if (2'h0 == state) begin
			if (start) begin
				if (dec_io_isSync)
					state <= 2'h1;
				else
					state <= _GEN_0;
			end
		end
		else if (2'h1 == state)
			state <= 2'h0;
		else if (2'h2 == state)
			state <= _GEN_3;
		if (rst)
			tensorAcc_io_tensor_rd_0_idx_REG <= 1'h0;
		else
			tensorAcc_io_tensor_rd_0_idx_REG <= dec_io_isGemm;
		if (rst)
			tensorAcc_io_tensor_wr_0_REG <= 1'h0;
		else
			tensorAcc_io_tensor_wr_0_REG <= dec_io_isGemm;
		if (rst)
			tensorGemm_io_start_REG <= 1'h0;
		else
			tensorGemm_io_start_REG <= _loadUop_io_start_T_1 & dec_io_isGemm;
		if (rst)
			tensorGemm_io_acc_rd_0_data_valid_REG <= 1'h0;
		else
			tensorGemm_io_acc_rd_0_data_valid_REG <= dec_io_isGemm;
		if (rst)
			tensorAlu_io_start_REG <= 1'h0;
		else
			tensorAlu_io_start_REG <= _loadUop_io_start_T_1 & dec_io_isAlu;
		if (rst)
			tensorAlu_io_acc_rd_0_data_valid_REG <= 1'h0;
		else
			tensorAlu_io_acc_rd_0_data_valid_REG <= dec_io_isAlu;
		if (rst)
			io_out_wr_0_valid_REG <= 1'h0;
		else
			io_out_wr_0_valid_REG <= dec_io_isGemm;
		if (rst)
			io_out_wr_0_bits_idx_REG <= 1'h0;
		else
			io_out_wr_0_bits_idx_REG <= dec_io_isGemm;
		if (rst)
			outDataBits_0_REG <= 1'h0;
		else
			outDataBits_0_REG <= dec_io_isGemm;
		if (~rst & ~(~tensorGemm_io_uop_idx_valid | ~tensorAlu_io_uop_idx_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at Compute.scala:129 assert(!tensorGemm.io.uop.idx.valid || !tensorAlu.io.uop.idx.valid)\n");
		if (_T_8 & ~(~tensorGemm_io_out_rd_0_data_valid | ~tensorAlu_io_out_rd_0_data_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at Compute.scala:201 assert(!tensorGemm.io.out.rd(idx).data.valid || !tensorAlu.io.out.rd(idx).data.valid)\n");
		if (_T_8 & ~(~tensorGemm_io_out_wr_0_valid | ~tensorAlu_io_out_wr_0_valid))
			$fwrite(32'h80000002, "Assertion failed\n    at Compute.scala:203 assert(!tensorGemm.io.out.wr(idx).valid || !tensorAlu.io.out.wr(idx).valid)\n");
	end
	always @(posedge clk) begin
		if (~rst)
			;
		if (_T_8)
			;
		if (_T_8)
			;
		if (_T_8)
			;
	end
endmodule
module StoreDecode (
	io_inst,
	io_push_prev,
	io_pop_prev,
	io_isStore,
	io_isSync
);
	input [127:0] io_inst;
	output wire io_push_prev;
	output wire io_pop_prev;
	output wire io_isStore;
	output wire io_isSync;
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [127:0] _io_isStore_T = io_inst & 128'h00000000000000000000000000000007;
	wire _io_isStore_T_1 = 128'h00000000000000000000000000000001 == _io_isStore_T;
	assign io_push_prev = io_inst[5];
	assign io_pop_prev = io_inst[3];
	assign io_isStore = (128'h00000000000000000000000000000001 == _io_isStore_T) & (dec_xsize != 16'h0000);
	assign io_isSync = _io_isStore_T_1 & (dec_xsize == 16'h0000);
endmodule
module TensorStoreNarrowVME (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_wr_cmd_ready,
	io_vme_wr_cmd_valid,
	io_vme_wr_cmd_bits_addr,
	io_vme_wr_cmd_bits_len,
	io_vme_wr_data_ready,
	io_vme_wr_data_valid,
	io_vme_wr_data_bits_data,
	io_vme_wr_ack,
	io_tensor_wr_0_valid,
	io_tensor_wr_0_bits_idx,
	io_tensor_wr_0_bits_data_0_0,
	io_tensor_wr_0_bits_data_0_1,
	io_tensor_wr_0_bits_data_0_2,
	io_tensor_wr_0_bits_data_0_3,
	io_tensor_wr_0_bits_data_0_4,
	io_tensor_wr_0_bits_data_0_5,
	io_tensor_wr_0_bits_data_0_6,
	io_tensor_wr_0_bits_data_0_7,
	io_tensor_wr_0_bits_data_0_8,
	io_tensor_wr_0_bits_data_0_9,
	io_tensor_wr_0_bits_data_0_10,
	io_tensor_wr_0_bits_data_0_11,
	io_tensor_wr_0_bits_data_0_12,
	io_tensor_wr_0_bits_data_0_13,
	io_tensor_wr_0_bits_data_0_14,
	io_tensor_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_wr_cmd_ready;
	output wire io_vme_wr_cmd_valid;
	output wire [63:0] io_vme_wr_cmd_bits_addr;
	output wire [7:0] io_vme_wr_cmd_bits_len;
	input io_vme_wr_data_ready;
	output wire io_vme_wr_data_valid;
	output wire [63:0] io_vme_wr_data_bits_data;
	input io_vme_wr_ack;
	input io_tensor_wr_0_valid;
	input [10:0] io_tensor_wr_0_bits_idx;
	input [7:0] io_tensor_wr_0_bits_data_0_0;
	input [7:0] io_tensor_wr_0_bits_data_0_1;
	input [7:0] io_tensor_wr_0_bits_data_0_2;
	input [7:0] io_tensor_wr_0_bits_data_0_3;
	input [7:0] io_tensor_wr_0_bits_data_0_4;
	input [7:0] io_tensor_wr_0_bits_data_0_5;
	input [7:0] io_tensor_wr_0_bits_data_0_6;
	input [7:0] io_tensor_wr_0_bits_data_0_7;
	input [7:0] io_tensor_wr_0_bits_data_0_8;
	input [7:0] io_tensor_wr_0_bits_data_0_9;
	input [7:0] io_tensor_wr_0_bits_data_0_10;
	input [7:0] io_tensor_wr_0_bits_data_0_11;
	input [7:0] io_tensor_wr_0_bits_data_0_12;
	input [7:0] io_tensor_wr_0_bits_data_0_13;
	input [7:0] io_tensor_wr_0_bits_data_0_14;
	input [7:0] io_tensor_wr_0_bits_data_0_15;
	reg [63:0] tensorFile_0_0 [0:2047];
	wire tensorFile_0_0_MPORT_1_en;
	wire [10:0] tensorFile_0_0_MPORT_1_addr;
	wire [63:0] tensorFile_0_0_MPORT_1_data;
	wire [63:0] tensorFile_0_0_MPORT_data;
	wire [10:0] tensorFile_0_0_MPORT_addr;
	wire tensorFile_0_0_MPORT_mask;
	wire tensorFile_0_0_MPORT_en;
	reg tensorFile_0_0_MPORT_1_en_pipe_0;
	reg [10:0] tensorFile_0_0_MPORT_1_addr_pipe_0;
	reg [63:0] tensorFile_0_1 [0:2047];
	wire tensorFile_0_1_MPORT_1_en;
	wire [10:0] tensorFile_0_1_MPORT_1_addr;
	wire [63:0] tensorFile_0_1_MPORT_1_data;
	wire [63:0] tensorFile_0_1_MPORT_data;
	wire [10:0] tensorFile_0_1_MPORT_addr;
	wire tensorFile_0_1_MPORT_mask;
	wire tensorFile_0_1_MPORT_en;
	reg tensorFile_0_1_MPORT_1_en_pipe_0;
	reg [10:0] tensorFile_0_1_MPORT_1_addr_pipe_0;
	wire [15:0] dec_sram_offset = io_inst[25:10];
	wire [31:0] dec_dram_offset = io_inst[57:26];
	wire [15:0] dec_ysize = io_inst[79:64];
	wire [15:0] dec_xsize = io_inst[95:80];
	wire [15:0] dec_xstride = io_inst[111:96];
	reg [63:0] waddr_cur;
	reg [63:0] waddr_nxt;
	reg [7:0] xcnt;
	reg [7:0] xlen;
	reg [15:0] xrem;
	wire [16:0] xsize = {dec_xsize, 1'h0};
	reg [15:0] ycnt;
	reg [7:0] tag;
	reg [7:0] set;
	reg [63:0] xfer_bytes;
	wire [19:0] xstride_bytes = {dec_xstride, 4'h0};
	wire [35:0] _xfer_init_addr_T = {dec_dram_offset, 4'h0};
	wire [35:0] _xfer_init_addr_T_1 = 36'h0ffffffff & _xfer_init_addr_T;
	wire [63:0] _GEN_84 = {28'd0, _xfer_init_addr_T_1};
	wire [63:0] xfer_init_addr = io_baddr | _GEN_84;
	wire [63:0] xfer_split_addr = waddr_cur + xfer_bytes;
	wire [63:0] _GEN_85 = {44'd0, xstride_bytes};
	wire [63:0] xfer_stride_addr = waddr_nxt + _GEN_85;
	wire [63:0] _GEN_2 = xfer_init_addr % 64'h0000000000000800;
	wire [11:0] _xfer_init_bytes_T = _GEN_2[11:0];
	wire [11:0] xfer_init_bytes = 12'h800 - _xfer_init_bytes_T;
	wire [8:0] xfer_init_pulses = xfer_init_bytes[11:3];
	wire [63:0] _GEN_5 = xfer_split_addr % 64'h0000000000000800;
	wire [11:0] _xfer_split_bytes_T = _GEN_5[11:0];
	wire [11:0] xfer_split_bytes = 12'h800 - _xfer_split_bytes_T;
	wire [8:0] xfer_split_pulses = xfer_split_bytes[11:3];
	wire [63:0] _GEN_15 = xfer_stride_addr % 64'h0000000000000800;
	wire [11:0] _xfer_stride_bytes_T = _GEN_15[11:0];
	wire [11:0] xfer_stride_bytes = 12'h800 - _xfer_stride_bytes_T;
	wire [8:0] xfer_stride_pulses = xfer_stride_bytes[11:3];
	reg [2:0] state;
	wire _T = 3'h0 == state;
	wire [16:0] _GEN_86 = {8'd0, xfer_init_pulses};
	wire _T_1 = xsize < _GEN_86;
	wire _T_2 = xsize > 17'h00000;
	wire _T_4 = ~rst;
	wire _T_5 = ~(xsize > 17'h00000);
	wire [16:0] _xlen_T_1 = xsize - 17'h00001;
	wire [8:0] _xlen_T_3 = xfer_init_pulses - 9'h001;
	wire [16:0] _xrem_T_1 = xsize - _GEN_86;
	wire [16:0] _GEN_0 = (xsize < _GEN_86 ? _xlen_T_1 : {8'd0, _xlen_T_3});
	wire [16:0] _GEN_1 = (xsize < _GEN_86 ? 17'h00000 : _xrem_T_1);
	wire [16:0] _GEN_3 = (io_start ? _GEN_0 : {9'd0, xlen});
	wire [16:0] _GEN_4 = (io_start ? _GEN_1 : {1'd0, xrem});
	wire _T_10 = 3'h1 == state;
	wire _T_11 = 3'h2 == state;
	wire _T_13 = tag == 8'h01;
	wire [2:0] _GEN_6 = (tag == 8'h01 ? 3'h3 : state);
	wire [2:0] _GEN_7 = (xcnt == xlen ? 3'h4 : _GEN_6);
	wire [2:0] _GEN_8 = (io_vme_wr_data_ready ? _GEN_7 : state);
	wire _T_14 = 3'h3 == state;
	wire _T_15 = 3'h4 == state;
	wire _T_16 = xrem == 16'h0000;
	wire [15:0] _T_18 = dec_ysize - 16'h0001;
	wire _T_19 = ycnt == _T_18;
	wire [16:0] _GEN_89 = {8'd0, xfer_stride_pulses};
	wire _T_20 = xsize < _GEN_89;
	wire [8:0] _xlen_T_7 = xfer_stride_pulses - 9'h001;
	wire [16:0] _xrem_T_3 = xsize - _GEN_89;
	wire [16:0] _GEN_9 = (xsize < _GEN_89 ? _xlen_T_1 : {8'd0, _xlen_T_7});
	wire [16:0] _GEN_10 = (xsize < _GEN_89 ? 17'h00000 : _xrem_T_3);
	wire [2:0] _GEN_11 = (ycnt == _T_18 ? 3'h0 : 3'h1);
	wire [63:0] _GEN_12 = (ycnt == _T_18 ? xfer_bytes : {52'd0, xfer_stride_bytes});
	wire [16:0] _GEN_13 = (ycnt == _T_18 ? {9'd0, xlen} : _GEN_9);
	wire [16:0] _GEN_14 = (ycnt == _T_18 ? {1'd0, xrem} : _GEN_10);
	wire [15:0] _GEN_92 = {7'd0, xfer_split_pulses};
	wire _T_29 = xrem < _GEN_92;
	wire [15:0] _xlen_T_9 = xrem - 16'h0001;
	wire [8:0] _xlen_T_11 = xfer_split_pulses - 9'h001;
	wire [15:0] _xrem_T_5 = xrem - _GEN_92;
	wire [15:0] _GEN_17 = (xrem < _GEN_92 ? _xlen_T_9 : {7'd0, _xlen_T_11});
	wire [15:0] _GEN_18 = (xrem < _GEN_92 ? 16'h0000 : _xrem_T_5);
	wire [2:0] _GEN_19 = (xrem == 16'h0000 ? _GEN_11 : 3'h1);
	wire [63:0] _GEN_20 = (xrem == 16'h0000 ? _GEN_12 : {52'd0, xfer_split_bytes});
	wire [16:0] _GEN_21 = (xrem == 16'h0000 ? _GEN_13 : {1'd0, _GEN_17});
	wire [16:0] _GEN_22 = (xrem == 16'h0000 ? _GEN_14 : {1'd0, _GEN_18});
	wire [2:0] _GEN_23 = (io_vme_wr_ack ? _GEN_19 : state);
	wire [63:0] _GEN_24 = (io_vme_wr_ack ? _GEN_20 : xfer_bytes);
	wire [16:0] _GEN_25 = (io_vme_wr_ack ? _GEN_21 : {9'd0, xlen});
	wire [16:0] _GEN_26 = (io_vme_wr_ack ? _GEN_22 : {1'd0, xrem});
	wire [2:0] _GEN_27 = (3'h4 == state ? _GEN_23 : state);
	wire [63:0] _GEN_28 = (3'h4 == state ? _GEN_24 : xfer_bytes);
	wire [16:0] _GEN_29 = (3'h4 == state ? _GEN_25 : {9'd0, xlen});
	wire [16:0] _GEN_30 = (3'h4 == state ? _GEN_26 : {1'd0, xrem});
	wire [2:0] _GEN_31 = (3'h3 == state ? 3'h2 : _GEN_27);
	wire [16:0] _GEN_33 = (3'h3 == state ? {9'd0, xlen} : _GEN_29);
	wire [16:0] _GEN_34 = (3'h3 == state ? {1'd0, xrem} : _GEN_30);
	wire [16:0] _GEN_37 = (3'h2 == state ? {9'd0, xlen} : _GEN_33);
	wire [16:0] _GEN_38 = (3'h2 == state ? {1'd0, xrem} : _GEN_34);
	wire [16:0] _GEN_41 = (3'h1 == state ? {9'd0, xlen} : _GEN_37);
	wire [16:0] _GEN_42 = (3'h1 == state ? {1'd0, xrem} : _GEN_38);
	wire [16:0] _GEN_45 = (3'h0 == state ? _GEN_3 : _GEN_41);
	wire [16:0] _GEN_46 = (3'h0 == state ? _GEN_4 : _GEN_42);
	wire [63:0] inWrData_lo = {io_tensor_wr_0_bits_data_0_7, io_tensor_wr_0_bits_data_0_6, io_tensor_wr_0_bits_data_0_5, io_tensor_wr_0_bits_data_0_4, io_tensor_wr_0_bits_data_0_3, io_tensor_wr_0_bits_data_0_2, io_tensor_wr_0_bits_data_0_1, io_tensor_wr_0_bits_data_0_0};
	wire [127:0] _inWrData_T = {io_tensor_wr_0_bits_data_0_15, io_tensor_wr_0_bits_data_0_14, io_tensor_wr_0_bits_data_0_13, io_tensor_wr_0_bits_data_0_12, io_tensor_wr_0_bits_data_0_11, io_tensor_wr_0_bits_data_0_10, io_tensor_wr_0_bits_data_0_9, io_tensor_wr_0_bits_data_0_8, inWrData_lo};
	wire _stride_T_1 = (state == 3'h4) & io_vme_wr_ack;
	wire [7:0] _stride_T_3 = xlen + 8'h01;
	wire _stride_T_4 = xcnt == _stride_T_3;
	wire _stride_T_5 = _stride_T_1 & _stride_T_4;
	wire _stride_T_7 = _stride_T_5 & _T_16;
	wire _stride_T_10 = ycnt != _T_18;
	wire stride = _stride_T_7 & _stride_T_10;
	wire _T_38 = state == 3'h0;
	wire [15:0] _ycnt_T_1 = ycnt + 16'h0001;
	wire _T_39 = state == 3'h1;
	wire _T_42 = io_vme_wr_data_ready & io_vme_wr_data_valid;
	wire [7:0] _tag_T_1 = tag + 8'h01;
	wire _T_45 = set == 8'h00;
	wire [7:0] _set_T_1 = set + 8'h01;
	reg [10:0] raddr_cur;
	reg [10:0] raddr_nxt;
	wire [10:0] _raddr_cur_T_1 = raddr_cur + 11'h001;
	wire [15:0] _GEN_95 = {5'd0, raddr_nxt};
	wire [15:0] _raddr_cur_T_3 = _GEN_95 + dec_xsize;
	wire [15:0] _GEN_64 = (stride ? _raddr_cur_T_3 : {5'd0, raddr_cur});
	wire [15:0] _GEN_65 = (stride ? _raddr_cur_T_3 : {5'd0, raddr_nxt});
	wire [15:0] _GEN_66 = ((_T_42 & _T_45) & _T_13 ? {5'd0, _raddr_cur_T_1} : _GEN_64);
	wire [15:0] _GEN_67 = ((_T_42 & _T_45) & _T_13 ? {5'd0, raddr_nxt} : _GEN_65);
	wire [15:0] _GEN_68 = (_T_38 ? dec_sram_offset : _GEN_66);
	wire [15:0] _GEN_69 = (_T_38 ? dec_sram_offset : _GEN_67);
	wire _T_60 = state == 3'h3;
	wire [63:0] mdata_0 = (8'h00 == set ? tensorFile_0_0_MPORT_1_data : 64'h0000000000000000);
	wire [63:0] mdata_1 = (8'h00 == set ? tensorFile_0_1_MPORT_1_data : 64'h0000000000000000);
	wire [7:0] _xcnt_T_1 = xcnt + 8'h01;
	wire _GEN_97 = _T & io_start;
	wire _GEN_117 = ((((~_T & ~_T_10) & ~_T_11) & ~_T_14) & _T_15) & io_vme_wr_ack;
	wire _GEN_120 = ((((((~_T & ~_T_10) & ~_T_11) & ~_T_14) & _T_15) & io_vme_wr_ack) & _T_16) & ~_T_19;
	wire _GEN_175 = _GEN_117 & ~_T_16;
	assign tensorFile_0_0_MPORT_1_en = tensorFile_0_0_MPORT_1_en_pipe_0;
	assign tensorFile_0_0_MPORT_1_addr = tensorFile_0_0_MPORT_1_addr_pipe_0;
	assign tensorFile_0_0_MPORT_1_data = tensorFile_0_0[tensorFile_0_0_MPORT_1_addr];
	assign tensorFile_0_0_MPORT_data = _inWrData_T[63:0];
	assign tensorFile_0_0_MPORT_addr = io_tensor_wr_0_bits_idx;
	assign tensorFile_0_0_MPORT_mask = 1'h1;
	assign tensorFile_0_0_MPORT_en = io_tensor_wr_0_valid;
	assign tensorFile_0_1_MPORT_1_en = tensorFile_0_1_MPORT_1_en_pipe_0;
	assign tensorFile_0_1_MPORT_1_addr = tensorFile_0_1_MPORT_1_addr_pipe_0;
	assign tensorFile_0_1_MPORT_1_data = tensorFile_0_1[tensorFile_0_1_MPORT_1_addr];
	assign tensorFile_0_1_MPORT_data = _inWrData_T[127:64];
	assign tensorFile_0_1_MPORT_addr = io_tensor_wr_0_bits_idx;
	assign tensorFile_0_1_MPORT_mask = 1'h1;
	assign tensorFile_0_1_MPORT_en = io_tensor_wr_0_valid;
	assign io_done = (_stride_T_1 & _T_16) & _T_19;
	assign io_vme_wr_cmd_valid = state == 3'h1;
	assign io_vme_wr_cmd_bits_addr = waddr_cur;
	assign io_vme_wr_cmd_bits_len = xlen;
	assign io_vme_wr_data_valid = state == 3'h2;
	assign io_vme_wr_data_bits_data = (tag[0] ? mdata_1 : mdata_0);
	always @(posedge clk) begin
		if (tensorFile_0_0_MPORT_en & tensorFile_0_0_MPORT_mask)
			tensorFile_0_0[tensorFile_0_0_MPORT_addr] <= tensorFile_0_0_MPORT_data;
		tensorFile_0_0_MPORT_1_en_pipe_0 <= _T_39 | _T_60;
		if (_T_39 | _T_60)
			tensorFile_0_0_MPORT_1_addr_pipe_0 <= raddr_cur;
		if (tensorFile_0_1_MPORT_en & tensorFile_0_1_MPORT_mask)
			tensorFile_0_1[tensorFile_0_1_MPORT_addr] <= tensorFile_0_1_MPORT_data;
		tensorFile_0_1_MPORT_1_en_pipe_0 <= _T_39 | _T_60;
		if (_T_39 | _T_60)
			tensorFile_0_1_MPORT_1_addr_pipe_0 <= raddr_cur;
		if (_T_38)
			waddr_cur <= xfer_init_addr;
		else if (_stride_T_1 & (xrem != 16'h0000))
			waddr_cur <= xfer_split_addr;
		else if (stride)
			waddr_cur <= xfer_stride_addr;
		if (_T_38)
			waddr_nxt <= xfer_init_addr;
		else if (!(_stride_T_1 & (xrem != 16'h0000))) begin
			if (stride)
				waddr_nxt <= xfer_stride_addr;
		end
		if (_T_39)
			xcnt <= 8'h00;
		else if (_T_42)
			xcnt <= _xcnt_T_1;
		xlen <= _GEN_45[7:0];
		xrem <= _GEN_46[15:0];
		if (state == 3'h0)
			ycnt <= 16'h0000;
		else if (stride)
			ycnt <= _ycnt_T_1;
		if ((state == 3'h1) | _T_13)
			tag <= 8'h00;
		else if (_T_42)
			tag <= _tag_T_1;
		if (_T_39 | (((state != 3'h3) & (set == 8'h00)) & _T_13))
			set <= 8'h00;
		else if (_T_42 & _T_13)
			set <= _set_T_1;
		if (3'h0 == state)
			xfer_bytes <= {52'd0, xfer_init_bytes};
		else if (3'h1 != state) begin
			if (3'h2 != state) begin
				if (3'h3 != state)
					xfer_bytes <= _GEN_28;
			end
		end
		if (rst)
			state <= 3'h0;
		else if (3'h0 == state) begin
			if (io_start)
				state <= 3'h1;
		end
		else if (3'h1 == state) begin
			if (io_vme_wr_cmd_ready)
				state <= 3'h2;
		end
		else if (3'h2 == state)
			state <= _GEN_8;
		else
			state <= _GEN_31;
		raddr_cur <= _GEN_68[10:0];
		raddr_nxt <= _GEN_69[10:0];
		if ((((_T & io_start) & _T_1) & ~rst) & ~(xsize > 17'h00000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:101 assert(xsize > 0.U)\n");
		if (((_GEN_97 & ~_T_1) & _T_4) & ~(xsize >= _GEN_86))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:106 assert(xsize >= xfer_init_pulses)\n");
		if ((((((((((~_T & ~_T_10) & ~_T_11) & ~_T_14) & _T_15) & io_vme_wr_ack) & _T_16) & ~_T_19) & _T_20) & _T_4) & _T_5)
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:137 assert(xsize > 0.U)\n");
		if (((_GEN_120 & ~_T_20) & _T_4) & ~(xsize >= _GEN_89))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:142 assert(xsize >= xfer_stride_pulses)\n");
		if ((((_GEN_117 & ~_T_16) & _T_29) & _T_4) & ~(xrem > 16'h0000))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:150 assert(xrem > 0.U)\n");
		if (((_GEN_175 & ~_T_29) & _T_4) & ~(xrem >= _GEN_92))
			$fwrite(32'h80000002, "Assertion failed\n    at TensorStoreNarrowVME.scala:158 assert(xrem >= xfer_split_pulses)\n");
	end
	always @(posedge clk) begin
		if (((_T & io_start) & _T_1) & ~rst)
			;
		if ((_GEN_97 & ~_T_1) & _T_4)
			;
		if (((((((((~_T & ~_T_10) & ~_T_11) & ~_T_14) & _T_15) & io_vme_wr_ack) & _T_16) & ~_T_19) & _T_20) & _T_4)
			;
		if ((_GEN_120 & ~_T_20) & _T_4)
			;
		if (((_GEN_117 & ~_T_16) & _T_29) & _T_4)
			;
		if ((_GEN_175 & ~_T_29) & _T_4)
			;
	end
endmodule
module TensorStoreOut (
	clk,
	rst,
	io_start,
	io_done,
	io_inst,
	io_baddr,
	io_vme_wr_cmd_ready,
	io_vme_wr_cmd_valid,
	io_vme_wr_cmd_bits_addr,
	io_vme_wr_cmd_bits_len,
	io_vme_wr_data_ready,
	io_vme_wr_data_valid,
	io_vme_wr_data_bits_data,
	io_vme_wr_ack,
	io_tensor_wr_0_valid,
	io_tensor_wr_0_bits_idx,
	io_tensor_wr_0_bits_data_0_0,
	io_tensor_wr_0_bits_data_0_1,
	io_tensor_wr_0_bits_data_0_2,
	io_tensor_wr_0_bits_data_0_3,
	io_tensor_wr_0_bits_data_0_4,
	io_tensor_wr_0_bits_data_0_5,
	io_tensor_wr_0_bits_data_0_6,
	io_tensor_wr_0_bits_data_0_7,
	io_tensor_wr_0_bits_data_0_8,
	io_tensor_wr_0_bits_data_0_9,
	io_tensor_wr_0_bits_data_0_10,
	io_tensor_wr_0_bits_data_0_11,
	io_tensor_wr_0_bits_data_0_12,
	io_tensor_wr_0_bits_data_0_13,
	io_tensor_wr_0_bits_data_0_14,
	io_tensor_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_start;
	output wire io_done;
	input [127:0] io_inst;
	input [63:0] io_baddr;
	input io_vme_wr_cmd_ready;
	output wire io_vme_wr_cmd_valid;
	output wire [63:0] io_vme_wr_cmd_bits_addr;
	output wire [7:0] io_vme_wr_cmd_bits_len;
	input io_vme_wr_data_ready;
	output wire io_vme_wr_data_valid;
	output wire [63:0] io_vme_wr_data_bits_data;
	input io_vme_wr_ack;
	input io_tensor_wr_0_valid;
	input [10:0] io_tensor_wr_0_bits_idx;
	input [7:0] io_tensor_wr_0_bits_data_0_0;
	input [7:0] io_tensor_wr_0_bits_data_0_1;
	input [7:0] io_tensor_wr_0_bits_data_0_2;
	input [7:0] io_tensor_wr_0_bits_data_0_3;
	input [7:0] io_tensor_wr_0_bits_data_0_4;
	input [7:0] io_tensor_wr_0_bits_data_0_5;
	input [7:0] io_tensor_wr_0_bits_data_0_6;
	input [7:0] io_tensor_wr_0_bits_data_0_7;
	input [7:0] io_tensor_wr_0_bits_data_0_8;
	input [7:0] io_tensor_wr_0_bits_data_0_9;
	input [7:0] io_tensor_wr_0_bits_data_0_10;
	input [7:0] io_tensor_wr_0_bits_data_0_11;
	input [7:0] io_tensor_wr_0_bits_data_0_12;
	input [7:0] io_tensor_wr_0_bits_data_0_13;
	input [7:0] io_tensor_wr_0_bits_data_0_14;
	input [7:0] io_tensor_wr_0_bits_data_0_15;
	wire tensorStore_clock;
	wire tensorStore_reset;
	wire tensorStore_io_start;
	wire tensorStore_io_done;
	wire [127:0] tensorStore_io_inst;
	wire [63:0] tensorStore_io_baddr;
	wire tensorStore_io_vme_wr_cmd_ready;
	wire tensorStore_io_vme_wr_cmd_valid;
	wire [63:0] tensorStore_io_vme_wr_cmd_bits_addr;
	wire [7:0] tensorStore_io_vme_wr_cmd_bits_len;
	wire tensorStore_io_vme_wr_data_ready;
	wire tensorStore_io_vme_wr_data_valid;
	wire [63:0] tensorStore_io_vme_wr_data_bits_data;
	wire tensorStore_io_vme_wr_ack;
	wire tensorStore_io_tensor_wr_0_valid;
	wire [10:0] tensorStore_io_tensor_wr_0_bits_idx;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_0;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_1;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_2;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_3;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_4;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_5;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_6;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_7;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_8;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_9;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_10;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_11;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_12;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_13;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_14;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_15;
	TensorStoreNarrowVME tensorStore(
		.clk(tensorStore_clock),
		.rst(tensorStore_reset),
		.io_start(tensorStore_io_start),
		.io_done(tensorStore_io_done),
		.io_inst(tensorStore_io_inst),
		.io_baddr(tensorStore_io_baddr),
		.io_vme_wr_cmd_ready(tensorStore_io_vme_wr_cmd_ready),
		.io_vme_wr_cmd_valid(tensorStore_io_vme_wr_cmd_valid),
		.io_vme_wr_cmd_bits_addr(tensorStore_io_vme_wr_cmd_bits_addr),
		.io_vme_wr_cmd_bits_len(tensorStore_io_vme_wr_cmd_bits_len),
		.io_vme_wr_data_ready(tensorStore_io_vme_wr_data_ready),
		.io_vme_wr_data_valid(tensorStore_io_vme_wr_data_valid),
		.io_vme_wr_data_bits_data(tensorStore_io_vme_wr_data_bits_data),
		.io_vme_wr_ack(tensorStore_io_vme_wr_ack),
		.io_tensor_wr_0_valid(tensorStore_io_tensor_wr_0_valid),
		.io_tensor_wr_0_bits_idx(tensorStore_io_tensor_wr_0_bits_idx),
		.io_tensor_wr_0_bits_data_0_0(tensorStore_io_tensor_wr_0_bits_data_0_0),
		.io_tensor_wr_0_bits_data_0_1(tensorStore_io_tensor_wr_0_bits_data_0_1),
		.io_tensor_wr_0_bits_data_0_2(tensorStore_io_tensor_wr_0_bits_data_0_2),
		.io_tensor_wr_0_bits_data_0_3(tensorStore_io_tensor_wr_0_bits_data_0_3),
		.io_tensor_wr_0_bits_data_0_4(tensorStore_io_tensor_wr_0_bits_data_0_4),
		.io_tensor_wr_0_bits_data_0_5(tensorStore_io_tensor_wr_0_bits_data_0_5),
		.io_tensor_wr_0_bits_data_0_6(tensorStore_io_tensor_wr_0_bits_data_0_6),
		.io_tensor_wr_0_bits_data_0_7(tensorStore_io_tensor_wr_0_bits_data_0_7),
		.io_tensor_wr_0_bits_data_0_8(tensorStore_io_tensor_wr_0_bits_data_0_8),
		.io_tensor_wr_0_bits_data_0_9(tensorStore_io_tensor_wr_0_bits_data_0_9),
		.io_tensor_wr_0_bits_data_0_10(tensorStore_io_tensor_wr_0_bits_data_0_10),
		.io_tensor_wr_0_bits_data_0_11(tensorStore_io_tensor_wr_0_bits_data_0_11),
		.io_tensor_wr_0_bits_data_0_12(tensorStore_io_tensor_wr_0_bits_data_0_12),
		.io_tensor_wr_0_bits_data_0_13(tensorStore_io_tensor_wr_0_bits_data_0_13),
		.io_tensor_wr_0_bits_data_0_14(tensorStore_io_tensor_wr_0_bits_data_0_14),
		.io_tensor_wr_0_bits_data_0_15(tensorStore_io_tensor_wr_0_bits_data_0_15)
	);
	assign io_done = tensorStore_io_done;
	assign io_vme_wr_cmd_valid = tensorStore_io_vme_wr_cmd_valid;
	assign io_vme_wr_cmd_bits_addr = tensorStore_io_vme_wr_cmd_bits_addr;
	assign io_vme_wr_cmd_bits_len = tensorStore_io_vme_wr_cmd_bits_len;
	assign io_vme_wr_data_valid = tensorStore_io_vme_wr_data_valid;
	assign io_vme_wr_data_bits_data = tensorStore_io_vme_wr_data_bits_data;
	assign tensorStore_clock = clk;
	assign tensorStore_reset = rst;
	assign tensorStore_io_start = io_start;
	assign tensorStore_io_inst = io_inst;
	assign tensorStore_io_baddr = io_baddr;
	assign tensorStore_io_vme_wr_cmd_ready = io_vme_wr_cmd_ready;
	assign tensorStore_io_vme_wr_data_ready = io_vme_wr_data_ready;
	assign tensorStore_io_vme_wr_ack = io_vme_wr_ack;
	assign tensorStore_io_tensor_wr_0_valid = io_tensor_wr_0_valid;
	assign tensorStore_io_tensor_wr_0_bits_idx = io_tensor_wr_0_bits_idx;
	assign tensorStore_io_tensor_wr_0_bits_data_0_0 = io_tensor_wr_0_bits_data_0_0;
	assign tensorStore_io_tensor_wr_0_bits_data_0_1 = io_tensor_wr_0_bits_data_0_1;
	assign tensorStore_io_tensor_wr_0_bits_data_0_2 = io_tensor_wr_0_bits_data_0_2;
	assign tensorStore_io_tensor_wr_0_bits_data_0_3 = io_tensor_wr_0_bits_data_0_3;
	assign tensorStore_io_tensor_wr_0_bits_data_0_4 = io_tensor_wr_0_bits_data_0_4;
	assign tensorStore_io_tensor_wr_0_bits_data_0_5 = io_tensor_wr_0_bits_data_0_5;
	assign tensorStore_io_tensor_wr_0_bits_data_0_6 = io_tensor_wr_0_bits_data_0_6;
	assign tensorStore_io_tensor_wr_0_bits_data_0_7 = io_tensor_wr_0_bits_data_0_7;
	assign tensorStore_io_tensor_wr_0_bits_data_0_8 = io_tensor_wr_0_bits_data_0_8;
	assign tensorStore_io_tensor_wr_0_bits_data_0_9 = io_tensor_wr_0_bits_data_0_9;
	assign tensorStore_io_tensor_wr_0_bits_data_0_10 = io_tensor_wr_0_bits_data_0_10;
	assign tensorStore_io_tensor_wr_0_bits_data_0_11 = io_tensor_wr_0_bits_data_0_11;
	assign tensorStore_io_tensor_wr_0_bits_data_0_12 = io_tensor_wr_0_bits_data_0_12;
	assign tensorStore_io_tensor_wr_0_bits_data_0_13 = io_tensor_wr_0_bits_data_0_13;
	assign tensorStore_io_tensor_wr_0_bits_data_0_14 = io_tensor_wr_0_bits_data_0_14;
	assign tensorStore_io_tensor_wr_0_bits_data_0_15 = io_tensor_wr_0_bits_data_0_15;
endmodule
module Store (
	clk,
	rst,
	io_i_post,
	io_o_post,
	io_inst_ready,
	io_inst_valid,
	io_inst_bits,
	io_out_baddr,
	io_vme_wr_cmd_ready,
	io_vme_wr_cmd_valid,
	io_vme_wr_cmd_bits_addr,
	io_vme_wr_cmd_bits_len,
	io_vme_wr_data_ready,
	io_vme_wr_data_valid,
	io_vme_wr_data_bits_data,
	io_vme_wr_ack,
	io_out_wr_0_valid,
	io_out_wr_0_bits_idx,
	io_out_wr_0_bits_data_0_0,
	io_out_wr_0_bits_data_0_1,
	io_out_wr_0_bits_data_0_2,
	io_out_wr_0_bits_data_0_3,
	io_out_wr_0_bits_data_0_4,
	io_out_wr_0_bits_data_0_5,
	io_out_wr_0_bits_data_0_6,
	io_out_wr_0_bits_data_0_7,
	io_out_wr_0_bits_data_0_8,
	io_out_wr_0_bits_data_0_9,
	io_out_wr_0_bits_data_0_10,
	io_out_wr_0_bits_data_0_11,
	io_out_wr_0_bits_data_0_12,
	io_out_wr_0_bits_data_0_13,
	io_out_wr_0_bits_data_0_14,
	io_out_wr_0_bits_data_0_15
);
	input clk;
	input rst;
	input io_i_post;
	output wire io_o_post;
	output wire io_inst_ready;
	input io_inst_valid;
	input [127:0] io_inst_bits;
	input [63:0] io_out_baddr;
	input io_vme_wr_cmd_ready;
	output wire io_vme_wr_cmd_valid;
	output wire [63:0] io_vme_wr_cmd_bits_addr;
	output wire [7:0] io_vme_wr_cmd_bits_len;
	input io_vme_wr_data_ready;
	output wire io_vme_wr_data_valid;
	output wire [63:0] io_vme_wr_data_bits_data;
	input io_vme_wr_ack;
	input io_out_wr_0_valid;
	input [10:0] io_out_wr_0_bits_idx;
	input [7:0] io_out_wr_0_bits_data_0_0;
	input [7:0] io_out_wr_0_bits_data_0_1;
	input [7:0] io_out_wr_0_bits_data_0_2;
	input [7:0] io_out_wr_0_bits_data_0_3;
	input [7:0] io_out_wr_0_bits_data_0_4;
	input [7:0] io_out_wr_0_bits_data_0_5;
	input [7:0] io_out_wr_0_bits_data_0_6;
	input [7:0] io_out_wr_0_bits_data_0_7;
	input [7:0] io_out_wr_0_bits_data_0_8;
	input [7:0] io_out_wr_0_bits_data_0_9;
	input [7:0] io_out_wr_0_bits_data_0_10;
	input [7:0] io_out_wr_0_bits_data_0_11;
	input [7:0] io_out_wr_0_bits_data_0_12;
	input [7:0] io_out_wr_0_bits_data_0_13;
	input [7:0] io_out_wr_0_bits_data_0_14;
	input [7:0] io_out_wr_0_bits_data_0_15;
	wire s_clock;
	wire s_reset;
	wire s_io_spost;
	wire s_io_swait;
	wire s_io_sready;
	wire inst_q_clock;
	wire inst_q_reset;
	wire inst_q_io_enq_ready;
	wire inst_q_io_enq_valid;
	wire [127:0] inst_q_io_enq_bits;
	wire inst_q_io_deq_ready;
	wire inst_q_io_deq_valid;
	wire [127:0] inst_q_io_deq_bits;
	wire [127:0] dec_io_inst;
	wire dec_io_push_prev;
	wire dec_io_pop_prev;
	wire dec_io_isStore;
	wire dec_io_isSync;
	wire tensorStore_clock;
	wire tensorStore_reset;
	wire tensorStore_io_start;
	wire tensorStore_io_done;
	wire [127:0] tensorStore_io_inst;
	wire [63:0] tensorStore_io_baddr;
	wire tensorStore_io_vme_wr_cmd_ready;
	wire tensorStore_io_vme_wr_cmd_valid;
	wire [63:0] tensorStore_io_vme_wr_cmd_bits_addr;
	wire [7:0] tensorStore_io_vme_wr_cmd_bits_len;
	wire tensorStore_io_vme_wr_data_ready;
	wire tensorStore_io_vme_wr_data_valid;
	wire [63:0] tensorStore_io_vme_wr_data_bits_data;
	wire tensorStore_io_vme_wr_ack;
	wire tensorStore_io_tensor_wr_0_valid;
	wire [10:0] tensorStore_io_tensor_wr_0_bits_idx;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_0;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_1;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_2;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_3;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_4;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_5;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_6;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_7;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_8;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_9;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_10;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_11;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_12;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_13;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_14;
	wire [7:0] tensorStore_io_tensor_wr_0_bits_data_0_15;
	reg [1:0] state;
	wire _start_T = (dec_io_pop_prev ? s_io_sready : 1'h1);
	wire start = inst_q_io_deq_valid & _start_T;
	wire [1:0] _GEN_0 = (dec_io_isStore ? 2'h2 : state);
	wire [1:0] _GEN_3 = (tensorStore_io_done ? 2'h0 : state);
	wire _inst_q_io_deq_ready_T_3 = ((state == 2'h2) & tensorStore_io_done) | (state == 2'h1);
	wire _tensorStore_io_start_T_1 = (state == 2'h0) & start;
	Semaphore s(
		.clk(s_clock),
		.rst(s_reset),
		.io_spost(s_io_spost),
		.io_swait(s_io_swait),
		.io_sready(s_io_sready)
	);
	Queue_6 inst_q(
		.clk(inst_q_clock),
		.rst(inst_q_reset),
		.io_enq_ready(inst_q_io_enq_ready),
		.io_enq_valid(inst_q_io_enq_valid),
		.io_enq_bits(inst_q_io_enq_bits),
		.io_deq_ready(inst_q_io_deq_ready),
		.io_deq_valid(inst_q_io_deq_valid),
		.io_deq_bits(inst_q_io_deq_bits)
	);
	StoreDecode dec(
		.io_inst(dec_io_inst),
		.io_push_prev(dec_io_push_prev),
		.io_pop_prev(dec_io_pop_prev),
		.io_isStore(dec_io_isStore),
		.io_isSync(dec_io_isSync)
	);
	TensorStoreOut tensorStore(
		.clk(tensorStore_clock),
		.rst(tensorStore_reset),
		.io_start(tensorStore_io_start),
		.io_done(tensorStore_io_done),
		.io_inst(tensorStore_io_inst),
		.io_baddr(tensorStore_io_baddr),
		.io_vme_wr_cmd_ready(tensorStore_io_vme_wr_cmd_ready),
		.io_vme_wr_cmd_valid(tensorStore_io_vme_wr_cmd_valid),
		.io_vme_wr_cmd_bits_addr(tensorStore_io_vme_wr_cmd_bits_addr),
		.io_vme_wr_cmd_bits_len(tensorStore_io_vme_wr_cmd_bits_len),
		.io_vme_wr_data_ready(tensorStore_io_vme_wr_data_ready),
		.io_vme_wr_data_valid(tensorStore_io_vme_wr_data_valid),
		.io_vme_wr_data_bits_data(tensorStore_io_vme_wr_data_bits_data),
		.io_vme_wr_ack(tensorStore_io_vme_wr_ack),
		.io_tensor_wr_0_valid(tensorStore_io_tensor_wr_0_valid),
		.io_tensor_wr_0_bits_idx(tensorStore_io_tensor_wr_0_bits_idx),
		.io_tensor_wr_0_bits_data_0_0(tensorStore_io_tensor_wr_0_bits_data_0_0),
		.io_tensor_wr_0_bits_data_0_1(tensorStore_io_tensor_wr_0_bits_data_0_1),
		.io_tensor_wr_0_bits_data_0_2(tensorStore_io_tensor_wr_0_bits_data_0_2),
		.io_tensor_wr_0_bits_data_0_3(tensorStore_io_tensor_wr_0_bits_data_0_3),
		.io_tensor_wr_0_bits_data_0_4(tensorStore_io_tensor_wr_0_bits_data_0_4),
		.io_tensor_wr_0_bits_data_0_5(tensorStore_io_tensor_wr_0_bits_data_0_5),
		.io_tensor_wr_0_bits_data_0_6(tensorStore_io_tensor_wr_0_bits_data_0_6),
		.io_tensor_wr_0_bits_data_0_7(tensorStore_io_tensor_wr_0_bits_data_0_7),
		.io_tensor_wr_0_bits_data_0_8(tensorStore_io_tensor_wr_0_bits_data_0_8),
		.io_tensor_wr_0_bits_data_0_9(tensorStore_io_tensor_wr_0_bits_data_0_9),
		.io_tensor_wr_0_bits_data_0_10(tensorStore_io_tensor_wr_0_bits_data_0_10),
		.io_tensor_wr_0_bits_data_0_11(tensorStore_io_tensor_wr_0_bits_data_0_11),
		.io_tensor_wr_0_bits_data_0_12(tensorStore_io_tensor_wr_0_bits_data_0_12),
		.io_tensor_wr_0_bits_data_0_13(tensorStore_io_tensor_wr_0_bits_data_0_13),
		.io_tensor_wr_0_bits_data_0_14(tensorStore_io_tensor_wr_0_bits_data_0_14),
		.io_tensor_wr_0_bits_data_0_15(tensorStore_io_tensor_wr_0_bits_data_0_15)
	);
	assign io_o_post = dec_io_push_prev & _inst_q_io_deq_ready_T_3;
	assign io_inst_ready = inst_q_io_enq_ready;
	assign io_vme_wr_cmd_valid = tensorStore_io_vme_wr_cmd_valid;
	assign io_vme_wr_cmd_bits_addr = tensorStore_io_vme_wr_cmd_bits_addr;
	assign io_vme_wr_cmd_bits_len = tensorStore_io_vme_wr_cmd_bits_len;
	assign io_vme_wr_data_valid = tensorStore_io_vme_wr_data_valid;
	assign io_vme_wr_data_bits_data = tensorStore_io_vme_wr_data_bits_data;
	assign s_clock = clk;
	assign s_reset = rst;
	assign s_io_spost = io_i_post;
	assign s_io_swait = dec_io_pop_prev & _tensorStore_io_start_T_1;
	assign inst_q_clock = clk;
	assign inst_q_reset = rst;
	assign inst_q_io_enq_valid = io_inst_valid;
	assign inst_q_io_enq_bits = io_inst_bits;
	assign inst_q_io_deq_ready = ((state == 2'h2) & tensorStore_io_done) | (state == 2'h1);
	assign dec_io_inst = inst_q_io_deq_bits;
	assign tensorStore_clock = clk;
	assign tensorStore_reset = rst;
	assign tensorStore_io_start = ((state == 2'h0) & start) & dec_io_isStore;
	assign tensorStore_io_inst = inst_q_io_deq_bits;
	assign tensorStore_io_baddr = io_out_baddr;
	assign tensorStore_io_vme_wr_cmd_ready = io_vme_wr_cmd_ready;
	assign tensorStore_io_vme_wr_data_ready = io_vme_wr_data_ready;
	assign tensorStore_io_vme_wr_ack = io_vme_wr_ack;
	assign tensorStore_io_tensor_wr_0_valid = io_out_wr_0_valid;
	assign tensorStore_io_tensor_wr_0_bits_idx = io_out_wr_0_bits_idx;
	assign tensorStore_io_tensor_wr_0_bits_data_0_0 = io_out_wr_0_bits_data_0_0;
	assign tensorStore_io_tensor_wr_0_bits_data_0_1 = io_out_wr_0_bits_data_0_1;
	assign tensorStore_io_tensor_wr_0_bits_data_0_2 = io_out_wr_0_bits_data_0_2;
	assign tensorStore_io_tensor_wr_0_bits_data_0_3 = io_out_wr_0_bits_data_0_3;
	assign tensorStore_io_tensor_wr_0_bits_data_0_4 = io_out_wr_0_bits_data_0_4;
	assign tensorStore_io_tensor_wr_0_bits_data_0_5 = io_out_wr_0_bits_data_0_5;
	assign tensorStore_io_tensor_wr_0_bits_data_0_6 = io_out_wr_0_bits_data_0_6;
	assign tensorStore_io_tensor_wr_0_bits_data_0_7 = io_out_wr_0_bits_data_0_7;
	assign tensorStore_io_tensor_wr_0_bits_data_0_8 = io_out_wr_0_bits_data_0_8;
	assign tensorStore_io_tensor_wr_0_bits_data_0_9 = io_out_wr_0_bits_data_0_9;
	assign tensorStore_io_tensor_wr_0_bits_data_0_10 = io_out_wr_0_bits_data_0_10;
	assign tensorStore_io_tensor_wr_0_bits_data_0_11 = io_out_wr_0_bits_data_0_11;
	assign tensorStore_io_tensor_wr_0_bits_data_0_12 = io_out_wr_0_bits_data_0_12;
	assign tensorStore_io_tensor_wr_0_bits_data_0_13 = io_out_wr_0_bits_data_0_13;
	assign tensorStore_io_tensor_wr_0_bits_data_0_14 = io_out_wr_0_bits_data_0_14;
	assign tensorStore_io_tensor_wr_0_bits_data_0_15 = io_out_wr_0_bits_data_0_15;
	always @(posedge clk)
		if (rst)
			state <= 2'h0;
		else if (2'h0 == state) begin
			if (start) begin
				if (dec_io_isSync)
					state <= 2'h1;
				else
					state <= _GEN_0;
			end
		end
		else if (2'h1 == state)
			state <= 2'h0;
		else if (2'h2 == state)
			state <= _GEN_3;
endmodule
module EventCounters (
	clk,
	rst,
	io_launch,
	io_finish,
	io_ecnt_0_valid,
	io_ecnt_0_bits,
	io_ucnt_0_valid,
	io_ucnt_0_bits,
	io_acc_wr_event
);
	input clk;
	input rst;
	input io_launch;
	input io_finish;
	output wire io_ecnt_0_valid;
	output wire [31:0] io_ecnt_0_bits;
	output wire io_ucnt_0_valid;
	output wire [31:0] io_ucnt_0_bits;
	input io_acc_wr_event;
	reg [31:0] cycle_cnt;
	wire [31:0] _cycle_cnt_T_1 = cycle_cnt + 32'h00000001;
	reg [31:0] acc_wr_count;
	wire [31:0] _acc_wr_count_T_1 = acc_wr_count + 32'h00000001;
	assign io_ecnt_0_valid = io_finish;
	assign io_ecnt_0_bits = cycle_cnt;
	assign io_ucnt_0_valid = io_finish;
	assign io_ucnt_0_bits = acc_wr_count;
	always @(posedge clk) begin
		if (rst)
			cycle_cnt <= 32'h00000000;
		else if (io_launch & ~io_finish)
			cycle_cnt <= _cycle_cnt_T_1;
		else
			cycle_cnt <= 32'h00000000;
		if (~io_launch | io_finish)
			acc_wr_count <= 32'h00000000;
		else if (io_acc_wr_event)
			acc_wr_count <= _acc_wr_count_T_1;
	end
endmodule
module Core (
	clk,
	rst,
	io_vcr_launch,
	io_vcr_finish,
	io_vcr_ecnt_0_valid,
	io_vcr_ecnt_0_bits,
	io_vcr_vals_0,
	io_vcr_ptrs_0,
	io_vcr_ptrs_1,
	io_vcr_ptrs_2,
	io_vcr_ptrs_3,
	io_vcr_ptrs_4,
	io_vcr_ptrs_5,
	io_vcr_ucnt_0_valid,
	io_vcr_ucnt_0_bits,
	io_vme_rd_0_cmd_ready,
	io_vme_rd_0_cmd_valid,
	io_vme_rd_0_cmd_bits_addr,
	io_vme_rd_0_cmd_bits_len,
	io_vme_rd_0_data_ready,
	io_vme_rd_0_data_valid,
	io_vme_rd_0_data_bits_data,
	io_vme_rd_1_cmd_ready,
	io_vme_rd_1_cmd_valid,
	io_vme_rd_1_cmd_bits_addr,
	io_vme_rd_1_cmd_bits_len,
	io_vme_rd_1_cmd_bits_tag,
	io_vme_rd_1_data_valid,
	io_vme_rd_1_data_bits_data,
	io_vme_rd_1_data_bits_tag,
	io_vme_rd_1_data_bits_last,
	io_vme_rd_2_cmd_ready,
	io_vme_rd_2_cmd_valid,
	io_vme_rd_2_cmd_bits_addr,
	io_vme_rd_2_cmd_bits_len,
	io_vme_rd_2_cmd_bits_tag,
	io_vme_rd_2_data_valid,
	io_vme_rd_2_data_bits_data,
	io_vme_rd_2_data_bits_tag,
	io_vme_rd_3_cmd_ready,
	io_vme_rd_3_cmd_valid,
	io_vme_rd_3_cmd_bits_addr,
	io_vme_rd_3_cmd_bits_len,
	io_vme_rd_3_cmd_bits_tag,
	io_vme_rd_3_data_valid,
	io_vme_rd_3_data_bits_data,
	io_vme_rd_3_data_bits_tag,
	io_vme_rd_4_cmd_ready,
	io_vme_rd_4_cmd_valid,
	io_vme_rd_4_cmd_bits_addr,
	io_vme_rd_4_cmd_bits_len,
	io_vme_rd_4_cmd_bits_tag,
	io_vme_rd_4_data_valid,
	io_vme_rd_4_data_bits_data,
	io_vme_rd_4_data_bits_tag,
	io_vme_wr_0_cmd_ready,
	io_vme_wr_0_cmd_valid,
	io_vme_wr_0_cmd_bits_addr,
	io_vme_wr_0_cmd_bits_len,
	io_vme_wr_0_data_ready,
	io_vme_wr_0_data_valid,
	io_vme_wr_0_data_bits_data,
	io_vme_wr_0_ack
);
	input clk;
	input rst;
	input io_vcr_launch;
	output wire io_vcr_finish;
	output wire io_vcr_ecnt_0_valid;
	output wire [31:0] io_vcr_ecnt_0_bits;
	input [31:0] io_vcr_vals_0;
	input [63:0] io_vcr_ptrs_0;
	input [63:0] io_vcr_ptrs_1;
	input [63:0] io_vcr_ptrs_2;
	input [63:0] io_vcr_ptrs_3;
	input [63:0] io_vcr_ptrs_4;
	input [63:0] io_vcr_ptrs_5;
	output wire io_vcr_ucnt_0_valid;
	output wire [31:0] io_vcr_ucnt_0_bits;
	input io_vme_rd_0_cmd_ready;
	output wire io_vme_rd_0_cmd_valid;
	output wire [63:0] io_vme_rd_0_cmd_bits_addr;
	output wire [7:0] io_vme_rd_0_cmd_bits_len;
	output wire io_vme_rd_0_data_ready;
	input io_vme_rd_0_data_valid;
	input [63:0] io_vme_rd_0_data_bits_data;
	input io_vme_rd_1_cmd_ready;
	output wire io_vme_rd_1_cmd_valid;
	output wire [63:0] io_vme_rd_1_cmd_bits_addr;
	output wire [7:0] io_vme_rd_1_cmd_bits_len;
	output wire [20:0] io_vme_rd_1_cmd_bits_tag;
	input io_vme_rd_1_data_valid;
	input [63:0] io_vme_rd_1_data_bits_data;
	input [20:0] io_vme_rd_1_data_bits_tag;
	input io_vme_rd_1_data_bits_last;
	input io_vme_rd_2_cmd_ready;
	output wire io_vme_rd_2_cmd_valid;
	output wire [63:0] io_vme_rd_2_cmd_bits_addr;
	output wire [7:0] io_vme_rd_2_cmd_bits_len;
	output wire [20:0] io_vme_rd_2_cmd_bits_tag;
	input io_vme_rd_2_data_valid;
	input [63:0] io_vme_rd_2_data_bits_data;
	input [20:0] io_vme_rd_2_data_bits_tag;
	input io_vme_rd_3_cmd_ready;
	output wire io_vme_rd_3_cmd_valid;
	output wire [63:0] io_vme_rd_3_cmd_bits_addr;
	output wire [7:0] io_vme_rd_3_cmd_bits_len;
	output wire [20:0] io_vme_rd_3_cmd_bits_tag;
	input io_vme_rd_3_data_valid;
	input [63:0] io_vme_rd_3_data_bits_data;
	input [20:0] io_vme_rd_3_data_bits_tag;
	input io_vme_rd_4_cmd_ready;
	output wire io_vme_rd_4_cmd_valid;
	output wire [63:0] io_vme_rd_4_cmd_bits_addr;
	output wire [7:0] io_vme_rd_4_cmd_bits_len;
	output wire [20:0] io_vme_rd_4_cmd_bits_tag;
	input io_vme_rd_4_data_valid;
	input [63:0] io_vme_rd_4_data_bits_data;
	input [20:0] io_vme_rd_4_data_bits_tag;
	input io_vme_wr_0_cmd_ready;
	output wire io_vme_wr_0_cmd_valid;
	output wire [63:0] io_vme_wr_0_cmd_bits_addr;
	output wire [7:0] io_vme_wr_0_cmd_bits_len;
	input io_vme_wr_0_data_ready;
	output wire io_vme_wr_0_data_valid;
	output wire [63:0] io_vme_wr_0_data_bits_data;
	input io_vme_wr_0_ack;
	wire fetch_clock;
	wire fetch_reset;
	wire fetch_io_launch;
	wire [63:0] fetch_io_ins_baddr;
	wire [31:0] fetch_io_ins_count;
	wire fetch_io_vme_rd_cmd_ready;
	wire fetch_io_vme_rd_cmd_valid;
	wire [63:0] fetch_io_vme_rd_cmd_bits_addr;
	wire [7:0] fetch_io_vme_rd_cmd_bits_len;
	wire fetch_io_vme_rd_data_ready;
	wire fetch_io_vme_rd_data_valid;
	wire [63:0] fetch_io_vme_rd_data_bits_data;
	wire fetch_io_inst_ld_ready;
	wire fetch_io_inst_ld_valid;
	wire [127:0] fetch_io_inst_ld_bits;
	wire fetch_io_inst_co_ready;
	wire fetch_io_inst_co_valid;
	wire [127:0] fetch_io_inst_co_bits;
	wire fetch_io_inst_st_ready;
	wire fetch_io_inst_st_valid;
	wire [127:0] fetch_io_inst_st_bits;
	wire load_clock;
	wire load_reset;
	wire load_io_i_post;
	wire load_io_o_post;
	wire load_io_inst_ready;
	wire load_io_inst_valid;
	wire [127:0] load_io_inst_bits;
	wire [63:0] load_io_inp_baddr;
	wire [63:0] load_io_wgt_baddr;
	wire load_io_vme_rd_0_cmd_ready;
	wire load_io_vme_rd_0_cmd_valid;
	wire [63:0] load_io_vme_rd_0_cmd_bits_addr;
	wire [7:0] load_io_vme_rd_0_cmd_bits_len;
	wire [20:0] load_io_vme_rd_0_cmd_bits_tag;
	wire load_io_vme_rd_0_data_valid;
	wire [63:0] load_io_vme_rd_0_data_bits_data;
	wire [20:0] load_io_vme_rd_0_data_bits_tag;
	wire load_io_vme_rd_1_cmd_ready;
	wire load_io_vme_rd_1_cmd_valid;
	wire [63:0] load_io_vme_rd_1_cmd_bits_addr;
	wire [7:0] load_io_vme_rd_1_cmd_bits_len;
	wire [20:0] load_io_vme_rd_1_cmd_bits_tag;
	wire load_io_vme_rd_1_data_valid;
	wire [63:0] load_io_vme_rd_1_data_bits_data;
	wire [20:0] load_io_vme_rd_1_data_bits_tag;
	wire load_io_inp_rd_0_idx_valid;
	wire [10:0] load_io_inp_rd_0_idx_bits;
	wire load_io_inp_rd_0_data_valid;
	wire [7:0] load_io_inp_rd_0_data_bits_0_0;
	wire [7:0] load_io_inp_rd_0_data_bits_0_1;
	wire [7:0] load_io_inp_rd_0_data_bits_0_2;
	wire [7:0] load_io_inp_rd_0_data_bits_0_3;
	wire [7:0] load_io_inp_rd_0_data_bits_0_4;
	wire [7:0] load_io_inp_rd_0_data_bits_0_5;
	wire [7:0] load_io_inp_rd_0_data_bits_0_6;
	wire [7:0] load_io_inp_rd_0_data_bits_0_7;
	wire [7:0] load_io_inp_rd_0_data_bits_0_8;
	wire [7:0] load_io_inp_rd_0_data_bits_0_9;
	wire [7:0] load_io_inp_rd_0_data_bits_0_10;
	wire [7:0] load_io_inp_rd_0_data_bits_0_11;
	wire [7:0] load_io_inp_rd_0_data_bits_0_12;
	wire [7:0] load_io_inp_rd_0_data_bits_0_13;
	wire [7:0] load_io_inp_rd_0_data_bits_0_14;
	wire [7:0] load_io_inp_rd_0_data_bits_0_15;
	wire load_io_wgt_rd_0_idx_valid;
	wire [9:0] load_io_wgt_rd_0_idx_bits;
	wire load_io_wgt_rd_0_data_valid;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_0_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_1_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_2_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_3_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_4_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_5_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_6_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_7_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_8_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_9_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_10_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_11_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_12_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_13_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_14_15;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_0;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_1;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_2;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_3;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_4;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_5;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_6;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_7;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_8;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_9;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_10;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_11;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_12;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_13;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_14;
	wire [7:0] load_io_wgt_rd_0_data_bits_15_15;
	wire compute_clock;
	wire compute_reset;
	wire compute_io_i_post_0;
	wire compute_io_i_post_1;
	wire compute_io_o_post_0;
	wire compute_io_o_post_1;
	wire compute_io_inst_ready;
	wire compute_io_inst_valid;
	wire [127:0] compute_io_inst_bits;
	wire [63:0] compute_io_uop_baddr;
	wire [63:0] compute_io_acc_baddr;
	wire compute_io_vme_rd_0_cmd_ready;
	wire compute_io_vme_rd_0_cmd_valid;
	wire [63:0] compute_io_vme_rd_0_cmd_bits_addr;
	wire [7:0] compute_io_vme_rd_0_cmd_bits_len;
	wire [20:0] compute_io_vme_rd_0_cmd_bits_tag;
	wire compute_io_vme_rd_0_data_valid;
	wire [63:0] compute_io_vme_rd_0_data_bits_data;
	wire [20:0] compute_io_vme_rd_0_data_bits_tag;
	wire compute_io_vme_rd_0_data_bits_last;
	wire compute_io_vme_rd_1_cmd_ready;
	wire compute_io_vme_rd_1_cmd_valid;
	wire [63:0] compute_io_vme_rd_1_cmd_bits_addr;
	wire [7:0] compute_io_vme_rd_1_cmd_bits_len;
	wire [20:0] compute_io_vme_rd_1_cmd_bits_tag;
	wire compute_io_vme_rd_1_data_valid;
	wire [63:0] compute_io_vme_rd_1_data_bits_data;
	wire [20:0] compute_io_vme_rd_1_data_bits_tag;
	wire compute_io_inp_rd_0_idx_valid;
	wire [10:0] compute_io_inp_rd_0_idx_bits;
	wire compute_io_inp_rd_0_data_valid;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_0;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_1;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_2;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_3;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_4;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_5;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_6;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_7;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_8;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_9;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_10;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_11;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_12;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_13;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_14;
	wire [7:0] compute_io_inp_rd_0_data_bits_0_15;
	wire compute_io_wgt_rd_0_idx_valid;
	wire [9:0] compute_io_wgt_rd_0_idx_bits;
	wire compute_io_wgt_rd_0_data_valid;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_0_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_1_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_2_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_3_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_4_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_5_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_6_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_7_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_8_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_9_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_10_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_11_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_12_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_13_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_14_15;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_0;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_1;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_2;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_3;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_4;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_5;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_6;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_7;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_8;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_9;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_10;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_11;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_12;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_13;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_14;
	wire [7:0] compute_io_wgt_rd_0_data_bits_15_15;
	wire compute_io_out_wr_0_valid;
	wire [10:0] compute_io_out_wr_0_bits_idx;
	wire [7:0] compute_io_out_wr_0_bits_data_0_0;
	wire [7:0] compute_io_out_wr_0_bits_data_0_1;
	wire [7:0] compute_io_out_wr_0_bits_data_0_2;
	wire [7:0] compute_io_out_wr_0_bits_data_0_3;
	wire [7:0] compute_io_out_wr_0_bits_data_0_4;
	wire [7:0] compute_io_out_wr_0_bits_data_0_5;
	wire [7:0] compute_io_out_wr_0_bits_data_0_6;
	wire [7:0] compute_io_out_wr_0_bits_data_0_7;
	wire [7:0] compute_io_out_wr_0_bits_data_0_8;
	wire [7:0] compute_io_out_wr_0_bits_data_0_9;
	wire [7:0] compute_io_out_wr_0_bits_data_0_10;
	wire [7:0] compute_io_out_wr_0_bits_data_0_11;
	wire [7:0] compute_io_out_wr_0_bits_data_0_12;
	wire [7:0] compute_io_out_wr_0_bits_data_0_13;
	wire [7:0] compute_io_out_wr_0_bits_data_0_14;
	wire [7:0] compute_io_out_wr_0_bits_data_0_15;
	wire compute_io_finish;
	wire compute_io_acc_wr_event;
	wire store_clock;
	wire store_reset;
	wire store_io_i_post;
	wire store_io_o_post;
	wire store_io_inst_ready;
	wire store_io_inst_valid;
	wire [127:0] store_io_inst_bits;
	wire [63:0] store_io_out_baddr;
	wire store_io_vme_wr_cmd_ready;
	wire store_io_vme_wr_cmd_valid;
	wire [63:0] store_io_vme_wr_cmd_bits_addr;
	wire [7:0] store_io_vme_wr_cmd_bits_len;
	wire store_io_vme_wr_data_ready;
	wire store_io_vme_wr_data_valid;
	wire [63:0] store_io_vme_wr_data_bits_data;
	wire store_io_vme_wr_ack;
	wire store_io_out_wr_0_valid;
	wire [10:0] store_io_out_wr_0_bits_idx;
	wire [7:0] store_io_out_wr_0_bits_data_0_0;
	wire [7:0] store_io_out_wr_0_bits_data_0_1;
	wire [7:0] store_io_out_wr_0_bits_data_0_2;
	wire [7:0] store_io_out_wr_0_bits_data_0_3;
	wire [7:0] store_io_out_wr_0_bits_data_0_4;
	wire [7:0] store_io_out_wr_0_bits_data_0_5;
	wire [7:0] store_io_out_wr_0_bits_data_0_6;
	wire [7:0] store_io_out_wr_0_bits_data_0_7;
	wire [7:0] store_io_out_wr_0_bits_data_0_8;
	wire [7:0] store_io_out_wr_0_bits_data_0_9;
	wire [7:0] store_io_out_wr_0_bits_data_0_10;
	wire [7:0] store_io_out_wr_0_bits_data_0_11;
	wire [7:0] store_io_out_wr_0_bits_data_0_12;
	wire [7:0] store_io_out_wr_0_bits_data_0_13;
	wire [7:0] store_io_out_wr_0_bits_data_0_14;
	wire [7:0] store_io_out_wr_0_bits_data_0_15;
	wire ecounters_clock;
	wire ecounters_reset;
	wire ecounters_io_launch;
	wire ecounters_io_finish;
	wire ecounters_io_ecnt_0_valid;
	wire [31:0] ecounters_io_ecnt_0_bits;
	wire ecounters_io_ucnt_0_valid;
	wire [31:0] ecounters_io_ucnt_0_bits;
	wire ecounters_io_acc_wr_event;
	reg finish;
	Fetch fetch(
		.clk(fetch_clock),
		.rst(fetch_reset),
		.io_launch(fetch_io_launch),
		.io_ins_baddr(fetch_io_ins_baddr),
		.io_ins_count(fetch_io_ins_count),
		.io_vme_rd_cmd_ready(fetch_io_vme_rd_cmd_ready),
		.io_vme_rd_cmd_valid(fetch_io_vme_rd_cmd_valid),
		.io_vme_rd_cmd_bits_addr(fetch_io_vme_rd_cmd_bits_addr),
		.io_vme_rd_cmd_bits_len(fetch_io_vme_rd_cmd_bits_len),
		.io_vme_rd_data_ready(fetch_io_vme_rd_data_ready),
		.io_vme_rd_data_valid(fetch_io_vme_rd_data_valid),
		.io_vme_rd_data_bits_data(fetch_io_vme_rd_data_bits_data),
		.io_inst_ld_ready(fetch_io_inst_ld_ready),
		.io_inst_ld_valid(fetch_io_inst_ld_valid),
		.io_inst_ld_bits(fetch_io_inst_ld_bits),
		.io_inst_co_ready(fetch_io_inst_co_ready),
		.io_inst_co_valid(fetch_io_inst_co_valid),
		.io_inst_co_bits(fetch_io_inst_co_bits),
		.io_inst_st_ready(fetch_io_inst_st_ready),
		.io_inst_st_valid(fetch_io_inst_st_valid),
		.io_inst_st_bits(fetch_io_inst_st_bits)
	);
	Load load(
		.clk(load_clock),
		.rst(load_reset),
		.io_i_post(load_io_i_post),
		.io_o_post(load_io_o_post),
		.io_inst_ready(load_io_inst_ready),
		.io_inst_valid(load_io_inst_valid),
		.io_inst_bits(load_io_inst_bits),
		.io_inp_baddr(load_io_inp_baddr),
		.io_wgt_baddr(load_io_wgt_baddr),
		.io_vme_rd_0_cmd_ready(load_io_vme_rd_0_cmd_ready),
		.io_vme_rd_0_cmd_valid(load_io_vme_rd_0_cmd_valid),
		.io_vme_rd_0_cmd_bits_addr(load_io_vme_rd_0_cmd_bits_addr),
		.io_vme_rd_0_cmd_bits_len(load_io_vme_rd_0_cmd_bits_len),
		.io_vme_rd_0_cmd_bits_tag(load_io_vme_rd_0_cmd_bits_tag),
		.io_vme_rd_0_data_valid(load_io_vme_rd_0_data_valid),
		.io_vme_rd_0_data_bits_data(load_io_vme_rd_0_data_bits_data),
		.io_vme_rd_0_data_bits_tag(load_io_vme_rd_0_data_bits_tag),
		.io_vme_rd_1_cmd_ready(load_io_vme_rd_1_cmd_ready),
		.io_vme_rd_1_cmd_valid(load_io_vme_rd_1_cmd_valid),
		.io_vme_rd_1_cmd_bits_addr(load_io_vme_rd_1_cmd_bits_addr),
		.io_vme_rd_1_cmd_bits_len(load_io_vme_rd_1_cmd_bits_len),
		.io_vme_rd_1_cmd_bits_tag(load_io_vme_rd_1_cmd_bits_tag),
		.io_vme_rd_1_data_valid(load_io_vme_rd_1_data_valid),
		.io_vme_rd_1_data_bits_data(load_io_vme_rd_1_data_bits_data),
		.io_vme_rd_1_data_bits_tag(load_io_vme_rd_1_data_bits_tag),
		.io_inp_rd_0_idx_valid(load_io_inp_rd_0_idx_valid),
		.io_inp_rd_0_idx_bits(load_io_inp_rd_0_idx_bits),
		.io_inp_rd_0_data_valid(load_io_inp_rd_0_data_valid),
		.io_inp_rd_0_data_bits_0_0(load_io_inp_rd_0_data_bits_0_0),
		.io_inp_rd_0_data_bits_0_1(load_io_inp_rd_0_data_bits_0_1),
		.io_inp_rd_0_data_bits_0_2(load_io_inp_rd_0_data_bits_0_2),
		.io_inp_rd_0_data_bits_0_3(load_io_inp_rd_0_data_bits_0_3),
		.io_inp_rd_0_data_bits_0_4(load_io_inp_rd_0_data_bits_0_4),
		.io_inp_rd_0_data_bits_0_5(load_io_inp_rd_0_data_bits_0_5),
		.io_inp_rd_0_data_bits_0_6(load_io_inp_rd_0_data_bits_0_6),
		.io_inp_rd_0_data_bits_0_7(load_io_inp_rd_0_data_bits_0_7),
		.io_inp_rd_0_data_bits_0_8(load_io_inp_rd_0_data_bits_0_8),
		.io_inp_rd_0_data_bits_0_9(load_io_inp_rd_0_data_bits_0_9),
		.io_inp_rd_0_data_bits_0_10(load_io_inp_rd_0_data_bits_0_10),
		.io_inp_rd_0_data_bits_0_11(load_io_inp_rd_0_data_bits_0_11),
		.io_inp_rd_0_data_bits_0_12(load_io_inp_rd_0_data_bits_0_12),
		.io_inp_rd_0_data_bits_0_13(load_io_inp_rd_0_data_bits_0_13),
		.io_inp_rd_0_data_bits_0_14(load_io_inp_rd_0_data_bits_0_14),
		.io_inp_rd_0_data_bits_0_15(load_io_inp_rd_0_data_bits_0_15),
		.io_wgt_rd_0_idx_valid(load_io_wgt_rd_0_idx_valid),
		.io_wgt_rd_0_idx_bits(load_io_wgt_rd_0_idx_bits),
		.io_wgt_rd_0_data_valid(load_io_wgt_rd_0_data_valid),
		.io_wgt_rd_0_data_bits_0_0(load_io_wgt_rd_0_data_bits_0_0),
		.io_wgt_rd_0_data_bits_0_1(load_io_wgt_rd_0_data_bits_0_1),
		.io_wgt_rd_0_data_bits_0_2(load_io_wgt_rd_0_data_bits_0_2),
		.io_wgt_rd_0_data_bits_0_3(load_io_wgt_rd_0_data_bits_0_3),
		.io_wgt_rd_0_data_bits_0_4(load_io_wgt_rd_0_data_bits_0_4),
		.io_wgt_rd_0_data_bits_0_5(load_io_wgt_rd_0_data_bits_0_5),
		.io_wgt_rd_0_data_bits_0_6(load_io_wgt_rd_0_data_bits_0_6),
		.io_wgt_rd_0_data_bits_0_7(load_io_wgt_rd_0_data_bits_0_7),
		.io_wgt_rd_0_data_bits_0_8(load_io_wgt_rd_0_data_bits_0_8),
		.io_wgt_rd_0_data_bits_0_9(load_io_wgt_rd_0_data_bits_0_9),
		.io_wgt_rd_0_data_bits_0_10(load_io_wgt_rd_0_data_bits_0_10),
		.io_wgt_rd_0_data_bits_0_11(load_io_wgt_rd_0_data_bits_0_11),
		.io_wgt_rd_0_data_bits_0_12(load_io_wgt_rd_0_data_bits_0_12),
		.io_wgt_rd_0_data_bits_0_13(load_io_wgt_rd_0_data_bits_0_13),
		.io_wgt_rd_0_data_bits_0_14(load_io_wgt_rd_0_data_bits_0_14),
		.io_wgt_rd_0_data_bits_0_15(load_io_wgt_rd_0_data_bits_0_15),
		.io_wgt_rd_0_data_bits_1_0(load_io_wgt_rd_0_data_bits_1_0),
		.io_wgt_rd_0_data_bits_1_1(load_io_wgt_rd_0_data_bits_1_1),
		.io_wgt_rd_0_data_bits_1_2(load_io_wgt_rd_0_data_bits_1_2),
		.io_wgt_rd_0_data_bits_1_3(load_io_wgt_rd_0_data_bits_1_3),
		.io_wgt_rd_0_data_bits_1_4(load_io_wgt_rd_0_data_bits_1_4),
		.io_wgt_rd_0_data_bits_1_5(load_io_wgt_rd_0_data_bits_1_5),
		.io_wgt_rd_0_data_bits_1_6(load_io_wgt_rd_0_data_bits_1_6),
		.io_wgt_rd_0_data_bits_1_7(load_io_wgt_rd_0_data_bits_1_7),
		.io_wgt_rd_0_data_bits_1_8(load_io_wgt_rd_0_data_bits_1_8),
		.io_wgt_rd_0_data_bits_1_9(load_io_wgt_rd_0_data_bits_1_9),
		.io_wgt_rd_0_data_bits_1_10(load_io_wgt_rd_0_data_bits_1_10),
		.io_wgt_rd_0_data_bits_1_11(load_io_wgt_rd_0_data_bits_1_11),
		.io_wgt_rd_0_data_bits_1_12(load_io_wgt_rd_0_data_bits_1_12),
		.io_wgt_rd_0_data_bits_1_13(load_io_wgt_rd_0_data_bits_1_13),
		.io_wgt_rd_0_data_bits_1_14(load_io_wgt_rd_0_data_bits_1_14),
		.io_wgt_rd_0_data_bits_1_15(load_io_wgt_rd_0_data_bits_1_15),
		.io_wgt_rd_0_data_bits_2_0(load_io_wgt_rd_0_data_bits_2_0),
		.io_wgt_rd_0_data_bits_2_1(load_io_wgt_rd_0_data_bits_2_1),
		.io_wgt_rd_0_data_bits_2_2(load_io_wgt_rd_0_data_bits_2_2),
		.io_wgt_rd_0_data_bits_2_3(load_io_wgt_rd_0_data_bits_2_3),
		.io_wgt_rd_0_data_bits_2_4(load_io_wgt_rd_0_data_bits_2_4),
		.io_wgt_rd_0_data_bits_2_5(load_io_wgt_rd_0_data_bits_2_5),
		.io_wgt_rd_0_data_bits_2_6(load_io_wgt_rd_0_data_bits_2_6),
		.io_wgt_rd_0_data_bits_2_7(load_io_wgt_rd_0_data_bits_2_7),
		.io_wgt_rd_0_data_bits_2_8(load_io_wgt_rd_0_data_bits_2_8),
		.io_wgt_rd_0_data_bits_2_9(load_io_wgt_rd_0_data_bits_2_9),
		.io_wgt_rd_0_data_bits_2_10(load_io_wgt_rd_0_data_bits_2_10),
		.io_wgt_rd_0_data_bits_2_11(load_io_wgt_rd_0_data_bits_2_11),
		.io_wgt_rd_0_data_bits_2_12(load_io_wgt_rd_0_data_bits_2_12),
		.io_wgt_rd_0_data_bits_2_13(load_io_wgt_rd_0_data_bits_2_13),
		.io_wgt_rd_0_data_bits_2_14(load_io_wgt_rd_0_data_bits_2_14),
		.io_wgt_rd_0_data_bits_2_15(load_io_wgt_rd_0_data_bits_2_15),
		.io_wgt_rd_0_data_bits_3_0(load_io_wgt_rd_0_data_bits_3_0),
		.io_wgt_rd_0_data_bits_3_1(load_io_wgt_rd_0_data_bits_3_1),
		.io_wgt_rd_0_data_bits_3_2(load_io_wgt_rd_0_data_bits_3_2),
		.io_wgt_rd_0_data_bits_3_3(load_io_wgt_rd_0_data_bits_3_3),
		.io_wgt_rd_0_data_bits_3_4(load_io_wgt_rd_0_data_bits_3_4),
		.io_wgt_rd_0_data_bits_3_5(load_io_wgt_rd_0_data_bits_3_5),
		.io_wgt_rd_0_data_bits_3_6(load_io_wgt_rd_0_data_bits_3_6),
		.io_wgt_rd_0_data_bits_3_7(load_io_wgt_rd_0_data_bits_3_7),
		.io_wgt_rd_0_data_bits_3_8(load_io_wgt_rd_0_data_bits_3_8),
		.io_wgt_rd_0_data_bits_3_9(load_io_wgt_rd_0_data_bits_3_9),
		.io_wgt_rd_0_data_bits_3_10(load_io_wgt_rd_0_data_bits_3_10),
		.io_wgt_rd_0_data_bits_3_11(load_io_wgt_rd_0_data_bits_3_11),
		.io_wgt_rd_0_data_bits_3_12(load_io_wgt_rd_0_data_bits_3_12),
		.io_wgt_rd_0_data_bits_3_13(load_io_wgt_rd_0_data_bits_3_13),
		.io_wgt_rd_0_data_bits_3_14(load_io_wgt_rd_0_data_bits_3_14),
		.io_wgt_rd_0_data_bits_3_15(load_io_wgt_rd_0_data_bits_3_15),
		.io_wgt_rd_0_data_bits_4_0(load_io_wgt_rd_0_data_bits_4_0),
		.io_wgt_rd_0_data_bits_4_1(load_io_wgt_rd_0_data_bits_4_1),
		.io_wgt_rd_0_data_bits_4_2(load_io_wgt_rd_0_data_bits_4_2),
		.io_wgt_rd_0_data_bits_4_3(load_io_wgt_rd_0_data_bits_4_3),
		.io_wgt_rd_0_data_bits_4_4(load_io_wgt_rd_0_data_bits_4_4),
		.io_wgt_rd_0_data_bits_4_5(load_io_wgt_rd_0_data_bits_4_5),
		.io_wgt_rd_0_data_bits_4_6(load_io_wgt_rd_0_data_bits_4_6),
		.io_wgt_rd_0_data_bits_4_7(load_io_wgt_rd_0_data_bits_4_7),
		.io_wgt_rd_0_data_bits_4_8(load_io_wgt_rd_0_data_bits_4_8),
		.io_wgt_rd_0_data_bits_4_9(load_io_wgt_rd_0_data_bits_4_9),
		.io_wgt_rd_0_data_bits_4_10(load_io_wgt_rd_0_data_bits_4_10),
		.io_wgt_rd_0_data_bits_4_11(load_io_wgt_rd_0_data_bits_4_11),
		.io_wgt_rd_0_data_bits_4_12(load_io_wgt_rd_0_data_bits_4_12),
		.io_wgt_rd_0_data_bits_4_13(load_io_wgt_rd_0_data_bits_4_13),
		.io_wgt_rd_0_data_bits_4_14(load_io_wgt_rd_0_data_bits_4_14),
		.io_wgt_rd_0_data_bits_4_15(load_io_wgt_rd_0_data_bits_4_15),
		.io_wgt_rd_0_data_bits_5_0(load_io_wgt_rd_0_data_bits_5_0),
		.io_wgt_rd_0_data_bits_5_1(load_io_wgt_rd_0_data_bits_5_1),
		.io_wgt_rd_0_data_bits_5_2(load_io_wgt_rd_0_data_bits_5_2),
		.io_wgt_rd_0_data_bits_5_3(load_io_wgt_rd_0_data_bits_5_3),
		.io_wgt_rd_0_data_bits_5_4(load_io_wgt_rd_0_data_bits_5_4),
		.io_wgt_rd_0_data_bits_5_5(load_io_wgt_rd_0_data_bits_5_5),
		.io_wgt_rd_0_data_bits_5_6(load_io_wgt_rd_0_data_bits_5_6),
		.io_wgt_rd_0_data_bits_5_7(load_io_wgt_rd_0_data_bits_5_7),
		.io_wgt_rd_0_data_bits_5_8(load_io_wgt_rd_0_data_bits_5_8),
		.io_wgt_rd_0_data_bits_5_9(load_io_wgt_rd_0_data_bits_5_9),
		.io_wgt_rd_0_data_bits_5_10(load_io_wgt_rd_0_data_bits_5_10),
		.io_wgt_rd_0_data_bits_5_11(load_io_wgt_rd_0_data_bits_5_11),
		.io_wgt_rd_0_data_bits_5_12(load_io_wgt_rd_0_data_bits_5_12),
		.io_wgt_rd_0_data_bits_5_13(load_io_wgt_rd_0_data_bits_5_13),
		.io_wgt_rd_0_data_bits_5_14(load_io_wgt_rd_0_data_bits_5_14),
		.io_wgt_rd_0_data_bits_5_15(load_io_wgt_rd_0_data_bits_5_15),
		.io_wgt_rd_0_data_bits_6_0(load_io_wgt_rd_0_data_bits_6_0),
		.io_wgt_rd_0_data_bits_6_1(load_io_wgt_rd_0_data_bits_6_1),
		.io_wgt_rd_0_data_bits_6_2(load_io_wgt_rd_0_data_bits_6_2),
		.io_wgt_rd_0_data_bits_6_3(load_io_wgt_rd_0_data_bits_6_3),
		.io_wgt_rd_0_data_bits_6_4(load_io_wgt_rd_0_data_bits_6_4),
		.io_wgt_rd_0_data_bits_6_5(load_io_wgt_rd_0_data_bits_6_5),
		.io_wgt_rd_0_data_bits_6_6(load_io_wgt_rd_0_data_bits_6_6),
		.io_wgt_rd_0_data_bits_6_7(load_io_wgt_rd_0_data_bits_6_7),
		.io_wgt_rd_0_data_bits_6_8(load_io_wgt_rd_0_data_bits_6_8),
		.io_wgt_rd_0_data_bits_6_9(load_io_wgt_rd_0_data_bits_6_9),
		.io_wgt_rd_0_data_bits_6_10(load_io_wgt_rd_0_data_bits_6_10),
		.io_wgt_rd_0_data_bits_6_11(load_io_wgt_rd_0_data_bits_6_11),
		.io_wgt_rd_0_data_bits_6_12(load_io_wgt_rd_0_data_bits_6_12),
		.io_wgt_rd_0_data_bits_6_13(load_io_wgt_rd_0_data_bits_6_13),
		.io_wgt_rd_0_data_bits_6_14(load_io_wgt_rd_0_data_bits_6_14),
		.io_wgt_rd_0_data_bits_6_15(load_io_wgt_rd_0_data_bits_6_15),
		.io_wgt_rd_0_data_bits_7_0(load_io_wgt_rd_0_data_bits_7_0),
		.io_wgt_rd_0_data_bits_7_1(load_io_wgt_rd_0_data_bits_7_1),
		.io_wgt_rd_0_data_bits_7_2(load_io_wgt_rd_0_data_bits_7_2),
		.io_wgt_rd_0_data_bits_7_3(load_io_wgt_rd_0_data_bits_7_3),
		.io_wgt_rd_0_data_bits_7_4(load_io_wgt_rd_0_data_bits_7_4),
		.io_wgt_rd_0_data_bits_7_5(load_io_wgt_rd_0_data_bits_7_5),
		.io_wgt_rd_0_data_bits_7_6(load_io_wgt_rd_0_data_bits_7_6),
		.io_wgt_rd_0_data_bits_7_7(load_io_wgt_rd_0_data_bits_7_7),
		.io_wgt_rd_0_data_bits_7_8(load_io_wgt_rd_0_data_bits_7_8),
		.io_wgt_rd_0_data_bits_7_9(load_io_wgt_rd_0_data_bits_7_9),
		.io_wgt_rd_0_data_bits_7_10(load_io_wgt_rd_0_data_bits_7_10),
		.io_wgt_rd_0_data_bits_7_11(load_io_wgt_rd_0_data_bits_7_11),
		.io_wgt_rd_0_data_bits_7_12(load_io_wgt_rd_0_data_bits_7_12),
		.io_wgt_rd_0_data_bits_7_13(load_io_wgt_rd_0_data_bits_7_13),
		.io_wgt_rd_0_data_bits_7_14(load_io_wgt_rd_0_data_bits_7_14),
		.io_wgt_rd_0_data_bits_7_15(load_io_wgt_rd_0_data_bits_7_15),
		.io_wgt_rd_0_data_bits_8_0(load_io_wgt_rd_0_data_bits_8_0),
		.io_wgt_rd_0_data_bits_8_1(load_io_wgt_rd_0_data_bits_8_1),
		.io_wgt_rd_0_data_bits_8_2(load_io_wgt_rd_0_data_bits_8_2),
		.io_wgt_rd_0_data_bits_8_3(load_io_wgt_rd_0_data_bits_8_3),
		.io_wgt_rd_0_data_bits_8_4(load_io_wgt_rd_0_data_bits_8_4),
		.io_wgt_rd_0_data_bits_8_5(load_io_wgt_rd_0_data_bits_8_5),
		.io_wgt_rd_0_data_bits_8_6(load_io_wgt_rd_0_data_bits_8_6),
		.io_wgt_rd_0_data_bits_8_7(load_io_wgt_rd_0_data_bits_8_7),
		.io_wgt_rd_0_data_bits_8_8(load_io_wgt_rd_0_data_bits_8_8),
		.io_wgt_rd_0_data_bits_8_9(load_io_wgt_rd_0_data_bits_8_9),
		.io_wgt_rd_0_data_bits_8_10(load_io_wgt_rd_0_data_bits_8_10),
		.io_wgt_rd_0_data_bits_8_11(load_io_wgt_rd_0_data_bits_8_11),
		.io_wgt_rd_0_data_bits_8_12(load_io_wgt_rd_0_data_bits_8_12),
		.io_wgt_rd_0_data_bits_8_13(load_io_wgt_rd_0_data_bits_8_13),
		.io_wgt_rd_0_data_bits_8_14(load_io_wgt_rd_0_data_bits_8_14),
		.io_wgt_rd_0_data_bits_8_15(load_io_wgt_rd_0_data_bits_8_15),
		.io_wgt_rd_0_data_bits_9_0(load_io_wgt_rd_0_data_bits_9_0),
		.io_wgt_rd_0_data_bits_9_1(load_io_wgt_rd_0_data_bits_9_1),
		.io_wgt_rd_0_data_bits_9_2(load_io_wgt_rd_0_data_bits_9_2),
		.io_wgt_rd_0_data_bits_9_3(load_io_wgt_rd_0_data_bits_9_3),
		.io_wgt_rd_0_data_bits_9_4(load_io_wgt_rd_0_data_bits_9_4),
		.io_wgt_rd_0_data_bits_9_5(load_io_wgt_rd_0_data_bits_9_5),
		.io_wgt_rd_0_data_bits_9_6(load_io_wgt_rd_0_data_bits_9_6),
		.io_wgt_rd_0_data_bits_9_7(load_io_wgt_rd_0_data_bits_9_7),
		.io_wgt_rd_0_data_bits_9_8(load_io_wgt_rd_0_data_bits_9_8),
		.io_wgt_rd_0_data_bits_9_9(load_io_wgt_rd_0_data_bits_9_9),
		.io_wgt_rd_0_data_bits_9_10(load_io_wgt_rd_0_data_bits_9_10),
		.io_wgt_rd_0_data_bits_9_11(load_io_wgt_rd_0_data_bits_9_11),
		.io_wgt_rd_0_data_bits_9_12(load_io_wgt_rd_0_data_bits_9_12),
		.io_wgt_rd_0_data_bits_9_13(load_io_wgt_rd_0_data_bits_9_13),
		.io_wgt_rd_0_data_bits_9_14(load_io_wgt_rd_0_data_bits_9_14),
		.io_wgt_rd_0_data_bits_9_15(load_io_wgt_rd_0_data_bits_9_15),
		.io_wgt_rd_0_data_bits_10_0(load_io_wgt_rd_0_data_bits_10_0),
		.io_wgt_rd_0_data_bits_10_1(load_io_wgt_rd_0_data_bits_10_1),
		.io_wgt_rd_0_data_bits_10_2(load_io_wgt_rd_0_data_bits_10_2),
		.io_wgt_rd_0_data_bits_10_3(load_io_wgt_rd_0_data_bits_10_3),
		.io_wgt_rd_0_data_bits_10_4(load_io_wgt_rd_0_data_bits_10_4),
		.io_wgt_rd_0_data_bits_10_5(load_io_wgt_rd_0_data_bits_10_5),
		.io_wgt_rd_0_data_bits_10_6(load_io_wgt_rd_0_data_bits_10_6),
		.io_wgt_rd_0_data_bits_10_7(load_io_wgt_rd_0_data_bits_10_7),
		.io_wgt_rd_0_data_bits_10_8(load_io_wgt_rd_0_data_bits_10_8),
		.io_wgt_rd_0_data_bits_10_9(load_io_wgt_rd_0_data_bits_10_9),
		.io_wgt_rd_0_data_bits_10_10(load_io_wgt_rd_0_data_bits_10_10),
		.io_wgt_rd_0_data_bits_10_11(load_io_wgt_rd_0_data_bits_10_11),
		.io_wgt_rd_0_data_bits_10_12(load_io_wgt_rd_0_data_bits_10_12),
		.io_wgt_rd_0_data_bits_10_13(load_io_wgt_rd_0_data_bits_10_13),
		.io_wgt_rd_0_data_bits_10_14(load_io_wgt_rd_0_data_bits_10_14),
		.io_wgt_rd_0_data_bits_10_15(load_io_wgt_rd_0_data_bits_10_15),
		.io_wgt_rd_0_data_bits_11_0(load_io_wgt_rd_0_data_bits_11_0),
		.io_wgt_rd_0_data_bits_11_1(load_io_wgt_rd_0_data_bits_11_1),
		.io_wgt_rd_0_data_bits_11_2(load_io_wgt_rd_0_data_bits_11_2),
		.io_wgt_rd_0_data_bits_11_3(load_io_wgt_rd_0_data_bits_11_3),
		.io_wgt_rd_0_data_bits_11_4(load_io_wgt_rd_0_data_bits_11_4),
		.io_wgt_rd_0_data_bits_11_5(load_io_wgt_rd_0_data_bits_11_5),
		.io_wgt_rd_0_data_bits_11_6(load_io_wgt_rd_0_data_bits_11_6),
		.io_wgt_rd_0_data_bits_11_7(load_io_wgt_rd_0_data_bits_11_7),
		.io_wgt_rd_0_data_bits_11_8(load_io_wgt_rd_0_data_bits_11_8),
		.io_wgt_rd_0_data_bits_11_9(load_io_wgt_rd_0_data_bits_11_9),
		.io_wgt_rd_0_data_bits_11_10(load_io_wgt_rd_0_data_bits_11_10),
		.io_wgt_rd_0_data_bits_11_11(load_io_wgt_rd_0_data_bits_11_11),
		.io_wgt_rd_0_data_bits_11_12(load_io_wgt_rd_0_data_bits_11_12),
		.io_wgt_rd_0_data_bits_11_13(load_io_wgt_rd_0_data_bits_11_13),
		.io_wgt_rd_0_data_bits_11_14(load_io_wgt_rd_0_data_bits_11_14),
		.io_wgt_rd_0_data_bits_11_15(load_io_wgt_rd_0_data_bits_11_15),
		.io_wgt_rd_0_data_bits_12_0(load_io_wgt_rd_0_data_bits_12_0),
		.io_wgt_rd_0_data_bits_12_1(load_io_wgt_rd_0_data_bits_12_1),
		.io_wgt_rd_0_data_bits_12_2(load_io_wgt_rd_0_data_bits_12_2),
		.io_wgt_rd_0_data_bits_12_3(load_io_wgt_rd_0_data_bits_12_3),
		.io_wgt_rd_0_data_bits_12_4(load_io_wgt_rd_0_data_bits_12_4),
		.io_wgt_rd_0_data_bits_12_5(load_io_wgt_rd_0_data_bits_12_5),
		.io_wgt_rd_0_data_bits_12_6(load_io_wgt_rd_0_data_bits_12_6),
		.io_wgt_rd_0_data_bits_12_7(load_io_wgt_rd_0_data_bits_12_7),
		.io_wgt_rd_0_data_bits_12_8(load_io_wgt_rd_0_data_bits_12_8),
		.io_wgt_rd_0_data_bits_12_9(load_io_wgt_rd_0_data_bits_12_9),
		.io_wgt_rd_0_data_bits_12_10(load_io_wgt_rd_0_data_bits_12_10),
		.io_wgt_rd_0_data_bits_12_11(load_io_wgt_rd_0_data_bits_12_11),
		.io_wgt_rd_0_data_bits_12_12(load_io_wgt_rd_0_data_bits_12_12),
		.io_wgt_rd_0_data_bits_12_13(load_io_wgt_rd_0_data_bits_12_13),
		.io_wgt_rd_0_data_bits_12_14(load_io_wgt_rd_0_data_bits_12_14),
		.io_wgt_rd_0_data_bits_12_15(load_io_wgt_rd_0_data_bits_12_15),
		.io_wgt_rd_0_data_bits_13_0(load_io_wgt_rd_0_data_bits_13_0),
		.io_wgt_rd_0_data_bits_13_1(load_io_wgt_rd_0_data_bits_13_1),
		.io_wgt_rd_0_data_bits_13_2(load_io_wgt_rd_0_data_bits_13_2),
		.io_wgt_rd_0_data_bits_13_3(load_io_wgt_rd_0_data_bits_13_3),
		.io_wgt_rd_0_data_bits_13_4(load_io_wgt_rd_0_data_bits_13_4),
		.io_wgt_rd_0_data_bits_13_5(load_io_wgt_rd_0_data_bits_13_5),
		.io_wgt_rd_0_data_bits_13_6(load_io_wgt_rd_0_data_bits_13_6),
		.io_wgt_rd_0_data_bits_13_7(load_io_wgt_rd_0_data_bits_13_7),
		.io_wgt_rd_0_data_bits_13_8(load_io_wgt_rd_0_data_bits_13_8),
		.io_wgt_rd_0_data_bits_13_9(load_io_wgt_rd_0_data_bits_13_9),
		.io_wgt_rd_0_data_bits_13_10(load_io_wgt_rd_0_data_bits_13_10),
		.io_wgt_rd_0_data_bits_13_11(load_io_wgt_rd_0_data_bits_13_11),
		.io_wgt_rd_0_data_bits_13_12(load_io_wgt_rd_0_data_bits_13_12),
		.io_wgt_rd_0_data_bits_13_13(load_io_wgt_rd_0_data_bits_13_13),
		.io_wgt_rd_0_data_bits_13_14(load_io_wgt_rd_0_data_bits_13_14),
		.io_wgt_rd_0_data_bits_13_15(load_io_wgt_rd_0_data_bits_13_15),
		.io_wgt_rd_0_data_bits_14_0(load_io_wgt_rd_0_data_bits_14_0),
		.io_wgt_rd_0_data_bits_14_1(load_io_wgt_rd_0_data_bits_14_1),
		.io_wgt_rd_0_data_bits_14_2(load_io_wgt_rd_0_data_bits_14_2),
		.io_wgt_rd_0_data_bits_14_3(load_io_wgt_rd_0_data_bits_14_3),
		.io_wgt_rd_0_data_bits_14_4(load_io_wgt_rd_0_data_bits_14_4),
		.io_wgt_rd_0_data_bits_14_5(load_io_wgt_rd_0_data_bits_14_5),
		.io_wgt_rd_0_data_bits_14_6(load_io_wgt_rd_0_data_bits_14_6),
		.io_wgt_rd_0_data_bits_14_7(load_io_wgt_rd_0_data_bits_14_7),
		.io_wgt_rd_0_data_bits_14_8(load_io_wgt_rd_0_data_bits_14_8),
		.io_wgt_rd_0_data_bits_14_9(load_io_wgt_rd_0_data_bits_14_9),
		.io_wgt_rd_0_data_bits_14_10(load_io_wgt_rd_0_data_bits_14_10),
		.io_wgt_rd_0_data_bits_14_11(load_io_wgt_rd_0_data_bits_14_11),
		.io_wgt_rd_0_data_bits_14_12(load_io_wgt_rd_0_data_bits_14_12),
		.io_wgt_rd_0_data_bits_14_13(load_io_wgt_rd_0_data_bits_14_13),
		.io_wgt_rd_0_data_bits_14_14(load_io_wgt_rd_0_data_bits_14_14),
		.io_wgt_rd_0_data_bits_14_15(load_io_wgt_rd_0_data_bits_14_15),
		.io_wgt_rd_0_data_bits_15_0(load_io_wgt_rd_0_data_bits_15_0),
		.io_wgt_rd_0_data_bits_15_1(load_io_wgt_rd_0_data_bits_15_1),
		.io_wgt_rd_0_data_bits_15_2(load_io_wgt_rd_0_data_bits_15_2),
		.io_wgt_rd_0_data_bits_15_3(load_io_wgt_rd_0_data_bits_15_3),
		.io_wgt_rd_0_data_bits_15_4(load_io_wgt_rd_0_data_bits_15_4),
		.io_wgt_rd_0_data_bits_15_5(load_io_wgt_rd_0_data_bits_15_5),
		.io_wgt_rd_0_data_bits_15_6(load_io_wgt_rd_0_data_bits_15_6),
		.io_wgt_rd_0_data_bits_15_7(load_io_wgt_rd_0_data_bits_15_7),
		.io_wgt_rd_0_data_bits_15_8(load_io_wgt_rd_0_data_bits_15_8),
		.io_wgt_rd_0_data_bits_15_9(load_io_wgt_rd_0_data_bits_15_9),
		.io_wgt_rd_0_data_bits_15_10(load_io_wgt_rd_0_data_bits_15_10),
		.io_wgt_rd_0_data_bits_15_11(load_io_wgt_rd_0_data_bits_15_11),
		.io_wgt_rd_0_data_bits_15_12(load_io_wgt_rd_0_data_bits_15_12),
		.io_wgt_rd_0_data_bits_15_13(load_io_wgt_rd_0_data_bits_15_13),
		.io_wgt_rd_0_data_bits_15_14(load_io_wgt_rd_0_data_bits_15_14),
		.io_wgt_rd_0_data_bits_15_15(load_io_wgt_rd_0_data_bits_15_15)
	);
	Compute compute(
		.clk(compute_clock),
		.rst(compute_reset),
		.io_i_post_0(compute_io_i_post_0),
		.io_i_post_1(compute_io_i_post_1),
		.io_o_post_0(compute_io_o_post_0),
		.io_o_post_1(compute_io_o_post_1),
		.io_inst_ready(compute_io_inst_ready),
		.io_inst_valid(compute_io_inst_valid),
		.io_inst_bits(compute_io_inst_bits),
		.io_uop_baddr(compute_io_uop_baddr),
		.io_acc_baddr(compute_io_acc_baddr),
		.io_vme_rd_0_cmd_ready(compute_io_vme_rd_0_cmd_ready),
		.io_vme_rd_0_cmd_valid(compute_io_vme_rd_0_cmd_valid),
		.io_vme_rd_0_cmd_bits_addr(compute_io_vme_rd_0_cmd_bits_addr),
		.io_vme_rd_0_cmd_bits_len(compute_io_vme_rd_0_cmd_bits_len),
		.io_vme_rd_0_cmd_bits_tag(compute_io_vme_rd_0_cmd_bits_tag),
		.io_vme_rd_0_data_valid(compute_io_vme_rd_0_data_valid),
		.io_vme_rd_0_data_bits_data(compute_io_vme_rd_0_data_bits_data),
		.io_vme_rd_0_data_bits_tag(compute_io_vme_rd_0_data_bits_tag),
		.io_vme_rd_0_data_bits_last(compute_io_vme_rd_0_data_bits_last),
		.io_vme_rd_1_cmd_ready(compute_io_vme_rd_1_cmd_ready),
		.io_vme_rd_1_cmd_valid(compute_io_vme_rd_1_cmd_valid),
		.io_vme_rd_1_cmd_bits_addr(compute_io_vme_rd_1_cmd_bits_addr),
		.io_vme_rd_1_cmd_bits_len(compute_io_vme_rd_1_cmd_bits_len),
		.io_vme_rd_1_cmd_bits_tag(compute_io_vme_rd_1_cmd_bits_tag),
		.io_vme_rd_1_data_valid(compute_io_vme_rd_1_data_valid),
		.io_vme_rd_1_data_bits_data(compute_io_vme_rd_1_data_bits_data),
		.io_vme_rd_1_data_bits_tag(compute_io_vme_rd_1_data_bits_tag),
		.io_inp_rd_0_idx_valid(compute_io_inp_rd_0_idx_valid),
		.io_inp_rd_0_idx_bits(compute_io_inp_rd_0_idx_bits),
		.io_inp_rd_0_data_valid(compute_io_inp_rd_0_data_valid),
		.io_inp_rd_0_data_bits_0_0(compute_io_inp_rd_0_data_bits_0_0),
		.io_inp_rd_0_data_bits_0_1(compute_io_inp_rd_0_data_bits_0_1),
		.io_inp_rd_0_data_bits_0_2(compute_io_inp_rd_0_data_bits_0_2),
		.io_inp_rd_0_data_bits_0_3(compute_io_inp_rd_0_data_bits_0_3),
		.io_inp_rd_0_data_bits_0_4(compute_io_inp_rd_0_data_bits_0_4),
		.io_inp_rd_0_data_bits_0_5(compute_io_inp_rd_0_data_bits_0_5),
		.io_inp_rd_0_data_bits_0_6(compute_io_inp_rd_0_data_bits_0_6),
		.io_inp_rd_0_data_bits_0_7(compute_io_inp_rd_0_data_bits_0_7),
		.io_inp_rd_0_data_bits_0_8(compute_io_inp_rd_0_data_bits_0_8),
		.io_inp_rd_0_data_bits_0_9(compute_io_inp_rd_0_data_bits_0_9),
		.io_inp_rd_0_data_bits_0_10(compute_io_inp_rd_0_data_bits_0_10),
		.io_inp_rd_0_data_bits_0_11(compute_io_inp_rd_0_data_bits_0_11),
		.io_inp_rd_0_data_bits_0_12(compute_io_inp_rd_0_data_bits_0_12),
		.io_inp_rd_0_data_bits_0_13(compute_io_inp_rd_0_data_bits_0_13),
		.io_inp_rd_0_data_bits_0_14(compute_io_inp_rd_0_data_bits_0_14),
		.io_inp_rd_0_data_bits_0_15(compute_io_inp_rd_0_data_bits_0_15),
		.io_wgt_rd_0_idx_valid(compute_io_wgt_rd_0_idx_valid),
		.io_wgt_rd_0_idx_bits(compute_io_wgt_rd_0_idx_bits),
		.io_wgt_rd_0_data_valid(compute_io_wgt_rd_0_data_valid),
		.io_wgt_rd_0_data_bits_0_0(compute_io_wgt_rd_0_data_bits_0_0),
		.io_wgt_rd_0_data_bits_0_1(compute_io_wgt_rd_0_data_bits_0_1),
		.io_wgt_rd_0_data_bits_0_2(compute_io_wgt_rd_0_data_bits_0_2),
		.io_wgt_rd_0_data_bits_0_3(compute_io_wgt_rd_0_data_bits_0_3),
		.io_wgt_rd_0_data_bits_0_4(compute_io_wgt_rd_0_data_bits_0_4),
		.io_wgt_rd_0_data_bits_0_5(compute_io_wgt_rd_0_data_bits_0_5),
		.io_wgt_rd_0_data_bits_0_6(compute_io_wgt_rd_0_data_bits_0_6),
		.io_wgt_rd_0_data_bits_0_7(compute_io_wgt_rd_0_data_bits_0_7),
		.io_wgt_rd_0_data_bits_0_8(compute_io_wgt_rd_0_data_bits_0_8),
		.io_wgt_rd_0_data_bits_0_9(compute_io_wgt_rd_0_data_bits_0_9),
		.io_wgt_rd_0_data_bits_0_10(compute_io_wgt_rd_0_data_bits_0_10),
		.io_wgt_rd_0_data_bits_0_11(compute_io_wgt_rd_0_data_bits_0_11),
		.io_wgt_rd_0_data_bits_0_12(compute_io_wgt_rd_0_data_bits_0_12),
		.io_wgt_rd_0_data_bits_0_13(compute_io_wgt_rd_0_data_bits_0_13),
		.io_wgt_rd_0_data_bits_0_14(compute_io_wgt_rd_0_data_bits_0_14),
		.io_wgt_rd_0_data_bits_0_15(compute_io_wgt_rd_0_data_bits_0_15),
		.io_wgt_rd_0_data_bits_1_0(compute_io_wgt_rd_0_data_bits_1_0),
		.io_wgt_rd_0_data_bits_1_1(compute_io_wgt_rd_0_data_bits_1_1),
		.io_wgt_rd_0_data_bits_1_2(compute_io_wgt_rd_0_data_bits_1_2),
		.io_wgt_rd_0_data_bits_1_3(compute_io_wgt_rd_0_data_bits_1_3),
		.io_wgt_rd_0_data_bits_1_4(compute_io_wgt_rd_0_data_bits_1_4),
		.io_wgt_rd_0_data_bits_1_5(compute_io_wgt_rd_0_data_bits_1_5),
		.io_wgt_rd_0_data_bits_1_6(compute_io_wgt_rd_0_data_bits_1_6),
		.io_wgt_rd_0_data_bits_1_7(compute_io_wgt_rd_0_data_bits_1_7),
		.io_wgt_rd_0_data_bits_1_8(compute_io_wgt_rd_0_data_bits_1_8),
		.io_wgt_rd_0_data_bits_1_9(compute_io_wgt_rd_0_data_bits_1_9),
		.io_wgt_rd_0_data_bits_1_10(compute_io_wgt_rd_0_data_bits_1_10),
		.io_wgt_rd_0_data_bits_1_11(compute_io_wgt_rd_0_data_bits_1_11),
		.io_wgt_rd_0_data_bits_1_12(compute_io_wgt_rd_0_data_bits_1_12),
		.io_wgt_rd_0_data_bits_1_13(compute_io_wgt_rd_0_data_bits_1_13),
		.io_wgt_rd_0_data_bits_1_14(compute_io_wgt_rd_0_data_bits_1_14),
		.io_wgt_rd_0_data_bits_1_15(compute_io_wgt_rd_0_data_bits_1_15),
		.io_wgt_rd_0_data_bits_2_0(compute_io_wgt_rd_0_data_bits_2_0),
		.io_wgt_rd_0_data_bits_2_1(compute_io_wgt_rd_0_data_bits_2_1),
		.io_wgt_rd_0_data_bits_2_2(compute_io_wgt_rd_0_data_bits_2_2),
		.io_wgt_rd_0_data_bits_2_3(compute_io_wgt_rd_0_data_bits_2_3),
		.io_wgt_rd_0_data_bits_2_4(compute_io_wgt_rd_0_data_bits_2_4),
		.io_wgt_rd_0_data_bits_2_5(compute_io_wgt_rd_0_data_bits_2_5),
		.io_wgt_rd_0_data_bits_2_6(compute_io_wgt_rd_0_data_bits_2_6),
		.io_wgt_rd_0_data_bits_2_7(compute_io_wgt_rd_0_data_bits_2_7),
		.io_wgt_rd_0_data_bits_2_8(compute_io_wgt_rd_0_data_bits_2_8),
		.io_wgt_rd_0_data_bits_2_9(compute_io_wgt_rd_0_data_bits_2_9),
		.io_wgt_rd_0_data_bits_2_10(compute_io_wgt_rd_0_data_bits_2_10),
		.io_wgt_rd_0_data_bits_2_11(compute_io_wgt_rd_0_data_bits_2_11),
		.io_wgt_rd_0_data_bits_2_12(compute_io_wgt_rd_0_data_bits_2_12),
		.io_wgt_rd_0_data_bits_2_13(compute_io_wgt_rd_0_data_bits_2_13),
		.io_wgt_rd_0_data_bits_2_14(compute_io_wgt_rd_0_data_bits_2_14),
		.io_wgt_rd_0_data_bits_2_15(compute_io_wgt_rd_0_data_bits_2_15),
		.io_wgt_rd_0_data_bits_3_0(compute_io_wgt_rd_0_data_bits_3_0),
		.io_wgt_rd_0_data_bits_3_1(compute_io_wgt_rd_0_data_bits_3_1),
		.io_wgt_rd_0_data_bits_3_2(compute_io_wgt_rd_0_data_bits_3_2),
		.io_wgt_rd_0_data_bits_3_3(compute_io_wgt_rd_0_data_bits_3_3),
		.io_wgt_rd_0_data_bits_3_4(compute_io_wgt_rd_0_data_bits_3_4),
		.io_wgt_rd_0_data_bits_3_5(compute_io_wgt_rd_0_data_bits_3_5),
		.io_wgt_rd_0_data_bits_3_6(compute_io_wgt_rd_0_data_bits_3_6),
		.io_wgt_rd_0_data_bits_3_7(compute_io_wgt_rd_0_data_bits_3_7),
		.io_wgt_rd_0_data_bits_3_8(compute_io_wgt_rd_0_data_bits_3_8),
		.io_wgt_rd_0_data_bits_3_9(compute_io_wgt_rd_0_data_bits_3_9),
		.io_wgt_rd_0_data_bits_3_10(compute_io_wgt_rd_0_data_bits_3_10),
		.io_wgt_rd_0_data_bits_3_11(compute_io_wgt_rd_0_data_bits_3_11),
		.io_wgt_rd_0_data_bits_3_12(compute_io_wgt_rd_0_data_bits_3_12),
		.io_wgt_rd_0_data_bits_3_13(compute_io_wgt_rd_0_data_bits_3_13),
		.io_wgt_rd_0_data_bits_3_14(compute_io_wgt_rd_0_data_bits_3_14),
		.io_wgt_rd_0_data_bits_3_15(compute_io_wgt_rd_0_data_bits_3_15),
		.io_wgt_rd_0_data_bits_4_0(compute_io_wgt_rd_0_data_bits_4_0),
		.io_wgt_rd_0_data_bits_4_1(compute_io_wgt_rd_0_data_bits_4_1),
		.io_wgt_rd_0_data_bits_4_2(compute_io_wgt_rd_0_data_bits_4_2),
		.io_wgt_rd_0_data_bits_4_3(compute_io_wgt_rd_0_data_bits_4_3),
		.io_wgt_rd_0_data_bits_4_4(compute_io_wgt_rd_0_data_bits_4_4),
		.io_wgt_rd_0_data_bits_4_5(compute_io_wgt_rd_0_data_bits_4_5),
		.io_wgt_rd_0_data_bits_4_6(compute_io_wgt_rd_0_data_bits_4_6),
		.io_wgt_rd_0_data_bits_4_7(compute_io_wgt_rd_0_data_bits_4_7),
		.io_wgt_rd_0_data_bits_4_8(compute_io_wgt_rd_0_data_bits_4_8),
		.io_wgt_rd_0_data_bits_4_9(compute_io_wgt_rd_0_data_bits_4_9),
		.io_wgt_rd_0_data_bits_4_10(compute_io_wgt_rd_0_data_bits_4_10),
		.io_wgt_rd_0_data_bits_4_11(compute_io_wgt_rd_0_data_bits_4_11),
		.io_wgt_rd_0_data_bits_4_12(compute_io_wgt_rd_0_data_bits_4_12),
		.io_wgt_rd_0_data_bits_4_13(compute_io_wgt_rd_0_data_bits_4_13),
		.io_wgt_rd_0_data_bits_4_14(compute_io_wgt_rd_0_data_bits_4_14),
		.io_wgt_rd_0_data_bits_4_15(compute_io_wgt_rd_0_data_bits_4_15),
		.io_wgt_rd_0_data_bits_5_0(compute_io_wgt_rd_0_data_bits_5_0),
		.io_wgt_rd_0_data_bits_5_1(compute_io_wgt_rd_0_data_bits_5_1),
		.io_wgt_rd_0_data_bits_5_2(compute_io_wgt_rd_0_data_bits_5_2),
		.io_wgt_rd_0_data_bits_5_3(compute_io_wgt_rd_0_data_bits_5_3),
		.io_wgt_rd_0_data_bits_5_4(compute_io_wgt_rd_0_data_bits_5_4),
		.io_wgt_rd_0_data_bits_5_5(compute_io_wgt_rd_0_data_bits_5_5),
		.io_wgt_rd_0_data_bits_5_6(compute_io_wgt_rd_0_data_bits_5_6),
		.io_wgt_rd_0_data_bits_5_7(compute_io_wgt_rd_0_data_bits_5_7),
		.io_wgt_rd_0_data_bits_5_8(compute_io_wgt_rd_0_data_bits_5_8),
		.io_wgt_rd_0_data_bits_5_9(compute_io_wgt_rd_0_data_bits_5_9),
		.io_wgt_rd_0_data_bits_5_10(compute_io_wgt_rd_0_data_bits_5_10),
		.io_wgt_rd_0_data_bits_5_11(compute_io_wgt_rd_0_data_bits_5_11),
		.io_wgt_rd_0_data_bits_5_12(compute_io_wgt_rd_0_data_bits_5_12),
		.io_wgt_rd_0_data_bits_5_13(compute_io_wgt_rd_0_data_bits_5_13),
		.io_wgt_rd_0_data_bits_5_14(compute_io_wgt_rd_0_data_bits_5_14),
		.io_wgt_rd_0_data_bits_5_15(compute_io_wgt_rd_0_data_bits_5_15),
		.io_wgt_rd_0_data_bits_6_0(compute_io_wgt_rd_0_data_bits_6_0),
		.io_wgt_rd_0_data_bits_6_1(compute_io_wgt_rd_0_data_bits_6_1),
		.io_wgt_rd_0_data_bits_6_2(compute_io_wgt_rd_0_data_bits_6_2),
		.io_wgt_rd_0_data_bits_6_3(compute_io_wgt_rd_0_data_bits_6_3),
		.io_wgt_rd_0_data_bits_6_4(compute_io_wgt_rd_0_data_bits_6_4),
		.io_wgt_rd_0_data_bits_6_5(compute_io_wgt_rd_0_data_bits_6_5),
		.io_wgt_rd_0_data_bits_6_6(compute_io_wgt_rd_0_data_bits_6_6),
		.io_wgt_rd_0_data_bits_6_7(compute_io_wgt_rd_0_data_bits_6_7),
		.io_wgt_rd_0_data_bits_6_8(compute_io_wgt_rd_0_data_bits_6_8),
		.io_wgt_rd_0_data_bits_6_9(compute_io_wgt_rd_0_data_bits_6_9),
		.io_wgt_rd_0_data_bits_6_10(compute_io_wgt_rd_0_data_bits_6_10),
		.io_wgt_rd_0_data_bits_6_11(compute_io_wgt_rd_0_data_bits_6_11),
		.io_wgt_rd_0_data_bits_6_12(compute_io_wgt_rd_0_data_bits_6_12),
		.io_wgt_rd_0_data_bits_6_13(compute_io_wgt_rd_0_data_bits_6_13),
		.io_wgt_rd_0_data_bits_6_14(compute_io_wgt_rd_0_data_bits_6_14),
		.io_wgt_rd_0_data_bits_6_15(compute_io_wgt_rd_0_data_bits_6_15),
		.io_wgt_rd_0_data_bits_7_0(compute_io_wgt_rd_0_data_bits_7_0),
		.io_wgt_rd_0_data_bits_7_1(compute_io_wgt_rd_0_data_bits_7_1),
		.io_wgt_rd_0_data_bits_7_2(compute_io_wgt_rd_0_data_bits_7_2),
		.io_wgt_rd_0_data_bits_7_3(compute_io_wgt_rd_0_data_bits_7_3),
		.io_wgt_rd_0_data_bits_7_4(compute_io_wgt_rd_0_data_bits_7_4),
		.io_wgt_rd_0_data_bits_7_5(compute_io_wgt_rd_0_data_bits_7_5),
		.io_wgt_rd_0_data_bits_7_6(compute_io_wgt_rd_0_data_bits_7_6),
		.io_wgt_rd_0_data_bits_7_7(compute_io_wgt_rd_0_data_bits_7_7),
		.io_wgt_rd_0_data_bits_7_8(compute_io_wgt_rd_0_data_bits_7_8),
		.io_wgt_rd_0_data_bits_7_9(compute_io_wgt_rd_0_data_bits_7_9),
		.io_wgt_rd_0_data_bits_7_10(compute_io_wgt_rd_0_data_bits_7_10),
		.io_wgt_rd_0_data_bits_7_11(compute_io_wgt_rd_0_data_bits_7_11),
		.io_wgt_rd_0_data_bits_7_12(compute_io_wgt_rd_0_data_bits_7_12),
		.io_wgt_rd_0_data_bits_7_13(compute_io_wgt_rd_0_data_bits_7_13),
		.io_wgt_rd_0_data_bits_7_14(compute_io_wgt_rd_0_data_bits_7_14),
		.io_wgt_rd_0_data_bits_7_15(compute_io_wgt_rd_0_data_bits_7_15),
		.io_wgt_rd_0_data_bits_8_0(compute_io_wgt_rd_0_data_bits_8_0),
		.io_wgt_rd_0_data_bits_8_1(compute_io_wgt_rd_0_data_bits_8_1),
		.io_wgt_rd_0_data_bits_8_2(compute_io_wgt_rd_0_data_bits_8_2),
		.io_wgt_rd_0_data_bits_8_3(compute_io_wgt_rd_0_data_bits_8_3),
		.io_wgt_rd_0_data_bits_8_4(compute_io_wgt_rd_0_data_bits_8_4),
		.io_wgt_rd_0_data_bits_8_5(compute_io_wgt_rd_0_data_bits_8_5),
		.io_wgt_rd_0_data_bits_8_6(compute_io_wgt_rd_0_data_bits_8_6),
		.io_wgt_rd_0_data_bits_8_7(compute_io_wgt_rd_0_data_bits_8_7),
		.io_wgt_rd_0_data_bits_8_8(compute_io_wgt_rd_0_data_bits_8_8),
		.io_wgt_rd_0_data_bits_8_9(compute_io_wgt_rd_0_data_bits_8_9),
		.io_wgt_rd_0_data_bits_8_10(compute_io_wgt_rd_0_data_bits_8_10),
		.io_wgt_rd_0_data_bits_8_11(compute_io_wgt_rd_0_data_bits_8_11),
		.io_wgt_rd_0_data_bits_8_12(compute_io_wgt_rd_0_data_bits_8_12),
		.io_wgt_rd_0_data_bits_8_13(compute_io_wgt_rd_0_data_bits_8_13),
		.io_wgt_rd_0_data_bits_8_14(compute_io_wgt_rd_0_data_bits_8_14),
		.io_wgt_rd_0_data_bits_8_15(compute_io_wgt_rd_0_data_bits_8_15),
		.io_wgt_rd_0_data_bits_9_0(compute_io_wgt_rd_0_data_bits_9_0),
		.io_wgt_rd_0_data_bits_9_1(compute_io_wgt_rd_0_data_bits_9_1),
		.io_wgt_rd_0_data_bits_9_2(compute_io_wgt_rd_0_data_bits_9_2),
		.io_wgt_rd_0_data_bits_9_3(compute_io_wgt_rd_0_data_bits_9_3),
		.io_wgt_rd_0_data_bits_9_4(compute_io_wgt_rd_0_data_bits_9_4),
		.io_wgt_rd_0_data_bits_9_5(compute_io_wgt_rd_0_data_bits_9_5),
		.io_wgt_rd_0_data_bits_9_6(compute_io_wgt_rd_0_data_bits_9_6),
		.io_wgt_rd_0_data_bits_9_7(compute_io_wgt_rd_0_data_bits_9_7),
		.io_wgt_rd_0_data_bits_9_8(compute_io_wgt_rd_0_data_bits_9_8),
		.io_wgt_rd_0_data_bits_9_9(compute_io_wgt_rd_0_data_bits_9_9),
		.io_wgt_rd_0_data_bits_9_10(compute_io_wgt_rd_0_data_bits_9_10),
		.io_wgt_rd_0_data_bits_9_11(compute_io_wgt_rd_0_data_bits_9_11),
		.io_wgt_rd_0_data_bits_9_12(compute_io_wgt_rd_0_data_bits_9_12),
		.io_wgt_rd_0_data_bits_9_13(compute_io_wgt_rd_0_data_bits_9_13),
		.io_wgt_rd_0_data_bits_9_14(compute_io_wgt_rd_0_data_bits_9_14),
		.io_wgt_rd_0_data_bits_9_15(compute_io_wgt_rd_0_data_bits_9_15),
		.io_wgt_rd_0_data_bits_10_0(compute_io_wgt_rd_0_data_bits_10_0),
		.io_wgt_rd_0_data_bits_10_1(compute_io_wgt_rd_0_data_bits_10_1),
		.io_wgt_rd_0_data_bits_10_2(compute_io_wgt_rd_0_data_bits_10_2),
		.io_wgt_rd_0_data_bits_10_3(compute_io_wgt_rd_0_data_bits_10_3),
		.io_wgt_rd_0_data_bits_10_4(compute_io_wgt_rd_0_data_bits_10_4),
		.io_wgt_rd_0_data_bits_10_5(compute_io_wgt_rd_0_data_bits_10_5),
		.io_wgt_rd_0_data_bits_10_6(compute_io_wgt_rd_0_data_bits_10_6),
		.io_wgt_rd_0_data_bits_10_7(compute_io_wgt_rd_0_data_bits_10_7),
		.io_wgt_rd_0_data_bits_10_8(compute_io_wgt_rd_0_data_bits_10_8),
		.io_wgt_rd_0_data_bits_10_9(compute_io_wgt_rd_0_data_bits_10_9),
		.io_wgt_rd_0_data_bits_10_10(compute_io_wgt_rd_0_data_bits_10_10),
		.io_wgt_rd_0_data_bits_10_11(compute_io_wgt_rd_0_data_bits_10_11),
		.io_wgt_rd_0_data_bits_10_12(compute_io_wgt_rd_0_data_bits_10_12),
		.io_wgt_rd_0_data_bits_10_13(compute_io_wgt_rd_0_data_bits_10_13),
		.io_wgt_rd_0_data_bits_10_14(compute_io_wgt_rd_0_data_bits_10_14),
		.io_wgt_rd_0_data_bits_10_15(compute_io_wgt_rd_0_data_bits_10_15),
		.io_wgt_rd_0_data_bits_11_0(compute_io_wgt_rd_0_data_bits_11_0),
		.io_wgt_rd_0_data_bits_11_1(compute_io_wgt_rd_0_data_bits_11_1),
		.io_wgt_rd_0_data_bits_11_2(compute_io_wgt_rd_0_data_bits_11_2),
		.io_wgt_rd_0_data_bits_11_3(compute_io_wgt_rd_0_data_bits_11_3),
		.io_wgt_rd_0_data_bits_11_4(compute_io_wgt_rd_0_data_bits_11_4),
		.io_wgt_rd_0_data_bits_11_5(compute_io_wgt_rd_0_data_bits_11_5),
		.io_wgt_rd_0_data_bits_11_6(compute_io_wgt_rd_0_data_bits_11_6),
		.io_wgt_rd_0_data_bits_11_7(compute_io_wgt_rd_0_data_bits_11_7),
		.io_wgt_rd_0_data_bits_11_8(compute_io_wgt_rd_0_data_bits_11_8),
		.io_wgt_rd_0_data_bits_11_9(compute_io_wgt_rd_0_data_bits_11_9),
		.io_wgt_rd_0_data_bits_11_10(compute_io_wgt_rd_0_data_bits_11_10),
		.io_wgt_rd_0_data_bits_11_11(compute_io_wgt_rd_0_data_bits_11_11),
		.io_wgt_rd_0_data_bits_11_12(compute_io_wgt_rd_0_data_bits_11_12),
		.io_wgt_rd_0_data_bits_11_13(compute_io_wgt_rd_0_data_bits_11_13),
		.io_wgt_rd_0_data_bits_11_14(compute_io_wgt_rd_0_data_bits_11_14),
		.io_wgt_rd_0_data_bits_11_15(compute_io_wgt_rd_0_data_bits_11_15),
		.io_wgt_rd_0_data_bits_12_0(compute_io_wgt_rd_0_data_bits_12_0),
		.io_wgt_rd_0_data_bits_12_1(compute_io_wgt_rd_0_data_bits_12_1),
		.io_wgt_rd_0_data_bits_12_2(compute_io_wgt_rd_0_data_bits_12_2),
		.io_wgt_rd_0_data_bits_12_3(compute_io_wgt_rd_0_data_bits_12_3),
		.io_wgt_rd_0_data_bits_12_4(compute_io_wgt_rd_0_data_bits_12_4),
		.io_wgt_rd_0_data_bits_12_5(compute_io_wgt_rd_0_data_bits_12_5),
		.io_wgt_rd_0_data_bits_12_6(compute_io_wgt_rd_0_data_bits_12_6),
		.io_wgt_rd_0_data_bits_12_7(compute_io_wgt_rd_0_data_bits_12_7),
		.io_wgt_rd_0_data_bits_12_8(compute_io_wgt_rd_0_data_bits_12_8),
		.io_wgt_rd_0_data_bits_12_9(compute_io_wgt_rd_0_data_bits_12_9),
		.io_wgt_rd_0_data_bits_12_10(compute_io_wgt_rd_0_data_bits_12_10),
		.io_wgt_rd_0_data_bits_12_11(compute_io_wgt_rd_0_data_bits_12_11),
		.io_wgt_rd_0_data_bits_12_12(compute_io_wgt_rd_0_data_bits_12_12),
		.io_wgt_rd_0_data_bits_12_13(compute_io_wgt_rd_0_data_bits_12_13),
		.io_wgt_rd_0_data_bits_12_14(compute_io_wgt_rd_0_data_bits_12_14),
		.io_wgt_rd_0_data_bits_12_15(compute_io_wgt_rd_0_data_bits_12_15),
		.io_wgt_rd_0_data_bits_13_0(compute_io_wgt_rd_0_data_bits_13_0),
		.io_wgt_rd_0_data_bits_13_1(compute_io_wgt_rd_0_data_bits_13_1),
		.io_wgt_rd_0_data_bits_13_2(compute_io_wgt_rd_0_data_bits_13_2),
		.io_wgt_rd_0_data_bits_13_3(compute_io_wgt_rd_0_data_bits_13_3),
		.io_wgt_rd_0_data_bits_13_4(compute_io_wgt_rd_0_data_bits_13_4),
		.io_wgt_rd_0_data_bits_13_5(compute_io_wgt_rd_0_data_bits_13_5),
		.io_wgt_rd_0_data_bits_13_6(compute_io_wgt_rd_0_data_bits_13_6),
		.io_wgt_rd_0_data_bits_13_7(compute_io_wgt_rd_0_data_bits_13_7),
		.io_wgt_rd_0_data_bits_13_8(compute_io_wgt_rd_0_data_bits_13_8),
		.io_wgt_rd_0_data_bits_13_9(compute_io_wgt_rd_0_data_bits_13_9),
		.io_wgt_rd_0_data_bits_13_10(compute_io_wgt_rd_0_data_bits_13_10),
		.io_wgt_rd_0_data_bits_13_11(compute_io_wgt_rd_0_data_bits_13_11),
		.io_wgt_rd_0_data_bits_13_12(compute_io_wgt_rd_0_data_bits_13_12),
		.io_wgt_rd_0_data_bits_13_13(compute_io_wgt_rd_0_data_bits_13_13),
		.io_wgt_rd_0_data_bits_13_14(compute_io_wgt_rd_0_data_bits_13_14),
		.io_wgt_rd_0_data_bits_13_15(compute_io_wgt_rd_0_data_bits_13_15),
		.io_wgt_rd_0_data_bits_14_0(compute_io_wgt_rd_0_data_bits_14_0),
		.io_wgt_rd_0_data_bits_14_1(compute_io_wgt_rd_0_data_bits_14_1),
		.io_wgt_rd_0_data_bits_14_2(compute_io_wgt_rd_0_data_bits_14_2),
		.io_wgt_rd_0_data_bits_14_3(compute_io_wgt_rd_0_data_bits_14_3),
		.io_wgt_rd_0_data_bits_14_4(compute_io_wgt_rd_0_data_bits_14_4),
		.io_wgt_rd_0_data_bits_14_5(compute_io_wgt_rd_0_data_bits_14_5),
		.io_wgt_rd_0_data_bits_14_6(compute_io_wgt_rd_0_data_bits_14_6),
		.io_wgt_rd_0_data_bits_14_7(compute_io_wgt_rd_0_data_bits_14_7),
		.io_wgt_rd_0_data_bits_14_8(compute_io_wgt_rd_0_data_bits_14_8),
		.io_wgt_rd_0_data_bits_14_9(compute_io_wgt_rd_0_data_bits_14_9),
		.io_wgt_rd_0_data_bits_14_10(compute_io_wgt_rd_0_data_bits_14_10),
		.io_wgt_rd_0_data_bits_14_11(compute_io_wgt_rd_0_data_bits_14_11),
		.io_wgt_rd_0_data_bits_14_12(compute_io_wgt_rd_0_data_bits_14_12),
		.io_wgt_rd_0_data_bits_14_13(compute_io_wgt_rd_0_data_bits_14_13),
		.io_wgt_rd_0_data_bits_14_14(compute_io_wgt_rd_0_data_bits_14_14),
		.io_wgt_rd_0_data_bits_14_15(compute_io_wgt_rd_0_data_bits_14_15),
		.io_wgt_rd_0_data_bits_15_0(compute_io_wgt_rd_0_data_bits_15_0),
		.io_wgt_rd_0_data_bits_15_1(compute_io_wgt_rd_0_data_bits_15_1),
		.io_wgt_rd_0_data_bits_15_2(compute_io_wgt_rd_0_data_bits_15_2),
		.io_wgt_rd_0_data_bits_15_3(compute_io_wgt_rd_0_data_bits_15_3),
		.io_wgt_rd_0_data_bits_15_4(compute_io_wgt_rd_0_data_bits_15_4),
		.io_wgt_rd_0_data_bits_15_5(compute_io_wgt_rd_0_data_bits_15_5),
		.io_wgt_rd_0_data_bits_15_6(compute_io_wgt_rd_0_data_bits_15_6),
		.io_wgt_rd_0_data_bits_15_7(compute_io_wgt_rd_0_data_bits_15_7),
		.io_wgt_rd_0_data_bits_15_8(compute_io_wgt_rd_0_data_bits_15_8),
		.io_wgt_rd_0_data_bits_15_9(compute_io_wgt_rd_0_data_bits_15_9),
		.io_wgt_rd_0_data_bits_15_10(compute_io_wgt_rd_0_data_bits_15_10),
		.io_wgt_rd_0_data_bits_15_11(compute_io_wgt_rd_0_data_bits_15_11),
		.io_wgt_rd_0_data_bits_15_12(compute_io_wgt_rd_0_data_bits_15_12),
		.io_wgt_rd_0_data_bits_15_13(compute_io_wgt_rd_0_data_bits_15_13),
		.io_wgt_rd_0_data_bits_15_14(compute_io_wgt_rd_0_data_bits_15_14),
		.io_wgt_rd_0_data_bits_15_15(compute_io_wgt_rd_0_data_bits_15_15),
		.io_out_wr_0_valid(compute_io_out_wr_0_valid),
		.io_out_wr_0_bits_idx(compute_io_out_wr_0_bits_idx),
		.io_out_wr_0_bits_data_0_0(compute_io_out_wr_0_bits_data_0_0),
		.io_out_wr_0_bits_data_0_1(compute_io_out_wr_0_bits_data_0_1),
		.io_out_wr_0_bits_data_0_2(compute_io_out_wr_0_bits_data_0_2),
		.io_out_wr_0_bits_data_0_3(compute_io_out_wr_0_bits_data_0_3),
		.io_out_wr_0_bits_data_0_4(compute_io_out_wr_0_bits_data_0_4),
		.io_out_wr_0_bits_data_0_5(compute_io_out_wr_0_bits_data_0_5),
		.io_out_wr_0_bits_data_0_6(compute_io_out_wr_0_bits_data_0_6),
		.io_out_wr_0_bits_data_0_7(compute_io_out_wr_0_bits_data_0_7),
		.io_out_wr_0_bits_data_0_8(compute_io_out_wr_0_bits_data_0_8),
		.io_out_wr_0_bits_data_0_9(compute_io_out_wr_0_bits_data_0_9),
		.io_out_wr_0_bits_data_0_10(compute_io_out_wr_0_bits_data_0_10),
		.io_out_wr_0_bits_data_0_11(compute_io_out_wr_0_bits_data_0_11),
		.io_out_wr_0_bits_data_0_12(compute_io_out_wr_0_bits_data_0_12),
		.io_out_wr_0_bits_data_0_13(compute_io_out_wr_0_bits_data_0_13),
		.io_out_wr_0_bits_data_0_14(compute_io_out_wr_0_bits_data_0_14),
		.io_out_wr_0_bits_data_0_15(compute_io_out_wr_0_bits_data_0_15),
		.io_finish(compute_io_finish),
		.io_acc_wr_event(compute_io_acc_wr_event)
	);
	Store store(
		.clk(store_clock),
		.rst(store_reset),
		.io_i_post(store_io_i_post),
		.io_o_post(store_io_o_post),
		.io_inst_ready(store_io_inst_ready),
		.io_inst_valid(store_io_inst_valid),
		.io_inst_bits(store_io_inst_bits),
		.io_out_baddr(store_io_out_baddr),
		.io_vme_wr_cmd_ready(store_io_vme_wr_cmd_ready),
		.io_vme_wr_cmd_valid(store_io_vme_wr_cmd_valid),
		.io_vme_wr_cmd_bits_addr(store_io_vme_wr_cmd_bits_addr),
		.io_vme_wr_cmd_bits_len(store_io_vme_wr_cmd_bits_len),
		.io_vme_wr_data_ready(store_io_vme_wr_data_ready),
		.io_vme_wr_data_valid(store_io_vme_wr_data_valid),
		.io_vme_wr_data_bits_data(store_io_vme_wr_data_bits_data),
		.io_vme_wr_ack(store_io_vme_wr_ack),
		.io_out_wr_0_valid(store_io_out_wr_0_valid),
		.io_out_wr_0_bits_idx(store_io_out_wr_0_bits_idx),
		.io_out_wr_0_bits_data_0_0(store_io_out_wr_0_bits_data_0_0),
		.io_out_wr_0_bits_data_0_1(store_io_out_wr_0_bits_data_0_1),
		.io_out_wr_0_bits_data_0_2(store_io_out_wr_0_bits_data_0_2),
		.io_out_wr_0_bits_data_0_3(store_io_out_wr_0_bits_data_0_3),
		.io_out_wr_0_bits_data_0_4(store_io_out_wr_0_bits_data_0_4),
		.io_out_wr_0_bits_data_0_5(store_io_out_wr_0_bits_data_0_5),
		.io_out_wr_0_bits_data_0_6(store_io_out_wr_0_bits_data_0_6),
		.io_out_wr_0_bits_data_0_7(store_io_out_wr_0_bits_data_0_7),
		.io_out_wr_0_bits_data_0_8(store_io_out_wr_0_bits_data_0_8),
		.io_out_wr_0_bits_data_0_9(store_io_out_wr_0_bits_data_0_9),
		.io_out_wr_0_bits_data_0_10(store_io_out_wr_0_bits_data_0_10),
		.io_out_wr_0_bits_data_0_11(store_io_out_wr_0_bits_data_0_11),
		.io_out_wr_0_bits_data_0_12(store_io_out_wr_0_bits_data_0_12),
		.io_out_wr_0_bits_data_0_13(store_io_out_wr_0_bits_data_0_13),
		.io_out_wr_0_bits_data_0_14(store_io_out_wr_0_bits_data_0_14),
		.io_out_wr_0_bits_data_0_15(store_io_out_wr_0_bits_data_0_15)
	);
	EventCounters ecounters(
		.clk(ecounters_clock),
		.rst(ecounters_reset),
		.io_launch(ecounters_io_launch),
		.io_finish(ecounters_io_finish),
		.io_ecnt_0_valid(ecounters_io_ecnt_0_valid),
		.io_ecnt_0_bits(ecounters_io_ecnt_0_bits),
		.io_ucnt_0_valid(ecounters_io_ucnt_0_valid),
		.io_ucnt_0_bits(ecounters_io_ucnt_0_bits),
		.io_acc_wr_event(ecounters_io_acc_wr_event)
	);
	assign io_vcr_finish = finish;
	assign io_vcr_ecnt_0_valid = ecounters_io_ecnt_0_valid;
	assign io_vcr_ecnt_0_bits = ecounters_io_ecnt_0_bits;
	assign io_vcr_ucnt_0_valid = ecounters_io_ucnt_0_valid;
	assign io_vcr_ucnt_0_bits = ecounters_io_ucnt_0_bits;
	assign io_vme_rd_0_cmd_valid = fetch_io_vme_rd_cmd_valid;
	assign io_vme_rd_0_cmd_bits_addr = fetch_io_vme_rd_cmd_bits_addr;
	assign io_vme_rd_0_cmd_bits_len = fetch_io_vme_rd_cmd_bits_len;
	assign io_vme_rd_0_data_ready = fetch_io_vme_rd_data_ready;
	assign io_vme_rd_1_cmd_valid = compute_io_vme_rd_0_cmd_valid;
	assign io_vme_rd_1_cmd_bits_addr = compute_io_vme_rd_0_cmd_bits_addr;
	assign io_vme_rd_1_cmd_bits_len = compute_io_vme_rd_0_cmd_bits_len;
	assign io_vme_rd_1_cmd_bits_tag = compute_io_vme_rd_0_cmd_bits_tag;
	assign io_vme_rd_2_cmd_valid = load_io_vme_rd_0_cmd_valid;
	assign io_vme_rd_2_cmd_bits_addr = load_io_vme_rd_0_cmd_bits_addr;
	assign io_vme_rd_2_cmd_bits_len = load_io_vme_rd_0_cmd_bits_len;
	assign io_vme_rd_2_cmd_bits_tag = load_io_vme_rd_0_cmd_bits_tag;
	assign io_vme_rd_3_cmd_valid = load_io_vme_rd_1_cmd_valid;
	assign io_vme_rd_3_cmd_bits_addr = load_io_vme_rd_1_cmd_bits_addr;
	assign io_vme_rd_3_cmd_bits_len = load_io_vme_rd_1_cmd_bits_len;
	assign io_vme_rd_3_cmd_bits_tag = load_io_vme_rd_1_cmd_bits_tag;
	assign io_vme_rd_4_cmd_valid = compute_io_vme_rd_1_cmd_valid;
	assign io_vme_rd_4_cmd_bits_addr = compute_io_vme_rd_1_cmd_bits_addr;
	assign io_vme_rd_4_cmd_bits_len = compute_io_vme_rd_1_cmd_bits_len;
	assign io_vme_rd_4_cmd_bits_tag = compute_io_vme_rd_1_cmd_bits_tag;
	assign io_vme_wr_0_cmd_valid = store_io_vme_wr_cmd_valid;
	assign io_vme_wr_0_cmd_bits_addr = store_io_vme_wr_cmd_bits_addr;
	assign io_vme_wr_0_cmd_bits_len = store_io_vme_wr_cmd_bits_len;
	assign io_vme_wr_0_data_valid = store_io_vme_wr_data_valid;
	assign io_vme_wr_0_data_bits_data = store_io_vme_wr_data_bits_data;
	assign fetch_clock = clk;
	assign fetch_reset = rst;
	assign fetch_io_launch = io_vcr_launch;
	assign fetch_io_ins_baddr = io_vcr_ptrs_0;
	assign fetch_io_ins_count = io_vcr_vals_0;
	assign fetch_io_vme_rd_cmd_ready = io_vme_rd_0_cmd_ready;
	assign fetch_io_vme_rd_data_valid = io_vme_rd_0_data_valid;
	assign fetch_io_vme_rd_data_bits_data = io_vme_rd_0_data_bits_data;
	assign fetch_io_inst_ld_ready = load_io_inst_ready;
	assign fetch_io_inst_co_ready = compute_io_inst_ready;
	assign fetch_io_inst_st_ready = store_io_inst_ready;
	assign load_clock = clk;
	assign load_reset = rst;
	assign load_io_i_post = compute_io_o_post_0;
	assign load_io_inst_valid = fetch_io_inst_ld_valid;
	assign load_io_inst_bits = fetch_io_inst_ld_bits;
	assign load_io_inp_baddr = io_vcr_ptrs_2;
	assign load_io_wgt_baddr = io_vcr_ptrs_3;
	assign load_io_vme_rd_0_cmd_ready = io_vme_rd_2_cmd_ready;
	assign load_io_vme_rd_0_data_valid = io_vme_rd_2_data_valid;
	assign load_io_vme_rd_0_data_bits_data = io_vme_rd_2_data_bits_data;
	assign load_io_vme_rd_0_data_bits_tag = io_vme_rd_2_data_bits_tag;
	assign load_io_vme_rd_1_cmd_ready = io_vme_rd_3_cmd_ready;
	assign load_io_vme_rd_1_data_valid = io_vme_rd_3_data_valid;
	assign load_io_vme_rd_1_data_bits_data = io_vme_rd_3_data_bits_data;
	assign load_io_vme_rd_1_data_bits_tag = io_vme_rd_3_data_bits_tag;
	assign load_io_inp_rd_0_idx_valid = compute_io_inp_rd_0_idx_valid;
	assign load_io_inp_rd_0_idx_bits = compute_io_inp_rd_0_idx_bits;
	assign load_io_wgt_rd_0_idx_valid = compute_io_wgt_rd_0_idx_valid;
	assign load_io_wgt_rd_0_idx_bits = compute_io_wgt_rd_0_idx_bits;
	assign compute_clock = clk;
	assign compute_reset = rst;
	assign compute_io_i_post_0 = load_io_o_post;
	assign compute_io_i_post_1 = store_io_o_post;
	assign compute_io_inst_valid = fetch_io_inst_co_valid;
	assign compute_io_inst_bits = fetch_io_inst_co_bits;
	assign compute_io_uop_baddr = io_vcr_ptrs_1;
	assign compute_io_acc_baddr = io_vcr_ptrs_4;
	assign compute_io_vme_rd_0_cmd_ready = io_vme_rd_1_cmd_ready;
	assign compute_io_vme_rd_0_data_valid = io_vme_rd_1_data_valid;
	assign compute_io_vme_rd_0_data_bits_data = io_vme_rd_1_data_bits_data;
	assign compute_io_vme_rd_0_data_bits_tag = io_vme_rd_1_data_bits_tag;
	assign compute_io_vme_rd_0_data_bits_last = io_vme_rd_1_data_bits_last;
	assign compute_io_vme_rd_1_cmd_ready = io_vme_rd_4_cmd_ready;
	assign compute_io_vme_rd_1_data_valid = io_vme_rd_4_data_valid;
	assign compute_io_vme_rd_1_data_bits_data = io_vme_rd_4_data_bits_data;
	assign compute_io_vme_rd_1_data_bits_tag = io_vme_rd_4_data_bits_tag;
	assign compute_io_inp_rd_0_data_valid = load_io_inp_rd_0_data_valid;
	assign compute_io_inp_rd_0_data_bits_0_0 = load_io_inp_rd_0_data_bits_0_0;
	assign compute_io_inp_rd_0_data_bits_0_1 = load_io_inp_rd_0_data_bits_0_1;
	assign compute_io_inp_rd_0_data_bits_0_2 = load_io_inp_rd_0_data_bits_0_2;
	assign compute_io_inp_rd_0_data_bits_0_3 = load_io_inp_rd_0_data_bits_0_3;
	assign compute_io_inp_rd_0_data_bits_0_4 = load_io_inp_rd_0_data_bits_0_4;
	assign compute_io_inp_rd_0_data_bits_0_5 = load_io_inp_rd_0_data_bits_0_5;
	assign compute_io_inp_rd_0_data_bits_0_6 = load_io_inp_rd_0_data_bits_0_6;
	assign compute_io_inp_rd_0_data_bits_0_7 = load_io_inp_rd_0_data_bits_0_7;
	assign compute_io_inp_rd_0_data_bits_0_8 = load_io_inp_rd_0_data_bits_0_8;
	assign compute_io_inp_rd_0_data_bits_0_9 = load_io_inp_rd_0_data_bits_0_9;
	assign compute_io_inp_rd_0_data_bits_0_10 = load_io_inp_rd_0_data_bits_0_10;
	assign compute_io_inp_rd_0_data_bits_0_11 = load_io_inp_rd_0_data_bits_0_11;
	assign compute_io_inp_rd_0_data_bits_0_12 = load_io_inp_rd_0_data_bits_0_12;
	assign compute_io_inp_rd_0_data_bits_0_13 = load_io_inp_rd_0_data_bits_0_13;
	assign compute_io_inp_rd_0_data_bits_0_14 = load_io_inp_rd_0_data_bits_0_14;
	assign compute_io_inp_rd_0_data_bits_0_15 = load_io_inp_rd_0_data_bits_0_15;
	assign compute_io_wgt_rd_0_data_valid = load_io_wgt_rd_0_data_valid;
	assign compute_io_wgt_rd_0_data_bits_0_0 = load_io_wgt_rd_0_data_bits_0_0;
	assign compute_io_wgt_rd_0_data_bits_0_1 = load_io_wgt_rd_0_data_bits_0_1;
	assign compute_io_wgt_rd_0_data_bits_0_2 = load_io_wgt_rd_0_data_bits_0_2;
	assign compute_io_wgt_rd_0_data_bits_0_3 = load_io_wgt_rd_0_data_bits_0_3;
	assign compute_io_wgt_rd_0_data_bits_0_4 = load_io_wgt_rd_0_data_bits_0_4;
	assign compute_io_wgt_rd_0_data_bits_0_5 = load_io_wgt_rd_0_data_bits_0_5;
	assign compute_io_wgt_rd_0_data_bits_0_6 = load_io_wgt_rd_0_data_bits_0_6;
	assign compute_io_wgt_rd_0_data_bits_0_7 = load_io_wgt_rd_0_data_bits_0_7;
	assign compute_io_wgt_rd_0_data_bits_0_8 = load_io_wgt_rd_0_data_bits_0_8;
	assign compute_io_wgt_rd_0_data_bits_0_9 = load_io_wgt_rd_0_data_bits_0_9;
	assign compute_io_wgt_rd_0_data_bits_0_10 = load_io_wgt_rd_0_data_bits_0_10;
	assign compute_io_wgt_rd_0_data_bits_0_11 = load_io_wgt_rd_0_data_bits_0_11;
	assign compute_io_wgt_rd_0_data_bits_0_12 = load_io_wgt_rd_0_data_bits_0_12;
	assign compute_io_wgt_rd_0_data_bits_0_13 = load_io_wgt_rd_0_data_bits_0_13;
	assign compute_io_wgt_rd_0_data_bits_0_14 = load_io_wgt_rd_0_data_bits_0_14;
	assign compute_io_wgt_rd_0_data_bits_0_15 = load_io_wgt_rd_0_data_bits_0_15;
	assign compute_io_wgt_rd_0_data_bits_1_0 = load_io_wgt_rd_0_data_bits_1_0;
	assign compute_io_wgt_rd_0_data_bits_1_1 = load_io_wgt_rd_0_data_bits_1_1;
	assign compute_io_wgt_rd_0_data_bits_1_2 = load_io_wgt_rd_0_data_bits_1_2;
	assign compute_io_wgt_rd_0_data_bits_1_3 = load_io_wgt_rd_0_data_bits_1_3;
	assign compute_io_wgt_rd_0_data_bits_1_4 = load_io_wgt_rd_0_data_bits_1_4;
	assign compute_io_wgt_rd_0_data_bits_1_5 = load_io_wgt_rd_0_data_bits_1_5;
	assign compute_io_wgt_rd_0_data_bits_1_6 = load_io_wgt_rd_0_data_bits_1_6;
	assign compute_io_wgt_rd_0_data_bits_1_7 = load_io_wgt_rd_0_data_bits_1_7;
	assign compute_io_wgt_rd_0_data_bits_1_8 = load_io_wgt_rd_0_data_bits_1_8;
	assign compute_io_wgt_rd_0_data_bits_1_9 = load_io_wgt_rd_0_data_bits_1_9;
	assign compute_io_wgt_rd_0_data_bits_1_10 = load_io_wgt_rd_0_data_bits_1_10;
	assign compute_io_wgt_rd_0_data_bits_1_11 = load_io_wgt_rd_0_data_bits_1_11;
	assign compute_io_wgt_rd_0_data_bits_1_12 = load_io_wgt_rd_0_data_bits_1_12;
	assign compute_io_wgt_rd_0_data_bits_1_13 = load_io_wgt_rd_0_data_bits_1_13;
	assign compute_io_wgt_rd_0_data_bits_1_14 = load_io_wgt_rd_0_data_bits_1_14;
	assign compute_io_wgt_rd_0_data_bits_1_15 = load_io_wgt_rd_0_data_bits_1_15;
	assign compute_io_wgt_rd_0_data_bits_2_0 = load_io_wgt_rd_0_data_bits_2_0;
	assign compute_io_wgt_rd_0_data_bits_2_1 = load_io_wgt_rd_0_data_bits_2_1;
	assign compute_io_wgt_rd_0_data_bits_2_2 = load_io_wgt_rd_0_data_bits_2_2;
	assign compute_io_wgt_rd_0_data_bits_2_3 = load_io_wgt_rd_0_data_bits_2_3;
	assign compute_io_wgt_rd_0_data_bits_2_4 = load_io_wgt_rd_0_data_bits_2_4;
	assign compute_io_wgt_rd_0_data_bits_2_5 = load_io_wgt_rd_0_data_bits_2_5;
	assign compute_io_wgt_rd_0_data_bits_2_6 = load_io_wgt_rd_0_data_bits_2_6;
	assign compute_io_wgt_rd_0_data_bits_2_7 = load_io_wgt_rd_0_data_bits_2_7;
	assign compute_io_wgt_rd_0_data_bits_2_8 = load_io_wgt_rd_0_data_bits_2_8;
	assign compute_io_wgt_rd_0_data_bits_2_9 = load_io_wgt_rd_0_data_bits_2_9;
	assign compute_io_wgt_rd_0_data_bits_2_10 = load_io_wgt_rd_0_data_bits_2_10;
	assign compute_io_wgt_rd_0_data_bits_2_11 = load_io_wgt_rd_0_data_bits_2_11;
	assign compute_io_wgt_rd_0_data_bits_2_12 = load_io_wgt_rd_0_data_bits_2_12;
	assign compute_io_wgt_rd_0_data_bits_2_13 = load_io_wgt_rd_0_data_bits_2_13;
	assign compute_io_wgt_rd_0_data_bits_2_14 = load_io_wgt_rd_0_data_bits_2_14;
	assign compute_io_wgt_rd_0_data_bits_2_15 = load_io_wgt_rd_0_data_bits_2_15;
	assign compute_io_wgt_rd_0_data_bits_3_0 = load_io_wgt_rd_0_data_bits_3_0;
	assign compute_io_wgt_rd_0_data_bits_3_1 = load_io_wgt_rd_0_data_bits_3_1;
	assign compute_io_wgt_rd_0_data_bits_3_2 = load_io_wgt_rd_0_data_bits_3_2;
	assign compute_io_wgt_rd_0_data_bits_3_3 = load_io_wgt_rd_0_data_bits_3_3;
	assign compute_io_wgt_rd_0_data_bits_3_4 = load_io_wgt_rd_0_data_bits_3_4;
	assign compute_io_wgt_rd_0_data_bits_3_5 = load_io_wgt_rd_0_data_bits_3_5;
	assign compute_io_wgt_rd_0_data_bits_3_6 = load_io_wgt_rd_0_data_bits_3_6;
	assign compute_io_wgt_rd_0_data_bits_3_7 = load_io_wgt_rd_0_data_bits_3_7;
	assign compute_io_wgt_rd_0_data_bits_3_8 = load_io_wgt_rd_0_data_bits_3_8;
	assign compute_io_wgt_rd_0_data_bits_3_9 = load_io_wgt_rd_0_data_bits_3_9;
	assign compute_io_wgt_rd_0_data_bits_3_10 = load_io_wgt_rd_0_data_bits_3_10;
	assign compute_io_wgt_rd_0_data_bits_3_11 = load_io_wgt_rd_0_data_bits_3_11;
	assign compute_io_wgt_rd_0_data_bits_3_12 = load_io_wgt_rd_0_data_bits_3_12;
	assign compute_io_wgt_rd_0_data_bits_3_13 = load_io_wgt_rd_0_data_bits_3_13;
	assign compute_io_wgt_rd_0_data_bits_3_14 = load_io_wgt_rd_0_data_bits_3_14;
	assign compute_io_wgt_rd_0_data_bits_3_15 = load_io_wgt_rd_0_data_bits_3_15;
	assign compute_io_wgt_rd_0_data_bits_4_0 = load_io_wgt_rd_0_data_bits_4_0;
	assign compute_io_wgt_rd_0_data_bits_4_1 = load_io_wgt_rd_0_data_bits_4_1;
	assign compute_io_wgt_rd_0_data_bits_4_2 = load_io_wgt_rd_0_data_bits_4_2;
	assign compute_io_wgt_rd_0_data_bits_4_3 = load_io_wgt_rd_0_data_bits_4_3;
	assign compute_io_wgt_rd_0_data_bits_4_4 = load_io_wgt_rd_0_data_bits_4_4;
	assign compute_io_wgt_rd_0_data_bits_4_5 = load_io_wgt_rd_0_data_bits_4_5;
	assign compute_io_wgt_rd_0_data_bits_4_6 = load_io_wgt_rd_0_data_bits_4_6;
	assign compute_io_wgt_rd_0_data_bits_4_7 = load_io_wgt_rd_0_data_bits_4_7;
	assign compute_io_wgt_rd_0_data_bits_4_8 = load_io_wgt_rd_0_data_bits_4_8;
	assign compute_io_wgt_rd_0_data_bits_4_9 = load_io_wgt_rd_0_data_bits_4_9;
	assign compute_io_wgt_rd_0_data_bits_4_10 = load_io_wgt_rd_0_data_bits_4_10;
	assign compute_io_wgt_rd_0_data_bits_4_11 = load_io_wgt_rd_0_data_bits_4_11;
	assign compute_io_wgt_rd_0_data_bits_4_12 = load_io_wgt_rd_0_data_bits_4_12;
	assign compute_io_wgt_rd_0_data_bits_4_13 = load_io_wgt_rd_0_data_bits_4_13;
	assign compute_io_wgt_rd_0_data_bits_4_14 = load_io_wgt_rd_0_data_bits_4_14;
	assign compute_io_wgt_rd_0_data_bits_4_15 = load_io_wgt_rd_0_data_bits_4_15;
	assign compute_io_wgt_rd_0_data_bits_5_0 = load_io_wgt_rd_0_data_bits_5_0;
	assign compute_io_wgt_rd_0_data_bits_5_1 = load_io_wgt_rd_0_data_bits_5_1;
	assign compute_io_wgt_rd_0_data_bits_5_2 = load_io_wgt_rd_0_data_bits_5_2;
	assign compute_io_wgt_rd_0_data_bits_5_3 = load_io_wgt_rd_0_data_bits_5_3;
	assign compute_io_wgt_rd_0_data_bits_5_4 = load_io_wgt_rd_0_data_bits_5_4;
	assign compute_io_wgt_rd_0_data_bits_5_5 = load_io_wgt_rd_0_data_bits_5_5;
	assign compute_io_wgt_rd_0_data_bits_5_6 = load_io_wgt_rd_0_data_bits_5_6;
	assign compute_io_wgt_rd_0_data_bits_5_7 = load_io_wgt_rd_0_data_bits_5_7;
	assign compute_io_wgt_rd_0_data_bits_5_8 = load_io_wgt_rd_0_data_bits_5_8;
	assign compute_io_wgt_rd_0_data_bits_5_9 = load_io_wgt_rd_0_data_bits_5_9;
	assign compute_io_wgt_rd_0_data_bits_5_10 = load_io_wgt_rd_0_data_bits_5_10;
	assign compute_io_wgt_rd_0_data_bits_5_11 = load_io_wgt_rd_0_data_bits_5_11;
	assign compute_io_wgt_rd_0_data_bits_5_12 = load_io_wgt_rd_0_data_bits_5_12;
	assign compute_io_wgt_rd_0_data_bits_5_13 = load_io_wgt_rd_0_data_bits_5_13;
	assign compute_io_wgt_rd_0_data_bits_5_14 = load_io_wgt_rd_0_data_bits_5_14;
	assign compute_io_wgt_rd_0_data_bits_5_15 = load_io_wgt_rd_0_data_bits_5_15;
	assign compute_io_wgt_rd_0_data_bits_6_0 = load_io_wgt_rd_0_data_bits_6_0;
	assign compute_io_wgt_rd_0_data_bits_6_1 = load_io_wgt_rd_0_data_bits_6_1;
	assign compute_io_wgt_rd_0_data_bits_6_2 = load_io_wgt_rd_0_data_bits_6_2;
	assign compute_io_wgt_rd_0_data_bits_6_3 = load_io_wgt_rd_0_data_bits_6_3;
	assign compute_io_wgt_rd_0_data_bits_6_4 = load_io_wgt_rd_0_data_bits_6_4;
	assign compute_io_wgt_rd_0_data_bits_6_5 = load_io_wgt_rd_0_data_bits_6_5;
	assign compute_io_wgt_rd_0_data_bits_6_6 = load_io_wgt_rd_0_data_bits_6_6;
	assign compute_io_wgt_rd_0_data_bits_6_7 = load_io_wgt_rd_0_data_bits_6_7;
	assign compute_io_wgt_rd_0_data_bits_6_8 = load_io_wgt_rd_0_data_bits_6_8;
	assign compute_io_wgt_rd_0_data_bits_6_9 = load_io_wgt_rd_0_data_bits_6_9;
	assign compute_io_wgt_rd_0_data_bits_6_10 = load_io_wgt_rd_0_data_bits_6_10;
	assign compute_io_wgt_rd_0_data_bits_6_11 = load_io_wgt_rd_0_data_bits_6_11;
	assign compute_io_wgt_rd_0_data_bits_6_12 = load_io_wgt_rd_0_data_bits_6_12;
	assign compute_io_wgt_rd_0_data_bits_6_13 = load_io_wgt_rd_0_data_bits_6_13;
	assign compute_io_wgt_rd_0_data_bits_6_14 = load_io_wgt_rd_0_data_bits_6_14;
	assign compute_io_wgt_rd_0_data_bits_6_15 = load_io_wgt_rd_0_data_bits_6_15;
	assign compute_io_wgt_rd_0_data_bits_7_0 = load_io_wgt_rd_0_data_bits_7_0;
	assign compute_io_wgt_rd_0_data_bits_7_1 = load_io_wgt_rd_0_data_bits_7_1;
	assign compute_io_wgt_rd_0_data_bits_7_2 = load_io_wgt_rd_0_data_bits_7_2;
	assign compute_io_wgt_rd_0_data_bits_7_3 = load_io_wgt_rd_0_data_bits_7_3;
	assign compute_io_wgt_rd_0_data_bits_7_4 = load_io_wgt_rd_0_data_bits_7_4;
	assign compute_io_wgt_rd_0_data_bits_7_5 = load_io_wgt_rd_0_data_bits_7_5;
	assign compute_io_wgt_rd_0_data_bits_7_6 = load_io_wgt_rd_0_data_bits_7_6;
	assign compute_io_wgt_rd_0_data_bits_7_7 = load_io_wgt_rd_0_data_bits_7_7;
	assign compute_io_wgt_rd_0_data_bits_7_8 = load_io_wgt_rd_0_data_bits_7_8;
	assign compute_io_wgt_rd_0_data_bits_7_9 = load_io_wgt_rd_0_data_bits_7_9;
	assign compute_io_wgt_rd_0_data_bits_7_10 = load_io_wgt_rd_0_data_bits_7_10;
	assign compute_io_wgt_rd_0_data_bits_7_11 = load_io_wgt_rd_0_data_bits_7_11;
	assign compute_io_wgt_rd_0_data_bits_7_12 = load_io_wgt_rd_0_data_bits_7_12;
	assign compute_io_wgt_rd_0_data_bits_7_13 = load_io_wgt_rd_0_data_bits_7_13;
	assign compute_io_wgt_rd_0_data_bits_7_14 = load_io_wgt_rd_0_data_bits_7_14;
	assign compute_io_wgt_rd_0_data_bits_7_15 = load_io_wgt_rd_0_data_bits_7_15;
	assign compute_io_wgt_rd_0_data_bits_8_0 = load_io_wgt_rd_0_data_bits_8_0;
	assign compute_io_wgt_rd_0_data_bits_8_1 = load_io_wgt_rd_0_data_bits_8_1;
	assign compute_io_wgt_rd_0_data_bits_8_2 = load_io_wgt_rd_0_data_bits_8_2;
	assign compute_io_wgt_rd_0_data_bits_8_3 = load_io_wgt_rd_0_data_bits_8_3;
	assign compute_io_wgt_rd_0_data_bits_8_4 = load_io_wgt_rd_0_data_bits_8_4;
	assign compute_io_wgt_rd_0_data_bits_8_5 = load_io_wgt_rd_0_data_bits_8_5;
	assign compute_io_wgt_rd_0_data_bits_8_6 = load_io_wgt_rd_0_data_bits_8_6;
	assign compute_io_wgt_rd_0_data_bits_8_7 = load_io_wgt_rd_0_data_bits_8_7;
	assign compute_io_wgt_rd_0_data_bits_8_8 = load_io_wgt_rd_0_data_bits_8_8;
	assign compute_io_wgt_rd_0_data_bits_8_9 = load_io_wgt_rd_0_data_bits_8_9;
	assign compute_io_wgt_rd_0_data_bits_8_10 = load_io_wgt_rd_0_data_bits_8_10;
	assign compute_io_wgt_rd_0_data_bits_8_11 = load_io_wgt_rd_0_data_bits_8_11;
	assign compute_io_wgt_rd_0_data_bits_8_12 = load_io_wgt_rd_0_data_bits_8_12;
	assign compute_io_wgt_rd_0_data_bits_8_13 = load_io_wgt_rd_0_data_bits_8_13;
	assign compute_io_wgt_rd_0_data_bits_8_14 = load_io_wgt_rd_0_data_bits_8_14;
	assign compute_io_wgt_rd_0_data_bits_8_15 = load_io_wgt_rd_0_data_bits_8_15;
	assign compute_io_wgt_rd_0_data_bits_9_0 = load_io_wgt_rd_0_data_bits_9_0;
	assign compute_io_wgt_rd_0_data_bits_9_1 = load_io_wgt_rd_0_data_bits_9_1;
	assign compute_io_wgt_rd_0_data_bits_9_2 = load_io_wgt_rd_0_data_bits_9_2;
	assign compute_io_wgt_rd_0_data_bits_9_3 = load_io_wgt_rd_0_data_bits_9_3;
	assign compute_io_wgt_rd_0_data_bits_9_4 = load_io_wgt_rd_0_data_bits_9_4;
	assign compute_io_wgt_rd_0_data_bits_9_5 = load_io_wgt_rd_0_data_bits_9_5;
	assign compute_io_wgt_rd_0_data_bits_9_6 = load_io_wgt_rd_0_data_bits_9_6;
	assign compute_io_wgt_rd_0_data_bits_9_7 = load_io_wgt_rd_0_data_bits_9_7;
	assign compute_io_wgt_rd_0_data_bits_9_8 = load_io_wgt_rd_0_data_bits_9_8;
	assign compute_io_wgt_rd_0_data_bits_9_9 = load_io_wgt_rd_0_data_bits_9_9;
	assign compute_io_wgt_rd_0_data_bits_9_10 = load_io_wgt_rd_0_data_bits_9_10;
	assign compute_io_wgt_rd_0_data_bits_9_11 = load_io_wgt_rd_0_data_bits_9_11;
	assign compute_io_wgt_rd_0_data_bits_9_12 = load_io_wgt_rd_0_data_bits_9_12;
	assign compute_io_wgt_rd_0_data_bits_9_13 = load_io_wgt_rd_0_data_bits_9_13;
	assign compute_io_wgt_rd_0_data_bits_9_14 = load_io_wgt_rd_0_data_bits_9_14;
	assign compute_io_wgt_rd_0_data_bits_9_15 = load_io_wgt_rd_0_data_bits_9_15;
	assign compute_io_wgt_rd_0_data_bits_10_0 = load_io_wgt_rd_0_data_bits_10_0;
	assign compute_io_wgt_rd_0_data_bits_10_1 = load_io_wgt_rd_0_data_bits_10_1;
	assign compute_io_wgt_rd_0_data_bits_10_2 = load_io_wgt_rd_0_data_bits_10_2;
	assign compute_io_wgt_rd_0_data_bits_10_3 = load_io_wgt_rd_0_data_bits_10_3;
	assign compute_io_wgt_rd_0_data_bits_10_4 = load_io_wgt_rd_0_data_bits_10_4;
	assign compute_io_wgt_rd_0_data_bits_10_5 = load_io_wgt_rd_0_data_bits_10_5;
	assign compute_io_wgt_rd_0_data_bits_10_6 = load_io_wgt_rd_0_data_bits_10_6;
	assign compute_io_wgt_rd_0_data_bits_10_7 = load_io_wgt_rd_0_data_bits_10_7;
	assign compute_io_wgt_rd_0_data_bits_10_8 = load_io_wgt_rd_0_data_bits_10_8;
	assign compute_io_wgt_rd_0_data_bits_10_9 = load_io_wgt_rd_0_data_bits_10_9;
	assign compute_io_wgt_rd_0_data_bits_10_10 = load_io_wgt_rd_0_data_bits_10_10;
	assign compute_io_wgt_rd_0_data_bits_10_11 = load_io_wgt_rd_0_data_bits_10_11;
	assign compute_io_wgt_rd_0_data_bits_10_12 = load_io_wgt_rd_0_data_bits_10_12;
	assign compute_io_wgt_rd_0_data_bits_10_13 = load_io_wgt_rd_0_data_bits_10_13;
	assign compute_io_wgt_rd_0_data_bits_10_14 = load_io_wgt_rd_0_data_bits_10_14;
	assign compute_io_wgt_rd_0_data_bits_10_15 = load_io_wgt_rd_0_data_bits_10_15;
	assign compute_io_wgt_rd_0_data_bits_11_0 = load_io_wgt_rd_0_data_bits_11_0;
	assign compute_io_wgt_rd_0_data_bits_11_1 = load_io_wgt_rd_0_data_bits_11_1;
	assign compute_io_wgt_rd_0_data_bits_11_2 = load_io_wgt_rd_0_data_bits_11_2;
	assign compute_io_wgt_rd_0_data_bits_11_3 = load_io_wgt_rd_0_data_bits_11_3;
	assign compute_io_wgt_rd_0_data_bits_11_4 = load_io_wgt_rd_0_data_bits_11_4;
	assign compute_io_wgt_rd_0_data_bits_11_5 = load_io_wgt_rd_0_data_bits_11_5;
	assign compute_io_wgt_rd_0_data_bits_11_6 = load_io_wgt_rd_0_data_bits_11_6;
	assign compute_io_wgt_rd_0_data_bits_11_7 = load_io_wgt_rd_0_data_bits_11_7;
	assign compute_io_wgt_rd_0_data_bits_11_8 = load_io_wgt_rd_0_data_bits_11_8;
	assign compute_io_wgt_rd_0_data_bits_11_9 = load_io_wgt_rd_0_data_bits_11_9;
	assign compute_io_wgt_rd_0_data_bits_11_10 = load_io_wgt_rd_0_data_bits_11_10;
	assign compute_io_wgt_rd_0_data_bits_11_11 = load_io_wgt_rd_0_data_bits_11_11;
	assign compute_io_wgt_rd_0_data_bits_11_12 = load_io_wgt_rd_0_data_bits_11_12;
	assign compute_io_wgt_rd_0_data_bits_11_13 = load_io_wgt_rd_0_data_bits_11_13;
	assign compute_io_wgt_rd_0_data_bits_11_14 = load_io_wgt_rd_0_data_bits_11_14;
	assign compute_io_wgt_rd_0_data_bits_11_15 = load_io_wgt_rd_0_data_bits_11_15;
	assign compute_io_wgt_rd_0_data_bits_12_0 = load_io_wgt_rd_0_data_bits_12_0;
	assign compute_io_wgt_rd_0_data_bits_12_1 = load_io_wgt_rd_0_data_bits_12_1;
	assign compute_io_wgt_rd_0_data_bits_12_2 = load_io_wgt_rd_0_data_bits_12_2;
	assign compute_io_wgt_rd_0_data_bits_12_3 = load_io_wgt_rd_0_data_bits_12_3;
	assign compute_io_wgt_rd_0_data_bits_12_4 = load_io_wgt_rd_0_data_bits_12_4;
	assign compute_io_wgt_rd_0_data_bits_12_5 = load_io_wgt_rd_0_data_bits_12_5;
	assign compute_io_wgt_rd_0_data_bits_12_6 = load_io_wgt_rd_0_data_bits_12_6;
	assign compute_io_wgt_rd_0_data_bits_12_7 = load_io_wgt_rd_0_data_bits_12_7;
	assign compute_io_wgt_rd_0_data_bits_12_8 = load_io_wgt_rd_0_data_bits_12_8;
	assign compute_io_wgt_rd_0_data_bits_12_9 = load_io_wgt_rd_0_data_bits_12_9;
	assign compute_io_wgt_rd_0_data_bits_12_10 = load_io_wgt_rd_0_data_bits_12_10;
	assign compute_io_wgt_rd_0_data_bits_12_11 = load_io_wgt_rd_0_data_bits_12_11;
	assign compute_io_wgt_rd_0_data_bits_12_12 = load_io_wgt_rd_0_data_bits_12_12;
	assign compute_io_wgt_rd_0_data_bits_12_13 = load_io_wgt_rd_0_data_bits_12_13;
	assign compute_io_wgt_rd_0_data_bits_12_14 = load_io_wgt_rd_0_data_bits_12_14;
	assign compute_io_wgt_rd_0_data_bits_12_15 = load_io_wgt_rd_0_data_bits_12_15;
	assign compute_io_wgt_rd_0_data_bits_13_0 = load_io_wgt_rd_0_data_bits_13_0;
	assign compute_io_wgt_rd_0_data_bits_13_1 = load_io_wgt_rd_0_data_bits_13_1;
	assign compute_io_wgt_rd_0_data_bits_13_2 = load_io_wgt_rd_0_data_bits_13_2;
	assign compute_io_wgt_rd_0_data_bits_13_3 = load_io_wgt_rd_0_data_bits_13_3;
	assign compute_io_wgt_rd_0_data_bits_13_4 = load_io_wgt_rd_0_data_bits_13_4;
	assign compute_io_wgt_rd_0_data_bits_13_5 = load_io_wgt_rd_0_data_bits_13_5;
	assign compute_io_wgt_rd_0_data_bits_13_6 = load_io_wgt_rd_0_data_bits_13_6;
	assign compute_io_wgt_rd_0_data_bits_13_7 = load_io_wgt_rd_0_data_bits_13_7;
	assign compute_io_wgt_rd_0_data_bits_13_8 = load_io_wgt_rd_0_data_bits_13_8;
	assign compute_io_wgt_rd_0_data_bits_13_9 = load_io_wgt_rd_0_data_bits_13_9;
	assign compute_io_wgt_rd_0_data_bits_13_10 = load_io_wgt_rd_0_data_bits_13_10;
	assign compute_io_wgt_rd_0_data_bits_13_11 = load_io_wgt_rd_0_data_bits_13_11;
	assign compute_io_wgt_rd_0_data_bits_13_12 = load_io_wgt_rd_0_data_bits_13_12;
	assign compute_io_wgt_rd_0_data_bits_13_13 = load_io_wgt_rd_0_data_bits_13_13;
	assign compute_io_wgt_rd_0_data_bits_13_14 = load_io_wgt_rd_0_data_bits_13_14;
	assign compute_io_wgt_rd_0_data_bits_13_15 = load_io_wgt_rd_0_data_bits_13_15;
	assign compute_io_wgt_rd_0_data_bits_14_0 = load_io_wgt_rd_0_data_bits_14_0;
	assign compute_io_wgt_rd_0_data_bits_14_1 = load_io_wgt_rd_0_data_bits_14_1;
	assign compute_io_wgt_rd_0_data_bits_14_2 = load_io_wgt_rd_0_data_bits_14_2;
	assign compute_io_wgt_rd_0_data_bits_14_3 = load_io_wgt_rd_0_data_bits_14_3;
	assign compute_io_wgt_rd_0_data_bits_14_4 = load_io_wgt_rd_0_data_bits_14_4;
	assign compute_io_wgt_rd_0_data_bits_14_5 = load_io_wgt_rd_0_data_bits_14_5;
	assign compute_io_wgt_rd_0_data_bits_14_6 = load_io_wgt_rd_0_data_bits_14_6;
	assign compute_io_wgt_rd_0_data_bits_14_7 = load_io_wgt_rd_0_data_bits_14_7;
	assign compute_io_wgt_rd_0_data_bits_14_8 = load_io_wgt_rd_0_data_bits_14_8;
	assign compute_io_wgt_rd_0_data_bits_14_9 = load_io_wgt_rd_0_data_bits_14_9;
	assign compute_io_wgt_rd_0_data_bits_14_10 = load_io_wgt_rd_0_data_bits_14_10;
	assign compute_io_wgt_rd_0_data_bits_14_11 = load_io_wgt_rd_0_data_bits_14_11;
	assign compute_io_wgt_rd_0_data_bits_14_12 = load_io_wgt_rd_0_data_bits_14_12;
	assign compute_io_wgt_rd_0_data_bits_14_13 = load_io_wgt_rd_0_data_bits_14_13;
	assign compute_io_wgt_rd_0_data_bits_14_14 = load_io_wgt_rd_0_data_bits_14_14;
	assign compute_io_wgt_rd_0_data_bits_14_15 = load_io_wgt_rd_0_data_bits_14_15;
	assign compute_io_wgt_rd_0_data_bits_15_0 = load_io_wgt_rd_0_data_bits_15_0;
	assign compute_io_wgt_rd_0_data_bits_15_1 = load_io_wgt_rd_0_data_bits_15_1;
	assign compute_io_wgt_rd_0_data_bits_15_2 = load_io_wgt_rd_0_data_bits_15_2;
	assign compute_io_wgt_rd_0_data_bits_15_3 = load_io_wgt_rd_0_data_bits_15_3;
	assign compute_io_wgt_rd_0_data_bits_15_4 = load_io_wgt_rd_0_data_bits_15_4;
	assign compute_io_wgt_rd_0_data_bits_15_5 = load_io_wgt_rd_0_data_bits_15_5;
	assign compute_io_wgt_rd_0_data_bits_15_6 = load_io_wgt_rd_0_data_bits_15_6;
	assign compute_io_wgt_rd_0_data_bits_15_7 = load_io_wgt_rd_0_data_bits_15_7;
	assign compute_io_wgt_rd_0_data_bits_15_8 = load_io_wgt_rd_0_data_bits_15_8;
	assign compute_io_wgt_rd_0_data_bits_15_9 = load_io_wgt_rd_0_data_bits_15_9;
	assign compute_io_wgt_rd_0_data_bits_15_10 = load_io_wgt_rd_0_data_bits_15_10;
	assign compute_io_wgt_rd_0_data_bits_15_11 = load_io_wgt_rd_0_data_bits_15_11;
	assign compute_io_wgt_rd_0_data_bits_15_12 = load_io_wgt_rd_0_data_bits_15_12;
	assign compute_io_wgt_rd_0_data_bits_15_13 = load_io_wgt_rd_0_data_bits_15_13;
	assign compute_io_wgt_rd_0_data_bits_15_14 = load_io_wgt_rd_0_data_bits_15_14;
	assign compute_io_wgt_rd_0_data_bits_15_15 = load_io_wgt_rd_0_data_bits_15_15;
	assign store_clock = clk;
	assign store_reset = rst;
	assign store_io_i_post = compute_io_o_post_1;
	assign store_io_inst_valid = fetch_io_inst_st_valid;
	assign store_io_inst_bits = fetch_io_inst_st_bits;
	assign store_io_out_baddr = io_vcr_ptrs_5;
	assign store_io_vme_wr_cmd_ready = io_vme_wr_0_cmd_ready;
	assign store_io_vme_wr_data_ready = io_vme_wr_0_data_ready;
	assign store_io_vme_wr_ack = io_vme_wr_0_ack;
	assign store_io_out_wr_0_valid = compute_io_out_wr_0_valid;
	assign store_io_out_wr_0_bits_idx = compute_io_out_wr_0_bits_idx;
	assign store_io_out_wr_0_bits_data_0_0 = compute_io_out_wr_0_bits_data_0_0;
	assign store_io_out_wr_0_bits_data_0_1 = compute_io_out_wr_0_bits_data_0_1;
	assign store_io_out_wr_0_bits_data_0_2 = compute_io_out_wr_0_bits_data_0_2;
	assign store_io_out_wr_0_bits_data_0_3 = compute_io_out_wr_0_bits_data_0_3;
	assign store_io_out_wr_0_bits_data_0_4 = compute_io_out_wr_0_bits_data_0_4;
	assign store_io_out_wr_0_bits_data_0_5 = compute_io_out_wr_0_bits_data_0_5;
	assign store_io_out_wr_0_bits_data_0_6 = compute_io_out_wr_0_bits_data_0_6;
	assign store_io_out_wr_0_bits_data_0_7 = compute_io_out_wr_0_bits_data_0_7;
	assign store_io_out_wr_0_bits_data_0_8 = compute_io_out_wr_0_bits_data_0_8;
	assign store_io_out_wr_0_bits_data_0_9 = compute_io_out_wr_0_bits_data_0_9;
	assign store_io_out_wr_0_bits_data_0_10 = compute_io_out_wr_0_bits_data_0_10;
	assign store_io_out_wr_0_bits_data_0_11 = compute_io_out_wr_0_bits_data_0_11;
	assign store_io_out_wr_0_bits_data_0_12 = compute_io_out_wr_0_bits_data_0_12;
	assign store_io_out_wr_0_bits_data_0_13 = compute_io_out_wr_0_bits_data_0_13;
	assign store_io_out_wr_0_bits_data_0_14 = compute_io_out_wr_0_bits_data_0_14;
	assign store_io_out_wr_0_bits_data_0_15 = compute_io_out_wr_0_bits_data_0_15;
	assign ecounters_clock = clk;
	assign ecounters_reset = rst;
	assign ecounters_io_launch = io_vcr_launch;
	assign ecounters_io_finish = compute_io_finish;
	assign ecounters_io_acc_wr_event = compute_io_acc_wr_event;
	always @(posedge clk) finish <= compute_io_finish;
endmodule
module VTAShell (
	clk,
	rst,
	io_host_aw_ready,
	io_host_aw_valid,
	io_host_aw_bits_addr,
	io_host_w_ready,
	io_host_w_valid,
	io_host_w_bits_data,
	io_host_w_bits_strb,
	io_host_b_ready,
	io_host_b_valid,
	io_host_b_bits_resp,
	io_host_ar_ready,
	io_host_ar_valid,
	io_host_ar_bits_addr,
	io_host_r_ready,
	io_host_r_valid,
	io_host_r_bits_data,
	io_host_r_bits_resp,
	io_mem_aw_ready,
	io_mem_aw_valid,
	io_mem_aw_bits_addr,
	io_mem_aw_bits_id,
	io_mem_aw_bits_user,
	io_mem_aw_bits_len,
	io_mem_aw_bits_size,
	io_mem_aw_bits_burst,
	io_mem_aw_bits_lock,
	io_mem_aw_bits_cache,
	io_mem_aw_bits_prot,
	io_mem_aw_bits_qos,
	io_mem_aw_bits_region,
	io_mem_w_ready,
	io_mem_w_valid,
	io_mem_w_bits_data,
	io_mem_w_bits_strb,
	io_mem_w_bits_last,
	io_mem_w_bits_id,
	io_mem_w_bits_user,
	io_mem_b_ready,
	io_mem_b_valid,
	io_mem_b_bits_resp,
	io_mem_b_bits_id,
	io_mem_b_bits_user,
	io_mem_ar_ready,
	io_mem_ar_valid,
	io_mem_ar_bits_addr,
	io_mem_ar_bits_id,
	io_mem_ar_bits_user,
	io_mem_ar_bits_len,
	io_mem_ar_bits_size,
	io_mem_ar_bits_burst,
	io_mem_ar_bits_lock,
	io_mem_ar_bits_cache,
	io_mem_ar_bits_prot,
	io_mem_ar_bits_qos,
	io_mem_ar_bits_region,
	io_mem_r_ready,
	io_mem_r_valid,
	io_mem_r_bits_data,
	io_mem_r_bits_resp,
	io_mem_r_bits_last,
	io_mem_r_bits_id,
	io_mem_r_bits_user
);
	input clk;
	input rst;
	output wire io_host_aw_ready;
	input io_host_aw_valid;
	input [15:0] io_host_aw_bits_addr;
	output wire io_host_w_ready;
	input io_host_w_valid;
	input [31:0] io_host_w_bits_data;
	input [3:0] io_host_w_bits_strb;
	input io_host_b_ready;
	output wire io_host_b_valid;
	output wire [1:0] io_host_b_bits_resp;
	output wire io_host_ar_ready;
	input io_host_ar_valid;
	input [15:0] io_host_ar_bits_addr;
	input io_host_r_ready;
	output wire io_host_r_valid;
	output wire [31:0] io_host_r_bits_data;
	output wire [1:0] io_host_r_bits_resp;
	input io_mem_aw_ready;
	output wire io_mem_aw_valid;
	output wire [63:0] io_mem_aw_bits_addr;
	output wire [7:0] io_mem_aw_bits_id;
	output wire io_mem_aw_bits_user;
	output wire [7:0] io_mem_aw_bits_len;
	output wire [2:0] io_mem_aw_bits_size;
	output wire [1:0] io_mem_aw_bits_burst;
	output wire [1:0] io_mem_aw_bits_lock;
	output wire [3:0] io_mem_aw_bits_cache;
	output wire [2:0] io_mem_aw_bits_prot;
	output wire [3:0] io_mem_aw_bits_qos;
	output wire [3:0] io_mem_aw_bits_region;
	input io_mem_w_ready;
	output wire io_mem_w_valid;
	output wire [63:0] io_mem_w_bits_data;
	output wire [7:0] io_mem_w_bits_strb;
	output wire io_mem_w_bits_last;
	output wire [7:0] io_mem_w_bits_id;
	output wire io_mem_w_bits_user;
	output wire io_mem_b_ready;
	input io_mem_b_valid;
	input [1:0] io_mem_b_bits_resp;
	input [7:0] io_mem_b_bits_id;
	input io_mem_b_bits_user;
	input io_mem_ar_ready;
	output wire io_mem_ar_valid;
	output wire [63:0] io_mem_ar_bits_addr;
	output wire [7:0] io_mem_ar_bits_id;
	output wire io_mem_ar_bits_user;
	output wire [7:0] io_mem_ar_bits_len;
	output wire [2:0] io_mem_ar_bits_size;
	output wire [1:0] io_mem_ar_bits_burst;
	output wire [1:0] io_mem_ar_bits_lock;
	output wire [3:0] io_mem_ar_bits_cache;
	output wire [2:0] io_mem_ar_bits_prot;
	output wire [3:0] io_mem_ar_bits_qos;
	output wire [3:0] io_mem_ar_bits_region;
	output wire io_mem_r_ready;
	input io_mem_r_valid;
	input [63:0] io_mem_r_bits_data;
	input [1:0] io_mem_r_bits_resp;
	input io_mem_r_bits_last;
	input [7:0] io_mem_r_bits_id;
	input io_mem_r_bits_user;
	wire vcr_clock;
	wire vcr_reset;
	wire vcr_io_host_aw_ready;
	wire vcr_io_host_aw_valid;
	wire [15:0] vcr_io_host_aw_bits_addr;
	wire vcr_io_host_w_ready;
	wire vcr_io_host_w_valid;
	wire [31:0] vcr_io_host_w_bits_data;
	wire vcr_io_host_b_ready;
	wire vcr_io_host_b_valid;
	wire vcr_io_host_ar_ready;
	wire vcr_io_host_ar_valid;
	wire [15:0] vcr_io_host_ar_bits_addr;
	wire vcr_io_host_r_ready;
	wire vcr_io_host_r_valid;
	wire [31:0] vcr_io_host_r_bits_data;
	wire vcr_io_vcr_launch;
	wire vcr_io_vcr_finish;
	wire vcr_io_vcr_ecnt_0_valid;
	wire [31:0] vcr_io_vcr_ecnt_0_bits;
	wire [31:0] vcr_io_vcr_vals_0;
	wire [63:0] vcr_io_vcr_ptrs_0;
	wire [63:0] vcr_io_vcr_ptrs_1;
	wire [63:0] vcr_io_vcr_ptrs_2;
	wire [63:0] vcr_io_vcr_ptrs_3;
	wire [63:0] vcr_io_vcr_ptrs_4;
	wire [63:0] vcr_io_vcr_ptrs_5;
	wire vcr_io_vcr_ucnt_0_valid;
	wire [31:0] vcr_io_vcr_ucnt_0_bits;
	wire vme_clock;
	wire vme_reset;
	wire vme_io_mem_aw_ready;
	wire vme_io_mem_aw_valid;
	wire [63:0] vme_io_mem_aw_bits_addr;
	wire [7:0] vme_io_mem_aw_bits_len;
	wire vme_io_mem_w_ready;
	wire vme_io_mem_w_valid;
	wire [63:0] vme_io_mem_w_bits_data;
	wire vme_io_mem_w_bits_last;
	wire vme_io_mem_b_ready;
	wire vme_io_mem_b_valid;
	wire vme_io_mem_ar_ready;
	wire vme_io_mem_ar_valid;
	wire [63:0] vme_io_mem_ar_bits_addr;
	wire [7:0] vme_io_mem_ar_bits_id;
	wire [7:0] vme_io_mem_ar_bits_len;
	wire vme_io_mem_r_valid;
	wire [63:0] vme_io_mem_r_bits_data;
	wire vme_io_mem_r_bits_last;
	wire [7:0] vme_io_mem_r_bits_id;
	wire vme_io_vme_rd_0_cmd_ready;
	wire vme_io_vme_rd_0_cmd_valid;
	wire [63:0] vme_io_vme_rd_0_cmd_bits_addr;
	wire [7:0] vme_io_vme_rd_0_cmd_bits_len;
	wire vme_io_vme_rd_0_data_ready;
	wire vme_io_vme_rd_0_data_valid;
	wire [63:0] vme_io_vme_rd_0_data_bits_data;
	wire vme_io_vme_rd_1_cmd_ready;
	wire vme_io_vme_rd_1_cmd_valid;
	wire [63:0] vme_io_vme_rd_1_cmd_bits_addr;
	wire [7:0] vme_io_vme_rd_1_cmd_bits_len;
	wire [20:0] vme_io_vme_rd_1_cmd_bits_tag;
	wire vme_io_vme_rd_1_data_valid;
	wire [63:0] vme_io_vme_rd_1_data_bits_data;
	wire [20:0] vme_io_vme_rd_1_data_bits_tag;
	wire vme_io_vme_rd_1_data_bits_last;
	wire vme_io_vme_rd_2_cmd_ready;
	wire vme_io_vme_rd_2_cmd_valid;
	wire [63:0] vme_io_vme_rd_2_cmd_bits_addr;
	wire [7:0] vme_io_vme_rd_2_cmd_bits_len;
	wire [20:0] vme_io_vme_rd_2_cmd_bits_tag;
	wire vme_io_vme_rd_2_data_valid;
	wire [63:0] vme_io_vme_rd_2_data_bits_data;
	wire [20:0] vme_io_vme_rd_2_data_bits_tag;
	wire vme_io_vme_rd_3_cmd_ready;
	wire vme_io_vme_rd_3_cmd_valid;
	wire [63:0] vme_io_vme_rd_3_cmd_bits_addr;
	wire [7:0] vme_io_vme_rd_3_cmd_bits_len;
	wire [20:0] vme_io_vme_rd_3_cmd_bits_tag;
	wire vme_io_vme_rd_3_data_valid;
	wire [63:0] vme_io_vme_rd_3_data_bits_data;
	wire [20:0] vme_io_vme_rd_3_data_bits_tag;
	wire vme_io_vme_rd_4_cmd_ready;
	wire vme_io_vme_rd_4_cmd_valid;
	wire [63:0] vme_io_vme_rd_4_cmd_bits_addr;
	wire [7:0] vme_io_vme_rd_4_cmd_bits_len;
	wire [20:0] vme_io_vme_rd_4_cmd_bits_tag;
	wire vme_io_vme_rd_4_data_valid;
	wire [63:0] vme_io_vme_rd_4_data_bits_data;
	wire [20:0] vme_io_vme_rd_4_data_bits_tag;
	wire vme_io_vme_wr_0_cmd_ready;
	wire vme_io_vme_wr_0_cmd_valid;
	wire [63:0] vme_io_vme_wr_0_cmd_bits_addr;
	wire [7:0] vme_io_vme_wr_0_cmd_bits_len;
	wire vme_io_vme_wr_0_data_ready;
	wire vme_io_vme_wr_0_data_valid;
	wire [63:0] vme_io_vme_wr_0_data_bits_data;
	wire vme_io_vme_wr_0_ack;
	wire core_clock;
	wire core_reset;
	wire core_io_vcr_launch;
	wire core_io_vcr_finish;
	wire core_io_vcr_ecnt_0_valid;
	wire [31:0] core_io_vcr_ecnt_0_bits;
	wire [31:0] core_io_vcr_vals_0;
	wire [63:0] core_io_vcr_ptrs_0;
	wire [63:0] core_io_vcr_ptrs_1;
	wire [63:0] core_io_vcr_ptrs_2;
	wire [63:0] core_io_vcr_ptrs_3;
	wire [63:0] core_io_vcr_ptrs_4;
	wire [63:0] core_io_vcr_ptrs_5;
	wire core_io_vcr_ucnt_0_valid;
	wire [31:0] core_io_vcr_ucnt_0_bits;
	wire core_io_vme_rd_0_cmd_ready;
	wire core_io_vme_rd_0_cmd_valid;
	wire [63:0] core_io_vme_rd_0_cmd_bits_addr;
	wire [7:0] core_io_vme_rd_0_cmd_bits_len;
	wire core_io_vme_rd_0_data_ready;
	wire core_io_vme_rd_0_data_valid;
	wire [63:0] core_io_vme_rd_0_data_bits_data;
	wire core_io_vme_rd_1_cmd_ready;
	wire core_io_vme_rd_1_cmd_valid;
	wire [63:0] core_io_vme_rd_1_cmd_bits_addr;
	wire [7:0] core_io_vme_rd_1_cmd_bits_len;
	wire [20:0] core_io_vme_rd_1_cmd_bits_tag;
	wire core_io_vme_rd_1_data_valid;
	wire [63:0] core_io_vme_rd_1_data_bits_data;
	wire [20:0] core_io_vme_rd_1_data_bits_tag;
	wire core_io_vme_rd_1_data_bits_last;
	wire core_io_vme_rd_2_cmd_ready;
	wire core_io_vme_rd_2_cmd_valid;
	wire [63:0] core_io_vme_rd_2_cmd_bits_addr;
	wire [7:0] core_io_vme_rd_2_cmd_bits_len;
	wire [20:0] core_io_vme_rd_2_cmd_bits_tag;
	wire core_io_vme_rd_2_data_valid;
	wire [63:0] core_io_vme_rd_2_data_bits_data;
	wire [20:0] core_io_vme_rd_2_data_bits_tag;
	wire core_io_vme_rd_3_cmd_ready;
	wire core_io_vme_rd_3_cmd_valid;
	wire [63:0] core_io_vme_rd_3_cmd_bits_addr;
	wire [7:0] core_io_vme_rd_3_cmd_bits_len;
	wire [20:0] core_io_vme_rd_3_cmd_bits_tag;
	wire core_io_vme_rd_3_data_valid;
	wire [63:0] core_io_vme_rd_3_data_bits_data;
	wire [20:0] core_io_vme_rd_3_data_bits_tag;
	wire core_io_vme_rd_4_cmd_ready;
	wire core_io_vme_rd_4_cmd_valid;
	wire [63:0] core_io_vme_rd_4_cmd_bits_addr;
	wire [7:0] core_io_vme_rd_4_cmd_bits_len;
	wire [20:0] core_io_vme_rd_4_cmd_bits_tag;
	wire core_io_vme_rd_4_data_valid;
	wire [63:0] core_io_vme_rd_4_data_bits_data;
	wire [20:0] core_io_vme_rd_4_data_bits_tag;
	wire core_io_vme_wr_0_cmd_ready;
	wire core_io_vme_wr_0_cmd_valid;
	wire [63:0] core_io_vme_wr_0_cmd_bits_addr;
	wire [7:0] core_io_vme_wr_0_cmd_bits_len;
	wire core_io_vme_wr_0_data_ready;
	wire core_io_vme_wr_0_data_valid;
	wire [63:0] core_io_vme_wr_0_data_bits_data;
	wire core_io_vme_wr_0_ack;
	VCR vcr(
		.clk(vcr_clock),
		.rst(vcr_reset),
		.io_host_aw_ready(vcr_io_host_aw_ready),
		.io_host_aw_valid(vcr_io_host_aw_valid),
		.io_host_aw_bits_addr(vcr_io_host_aw_bits_addr),
		.io_host_w_ready(vcr_io_host_w_ready),
		.io_host_w_valid(vcr_io_host_w_valid),
		.io_host_w_bits_data(vcr_io_host_w_bits_data),
		.io_host_b_ready(vcr_io_host_b_ready),
		.io_host_b_valid(vcr_io_host_b_valid),
		.io_host_ar_ready(vcr_io_host_ar_ready),
		.io_host_ar_valid(vcr_io_host_ar_valid),
		.io_host_ar_bits_addr(vcr_io_host_ar_bits_addr),
		.io_host_r_ready(vcr_io_host_r_ready),
		.io_host_r_valid(vcr_io_host_r_valid),
		.io_host_r_bits_data(vcr_io_host_r_bits_data),
		.io_vcr_launch(vcr_io_vcr_launch),
		.io_vcr_finish(vcr_io_vcr_finish),
		.io_vcr_ecnt_0_valid(vcr_io_vcr_ecnt_0_valid),
		.io_vcr_ecnt_0_bits(vcr_io_vcr_ecnt_0_bits),
		.io_vcr_vals_0(vcr_io_vcr_vals_0),
		.io_vcr_ptrs_0(vcr_io_vcr_ptrs_0),
		.io_vcr_ptrs_1(vcr_io_vcr_ptrs_1),
		.io_vcr_ptrs_2(vcr_io_vcr_ptrs_2),
		.io_vcr_ptrs_3(vcr_io_vcr_ptrs_3),
		.io_vcr_ptrs_4(vcr_io_vcr_ptrs_4),
		.io_vcr_ptrs_5(vcr_io_vcr_ptrs_5),
		.io_vcr_ucnt_0_valid(vcr_io_vcr_ucnt_0_valid),
		.io_vcr_ucnt_0_bits(vcr_io_vcr_ucnt_0_bits)
	);
	VME vme(
		.clk(vme_clock),
		.rst(vme_reset),
		.io_mem_aw_ready(vme_io_mem_aw_ready),
		.io_mem_aw_valid(vme_io_mem_aw_valid),
		.io_mem_aw_bits_addr(vme_io_mem_aw_bits_addr),
		.io_mem_aw_bits_len(vme_io_mem_aw_bits_len),
		.io_mem_w_ready(vme_io_mem_w_ready),
		.io_mem_w_valid(vme_io_mem_w_valid),
		.io_mem_w_bits_data(vme_io_mem_w_bits_data),
		.io_mem_w_bits_last(vme_io_mem_w_bits_last),
		.io_mem_b_ready(vme_io_mem_b_ready),
		.io_mem_b_valid(vme_io_mem_b_valid),
		.io_mem_ar_ready(vme_io_mem_ar_ready),
		.io_mem_ar_valid(vme_io_mem_ar_valid),
		.io_mem_ar_bits_addr(vme_io_mem_ar_bits_addr),
		.io_mem_ar_bits_id(vme_io_mem_ar_bits_id),
		.io_mem_ar_bits_len(vme_io_mem_ar_bits_len),
		.io_mem_r_valid(vme_io_mem_r_valid),
		.io_mem_r_bits_data(vme_io_mem_r_bits_data),
		.io_mem_r_bits_last(vme_io_mem_r_bits_last),
		.io_mem_r_bits_id(vme_io_mem_r_bits_id),
		.io_vme_rd_0_cmd_ready(vme_io_vme_rd_0_cmd_ready),
		.io_vme_rd_0_cmd_valid(vme_io_vme_rd_0_cmd_valid),
		.io_vme_rd_0_cmd_bits_addr(vme_io_vme_rd_0_cmd_bits_addr),
		.io_vme_rd_0_cmd_bits_len(vme_io_vme_rd_0_cmd_bits_len),
		.io_vme_rd_0_data_ready(vme_io_vme_rd_0_data_ready),
		.io_vme_rd_0_data_valid(vme_io_vme_rd_0_data_valid),
		.io_vme_rd_0_data_bits_data(vme_io_vme_rd_0_data_bits_data),
		.io_vme_rd_1_cmd_ready(vme_io_vme_rd_1_cmd_ready),
		.io_vme_rd_1_cmd_valid(vme_io_vme_rd_1_cmd_valid),
		.io_vme_rd_1_cmd_bits_addr(vme_io_vme_rd_1_cmd_bits_addr),
		.io_vme_rd_1_cmd_bits_len(vme_io_vme_rd_1_cmd_bits_len),
		.io_vme_rd_1_cmd_bits_tag(vme_io_vme_rd_1_cmd_bits_tag),
		.io_vme_rd_1_data_valid(vme_io_vme_rd_1_data_valid),
		.io_vme_rd_1_data_bits_data(vme_io_vme_rd_1_data_bits_data),
		.io_vme_rd_1_data_bits_tag(vme_io_vme_rd_1_data_bits_tag),
		.io_vme_rd_1_data_bits_last(vme_io_vme_rd_1_data_bits_last),
		.io_vme_rd_2_cmd_ready(vme_io_vme_rd_2_cmd_ready),
		.io_vme_rd_2_cmd_valid(vme_io_vme_rd_2_cmd_valid),
		.io_vme_rd_2_cmd_bits_addr(vme_io_vme_rd_2_cmd_bits_addr),
		.io_vme_rd_2_cmd_bits_len(vme_io_vme_rd_2_cmd_bits_len),
		.io_vme_rd_2_cmd_bits_tag(vme_io_vme_rd_2_cmd_bits_tag),
		.io_vme_rd_2_data_valid(vme_io_vme_rd_2_data_valid),
		.io_vme_rd_2_data_bits_data(vme_io_vme_rd_2_data_bits_data),
		.io_vme_rd_2_data_bits_tag(vme_io_vme_rd_2_data_bits_tag),
		.io_vme_rd_3_cmd_ready(vme_io_vme_rd_3_cmd_ready),
		.io_vme_rd_3_cmd_valid(vme_io_vme_rd_3_cmd_valid),
		.io_vme_rd_3_cmd_bits_addr(vme_io_vme_rd_3_cmd_bits_addr),
		.io_vme_rd_3_cmd_bits_len(vme_io_vme_rd_3_cmd_bits_len),
		.io_vme_rd_3_cmd_bits_tag(vme_io_vme_rd_3_cmd_bits_tag),
		.io_vme_rd_3_data_valid(vme_io_vme_rd_3_data_valid),
		.io_vme_rd_3_data_bits_data(vme_io_vme_rd_3_data_bits_data),
		.io_vme_rd_3_data_bits_tag(vme_io_vme_rd_3_data_bits_tag),
		.io_vme_rd_4_cmd_ready(vme_io_vme_rd_4_cmd_ready),
		.io_vme_rd_4_cmd_valid(vme_io_vme_rd_4_cmd_valid),
		.io_vme_rd_4_cmd_bits_addr(vme_io_vme_rd_4_cmd_bits_addr),
		.io_vme_rd_4_cmd_bits_len(vme_io_vme_rd_4_cmd_bits_len),
		.io_vme_rd_4_cmd_bits_tag(vme_io_vme_rd_4_cmd_bits_tag),
		.io_vme_rd_4_data_valid(vme_io_vme_rd_4_data_valid),
		.io_vme_rd_4_data_bits_data(vme_io_vme_rd_4_data_bits_data),
		.io_vme_rd_4_data_bits_tag(vme_io_vme_rd_4_data_bits_tag),
		.io_vme_wr_0_cmd_ready(vme_io_vme_wr_0_cmd_ready),
		.io_vme_wr_0_cmd_valid(vme_io_vme_wr_0_cmd_valid),
		.io_vme_wr_0_cmd_bits_addr(vme_io_vme_wr_0_cmd_bits_addr),
		.io_vme_wr_0_cmd_bits_len(vme_io_vme_wr_0_cmd_bits_len),
		.io_vme_wr_0_data_ready(vme_io_vme_wr_0_data_ready),
		.io_vme_wr_0_data_valid(vme_io_vme_wr_0_data_valid),
		.io_vme_wr_0_data_bits_data(vme_io_vme_wr_0_data_bits_data),
		.io_vme_wr_0_ack(vme_io_vme_wr_0_ack)
	);
	Core core(
		.clk(core_clock),
		.rst(core_reset),
		.io_vcr_launch(core_io_vcr_launch),
		.io_vcr_finish(core_io_vcr_finish),
		.io_vcr_ecnt_0_valid(core_io_vcr_ecnt_0_valid),
		.io_vcr_ecnt_0_bits(core_io_vcr_ecnt_0_bits),
		.io_vcr_vals_0(core_io_vcr_vals_0),
		.io_vcr_ptrs_0(core_io_vcr_ptrs_0),
		.io_vcr_ptrs_1(core_io_vcr_ptrs_1),
		.io_vcr_ptrs_2(core_io_vcr_ptrs_2),
		.io_vcr_ptrs_3(core_io_vcr_ptrs_3),
		.io_vcr_ptrs_4(core_io_vcr_ptrs_4),
		.io_vcr_ptrs_5(core_io_vcr_ptrs_5),
		.io_vcr_ucnt_0_valid(core_io_vcr_ucnt_0_valid),
		.io_vcr_ucnt_0_bits(core_io_vcr_ucnt_0_bits),
		.io_vme_rd_0_cmd_ready(core_io_vme_rd_0_cmd_ready),
		.io_vme_rd_0_cmd_valid(core_io_vme_rd_0_cmd_valid),
		.io_vme_rd_0_cmd_bits_addr(core_io_vme_rd_0_cmd_bits_addr),
		.io_vme_rd_0_cmd_bits_len(core_io_vme_rd_0_cmd_bits_len),
		.io_vme_rd_0_data_ready(core_io_vme_rd_0_data_ready),
		.io_vme_rd_0_data_valid(core_io_vme_rd_0_data_valid),
		.io_vme_rd_0_data_bits_data(core_io_vme_rd_0_data_bits_data),
		.io_vme_rd_1_cmd_ready(core_io_vme_rd_1_cmd_ready),
		.io_vme_rd_1_cmd_valid(core_io_vme_rd_1_cmd_valid),
		.io_vme_rd_1_cmd_bits_addr(core_io_vme_rd_1_cmd_bits_addr),
		.io_vme_rd_1_cmd_bits_len(core_io_vme_rd_1_cmd_bits_len),
		.io_vme_rd_1_cmd_bits_tag(core_io_vme_rd_1_cmd_bits_tag),
		.io_vme_rd_1_data_valid(core_io_vme_rd_1_data_valid),
		.io_vme_rd_1_data_bits_data(core_io_vme_rd_1_data_bits_data),
		.io_vme_rd_1_data_bits_tag(core_io_vme_rd_1_data_bits_tag),
		.io_vme_rd_1_data_bits_last(core_io_vme_rd_1_data_bits_last),
		.io_vme_rd_2_cmd_ready(core_io_vme_rd_2_cmd_ready),
		.io_vme_rd_2_cmd_valid(core_io_vme_rd_2_cmd_valid),
		.io_vme_rd_2_cmd_bits_addr(core_io_vme_rd_2_cmd_bits_addr),
		.io_vme_rd_2_cmd_bits_len(core_io_vme_rd_2_cmd_bits_len),
		.io_vme_rd_2_cmd_bits_tag(core_io_vme_rd_2_cmd_bits_tag),
		.io_vme_rd_2_data_valid(core_io_vme_rd_2_data_valid),
		.io_vme_rd_2_data_bits_data(core_io_vme_rd_2_data_bits_data),
		.io_vme_rd_2_data_bits_tag(core_io_vme_rd_2_data_bits_tag),
		.io_vme_rd_3_cmd_ready(core_io_vme_rd_3_cmd_ready),
		.io_vme_rd_3_cmd_valid(core_io_vme_rd_3_cmd_valid),
		.io_vme_rd_3_cmd_bits_addr(core_io_vme_rd_3_cmd_bits_addr),
		.io_vme_rd_3_cmd_bits_len(core_io_vme_rd_3_cmd_bits_len),
		.io_vme_rd_3_cmd_bits_tag(core_io_vme_rd_3_cmd_bits_tag),
		.io_vme_rd_3_data_valid(core_io_vme_rd_3_data_valid),
		.io_vme_rd_3_data_bits_data(core_io_vme_rd_3_data_bits_data),
		.io_vme_rd_3_data_bits_tag(core_io_vme_rd_3_data_bits_tag),
		.io_vme_rd_4_cmd_ready(core_io_vme_rd_4_cmd_ready),
		.io_vme_rd_4_cmd_valid(core_io_vme_rd_4_cmd_valid),
		.io_vme_rd_4_cmd_bits_addr(core_io_vme_rd_4_cmd_bits_addr),
		.io_vme_rd_4_cmd_bits_len(core_io_vme_rd_4_cmd_bits_len),
		.io_vme_rd_4_cmd_bits_tag(core_io_vme_rd_4_cmd_bits_tag),
		.io_vme_rd_4_data_valid(core_io_vme_rd_4_data_valid),
		.io_vme_rd_4_data_bits_data(core_io_vme_rd_4_data_bits_data),
		.io_vme_rd_4_data_bits_tag(core_io_vme_rd_4_data_bits_tag),
		.io_vme_wr_0_cmd_ready(core_io_vme_wr_0_cmd_ready),
		.io_vme_wr_0_cmd_valid(core_io_vme_wr_0_cmd_valid),
		.io_vme_wr_0_cmd_bits_addr(core_io_vme_wr_0_cmd_bits_addr),
		.io_vme_wr_0_cmd_bits_len(core_io_vme_wr_0_cmd_bits_len),
		.io_vme_wr_0_data_ready(core_io_vme_wr_0_data_ready),
		.io_vme_wr_0_data_valid(core_io_vme_wr_0_data_valid),
		.io_vme_wr_0_data_bits_data(core_io_vme_wr_0_data_bits_data),
		.io_vme_wr_0_ack(core_io_vme_wr_0_ack)
	);
	assign io_host_aw_ready = vcr_io_host_aw_ready;
	assign io_host_w_ready = vcr_io_host_w_ready;
	assign io_host_b_valid = vcr_io_host_b_valid;
	assign io_host_b_bits_resp = 2'h0;
	assign io_host_ar_ready = vcr_io_host_ar_ready;
	assign io_host_r_valid = vcr_io_host_r_valid;
	assign io_host_r_bits_data = vcr_io_host_r_bits_data;
	assign io_host_r_bits_resp = 2'h0;
	assign io_mem_aw_valid = vme_io_mem_aw_valid;
	assign io_mem_aw_bits_addr = vme_io_mem_aw_bits_addr;
	assign io_mem_aw_bits_id = 8'h00;
	assign io_mem_aw_bits_user = 1'h0;
	assign io_mem_aw_bits_len = vme_io_mem_aw_bits_len;
	assign io_mem_aw_bits_size = 3'h3;
	assign io_mem_aw_bits_burst = 2'h1;
	assign io_mem_aw_bits_lock = 2'h0;
	assign io_mem_aw_bits_cache = 4'h3;
	assign io_mem_aw_bits_prot = 3'h0;
	assign io_mem_aw_bits_qos = 4'h0;
	assign io_mem_aw_bits_region = 4'h0;
	assign io_mem_w_valid = vme_io_mem_w_valid;
	assign io_mem_w_bits_data = vme_io_mem_w_bits_data;
	assign io_mem_w_bits_strb = 8'hff;
	assign io_mem_w_bits_last = vme_io_mem_w_bits_last;
	assign io_mem_w_bits_id = 8'h00;
	assign io_mem_w_bits_user = 1'h0;
	assign io_mem_b_ready = vme_io_mem_b_ready;
	assign io_mem_ar_valid = vme_io_mem_ar_valid;
	assign io_mem_ar_bits_addr = vme_io_mem_ar_bits_addr;
	assign io_mem_ar_bits_id = vme_io_mem_ar_bits_id;
	assign io_mem_ar_bits_user = 1'h0;
	assign io_mem_ar_bits_len = vme_io_mem_ar_bits_len;
	assign io_mem_ar_bits_size = 3'h3;
	assign io_mem_ar_bits_burst = 2'h1;
	assign io_mem_ar_bits_lock = 2'h0;
	assign io_mem_ar_bits_cache = 4'h3;
	assign io_mem_ar_bits_prot = 3'h0;
	assign io_mem_ar_bits_qos = 4'h0;
	assign io_mem_ar_bits_region = 4'h0;
	assign io_mem_r_ready = 1'h1;
	assign vcr_clock = clk;
	assign vcr_reset = rst;
	assign vcr_io_host_aw_valid = io_host_aw_valid;
	assign vcr_io_host_aw_bits_addr = io_host_aw_bits_addr;
	assign vcr_io_host_w_valid = io_host_w_valid;
	assign vcr_io_host_w_bits_data = io_host_w_bits_data;
	assign vcr_io_host_b_ready = io_host_b_ready;
	assign vcr_io_host_ar_valid = io_host_ar_valid;
	assign vcr_io_host_ar_bits_addr = io_host_ar_bits_addr;
	assign vcr_io_host_r_ready = io_host_r_ready;
	assign vcr_io_vcr_finish = core_io_vcr_finish;
	assign vcr_io_vcr_ecnt_0_valid = core_io_vcr_ecnt_0_valid;
	assign vcr_io_vcr_ecnt_0_bits = core_io_vcr_ecnt_0_bits;
	assign vcr_io_vcr_ucnt_0_valid = core_io_vcr_ucnt_0_valid;
	assign vcr_io_vcr_ucnt_0_bits = core_io_vcr_ucnt_0_bits;
	assign vme_clock = clk;
	assign vme_reset = rst;
	assign vme_io_mem_aw_ready = io_mem_aw_ready;
	assign vme_io_mem_w_ready = io_mem_w_ready;
	assign vme_io_mem_b_valid = io_mem_b_valid;
	assign vme_io_mem_ar_ready = io_mem_ar_ready;
	assign vme_io_mem_r_valid = io_mem_r_valid;
	assign vme_io_mem_r_bits_data = io_mem_r_bits_data;
	assign vme_io_mem_r_bits_last = io_mem_r_bits_last;
	assign vme_io_mem_r_bits_id = io_mem_r_bits_id;
	assign vme_io_vme_rd_0_cmd_valid = core_io_vme_rd_0_cmd_valid;
	assign vme_io_vme_rd_0_cmd_bits_addr = core_io_vme_rd_0_cmd_bits_addr;
	assign vme_io_vme_rd_0_cmd_bits_len = core_io_vme_rd_0_cmd_bits_len;
	assign vme_io_vme_rd_0_data_ready = core_io_vme_rd_0_data_ready;
	assign vme_io_vme_rd_1_cmd_valid = core_io_vme_rd_1_cmd_valid;
	assign vme_io_vme_rd_1_cmd_bits_addr = core_io_vme_rd_1_cmd_bits_addr;
	assign vme_io_vme_rd_1_cmd_bits_len = core_io_vme_rd_1_cmd_bits_len;
	assign vme_io_vme_rd_1_cmd_bits_tag = core_io_vme_rd_1_cmd_bits_tag;
	assign vme_io_vme_rd_2_cmd_valid = core_io_vme_rd_2_cmd_valid;
	assign vme_io_vme_rd_2_cmd_bits_addr = core_io_vme_rd_2_cmd_bits_addr;
	assign vme_io_vme_rd_2_cmd_bits_len = core_io_vme_rd_2_cmd_bits_len;
	assign vme_io_vme_rd_2_cmd_bits_tag = core_io_vme_rd_2_cmd_bits_tag;
	assign vme_io_vme_rd_3_cmd_valid = core_io_vme_rd_3_cmd_valid;
	assign vme_io_vme_rd_3_cmd_bits_addr = core_io_vme_rd_3_cmd_bits_addr;
	assign vme_io_vme_rd_3_cmd_bits_len = core_io_vme_rd_3_cmd_bits_len;
	assign vme_io_vme_rd_3_cmd_bits_tag = core_io_vme_rd_3_cmd_bits_tag;
	assign vme_io_vme_rd_4_cmd_valid = core_io_vme_rd_4_cmd_valid;
	assign vme_io_vme_rd_4_cmd_bits_addr = core_io_vme_rd_4_cmd_bits_addr;
	assign vme_io_vme_rd_4_cmd_bits_len = core_io_vme_rd_4_cmd_bits_len;
	assign vme_io_vme_rd_4_cmd_bits_tag = core_io_vme_rd_4_cmd_bits_tag;
	assign vme_io_vme_wr_0_cmd_valid = core_io_vme_wr_0_cmd_valid;
	assign vme_io_vme_wr_0_cmd_bits_addr = core_io_vme_wr_0_cmd_bits_addr;
	assign vme_io_vme_wr_0_cmd_bits_len = core_io_vme_wr_0_cmd_bits_len;
	assign vme_io_vme_wr_0_data_valid = core_io_vme_wr_0_data_valid;
	assign vme_io_vme_wr_0_data_bits_data = core_io_vme_wr_0_data_bits_data;
	assign core_clock = clk;
	assign core_reset = rst;
	assign core_io_vcr_launch = vcr_io_vcr_launch;
	assign core_io_vcr_vals_0 = vcr_io_vcr_vals_0;
	assign core_io_vcr_ptrs_0 = vcr_io_vcr_ptrs_0;
	assign core_io_vcr_ptrs_1 = vcr_io_vcr_ptrs_1;
	assign core_io_vcr_ptrs_2 = vcr_io_vcr_ptrs_2;
	assign core_io_vcr_ptrs_3 = vcr_io_vcr_ptrs_3;
	assign core_io_vcr_ptrs_4 = vcr_io_vcr_ptrs_4;
	assign core_io_vcr_ptrs_5 = vcr_io_vcr_ptrs_5;
	assign core_io_vme_rd_0_cmd_ready = vme_io_vme_rd_0_cmd_ready;
	assign core_io_vme_rd_0_data_valid = vme_io_vme_rd_0_data_valid;
	assign core_io_vme_rd_0_data_bits_data = vme_io_vme_rd_0_data_bits_data;
	assign core_io_vme_rd_1_cmd_ready = vme_io_vme_rd_1_cmd_ready;
	assign core_io_vme_rd_1_data_valid = vme_io_vme_rd_1_data_valid;
	assign core_io_vme_rd_1_data_bits_data = vme_io_vme_rd_1_data_bits_data;
	assign core_io_vme_rd_1_data_bits_tag = vme_io_vme_rd_1_data_bits_tag;
	assign core_io_vme_rd_1_data_bits_last = vme_io_vme_rd_1_data_bits_last;
	assign core_io_vme_rd_2_cmd_ready = vme_io_vme_rd_2_cmd_ready;
	assign core_io_vme_rd_2_data_valid = vme_io_vme_rd_2_data_valid;
	assign core_io_vme_rd_2_data_bits_data = vme_io_vme_rd_2_data_bits_data;
	assign core_io_vme_rd_2_data_bits_tag = vme_io_vme_rd_2_data_bits_tag;
	assign core_io_vme_rd_3_cmd_ready = vme_io_vme_rd_3_cmd_ready;
	assign core_io_vme_rd_3_data_valid = vme_io_vme_rd_3_data_valid;
	assign core_io_vme_rd_3_data_bits_data = vme_io_vme_rd_3_data_bits_data;
	assign core_io_vme_rd_3_data_bits_tag = vme_io_vme_rd_3_data_bits_tag;
	assign core_io_vme_rd_4_cmd_ready = vme_io_vme_rd_4_cmd_ready;
	assign core_io_vme_rd_4_data_valid = vme_io_vme_rd_4_data_valid;
	assign core_io_vme_rd_4_data_bits_data = vme_io_vme_rd_4_data_bits_data;
	assign core_io_vme_rd_4_data_bits_tag = vme_io_vme_rd_4_data_bits_tag;
	assign core_io_vme_wr_0_cmd_ready = vme_io_vme_wr_0_cmd_ready;
	assign core_io_vme_wr_0_data_ready = vme_io_vme_wr_0_data_ready;
	assign core_io_vme_wr_0_ack = vme_io_vme_wr_0_ack;
endmodule
