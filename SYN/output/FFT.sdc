###################################################################

# Created by write_sdc on Sat Jan  1 11:36:54 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max WCCOM -max_library                               \
fsc0h_d_generic_core_ss1p08v125c\
                         -min BCCOM -min_library                               \
fsc0h_d_generic_core_ff1p32vm40c
set_wire_load_model -name G5K -library fsc0h_d_generic_core_ss1p08v125c
set_max_area 0
set_load -pin_load 1 [get_ports out_valid]
set_load -pin_load 1 [get_ports {dout_r[15]}]
set_load -pin_load 1 [get_ports {dout_r[14]}]
set_load -pin_load 1 [get_ports {dout_r[13]}]
set_load -pin_load 1 [get_ports {dout_r[12]}]
set_load -pin_load 1 [get_ports {dout_r[11]}]
set_load -pin_load 1 [get_ports {dout_r[10]}]
set_load -pin_load 1 [get_ports {dout_r[9]}]
set_load -pin_load 1 [get_ports {dout_r[8]}]
set_load -pin_load 1 [get_ports {dout_r[7]}]
set_load -pin_load 1 [get_ports {dout_r[6]}]
set_load -pin_load 1 [get_ports {dout_r[5]}]
set_load -pin_load 1 [get_ports {dout_r[4]}]
set_load -pin_load 1 [get_ports {dout_r[3]}]
set_load -pin_load 1 [get_ports {dout_r[2]}]
set_load -pin_load 1 [get_ports {dout_r[1]}]
set_load -pin_load 1 [get_ports {dout_r[0]}]
set_load -pin_load 1 [get_ports {dout_i[15]}]
set_load -pin_load 1 [get_ports {dout_i[14]}]
set_load -pin_load 1 [get_ports {dout_i[13]}]
set_load -pin_load 1 [get_ports {dout_i[12]}]
set_load -pin_load 1 [get_ports {dout_i[11]}]
set_load -pin_load 1 [get_ports {dout_i[10]}]
set_load -pin_load 1 [get_ports {dout_i[9]}]
set_load -pin_load 1 [get_ports {dout_i[8]}]
set_load -pin_load 1 [get_ports {dout_i[7]}]
set_load -pin_load 1 [get_ports {dout_i[6]}]
set_load -pin_load 1 [get_ports {dout_i[5]}]
set_load -pin_load 1 [get_ports {dout_i[4]}]
set_load -pin_load 1 [get_ports {dout_i[3]}]
set_load -pin_load 1 [get_ports {dout_i[2]}]
set_load -pin_load 1 [get_ports {dout_i[1]}]
set_load -pin_load 1 [get_ports {dout_i[0]}]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_latency 0.5  [get_clocks clk]
set_clock_uncertainty 0.1  [get_clocks clk]
group_path -name INOUT  -from [list [get_ports clk] [get_ports rst_n] [get_ports in_valid] [get_ports \
{din_r[11]}] [get_ports {din_r[10]}] [get_ports {din_r[9]}] [get_ports         \
{din_r[8]}] [get_ports {din_r[7]}] [get_ports {din_r[6]}] [get_ports           \
{din_r[5]}] [get_ports {din_r[4]}] [get_ports {din_r[3]}] [get_ports           \
{din_r[2]}] [get_ports {din_r[1]}] [get_ports {din_r[0]}] [get_ports           \
{din_i[11]}] [get_ports {din_i[10]}] [get_ports {din_i[9]}] [get_ports         \
{din_i[8]}] [get_ports {din_i[7]}] [get_ports {din_i[6]}] [get_ports           \
{din_i[5]}] [get_ports {din_i[4]}] [get_ports {din_i[3]}] [get_ports           \
{din_i[2]}] [get_ports {din_i[1]}] [get_ports {din_i[0]}]]  -to [list [get_ports out_valid] [get_ports {dout_r[15]}] [get_ports           \
{dout_r[14]}] [get_ports {dout_r[13]}] [get_ports {dout_r[12]}] [get_ports     \
{dout_r[11]}] [get_ports {dout_r[10]}] [get_ports {dout_r[9]}] [get_ports      \
{dout_r[8]}] [get_ports {dout_r[7]}] [get_ports {dout_r[6]}] [get_ports        \
{dout_r[5]}] [get_ports {dout_r[4]}] [get_ports {dout_r[3]}] [get_ports        \
{dout_r[2]}] [get_ports {dout_r[1]}] [get_ports {dout_r[0]}] [get_ports        \
{dout_i[15]}] [get_ports {dout_i[14]}] [get_ports {dout_i[13]}] [get_ports     \
{dout_i[12]}] [get_ports {dout_i[11]}] [get_ports {dout_i[10]}] [get_ports     \
{dout_i[9]}] [get_ports {dout_i[8]}] [get_ports {dout_i[7]}] [get_ports        \
{dout_i[6]}] [get_ports {dout_i[5]}] [get_ports {dout_i[4]}] [get_ports        \
{dout_i[3]}] [get_ports {dout_i[2]}] [get_ports {dout_i[1]}] [get_ports        \
{dout_i[0]}]]
group_path -name INREG  -from [list [get_ports rst_n] [get_ports in_valid] [get_ports {din_r[11]}]    \
[get_ports {din_r[10]}] [get_ports {din_r[9]}] [get_ports {din_r[8]}]          \
[get_ports {din_r[7]}] [get_ports {din_r[6]}] [get_ports {din_r[5]}]           \
[get_ports {din_r[4]}] [get_ports {din_r[3]}] [get_ports {din_r[2]}]           \
[get_ports {din_r[1]}] [get_ports {din_r[0]}] [get_ports {din_i[11]}]          \
[get_ports {din_i[10]}] [get_ports {din_i[9]}] [get_ports {din_i[8]}]          \
[get_ports {din_i[7]}] [get_ports {din_i[6]}] [get_ports {din_i[5]}]           \
[get_ports {din_i[4]}] [get_ports {din_i[3]}] [get_ports {din_i[2]}]           \
[get_ports {din_i[1]}] [get_ports {din_i[0]}]]
group_path -name INREG  -from [get_ports clk]
group_path -name REGOUT  -to [list [get_ports out_valid] [get_ports {dout_r[15]}] [get_ports           \
{dout_r[14]}] [get_ports {dout_r[13]}] [get_ports {dout_r[12]}] [get_ports     \
{dout_r[11]}] [get_ports {dout_r[10]}] [get_ports {dout_r[9]}] [get_ports      \
{dout_r[8]}] [get_ports {dout_r[7]}] [get_ports {dout_r[6]}] [get_ports        \
{dout_r[5]}] [get_ports {dout_r[4]}] [get_ports {dout_r[3]}] [get_ports        \
{dout_r[2]}] [get_ports {dout_r[1]}] [get_ports {dout_r[0]}] [get_ports        \
{dout_i[15]}] [get_ports {dout_i[14]}] [get_ports {dout_i[13]}] [get_ports     \
{dout_i[12]}] [get_ports {dout_i[11]}] [get_ports {dout_i[10]}] [get_ports     \
{dout_i[9]}] [get_ports {dout_i[8]}] [get_ports {dout_i[7]}] [get_ports        \
{dout_i[6]}] [get_ports {dout_i[5]}] [get_ports {dout_i[4]}] [get_ports        \
{dout_i[3]}] [get_ports {dout_i[2]}] [get_ports {dout_i[1]}] [get_ports        \
{dout_i[0]}]]
set_false_path -hold   -from [list [get_ports rst_n] [get_ports in_valid] [get_ports {din_r[11]}]    \
[get_ports {din_r[10]}] [get_ports {din_r[9]}] [get_ports {din_r[8]}]          \
[get_ports {din_r[7]}] [get_ports {din_r[6]}] [get_ports {din_r[5]}]           \
[get_ports {din_r[4]}] [get_ports {din_r[3]}] [get_ports {din_r[2]}]           \
[get_ports {din_r[1]}] [get_ports {din_r[0]}] [get_ports {din_i[11]}]          \
[get_ports {din_i[10]}] [get_ports {din_i[9]}] [get_ports {din_i[8]}]          \
[get_ports {din_i[7]}] [get_ports {din_i[6]}] [get_ports {din_i[5]}]           \
[get_ports {din_i[4]}] [get_ports {din_i[3]}] [get_ports {din_i[2]}]           \
[get_ports {din_i[1]}] [get_ports {din_i[0]}]]
set_false_path -hold   -to [list [get_ports out_valid] [get_ports {dout_r[15]}] [get_ports           \
{dout_r[14]}] [get_ports {dout_r[13]}] [get_ports {dout_r[12]}] [get_ports     \
{dout_r[11]}] [get_ports {dout_r[10]}] [get_ports {dout_r[9]}] [get_ports      \
{dout_r[8]}] [get_ports {dout_r[7]}] [get_ports {dout_r[6]}] [get_ports        \
{dout_r[5]}] [get_ports {dout_r[4]}] [get_ports {dout_r[3]}] [get_ports        \
{dout_r[2]}] [get_ports {dout_r[1]}] [get_ports {dout_r[0]}] [get_ports        \
{dout_i[15]}] [get_ports {dout_i[14]}] [get_ports {dout_i[13]}] [get_ports     \
{dout_i[12]}] [get_ports {dout_i[11]}] [get_ports {dout_i[10]}] [get_ports     \
{dout_i[9]}] [get_ports {dout_i[8]}] [get_ports {dout_i[7]}] [get_ports        \
{dout_i[6]}] [get_ports {dout_i[5]}] [get_ports {dout_i[4]}] [get_ports        \
{dout_i[3]}] [get_ports {dout_i[2]}] [get_ports {dout_i[1]}] [get_ports        \
{dout_i[0]}]]
set_input_delay -clock clk  -max 5  [get_ports rst_n]
set_input_delay -clock clk  -max 5  [get_ports in_valid]
set_input_delay -clock clk  -max 5  [get_ports {din_r[11]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[10]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[9]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[8]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[7]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[6]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[5]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[4]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[3]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[2]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[1]}]
set_input_delay -clock clk  -max 5  [get_ports {din_r[0]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[11]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[10]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[9]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[8]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[7]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[6]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[5]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[4]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[3]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[2]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[1]}]
set_input_delay -clock clk  -max 5  [get_ports {din_i[0]}]
set_output_delay -clock clk  -max 5  [get_ports out_valid]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[15]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[14]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[13]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[12]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[11]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[10]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[9]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[8]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[7]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[6]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[5]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[4]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[3]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[2]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[1]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_r[0]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[15]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[14]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[13]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[12]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[11]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[10]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[9]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[8]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[7]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[6]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[5]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[4]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[3]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[2]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[1]}]
set_output_delay -clock clk  -max 5  [get_ports {dout_i[0]}]
set_drive 1  [get_ports clk]
set_drive 1  [get_ports rst_n]
set_drive 1  [get_ports in_valid]
set_drive 1  [get_ports {din_r[11]}]
set_drive 1  [get_ports {din_r[10]}]
set_drive 1  [get_ports {din_r[9]}]
set_drive 1  [get_ports {din_r[8]}]
set_drive 1  [get_ports {din_r[7]}]
set_drive 1  [get_ports {din_r[6]}]
set_drive 1  [get_ports {din_r[5]}]
set_drive 1  [get_ports {din_r[4]}]
set_drive 1  [get_ports {din_r[3]}]
set_drive 1  [get_ports {din_r[2]}]
set_drive 1  [get_ports {din_r[1]}]
set_drive 1  [get_ports {din_r[0]}]
set_drive 1  [get_ports {din_i[11]}]
set_drive 1  [get_ports {din_i[10]}]
set_drive 1  [get_ports {din_i[9]}]
set_drive 1  [get_ports {din_i[8]}]
set_drive 1  [get_ports {din_i[7]}]
set_drive 1  [get_ports {din_i[6]}]
set_drive 1  [get_ports {din_i[5]}]
set_drive 1  [get_ports {din_i[4]}]
set_drive 1  [get_ports {din_i[3]}]
set_drive 1  [get_ports {din_i[2]}]
set_drive 1  [get_ports {din_i[1]}]
set_drive 1  [get_ports {din_i[0]}]
