

VIVADO ?= vivado
VPP ?= v++
CXX ?= c++

PLATFORM ?= xilinx_u200_gen3x16_xdma_2_202110_1
# DEVICE_PART ?= xcu200-fsgd2104-2-e

# hw_emu or hw
#TARGET ?= hw_emu
TARGET ?= hw

BUILD_DIR := build
BUILD_PACKAGE_DIR := $(BUILD_DIR)/packaged_kernel
BUILD_TEMP_DIR := $(BUILD_DIR)/tmp_kernel_pack

KERNEL_NAME := vta_kernel

XO_OBJECT := $(BUILD_DIR)/$(KERNEL_NAME).xo
XCLBIN_OBJECT := $(BUILD_DIR)/$(KERNEL_NAME)_$(TARGET)_$(PLATFORM).xclbin

VERILOG_SOURCES := \
	$(wildcard src_v/*.v) \
	$(wildcard src_v/*.sv) \

HOST_SRC := src_cpp/host.cpp
HOST_EXE := vta_fpga

all: $(XCLBIN_OBJECT) $(HOST_EXE)
# all: $(HOST_EXE)

$(BUILD_DIR):
	mkdir -p $@

$(XO_OBJECT): $(VERILOG_SOURCES)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs \
		$(XO_OBJECT) $(KERNEL_NAME) $(TARGET) $(PLATFORM) $(BUILD_PACKAGE_DIR) $(BUILD_TEMP_DIR)

$(XCLBIN_OBJECT): $(XO_OBJECT)
	$(VPP) --link -g -t $(TARGET) --platform $(PLATFORM) --save-temps \
	--connectivity.sp vta_kernel_1.m_axi_gmem:HOST[0] --output $@ $<

xclbin: $(XCLBIN_OBJECT)

host: $(HOST_EXE)

emconfig.json:
	emconfigutil -f $(PLATFORM)

$(HOST_EXE): $(HOST_SRC)
	c++ -I$(XILINX_XRT)/include   -L$(XILINX_XRT)/lib -O2 -g $^ -lxrt_coreutil -o $@ -lpthread

clean:
	-rm -rf $(BUILD_DIR)/* vivado*.jou vivado*.log \
		$(HOST_EXE) profile_kernels.csv timeline_kernels.csv emconfig.json \
		.ipcache _x .Xil build
		
emconfig.json:
	emconfigutil -f $(PLATFORM)

