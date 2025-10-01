# Simple MIPS-like Processor Datapath

This project contains Verilog modules implementing the datapath of a simple 32-bit, single-cycle MIPS-like processor. Core components include:

- **`datapath`**: Top-level wiring of PC, instruction memory, register file, ALU, and data memory.  
- **`update_pc`**: Program counter with synchronous reset.  
- **`alu`** (with `rca`, `slt`, `full_adder`): Supports AND, OR, ADD, SUB, SLT.  
- **`data_mem`, `instruction_memory`**: 32-bit memory modules (instruction preloaded from `instructions.txt`).  
- **`reg_file`**: 32×32 register file with dual read and single write ports.  
- **`mux2`, `sign_extend`**: Utility modules for multiplexing and immediate extension.  

⚠️ Some modules contain bugs that must be fixed before synthesis/simulation.  
