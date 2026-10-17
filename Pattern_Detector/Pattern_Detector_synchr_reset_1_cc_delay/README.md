\# 🕒 Pattern Detector - 1 Clock Cycle Delay (Part B)



This directory contains the final implementation of the `"001"` / `"110"` sequence detector, tailored to satisfy the \*\*Part B\*\* requirements of the assignment. 



In this version, the output (`data\_out`) does not assert immediately upon detection. Instead, it is delayed by exactly \*\*one clock cycle\*\*.



\---



\## ⚙️ Architectural Modifications



\* \*\*Registered Output:\*\* To achieve the precise 1-clock-cycle delay, the output is no longer driven by the combinational process. An internal register (`data\_out\_reg`) was introduced and is updated exclusively inside the synchronous `process(clk)`.

\* \*\*Clean Mealy FSM:\*\* The design maintains the optimized 5-state architecture (`S\_RESET`, `S\_IDLE`, `S\_0`, `S\_00`, `S\_1`, `S\_11`). The next-state logic remains combinational, but the output assertion is deferred to the next rising edge of the clock.

\* \*\*Elimination of Multiple Drivers:\*\* By ensuring `data\_out\_reg` is only assigned within the `rising\_edge(clk)` condition, the code synthesizes perfectly into Flip-Flops, completely avoiding combinatorial loops or multiple-driver conflicts (which cause `X` states during simulation elaboration).



\## 💻 VHDL Code Snippet (Output Registration)

```vhdl

sequential\_proc : process(clk)

begin

&#x20;   if rising\_edge(clk) then

&#x20;       if rst = '1' then

&#x20;           S\_curr <= S\_RESET;

&#x20;           data\_out\_reg <= '1';

&#x20;       else

&#x20;           S\_curr <= S\_next;

&#x20;           data\_out\_reg <= '0'; -- Default output

&#x20;           

&#x20;           -- Output goes high with 1 clock cycle delay

&#x20;           if (S\_curr = S\_00 and data\_in = '1') or (S\_curr = S\_11 and data\_in = '0') then

&#x20;               data\_out\_reg <= '1';

&#x20;           end if;

&#x20;       end if;

&#x20;   end if;

end process;

