library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DECODER is
Generic ( WIDTH : positive := 16);
Port (
    R10  :  in  std_logic_vector(WIDTH-1 downto 0);
    R11  :  in  std_logic_vector(WIDTH-1 downto 0);
    R12  :  in  std_logic_vector(WIDTH-1 downto 0);
    R13  :  in  std_logic_vector(WIDTH-1 downto 0);
    R14  :  in  std_logic_vector(WIDTH-1 downto 0);
    R20  :  in  std_logic_vector(WIDTH-1 downto 0);
    R21  :  in  std_logic_vector(WIDTH-1 downto 0);
    R22  :  in  std_logic_vector(WIDTH-1 downto 0);
    R23  :  in  std_logic_vector(WIDTH-1 downto 0);
    R24  :  in  std_logic_vector(WIDTH-1 downto 0); 
    S1 :  in  std_logic;
    S2 :  in  std_logic;
    R0   :  out std_logic_vector(WIDTH-1 downto 0);
    R1   :  out std_logic_vector(WIDTH-1 downto 0);
    R2   :  out std_logic_vector(WIDTH-1 downto 0);
    R3   :  out std_logic_vector(WIDTH-1 downto 0);
    R4   :  out std_logic_vector(WIDTH-1 downto 0)
);
end DECODER;

architecture Behavioral of DECODER is

begin

    DECODER_PROC: process(S1, S2, R10, R11, R12, R13, R14, R20, R21, R22, R23, R24)
    begin
        if(S1 = '1' and S2 = '0')then
            R0 <= R10;
            R1 <= R11;
            R2 <= R12;
            R3 <= R13;
            R4 <= R14;
        elsif(S1 = '0' and S2 = '1')then
            R0 <= R20;
            R1 <= R21;
            R2 <= R22;
            R3 <= R23;
            R4 <= R24;
        end if;
    end process;
end Behavioral;
