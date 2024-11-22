module vta_kernel #(
  parameter integer  C_S_AXI_CONTROL_DATA_WIDTH = 32,
  parameter integer  C_S_AXI_CONTROL_ADDR_WIDTH = 16,
  parameter integer  C_M_AXI_GMEM_ID_WIDTH = 8,
  parameter integer  C_M_AXI_GMEM_ADDR_WIDTH = 64,
  parameter integer  C_M_AXI_GMEM_DATA_WIDTH = 64
)
(
  // System signals
  input  wire  ap_clk,
  input  wire  ap_rst_n,
  // AXI4 master interface
  output wire                                 m_axi_gmem_AWVALID,
  input  wire                                 m_axi_gmem_AWREADY,
  output wire [C_M_AXI_GMEM_ADDR_WIDTH-1:0]   m_axi_gmem_AWADDR,
  output wire [C_M_AXI_GMEM_ID_WIDTH - 1:0]   m_axi_gmem_AWID,
  output wire [7:0]                           m_axi_gmem_AWLEN,
  output wire [2:0]                           m_axi_gmem_AWSIZE,
  // Tie-off AXI4 transaction options that are not being used.
  output wire [1:0]                           m_axi_gmem_AWBURST,

  output wire                                 m_axi_gmem_WVALID,
  input  wire                                 m_axi_gmem_WREADY,
  output wire [C_M_AXI_GMEM_DATA_WIDTH-1:0]   m_axi_gmem_WDATA,
  output wire [C_M_AXI_GMEM_DATA_WIDTH/8-1:0] m_axi_gmem_WSTRB,
  output wire                                 m_axi_gmem_WLAST,
  output wire                                 m_axi_gmem_ARVALID,
  input  wire                                 m_axi_gmem_ARREADY,
  output wire [C_M_AXI_GMEM_ADDR_WIDTH-1:0]   m_axi_gmem_ARADDR,
  output wire [C_M_AXI_GMEM_ID_WIDTH-1:0]     m_axi_gmem_ARID,
  output wire [7:0]                           m_axi_gmem_ARLEN,
  output wire [2:0]                           m_axi_gmem_ARSIZE,
  output wire [1:0]                           m_axi_gmem_ARBURST,




  input  wire                                 m_axi_gmem_RVALID,
  output wire                                 m_axi_gmem_RREADY,
  input  wire [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_RDATA,
  input  wire                                 m_axi_gmem_RLAST,
  input  wire [C_M_AXI_GMEM_ID_WIDTH - 1:0]   m_axi_gmem_RID,
  input  wire [1:0]                           m_axi_gmem_RRESP,
  input  wire                                 m_axi_gmem_BVALID,
  output wire                                 m_axi_gmem_BREADY,
  input  wire [1:0]                           m_axi_gmem_BRESP,
  input  wire [C_M_AXI_GMEM_ID_WIDTH - 1:0]   m_axi_gmem_BID,

  // AXI4-Lite slave interface
  input  wire                                    s_axi_control_AWVALID,
  output wire                                    s_axi_control_AWREADY,
  input  wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0]   s_axi_control_AWADDR,
  input  wire                                    s_axi_control_WVALID,
  output wire                                    s_axi_control_WREADY,
  input  wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0]   s_axi_control_WDATA,
  input  wire [C_S_AXI_CONTROL_DATA_WIDTH/8-1:0] s_axi_control_WSTRB,
  input  wire                                    s_axi_control_ARVALID,
  output wire                                    s_axi_control_ARREADY,
  input  wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0]   s_axi_control_ARADDR,
  output wire                                    s_axi_control_RVALID,
  input  wire                                    s_axi_control_RREADY,
  output wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0]   s_axi_control_RDATA,
  output wire [1:0]                              s_axi_control_RRESP,
  output wire                                    s_axi_control_BVALID,
  input  wire                                    s_axi_control_BREADY,
  output wire [1:0]                              s_axi_control_BRESP,
  output wire                                    interrupt
);


  reg areset = 1'b0;

  wire rst = areset;
  wire clk = ap_clk;

  // Register and invert reset signal for better timing.
  always @(posedge ap_clk) begin
    areset <= ~ap_rst_n;
  end

  wire[63:0] m_axi_gmem_ARADDR_offset;
  wire[63:0] m_axi_gmem_AWADDR_offset;
  assign m_axi_gmem_ARADDR = m_axi_gmem_ARADDR_offset + 64'h2000000000;
  assign m_axi_gmem_AWADDR = m_axi_gmem_AWADDR_offset + 64'h2000000000;

  assign interrupt = 1'b0;

  VTAShell vta_internal_shell(
    .clk(ap_clk)
    ,.rst(rst)
    ,.io_host_aw_ready(s_axi_control_AWREADY)
    ,.io_host_aw_valid(s_axi_control_AWVALID)
    ,.io_host_aw_bits_addr(s_axi_control_AWADDR)
    ,.io_host_w_ready(s_axi_control_WREADY)
    ,.io_host_w_valid(s_axi_control_WVALID)
    ,.io_host_w_bits_data(s_axi_control_WDATA)
    ,.io_host_w_bits_strb(s_axi_control_WSTRB)
    ,.io_host_b_ready(s_axi_control_BREADY)
    ,.io_host_b_valid(s_axi_control_BVALID)
    ,.io_host_b_bits_resp(s_axi_control_BRESP)
    ,.io_host_ar_ready(s_axi_control_ARREADY)
    ,.io_host_ar_valid(s_axi_control_ARVALID)
    ,.io_host_ar_bits_addr(s_axi_control_ARADDR)
    ,.io_host_r_ready(s_axi_control_RREADY)
    ,.io_host_r_valid(s_axi_control_RVALID)
    ,.io_host_r_bits_data(s_axi_control_RDATA)
    ,.io_host_r_bits_resp(s_axi_control_RRESP)
    ,.io_mem_aw_ready(m_axi_gmem_AWREADY)
    ,.io_mem_aw_valid(m_axi_gmem_AWVALID)
    ,.io_mem_aw_bits_addr(m_axi_gmem_AWADDR_offset)
    ,.io_mem_aw_bits_id(m_axi_gmem_AWID)
    ,.io_mem_aw_bits_user()
    ,.io_mem_aw_bits_len(m_axi_gmem_AWLEN)
    ,.io_mem_aw_bits_size(m_axi_gmem_AWSIZE)
    ,.io_mem_aw_bits_burst()
    ,.io_mem_aw_bits_lock()
    ,.io_mem_aw_bits_cache()
    ,.io_mem_aw_bits_prot()
    ,.io_mem_aw_bits_qos()
    ,.io_mem_aw_bits_region()
    ,.io_mem_w_ready(m_axi_gmem_WREADY)
    ,.io_mem_w_valid(m_axi_gmem_WVALID)
    ,.io_mem_w_bits_data(m_axi_gmem_WDATA)
    ,.io_mem_w_bits_strb(m_axi_gmem_WSTRB)
    ,.io_mem_w_bits_last(m_axi_gmem_WLAST)
    ,.io_mem_w_bits_id()
    ,.io_mem_w_bits_user()
    ,.io_mem_b_ready(m_axi_gmem_BREADY)
    ,.io_mem_b_valid(m_axi_gmem_BVALID)
    ,.io_mem_b_bits_resp(m_axi_gmem_BRESP)
    ,.io_mem_b_bits_id(m_axi_gmem_BID)
    ,.io_mem_b_bits_user()
    ,.io_mem_ar_ready(m_axi_gmem_ARREADY)
    ,.io_mem_ar_valid(m_axi_gmem_ARVALID)
    ,.io_mem_ar_bits_addr(m_axi_gmem_ARADDR_offset)
    ,.io_mem_ar_bits_id(m_axi_gmem_ARID)
    ,.io_mem_ar_bits_user()
    ,.io_mem_ar_bits_len(m_axi_gmem_ARLEN)
    ,.io_mem_ar_bits_size(m_axi_gmem_ARSIZE)
    ,.io_mem_ar_bits_burst(m_axi_gmem_ARBURST)
    ,.io_mem_ar_bits_lock()
    ,.io_mem_ar_bits_cache()
    ,.io_mem_ar_bits_prot()
    ,.io_mem_ar_bits_qos()
    ,.io_mem_ar_bits_region()
    ,.io_mem_r_ready(m_axi_gmem_RREADY)
    ,.io_mem_r_valid(m_axi_gmem_RVALID)
    ,.io_mem_r_bits_data(m_axi_gmem_RDATA)
    ,.io_mem_r_bits_resp(m_axi_gmem_RRESP)
    ,.io_mem_r_bits_last(m_axi_gmem_RLAST)
    ,.io_mem_r_bits_id(m_axi_gmem_RID)
    ,.io_mem_r_bits_user()
  );

endmodule