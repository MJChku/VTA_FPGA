#
# Copyright (C) 2019-2021 Xilinx, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#


create_project -force kernel_pack $path_to_tmp_project
# add files to the project
set source_files [glob src_v/*.v src_v/*.sv]
puts $source_files

add_files -norecurse $source_files


update_compile_order -fileset sources_1
update_compile_order -fileset sim_1


ipx::package_project -root_dir $path_to_packaged -vendor epfl.ch -library RTLKernel -taxonomy /KernelIP -import_files -set_current false
ipx::unload_core $path_to_packaged/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $path_to_packaged $path_to_packaged/component.xml

set core [ipx::current_core]

set_property core_revision 2 $core
foreach up [ipx::get_user_parameters] {
  ipx::remove_user_parameter [get_property NAME $up] $core
}

# set_property sdx_kernel true [ipx::current_core]
# set_property sdx_kernel_type rtl [ipx::current_core]
# set_property ipi_drc {ignore_freq_hz true} [ipx::current_core]
# set_property vitis_drc {ctrl_protocol user_managed} [ipx::current_core]

ipx::associate_bus_interfaces -busif m_axi_gmem -clock ap_clk $core -reset ap_rst_n
ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk $core -reset ap_rst_n

set mem_map    [::ipx::add_memory_map -quiet "s_axi_control" $core]
set addr_block [::ipx::add_address_block -quiet "reg0" $mem_map]

set reg      [::ipx::add_register "CTRL" $addr_block]
  set_property description    "Control signals"    $reg
  set_property address_offset 0x000 $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property size           32    $reg

set reg      [::ipx::add_register -quiet "b" $addr_block]
  set_property address_offset 0x004 $reg
  set_property size           32   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem $regparam

set reg      [::ipx::add_register -quiet "c" $addr_block]
  set_property ACCESS {read-write} $reg
  set_property address_offset 0x008 $reg
  set_property size           32   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem $regparam

set reg      [::ipx::add_register -quiet "d" $addr_block]
  set_property ACCESS {read-write} $reg
  set_property address_offset 0x00c $reg
  set_property size           32   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem $regparam

set reg      [::ipx::add_register -quiet "e" $addr_block]
  set_property ACCESS {read-write} $reg
  set_property address_offset 0x010 $reg
  set_property size           32   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg]
  set_property value m_axi_gmem $regparam

set_property slave_memory_map_ref "s_axi_control" [::ipx::get_bus_interfaces -of $core "s_axi_control"]

set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
set_property sdx_kernel true $core
set_property sdx_kernel_type rtl $core
set_property supported_families { } $core
set_property auto_family_support_level level_2 $core
ipx::create_xgui_files $core
ipx::update_checksums $core
ipx::check_integrity -kernel $core
ipx::save_core $core
close_project -delete