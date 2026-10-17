# *****************************************************************************************
# Portable Vivado Project Creator - Pattern Detector
# *****************************************************************************************

set origin_dir "."
set proj_name "Pattern_Detector_Project"

# Δημιουργία του Project
create_project -force $proj_name ./${proj_name} -part xc7z010clg400-1
set_property board_part digilentinc.com:zybo:part0:2.0 [current_project]

# Εισαγωγή αρχείων VHDL από τον φάκελο src (Κώδικας & Testbench)
add_files -norecurse [glob ${origin_dir}/../src/*.vhd]

# Ενεργοποίηση VHDL-2008 για το process(all)
set_property file_type {VHDL 2008} [get_files *.vhd]

# Ορισμός Top Modules
set_property top Pattern_Detector [current_fileset]
set_property top Pattern_Detector_tb [get_filesets sim_1]

puts "INFO: Project created successfully! VHDL-2008 is enabled."
