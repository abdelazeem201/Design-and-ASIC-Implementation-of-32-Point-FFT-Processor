create_clock -name clk -period 10 -waveform {0 5} [get_ports clk]
set_input_delay -max 5 -clock [get_clocks clk] [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay -max 5 -clock [get_clocks clk] [all_outputs]
set_clock_uncertainty 0.1 [get_clocks clk]
set_clock_latency 0.5 [get_clocks clk]
set_false_path -hold -from [remove_from_collection [all_inputs] [get_ports clk]]
set_false_path -hold -to [all_outputs]
set_fix_hold [get_clocks clk]
set_dont_touch_network [get_ports clk]
set_drive 1 [all_inputs]
set_load  1 [all_outputs]

group_path -name INREG -from [all_inputs] 
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

set_fix_multiple_port_nets -all -buffer_constants

set_operating_conditions -min_library fsc0h_d_generic_core_ff1p32vm40c -min BCCOM -max_library fsc0h_d_generic_core_ss1p08v125c -max WCCOM
set_wire_load_model -name G5K -library fsc0h_d_generic_core_ss1p08v125c

set_max_area 0
set_boundary_optimization {"*"}

