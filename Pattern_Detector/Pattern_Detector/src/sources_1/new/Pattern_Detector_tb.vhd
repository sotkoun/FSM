library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pattern_Detector_tb is
end Pattern_Detector_tb;

architecture Behavioral of Pattern_Detector_tb is
    component Pattern_Detector
        Port(
            clk      : in std_logic;
            rst    : in std_logic;
            data_in  : in std_logic;
            data_out : out std_logic
        );
    end component;

    signal clk      : std_logic := '0';
    signal rst    : std_logic := '0';
    signal data_in  : std_logic := '0';
    signal data_out : std_logic;

    constant CLK_PERIOD : time := 10 ns;

    constant TEST_SEQ : std_logic_vector(0 to 18) := "0010111000110011101";

begin
    UUT: Pattern_Detector port map (
        clk      => clk,
        rst    => rst,
        data_in  => data_in,
        data_out => data_out
    );

    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    stim_proc: process
    begin
        rst <= '1';
        wait for CLK_PERIOD * 2;
        
        rst <= '0';
        
        for i in TEST_SEQ'range loop
            data_in <= TEST_SEQ(i);
            wait for CLK_PERIOD;
        end loop;

        wait;
    end process;

end Behavioral;