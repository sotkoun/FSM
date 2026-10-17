\# Pattern Detector - Asynchronous Reset Version



This directory contains an alternative implementation of the `"001"` / `"110"` sequence detector, focusing on \*\*Asynchronous Reset\*\* behavior.



\## Architectural Modifications

\* \*\*Asynchronous Reset Logic:\*\* Unlike the synchronous version, the reset signal (`rst`) is included directly in the sensitivity list of the sequential process (`process(clk, rst)`). 

\* \*\*Immediate Response:\*\* When `rst` transitions to `1`, the FSM transitions to the `S\_RESET` state asynchronously, immediately asserting the output (`data\_out = '1'`) without waiting for the next rising clock edge.

\* \*\*FSM Structure:\*\* It maintains the optimized 5-state Mealy architecture, ensuring clean hardware synthesis and preventing multiple driver conflicts.

