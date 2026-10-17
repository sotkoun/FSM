# 🕒 Pattern Detector - 1 Clock Cycle Delay (Part B)

This directory contains the final implementation of the `"001"` / `"110"` sequence detector, tailored to satisfy the **Part B** requirements of the assignment. 

In this version, the output (`data_out`) does not assert immediately upon detection. Instead, it is delayed by exactly **one clock cycle**.

---

## ⚙️ Architectural Modifications

* **Registered Output:** To achieve the precise 1-clock-cycle delay, the output is no longer driven by the combinational process. An internal register (`data_out_reg`) was introduced and is updated exclusively inside the synchronous `process(clk)`.
* **Clean Mealy FSM:** The design maintains the optimized 5-state architecture (`S_RESET`, `S_IDLE`, `S_0`, `S_00`, `S_1`, `S_11`). The next-state logic remains combinational, but the output assertion is deferred to the next rising edge of the clock.
* **Elimination of Multiple Drivers:** By ensuring `data_out_reg` is only assigned within the `rising_edge(clk)` condition, the code synthesizes perfectly into Flip-Flops, completely avoiding combinatorial loops or multiple-driver conflicts.

## 💻 VHDL Code Snippet (Output Registration)

```vhdl
sequential_proc : process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            S_curr <= S_RESET;
            data_out_reg <= '1';
        else
            S_curr <= S_next;
            data_out_reg <= '0'; -- Default output
            
            -- Output goes high with 1 clock cycle delay
            if (S_curr = S_00 and data_in = '1') or (S_curr = S_11 and data_in = '0') then
                data_out_reg <= '1';
            end if;
        end if;
    end if;
end process;