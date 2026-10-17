\# Pattern Detector - Synchronous Reset (Mealy FSM)



This is the standard and most optimized implementation of the `"001"` / `"110"` sequence detector. It follows industry best practices for designing FSMs in VHDL.



\## Architecture Features

\* \*\*FSM Type:\*\* Mealy Machine (the output depends on the current state \*and\* the current inputs).

\* \*\*States:\*\* Only 5 states were used (`S\_RESET`, `S\_IDLE`, `S\_0`, `S\_00`, `S\_1`, `S\_11`), avoiding the need for unnecessary shift registers.

\* \*\*Synchronous Reset:\*\* The reset signal (`rst`) is fully synchronous with the rising edge of the clock (`clk`).

\* \*\*Avoiding Multiple Drivers:\*\* The code is strictly separated into a `sequential process` (for the Flip-Flops) and a `combinational process` (for the next-state and output logic). The reset logic for the output was integrated via a dedicated state (`S\_RESET`), eliminating short-circuits (unknown 'X' states in simulation).



\## Simulation

The folder includes the testbench file (`Pattern\_Detector\_tb.vhd`) which feeds the circuit with the test sequence `0010111000110011101` as per the assignment specifications. The simulation output produces the exact desired results without timing violations.

