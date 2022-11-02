library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity N_REG_29D is
Generic ( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET : in  std_logic;
    DIN   : in  std_logic_vector(N-1 downto 0);
    DOUT  : out std_logic_vector(N-1 downto 0)
);
end N_REG_29D;

architecture Behavioral of N_REG_29D is
signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27 : std_logic_vector(N-1 downto 0) := (others => '0');
begin

    DELAY_29_PROC: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                DOUT <= (others => '0');
            else
                q0 <= DIN;
                q1 <= q0;
                q2 <= q1;
                q3 <= q2;
                q4 <= q3;
                q5 <= q4;
                q6 <= q5;
                q7 <= q6;
                q8 <= q7;
                q9 <= q8;
                q10 <= q9;
                q11 <= q10;
                q12 <= q11;
                q13 <= q12;
                q14 <= q13;
                q15 <= q14;
                q16 <= q15;
                q17 <= q16;
                q18 <= q17;
                q19 <= q18;
                q20 <= q19;
                q21 <= q20;
                q22 <= q21;
                q23 <= q22;
                q24 <= q23;
                q25 <= q24;
                q26 <= q25;
                q27 <= q26;
--                q28 <= q27;
                DOUT <= q27;
           end if;
       end if;
   end process;

end Behavioral;
