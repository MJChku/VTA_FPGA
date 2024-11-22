if { $::argc != 6 } {
    puts "ERROR: Program \"$::argv0\" requires 6 arguments!\n"
    puts "Usage: $::argv0 <xoname> <krnl_name> <target> <device> <package_dir> <temp_dir>\n"
    exit
}

set xoname    [lindex $::argv 0]
set krnl_name [lindex $::argv 1]
set target    [lindex $::argv 2]
set device    [lindex $::argv 3]

set suffix "${krnl_name}_${target}_${device}"
set path_to_packaged [lindex $::argv 4]
set path_to_tmp_project [lindex $::argv 5]

source scripts/package_kernel.tcl

if {[file exists "${xoname}"]} {
    file delete -force "${xoname}"
}

package_xo -xo_path ${xoname} -kernel_name ${krnl_name} -ip_directory ${path_to_packaged}