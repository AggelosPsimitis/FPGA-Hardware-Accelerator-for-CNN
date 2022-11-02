library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SHIFT_REGISTER is
Generic ( WIDTH : positive := 448;
          PIXEL_SIZE : positive := 16);
Port ( 
	CLK    :   in  std_logic;
--	RESET  :   in  std_logic;
	ENABLE :   in  std_logic;
	DIN    :   in  std_logic_vector(WIDTH-1 downto 0);
	DOUT   :   out std_logic_vector(PIXEL_SIZE-1 downto 0);
	FINISH :   out std_logic
);
end SHIFT_REGISTER;

architecture Behavioral of SHIFT_REGISTER is
signal SHIFT_SIG : std_logic_vector(PIXEL_SIZE-1 downto 0) := (others => '0');
signal temp : unsigned(WIDTH-1 downto 0) := (others => '0');
begin
	SHIFT_PROC: process(CLK, ENABLE)
	begin	
		if(rising_edge(CLK))then	
		   if(ENABLE = '1')then	
				if(temp < WIDTH)then
					SHIFT_SIG <= DIN(to_integer(temp)+15 downto to_integer(temp));
					FINISH <= '0';
					temp <= temp + 16;
				else
					SHIFT_SIG <= (others => '0');
					FINISH <= '1';
					temp <= (others => '0');
		    	end if;
		   else
		        SHIFT_SIG <= (others => '0');
		        temp <= (others => '0');
		        FINISH <= '1';
		  end if;
	    end if;
	end process;
	
	DOUT <= SHIFT_SIG;

	
end Behavioral;
