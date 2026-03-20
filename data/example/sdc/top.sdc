
create_clock -name clk -period 100 -waveform {0 50} [get_ports "CK"]

set_input_delay 0.01 [all_inputs] -clock [get_clocks "clk"]
set_output_delay 0.01 [all_outputs] -clock [get_clocks "clk"]