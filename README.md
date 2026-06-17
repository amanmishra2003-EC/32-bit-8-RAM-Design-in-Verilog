# 32-bit × 8 RAM Design in Verilog

## Overview

This project implements a **32-bit × 8 Random Access Memory (RAM)** using Verilog HDL. The design supports synchronous write operations and asynchronous read operations. Functional verification was performed using a custom testbench, followed by post-synthesis timing simulation in Vivado.

This project is part of my Digital VLSI and CPU Design learning roadmap, with the long-term goal of designing a complete RISC-V processor.

---

## Specifications

| Parameter       | Value               |
| --------------- | ------------------- |
| Word Size       | 32 bits             |
| Memory Depth    | 8 words             |
| Total Capacity  | 256 bits (32 Bytes) |
| Address Width   | 3 bits              |
| Write Operation | Synchronous         |
| Read Operation  | Asynchronous        |

---
## RTL Design 
<img width="2422" height="1498" alt="rtl_schematic" src="https://github.com/user-attachments/assets/022e87e6-bc5d-41f4-98f6-f89d865673b6" />

### Inputs

* `clk` : Clock signal
* `wr` : Write enable
* `addr[2:0]` : Memory address
* `din[31:0]` : Input data

### Output

* `dout[31:0]` : Output data

### Memory Declaration

```verilog
reg [31:0] mem [0:7];
```

The memory contains 8 locations, each capable of storing 32 bits.

---

## Verilog Implementation

### Write Logic

```verilog
always @(posedge clk)
begin
    if(wr)
        mem[addr] <= din;
end
```

Data is written into memory on the rising edge of the clock when the write enable signal is asserted.

### Read Logic

```verilog
always @(*)
begin
    dout = mem[addr];
end
```

The output data is continuously updated based on the selected address.

---

## Verification

A testbench was developed to:

* Generate a clock signal
* Write data into all memory locations
* Read back stored data
* Monitor simulation results
* Generate waveform files for analysis

Example test data:

| Address | Data          |
| ------- | ------------- |
| 0       | 32'h1234_5678 |
| 1       | 32'hAABB_CCDD |
| 2       | 32'h1245_7869 |
| 3       | 32'h3412_7856 |
| 4       | 32'h3416_8856 |
| 5       | 32'hABCD_BEEF |
| 6       | 32'h0234_BCDE |
| 7       | 32'hAAAA_BBBB |

---

## Simulation Results

### Behavioral Simulation

Behavioral simulation verified:

* Correct write functionality
* Correct read functionality
* Address decoding
* Data integrity

### Post-Synthesis Timing Simulation

Post-synthesis timing simulation was performed in Vivado.

Observations:

* Gate-level and routing delays became visible.
* Temporary glitches appeared during address transitions.
* Output settled to the correct value after propagation delays.

This provided practical insight into real hardware behavior compared to ideal RTL simulation.

---

## Key Learnings

* Verilog memory modeling
* Synchronous write operations
* Asynchronous read operations
* Testbench development
* Waveform debugging
* Behavioral vs Timing Simulation
* Understanding unknown (`X`) states in simulation
* Basic memory architecture used in CPU design

---

## Future Work

This RAM module is one of the building blocks for a larger CPU design project.

Planned roadmap:

1. ALU Design
2. Register File
3. Program Counter
4. Instruction Memory
5. Control Unit
6. Simple CPU Architecture
7. Single-Cycle RISC-V Processor

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* GTKWave (optional)
* Icarus Verilog (optional)

---

## Author

Aman Mishra

B.Tech Electronics Engineering

Learning Digital Design, VLSI, ASIC Design, and RISC-V Processor Architecture.
