set design FFT

set_app_var search_path "/home/IC/Desktop/Abdelazeem/Technology_Library/UMC130nm/lib/StdCell"

set_app_var link_library "* fsc0h_d_generic_core_ss1p08v125c.db fsc0h_d_generic_core_ff1p32vm40c.db"
set_app_var target_library "fsc0h_d_generic_core_ss1p08v125c.db"

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work


analyze -library work -format verilog ../rtl/${design}.v
elaborate $design -lib work
current_design 
uniquify

check_design
source ./cons/cons.tcl
link
compile -map_effort medium
optimize_registers
compile_ultra

report_area > ./report/synth_area.rpt
report_cell > ./report/synth_cells.rpt
report_qor  > ./report/synth_qor.rpt
report_resources > ./report/synth_resources.rpt
report_timing -max_paths 10 > ./report/synth_timing.rpt 
 
write_sdc  output/${design}.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output/${design}.v 
write -f ddc -hierarchy -output output/${design}.ddc   
write_sdf -version 2.1 -context verilog output/${design}.sdf
exit
