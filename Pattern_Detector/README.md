\# Pattern Detector (Mealy FSM)



This folder contains the implementation of a Sequence/Pattern Detector in VHDL, based on a Mealy State Machine. The circuit continuously monitors a serial input (`data\_in`) and sets the output (`data\_out`) to logic '1' when it detects the sequence `"001"` or `"110"`.



\## Implementation Versions

For educational purposes and to understand different design approaches in VHDL, the exercise has been implemented in three different versions (subdirectories):



1\. 📂 \*\*`Pattern\_Detector/`\*\*: The standard, optimized implementation using a 5-state Mealy FSM and a fully Synchronous Reset.

2\. 📂 \*\*`Pattern\_Detector\_asynchr\_reset/`\*\*: Implementation of the same circuit, but using an Asynchronous Reset.

3\. 📂 \*\*`Pattern\_Detector\_synchr\_reset\_1\_cc\_delay/`\*\*: A variation of the synchronous implementation that introduces a 1-clock-cycle delay at the output.

