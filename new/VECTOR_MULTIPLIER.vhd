library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity VECTOR_MULTIPLIER is
Generic(WIDTH : positive := 32;
		POWER : positive := 13);
Port (
	CLK	  		:  in  std_logic;
	RESET 		:  in  std_logic;
	SET         :  in  std_logic;
	DIN0  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN1  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN2  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN3  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN4  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN5  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN6  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN7  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN8  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN9  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN10  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN11  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN12  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN13  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN14  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN15  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN16  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN17  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN18  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN19  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN20  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN21  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN22  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN23  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN24  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN25  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN26  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN27  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN28  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN29  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN30  		:  in  std_logic_vector(WIDTH-1 downto 0);
	DIN31  		:  in  std_logic_vector(WIDTH-1 downto 0);
	ROM0_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM1_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM2_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM3_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM4_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM5_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM6_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM7_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM8_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM9_DATA   :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM10_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM11_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM12_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM13_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM14_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM15_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM16_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM17_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM18_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM19_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM20_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM21_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM22_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM23_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM24_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM25_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM26_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM27_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM28_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM29_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM30_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ROM31_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	ADDR0		:  out std_logic_vector(POWER-1 downto 0);
	ADDR1 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR2		:  out std_logic_vector(POWER-1 downto 0);
	ADDR3 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR4		:  out std_logic_vector(POWER-1 downto 0);
	ADDR5 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR6		:  out std_logic_vector(POWER-1 downto 0);
	ADDR7 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR8		:  out std_logic_vector(POWER-1 downto 0);
	ADDR9 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR10		:  out std_logic_vector(POWER-1 downto 0);
	ADDR11 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR12		:  out std_logic_vector(POWER-1 downto 0);
	ADDR13 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR14		:  out std_logic_vector(POWER-1 downto 0);
	ADDR15 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR16		:  out std_logic_vector(POWER-1 downto 0);
	ADDR17 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR18		:  out std_logic_vector(POWER-1 downto 0);
	ADDR19 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR20		:  out std_logic_vector(POWER-1 downto 0);
	ADDR21 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR22		:  out std_logic_vector(POWER-1 downto 0);
	ADDR23 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR24		:  out std_logic_vector(POWER-1 downto 0);
	ADDR25 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR26		:  out std_logic_vector(POWER-1 downto 0);
	ADDR27 		:  out std_logic_vector(POWER-1 downto 0);
	ADDR28		:  out std_logic_vector(POWER-1 downto 0);
	ADDR29		:  out std_logic_vector(POWER-1 downto 0);
	ADDR30		:  out std_logic_vector(POWER-1 downto 0);
	ADDR31 		:  out std_logic_vector(POWER-1 downto 0);
	DOUT   		:  out std_logic_vector(WIDTH+WIDTH-1 downto 0)
);
end VECTOR_MULTIPLIER;

architecture Behavioral of VECTOR_MULTIPLIER is

signal ADDR0_SIG, ADDR1_SIG, ADDR2_SIG, ADDR3_SIG, ADDR4_SIG, ADDR5_SIG,
	   ADDR6_SIG, ADDR7_SIG, ADDR8_SIG, ADDR9_SIG, ADDR10_SIG, ADDR11_SIG,
	   ADDR12_SIG, ADDR13_SIG, ADDR14_SIG, ADDR15_SIG, ADDR16_SIG, ADDR17_SIG,
	   ADDR18_SIG, ADDR19_SIG, ADDR20_SIG, ADDR21_SIG, ADDR22_SIG, ADDR23_SIG,
	   ADDR24_SIG, ADDR25_SIG, ADDR26_SIG, ADDR27_SIG, ADDR28_SIG, ADDR29_SIG,
	   ADDR30_SIG, ADDR31_SIG : unsigned(POWER-1 downto 0) := (others => '0');

signal ADDR0_SIG_DELAY, ADDR1_SIG_DELAY, ADDR2_SIG_DELAY, ADDR3_SIG_DELAY, ADDR4_SIG_DELAY, ADDR5_SIG_DELAY,
	   ADDR6_SIG_DELAY, ADDR7_SIG_DELAY, ADDR8_SIG_DELAY, ADDR9_SIG_DELAY, ADDR10_SIG_DELAY, ADDR11_SIG_DELAY,
	   ADDR12_SIG_DELAY, ADDR13_SIG_DELAY, ADDR14_SIG_DELAY, ADDR15_SIG_DELAY, ADDR16_SIG_DELAY, ADDR17_SIG_DELAY,
	   ADDR18_SIG_DELAY, ADDR19_SIG_DELAY, ADDR20_SIG_DELAY, ADDR21_SIG_DELAY, ADDR22_SIG_DELAY, ADDR23_SIG_DELAY,
	   ADDR24_SIG_DELAY, ADDR25_SIG_DELAY, ADDR26_SIG_DELAY, ADDR27_SIG_DELAY, ADDR28_SIG_DELAY, ADDR29_SIG_DELAY,
	   ADDR30_SIG_DELAY, ADDR31_SIG_DELAY : unsigned(POWER-1 downto 0) := (others => '0');

signal ADDR0_SIG_DELAY2, ADDR1_SIG_DELAY2, ADDR2_SIG_DELAY2, ADDR3_SIG_DELAY2, ADDR4_SIG_DELAY2, ADDR5_SIG_DELAY2,
	   ADDR6_SIG_DELAY2, ADDR7_SIG_DELAY2, ADDR8_SIG_DELAY2, ADDR9_SIG_DELAY2, ADDR10_SIG_DELAY2, ADDR11_SIG_DELAY2,
	   ADDR12_SIG_DELAY2, ADDR13_SIG_DELAY2, ADDR14_SIG_DELAY2, ADDR15_SIG_DELAY2, ADDR16_SIG_DELAY2, ADDR17_SIG_DELAY2,
	   ADDR18_SIG_DELAY2, ADDR19_SIG_DELAY2, ADDR20_SIG_DELAY2, ADDR21_SIG_DELAY2, ADDR22_SIG_DELAY2, ADDR23_SIG_DELAY2,
	   ADDR24_SIG_DELAY2, ADDR25_SIG_DELAY2, ADDR26_SIG_DELAY2, ADDR27_SIG_DELAY2, ADDR28_SIG_DELAY2, ADDR29_SIG_DELAY2,
	   ADDR30_SIG_DELAY2, ADDR31_SIG_DELAY2 : unsigned(POWER-1 downto 0) := (others => '0');
	   
signal INTERNAL_ACCUMULATOR : unsigned(WIDTH+WIDTH-1 downto 0) := (others => '0');

begin

	MAC_PROCESS: process(CLK)
	begin
		if(rising_edge(CLK))then
			if(RESET = '1')then
				ADDR0_SIG_DELAY2  <= "0000000000000";
				ADDR1_SIG_DELAY2  <= "0000000000001";
				ADDR2_SIG_DELAY2  <= "0000000000010";
				ADDR3_SIG_DELAY2  <= "0000000000011";
				ADDR4_SIG_DELAY2  <= "0000000000100";
				ADDR5_SIG_DELAY2  <= "0000000000101";
				ADDR6_SIG_DELAY2  <= "0000000000110";
				ADDR7_SIG_DELAY2  <= "0000000000111";
				ADDR8_SIG_DELAY2  <= "0000000001000";
				ADDR9_SIG_DELAY2  <= "0000000001001";
				ADDR10_SIG_DELAY2 <= "0000000001010";
				ADDR11_SIG_DELAY2 <= "0000000001011";
				ADDR12_SIG_DELAY2 <= "0000000001100";
				ADDR13_SIG_DELAY2 <= "0000000001101";
				ADDR14_SIG_DELAY2 <= "0000000001110";
				ADDR15_SIG_DELAY2 <= "0000000001111";
				ADDR16_SIG_DELAY2 <= "0000000010000";
				ADDR17_SIG_DELAY2 <= "0000000010001";
				ADDR18_SIG_DELAY2 <= "0000000010010";
				ADDR19_SIG_DELAY2 <= "0000000010011";
				ADDR20_SIG_DELAY2 <= "0000000010100";
				ADDR21_SIG_DELAY2 <= "0000000010101";
				ADDR22_SIG_DELAY2 <= "0000000010110";
				ADDR23_SIG_DELAY2 <= "0000000010111";
				ADDR24_SIG_DELAY2 <= "0000000011000";
				ADDR25_SIG_DELAY2 <= "0000000011001";
				ADDR26_SIG_DELAY2 <= "0000000011010";
				ADDR27_SIG_DELAY2 <= "0000000011011";
				ADDR28_SIG_DELAY2 <= "0000000011100";
				ADDR29_SIG_DELAY2 <= "0000000011101";
				ADDR30_SIG_DELAY2 <= "0000000011110";
				ADDR31_SIG_DELAY2 <= "0000000011111";
				ADDR0_SIG_DELAY  <= ADDR0_SIG_DELAY2; 
				ADDR1_SIG_DELAY  <= ADDR1_SIG_DELAY2; 
				ADDR2_SIG_DELAY  <= ADDR2_SIG_DELAY2; 
				ADDR3_SIG_DELAY  <= ADDR3_SIG_DELAY2; 
				ADDR4_SIG_DELAY  <= ADDR4_SIG_DELAY2; 
				ADDR5_SIG_DELAY  <= ADDR5_SIG_DELAY2; 
				ADDR6_SIG_DELAY  <= ADDR6_SIG_DELAY2; 
				ADDR7_SIG_DELAY  <= ADDR7_SIG_DELAY2; 
				ADDR8_SIG_DELAY  <= ADDR8_SIG_DELAY2; 
				ADDR9_SIG_DELAY  <= ADDR9_SIG_DELAY2; 
				ADDR10_SIG_DELAY <= ADDR10_SIG_DELAY2;
				ADDR11_SIG_DELAY <= ADDR11_SIG_DELAY2;
				ADDR12_SIG_DELAY <= ADDR12_SIG_DELAY2;
				ADDR13_SIG_DELAY <= ADDR13_SIG_DELAY2;
				ADDR14_SIG_DELAY <= ADDR14_SIG_DELAY2;
				ADDR15_SIG_DELAY <= ADDR15_SIG_DELAY2;
				ADDR16_SIG_DELAY <= ADDR16_SIG_DELAY2;
				ADDR17_SIG_DELAY <= ADDR17_SIG_DELAY2;
				ADDR18_SIG_DELAY <= ADDR18_SIG_DELAY2;
				ADDR19_SIG_DELAY <= ADDR19_SIG_DELAY2;
				ADDR20_SIG_DELAY <= ADDR20_SIG_DELAY2;
				ADDR21_SIG_DELAY <= ADDR21_SIG_DELAY2;
				ADDR22_SIG_DELAY <= ADDR22_SIG_DELAY2;
				ADDR23_SIG_DELAY <= ADDR23_SIG_DELAY2;
				ADDR24_SIG_DELAY <= ADDR24_SIG_DELAY2;
				ADDR25_SIG_DELAY <= ADDR25_SIG_DELAY2;
				ADDR26_SIG_DELAY <= ADDR26_SIG_DELAY2;
				ADDR27_SIG_DELAY <= ADDR27_SIG_DELAY2;
				ADDR28_SIG_DELAY <= ADDR28_SIG_DELAY2;
				ADDR29_SIG_DELAY <= ADDR29_SIG_DELAY2;
				ADDR30_SIG_DELAY <= ADDR30_SIG_DELAY2;
				ADDR31_SIG_DELAY <= ADDR31_SIG_DELAY2;
				ADDR0_SIG  <= ADDR0_SIG_DELAY;
				ADDR1_SIG  <= ADDR1_SIG_DELAY;
				ADDR2_SIG  <= ADDR2_SIG_DELAY;
				ADDR3_SIG  <= ADDR3_SIG_DELAY;
				ADDR4_SIG  <= ADDR4_SIG_DELAY;
				ADDR5_SIG  <= ADDR5_SIG_DELAY;
				ADDR6_SIG  <= ADDR6_SIG_DELAY;
				ADDR7_SIG  <= ADDR7_SIG_DELAY;
				ADDR8_SIG  <= ADDR8_SIG_DELAY;
				ADDR9_SIG  <= ADDR9_SIG_DELAY;
				ADDR10_SIG <= ADDR10_SIG_DELAY;
				ADDR11_SIG <= ADDR11_SIG_DELAY;
				ADDR12_SIG <= ADDR12_SIG_DELAY;
				ADDR13_SIG <= ADDR13_SIG_DELAY;
				ADDR14_SIG <= ADDR14_SIG_DELAY;
				ADDR15_SIG <= ADDR15_SIG_DELAY;
				ADDR16_SIG <= ADDR16_SIG_DELAY;
				ADDR17_SIG <= ADDR17_SIG_DELAY;
				ADDR18_SIG <= ADDR18_SIG_DELAY;
				ADDR19_SIG <= ADDR19_SIG_DELAY;
				ADDR20_SIG <= ADDR20_SIG_DELAY;
				ADDR21_SIG <= ADDR21_SIG_DELAY;
				ADDR22_SIG <= ADDR22_SIG_DELAY;
				ADDR23_SIG <= ADDR23_SIG_DELAY;
				ADDR24_SIG <= ADDR24_SIG_DELAY;
				ADDR25_SIG <= ADDR25_SIG_DELAY;
				ADDR26_SIG <= ADDR26_SIG_DELAY;
				ADDR27_SIG <= ADDR27_SIG_DELAY;
				ADDR28_SIG <= ADDR28_SIG_DELAY;
				ADDR29_SIG <= ADDR29_SIG_DELAY;
				ADDR30_SIG <= ADDR30_SIG_DELAY;
				ADDR31_SIG <= ADDR31_SIG_DELAY;
				INTERNAL_ACCUMULATOR <= (others => '0');
			elsif(SET = '1')then
				INTERNAL_ACCUMULATOR <= INTERNAL_ACCUMULATOR + to_integer(unsigned(ROM0_DATA))*to_integer(unsigned(DIN0)) 
				                                             + to_integer(unsigned(ROM1_DATA))*to_integer(unsigned(DIN1))
											                 + to_integer(unsigned(ROM2_DATA))*to_integer(unsigned(DIN2))
				                                             + to_integer(unsigned(ROM3_DATA))*to_integer(unsigned(DIN3))
											                 + to_integer(unsigned(ROM4_DATA))*to_integer(unsigned(DIN4))
                                                             + to_integer(unsigned(ROM5_DATA))*to_integer(unsigned(DIN5))
											                 + to_integer(unsigned(ROM6_DATA))*to_integer(unsigned(DIN6))
				                                             + to_integer(unsigned(ROM7_DATA))*to_integer(unsigned(DIN7))
											                 + to_integer(unsigned(ROM8_DATA))*to_integer(unsigned(DIN8))
											                 + to_integer(unsigned(ROM9_DATA))*to_integer(unsigned(DIN9))
											                 + to_integer(unsigned(ROM10_DATA))*to_integer(unsigned(DIN10))
				                                             + to_integer(unsigned(ROM11_DATA))*to_integer(unsigned(DIN11))
											                 + to_integer(unsigned(ROM12_DATA))*to_integer(unsigned(DIN12))
                                                             + to_integer(unsigned(ROM13_DATA))*to_integer(unsigned(DIN13))
											                 + to_integer(unsigned(ROM14_DATA))*to_integer(unsigned(DIN14))
				                                             + to_integer(unsigned(ROM15_DATA))*to_integer(unsigned(DIN15))
											                 + to_integer(unsigned(ROM16_DATA))*to_integer(unsigned(DIN16))
											                 + to_integer(unsigned(ROM17_DATA))*to_integer(unsigned(DIN17))
											                 + to_integer(unsigned(ROM18_DATA))*to_integer(unsigned(DIN18))
				                                             + to_integer(unsigned(ROM19_DATA))*to_integer(unsigned(DIN19))
											                 + to_integer(unsigned(ROM20_DATA))*to_integer(unsigned(DIN20))
                                                             + to_integer(unsigned(ROM21_DATA))*to_integer(unsigned(DIN21))
											                 + to_integer(unsigned(ROM22_DATA))*to_integer(unsigned(DIN22))
				                                             + to_integer(unsigned(ROM23_DATA))*to_integer(unsigned(DIN23))
											                 + to_integer(unsigned(ROM24_DATA))*to_integer(unsigned(DIN24))
											                 + to_integer(unsigned(ROM25_DATA))*to_integer(unsigned(DIN25))
											                 + to_integer(unsigned(ROM26_DATA))*to_integer(unsigned(DIN26))
				                                             + to_integer(unsigned(ROM27_DATA))*to_integer(unsigned(DIN27))
											                 + to_integer(unsigned(ROM28_DATA))*to_integer(unsigned(DIN28))
                                                             + to_integer(unsigned(ROM29_DATA))*to_integer(unsigned(DIN29))
											                 + to_integer(unsigned(ROM30_DATA))*to_integer(unsigned(DIN30))
				                                             + to_integer(unsigned(ROM31_DATA))*to_integer(unsigned(DIN31));
				if(ADDR31_SIG < "1000111111111")then
					ADDR0_SIG_DELAY2  <= ADDR0_SIG_DELAY2 + 32;
					ADDR1_SIG_DELAY2  <= ADDR1_SIG_DELAY2 + 32;
					ADDR2_SIG_DELAY2  <= ADDR2_SIG_DELAY2 + 32;
					ADDR3_SIG_DELAY2  <= ADDR3_SIG_DELAY2 + 32;
					ADDR4_SIG_DELAY2  <= ADDR4_SIG_DELAY2 + 32;
					ADDR5_SIG_DELAY2  <= ADDR5_SIG_DELAY2 + 32;
					ADDR6_SIG_DELAY2  <= ADDR6_SIG_DELAY2 + 32;
					ADDR7_SIG_DELAY2  <= ADDR7_SIG_DELAY2 + 32;
					ADDR8_SIG_DELAY2  <= ADDR8_SIG_DELAY2 + 32;
					ADDR9_SIG_DELAY2  <= ADDR9_SIG_DELAY2 + 32;
					ADDR10_SIG_DELAY2 <= ADDR10_SIG_DELAY2 + 32;
					ADDR11_SIG_DELAY2 <= ADDR11_SIG_DELAY2 + 32;
					ADDR12_SIG_DELAY2 <= ADDR12_SIG_DELAY2 + 32;
					ADDR13_SIG_DELAY2 <= ADDR13_SIG_DELAY2 + 32;
					ADDR14_SIG_DELAY2 <= ADDR14_SIG_DELAY2 + 32;
					ADDR15_SIG_DELAY2 <= ADDR15_SIG_DELAY2 + 32;
					ADDR16_SIG_DELAY2 <= ADDR16_SIG_DELAY2 + 32;
					ADDR17_SIG_DELAY2 <= ADDR17_SIG_DELAY2 + 32;
					ADDR18_SIG_DELAY2 <= ADDR18_SIG_DELAY2 + 32;
					ADDR19_SIG_DELAY2 <= ADDR19_SIG_DELAY2 + 32;
					ADDR20_SIG_DELAY2 <= ADDR20_SIG_DELAY2 + 32;
					ADDR21_SIG_DELAY2 <= ADDR21_SIG_DELAY2 + 32;
					ADDR22_SIG_DELAY2 <= ADDR22_SIG_DELAY2 + 32;
					ADDR23_SIG_DELAY2 <= ADDR23_SIG_DELAY2 + 32;
					ADDR24_SIG_DELAY2 <= ADDR24_SIG_DELAY2 + 32;
					ADDR25_SIG_DELAY2 <= ADDR25_SIG_DELAY2 + 32;
					ADDR26_SIG_DELAY2 <= ADDR26_SIG_DELAY2 + 32;
					ADDR27_SIG_DELAY2 <= ADDR27_SIG_DELAY2 + 32;
					ADDR28_SIG_DELAY2 <= ADDR28_SIG_DELAY2 + 32;
					ADDR29_SIG_DELAY2 <= ADDR29_SIG_DELAY2 + 32;
					ADDR30_SIG_DELAY2 <= ADDR30_SIG_DELAY2 + 32;
					ADDR31_SIG_DELAY2 <= ADDR31_SIG_DELAY2 + 32;
					ADDR0_SIG_DELAY <= ADDR0_SIG_DELAY2;
					ADDR1_SIG_DELAY <= ADDR1_SIG_DELAY2;
					ADDR2_SIG_DELAY <= ADDR2_SIG_DELAY2;
					ADDR3_SIG_DELAY <= ADDR3_SIG_DELAY2;
					ADDR4_SIG_DELAY <= ADDR4_SIG_DELAY2;
					ADDR5_SIG_DELAY <= ADDR5_SIG_DELAY2;
					ADDR6_SIG_DELAY <= ADDR6_SIG_DELAY2;
					ADDR7_SIG_DELAY <= ADDR7_SIG_DELAY2;
					ADDR8_SIG_DELAY <= ADDR8_SIG_DELAY2;
					ADDR9_SIG_DELAY <= ADDR9_SIG_DELAY2;
					ADDR10_SIG_DELAY <= ADDR10_SIG_DELAY2;
					ADDR11_SIG_DELAY <= ADDR11_SIG_DELAY2;
					ADDR12_SIG_DELAY <= ADDR12_SIG_DELAY2;
					ADDR13_SIG_DELAY <= ADDR13_SIG_DELAY2;
					ADDR14_SIG_DELAY <= ADDR14_SIG_DELAY2;
					ADDR15_SIG_DELAY <= ADDR15_SIG_DELAY2;
					ADDR16_SIG_DELAY <= ADDR16_SIG_DELAY2;
					ADDR17_SIG_DELAY <= ADDR17_SIG_DELAY2;
					ADDR18_SIG_DELAY <= ADDR18_SIG_DELAY2;
					ADDR19_SIG_DELAY <= ADDR19_SIG_DELAY2;
					ADDR20_SIG_DELAY <= ADDR20_SIG_DELAY2;
					ADDR21_SIG_DELAY <= ADDR21_SIG_DELAY2;
					ADDR22_SIG_DELAY <= ADDR22_SIG_DELAY2;
					ADDR23_SIG_DELAY <= ADDR23_SIG_DELAY2;
					ADDR24_SIG_DELAY <= ADDR24_SIG_DELAY2;
					ADDR25_SIG_DELAY <= ADDR25_SIG_DELAY2;
					ADDR26_SIG_DELAY <= ADDR26_SIG_DELAY2;
					ADDR27_SIG_DELAY <= ADDR27_SIG_DELAY2;
					ADDR28_SIG_DELAY <= ADDR28_SIG_DELAY2;
					ADDR29_SIG_DELAY <= ADDR29_SIG_DELAY2;
					ADDR30_SIG_DELAY <= ADDR30_SIG_DELAY2;
					ADDR31_SIG_DELAY <= ADDR31_SIG_DELAY2;
					ADDR0_SIG  <= ADDR0_SIG_DELAY;
					ADDR1_SIG  <= ADDR1_SIG_DELAY;
					ADDR2_SIG  <= ADDR2_SIG_DELAY;
					ADDR3_SIG  <= ADDR3_SIG_DELAY;
					ADDR4_SIG  <= ADDR4_SIG_DELAY;
					ADDR5_SIG  <= ADDR5_SIG_DELAY;
					ADDR6_SIG  <= ADDR6_SIG_DELAY;
					ADDR7_SIG  <= ADDR7_SIG_DELAY;
					ADDR8_SIG  <= ADDR8_SIG_DELAY;
					ADDR9_SIG  <= ADDR9_SIG_DELAY;
					ADDR10_SIG <= ADDR10_SIG_DELAY;
					ADDR11_SIG <= ADDR11_SIG_DELAY;
					ADDR12_SIG <= ADDR12_SIG_DELAY;
					ADDR13_SIG <= ADDR13_SIG_DELAY;
					ADDR14_SIG <= ADDR14_SIG_DELAY;
					ADDR15_SIG <= ADDR15_SIG_DELAY;
					ADDR16_SIG <= ADDR16_SIG_DELAY;
					ADDR17_SIG <= ADDR17_SIG_DELAY;
					ADDR18_SIG <= ADDR18_SIG_DELAY;
					ADDR19_SIG <= ADDR19_SIG_DELAY;
					ADDR20_SIG <= ADDR20_SIG_DELAY;
					ADDR21_SIG <= ADDR21_SIG_DELAY;
					ADDR22_SIG <= ADDR22_SIG_DELAY;
					ADDR23_SIG <= ADDR23_SIG_DELAY;
					ADDR24_SIG <= ADDR24_SIG_DELAY;
					ADDR25_SIG <= ADDR25_SIG_DELAY;
					ADDR26_SIG <= ADDR26_SIG_DELAY;
					ADDR27_SIG <= ADDR27_SIG_DELAY;
					ADDR28_SIG <= ADDR28_SIG_DELAY;
					ADDR29_SIG <= ADDR29_SIG_DELAY;
					ADDR30_SIG <= ADDR30_SIG_DELAY;
					ADDR31_SIG <= ADDR31_SIG_DELAY;
				else
					ADDR0_SIG_DELAY2  <= "0000000000000";
					ADDR1_SIG_DELAY2  <= "0000000000001";
					ADDR2_SIG_DELAY2  <= "0000000000010";
					ADDR3_SIG_DELAY2  <= "0000000000011";
					ADDR4_SIG_DELAY2  <= "0000000000100";
					ADDR5_SIG_DELAY2  <= "0000000000101";
					ADDR6_SIG_DELAY2  <= "0000000000110";
					ADDR7_SIG_DELAY2  <= "0000000000111";
					ADDR8_SIG_DELAY2  <= "0000000001000";
					ADDR9_SIG_DELAY2  <= "0000000001001";
					ADDR10_SIG_DELAY2 <= "0000000001010";
					ADDR11_SIG_DELAY2 <= "0000000001011";
					ADDR12_SIG_DELAY2 <= "0000000001100";
					ADDR13_SIG_DELAY2 <= "0000000001101";
					ADDR14_SIG_DELAY2 <= "0000000001110";
					ADDR15_SIG_DELAY2 <= "0000000001111";
					ADDR16_SIG_DELAY2 <= "0000000010000";
					ADDR17_SIG_DELAY2 <= "0000000010001";
					ADDR18_SIG_DELAY2 <= "0000000010010";
					ADDR19_SIG_DELAY2 <= "0000000010011";
					ADDR20_SIG_DELAY2 <= "0000000010100";
					ADDR21_SIG_DELAY2 <= "0000000010101";
					ADDR22_SIG_DELAY2 <= "0000000010110";
					ADDR23_SIG_DELAY2 <= "0000000010111";
					ADDR24_SIG_DELAY2 <= "0000000011000";
					ADDR25_SIG_DELAY2 <= "0000000011001";
					ADDR26_SIG_DELAY2 <= "0000000011010";
					ADDR27_SIG_DELAY2 <= "0000000011011";
					ADDR28_SIG_DELAY2 <= "0000000011100";
					ADDR29_SIG_DELAY2 <= "0000000011101";
					ADDR30_SIG_DELAY2 <= "0000000011110";
					ADDR31_SIG_DELAY2 <= "0000000011111";
					ADDR0_SIG_DELAY  <= ADDR0_SIG_DELAY2;
					ADDR1_SIG_DELAY  <= ADDR1_SIG_DELAY2;
					ADDR2_SIG_DELAY  <= ADDR2_SIG_DELAY2;
					ADDR3_SIG_DELAY  <= ADDR3_SIG_DELAY2;
					ADDR4_SIG_DELAY  <= ADDR4_SIG_DELAY2;
					ADDR5_SIG_DELAY  <= ADDR5_SIG_DELAY2;
					ADDR6_SIG_DELAY  <= ADDR6_SIG_DELAY2;
					ADDR7_SIG_DELAY  <= ADDR7_SIG_DELAY2;
					ADDR8_SIG_DELAY  <= ADDR8_SIG_DELAY2;
					ADDR9_SIG_DELAY  <= ADDR9_SIG_DELAY2;
					ADDR10_SIG_DELAY <= ADDR10_SIG_DELAY2;
					ADDR11_SIG_DELAY <= ADDR11_SIG_DELAY2;
					ADDR12_SIG_DELAY <= ADDR12_SIG_DELAY2;
					ADDR13_SIG_DELAY <= ADDR13_SIG_DELAY2;
					ADDR14_SIG_DELAY <= ADDR14_SIG_DELAY2;
					ADDR15_SIG_DELAY <= ADDR15_SIG_DELAY2;
					ADDR16_SIG_DELAY <= ADDR16_SIG_DELAY2;
					ADDR17_SIG_DELAY <= ADDR17_SIG_DELAY2;
					ADDR18_SIG_DELAY <= ADDR18_SIG_DELAY2;
					ADDR19_SIG_DELAY <= ADDR19_SIG_DELAY2;
					ADDR20_SIG_DELAY <= ADDR20_SIG_DELAY2;
					ADDR21_SIG_DELAY <= ADDR21_SIG_DELAY2;
					ADDR22_SIG_DELAY <= ADDR22_SIG_DELAY2;
					ADDR23_SIG_DELAY <= ADDR23_SIG_DELAY2;
					ADDR24_SIG_DELAY <= ADDR24_SIG_DELAY2;
					ADDR25_SIG_DELAY <= ADDR25_SIG_DELAY2;
					ADDR26_SIG_DELAY <= ADDR26_SIG_DELAY2;
					ADDR27_SIG_DELAY <= ADDR27_SIG_DELAY2;
					ADDR28_SIG_DELAY <= ADDR28_SIG_DELAY2;
					ADDR29_SIG_DELAY <= ADDR29_SIG_DELAY2;
					ADDR30_SIG_DELAY <= ADDR30_SIG_DELAY2;
					ADDR31_SIG_DELAY <= ADDR31_SIG_DELAY2;
					ADDR0_SIG  <= ADDR0_SIG_DELAY;
					ADDR1_SIG  <= ADDR1_SIG_DELAY;
					ADDR2_SIG  <= ADDR2_SIG_DELAY;
					ADDR3_SIG  <= ADDR3_SIG_DELAY;
					ADDR4_SIG  <= ADDR4_SIG_DELAY;
					ADDR5_SIG  <= ADDR5_SIG_DELAY;
					ADDR6_SIG  <= ADDR6_SIG_DELAY;
					ADDR7_SIG  <= ADDR7_SIG_DELAY;
					ADDR8_SIG  <= ADDR8_SIG_DELAY;
					ADDR9_SIG  <= ADDR9_SIG_DELAY;
					ADDR10_SIG <= ADDR10_SIG_DELAY;
					ADDR11_SIG <= ADDR11_SIG_DELAY;
					ADDR12_SIG <= ADDR12_SIG_DELAY;
					ADDR13_SIG <= ADDR13_SIG_DELAY;
					ADDR14_SIG <= ADDR14_SIG_DELAY;
					ADDR15_SIG <= ADDR15_SIG_DELAY;
					ADDR16_SIG <= ADDR16_SIG_DELAY;
					ADDR17_SIG <= ADDR17_SIG_DELAY;
					ADDR18_SIG <= ADDR18_SIG_DELAY;
					ADDR19_SIG <= ADDR19_SIG_DELAY;
					ADDR20_SIG <= ADDR20_SIG_DELAY;
					ADDR21_SIG <= ADDR21_SIG_DELAY;
					ADDR22_SIG <= ADDR22_SIG_DELAY;
					ADDR23_SIG <= ADDR23_SIG_DELAY;
					ADDR24_SIG <= ADDR24_SIG_DELAY;
					ADDR25_SIG <= ADDR25_SIG_DELAY;
					ADDR26_SIG <= ADDR26_SIG_DELAY;
					ADDR27_SIG <= ADDR27_SIG_DELAY;
					ADDR28_SIG <= ADDR28_SIG_DELAY;
					ADDR29_SIG <= ADDR29_SIG_DELAY;
					ADDR30_SIG <= ADDR30_SIG_DELAY;
					ADDR31_SIG <= ADDR31_SIG_DELAY;
					INTERNAL_ACCUMULATOR <= (others => '0');
				end if;
			else
				ADDR0_SIG_DELAY2  <= "0000000000000";
				ADDR1_SIG_DELAY2  <= "0000000000001";
				ADDR2_SIG_DELAY2  <= "0000000000010";
				ADDR3_SIG_DELAY2  <= "0000000000011";
				ADDR4_SIG_DELAY2  <= "0000000000100";
				ADDR5_SIG_DELAY2  <= "0000000000101";
				ADDR6_SIG_DELAY2  <= "0000000000110";
				ADDR7_SIG_DELAY2  <= "0000000000111";
				ADDR8_SIG_DELAY2  <= "0000000001000";
				ADDR9_SIG_DELAY2  <= "0000000001001";
				ADDR10_SIG_DELAY2 <= "0000000001010";
				ADDR11_SIG_DELAY2 <= "0000000001011";
				ADDR12_SIG_DELAY2 <= "0000000001100";
				ADDR13_SIG_DELAY2 <= "0000000001101";
				ADDR14_SIG_DELAY2 <= "0000000001110";
				ADDR15_SIG_DELAY2 <= "0000000001111";
				ADDR16_SIG_DELAY2 <= "0000000010000";
				ADDR17_SIG_DELAY2 <= "0000000010001";
				ADDR18_SIG_DELAY2 <= "0000000010010";
				ADDR19_SIG_DELAY2 <= "0000000010011";
				ADDR20_SIG_DELAY2 <= "0000000010100";
				ADDR21_SIG_DELAY2 <= "0000000010101";
				ADDR22_SIG_DELAY2 <= "0000000010110";
				ADDR23_SIG_DELAY2 <= "0000000010111";
				ADDR24_SIG_DELAY2 <= "0000000011000";
				ADDR25_SIG_DELAY2 <= "0000000011001";
				ADDR26_SIG_DELAY2 <= "0000000011010";
				ADDR27_SIG_DELAY2 <= "0000000011011";
				ADDR28_SIG_DELAY2 <= "0000000011100";
				ADDR29_SIG_DELAY2 <= "0000000011101";
				ADDR30_SIG_DELAY2 <= "0000000011110";
				ADDR31_SIG_DELAY2 <= "0000000011111";
				ADDR0_SIG_DELAY  <= ADDR0_SIG_DELAY2;
				ADDR1_SIG_DELAY  <= ADDR1_SIG_DELAY2;
				ADDR2_SIG_DELAY  <= ADDR2_SIG_DELAY2;
				ADDR3_SIG_DELAY  <= ADDR3_SIG_DELAY2;
				ADDR4_SIG_DELAY  <= ADDR4_SIG_DELAY2;
				ADDR5_SIG_DELAY  <= ADDR5_SIG_DELAY2;
				ADDR6_SIG_DELAY  <= ADDR6_SIG_DELAY2;
				ADDR7_SIG_DELAY  <= ADDR7_SIG_DELAY2;
				ADDR8_SIG_DELAY  <= ADDR8_SIG_DELAY2;
				ADDR9_SIG_DELAY  <= ADDR9_SIG_DELAY2;
				ADDR10_SIG_DELAY <= ADDR10_SIG_DELAY2;
				ADDR11_SIG_DELAY <= ADDR11_SIG_DELAY2;
				ADDR12_SIG_DELAY <= ADDR12_SIG_DELAY2;
				ADDR13_SIG_DELAY <= ADDR13_SIG_DELAY2;
				ADDR14_SIG_DELAY <= ADDR14_SIG_DELAY2;
				ADDR15_SIG_DELAY <= ADDR15_SIG_DELAY2;
				ADDR16_SIG_DELAY <= ADDR16_SIG_DELAY2;
				ADDR17_SIG_DELAY <= ADDR17_SIG_DELAY2;
				ADDR18_SIG_DELAY <= ADDR18_SIG_DELAY2;
				ADDR19_SIG_DELAY <= ADDR19_SIG_DELAY2;
				ADDR20_SIG_DELAY <= ADDR20_SIG_DELAY2;
				ADDR21_SIG_DELAY <= ADDR21_SIG_DELAY2;
				ADDR22_SIG_DELAY <= ADDR22_SIG_DELAY2;
				ADDR23_SIG_DELAY <= ADDR23_SIG_DELAY2;
				ADDR24_SIG_DELAY <= ADDR24_SIG_DELAY2;
				ADDR25_SIG_DELAY <= ADDR25_SIG_DELAY2;
				ADDR26_SIG_DELAY <= ADDR26_SIG_DELAY2;
				ADDR27_SIG_DELAY <= ADDR27_SIG_DELAY2;
				ADDR28_SIG_DELAY <= ADDR28_SIG_DELAY2;
				ADDR29_SIG_DELAY <= ADDR29_SIG_DELAY2;
				ADDR30_SIG_DELAY <= ADDR30_SIG_DELAY2;
				ADDR31_SIG_DELAY <= ADDR31_SIG_DELAY2;
				ADDR0_SIG  <= ADDR0_SIG_DELAY;
				ADDR1_SIG  <= ADDR1_SIG_DELAY;
				ADDR2_SIG  <= ADDR2_SIG_DELAY;
				ADDR3_SIG  <= ADDR3_SIG_DELAY;
				ADDR4_SIG  <= ADDR4_SIG_DELAY;
				ADDR5_SIG  <= ADDR5_SIG_DELAY;
				ADDR6_SIG  <= ADDR6_SIG_DELAY;
				ADDR7_SIG  <= ADDR7_SIG_DELAY;
				ADDR8_SIG  <= ADDR8_SIG_DELAY;
				ADDR9_SIG  <= ADDR9_SIG_DELAY;
				ADDR10_SIG <= ADDR10_SIG_DELAY;
				ADDR11_SIG <= ADDR11_SIG_DELAY;
				ADDR12_SIG <= ADDR12_SIG_DELAY;
				ADDR13_SIG <= ADDR13_SIG_DELAY;
				ADDR14_SIG <= ADDR14_SIG_DELAY;
				ADDR15_SIG <= ADDR15_SIG_DELAY;
				ADDR16_SIG <= ADDR16_SIG_DELAY;
				ADDR17_SIG <= ADDR17_SIG_DELAY;
				ADDR18_SIG <= ADDR18_SIG_DELAY;
				ADDR19_SIG <= ADDR19_SIG_DELAY;
				ADDR20_SIG <= ADDR20_SIG_DELAY;
				ADDR21_SIG <= ADDR21_SIG_DELAY;
				ADDR22_SIG <= ADDR22_SIG_DELAY;
				ADDR23_SIG <= ADDR23_SIG_DELAY;
				ADDR24_SIG <= ADDR24_SIG_DELAY;
				ADDR25_SIG <= ADDR25_SIG_DELAY;
				ADDR26_SIG <= ADDR26_SIG_DELAY;
				ADDR27_SIG <= ADDR27_SIG_DELAY;
				ADDR28_SIG <= ADDR28_SIG_DELAY;
				ADDR29_SIG <= ADDR29_SIG_DELAY;
				ADDR30_SIG <= ADDR30_SIG_DELAY;
				ADDR31_SIG <= ADDR31_SIG_DELAY;
			end if;
		end if;
	end process;

	ADDR0  <= std_logic_vector(ADDR0_SIG);
	ADDR1  <= std_logic_vector(ADDR1_SIG);
	ADDR2  <= std_logic_vector(ADDR2_SIG);
	ADDR3  <= std_logic_vector(ADDR3_SIG);
	ADDR4  <= std_logic_vector(ADDR4_SIG);
	ADDR5  <= std_logic_vector(ADDR5_SIG);
	ADDR6  <= std_logic_vector(ADDR6_SIG);
	ADDR7  <= std_logic_vector(ADDR7_SIG);
	ADDR8  <= std_logic_vector(ADDR8_SIG);
	ADDR9  <= std_logic_vector(ADDR9_SIG);
	ADDR10 <= std_logic_vector(ADDR10_SIG);
	ADDR11 <= std_logic_vector(ADDR11_SIG);
	ADDR12 <= std_logic_vector(ADDR12_SIG);
	ADDR13 <= std_logic_vector(ADDR13_SIG);
	ADDR14 <= std_logic_vector(ADDR14_SIG);
	ADDR15 <= std_logic_vector(ADDR15_SIG);
	ADDR16 <= std_logic_vector(ADDR16_SIG);
	ADDR17 <= std_logic_vector(ADDR17_SIG);
	ADDR18 <= std_logic_vector(ADDR18_SIG);
	ADDR19 <= std_logic_vector(ADDR19_SIG);
	ADDR20 <= std_logic_vector(ADDR20_SIG);
	ADDR21 <= std_logic_vector(ADDR21_SIG);
	ADDR22 <= std_logic_vector(ADDR22_SIG);
	ADDR23 <= std_logic_vector(ADDR23_SIG);
	ADDR24 <= std_logic_vector(ADDR24_SIG);
	ADDR25 <= std_logic_vector(ADDR25_SIG);
	ADDR26 <= std_logic_vector(ADDR26_SIG);
	ADDR27 <= std_logic_vector(ADDR27_SIG);
	ADDR28 <= std_logic_vector(ADDR28_SIG);
	ADDR29 <= std_logic_vector(ADDR29_SIG);
	ADDR30 <= std_logic_vector(ADDR30_SIG);
	ADDR31 <= std_logic_vector(ADDR31_SIG);

	DOUT <= std_logic_vector(INTERNAL_ACCUMULATOR);

end Behavioral;
