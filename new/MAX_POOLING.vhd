library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MAX_POOLING is
Generic ( WIDTH : positive := 32);
Port (
    CLK    :  in  std_logic;
    RESET  :  in  std_logic;
    DIN1   :  in  std_logic_vector(WIDTH-1 downto 0); 
    DIN2   :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT   :  out std_logic_vector(WIDTH-1 downto 0)
);
end MAX_POOLING;

architecture Behavioral of MAX_POOLING is

signal DIN1_SIG, DIN2_SIG : unsigned(WIDTH-1 downto 0) := (others => '0');
signal DOUT_SIG : unsigned(WIDTH-1 downto 0) := (others => '0');

begin

DIN1_SIG <= unsigned(DIN1);
DIN2_SIG <= unsigned(DIN2);

    MAX_PROC: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                DOUT_SIG <= (others => '0');
            else
                if(DIN1_SIG > DIN2_SIG)then
                   DOUT_SIG <= DIN1_SIG;
                else
                    DOUT_SIG <= DIN2_SIG;
                end if;
            end if;
        end if;
    end process;

    DOUT <= std_logic_vector(DOUT_SIG);
                   
end Behavioral;
