# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./TXDriver.sv"
vlog "./Pulser.sv"
vlog "./ROM.v"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -L altera_mf_ver -t 1ps -lib work TXDriver_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do wave_TXDriver.do

# Set the window types
view wave

# Run the simulation
run -all

# End
