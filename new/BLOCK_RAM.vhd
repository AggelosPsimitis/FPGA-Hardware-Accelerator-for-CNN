library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BLOCK_RAM is
Generic (	POWER  : positive := 5;     -- address length
			WIDTH  : positive := 448);  -- data word length
Port (
	CLK     :  in  std_logic;
	WE      :  in  std_logic;
	RE      :  in  std_logic;
	WR_ADDR :  in  std_logic_vector(POWER-1 downto 0);
	RE_ADDR :  in  std_logic_vector(POWER-1 downto 0);
	DIN     :  in  std_logic_vector(WIDTH-1 downto 0);
	DOUT    :  out std_logic_vector(WIDTH-1 downto 0)
 );
end BLOCK_RAM;

architecture Synchronous_Read of BLOCK_RAM is

	type RAM_TYPE is array (2**POWER-1 downto 0) of std_logic_vector(WIDTH-1 downto 0);
	signal RAM : RAM_TYPE;
begin
	WRITE_PROC: process(CLK)
	begin
		if(rising_edge(CLK))then	
			if(WE = '1')then
				RAM(to_integer(unsigned(WR_ADDR))) <= DIN;
			end if;
		end if;
	end process;
	
	READ_PROC: process(CLK)
	begin
	   if(rising_edge(CLK))then
	       if(RE = '1')then
	           DOUT <= RAM(to_integer(unsigned(RE_ADDR)));
	       end if;
	   end if;
	end process;

end Synchronous_Read;