library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity OUTPUT_VECTOR_MULTIPLIER is
Generic(WIDTH : positive := 32;
        POWER : positive := 5);
Port (
    CLK         :  in  std_logic;
    RESET       :  in  std_logic;
    SET         :  in  std_logic;
    DIN0        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN1        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN2        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN3        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN4        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN5        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN6        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN7        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN8        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN9        :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN10       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN11       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN12       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN13       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN14       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN15       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN16       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN17       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN18       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN19       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN20       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN21       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN22       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN23       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN24       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN25       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN26       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN27       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN28       :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN29       :  in  std_logic_vector(WIDTH-1 downto 0);
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
    ADDR0       :  out std_logic_vector(POWER-1 downto 0);
    ADDR1       :  out std_logic_vector(POWER-1 downto 0);
    ADDR2       :  out std_logic_vector(POWER-1 downto 0);
    ADDR3       :  out std_logic_vector(POWER-1 downto 0);
    ADDR4       :  out std_logic_vector(POWER-1 downto 0);
    ADDR5       :  out std_logic_vector(POWER-1 downto 0);
    ADDR6       :  out std_logic_vector(POWER-1 downto 0);
    ADDR7       :  out std_logic_vector(POWER-1 downto 0);
    ADDR8       :  out std_logic_vector(POWER-1 downto 0);
    ADDR9       :  out std_logic_vector(POWER-1 downto 0);
    ADDR10      :  out std_logic_vector(POWER-1 downto 0);
    ADDR11      :  out std_logic_vector(POWER-1 downto 0);
    ADDR12      :  out std_logic_vector(POWER-1 downto 0);
    ADDR13      :  out std_logic_vector(POWER-1 downto 0);
    ADDR14      :  out std_logic_vector(POWER-1 downto 0);
    ADDR15      :  out std_logic_vector(POWER-1 downto 0);
    ADDR16      :  out std_logic_vector(POWER-1 downto 0);
    ADDR17      :  out std_logic_vector(POWER-1 downto 0);
    ADDR18      :  out std_logic_vector(POWER-1 downto 0);
    ADDR19      :  out std_logic_vector(POWER-1 downto 0);
    ADDR20      :  out std_logic_vector(POWER-1 downto 0);
    ADDR21      :  out std_logic_vector(POWER-1 downto 0);
    ADDR22      :  out std_logic_vector(POWER-1 downto 0);
    ADDR23      :  out std_logic_vector(POWER-1 downto 0);
    ADDR24      :  out std_logic_vector(POWER-1 downto 0);
    ADDR25      :  out std_logic_vector(POWER-1 downto 0);
    ADDR26      :  out std_logic_vector(POWER-1 downto 0);
    ADDR27      :  out std_logic_vector(POWER-1 downto 0);
    ADDR28      :  out std_logic_vector(POWER-1 downto 0);
    ADDR29      :  out std_logic_vector(POWER-1 downto 0);
    DOUT        :  out std_logic_vector(WIDTH+WIDTH-1 downto 0)
);
end OUTPUT_VECTOR_MULTIPLIER;

architecture Behavioral of OUTPUT_VECTOR_MULTIPLIER is

signal ADDR0_SIG  : std_logic_vector(POWER-1 downto 0) := "00000";
signal ADDR1_SIG  : std_logic_vector(POWER-1 downto 0) := "00001";
signal ADDR2_SIG  : std_logic_vector(POWER-1 downto 0) := "00010";
signal ADDR3_SIG  : std_logic_vector(POWER-1 downto 0) := "00011";
signal ADDR4_SIG  : std_logic_vector(POWER-1 downto 0) := "00100";
signal ADDR5_SIG  : std_logic_vector(POWER-1 downto 0) := "00101";
signal ADDR6_SIG  : std_logic_vector(POWER-1 downto 0) := "00110";
signal ADDR7_SIG  : std_logic_vector(POWER-1 downto 0) := "00111";
signal ADDR8_SIG  : std_logic_vector(POWER-1 downto 0) := "01000";
signal ADDR9_SIG  : std_logic_vector(POWER-1 downto 0) := "01001";
signal ADDR10_SIG : std_logic_vector(POWER-1 downto 0) := "01010";
signal ADDR11_SIG : std_logic_vector(POWER-1 downto 0) := "01011";
signal ADDR12_SIG : std_logic_vector(POWER-1 downto 0) := "01100";
signal ADDR13_SIG : std_logic_vector(POWER-1 downto 0) := "01101";
signal ADDR14_SIG : std_logic_vector(POWER-1 downto 0) := "01110";
signal ADDR15_SIG : std_logic_vector(POWER-1 downto 0) := "01111";
signal ADDR16_SIG : std_logic_vector(POWER-1 downto 0) := "10000";
signal ADDR17_SIG : std_logic_vector(POWER-1 downto 0) := "10001";
signal ADDR18_SIG : std_logic_vector(POWER-1 downto 0) := "10010";
signal ADDR19_SIG : std_logic_vector(POWER-1 downto 0) := "10011";
signal ADDR20_SIG : std_logic_vector(POWER-1 downto 0) := "10100";
signal ADDR21_SIG : std_logic_vector(POWER-1 downto 0) := "10101";
signal ADDR22_SIG : std_logic_vector(POWER-1 downto 0) := "10110";
signal ADDR23_SIG : std_logic_vector(POWER-1 downto 0) := "10111";
signal ADDR24_SIG : std_logic_vector(POWER-1 downto 0) := "11000";
signal ADDR25_SIG : std_logic_vector(POWER-1 downto 0) := "11001";
signal ADDR26_SIG : std_logic_vector(POWER-1 downto 0) := "11010";
signal ADDR27_SIG : std_logic_vector(POWER-1 downto 0) := "11011";
signal ADDR28_SIG : std_logic_vector(POWER-1 downto 0) := "11100";
signal ADDR29_SIG : std_logic_vector(POWER-1 downto 0) := "11101";

signal INTERNAL_RESULT : unsigned(WIDTH+WIDTH-1 downto 0) := (others => '0');

begin

    MAC_PROCESS: process(CLK)
    begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
                INTERNAL_RESULT <= (others => '0');
            elsif(SET = '1')then
                INTERNAL_RESULT <=  INTERNAL_RESULT + to_integer(unsigned(ROM0_DATA))*to_integer(unsigned(DIN0)) 
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
                                        + to_integer(unsigned(ROM29_DATA))*to_integer(unsigned(DIN29));
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

    DOUT <= std_logic_vector(INTERNAL_RESULT);

end Behavioral;
