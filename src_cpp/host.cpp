#include <chrono>
#include <experimental/xrt_error.h>
#include <experimental/xrt_ip.h>
#include <fstream>
#include <iostream>
#include <memory>
#include <vector>
#include <xrt/xrt_bo.h>
#include <xrt/xrt_device.h>
#include <xrt/xrt_kernel.h>
#include <xrt/xrt_uuid.h>
#include <iomanip>
#include <unistd.h>

typedef struct VTARegs {
  // see the s_axi_ctrl.v implementation
  static constexpr uint32_t  _0x00 = 0x00; // A
  static constexpr uint32_t _0x04 = 0x04; // B
  static constexpr uint32_t _0x08 = 0x08; // C
  static constexpr uint32_t _0x0c = 0x0c; 
  static constexpr uint32_t _0x10 = 0x10; 
};

xrt::device dev;
xrt::ip vta_kernel;
// Global buffers
xrt::bo xrt_buffer;

// Pointers to the mapped host buffers
uint8_t* xrt_buffer_host;

uint64_t fpga_phy_base;


void WriteMappedReg(uint32_t reg, uint32_t val) {
  vta_kernel.write_register(reg, val);
}

uint32_t ReadMappedReg(uint32_t reg) {
  return vta_kernel.read_register(reg);
}

void load_memory_from_file(void* target_address, size_t size, const char* filename) {
    FILE* file = fopen(filename, "rb");
    if (!file) {
        perror("File opening failed");
        return;
    }

    fread(target_address, 1, size, file);

    fclose(file);
    printf("Memory loaded from %s addr: %p size %ld\n", filename, target_address, size );

    uint64_t* memory = (uint64_t*)target_address;
    size_t count = size / sizeof(uint64_t);  // Number of 8-byte chunks

    // Print the data in 8-byte chunks
    // for (size_t i = 0; i < 36; i++) {
    //     printf("0x%016lx\n", memory[i]);
    // }

}


// Maximum size of the decode image, needed to allocate DRAM ont he FPGA
static constexpr uint32_t MaxDecodeSize = 1 << 26; // 64 MiB

int main(int argc, char *argv[]) {

  if (argc != 6) {
    std::cerr << "Usage: " << argv[0] << " <xclbin> <memory dump path> <size of mem> <insn_start> <insn_cnt>" << std::endl;
    std::exit(-1);
  }
  
  std::cout << "Loading device" << std::endl;
  unsigned int deviceIndex = 0;
  auto dev = xrt::device(deviceIndex);
  std::cout << "Loading xclbin from " << argv[1] << std::endl;
  auto xclbin = dev.load_xclbin(argv[1]);
  std::cout << "Creating kernel " << std::endl;
  vta_kernel = xrt::ip(dev, xclbin, "vta_kernel");
  std::cout << "Loading workload  from " << argv[2] << std::endl;
  
  auto xrt_buffer =
      xrt::bo(dev, atoi(argv[3]), xrt::bo::flags::host_only, 7);

  xrt_buffer_host = xrt_buffer.map<uint8_t*>();
  xrt_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);

  fpga_phy_base = xrt_buffer.address();
  printf("XRT mem : xrtbuffer %p, xrt_buffer_host %p\n", (void*)fpga_phy_base, (void*)xrt_buffer_host);

  load_memory_from_file(xrt_buffer_host, atoi(argv[3]), argv[2]);

  int insn_count = atoi(argv[5]);
  char* endptr;
  uint64_t insn_phy_addr = strtoull(argv[4], &endptr, 16);
  printf("insn addr %llx, insn count %d\n", insn_phy_addr, insn_count);
  WriteMappedReg(VTARegs::_0x08, insn_count);
  printf("tick1\n");
  WriteMappedReg(VTARegs::_0x0c, insn_phy_addr & 0xFFFFFFFF);
  printf("tick2\n");
  WriteMappedReg(VTARegs::_0x10, (insn_phy_addr >> 32) & 0xFFFFFFFF);
  printf("tick3\n");
  WriteMappedReg(VTARegs::_0x00, 1);
  printf("tick4\n");

  volatile uint32_t val_0x8 = ReadMappedReg(VTARegs::_0x08);
  printf("val at 0x08 %ld\n", val_0x8);

  volatile uint32_t val_0xc = ReadMappedReg(VTARegs::_0x0c);
  printf("val at 0x0c %x\n", val_0xc);

  volatile uint32_t val_0x10 = ReadMappedReg(VTARegs::_0x10);
  printf("val at 0x10 %x\n", val_0x10);

  volatile uint32_t val=0;
  int cnt = 0;
  while(1) {
    val = ReadMappedReg(VTARegs::_0x00);
    printf("tick 0x00 %d \n", val);
    val &= 0x2;
    if (val == 0x2) break;  // finish
    usleep(1000000);
    cnt ++;
    if(cnt>10){
      break;
    }
  }
  printf("finished \n");
}
