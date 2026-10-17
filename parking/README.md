\# Parking Lot Controller FSM



This directory contains the VHDL behavioral/RTL description of a control system for a parking lot with a shared entry and exit gate\[cite: 15]. 



\## System Specifications

\* \*\*Sensor Logic:\*\* The gate is equipped with two photosensitive sensors, A and B\[cite: 15]. Under normal conditions, the uninterrupted light beam yields a logic `1`\[cite: 15]. When a car passes and blocks the light, the respective sensor outputs a logic `0`\[cite: 15].

\* \*\*Entry/Exit Sequences:\*\* As a car enters, it triggers the sensors in a specific physical order, resulting in the sequential input states: `AB = 11 -> 01 -> 00 -> 10 -> 11`\[cite: 15]. The reverse sequence dictates a vehicle exit.

\* \*\*System Output:\*\* The circuit outputs the total number of cars currently residing in the parking lot, initializing at `0`\[cite: 15].

\* \*\*Error Handling:\*\* The design assumes only one car can pass at a time\[cite: 15]. Meaningless sensor transitions (e.g., an abrupt jump from `11` directly to `00`) are treated as system errors and are safely ignored by the state machine\[cite: 15].



\## Implementation

The design utilizes a robust Finite State Machine to track the sequential progression of vehicles through the gate, preventing false counts from partial entries or sensor glitches.

