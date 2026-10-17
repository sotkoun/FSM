# Overlapping Sequence Detector (Mealy FSM)

This folder contains the implementation of a synchronous digital circuit designed to continuously detect the 3-bit sequences `"001"` or `"110"` from a serial input (`data_in`)[cite: 14]. 

## Base Specifications
* **Detection & Output:** The output (`data_out`) asserts to `1` at the exact clock cycle the 3rd bit of the sequence is detected, synchronized with the positive edge of the clock[cite: 14].
* **Reset Behavior:** When the reset signal (`rst`) is asserted (`1`), the circuit instantly outputs `data_out = '1'`, and normal operation resumes when `rst = '0'`[cite: 14].

## Project Variations
To demonstrate different digital design paradigms, the detector has been implemented in three distinct versions:

1. 📂 **`Pattern_Detector/`** (Part A): The optimized, baseline implementation using a 5-state Mealy FSM with a fully Synchronous Reset[cite: 14].
2. 📂 **`Pattern_Detector_asynchr_reset/`**: An alternative hardware architecture utilizing an Asynchronous Reset.
3. 📂 **`Pattern_Detector_synchr_reset_1_cc_delay/`** (Part B): A modified architecture where the `data_out` signal is generated exactly one clock cycle after the sequence is detected[cite: 14].