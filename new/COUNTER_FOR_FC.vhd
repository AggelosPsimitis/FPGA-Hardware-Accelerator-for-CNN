library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_FOR_FC is
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    SET   :  in  std_logic;
    COUT1 :  out std_logic;
    COUT2 :  out std_logic
 );
end COUNTER_FOR_FC;

architecture Behavioral of COUNTER_FOR_FC is
signal temp : unsigned(5 downto 0) := (others => '0');
signal temp2: unsigned(9 downto 0) := (others => '0');
begin

    COUNT_PROC_FC: process(CLK)
    begin   
        if(rising_edge(CLK))then
            if(RESET = '1')then
                temp <= (others => '0');
                COUT1 <= '0';
            elsif(SET = '1')then
                if(temp = "000011")then
                    COUT1 <= '1';
                    temp <= temp + 1;
                elsif(temp < "100100" and temp >= "001111")then
                    COUT1 <= '0';
                    temp <= temp + 1;
                else
                    temp <= temp + 1;
                end if;
            else
                temp <= (others => '0');
                COUT1 <= '0';
            end if;
        end if;
    end process;
    
    COUNT_PROC_OL: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                temp2 <= (others => '0');
                COUT2 <= '0';
            elsif(temp2 = "1011010110")then
                temp2 <= (others => '0');
                COUT2 <= '1';
            else
                temp2 <= temp2 + 1;
                COUT2 <= '0';
            end if;
        end if;
    end process;

end Behavioral;
