# ModelSim Simulation Script (do file)



# Clean up any existing work library
if [file exists work] {
    vdel -all -lib work
}

# Create a new work library
vlib work
vmap work work

# Compile the design files
echo "Compiling alu.sv..."
vlog -sv ../../rtl/alu.sv
echo "Compiling cpu.sv..."
vlog -sv ../../rtl/cpu.sv
echo "Compiling decoder.sv..."
vlog -sv ../../rtl/decoder.sv

echo "Compiling cpu_tb.sv..."
vlog -sv ../tb/cpu_tb.sv



# Load the testbench module
echo "Starting simulation..."
vsim -gui work.cpu_tb

# Add signals to waveform
add wave -position insertpoint \
    sim:/cpu_tb/CLK \
    sim:/cpu_tb/RST 


# Run the simulation
run -all

# View the wave window - keep GUI open
wave zoom full
puts "Simulation complete. Close the window when done."