# Copyright (C) 2023  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: prj.tcl
# Generated on: Mon May 13 00:55:22 2024

# Load Quartus Prime Tcl Project package
package require ::quartus::project

project_new "COUNTER" -overwrite

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "COUNTER"]} {
		puts "Project COUNTER is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists COUNTER]} {
		project_open -revision COUNTER COUNTER
	} else {
		project_new -revision COUNTER COUNTER
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name DEVICE 10M50DAF484C7G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 23.1STD.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "00:17:07  MAY 13, 2024"
	set_global_assignment -name LAST_QUARTUS_VERSION "23.1std.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name EDA_SIMULATION_TOOL "Questa Intel FPGA (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name VERILOG_FILE states.v
	set_global_assignment -name VERILOG_FILE counter.v
	set_global_assignment -name VERILOG_FILE clk_divider.v
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	set_location_assignment PIN_P11 -to clk
	set_location_assignment PIN_A8 -to counter_in_binary[0]
	set_location_assignment PIN_A9 -to counter_in_binary[1]
	set_location_assignment PIN_A10 -to counter_in_binary[2]
	set_location_assignment PIN_B10 -to counter_in_binary[3]
	set_location_assignment PIN_C10 -to enable
	set_location_assignment PIN_C11 -to reset

	# Including default assignments
	set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_REPORT_WORST_CASE_TIMING_PATHS OFF -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_CCPP_TRADEOFF_TOLERANCE 0 -family "MAX 10"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "MAX 10"
	set_global_assignment -name TIMING_ANALYZER_DO_CCPP_REMOVAL ON -family "MAX 10"
	set_global_assignment -name DISABLE_LEGACY_TIMING_ANALYZER OFF -family "MAX 10"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "MAX 10"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2 -family "MAX 10"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "MAX 10"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "MAX 10"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "MAX 10"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "MAX 10"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF -family "MAX 10"
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON -family "MAX 10"
	set_global_assignment -name ENABLE_OCT_DONE ON -family "MAX 10"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
	
	load_package flow
	execute_flow -compile
}
