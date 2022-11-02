library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDER is
Generic ( WIDTH : positive := 32);
Port (
    A    :  in  std_logic_vector(WIDTH-1 downto 0);
    B    :  in  std_logic_vector(WIDTH-1 downto 0);
    S    :  out std_logic_vector(WIDTH-1 downto 0);
    COUT :  out std_logic;
    OV   :  out std_logic
);
end ADDER;

architecture Behavioral of ADDER is
begin
ADDER_PROC: process(A,B)
variable A_s, B_s, S_s : signed(WIDTH+1 downto 0);
begin
    A_s := signed('0'&A(WIdth-1)&A);
    B_s := signed('0'&B(WIdth-1)&B);
    S_s := A_s + B_s;
    S <= std_logic_vector(S_s(WIDTH-1 downto 0));
    OV <= S_s(WIDTH) xor S_s(Width-1);
    Cout <= S_s(WIDTH+1);
end process;
end Behavioral;
