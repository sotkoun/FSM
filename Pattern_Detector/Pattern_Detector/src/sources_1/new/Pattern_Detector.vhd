library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pattern_Detector is
    Port(clk, rst, data_in : in std_logic;
        data_out : out std_logic);
end Pattern_Detector;

architecture Behavioral of Pattern_Detector is
signal three_bit_reg : std_logic_vector(2 downto 0);
signal data_out_temp : std_logic:='0';

-- FSM
type S_state_type is (S_IDLE, S_000, S_001, S_010, S_011, S_100, S_101, S_110, S_111, S_RESET);    
signal S_curr : S_state_type := S_IDLE;
signal S_next : S_state_type;

begin
    
    data_out <= data_out_temp;
    
    sequential : process(clk) 
    begin
        if rising_edge(clk) then
            if rst = '1' then
--                data_out_temp <= '1';  multiple drivers: Όταν γράφεις data_out_temp <= ... μέσα σε δύο διαφορετικά processes
--, ο compiler φτιάχνει δύο διαφορετικά φυσικά εξαρτήματα που ενώνονται στο ίδιο ακριβώς καλώδιο --> βραχυκυκλωμα!!
                three_bit_reg <= (others=>'U');
                S_curr<= S_RESET;    
            else 
                S_curr <= S_next;
                three_bit_reg <= three_bit_reg(1 downto 0) & data_in;
            end if;
        end if;
    end process;
    
    combinational : process(all) --το process(all) (όπως και κάθε λίστα ευαισθησίας) εντοπίζει και περιλαμβάνει μόνο τα σήματα που "διαβάζονται" (read) μέσα στο block.
--                                 Αυτά είναι τα σήματα που βρίσκονται στα δεξιά μιας ανάθεσης (<=) ή μέσα σε συνθήκες (if, case).
    begin
        S_next <= S_curr;
        data_out_temp <= '0';
        
        case S_curr is
            
            when S_RESET =>
                data_out_temp <= '1';
                S_next <= S_IDLE;
                
            when S_IDLE =>
                if three_bit_reg = "000" then
                    S_next <= S_000;
                    data_out_temp <= '0';
                elsif three_bit_reg = "001" then
                    S_next <= S_001;
                    data_out_temp <= '1';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;
                
            when S_000 =>
                data_out_temp <= '0';
                if three_bit_reg = "000" then
                    S_next <= S_000;
                    data_out_temp <= '0';
                elsif three_bit_reg = "001" then
                    S_next <= S_001;
                    data_out_temp <= '1';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;
                
            when S_001 =>
                if three_bit_reg = "010" then
                    S_next <= S_010;
                    data_out_temp <= '0';
                elsif three_bit_reg = "011" then
                    S_next <= S_011;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;
                
            when S_010 =>
                if three_bit_reg = "100" then
                    S_next <= S_100;
                    data_out_temp <= '0';
                elsif three_bit_reg = "101" then
                    S_next <= S_101;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;   
                
            when S_011 =>
                if three_bit_reg = "110" then
                    S_next <= S_110;
                    data_out_temp <= '1';
                elsif three_bit_reg = "111" then
                    S_next <= S_111;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;     
                
            when S_100 =>
                if three_bit_reg = "000" then
                    S_next <= S_000;
                    data_out_temp <= '0';
                elsif three_bit_reg = "001" then
                    S_next <= S_001;
                    data_out_temp <='1';
                else
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;
                
            when S_101 =>
                if three_bit_reg = "010" then
                    S_next <= S_010;
                    data_out_temp <= '0';
                elsif three_bit_reg = "011" then
                    S_next <= S_011;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;             
                
            when S_110 =>
                if three_bit_reg = "100" then
                    S_next <= S_100;
                    data_out_temp <= '0';
                elsif three_bit_reg = "101" then
                    S_next <= S_101;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if; 
                
            when S_111 =>
                if three_bit_reg = "110" then
                    S_next <= S_110;
                    data_out_temp <= '1';
                elsif three_bit_reg = "111" then
                    S_next <= S_111;
                    data_out_temp <= '0';
                else 
                    S_next <= S_IDLE;
                    data_out_temp <= '0';
                end if;       
        end case; 
    end process;
    
end Behavioral;
