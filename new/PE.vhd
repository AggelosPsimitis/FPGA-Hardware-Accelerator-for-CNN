library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_signed.all;

entity PE is
Generic ( PIXEL_SIZE : positive := 16);
Port (
	CLK     :  in  std_logic;
	RESET   :  in  std_logic;
	DIN     :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
	COEFF   :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
	PREV    :  in  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
	DOUT    :  out std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0)
);
end PE;

architecture Behavioral of PE is
signal DOUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
begin

	MAC_PROC : process(CLK)
	begin
		if(rising_edge(CLK))then
			if(RESET = '1')then
				DOUT_SIG <= (others => '0');
			else
				DOUT_SIG <= DIN * COEFF + PREV;
			end if;
		end if;
	end process;
	
	DOUT <= DOUT_SIG;

end Behavioral;
