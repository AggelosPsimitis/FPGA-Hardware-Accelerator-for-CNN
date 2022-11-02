library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RELU_MUX is
Generic( WIDTH : positive := 32);
Port (
    DIN  :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT :  out std_logic_vector(WIDTH-1 downto 0)
);
end RELU_MUX;

architecture Behavioral of RELU_MUX is
signal SEL_SIG : std_logic := '0';
begin

SEL_SIG <= DIN(WIDTH-1);
RELU_PROC: process(DIN,SEL_SIG)
begin
    if(SEL_SIG = '1')then
        DOUT <= (others => '0');
    else
        DOUT <= DIN;
    end if;
end process;

end Behavioral;
