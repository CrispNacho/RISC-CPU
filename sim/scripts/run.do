# ModelSim Simulation Script (do file)



# Clean up any existing work library
if [file exists work] {
    vdel -all -lib work
}

# Create a new work library
vlib work
vmap work work

# Compile the design files
echo "Compiling fsm.sv..."
vlog -sv ../../rtl/fsm.sv

echo "Compiling fsm.sv..."
vlog -sv ../tb/fsm_tb.sv




# Load the testbench module
echo "Starting simulation..."
vsim -gui work.fsm_tb

# Add signals to waveform
add wave -position insertpoint \
    sim:/fsm_tb/CLK \
    sim:/fsm_tb/RST \
    sim:/fsm_tb/DIN \
    sim:/fsm_tb/PTRN \
    sim:/fsm_tb/DUT/dout \
    sim:/fsm_tb/DUT/cnt \
    sim:/fsm_tb/DUT/bits \
    sim:/fsm_tb/DUT/pattern



# Run the simulation
run -all

# View the wave window - keep GUI open
wave zoom full
puts "Simulation complete. Close the window when done."