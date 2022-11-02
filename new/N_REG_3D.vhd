library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity N_REG_3D is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(N-1 downto 0);
    DOUT  :  out std_logic_vector(N-1 downto 0)
);
end N_REG_3D;

architecture Behavioral of N_REG_3D is
signal q0, q1, q2 : std_logic_vector(N-1 downto 0) := (others => '0');
begin
    REG_PROC: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                q0 <= (others => '0');
                q1 <= (others => '0');
            else
                q0 <= DIN;
                q1 <= q0;
            end if;
        end if;
    end process;
    DOUT <= q1;
end Behavioral;
