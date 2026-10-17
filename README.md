# Digital Logic Design: VHDL Finite State Machines (FSM)

This repository serves as a portfolio of professional VHDL implementations focusing on Finite State Machine (FSM) design. The projects demonstrate hardware modeling, sequential logic design, and robust state management. All code has been designed, synthesized, and simulated using Xilinx Vivado.

## Repository Structure
The repository contains two distinct digital design projects, organized into the following subdirectories:

* 📂 **`parking/`**: A Parking Lot Controller FSM. It manages vehicle entry and exit tracking using a shared gate with dual photosensors, accounting for invalid sensor transitions and maintaining a strict capacity count[cite: 15].
* 📂 **`Pattern_Detector/`**: A Mealy-type Overlapping Sequence Detector. It continuously monitors a serial input stream to detect specific 3-bit patterns (`"001"` and `"110"`) and features strict synchronous reset handling[cite: 14].

Each project folder includes comprehensive VHDL RTL descriptions, behavioral testbenches, and Tcl scripts for automated Vivado project reconstruction.