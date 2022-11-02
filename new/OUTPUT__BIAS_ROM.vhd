library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OUTPUT_BIAS_ROM is
Generic ( WIDTH : positive := 64;
          POWER : positive := 4); 
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
    DATA0  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA1  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA2  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA3  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA4  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA5  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA6  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA7  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA8  :    out std_logic_vector(WIDTH-1 downto 0);
    DATA9  :    out std_logic_vector(WIDTH-1 downto 0)
);
end OUTPUT_BIAS_ROM;

architecture Behavioral of OUTPUT_BIAS_ROM is
    type ROM_array is array (0 to 9) of std_logic_vector(WIDTH-1 downto 0);
    constant ROM : ROM_array := (
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
end Behavioral;
