library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_FOR_FIFO is
Port (
    CLK     :   in  std_logic;
    RESET   :   in  std_logic;
    SET     :   in  std_logic;
    COUT    :   out std_logic    -- cout is seting fifo's for write operation
);
end COUNTER_FOR_FIFO;

architecture Behavioral of COUNTER_FOR_FIFO is

signal temp : unsigned(5 downto 0) := (others => '0');

begin
    process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                temp <= (others => '0');
                COUT <= '0';
            else
                if(SET = '1')then
                    if(temp = "001000")then  -- temp equals latency = 9 cycles so set fifo's to write output data
                        COUT <= '1';
                        temp <= temp + 1;
                    elsif(temp = "100000")then --temp equals latency + 23 = 32 so all values are are written in fifo's so close writing to start reading 
                        COUT <= '0';
                        temp <= (others => '0');
                    else 
                        temp <= temp + 1;
                    end if;
                else
                    temp <= (others => '0');
                    COUT <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
