# check that the work lib exists and delete it for a clean new simulation
if [file exists work] {vdel -lib work -all} 

# create the work lib
vlib work 

# compile all the verilog files
vlog -l vlog.log ./*.v

# open simuation in questa GUI window with no verilog optimization
vsim -gui -voptargs=+acc -l vsim.log work.testbench

# load waves
do wave.do

# run simulation
run 1000ns