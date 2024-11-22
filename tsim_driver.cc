/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#include <bits/stdint-uintn.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/time.h>
#include <vta/hw_spec.h>
#include <tvm/runtime/registry.h>
#include <type_traits>
#include <assert.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <stdlib.h>
#include <tvm/runtime/module.h>
#include <tvm/runtime/registry.h>
#include <vta/driver.h>
#include "../vmem/virtual_memory.h"

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
#include <pthread.h>

bool loaded = 0;
xrt::device dev;
xrt::ip vta_kernel;
// Global buffers
xrt::bo xrt_buffer;
// Pointers to the mapped host buffers
uint8_t* xrt_buffer_host;

uint64_t fpga_phy_base;

uint64_t written_offset=0;

void dump_memory_to_file(void* address, size_t size, const char* filename) {
    FILE* file = fopen(filename, "wb");
    if (!file) {
        perror("File opening failed");
        return;
    }
    fwrite(address, 1, size, file);
    fclose(file);
    printf("Memory dumped to %s size : %lu\n", filename, size);
}

void WriteMappedReg(uint32_t reg, uint32_t val) {
  vta_kernel.write_register(reg, val);
}

uint32_t ReadMappedReg(uint32_t reg) {
  return vta_kernel.read_register(reg);
}

void custom_sleep(volatile uint64_t sl_time){
  usleep(sl_time/1000);
}

static int alloc_fd;
static void *alloc_base = nullptr;
static uint64_t alloc_phys_base = 1ULL * 1024 * 1024 * 1024;
static size_t alloc_size = 512 * 1024 * 1024;
static size_t alloc_off = 0;

#define XCLBINPATH "/home/alveo/vta_fpga/build/vta_kernel_hw_xilinx_u200_gen3x16_xdma_2_202110_1.xclbin"

static constexpr uint32_t MaxVTASize = 512 * 1024 * 1024;

static void alloc_init()
{
  if (alloc_base) {
    return;
  }

  printf("xrt-pic: alloc init \n");
  std::cout << "Loading device" << std::endl;
  unsigned int deviceIndex = 0;
  dev = xrt::device(deviceIndex);
  std::cout << "Loading xclbin from " << XCLBINPATH << std::endl;
  auto xclbin = dev.load_xclbin(XCLBINPATH);
  std::cout << "Creating kernel " << std::endl;
  vta_kernel = xrt::ip(dev, xclbin, "vta_kernel");
  xrt_buffer =
      xrt::bo(dev, MaxVTASize, xrt::bo::flags::host_only, 7);
  xrt_buffer_host = xrt_buffer.map<uint8_t*>();
  xrt_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  fpga_phy_base = xrt_buffer.address();

  printf("xrt-pci mem: xrt_buffer %p, xrt_buffer_host %p\n", (void*)fpga_phy_base, (void*)xrt_buffer_host);
  alloc_base = (void*) xrt_buffer_host;
}

namespace vta {
namespace tsim {

#define VTA 1

uintptr_t driver_initialize(int type){

  return 0;
}

typedef struct VTARegs {
  static constexpr uint32_t _0x00 = 0x00;
  static constexpr uint32_t _0x04 = 0x04;
  static constexpr uint32_t _0x08 = 0x08;
  static constexpr uint32_t _0x0c = 0x0c; 
  static constexpr uint32_t _0x10 = 0x10; 
};

void initialize_vta(void) {
  printf("initialize vta\n");
  return;  
}

using tvm::runtime::Module;

class Profiler {
 public:
  Profiler() {
    counters_ = new int[num_counters_];
    this->ClearAll();
  }

  ~Profiler() {
    delete [] counters_;
  }

  /*! \brief update one event counter */
  void Update(uint32_t idx, uint32_t value) {
    counters_[idx] += value;
    printf("Update counter %d value %d \n", idx, counters_[idx]);

  }

  /*! \brief clear one event counter*/
  void Clear(uint32_t idx) {
    printf(" Clear counter %d \n", idx);
    counters_[idx] = 0;
  }

  /*! \brief clear all event counters */
  void ClearAll() {
    printf(" Clear All \n");
    for (uint32_t i = 0; i < num_counters_; i++) {
      counters_[i] = 0;
    }
  }

  /*! \brief return counters as json */
  std::string AsJSON() {
    printf(" AS JSON cycle_count %d \n", counters_[0]);
    std::ostringstream os;
    os << "{\n"
       << " \"cycle_count\":" << counters_[0] << "\n"
       <<"}\n";
    return os.str();
  }

  std::string Cycles() {
    std::ostringstream os;
    os << counters_[0];
    return os.str();
  }

  static Profiler* Global() {
    static Profiler inst;
    return &inst;
  }

 private:
  /*! \brief total number of event counters */
  uint32_t num_counters_{1};
  /*! \brief event counters */
  int* counters_{nullptr};
};

class Device {
 public:
  Device() {
    alloc_off = 0;
    prof_ = Profiler::Global();
  }

  int Run(vta_phy_addr_t insn_phy_addr,
          uint32_t insn_count,
          uint32_t wait_cycles) {

    this->Init();
    this->Launch(insn_phy_addr,
                 insn_count,
                 wait_cycles);
    this->WaitForCompletion(wait_cycles);
    return 0;
  }

 private:
  void Init() {
    // initialize vta
    initialize_vta();
  }

  void Launch(vta_phy_addr_t insn_phy_addr,
              uint32_t insn_count,
              uint32_t wait_cycles) {

    // dump memory can then be used as a test case
    // dump_memory_to_file(alloc_base, written_offset - (uint64_t)alloc_base, "vtatest_file");

    printf("@driver insn_count %d, addr %p, sizeof(vta_phy_addr_t) %d\n", insn_count, insn_phy_addr, sizeof(vta_phy_addr_t));
    WriteMappedReg(VTARegs::_0x08, insn_count);
    WriteMappedReg(VTARegs::_0x0c, insn_phy_addr & 0xFFFFFFFF);
    WriteMappedReg(VTARegs::_0x10, (insn_phy_addr >> 32) & 0xFFFFFFFF);
    WriteMappedReg(VTARegs::_0x00, 1);
  }

   void WaitForCompletion(uint32_t wait_cycles) {

    volatile uint32_t val;
    volatile int cnt=0;
    while(1) {
      val = ReadMappedReg(VTARegs::_0x00);
      printf("val %d  \n", val);
      val &= 0x2;
      if (val == 0x2) break;  // finish
      usleep(10000);
    }
    // this is useless
    xrt_buffer.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
  }

  Profiler* prof_;
};

using tvm::runtime::TVMRetValue;
using tvm::runtime::TVMArgs;

TVM_REGISTER_GLOBAL("vta.tsim.init")
.set_body([](TVMArgs args, TVMRetValue* rv) {
    Module m = args[0];
  });

TVM_REGISTER_GLOBAL("vta.tsim.profiler_clear")
.set_body([](TVMArgs args, TVMRetValue* rv) {
    Profiler::Global()->ClearAll();
  });

TVM_REGISTER_GLOBAL("vta.tsim.profiler_status")
.set_body([](TVMArgs args, TVMRetValue* rv) {
    *rv = Profiler::Global()->AsJSON();
  });

}  // namespace tsim
}  // namespace vta

//return virtual addr
void* VTAMemAlloc(size_t size, int cached) {
  std::cerr << "xrt-pci: VTAMemAlloc(" << size << ")" << std::endl;
  alloc_init();

  // align to 4KB
  size = (size & ~(0xFFF)) + 4096;
  assert (alloc_off + size <= alloc_size);
  void *addr = (void *) ((uint8_t *) alloc_base + alloc_off);
  alloc_off += size;
  std::cerr << "xrt-pci:    = " << alloc_base << " now:"<< addr << " end:" << alloc_base + alloc_size << std::endl;
  return addr;
}

// this is fpga physical offset, not real physical address, should be added with the base physical address
vta_phy_addr_t VTAMemGetPhyAddr(void* buf) {
    return ((uintptr_t) buf - (uintptr_t) alloc_base);
}

void VTAMemFree(void* buf) {
}

// dst is  virtual addr
void VTAMemCopyFromHost(void* dst, const void* src, size_t size) {
  printf("VTA Mem Copy From Host, size %lu, dst %p, src %p \n", size, dst, src);
  fflush(stdout);

  memcpy(dst, src, size);
  if( (uint64_t)dst+size > written_offset){
    written_offset = (uint64_t)dst+size;
  }
  xrt_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  printf("Copy done\n");
  fflush(stdout);
}

// dst is  virtual addr
void VTAMemCopyToHost(void* dst, const void* src, size_t size) {
  printf("VTA Mem Copy To Host, size %lu, dst %p, src %p, xrt %p \n", size, dst, src, xrt_buffer_host);
  fflush(stdout);
  memcpy(dst, src, size);
}

void VTAFlushCache(void* vir_addr, vta_phy_addr_t phy_addr, int size) {
}

void VTAInvalidateCache(void* vir_addr, vta_phy_addr_t phy_addr, int size) {
}

VTADeviceHandle VTADeviceAlloc() {
  return new vta::tsim::Device();
}

void VTADeviceFree(VTADeviceHandle handle) {
  delete static_cast<vta::tsim::Device*>(handle);
}


int VTADeviceRun(VTADeviceHandle handle,
                 vta_phy_addr_t insn_phy_addr,
                 uint32_t insn_count,
                 uint32_t wait_cycles) {
  return static_cast<vta::tsim::Device*>(handle)->Run(
      insn_phy_addr,
      insn_count,
      wait_cycles);
}