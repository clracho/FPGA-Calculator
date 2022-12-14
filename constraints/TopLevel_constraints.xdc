## Switches
set_property PACKAGE_PIN V17 [get_ports {bit_input[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[0]}]
set_property PACKAGE_PIN V16 [get_ports {bit_input[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[1]}]
set_property PACKAGE_PIN W16 [get_ports {bit_input[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[2]}]
set_property PACKAGE_PIN W17 [get_ports {bit_input[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[3]}]
set_property PACKAGE_PIN W15 [get_ports {bit_input[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[4]}]
set_property PACKAGE_PIN V15 [get_ports {bit_input[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[5]}]
set_property PACKAGE_PIN W14 [get_ports {bit_input[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[6]}]
set_property PACKAGE_PIN W13 [get_ports {bit_input[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[7]}]
set_property PACKAGE_PIN V2 [get_ports {bit_input[8]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[8]}]
set_property PACKAGE_PIN T3 [get_ports {bit_input[9]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[9]}]
set_property PACKAGE_PIN T2 [get_ports {bit_input[10]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[10]}]
set_property PACKAGE_PIN R3 [get_ports {bit_input[11]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[11]}]
set_property PACKAGE_PIN W2 [get_ports {bit_input[12]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[12]}]
set_property PACKAGE_PIN U1 [get_ports {bit_input[13]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[13]}]
set_property PACKAGE_PIN T1 [get_ports {bit_input[14]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[14]}]
set_property PACKAGE_PIN R2 [get_ports {bit_input[15]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {bit_input[15]}]
	
# CLOCK
set_property PACKAGE_PIN W5 [get_ports clk] 
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 1000000.00 -waveform {0 5} [get_ports clk] 

# SEVEN SEGMENT DISPLAY
set_property PACKAGE_PIN W7 [get_ports {CA}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CA}]
set_property PACKAGE_PIN W6 [get_ports {CB}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CB}]
set_property PACKAGE_PIN U8 [get_ports {CC}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CC}]
set_property PACKAGE_PIN V8 [get_ports {CD}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CD}]
set_property PACKAGE_PIN U5 [get_ports {CE}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CE}]
set_property PACKAGE_PIN V5 [get_ports {CF}]
	set_property IOSTANDARD LVCMOS33 [get_ports {CF}]
set_property PACKAGE_PIN U7 [get_ports {CG}]
    	set_property IOSTANDARD LVCMOS33 [get_ports {CG}]

set_property PACKAGE_PIN V7 [get_ports dp_out]
	set_property IOSTANDARD LVCMOS33 [get_ports dp_out]

set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]

#BUTTONS
set_property PACKAGE_PIN U18 [get_ports b_mid_select]
	set_property IOSTANDARD LVCMOS33 [get_ports b_mid_select]
set_property PACKAGE_PIN T18 [get_ports b_up_add]
	set_property IOSTANDARD LVCMOS33 [get_ports b_up_add]
set_property PACKAGE_PIN W19 [get_ports b_left_subtract]
	set_property IOSTANDARD LVCMOS33 [get_ports b_left_subtract]
set_property PACKAGE_PIN T17 [get_ports b_right_multiply]
	set_property IOSTANDARD LVCMOS33 [get_ports b_right_multiply]
set_property PACKAGE_PIN U17 [get_ports b_down_square]
	set_property IOSTANDARD LVCMOS33 [get_ports b_down_square]
	
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]