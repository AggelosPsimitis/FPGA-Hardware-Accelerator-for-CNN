library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity N_REG is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(N-1 downto 0);
    DOUT  :  out std_logic_vector(N-1 downto 0)
);
end N_REG;

architecture Behavioral of N_REG is
signal q0 : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    REG_PROC: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                q0 <= (others => '0');
            else
                q0 <= DIN;
            end if;
        end if;
    end process;
    DOUT <= q0;
end Behavioral;
