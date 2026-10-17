# 🔄 Pattern Detector - Asynchronous Reset Version

This directory contains an alternative hardware implementation of the `"001"` / `"110"` sequence detector, focusing on **Asynchronous Reset** behavior.

---

## ⚙️ Architectural Modifications & Comparison

| Design Parameter | Synchronous Version (Part A) | Asynchronous Version (Current) |
| :--- | :--- | :--- |
| **Reset Sensitivity** | `process(clk)` | `process(clk, rst)` |
| **Reset Evaluation** | Waits for the rising clock edge | Evaluates immediately upon signal change |
| **Response Time** | 1 clock cycle delay | Instantaneous (combinational path to state transition) |

### Key Features:
* 🚀 **Immediate Response:** When `rst` transitions to `1`, the FSM transitions to the `S_RESET` state asynchronously, immediately asserting the output (`data_out = '1'`) without waiting for a clock edge.
* 🛡️ **FSM Structure:** It maintains the optimized 5-state Mealy architecture, ensuring clean hardware synthesis and preventing multiple driver conflicts.
* ⚡ **Sensitivity List:** The reset signal (`rst`) is included directly in the sensitivity list of the sequential process (`process(clk, rst)`).

---

## 💻 VHDL Code Snippet (Sequential Process)
```vhdl
sequential_proc : process(clk, rst)
begin
    if rst = '1' then
        S_curr <= S_RESET; -- Immediate asynchronous reset transition
    elsif rising_edge(clk) then
        S_curr <= S_next;
    end if;
end process;