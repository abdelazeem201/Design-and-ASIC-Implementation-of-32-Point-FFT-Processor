# Version:1.0 MMMC View Definition File
# Do Not Remove Above Line
create_rc_corner -name FF -T {-40} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_rc_corner -name SS -T {125} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_op_cond -name WCCOM -library_file {../UMC130nm/lib/StdCell/fsc0h_d_generic_core_ss1p08v125c.lib} -P {1} -V {1.08} -T {125}
create_op_cond -name BCCOM -library_file {../UMC130nm/lib/StdCell/fsc0h_d_generic_core_ff1p32vm40c.lib} -P {1.0} -V {1.32} -T {-40}
create_library_set -name FF -timing {../UMC130nm/lib/StdCell/fsc0h_d_generic_core_ff1p32vm40c.lib ../UMC130nm/lib/IO/foc0h_a33_t33_generic_io_ff1p32vm40c.lib}
create_library_set -name SS -timing {../UMC130nm/lib/StdCell/fsc0h_d_generic_core_ss1p08v125c.lib ../UMC130nm/lib/IO/foc0h_a33_t33_generic_io_ss1p08v125c.lib}
create_constraint_mode -name FFT -sdc_files {../syn/output/FFT.sdc}
create_delay_corner -name FF -library_set {FF} -opcond_library {/home/abdelhay_ali/Desktop/Abdelazeem/FFT_Processor/UMC130nm/lib/StdCell/fsc0h_d_generic_core_ff1p32vm40c.lib} -opcond {BCCOM} -rc_corner {FF}
create_delay_corner -name SS -library_set {SS} -opcond_library {/home/abdelhay_ali/Desktop/Abdelazeem/FFT_Processor/UMC130nm/lib/StdCell/fsc0h_d_generic_core_ss1p08v125c.lib} -opcond {WCCOM} -rc_corner {SS}
create_analysis_view -name FF -constraint_mode {FFT} -delay_corner {FF}
create_analysis_view -name SS -constraint_mode {FFT} -delay_corner {SS}
set_analysis_view -setup {SS} -hold {FF}
