# Verilog Project with ModelSim

RISCV 32 bit cpu architecture

## Project Contents

- **alu.sv** - A simple 8-bit counter module
- **simulate.do** - ModelSim do file for compilation and simulation

## Quick Start

### Option 1: Run from ModelSim GUI

1. Open ModelSim
2. Change to this project directory
3. At the ModelSim prompt, run:
   ```
   do simulate.do
   ```

### Option 2: Run from Command Line

```bash
cd "c:\Users\Evanc\Dev\Test verilog project"
vsim -do simulate.do -c
```

For GUI simulation:
```bash
vsim -do simulate.do -gui
```

## How It Works

1. The do file creates a work library
2. Both `.sv` files are compiled with `vlog`
3. The testbench is loaded and simulation runs
4. Waveforms are captured and displayed

## Customization

- **Modify `counter.sv`** - Replace with your own module
- **Modify `counter_tb.sv`** - Create your own test cases
- **Update `simulate.do`** - Change filenames and add more signal tracing

## Module Description

The counter module:
- Counts from 0-255 on clock edges
- Has active-low reset
- Has an enable signal to pause counting
- Uses SystemVerilog 2012 syntax (`logic`, `always_ff`)

## Simulation Parameters

- Clock period: 10ns (100 MHz)
- Total simulation time: ~700ns
- Reset behavior: Active low
