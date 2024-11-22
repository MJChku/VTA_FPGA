*TVM setup*

set VERILATOR_INC_DIR to a random path if you don't have verilator
- in <TVM_PATH>/build/CMakeFiles/vta_tsim.dir/flags.make 
    Add `-I/opt/xilinx/xrt/include` to CXX_INCLUDES
- in <TVM_PATH>/build/CMakeFiles/vta_tsim.dir/link.txt
    Add `-Wl,--no-as-needed  -L/opt/xilinx/xrt/lib -lxrt_coreutil -Wl,-rpath,/opt/xilinx/xrt/lib` right after `-fPIC` 
Make again

*VTA setup*
replace tsim_driver.cc with the one is the repo