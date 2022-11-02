library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BIAS_ROM_FC is
Generic ( WIDTH : positive := 64;
          POWER : positive := 5); 
Port ( 
    ADDR0  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR1  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR2  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR3  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR4  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR5  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR6  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR7  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR8  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR9  :    in  std_logic_vector(POWER-1 downto 0);
    ADDR10 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR11 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR12 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR13 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR14 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR15 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR16 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR17 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR18 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR19 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR20 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR21 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR22 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR23 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR24 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR25 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR26 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR27 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR28 :    in  std_logic_vector(POWER-1 downto 0);
    ADDR29 :    in  std_logic_vector(POWER-1 downto 0);
    DATA0  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA1  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA2  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA3  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA4  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA5  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA6  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA7  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA8  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA9  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA10 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA11 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA12 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA13 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA14 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA15 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA16 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA17 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA18 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA19 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA20 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA21 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA22 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA23 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA24 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA25 :    out std_logic_vector(WIDTh-1 downto 0);
    DATA26 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA27 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA28 :    out std_logic_vector(WIDTH-1 downto 0);
    DATA29 :    out std_logic_vector(WIDTH-1 downto 0)
);
end BIAS_ROM_FC;

architecture Behavioral of BIAS_ROM_FC is
    type ROM_array is array (0 to 29) of std_logic_vector(WIDTH-1 downto 0);
    constant ROM : ROM_array := (
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001",
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001",
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001",
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001",
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001",
        x"0000000000000001",  x"0000000000000001",  x"0000000000000001",  x"0000000000000001", x"0000000000000001"
        );

begin
        DATA0  <= ROM(to_integer(unsigned(ADDR0)));
        DATA1  <= ROM(to_integer(unsigned(ADDR1)));
        DATA2  <= ROM(to_integer(unsigned(ADDR2)));
        DATA3  <= ROM(to_integer(unsigned(ADDR3)));
        DATA4  <= ROM(to_integer(unsigned(ADDR4)));
        DATA5  <= ROM(to_integer(unsigned(ADDR5)));
        DATA6  <= ROM(to_integer(unsigned(ADDR6)));
        DATA7  <= ROM(to_integer(unsigned(ADDR7)));
        DATA8  <= ROM(to_integer(unsigned(ADDR8)));
        DATA9  <= ROM(to_integer(unsigned(ADDR9)));
        DATA10 <= ROM(to_integer(unsigned(ADDR10)));
        DATA11 <= ROM(to_integer(unsigned(ADDR11)));
        DATA12 <= ROM(to_integer(unsigned(ADDR12)));
        DATA13 <= ROM(to_integer(unsigned(ADDR13)));
        DATA14 <= ROM(to_integer(unsigned(ADDR14)));
        DATA15 <= ROM(to_integer(unsigned(ADDR15)));
        DATA16 <= ROM(to_integer(unsigned(ADDR16)));
        DATA17 <= ROM(to_integer(unsigned(ADDR17)));
        DATA18 <= ROM(to_integer(unsigned(ADDR18)));
        DATA19 <= ROM(to_integer(unsigned(ADDR19)));
        DATA20 <= ROM(to_integer(unsigned(ADDR20)));
        DATA21 <= ROM(to_integer(unsigned(ADDR21)));
        DATA22 <= ROM(to_integer(unsigned(ADDR22)));
        DATA23 <= ROM(to_integer(unsigned(ADDR23)));
        DATA24 <= ROM(to_integer(unsigned(ADDR24)));
        DATA25 <= ROM(to_integer(unsigned(ADDR25)));
        DATA26 <= ROM(to_integer(unsigned(ADDR26)));
        DATA27 <= ROM(to_integer(unsigned(ADDR27)));
        DATA28 <= ROM(to_integer(unsigned(ADDR28)));
        DATA29 <= ROM(to_integer(unsigned(ADDR29)));
end Behavioral;
