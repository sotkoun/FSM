# Pattern Detector - Synchronous Reset (Part A)

This is the primary implementation of the `"001"` / `"110"` sequence detector[cite: 14]. It utilizes a highly optimized Mealy Finite State Machine to achieve zero-latency output upon sequence detection.

## Architectural Highlights
* **Mealy FSM Design:** The output is a function of both the current state and the current input, satisfying the requirement to assert `data_out` exactly when the 3rd bit arrives[cite: 14].
* **State Minimization:** The machine is designed with only 5 essential states (`S_RESET`, `S_IDLE`, `S_0`, `S_00`, `S_1`, `S_11`), eliminating the need for brute-force shift registers and reducing hardware utilization.
* **Synchronous Reset:** The system reset is entirely synchronous. To safely handle the specific assignment requirement (where `rst='1'` forces `data_out='1'`[cite: 14]), the FSM utilizes a dedicated `S_RESET` state. This prevents multiple driver conflicts and ensures clean, predictable hardware synthesis.

## Simulation
The included testbench strictly follows the assignment's verification methodology. By applying the test sequence `data_in = 0010111000110011101`, the simulation yields the exact expected response (`data_out = 0010000100101010010`)[cite: 14].